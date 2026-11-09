using System;
using System.Collections.Generic;
using System.Text;

namespace ZippingFiles
{
    class Program
    {
        static void Main(string[] args)
        {
            System.DateTime now;
            String folder = "e:\\1ziptest";

            now = System.DateTime.Now;

            foreach (String fn in System.IO.Directory.GetFiles(folder))
                compress(fn);

            Console.WriteLine("Compress Complete, Time is:" + System.DateTime.Now.Subtract(now).TotalMilliseconds);

            //now = System.DateTime.Now;
            //decompressDeflate("e:\\1ziptest\\7un.pdf");
            //Console.WriteLine("Decompress Complete, Time is:" + System.DateTime.Now.Subtract(now).Milliseconds.ToString());

            Console.ReadLine();
        }

        static void compress(String path)
        {
            System.IO.FileStream fs = new System.IO.FileStream(path, System.IO.FileMode.Open);
            System.IO.FileStream fz = new System.IO.FileStream("e:\\1ziptest\\zipped.zip", System.IO.FileMode.Append);
            System.IO.Compression.GZipStream gzs = new System.IO.Compression.GZipStream(fz, System.IO.Compression.CompressionMode.Compress);
            
            Byte[] buffer = new Byte[fs.Length];
            fs.Read(buffer, 0, buffer.Length);
            gzs.Write(buffer, 0, buffer.Length);

            gzs.Close();
            fz.Close();
            fs.Close();
        }

        static void decompress(String path)
        {
            System.IO.FileStream fs = new System.IO.FileStream(path, System.IO.FileMode.Create);
            System.IO.FileStream fz = new System.IO.FileStream("e:\\1ziptest\\zipped.zip", System.IO.FileMode.Open);
            System.IO.Compression.GZipStream gzs = new System.IO.Compression.GZipStream(fz, System.IO.Compression.CompressionMode.Decompress);

            Int32 byt = gzs.ReadByte();

            while (byt != -1)
            {
                fs.WriteByte((Byte)byt);
                byt = gzs.ReadByte();
            }
            

            gzs.Close();
            fz.Close();
            fs.Close();
        }

        static void compressDeflate(String path)
        {
            System.IO.FileStream fs = new System.IO.FileStream(path, System.IO.FileMode.Open);
            System.IO.FileStream fz = new System.IO.FileStream("e:\\1ziptest\\zipped.zip", System.IO.FileMode.Create);
            System.IO.Compression.DeflateStream ds = new System.IO.Compression.DeflateStream(fz, System.IO.Compression.CompressionMode.Compress);

            Byte[] buffter = new Byte[fs.Length];
            fs.Read(buffter, 0, buffter.Length);
            ds.Write(buffter, 0, buffter.Length);

            ds.Close();
            fz.Close();
            fs.Close();
        }

        static void decompressDeflate(String path)
        {
            System.IO.FileStream fs = new System.IO.FileStream(path, System.IO.FileMode.Create);
            System.IO.FileStream fz = new System.IO.FileStream("e:\\1ziptest\\zipped.zip", System.IO.FileMode.Open);
            System.IO.Compression.DeflateStream ds = new System.IO.Compression.DeflateStream(fz, System.IO.Compression.CompressionMode.Decompress);

            Int32 byt = ds.ReadByte();

            while (byt != -1)
            {
                fs.WriteByte((Byte)byt);
                byt = ds.ReadByte();
            }


            ds.Close();
            fz.Close();
            fs.Close();
        }
    }
}
