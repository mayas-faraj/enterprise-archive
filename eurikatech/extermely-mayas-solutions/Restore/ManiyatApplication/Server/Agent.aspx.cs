using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (string f in Request.Files.AllKeys)
            {
                Random random = new Random();
                HttpPostedFile file = Request.Files[f];
                file.SaveAs(MapPath("\\store\\" + file.FileName.Substring(0, file.FileName.LastIndexOf('.')) + random.NextDouble().ToString().Substring(2) + ".mp4"));
            }
            return;
        }
    }
}