using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class rd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String path = Request["path"];
            String max = Request["max"];

            if (path == null || path == "")
                Response.Write("path is required, max is opitional!");
            else
            {
                String dir = MapPath(path);

                if (System.IO.Directory.Exists(dir))
                {
                    Int32 i = 0;

                    foreach (String file in System.IO.Directory.GetFiles(dir))
                    {
                        try
                        {
                            if (max != null && max != "")
                                if (i >= Int32.Parse(max))
                                    break;

                            i++;
                            System.IO.File.Delete(file);
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                    }

                    Response.Write(i.ToString() + " files in " + dir + " was deleted succesfully.");
                }
                else
                    Response.Write("directory dosn't exsits!");
            }
        }
    }
}