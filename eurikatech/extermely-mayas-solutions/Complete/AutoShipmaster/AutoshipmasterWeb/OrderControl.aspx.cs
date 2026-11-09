using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoshipmasterWeb
{
    public partial class OrderControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Item.Order(Request, MapPath(""));
        }
    }
}