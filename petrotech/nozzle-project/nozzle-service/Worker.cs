using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.IO;
using System.IO.Ports;
using System.Timers;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Hosting;


using System.Net.Http;
using Microsoft.AspNetCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Builder;

namespace Petrotech
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;

        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;
            
            _logger.LogInformation("enviroment: " + Environment.GetEnvironmentVariable("DOTNET_ENVIRONMENT"));
            //serial port defintions
            serialPort = new SerialPort();
            serialPort.BaudRate = 9600;
            serialPort.Parity = Parity.None;
            serialPort.StopBits = StopBits.One;
            serialPort.DataBits = 8;
            serialPort.DataReceived += new SerialDataReceivedEventHandler(serialPortReceived);
            serialConnected = serialTotalReady = false;

            //setup database credentials
            string key = File.ReadAllText(System.AppContext.BaseDirectory + "/dp.enc");
            /*string data = decrypt(key, "E-11m3kg-1s-2");
            string server = data.Substring(0, data.IndexOf('?'));
            string user = data.Substring(data.IndexOf('?') + 1,  data.IndexOf(':') - data.IndexOf('?')-1);
            string password = data.Substring(data.IndexOf(':') + 1);*/
            //_logger.LogInformation("data: " + server + ", " + user + ", "+ password);

            //create database if not exists 
            //database = new Database("master", server ,user, password);
            //database.CreateDatabase();

            //connect to database
            //database = new Database("Nozzles", server, user, password);

            //query connected nozzles on serial ports
            /*nozzleAddresses = new List<byte>(1);
            _logger.LogInformation("Searching for connected nozzles...");

            foreach (string portName
             in SerialPort.GetPortNames())
            {
                this.currentPortName = portName;
                serialPort.PortName = portName;
                byte addressNumber = 0x31;
                Packet discoverPacket = new Packet(new byte[] { 0x30, addressNumber }, new byte[] { 0x30, 0x32 }, new byte[0]);
                try
                {
                    serialPort.Open();
                    //testing connected address by status signal
                    while (addressNumber < 0x39)
                    {
                        serialPort.Write(discoverPacket.getBytes(), 0, 8);
                        System.Threading.Thread.Sleep(MINIMUM_INTERVAL);
                        addressNumber++;
                        discoverPacket.Address = new byte[] { 0x30, addressNumber };
                    }
                    serialPort.Close();
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex.Message);
                    Environment.Exit(1);
                }
            }

            statusPacket = new Packet(new byte[] { 0x30, 0x31 }, new byte[] { 0x30, 0x34 }, new byte[0]);
            authPacket = new Packet(new byte[] { 0x30, 0x31 }, new byte[] { 0x30, 0x31 }, new byte[] { 0x31 });
            unauthPacket = new Packet(new byte[] { 0x30, 0x31 }, new byte[] { 0x30, 0x31 }, new byte[] { 0x30 });
            saleMoneyVolumePacket = new Packet(new byte[] { 0x30, 0x31 }, new byte[] { 0x30, 0x35 }, new byte[0]);
            totalMoneyVolumePacket = new Packet(new byte[] { 0x30, 0x31 }, new byte[] { 0x30, 0x37 }, new byte[0]);

            serverRunning=false;

            if (this.portName != "")
            {
                serialPort.PortName = this.portName;
                serialPort.Open();
                _logger.LogInformation("Ready.. Listening to the port.");
            }
            else
                _logger.LogWarning("No nozzle connected to the serial port has been detected.");
                */
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                //_logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);

                 //create restful-api
                if(!this.serverRunning)
                {
                    this.serverRunning=true;
                    createRestServer();   
                }

                /*for (int i = 0; i < nozzleAddresses.Count; i++)
                {
                    statusPacket.Address[1] = nozzleAddresses[i];
                    byte[] statusBytes = statusPacket.getBytes();
                    serialPort.Write(statusBytes, 0, statusBytes.Length);
                    await Task.Delay(MINIMUM_INTERVAL);

                    if (this.serialConnected)
                    {
                        saleMoneyVolumePacket.Address[1] = nozzleAddresses[i];
                        byte[] saleMoneyVolumeBytes = saleMoneyVolumePacket.getBytes();
                        serialPort.Write(saleMoneyVolumeBytes, 0, saleMoneyVolumeBytes.Length);
                        await Task.Delay(MINIMUM_INTERVAL);
                    }
                }*/
                await Task.Delay(300, stoppingToken);
            }
        }

        async void serialPortReceived(object sender, SerialDataReceivedEventArgs e)
        {
            byte[] buffer = new byte[100];
            int count;
            try
            {
                count = serialPort.Read(buffer, 0, buffer.Length);
            }
            catch(Exception ex)
            {
                _logger.LogError("Error while reading from serial port, "+ex.Message);
                return;
            }

            byte[] data = new byte[count];
            Array.Copy(buffer, 0, data, 0, count);
            Packet packet = new Packet(data);
            if (packet.CommandAsString == "02")
            {
                _logger.LogInformation("Nozzle: {0} Found on port {1}", packet.AddressAsString, this.currentPortName);
                nozzleAddresses.Add(packet.Address[1]);
                this.portName = this.currentPortName;
            }
            else if (packet.CommandAsString == "04")
            {
                if (packet.MessageAsString == CONNECTED_CODE && !this.serialConnected)
                {
                    this.serialConnected = true;
                    _logger.LogInformation("Nozzle: {0} conneted", packet.AddressAsString);
                    for (int i = 0; i < nozzleAddresses.Count; i++)
                    {
                        authPacket.Address[1] = nozzleAddresses[i];
                        byte[] authBytes = authPacket.getBytes();
                        serialPort.Write(authBytes, 0, authBytes.Length);
                        await Task.Delay(MINIMUM_INTERVAL);
                    }
                }
                if (packet.MessageAsString == CONNECTED_AUTHORIZED_CODE && !this.serialConnected)
                {
                    this.serialConnected = true;
                    _logger.LogInformation("Nozzle: {0} authorized and conneted", packet.AddressAsString);
                }
                else if (packet.MessageAsString == DISCONNECTED_CODE && this.serialConnected)
                {
                    this.serialConnected = false;
                    _logger.LogInformation("Nozzle: {0} disconnected", packet.AddressAsString);
                    if (serialTotalReady)
                    {
                        for (int i = 0; i < nozzleAddresses.Count; i++)
                        {
                            totalMoneyVolumePacket.Address[1] = nozzleAddresses[i];
                            byte[] totalMoneyVolumeBytes = totalMoneyVolumePacket.getBytes();
                            serialPort.Write(totalMoneyVolumeBytes, 0, totalMoneyVolumeBytes.Length);
                            await Task.Delay(MINIMUM_INTERVAL);
                        }
                        serialTotalReady = false;
                    }
                }
                else if (packet.MessageAsString == DISCONNECTED_AUTHORIZED_CODE && this.serialConnected)
                {
                    this.serialConnected = false;
                    _logger.LogInformation("Nozzle: {0} authorized and disconnected", packet.AddressAsString);
                    for (int i = 0; i < nozzleAddresses.Count; i++)
                    {
                        unauthPacket.Address[1] = nozzleAddresses[i];
                        byte[] unauthBytes = unauthPacket.getBytes();
                        serialPort.Write(unauthBytes, 0, unauthBytes.Length);
                        await Task.Delay(MINIMUM_INTERVAL);
                    }
                }
                else if (packet.MessageAsString == A5_CODE)
                {
                    _logger.LogInformation("{0} 05 Error, disconnect and reconnect the nozzle.", packet.AddressAsString);
                }
            }
            else if (packet.CommandAsString == "05" && this.serialConnected && currentSale != packet.MessageAsString)
            {
                this.currentSale = packet.MessageAsString;
                this.serialTotalReady = true;
                _logger.LogInformation("\rNozzle: {0} sale value: {1}", packet.AddressAsString, this.currentSale);
            }
            else if (packet.CommandAsString == "07")
            {
                string packetMessage = packet.MessageAsString;
                string packetAddress = packet.AddressAsString;
                if (packetMessage.IndexOf('/') > 0)
                {
                    _logger.LogInformation("Nozzle: {0} total value: {1}", packetAddress, packetMessage);
                    float amount = float.Parse(currentSale.Substring(currentSale.IndexOf('/') + 1));
                    float price = float.Parse(currentSale.Substring(0, currentSale.IndexOf('/')));
                    float totalAmount = float.Parse(packetMessage.Substring(packetMessage.IndexOf('/') + 1));
                    float totalPrice = float.Parse(packetMessage.Substring(0, packetMessage.IndexOf('/')));
                    if (amount > 0)
                    {
                        database.AddValues(int.Parse(packetAddress), amount, totalAmount, price, totalPrice);
                        _logger.LogInformation("Amount added to database.");
                    }
                    currentSale = "";
                }
                else
                {
                    _logger.LogInformation("Nozzle: {0} total value error, got : {1}, resending request.", packetAddress, packetMessage);
                    for (int i = 0; i < nozzleAddresses.Count; i++)
                    {
                        totalMoneyVolumePacket.Address[1] = nozzleAddresses[i];
                        byte[] totalMoneyVolumeBytes = totalMoneyVolumePacket.getBytes();
                        serialPort.Write(totalMoneyVolumeBytes, 0, totalMoneyVolumeBytes.Length);
                        await Task.Delay(MINIMUM_INTERVAL);
                    }
                }
            }
        }

        void timerElapsed(object sender, ElapsedEventArgs e)
        {

        }

        async Task createRestServer() 
        {
            var builder = CreateWebHostBuilder(new string[] {});
            var task = Task.Run(() => {
                builder.Run();
            });
            
            Thread.Sleep(500);
            
            var output = await new HttpClient().GetStringAsync("http://localhost:5000");
        }

        public static IWebHost CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .ConfigureLogging(logging => logging.SetMinimumLevel(LogLevel.Warning))
                .UseUrls("http://0.0.0.0:5000/")
                .Build();
            

        string grepInformation(byte[] data)
        {
            if (data.Length > 7)
            {
                Packet packet = new Packet(data);
                return packet.ToString();
            }
            else
            {
                return "Cann't grep information from data.";
            }
        }

        string decrypt(string cipher, string salt)
        {
            byte[] cipherBytes = Convert.FromBase64String(cipher);
            byte[] saltBytes = Encoding.UTF8.GetBytes(salt);
            byte[] passwordBytes = ProtectedData.Unprotect(cipherBytes, null, DataProtectionScope.LocalMachine);
            return Encoding.UTF8.GetString(passwordBytes);
        }

        SerialPort serialPort;
        bool serialConnected;
        bool serialTotalReady;
        string currentSale;
        List<byte> nozzleAddresses;
        string portName;
        Packet statusPacket;
        Packet authPacket;
        Packet unauthPacket;
        Packet saleMoneyVolumePacket;
        Packet totalMoneyVolumePacket;
        string currentPortName;

        Database database;
        int MINIMUM_INTERVAL = 40;
        string DISCONNECTED_CODE = "P@";
        string CONNECTED_CODE = "Q@";
        string CONNECTED_AUTHORIZED_CODE = "S@";
        string DISCONNECTED_AUTHORIZED_CODE = "R@";
        string A5_CODE = "X@";
        bool serverRunning;
    }
}