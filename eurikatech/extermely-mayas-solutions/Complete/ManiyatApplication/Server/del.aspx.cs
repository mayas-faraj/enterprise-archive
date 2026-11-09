using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class del : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String path = Request["path"];

            if (path == null || path == "")
                Response.Write("path is required!");
            else
            {
                String file = MapPath(path);

                if (System.IO.File.Exists(file))
                {
                    try
                    {
                        System.IO.File.Delete(file);
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    Response.Write(file + " was deleted succesfully.");
                }
                else
                    Response.Write("file dosn't exsits!");
            }
        }
    }
}