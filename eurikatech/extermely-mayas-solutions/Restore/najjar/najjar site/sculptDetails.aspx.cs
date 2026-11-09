using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SculptDetails : System.Web.UI.Page
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
            Maniyat.Sculpt pr = new Maniyat.Sculpt(productId);
            Maniyat.Database.Find(pr, productId);

            if (pr != null)
            {
                parentId = pr.ParentId;

                if (pr.IsHide)
                    btnHide.Text = Maniyat.Consts.TEXT_SHOWPRODUCT;
                else
                    btnHide.Text = Maniyat.Consts.TEXT_HIDEPRODUCT;

                lbName.Text = Maniyat.Consts.TEXT_NAME + sperator + pr.Name;
                lbComment.Text = Maniyat.Consts.TEXT_COMMENT + sperator + pr.Comment;
                lbDate.Text = Maniyat.Consts.TEXT_PRODUCTDATE + pr.Date.ToString(Maniyat.Consts.DATA_DATEFORMAT);
                lblArtist.Text = Maniyat.Consts.TEXT_AUTHOR + pr.Artist;
                lbDetails.Text = Maniyat.Consts.TEXT_DETAILS + sperator + pr.Detail;    

                if (pr.Logo != null || pr.Logo != "")
                    imgProduct.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + '\\' + pr.Logo;
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
        Response.Redirect("adminSculpt.aspx?npId=" + Maniyat.Security.NotProg.Id.ToString() + "&prId=" + productId.ToString() + "&pId=" + parentId);
    }

    protected void btnHide_Click(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                Maniyat.Sculpt sculpt = new Maniyat.Sculpt(productId);

                if (btnHide.Text == Maniyat.Consts.TEXT_HIDEPRODUCT)
                {
                    sculpt.IsHide = true;
                    Maniyat.Database.Update(sculpt, new Maniyat.DataCondition(sculpt.DataFields["id"], Maniyat.SqlOperator.Equal, productId));
                }
                else
                {
                    sculpt.IsHide = true;
                    Maniyat.Database.Update(sculpt, new Maniyat.DataCondition(sculpt.DataFields["id"], Maniyat.SqlOperator.Equal, productId));
                }

                Response.Redirect("Sculpts.aspx?npId=" + npId + "&gId=" + parentId);
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            Maniyat.Sculpt book = new Maniyat.Sculpt(productId);

            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                Maniyat.Database.Delete(book, new Maniyat.DataCondition(book.DataFields["id"], Maniyat.SqlOperator.Equal, productId));
                Response.Redirect("Sculpts.aspx?npId=" + npId + "&gId=" + parentId);
            }
        }
    }

    protected void btnComment_Click(object sender, EventArgs e)
    {
        Response.Redirect("writeMessage.aspx?prId=" + productId + "&pageURL=SculptDetails.aspx?prId=" + productId);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                Response.Redirect("Sculpts.aspx?npId=" + npId + "&gId=" + parentId);
        }
        else
            Response.Redirect("Sculpts.aspx?gId=" + parentId);
    }
}