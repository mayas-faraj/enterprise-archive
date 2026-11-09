using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminProduct : System.Web.UI.Page
{
    private Int32 productId;
    private Int32 parentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 npId;

        clValidDate.SelectedDate = DateTime.Now;
        clExpierDate.SelectedDate = DateTime.Now;

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
                        Maniyat.Product pr = new Maniyat.Product(productId);

                        lbMain.Text = Maniyat.Consts.TEXT_EDITPRODUCT;
                        btnAction.Text = Maniyat.Consts.TEXT_EDIT;

                        Maniyat.Database.Find(pr);

                        if (pr != null)
                        {
                            txName.Text = pr.Name;
                            txCommet.Text = pr.Comment;
                            txPrice.Text = pr.Price;
                            clValidDate.SelectedDate = pr.ValidDate;
                            clExpierDate.SelectedDate = pr.ExpierDate;
                            txDetails.Text = pr.Details;
                        }

                        else
                            Response.Redirect("reports.aspx?report=0");
                    }
                    else
                    {
                        lbMain.Text = Maniyat.Consts.TEXT_ADDNEWPRODUCT;
                        btnAction.Text = Maniyat.Consts.TEXT_ADD;
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
   
                Maniyat.Database.Save(new Maniyat.Product(-1, parentId, txName.Text, txCommet.Text, fuImage.FileName, DateTime.Now, clValidDate.SelectedDate, clExpierDate.SelectedDate, txPrice.Text, false, chkUseDateRange.Checked, txDetails.Text));
                Response.Redirect("products.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
            else
            {
                Maniyat.Database.Edit(new Maniyat.Product(productId, parentId, txName.Text, txCommet.Text, "", DateTime.Now, clValidDate.SelectedDate, clExpierDate.SelectedDate, txPrice.Text, false, chkUseDateRange.Checked, txDetails.Text));
                Response.Redirect("products.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
            }
        else
            lbError.Text = Maniyat.Consts.REQUIRED_NAME;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("products.aspx?npId=" + Maniyat.Security.NotProg.Id + "&gId=" + parentId);
    }
}