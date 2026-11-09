using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class writeMessage : System.Web.UI.Page
{
    Int32 groupId;
    Int32 productId;

    protected void Page_Load(object sender, EventArgs e)
    {
        String imageName;

        if (imgCode.ImageUrl == "")
        {
            Maniyat.Security.LoadImageCode(out imageName);
            imgCode.ImageUrl = "App_Themes\\vcd\\" + imageName;
        }
        
        lblError.Text = "";

        txName.TextChanged += new EventHandler(text_TextChanged);
        txPhone.TextChanged += new EventHandler(text_TextChanged);
        txAddress.TextChanged += new EventHandler(text_TextChanged);
        txEmail.TextChanged += new EventHandler(text_TextChanged);
        txSubject.TextChanged += new EventHandler(text_TextChanged);
        txMessage.TextChanged += new EventHandler(text_TextChanged);
        txCode.TextChanged += new EventHandler(text_TextChanged);

        if (!Int32.TryParse(Request["gId"], out groupId))
            groupId = -1;

        if (!Int32.TryParse(Request["prId"], out productId))
            productId = -1;
    }

    protected void text_TextChanged(object sender, EventArgs e)
    {
        ((TextBox)sender).CssClass = "texts";
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        //verification values
        Boolean accept = true;

        if (txCode.Text != Maniyat.Security.VeriCode)
        {
            String imageName;

            lblError.Text += Maniyat.Consts.ERROR_VERIFICATIONCODE + "<br/>";
            txCode.CssClass = "Text_Required";
            accept = false;

            Maniyat.Security.LoadImageCode(out imageName);
            imgCode.ImageUrl = "App_Themes\\vcd\\" + imageName;
        }

        if (txName.Text == "")
        {
            lblError.Text += Maniyat.Consts.REQUIRED_NAME + "<br/>";
            txName.CssClass = "Text_Required";
            accept = false;
        }

        if (accept)
        {
            if (productId != -1)
            {
                Maniyat.MessageToProduct msg = new Maniyat.MessageToProduct(-1, txName.Text, txPhone.Text, txAddress.Text, txEmail.Text, txSubject.Text, txMessage.Text, DateTime.Now, productId);
                Maniyat.Database.Save(msg);
            }
            else
                if (groupId != -1)
                {
                    Maniyat.MessageToGroup msg = new Maniyat.MessageToGroup(-1, txName.Text, txPhone.Text, txAddress.Text, txEmail.Text, txSubject.Text, txMessage.Text, DateTime.Now, groupId);
                    Maniyat.Database.Save(msg);
                }
                else
                {
                    Maniyat.Message msg = new Maniyat.Message(-1, txName.Text, txPhone.Text, txAddress.Text, txEmail.Text, txSubject.Text, txMessage.Text, DateTime.Now);
                    Maniyat.Database.Save(msg);
                }

            Response.Redirect("reports.ASPX?report=1");
        }
    }
}