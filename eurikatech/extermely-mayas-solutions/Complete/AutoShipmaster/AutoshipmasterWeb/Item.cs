using System;
using System.Collections.Generic;
using System.Web;

namespace AutoshipmasterWeb
{
    public static class Item
    {
        //public functions region
        public static void Order(HttpRequest request, String mapPath)
        {
            foreach (string f in request.Files.AllKeys)
            {
                HttpPostedFile file = request.Files[f];
                file.SaveAs(mapPath + '\\' + file.FileName);
            }
        }

        public static void Read(HttpResponse response, String filePath)
        {
            System.IO.StreamReader sr = new System.IO.StreamReader(filePath);
            response.Write(DATA_START);
            response.Write(sr.ReadToEnd());
            response.Write(DATA_END);
            sr.Close();
        }

        //public constant region
        public const string DATA_START = "<!--";
        public const string DATA_END = "-->";
        public const string FILE_CONTROL = "control.txt";
        public const string FILE_MAP = "map.txt";
        public const string FILE_COORDINATE = "coordinate.txt";
    }
}