using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminSculpt : System.Web.UI.Page
{
    private Int32 productId;
    private Int32 parentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 npId;

        parentId = Int32.Parse(Request["pId"]);

        if (Request["prId"] == "" || Request["prId"] == "-1")
            productId = -1;
        else
            productId = Int32.Parse(Request["prId"]);

        if (Maniyat.Security.NotProg != null)
            if (Int32.TryParse(Request["npId"], out npId))
                if (Maniyat.Security.NotProg.Id == npId)
                {
                    if (productId != -1 && txName.Text == "")
                    {
                        Maniyat.Sculpt pr = new Maniyat.Sculpt(productId);

                        lbMain.Text = Maniyat.Consts.TEXT_EDITPRODUCT;
                        btnAction.Text = Maniyat.Consts.TEXT_EDIT;

                        Maniyat.Database.Find(pr, productId);

                        if (pr != null)
                        {
                            txName.Text = pr.Name;
                            txCommet.Text = pr.Comment;
                            txDetails.Text = pr.Detail;
                            txArtistName.Text = pr.Artist;
                            txDate.Text = pr.Date.ToString(Maniyat.Consts.DATA_DATEUSERFORMAT);                
                        }

                        else
                            Response.Redirect("reports.aspx?report=0");
                    }
                    else
                    {
                        lbMain.Text = Maniyat.Consts.TEXT_ADDNEWPRODUCT;
                        btnAction.Text = Maniyat.Consts.TEXT_ADD;
                        txDate.Text = DateTime.Now.ToString(Maniyat.Consts.DATA_DATEUSERFORMAT);
                    }
                }
    }

    protected void btnAction_Click(object sender, EventArgs e)
    {
        if (txName.Text != "")
            if (productId == -1)
            {
                if (fuImage.HasFile)
                {
                    fuImage.SaveAs(MapPath(Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + '\\' + fuImage.FileName));
                    lbStatus.Text = Maniyat.Consts.TEXT_UPLOADCOMPLETE;
                }

                Maniyat.Database.Insert(new Maniyat.Sculpt(-1, txName.Text, txCommet.Text, fuImage.FileName, txDetails.Text, DateTime.Parse(txDate.Text), parentId, txArtistName.Text));
                Response.Redirect("sculpts.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
            else
            {
                Maniyat.Database.Update(new Maniyat.Sculpt(productId, txName.Text, txCommet.Text, fuImage.FileName, txDetails.Text, DateTime.Parse(txDate.Text), parentId, txArtistName.Text));
                Response.Redirect("sculpts.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
        else
            lbError.Text = Maniyat.Consts.REQUIRED_NAME;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("sculpts.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
    }
}