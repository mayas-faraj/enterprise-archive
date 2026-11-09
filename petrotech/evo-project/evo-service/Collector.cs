//Collector class
//this class is used to collect data from ethernet port and send command
//it include System.Net namespace to read from ethernet
//and System.Xml to parse the result
//and System.IO to write the log into the file system

using System;
using System.Net;
using System.IO;
using System.Xml;

namespace Petrotech
{
    class Collector
    {
        //public functions region

        //Fetch the sensors values from specific IP address
        public static SensorValue[] FetchSensors(String ip)
        {
            //xml command
            string command="<TSA_REQUEST_LIST><TSA_REQUEST COMMAND=\"cmdAppGetFMSTankStatus\"/></TSA_REQUEST_LIST>";
            return grepSensors(fetchEthernet(ip, command));
        }

        //Fetch the alarms values from specific IP address
        public static Alarm[] FetchAlarm(String ip)
        {
            string command="<TSA_REQUEST_LIST><TSA_REQUEST COMMAND=\"cmdAppGetCurrentAlarms\"/></TSA_REQUEST_LIST>";
            return grepAlarm(fetchEthernet(ip, command));
        }

        //Fetch the alarms history from specific IP address
        public static Alarm[] FetchAlarmHistory(String ip)
        {
            string command = "<TSA_REQUEST_LIST><TSA_REQUEST COMMAND=\"cmdAppGetAlarmHistory\"/></TSA_REQUEST_LIST>";
            return grepAlarm(fetchEthernet(ip, command));
        }

        //Fetch the events values from specific IP address
        public static Event[] FetchEvents(String ip)
        {
            string command="<TSA_REQUEST_LIST><TSA_REQUEST COMMAND=\"cmdAppGetAppEvents\"/></TSA_REQUEST_LIST>";
            return grepEvents(fetchEthernet(ip, command));
        }

        //Fetch the configurations values from specific IP address
        public static Config[] FetchConfigs(String ip)
        {
            string command="<TSA_REQUEST_LIST><TSA_REQUEST COMMAND=\"cmdAppGetConfiguration\"/></TSA_REQUEST_LIST>";
            return grepConfigs(fetchEthernet(ip, command));
        }

        //Fetch the deleviery reports from specific IP address
        //only day is used to fetch the data at this day, else for the this year
        public static Delivery[] FetchDeliveries(String ip, bool onlyDay)
        {
            string startDay, endDay;
            if(onlyDay)
            {
                //start and end day is the current day
                startDay=endDay=DateTime.Today.ToString("yyyy-MM-dd");
            }
            else
            {
                //start day is the first day of this year and end day is the last day of this year
                startDay=new DateTime(DateTime.Now.Year, 1, 1).ToString("yyyy-MM-dd");
                endDay=new DateTime(DateTime.Now.Year, 12, 31).ToString("yyyy-MM-dd");
            }

            string command="<TSA_REQUEST_LIST><TSA_REQUEST COMMAND=\"cmdAppGetTankDeliveryHistory\" DATE_FROM=\""+startDay+"T00:00:00\" DATE_TO=\""+endDay+"T23:59:59\"/></TSA_REQUEST_LIST>";
            return grepDeliveries(fetchEthernet(ip, command));
        }

        //fetch data from ethernet belongs to specific command
        public static string fetchEthernet(String ip, string command)
        {
                //result variable
                String content;

                //command encoding to byte
                byte[] data = System.Text.Encoding.ASCII.GetBytes(command);
                try
                {
                    //create requset from the ip from the cgi file
                    HttpWebRequest hwRequest = (HttpWebRequest)HttpWebRequest.Create("http://" + ip + "/cgi-bin/tsaws.cgi");
                    //fetching parameters
                    hwRequest.Timeout = 6000;
                    hwRequest.Method = "POST";
                    hwRequest.ContentType = "text/xml";
                    hwRequest.ContentLength = data.Length;
                    hwRequest.KeepAlive = true;

                    //result data stream, it write the command into  the ethernet like a file
                    Stream requestStream = hwRequest.GetRequestStream();
                    requestStream.Write(data, 0, data.Length);
                    requestStream.Close();

                    //waiting for response before timeout
                    WebResponse wResponse = hwRequest.GetResponse();
                    Stream stream = wResponse.GetResponseStream();
                    //read data from the ethernet like a file
                    StreamReader streamReader = new StreamReader(stream, System.Text.Encoding.Default);
                    content = streamReader.ReadToEnd();
                    streamReader.Close();
                    stream.Close();
                    wResponse.Close(); 
                    //log the result into a file to hard disk for debug   
                    Logger.Log(content);

                    //return result data as string
                    return content;
                }
                catch (Exception ex)
                {
                    Logger.Error("Error whlile fetch from ethernet-"+ex.Message);
                    return "";
                }
        }

        //parse alarm from xml data
        //xml data containes attributes only in result tags
        private static SensorValue[] grepSensors(String data)
        {
            //no data to grep return null
            if(data=="") return null;
            //define xml schema
            System.Collections.Generic.List<SensorValue> valueList=new System.Collections.Generic.List<SensorValue>();
            XmlDocument xmlDocument=new XmlDocument();
            //load xml data by xml object
            xmlDocument.LoadXml(data);
            //read the first child (the parent is the result name and child contains the data)
            XmlNode eventNode=xmlDocument.DocumentElement.ChildNodes[0];
            
            //loop through childes (data)
            foreach(XmlNode node in eventNode.ChildNodes)
            {
                //rest attributes into sensor object
                SensorValue sv=new SensorValue();
                //check for errors
                string sensorErrors="";
                for(int i=0; i<node.Attributes.Count; i++)
                    if(node.Attributes[i].Name.LastIndexOf("_ERROR")>0) 
                    {
                        if(sensorErrors!="") sensorErrors+=", ";
                        sensorErrors+=node.Attributes[i].Name+"("+node.Attributes[i].Value+")";
                    }
                        
                if(sensorErrors=="")
                {
                    if(node.Attributes["TANK_ID"]!=null) sv.TankId=int.Parse(node.Attributes["TANK_ID"].InnerText);
                    if(node.Attributes["WATER_LEVEL"]!=null)  sv.WaterLevel=float.Parse(node.Attributes["WATER_LEVEL"].InnerText);
                    if(node.Attributes["PRODUCT_LEVEL"]!=null) sv.ProductLevel=float.Parse(node.Attributes["PRODUCT_LEVEL"].InnerText);
                    if(node.Attributes["TEMPERATURE"]!=null) sv.Temprature=float.Parse(node.Attributes["TEMPERATURE"].InnerText);
                    if(node.Attributes["GROSS_PRODUCT_VOLUME"]!=null) sv.GrossProductVolume=float.Parse(node.Attributes["GROSS_PRODUCT_VOLUME"].InnerText);
                    if(node.Attributes["NET_PRODUCT_VOLUME"]!=null) sv.NetProductVolume=float.Parse(node.Attributes["NET_PRODUCT_VOLUME"].InnerText);
                    if(node.Attributes["WATER_VOLUME"]!=null) sv.WaterVolume=float.Parse(node.Attributes["WATER_VOLUME"].InnerText);
                    if(node.Attributes["ULLAGE_VOLUME"]!=null) sv.UllageVolume=float.Parse(node.Attributes["ULLAGE_VOLUME"].InnerText);
                    if(node.Attributes["DENSITY"]!=null) sv.Density=float.Parse(node.Attributes["DENSITY"].InnerText);
                    if(node.Attributes["NET_DENSITY"]!=null) sv.NetDensity=float.Parse(node.Attributes["NET_DENSITY"].InnerText);
                    if(node.Attributes["PRODUCT_MASS"]!=null) sv.ProductMass=float.Parse(node.Attributes["PRODUCT_MASS"].InnerText);
                    if(node.Attributes["UNCOMP_PRODUCT_LEVEL"]!=null) sv.UncompProductLevel=float.Parse(node.Attributes["UNCOMP_PRODUCT_LEVEL"].InnerText);
                    if(node.Attributes["UNCOMP_DENSITY_LEVEL"]!=null) sv.UncompDensityLevel=float.Parse(node.Attributes["UNCOMP_DENSITY_LEVEL"].InnerText);
                    if(node.Attributes["DISTANCE0"]!=null) sv.Distance=float.Parse(node.Attributes["DISTANCE0"].InnerText);
                    if(node.Attributes["REF_DENSITY"]!=null) sv.RefDensity=float.Parse(node.Attributes["REF_DENSITY"].InnerText);
                    if(node.Attributes["ACTIVE_DELIVERY"]!=null) sv.AlarmsActive=node.Attributes["ACTIVE_DELIVERY"].InnerText=="true";
                    if(node.Attributes["ACTIVE_ALARMS"]!=null) sv.AlarmsActive=node.Attributes["ACTIVE_ALARMS"].InnerText=="true";
                    if(node.Attributes["ACTIVE_STATIC_LEAK_TEST"]!=null) sv.StaticLeakTestActive=node.Attributes["ACTIVE_STATIC_LEAK_TEST"].InnerText=="true";
                }
                else
                    sv.Error=sensorErrors;
                valueList.Add(sv);
            }

            //result sensor array
            return valueList.ToArray();
            //deprecated: grep by regular expression
            /*
            Regex regex = new Regex("(\\w+)=\"([0-9.]+)\"");
            Match match = regex.Match(data);

            if (match.Success)
            {
                SensorValue sensorValue = new SensorValue();
                while (match.Success)
                {
                    switch (match.Groups[1].Value)
                    {
                        case "TANK_ID":
                            sensorValue.TankId = int.Parse(match.Groups[2].Value);
                            break;
                        case "WATER_LEVEL":
                            sensorValue.WaterLevel = float.Parse(match.Groups[2].Value);
                            break;
                        case "PRODUCT_LEVEL":
                            sensorValue.ProductLevel = float.Parse(match.Groups[2].Value);
                            break;
                        case "TEMPERATURE":
                            sensorValue.Temprature = float.Parse(match.Groups[2].Value);
                            break;
                        case "GROSS_PRODUCT_VOLUME":
                            sensorValue.GrossProductVolume = float.Parse(match.Groups[2].Value);
                            break;
                        case "NET_PRODUCT_VOLUME":
                            sensorValue.NetProductVolume = float.Parse(match.Groups[2].Value);
                            break;
                        case "WATER_VOLUME":
                            sensorValue.WaterVolume = float.Parse(match.Groups[2].Value);
                            break;
                        case "ULLAGE_VOLUME":
                            sensorValue.UllageVolume = float.Parse(match.Groups[2].Value);
                            break;
                        case "DENSITY":
                            sensorValue.Density = float.Parse(match.Groups[2].Value);
                            break;
                        case "NET_DENSITY":
                            sensorValue.NetDensity = float.Parse(match.Groups[2].Value);
                            break;
                        case "PRODUCT_MASS":
                            sensorValue.ProductMass = float.Parse(match.Groups[2].Value);
                            break;
                        case "UNCOMP_PRODUCT_LEVEL":
                            sensorValue.UncompProductLevel = float.Parse(match.Groups[2].Value);
                            break;
                        case "UNCOMP_DENSITY_LEVEL":
                            sensorValue.UncompDensityLevel = float.Parse(match.Groups[2].Value);
                            break;
                        case "DISTANCE0":
                            sensorValue.Distance = float.Parse(match.Groups[2].Value);
                            break;
                        case "REF_DENSITY":
                            sensorValue.RefDensity = float.Parse(match.Groups[2].Value);
                            break;
                        case "ACTIVE_DELIVERY":
                            sensorValue.DeliveryActive = match.Groups[2].Value == "true";
                            break;
                        case "ACTIVE_ALARMS":
                            sensorValue.AlarmsActive = match.Groups[2].Value == "true";
                            break;
                        case "ACTIVE_STATIC_LEAK_TEST":
                            sensorValue.StaticLeakTestActive = match.Groups[2].Value == "true";
                            break;
                    }

                    match = match.NextMatch();
                }
                return sensorValue;
            }
            else
                return null;
                */
        }

        //parse alarm from xml data
        //xml data containes attributes only in result tags
        private static Alarm[] grepAlarm(String data)
        {
             //no data to grep return null
            if(data=="") return null;
            //define xml schema
            System.Collections.Generic.List<Alarm> alarmList=new System.Collections.Generic.List<Alarm>();
            XmlDocument xmlDocument=new XmlDocument();
            //load xml data by xml object
            xmlDocument.LoadXml(data);
            //read the first child (the parent is the result name and child contains the data)
            XmlNode alarmNode=xmlDocument.DocumentElement.ChildNodes[0];

            //loop through nodes
            foreach(XmlNode node in alarmNode.ChildNodes)
            {
                //read attributes
                Alarm alarm=new Alarm();
                if(node.Attributes["CODE"]!=null) alarm.Code=node.Attributes["CODE"].InnerText;
                if(node.Attributes["DATA"]!=null) alarm.Data=int.Parse(node.Attributes["DATA"].InnerText);
                if(node.Attributes["DEVICE"]!=null) alarm.Device=node.Attributes["DEVICE"].InnerText;
                if(node.Attributes["STATE"]!=null) alarm.Status=node.Attributes["STATE"].InnerText;
                if(node.Attributes["TYPE"]!=null) alarm.Type=node.Attributes["TYPE"].InnerText;
                if(node.Attributes["OCCURRED_LOCAL"]!=null) alarm.AlarmDate=DateTime.ParseExact(node.Attributes["OCCURRED_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null);

                if(node.Attributes["CLEARED_LOCAL"]!=null)
                    alarm.ClearedDate=DateTime.ParseExact(node.Attributes["CLEARED_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null);
                else
                    alarm.ClearedDate=null;

                alarmList.Add(alarm);
            }

            return alarmList.ToArray();
        }

        //parse alarm from xml data
        //xml data containes attributes only in result tags
        private static Event[] grepEvents(String data)
        {
            if(data=="") return null;

            System.Collections.Generic.List<Event> eventList=new System.Collections.Generic.List<Event>();
            XmlDocument xmlDocument=new XmlDocument();
            xmlDocument.LoadXml(data);
            XmlNode eventNode=xmlDocument.DocumentElement.ChildNodes[0];
            
            foreach(XmlNode node in eventNode.ChildNodes)
            {
                Event ev=new Event();
                if(node.Attributes["CODE"]!=null) ev.Code=node.Attributes["CODE"].InnerText;
                if(node.Attributes["DATA"]!=null)  ev.Data=int.Parse(node.Attributes["DATA"].InnerText);
                if(node.Attributes["OCCURRED_LOCAL"]!=null) ev.OccuredDate=DateTime.ParseExact(node.Attributes["OCCURRED_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null); 

                eventList.Add(ev);
            }

            return eventList.ToArray();
        }

        //parse alarm from xml data
        //xml data containes attributes only in result tags
        private static Delivery[] grepDeliveries(String data)
        {
            //no data to grep return null
            if(data=="") return null;

            System.Collections.Generic.List<Delivery> deliveryList=new System.Collections.Generic.List<Delivery>();
            XmlDocument xmlDocument=new XmlDocument();
            xmlDocument.LoadXml(data);
            XmlNode eventNode=xmlDocument.DocumentElement.ChildNodes[0];
            
            foreach(XmlNode node in eventNode.ChildNodes)
            {
                Delivery dv=new Delivery();
                
                if(node.Attributes["TANK_ID"]!=null)  dv.TankId=int.Parse(node.Attributes["TANK_ID"].InnerText);
                if(node.Attributes["BEGIN_TIME_LOCAL"]!=null) dv.BeginTime=DateTime.ParseExact(node.Attributes["BEGIN_TIME_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null);    
                if(node.Attributes["BEGIN_PRODUCT_LEVEL"]!=null)  dv.BeginProductLevel=double.Parse(node.Attributes["BEGIN_PRODUCT_LEVEL"].InnerText);
                if(node.Attributes["BEGIN_WATER_LEVEL"]!=null)  dv.BeginWaterLevel=double.Parse(node.Attributes["BEGIN_WATER_LEVEL"].InnerText);
                if(node.Attributes["BEGIN_TEMPRATURE"]!=null)  dv.BeginTemprature=double.Parse(node.Attributes["BEGIN_TEMPRATURE"].InnerText);
                if(node.Attributes["BEGIN_GROSS_PRODUCT_VOLUME"]!=null)  dv.BeginGrossProductVolume=double.Parse(node.Attributes["BEGIN_GROSS_PRODUCT_VOLUME"].InnerText);
                if(node.Attributes["BEGIN_NET_PRODUCT_VOLUME"]!=null)  dv.BeginNetProductVolume=double.Parse(node.Attributes["BEGIN_NET_PRODUCT_VOLUME"].InnerText);
                if(node.Attributes["BEGIN_WATER_VOLUME"]!=null)  dv.BeginWaterVolume=double.Parse(node.Attributes["BEGIN_WATER_VOLUME"].InnerText);
                if(node.Attributes["BEGIN_ULLAGE_VOLUME"]!=null)  dv.BeginUllageVolume=double.Parse(node.Attributes["BEGIN_ULLAGE_VOLUME"].InnerText);
                if(node.Attributes["BEGIN_PRODUCT_DENSITY"]!=null)  dv.BeginProductDensity=double.Parse(node.Attributes["BEGIN_PRODUCT_DENSITY"].InnerText);
                if(node.Attributes["BEGIN_PRODUCT_MASS"]!=null)  dv.BeginProductMass=double.Parse(node.Attributes["BEGIN_PRODUCT_MASS"].InnerText);
                if(node.Attributes["END_TIME_LOCAL"]!=null) dv.EndTime=DateTime.ParseExact(node.Attributes["END_TIME_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null);    
                if(node.Attributes["END_PRODUCT_LEVEL"]!=null)  dv.EndProductLevel=double.Parse(node.Attributes["END_PRODUCT_LEVEL"].InnerText);
                if(node.Attributes["END_WATER_LEVEL"]!=null)  dv.EndWaterLevel=double.Parse(node.Attributes["END_WATER_LEVEL"].InnerText);
                if(node.Attributes["END_TEMPRATURE"]!=null)  dv.EndTemprature=double.Parse(node.Attributes["END_TEMPRATURE"].InnerText);
                if(node.Attributes["END_GROSS_PRODUCT_VOLUME"]!=null)  dv.EndGrossProductVolume=double.Parse(node.Attributes["END_GROSS_PRODUCT_VOLUME"].InnerText);
                if(node.Attributes["END_NET_PRODUCT_VOLUME"]!=null)  dv.EndNetProductVolume=double.Parse(node.Attributes["END_NET_PRODUCT_VOLUME"].InnerText);
                if(node.Attributes["END_WATER_VOLUME"]!=null)  dv.EndWaterVolume=double.Parse(node.Attributes["END_WATER_VOLUME"].InnerText);
                if(node.Attributes["END_ULLAGE_VOLUME"]!=null)  dv.EndUllageVolume=double.Parse(node.Attributes["END_ULLAGE_VOLUME"].InnerText);
                if(node.Attributes["END_PRODUCT_DENSITY"]!=null)  dv.EndProductDensity=double.Parse(node.Attributes["END_PRODUCT_DENSITY"].InnerText);
                if(node.Attributes["END_PRODUCT_MASS"]!=null)  dv.EndProductMass=double.Parse(node.Attributes["END_PRODUCT_MASS"].InnerText);
                if(node.Attributes["GROSS_VOLUME_DELIVERED"]!=null)  dv.GrossVolumeDelivered=double.Parse(node.Attributes["GROSS_VOLUME_DELIVERED"].InnerText);
                if(node.Attributes["NET_VOLUME_DELIVERED"]!=null)  dv.NetVolumeDelivered=double.Parse(node.Attributes["NET_VOLUME_DELIVERED"].InnerText);
                if(node.Attributes["MASS_DELIVERED"]!=null)  dv.MassDelivered=double.Parse(node.Attributes["MASS_DELIVERED"].InnerText);
                if(node.Attributes["GROSS_DENSITY_DELIVERED"]!=null)  dv.GrossDensityDelivered=double.Parse(node.Attributes["GROSS_DENSITY_DELIVERED"].InnerText);
                if(node.Attributes["NET_DENSITY_DELIVERED"]!=null)  dv.NetDensityDelivered=double.Parse(node.Attributes["NET_DENSITY_DELIVERED"].InnerText);

                if(node.Attributes["TOTAL_DISPENSED_ERROR"]!=null)  dv.TotalDispensedError=node.Attributes["TOTAL_DISPENSED_ERROR"].InnerText;
                if(node.Attributes["DISPENSED_DURING_DELIVERY_ERROR"]!=null)  dv.DispensedDuringDeliveryError=node.Attributes["DISPENSED_DURING_DELIVERY_ERROR"].InnerText;
               
                if(node.Attributes["BEGIN_REFERENCE_GROSS_PRODUCT_VOLUME_ERROR"]!=null) dv.BeginReferenceGrossProductVolumeError=node.Attributes["BEGIN_REFERENCE_GROSS_PRODUCT_VOLUME_ERROR"].InnerText;
                if(node.Attributes["BEGIN_REFERENCE_NET_PRODUCT_VOLUME_ERROR"]!=null) dv.BeginReferenceNetProductVolumeError=node.Attributes["BEGIN_REFERENCE_NET_PRODUCT_VOLUME_ERROR"].InnerText;
                if(node.Attributes["BEGIN_REFERENCE_TIME_LOCAL"]!=null) dv.BeginReferenceTime=DateTime.ParseExact(node.Attributes["BEGIN_REFERENCE_TIME_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null); 

                if(node.Attributes["END_REFERENCE_GROSS_PRODUCT_VOLUME_ERROR"]!=null) dv.EndReferenceGrossProductVolumeError=node.Attributes["END_REFERENCE_GROSS_PRODUCT_VOLUME_ERROR"].InnerText;
                if(node.Attributes["END_REFERENCE_NET_PRODUCT_VOLUME_ERROR"]!=null) dv.EndReferenceNetProductVolumeError=node.Attributes["END_REFERENCE_NET_PRODUCT_VOLUME_ERROR"].InnerText;
                if(node.Attributes["END_REFERENCE_TIME_LOCAL"]!=null) dv.EndReferenceTime=DateTime.ParseExact(node.Attributes["END_REFERENCE_TIME_LOCAL"].InnerText, "yyyy-MM-ddTHH:mm:ss", null); 

                deliveryList.Add(dv);
            }

            return deliveryList.ToArray();
        }

        //parse alarm from xml data
        //xml data containes attributes only in result tags
        private static Config[] grepConfigs(String data)
        {
            if(data=="") return null;

            System.Collections.Generic.List<Config> configList=new System.Collections.Generic.List<Config>();
            XmlDocument xmlDocument=new XmlDocument();
            xmlDocument.LoadXml(data);

            XmlNode configNode=xmlDocument.DocumentElement.ChildNodes[0];    
            crawlConfigs(configNode.ChildNodes[0], "", configList);
            return configList.ToArray();
        }

        private static void crawlConfigs(XmlNode parentNode, string path, System.Collections.Generic.List<Config> configList)
        {
            if(parentNode.ChildNodes.Count>0)
            {
                if(path=="") 
                        path=parentNode.Name;
                    else
                        path+="-"+parentNode.Name;

                foreach(XmlNode node in parentNode)
                {
                    

                    if(node.Attributes.Count>0)
                    {  
                        for(int i=0; i<node.Attributes.Count; i++)
                        {
                            Config config=new Config();
                            config.Key=node.Attributes[i].Name;
                            config.Value=node.Attributes[i].Value;
                            config.Path=path+"-"+node.Name;
                            configList.Add(config);
                    
                    
                        }
                    }

                    crawlConfigs(node, path, configList);
                }
            }
        }
    }
}