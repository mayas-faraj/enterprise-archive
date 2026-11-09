using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class message : System.Web.UI.Page
{
    Maniyat.Message msg;

    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 id;
   
        if (Int32.TryParse(Request["messageId"], out id))
        {
            msg = new Maniyat.Message();
            Maniyat.Database.Find(msg, id);

            if (msg != null)
            {
                lblName.Text = msg.Name;
                lblPhone.Text = msg.Phone;
                lblAddress.Text = msg.Address;
                lblDate.Text = msg.Date.ToString("dddd dd/MM/yyyy");
                lblSender.Text = msg.Email;
                lblSubject.Text = msg.Subject;
                txMessage.Text = msg.MessageText;

                msg.IsRead = true;
                Maniyat.Database.Update(msg);
            }
            else
                Response.Redirect("reports.aspx?report=0");
        }
        else
            if (Int32.TryParse(Request["replayId"], out id))
            {
                Maniyat.Replay replay = new Maniyat.Replay();
                Maniyat.Database.Find(replay, id);

                if (replay != null)
                {
                    lblName.Text = replay.NotProg.Name;
                    lblPhone.Visible = false;
                    lblAddress.Visible = false;
                    lblDate.Text = replay.SendDate.ToString("dddd dd/MM/yyyy");
                    lblSender.Text = replay.Email;
                    lblSubject.Text = replay.Subject;
                    txMessage.Text = replay.Message;
                    btnReplay.Visible = false;
                }
                else
                    Response.Redirect("reports.aspx?report=0");
            }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Int32 id;

        if (Int32.TryParse(Request["messageId"], out id))
        {
            Maniyat.Database.Delete(msg);
            Response.Redirect("adminMessages.aspx");
        }
        else

            if (Int32.TryParse(Request["replayId"], out id))
            {
                Maniyat.Replay replay = new Maniyat.Replay();
                Maniyat.Database.Delete(replay);
                Response.Redirect("adminMessages.aspx");
            }
            else
                Response.Redirect("reports.aspx?report=0");
    }

    protected void btnReplay_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminMessage.aspx?id=" + Request["messageId"]);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminMessages.aspx");
    }
}