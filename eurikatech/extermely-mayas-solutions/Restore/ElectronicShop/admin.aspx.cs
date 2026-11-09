using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Maniyat.Security.NotProg == null)
            Response.Redirect("login.aspx");
        else
        {
            lblMain.Text = Maniyat.Security.NotProg.Name + '-' + Maniyat.Consts.TEXT_WELCOME;
            lblNewMessage.Text = Maniyat.Consts.TEXT_NEWMESSAGE + " (" + Maniyat.Database.MessageUnreadCount().ToString() + ')';
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Maniyat.Security.NotProg = null;
        Response.Redirect("login.aspx");
    }

    protected void btnMessages_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminMessages.aspx");
    }

    protected void btnMessage_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminMessage.aspx");
    }

    protected void btnProducts_Click(object sender, EventArgs e)
    {
        Response.Redirect("products.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=-1");
    }

    protected void btnUsers_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminUsers.aspx");
    }
}