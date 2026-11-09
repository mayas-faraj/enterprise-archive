using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoshipmasterWeb
{
    public partial class ReadCoordinate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Item.Read(Page.Response, MapPath(Item.FILE_COORDINATE));
        }
    }
}