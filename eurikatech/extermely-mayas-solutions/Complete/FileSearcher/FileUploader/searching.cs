using System;

namespace Maniyat
{
    public class FileSearcher
    {
        public static String[] Searching(String path, String pattern, Int32 depth)
        {
            //precondition: depth>=0, path is exists
            if (path != null && path != "" && depth >= 0)
            {
                System.Collections.Specialized.StringCollection files = new System.Collections.Specialized.StringCollection();
                String[] result;
                String[] dirs = null;

                try
                {
                    files.AddRange(System.IO.Directory.GetFiles(path, pattern, System.IO.SearchOption.TopDirectoryOnly));
                    dirs = System.IO.Directory.GetDirectories(path);
                }
                catch (Exception ex)
                {
                }



                //searching in subdirectories
                if (dirs != null && dirs.Length > 0)
                    foreach (String dir in dirs)
                    {
                        String[] res = Searching(dir, pattern, depth - 1);
                        if (res != null)
                            files.AddRange(res);
                    }

                result = new String[files.Count];
                files.CopyTo(result, 0);

                return result;
            }
            else
                return null;

            //return values: list of file in path in special depth in args valid, else return null
        }
    }
}
