using System;

namespace ZipFW4
{
    class Program
    {
        static void Main(string[] args)
        {
            System.DateTime now = System.DateTime.Now;
            decompress();
            Console.WriteLine(System.DateTime.Now.Subtract(now).TotalMilliseconds);
        }

        static void compress()
        {
            System.IO.DirectoryInfo di = new System.IO.DirectoryInfo("e:\\1ziptest");
            System.IO.Packaging.Package pakage = System.IO.Packaging.ZipPackage.Open("e:\\1ziptest.zip", System.IO.FileMode.Create, System.IO.FileAccess.ReadWrite);

            foreach (System.IO.FileInfo file in di.GetFiles())
            {
                System.IO.Packaging.PackagePart part = pakage.CreatePart(new Uri("/" + file.Name, UriKind.Relative), System.Net.Mime.MediaTypeNames.Application.Zip, System.IO.Packaging.CompressionOption.Maximum);
                file.Open(System.IO.FileMode.Open).CopyTo(part.GetStream());
            }
            pakage.Close();    
        }

        static void decompress()
        {
            System.IO.Packaging.Package package = System.IO.Packaging.ZipPackage.Open("e:\\1ziptest.zip", System.IO.FileMode.Open, System.IO.FileAccess.Read);

            foreach (System.IO.Packaging.PackagePart part in package.GetParts())
            {
                String fileName = System.IO.Path.Combine("f:\\mas", System.IO.Path.GetFileName(part.Uri.ToString()));
                part.GetStream().CopyTo(System.IO.File.Create(fileName));
            }

            package.Close();
        }
    }
}