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
    private Int32 type;
    //0 books 1 courses 2 sculpts

    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 npId;

        parentId = Int32.Parse(Request["pId"]);

        if (Request["gId"] == "" || Request["gId"] == "-1")
            groupId = -1;
        else
            groupId = Int32.Parse(Request["gId"]);

        if (Request["type"] == "" || Request["type"] == "-1")
            type = -1;
        else
            type = Int32.Parse(Request["type"]);

        if (Maniyat.Security.NotProg != null)
            if (Int32.TryParse(Request["npId"], out npId))
                if (Maniyat.Security.NotProg.Id == npId)
                {
                    if (groupId != -1)
                    {
                        Maniyat.Folder gr = new Maniyat.Folder(groupId);

                        lbMain.Text = Maniyat.Consts.TEXT_EDITGROUP;
                        btnAction.Text = Maniyat.Consts.TEXT_EDIT;

                        Maniyat.Database.Find(gr, groupId);

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

                Maniyat.Database.Insert(new Maniyat.Folder(-1, txName.Text, txCommet.Text, fuImage.FileName, parentId, DateTime.Now));

                if (type == 0)
                    Response.Redirect("libray.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
                else
                    if(type==1)
                        Response.Redirect("courses.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
                    else
                        Response.Redirect("sculpts.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
            else
            {
                Maniyat.Database.Update(new Maniyat.Folder(groupId, txName.Text, txCommet.Text, "", parentId, DateTime.Now));

                if (type == 0)
                    Response.Redirect("libray.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
                else
                    if (type == 1)
                        Response.Redirect("courses.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
                    else
                        Response.Redirect("sculpts.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
        else
            lbError.Text = Maniyat.Consts.REQUIRED_NAME;
    }
}