using System;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Hosting;

namespace Petrotech
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;

        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;

            //setup database credentials
            string key = File.ReadAllText(System.AppContext.BaseDirectory + "/dp.enc");
            string data = decrypt(key, "E-11m3kg-1s-2");
            string serverName = data.Substring(0, data.IndexOf('?'));
            string dbUser = data.Substring(data.IndexOf('?') + 1,  data.IndexOf(':') - data.IndexOf('?')-1);
            string dbPassword = data.Substring(data.IndexOf(':') + 1);
             _logger.LogInformation("data: " + serverName + ", " + dbUser + ", "+ dbPassword);

            //build the database
            this.database = new Database("master", serverName, dbUser, dbPassword, _logger);
            this.database.CreateDatabase();
            
            //intial database object depends on the configurations
            this.database = new Database(Database.DB_NAME, serverName, dbUser, dbPassword, _logger);

            //read settings
            this.setting = this.database.ReadSettings();
            _logger.LogInformation(this.setting.SensorName + this.setting.IpAddress + this.setting.SensorReadInterval);

            //setting read to write ratio
            this.writeToReadConter=0;
            this.writeToReadRatio=(int)(setting.SensorWriteInterval/setting.SensorReadInterval);

            //build export time by schedule hour
            this.exportTimespan=new TimeSpan(setting.ScheduleHour, 0, 0);

            //variable indecates if exporting was faild (to retry)
            this.exportError=false;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);

                //create restful-api
                if(!this.serverRunning)
                {
                    this.serverRunning=true;
                    createRestServer();   
                }

                writeToReadConter++;
                if(writeToReadConter==writeToReadRatio)
                {
                    //fetch values of sensors from ethernet
                    SensorValue[] sensors = Collector.FetchSensors(setting.IpAddress);
                    //values fetch is successfully
                    if(sensors!=null)
                    //loop throug sensors
                        for(int i=0; i<sensors.Length; i++)
                            if(sensors[i]!=null)
                            {
                                //save values into database
                                database.AddMeasurement(setting.SensorName, sensors[i]);
                            }
                    writeToReadConter=0;
                }

                //fetch alarms
                Alarm[] alarms = Collector.FetchAlarm(setting.IpAddress);
                //clear old alarms
                database.ClearAlarms();
                if(alarms!=null)
                    for(int i=0; i<alarms.Length; i++)
                        if(alarms[i]!=null)
                            //save each alarm into database
                            database.AddAlarm(setting.SensorName, alarms[i]);

                //exporting process
                //check if there is no error, and the time of export is in the paste and not in direct running process
                //if there are error, the process will run again and write error log
                if(exportError || ((DateTime.Now.TimeOfDay.Subtract(exportTimespan).TotalMilliseconds>0) && (DateTime.Now.TimeOfDay.Subtract(exportTimespan).TotalMilliseconds<=setting.SensorReadInterval)))
                {
                    //read delivery reports for this day
                    Delivery[] deliveries = Collector.FetchDeliveries(setting.IpAddress, true);

                    //if the reports is empty (connection error or connection timeout) 
                    //means there are error and the process will retry in next timer process
                    exportError=deliveries==null;
                    if(!exportError)
                    {
                        for(int i=0; i<deliveries.Length; i++)
                            //add delivery reports into database
                            database.AddDelivery(setting.SensorName, deliveries[i]);

                        //clear the error
                        exportError=false;
                        Logger.Warn("Exporting..");
                    }
                    else
                        Logger.Warn("Export failed, retrying in a while.");
                }   

                await Task.Delay(this.setting.SensorReadInterval, stoppingToken);
            }
        }

        string decrypt(string cipher, string salt)
        {
            byte[] cipherBytes = Convert.FromBase64String(cipher);
            byte[] saltBytes = Encoding.UTF8.GetBytes(salt);
            byte[] passwordBytes = ProtectedData.Unprotect(cipherBytes, null, DataProtectionScope.LocalMachine);
            return Encoding.UTF8.GetString(passwordBytes);
        } 
        
        async Task createRestServer() 
        {
            await Task.Run(()=>
            {
                var host = new WebHostBuilder()
                    .UseKestrel()
                    .UseUrls("http://*:5000")
                    .UseStartup<Startup>()
                    .Build();

                host.Run();
            });
        }

        private void Menu_FetchEvents(object sender, System.EventArgs e)
        {
            //fetch events from ethernet
            Event[] events = Collector.FetchEvents(setting.IpAddress);

            //truncate events table to save only current alarm
            database.ClearEvents();

            //loop is for adding events to database
            if(events!=null)
                for(int i=0; i<events.Length; i++)
                    database.AddEvent(setting.SensorName, events[i]);
        }

        //event handler of clicking fetch delivery from notification's menu icon
        private void Menu_FetchDelivery(object sender, System.EventArgs e)
        {
            //fetch delivery reports from ethernet
            Delivery[] deliveries = Collector.FetchDeliveries(setting.IpAddress, false);

            //truncate delivery history table
            database.ClearDeliveryHistory();

            //loop is for adding deliveries into database
            if(deliveries!=null)
                for(int i=0; i<deliveries.Length; i++)
                    database.AddDeliveryHistory(setting.SensorName, deliveries[i]);
        }

        //event handler of clicking fetch alarm history from notification's menu icon
        private void Menu_FetchHistory(object sender, System.EventArgs e)
        {
            //fetch alarm history from ethernet
            Alarm[] alarms = Collector.FetchAlarmHistory(setting.IpAddress);

            //truncate alarm history table in database
            database.ClearAlarmHistory();

            //loop is for adding each alarm into database
            if(alarms!=null)
                for(int i=0; i<alarms.Length; i++)
                    database.AddHistory(setting.SensorName, alarms[i]);
        }

        private void Menu_FetchConfigs(object sender, System.EventArgs e)
        {
            //fetch configurations from ethernet
            Config[] configs = Collector.FetchConfigs(setting.IpAddress);

            //truncate configurations table
            database.ClearConfigs();

            //loop is for adding configs to database
            if(configs!=null)
                database.AddConfigs(setting.SensorName, configs);
        }

        private Database database;
        private Setting setting;
        private TimeSpan exportTimespan;
        private bool exportError;

        private int writeToReadRatio;
        private int writeToReadConter;

        private bool serverRunning;
    }
}

