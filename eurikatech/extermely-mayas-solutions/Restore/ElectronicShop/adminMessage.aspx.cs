using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class adminMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 id;

        txSenderEmail.Text = Maniyat.Consts.DATA_DEFAULTEMAIL;

        if(Int32.TryParse(Request["id"],out id))
        {
            Maniyat.Message msg = new Maniyat.Message(id, "", "", "", "", "", "", DateTime.Now);
            Maniyat.Database.Find(ref msg);

            txEmail.Text = msg.Email;
            txSubject.Text = "RE : " + msg.Subject;
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txEmail.Text == "" || txEmail.Text.IndexOf('@') == -1)
        {
            lblError.Text = Maniyat.Consts.REQUIRED_EMAIL;
            txEmail.CssClass = "Text_Required";
        }
        else
        {
            if (txSubject.Text == "")
                txSubject.Text = Maniyat.Consts.TEXT_UNTITLED;

            MailMessage mMsg = new MailMessage();
            SmtpClient smptClient = new SmtpClient(Maniyat.Consts.DATA_DOMAINNAME,Maniyat.Consts.DATA_PORTNUMBER);

            mMsg.From = new MailAddress(txSenderEmail.Text);
            mMsg.To.Add(txEmail.Text);
            mMsg.Subject = txSubject.Text;

            if (txCc.Text != "")
            {
                String[] ccs = txCc.Text.Split('-', ';', ' ', '+', '|');
                foreach (String cc in ccs)
                    mMsg.CC.Add(new MailAddress(cc));
            }

            mMsg.Body = txMessage.Text;
            mMsg.IsBodyHtml = false;
          
            Maniyat.Replay replay = new Maniyat.Replay(-1, Maniyat.Security.NotProg, txEmail.Text, txSubject.Text, txMessage.Text, DateTime.Now);
            Maniyat.Database.Save(replay);

            smptClient.Send(mMsg);

            Response.Redirect("reports.aspx?report=4");
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }
}