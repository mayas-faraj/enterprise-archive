using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String imageName;

        if (imgCode.ImageUrl == "")
        {
            Maniyat.Security.LoadImageCode(out imageName);
            imgCode.ImageUrl = "App_Themes\\vcd\\" + imageName;
        }
    }

    protected void btn_Login(object sender, EventArgs e)
    {
        if (txCode.Text == Maniyat.Security.VeriCode)
        {
            Maniyat.NotProg np = new Maniyat.NotProg(-1, txName.Text, txPassword.Text);
            np = Maniyat.Database.NotProgSign(np);

            if (np == null)
            {
                txName.Text = "";
                txCode.Text = "";
                txPassword.Text = "";
                lblError.Text = Maniyat.Consts.ERROR_USERNAMEORPASSWORD;

                String imageName;
                Maniyat.Security.LoadImageCode(out imageName);
                imgCode.ImageUrl = "App_Themes\\vcd\\" + imageName;
            }
            else
            {
                Maniyat.Security.NotProg = np;
                Response.Redirect("admin.aspx");
            }
        }
        else
        {
            lblError.Text = Maniyat.Consts.ERROR_VERIFICATIONCODE;

            String imageName;
            Maniyat.Security.LoadImageCode(out imageName);
            imgCode.ImageUrl = "App_Themes\\vcd\\" + imageName;
            txCode.Text = "";
            txPassword.Text = "";
        }
    }
}