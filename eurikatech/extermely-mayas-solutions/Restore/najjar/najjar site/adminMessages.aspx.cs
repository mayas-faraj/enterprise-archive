using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminMessages : System.Web.UI.Page
{
    private static messagesState state;

    protected void Page_Load(object sender, EventArgs e)
    {
        switch (state)
        {
            case messagesState.inbox:
                btnInbox_Click(sender, e);
                break;
            case messagesState.sentMessages:
                btnSent_Click(sender, e);
                break;
            case messagesState.deletedMessages:
                btnDeleted_Click(sender, e);
                break;
        }
    }

    protected void btnInbox_Click(object sender, EventArgs e)
    {
        Maniyat.Message message = new Maniyat.Message();
        state = messagesState.inbox;
        Maniyat.Message[] messages;
        Maniyat.Database.Select(out messages);
        fillTable(messages);
    }

    protected void btnSent_Click(object sender, EventArgs e)
    {
        state = messagesState.sentMessages;
        Maniyat.Replay[] replays;
        Maniyat.Database.Select(out replays);
        fillTable(replays);
    }

    protected void btnDeleted_Click(object sender, EventArgs e)
    {
        state = messagesState.deletedMessages;
        Maniyat.Message message = new Maniyat.Message();
        Maniyat.Message[] messages;
        Maniyat.Database.Select(out messages);
        fillTable(messages);    
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        foreach (TableRow row in tblInbox.Rows)
            if (row.Cells[0].Controls.Count > 0)
                if (row.Cells[0].Controls[0].GetType() == typeof(CheckBox))
                {
                    CheckBox chk = (CheckBox)row.Cells[0].Controls[0];
                    Maniyat.Message message = new Maniyat.Message();

                    if (chk.Checked == true)
                        if (state == messagesState.inbox)
                        {
                            Maniyat.Message tempMsg = new Maniyat.Message(Convert.ToInt32(chk.ID), "", "", "", "", "", "", System.DateTime.Now);
                            Maniyat.Database.Hide(message, true);
                        }
                        else if (state == messagesState.sentMessages)
                        {
                            Maniyat.Replay replay = new Maniyat.Replay(Convert.ToInt32(chk.ID), null, "", "", "", System.DateTime.Now);
                            Maniyat.Database.Delete(replay);
                        }
                        else if (state == messagesState.deletedMessages)
                            Maniyat.Database.Delete(message);
                }

        btnInbox_Click(sender, new EventArgs());
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }

    private void fillTable(Maniyat.Message[] messages)
    {
        if (messages != null)
        {
            tblInbox.Rows.Clear();
            tblInbox.Rows.Add(new TableRow());

            TableCell tCell;

            createCell(out tCell, "تحديد", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "المرسل", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "العنوان", tblInbox.Width.Value * 0.2);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "التاريخ", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "رابط", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            for (Int32 i = 0; i < messages.Length; i++)
            {
                tblInbox.Rows.Add(new TableRow());

                if (!((Maniyat.Message)messages[i]).IsRead)
                    tblInbox.Rows[i + 1].Font.Bold = true;

                CheckBox chkSelect = new CheckBox();
                chkSelect.ID = ((Maniyat.Message)messages[i]).Id.ToString();
                createCell(out tCell, "");
                tCell.Controls.Add(chkSelect);
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, ((Maniyat.Message)messages[i]).Email);
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, "<a href=Message.aspx?messageId=" + ((Maniyat.Message)messages[i]).Id + ">" + ((Maniyat.Message)messages[i]).Subject + "</a>");
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, ((Maniyat.Message)messages[i]).Date.ToString("dddd dd/MM/yyyy"));
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                if (((Maniyat.Message)messages[i]).Link != null && ((Maniyat.Message)messages[i]).Link != "")
                {
                    createCell(out tCell, "<a href=" + ((Maniyat.Message)messages[i]).Link + "&npId=" + Maniyat.Security.NotProg.Id.ToString() + ">" + ((Maniyat.Message)messages[i]).Link + "</a>");
                    tblInbox.Rows[i + 1].Cells.Add(tCell);
                }
            }
        }
    }

    private void fillTable(Maniyat.Replay[] replays)
    {
        if (replays != null)
        {
            tblInbox.Rows.Clear();
            tblInbox.Rows.Add(new TableRow());

            TableCell tCell;

            createCell(out tCell, "تحديد", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "المستخدم المرسل", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "المرسل إليه", tblInbox.Width.Value * 0.2);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "العنوان", tblInbox.Width.Value * 0.2);
            tblInbox.Rows[0].Cells.Add(tCell);

            createCell(out tCell, "التاريخ", tblInbox.Width.Value * 0.1);
            tblInbox.Rows[0].Cells.Add(tCell);

            for (Int32 i = 0; i < replays.Length; i++)
            {
                tblInbox.Rows.Add(new TableRow());

                CheckBox chkSelect = new CheckBox();
                chkSelect.ID = replays[i].Id.ToString();
                createCell(out tCell, "");
                tCell.Controls.Add(chkSelect);
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, replays[i].NotProg.Name);
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, replays[i].Email);
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, "<a href=Message.aspx?replayId=" + replays[i].Id + ">" + replays[i].Subject + "</a>");
                tblInbox.Rows[i + 1].Cells.Add(tCell);

                createCell(out tCell, replays[i].SendDate.ToString("dddd dd/MM/yyyy"));
                tblInbox.Rows[i + 1].Cells.Add(tCell);
            }
        }
    }

    private void createCell(out TableCell tableCell, String name, Double width)
    {
        createCell(out tableCell, name);
        tableCell.Width = new Unit(width);
    }

    private void createCell(out TableCell tableCell, String name)
    {
        tableCell = new TableCell();
        tableCell.Text = name;
        tableCell.BorderStyle = BorderStyle.Inset;
    }

    private enum messagesState
    {
        inbox,
        sentMessages,
        deletedMessages
    }
}