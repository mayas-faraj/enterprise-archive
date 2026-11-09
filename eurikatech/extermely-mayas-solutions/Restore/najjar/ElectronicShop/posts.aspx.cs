using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class products : System.Web.UI.Page
{
    private Int32 groupId;

    protected void Page_Load(object sender, EventArgs e)
    {

        Maniyat.IDatabase[] posts = Maniyat.Database.Select(new Maniyat.Post());

        if (posts != null)
        {
            for (Int32 i = 0; i < posts.Length; i++)
            {
                TableRow tRow = new TableRow();
                TableCell tCell = new TableCell();

                

                tCell.Controls.Add(null);

                tCell.Width = 0;
                tCell.BorderStyle = BorderStyle.None;
                tCell.CssClass = "Table_ProductsView";

                tRow.Cells.Add(tCell);

                tblGroups.Rows.Add(tRow);
            }
        }
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminBook.aspx?npId=" + Maniyat.Security.NotProg.Id + "&pId=" + groupId + "&prId=-1&type=0");
    }
  
    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (groupId == -1)
            Response.Redirect("admin.aspx");
        else
        {
            Maniyat.Folder gr = new Maniyat.Folder(groupId);
            Maniyat.Database.Find(gr, groupId);

            Int32 npId;
            if (Int32.TryParse(Request["npId"], out npId))
            {
                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                    Response.Redirect("library.aspx?gId=" + gr.ParentId + "&npId=" + npId);
            }
            else
                Response.Redirect("library.aspx?gId=" + gr.ParentId);
        }
    }
}