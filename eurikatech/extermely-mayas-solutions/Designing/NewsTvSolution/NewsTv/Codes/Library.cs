using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace NewsTv.Codes
{
    internal static class Library
    {
        //public functions region
        public static ImageSource LoadUserImage(String path)
        {
            return loadImage(path);
        }

        public static ImageSource LoadButtonImage(String path)
        {
            return loadImage(path);
        }

        public static ImageSource LoadProfileImage(String path)
        {
            return loadImage(path);
        }

        public static ImageSource LoadImage(String path)
        {
            return loadImage(path);
        }

        //private functions region
        private static ImageSource loadImage(String path)
        {
            //precondition:none
            if (System.IO.File.Exists(path))
            {
                Image image = new Image();
                image.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/" + path));
                return image.Source;
            }
            else
                return null;
            //return value: if the image exists, return image object, else return null
        }
    }
}
