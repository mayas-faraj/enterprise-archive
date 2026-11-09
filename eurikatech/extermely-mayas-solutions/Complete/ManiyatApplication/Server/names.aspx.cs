using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class names : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String dir = Request["dir"];

            if (dir != null && dir != "")
            {
                String dirName = MapPath(dir);
                System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(dirName);
                Int64 totalSize = 0;

                try
                {
                    System.IO.DriveInfo drive = new System.IO.DriveInfo(di.Root.Name);
                    Response.Write(String.Format("Drive :{0}, Total Size:{1} MB, Freespace: {2} MB.<br/>", drive.Name, ((Double)drive.TotalSize / 1048576).ToString("#.###"), ((Double)drive.TotalFreeSpace / 1048576).ToString("#.###")));
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message + "<br/>");
                }
                catch
                {
                    Response.Write("Unknown error!");
                }

                if (di.Exists)
                {
                    Int32 i = 0;

                    foreach (System.IO.FileInfo file in di.GetFiles())
                    {

                        try
                        {
                            totalSize += file.Length;
                            Response.Write(++i + "-" + file.Name + "-----" + file.Length + " Bytes -----" + ((Double)totalSize / 1048576).ToString("#.###") + " MB<br/>");
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message + "<br/>");
                        }
                    }
                }
            }
            else
            {
                Response.Write("dir param is required!");

                String fn = Request["fn"];


            }
        }
    }
}