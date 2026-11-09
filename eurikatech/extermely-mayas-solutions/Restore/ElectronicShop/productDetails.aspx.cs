using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class productDetails : System.Web.UI.Page
{
    Int32 productId;
    Int32 parentId;
    Int32 npId;

    const String sperator = " : ";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                btnDelete.Visible = btnDelete.Enabled = btnEdit.Visible = btnEdit.Enabled = btnHide.Visible = btnHide.Enabled = true;    

                btnDelete.Click += new EventHandler(btnDelete_Click);
                btnHide.Click += new EventHandler(btnHide_Click);
                btnEdit.Click += new EventHandler(btnEdit_Click);
            }
        }
        else
            btnDelete.Visible = btnDelete.Enabled = btnEdit.Visible = btnEdit.Enabled = btnHide.Visible = btnHide.Enabled = false;

        if (Int32.TryParse(Request["prId"], out productId))
        {
            Maniyat.Product pr = new Maniyat.Product(productId);
            Maniyat.Database.Find(pr);

            if (pr != null)
            {
                parentId = pr.ParentId;

                if (pr.IsHide)
                    btnHide.Text = Maniyat.Consts.TEXT_SHOWPRODUCT;
                else
                    btnHide.Text = Maniyat.Consts.TEXT_HIDEPRODUCT;

                lbName.Text = Maniyat.Consts.TEXT_NAME + sperator + pr.Name;
                lbComment.Text = Maniyat.Consts.TEXT_COMMENT + sperator + pr.Comment;
                lbPrice.Text = pr.Price;

                if (pr.UseDateRange)
                {
                    lbValidDate.Text = Maniyat.Consts.TEXT_VALIDDATE + pr.ValidDate.ToString(Maniyat.Consts.DATA_DATEFORMAT);
                    lbExpiresDate.Text = Maniyat.Consts.TEXT_EXPIERDATE + pr.ExpierDate.ToString(Maniyat.Consts.DATA_DATEFORMAT);
                }

                lbDetails.Text = Maniyat.Consts.TEXT_DETAILS + sperator + pr.Details;

                if (pr.Image != null || pr.Image != "")
                    imgProduct.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + '\\' + pr.Image;
                else
                    imgProduct.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + '\\' + Maniyat.Consts.DATA_DEFAULTIMAGEPRODUCT;

                imgProduct.Width = Maniyat.Consts.DATA_PRODUCTIMAGEFULLWIDTH;
                imgProduct.Height = Maniyat.Consts.DATA_PRODUCTIMAGEFULLHEIGHT;
            }
            else
                Response.Redirect("reports.aspx?report=0");
        }
        else
            Response.Redirect("reports.aspx?report=0");

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminProduct.aspx?npId=" + Maniyat.Security.NotProg.Id.ToString() + "&prId=" + productId.ToString() + "&pId=" + parentId);
    }

    protected void btnHide_Click(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                if (btnHide.Text == Maniyat.Consts.TEXT_HIDEPRODUCT)
                    Maniyat.Database.Hide(new Maniyat.Product(productId), true);
                else
                    Maniyat.Database.Hide(new Maniyat.Product(productId), false);

                Response.Redirect("products.aspx?npId=" + npId + "&gId=" + parentId);
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                Maniyat.Database.Delete(new Maniyat.Product(productId));
                Response.Redirect("products.aspx?npId=" + npId + "&gId=" + parentId);
            }

        }
    }

    protected void btnComment_Click(object sender, EventArgs e)
    {
        Response.Redirect("writeMessage.aspx?prId=" + productId.ToString());
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                Response.Redirect("products.aspx?npId=" + npId + "&gId=" + parentId);
        }
        else
            Response.Redirect("products.aspx?gId=" + parentId);
    }
}