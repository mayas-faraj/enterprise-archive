using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class products : System.Web.UI.Page
{
    Int32 groupId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Int32.TryParse(Request["gId"],out groupId))
        {
            Int32 npId;
            Int32 rowsCount;
            Int32 modCount;
            Boolean showHides = false;

            Maniyat.Group gr = new Maniyat.Group(groupId);
            Maniyat.Database.Find(gr);

            lbGroups.Text = gr.Name;

            if (Int32.TryParse(Request["npId"], out npId))
                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                {
                    if (gr.IsHide)
                        btnHideGroup.Text = Maniyat.Consts.TEXT_SHOWGROUP;
                    else
                        btnHideGroup.Text = Maniyat.Consts.TEXT_HIDEGROUP;

                    btnAddGroup.Enabled = btnAddGroup.Visible = btnAddProduct.Enabled = btnAddProduct.Visible = true;   

                    btnAddProduct.Click += new EventHandler(btnAddProduct_Click);
                    btnAddGroup.Click += new EventHandler(btnAddGroup_Click);

                    showHides = true;

                    if (groupId != -1)
                    {
                        btnHideGroup.Enabled = btnHideGroup.Visible = btnDeleteGroup.Enabled = btnDeleteGroup.Visible = true;
                        btnHideGroup.Click += new EventHandler(btnHideGroup_Click);
                        btnDeleteGroup.Click += new EventHandler(btnDeleteGroup_Click);
                    }
                }
                else
                {
                    btnAddGroup.Enabled = btnAddGroup.Visible = btnAddProduct.Enabled = btnAddProduct.Visible = false;
                    btnHideGroup.Enabled = btnHideGroup.Visible = btnDeleteGroup.Enabled = btnDeleteGroup.Visible = false;
                }

            Maniyat.Group[] groups;
            Maniyat.Product[] products;
            Maniyat.Database.Load(out groups, groupId, showHides);
            Maniyat.Database.Load(out products, groupId, showHides);

            if (groups != null)
            {
                modCount = groups.Length % Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS;

                if (modCount == 0)
                    rowsCount = groups.Length / Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS;
                else
                    rowsCount = ((groups.Length - modCount) / Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS) + 1;

                for (Int32 i = 0; i < rowsCount; i++)
                {
                    TableRow tRow = new TableRow();

                    for (Int32 j = 0; j < Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS; j++)
                    {
                        Int32 idx = i * Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS + j;
                        if (groups.Length > idx)
                        {
                            TableCell tCell = new TableCell();
                            ImageButton ibtnLink = new ImageButton();
                            Label lblText = new Label();

                            lblText.Text = "<br/>" + groups[idx].Name;
                            ibtnLink.AlternateText = groups[idx].Comment;

                            if (groups[idx].Image == null || groups[idx].Image == "")
                                ibtnLink.ImageUrl = Maniyat.Consts.DATA_GROUPIMAGESLOCATION + "\\" + Maniyat.Consts.DATA_DEFAULTIMAGEGROUP;
                            else
                                ibtnLink.ImageUrl =Maniyat.Consts.DATA_GROUPIMAGESLOCATION + "\\" + groups[idx].Image;

                            if (Int32.TryParse(Request["npId"], out npId))
                            {
                                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                                    ibtnLink.PostBackUrl = "products.aspx?gId=" + groups[idx].Id.ToString() + "&npId=" + npId.ToString();
                            }
                            else
                                ibtnLink.PostBackUrl = "products.aspx?gId=" + groups[idx].Id.ToString();
                          
                            ibtnLink.Width = 80;
                            ibtnLink.Height = 80;

                            tCell.Width = 0;
                            tCell.BorderStyle = BorderStyle.None;
                            tCell.CssClass = "Table_ProductsView";
                            tCell.Controls.Add(ibtnLink);
                            tCell.Controls.Add(lblText);

                            tRow.Cells.Add(tCell);
                        }
                    }

                    tblGroups.Rows.Add(tRow);
                }
            }

            if (products != null)
            {
                lbProducts.Text = Maniyat.Consts.TEXT_PRODUCTSIN + gr.Name;

                modCount = products.Length % Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS;

                if (modCount == 0)
                    rowsCount = products.Length / Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS;
                else
                    rowsCount = ((products.Length - modCount) / Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS) + 1;

                for (Int32 i = 0; i < rowsCount; i++)
                {
                    TableRow tRow = new TableRow();

                    for (Int32 j = 0; j < Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS; j++)
                    {
                        Int32 idx = i * Maniyat.Consts.DATA_PRODUCTTABLECOLUMNS + j;
                        if (products.Length > idx)
                        {
                            TableCell tCell = new TableCell();
                            ImageButton ibtnLink = new ImageButton();
                            Label lblText = new Label();

                            lblText.Text = "<br/>" + products[idx].Name;
                            ibtnLink.AlternateText = products[idx].Comment;

                            if (products[idx].Image == null || products[idx].Image == "")
                                ibtnLink.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + "\\" + Maniyat.Consts.DATA_DEFAULTIMAGEPRODUCT;
                            else
                                ibtnLink.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + "\\" + products[idx].Image;

                            if (Int32.TryParse(Request["npId"], out npId))
                            {
                                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                                    ibtnLink.PostBackUrl = "productDetails.aspx?prId=" + products[idx].Id.ToString() + "&npId=" + Maniyat.Security.NotProg.Id;
                            }
                            else
                                ibtnLink.PostBackUrl = "productDetails.aspx?prId=" + products[idx].Id;

                            ibtnLink.Width = 80;
                            ibtnLink.Height = 80;

                            tCell.Width = 0;
                            tCell.BorderStyle = BorderStyle.None;
                            tCell.CssClass = "Table_ProductsView";
                            tCell.Controls.Add(ibtnLink);
                            tCell.Controls.Add(lblText);

                            tRow.Cells.Add(tCell);
                        }
                    }
                    tblProducts.Rows.Add(tRow);
                }
            }   
        }
        else
            Response.Redirect("reports.aspx?report=0");

    }

    protected void btnDeleteGroup_Click(object sender, EventArgs e)
    {
        Int32 npId;
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                Maniyat.Database.Delete(new Maniyat.Group(groupId));
                btnBack_Click(sender, e);
            }
        }
    }

    protected void btnHideGroup_Click(object sender, EventArgs e)
    {
        Int32 npId;
        if (Int32.TryParse(Request["npId"], out npId))
        {
            if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
            {
                if (btnHideGroup.Text == Maniyat.Consts.TEXT_HIDEGROUP)
                    Maniyat.Database.Hide(new Maniyat.Group(groupId), true);
                else
                    Maniyat.Database.Hide(new Maniyat.Group(groupId), false);

                btnBack_Click(sender, e);
            }
        }
    }

    protected void btnAddGroup_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminGroup.aspx?npId=" + Maniyat.Security.NotProg.Id + "&pId=" + groupId + "&gId=-1");
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminProduct.aspx?npId=" + Maniyat.Security.NotProg.Id + "&pId=" + groupId + "&prId=-1");
    }

    protected void btnComment_Click(object sender, EventArgs e)
    {
        Response.Redirect("writeMessage.aspx?gId=" + groupId);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (groupId == -1)
            Response.Redirect("admin.aspx");
        else
        {
            Maniyat.Group gr = new Maniyat.Group(groupId);
            Maniyat.Database.Find(gr);

            Int32 npId;
            if (Int32.TryParse(Request["npId"], out npId))
            {
                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                    Response.Redirect("products.aspx?gId=" + gr.ParentId + "&npId=" + npId);
            }
            else
                Response.Redirect("products.aspx?gId=" + gr.ParentId);
        }
    }
}