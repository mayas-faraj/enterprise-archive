using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Maniyat.IDatabase[] notProgs = Maniyat.Database.Select(new Maniyat.NotProg());

        for (Int32 i = 0; i < notProgs.Length; i++)
        {
            tblUsers.Rows.Add(new TableRow());

            TableCell tCell = new TableCell();

            tCell.BorderStyle = BorderStyle.Inset;
            tCell.Text = "<a href=\"adminEditUser.aspx?id=" + ((Maniyat.NotProg)notProgs[i]).Id + "\">" + ((Maniyat.NotProg)notProgs[i]).Name + "</a>";
            
            tblUsers.Rows[i].Cells.Add(tCell);
        }
    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        if (txPassword.Text == txPassword2.Text)
            if (txName.Text != null)
                {
                    Maniyat.Database.Insert(new Maniyat.NotProg(-1, txName.Text, txPassword.Text));
                    Response.Redirect("reports.aspx?report=3");
                }
            else
                lblError.Text = Maniyat.Consts.REQUIRED_NAME;
        else
            lblError.Text = Maniyat.Consts.ERROR_PASSWORDSNOTMACH;

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }
}