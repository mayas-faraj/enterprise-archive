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
            Maniyat.Message message=new Maniyat.Message();
            lblMain.Text = Maniyat.Security.NotProg.Name + '-' + Maniyat.Consts.TEXT_WELCOME;
            lblNewMessage.Text = Maniyat.Consts.TEXT_NEWMESSAGE + " (" + Maniyat.Database.Statics(message, Maniyat.SqlFunctions.count, new Maniyat.DataCondition(message.DataFields["isRead"], Maniyat.SqlOperator.Equal, "false")) + ')';
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

    protected void btnLibrary_Click(object sender, EventArgs e)
    {
        Response.Redirect("library.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + Maniyat.Consts.DATA_LIBRARYROOTID.ToString());
    }

    protected void btnCourses_Click(object sender, EventArgs e)
    {
        Response.Redirect("courses.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + Maniyat.Consts.DATA_COURSESROOTID.ToString());
    }

    protected void btnSculpts_Click(object sender, EventArgs e)
    {
        Response.Redirect("sculpts.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId="+Maniyat.Consts.DATA_SCULPTSROOTID.ToString());
    }

    protected void btnUsers_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminUsers.aspx");
    }

    protected void btnCurrency_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminCurrency.aspx");
    }

    protected void btnOptions_Click(object sender, EventArgs e)
    {
        Response.Redirect("options.aspx");
    }
}