using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Library
{
    public static class Internet
    {
        //public functions region
        public static void Transmit(OrderCollection orders)
        {
            System.IO.FileStream fs = new System.IO.FileStream(FILE_MAP, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
            System.IO.StreamWriter sw = new System.IO.StreamWriter(fs);

            for (int i = 0; i < orders.Count; i++)
                sw.Write(orders[i].X.ToString() + SPERATOR + orders[i].Y.ToString() + SPERATOR + orders[i].Velocity.ToString() + SPERATOR_TOTAL);

            sw.Close();

            System.Net.WebClient webClient = new System.Net.WebClient();
            webClient.UploadFile(URI_ORDER_MAP, FILE_MAP);
        }

        public static void Transmit(Command command)
        {
            System.IO.FileStream fs = new System.IO.FileStream(FILE_CONTROL, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
            System.IO.StreamWriter sw = new System.IO.StreamWriter(fs);
            sw.Write((int)command);
            sw.Close();

            System.Net.WebClient webClient = new System.Net.WebClient();
            webClient.UploadFile(URI_ORDER_CONTROL, FILE_CONTROL);
        }

        public static void Transmit(Order order)
        {
            System.IO.FileStream fs = new System.IO.FileStream(FILE_COORDINATE, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
            System.IO.StreamWriter sw = new System.IO.StreamWriter(fs);

            sw.Write(order.X.ToString() + SPERATOR + order.Y.ToString() + SPERATOR + order.Velocity.ToString());
            sw.Close();

            System.Net.WebClient webClient = new System.Net.WebClient();
            webClient.UploadFile(URI_ORDER_COORDINATE, FILE_COORDINATE);
        }

        public static void Recived(out OrderCollection orders)
        {
            System.Net.WebClient webClient = new System.Net.WebClient();
            String downloaded = webClient.DownloadString(URI_READ_MAP);
            String[] lines;
            String[] values;

            orders = new OrderCollection();
            downloaded = downloaded.Substring(downloaded.IndexOf(DATA_START) + DATA_START.Length, downloaded.IndexOf(DATA_END) - downloaded.IndexOf(DATA_START) - DATA_START.Length);

            lines = downloaded.Split(SPERATOR_TOTAL);

            if (lines != null)
                for (int i = 0; i < lines.Length; i++)
                {
                    values = lines[i].Split(SPERATOR);

                    if (values != null && values.Length == 3)
                    {
                        Order order = new Order();
                        float value;

                        if (Single.TryParse(values[0], out value))
                            order.X = value;
                        else
                            order.X = -1;

                        if (Single.TryParse(values[1], out value))
                            order.Y = value;
                        else
                            order.Y = -1;

                        if (Single.TryParse(values[2], out value))
                            order.Velocity = value;
                        else
                            order.Velocity = -1;

                        orders.Add(order);
                    }
                }
            else
                orders = null;
        }

        public static void Recived(out Command command)
        {
            System.Net.WebClient webClient = new System.Net.WebClient();
            String downloaded = webClient.DownloadString(URI_READ_CONTROL);
            int commandValue;

            downloaded = downloaded.Substring(downloaded.IndexOf(DATA_START) + DATA_START.Length, downloaded.IndexOf(DATA_END) - downloaded.IndexOf(DATA_START) - DATA_START.Length);

            if (Int32.TryParse(downloaded, out commandValue))
                command = (Command)commandValue;
            else
                command = Command.run;
        }

        public static void Recived(out Order order)
        {
            System.Net.WebClient webClient = new System.Net.WebClient();
            String downloaded = webClient.DownloadString(URI_READ_COORDINATE);
            String[] values;

            order = new Order();
            downloaded = downloaded.Substring(downloaded.IndexOf(DATA_START) + DATA_START.Length, downloaded.IndexOf(DATA_END) - downloaded.IndexOf(DATA_START) - DATA_START.Length);

            values = downloaded.Split(SPERATOR);

            if (values != null && values.Length == 3)
            {
                float value;

                if (Single.TryParse(values[0], out value))
                    order.X = value;
                else
                    order.X = -1;

                if (Single.TryParse(values[1], out value))
                    order.Y = value;
                else
                    order.Y = -1;

                if (Single.TryParse(values[2], out value))
                    order.Velocity = value;
                else
                    order.Velocity = -1;
            }
        }

        //private constant region
        private const char SPERATOR = ';';
        private const char SPERATOR_TOTAL = '*';
        private const string FILE_CONTROL = "control.txt";
        private const string FILE_MAP = "map.txt";
        private const string FILE_COORDINATE = "coordinate.txt";
        private const string DATA_START = "<!--";
        private const string DATA_END = "-->";
        private const string URI_ORDER_MAP = "http://localhost:1042/OrderMap.aspx";
        private const string URI_ORDER_COORDINATE = "http://localhost:1042/OrderCoordinate.aspx";
        private const string URI_ORDER_CONTROL = "http://localhost:1042/OrderControl.aspx";
        private const string URI_READ_MAP = "http://localhost:1042/ReadMap.aspx";
        private const string URI_READ_COORDINATE = "http://localhost:1042/ReadCoordinate.aspx";
        private const string URI_READ_CONTROL = "http://localhost:1042/ReadControl.aspx";

        /*
        private const string URI_ORDER_MAP = "http://www.autoshipmaster.webs/OrderMap.aspx";
        private const string URI_ORDER_COORDINATE = "http://www.autoshipmaster.webs/OrderCoordinate.aspx";
        private const string URI_ORDER_CONTROL = "http://www.autoshipmaster.webs/OrderControl.aspx";
        private const string URI_READ_MAP = "http://www.autoshipmaster.webs/ReadMap.aspx";
        private const string URI_READ_COORDINATE = "http://www.autoshipmaster.webs/ReadCoordinate.aspx";
        private const string URI_READ_CONTROL = "http://www.autoshipmaster.webs/ReadControl.aspx";
        */
    }
}
