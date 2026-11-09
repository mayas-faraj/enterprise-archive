using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminGroup : System.Web.UI.Page
{
    private Int32 groupId;
    private Int32 parentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 npId;

        parentId = Int32.Parse(Request["pId"]);

        if (Request["gId"] == "" || Request["gId"] == "-1")
            groupId = -1;
        else
            groupId = Int32.Parse(Request["gId"]);

        if (Maniyat.Security.NotProg != null)
            if (Int32.TryParse(Request["npId"], out npId))
                if (Maniyat.Security.NotProg.Id == npId)
                {
                    if (groupId != -1)
                    {
                        Maniyat.Group gr = new Maniyat.Group(groupId);

                        lbMain.Text = Maniyat.Consts.TEXT_EDITGROUP;
                        btnAction.Text = Maniyat.Consts.TEXT_EDIT;

                        Maniyat.Database.Find(gr);

                        if (gr != null)
                        {
                            txName.Text = gr.Name;
                            txCommet.Text = gr.Comment;
                        }

                        else
                            Response.Redirect("reports.aspx?report=0");
                    }
                    else
                    {
                        lbMain.Text = Maniyat.Consts.TEXT_ADDNEWGROUP;
                        btnAction.Text = Maniyat.Consts.TEXT_ADD;
                    }
                }
    }

    protected void btnAction_Click(object sender, EventArgs e)
    {
        if (txName.Text != "")
            if (groupId == -1)
            {
                if (fuImage.HasFile)
                {
                    fuImage.SaveAs(MapPath(Maniyat.Consts.DATA_GROUPIMAGESLOCATION + '\\' + fuImage.FileName));
                    lbStatus.Text = Maniyat.Consts.TEXT_UPLOADCOMPLETE;
                }

                Maniyat.Database.Save(new Maniyat.Group(-1, parentId, txName.Text, txCommet.Text, fuImage.FileName, DateTime.Now, false));
                Response.Redirect("products.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
            else
            {
                Maniyat.Database.Edit(new Maniyat.Group(groupId, parentId, txName.Text, txCommet.Text, "", DateTime.Now, false));
                Response.Redirect("products.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
        else
            lbError.Text = Maniyat.Consts.REQUIRED_NAME;
    }
}