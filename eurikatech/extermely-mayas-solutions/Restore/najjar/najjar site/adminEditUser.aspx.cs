using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminEditUser : System.Web.UI.Page
{
    private Maniyat.NotProg notProg;

    protected void Page_Load(object sender, EventArgs e)
    {
        loadNotProg();     
    }

    protected void btnEditUser_Click(object sender, EventArgs e)
    {
        loadNotProg();

        if (notProg.Tone == txOldPassword.Text)
        {
            Maniyat.Database.Update(new Maniyat.NotProg(notProg.Id, txName.Text, txNewPassword.Text));
            Response.Redirect("adminUsers.aspx");
        }
        else
            lblError.Text = Maniyat.Consts.ERROR_OLDPASSWORD;

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        loadNotProg();

        if (notProg.Tone == txOldPassword.Text)
        {
            Maniyat.Database.Delete(notProg);
            Response.Redirect("adminUsers.aspx");
        }
        else
            lblError.Text = Maniyat.Consts.ERROR_OLDPASSWORD;
    }

    private void loadNotProg()
    {
        Int32 npId;

        if (Int32.TryParse(Request["id"], out npId))
        {
            notProg = new Maniyat.NotProg();
            Maniyat.Database.Find(notProg, npId);
        }
        else
            Response.Redirect("reports.aspx?report=0");
    }
}