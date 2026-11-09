using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sculpts : System.Web.UI.Page
{
    private Int32 groupId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Int32.TryParse(Request["gId"],out groupId))
        {
            Int32 npId;
            Int32 rowsCount;
            Int32 modCount;

            Maniyat.Folder gr = new Maniyat.Folder(groupId);
            Maniyat.Sculpt sculpt = new Maniyat.Sculpt();

            Maniyat.Database.Find(gr, groupId);

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

            Maniyat.IDatabase[] groups = Maniyat.Database.Select(gr, new Maniyat.DataCondition[] { new Maniyat.DataCondition(gr.DataFields["parentId"], Maniyat.SqlOperator.Equal, gr.Id), new Maniyat.DataCondition(gr.DataFields["isHide"], Maniyat.SqlOperator.Equal,"false") }, "AND");
            Maniyat.IDatabase[] products = Maniyat.Database.Select(sculpt, new Maniyat.DataCondition[] { new Maniyat.DataCondition(sculpt.DataFields["parentId"], Maniyat.SqlOperator.Equal, gr.Id), new Maniyat.DataCondition(sculpt.DataFields["isHide"], Maniyat.SqlOperator.Equal, "false") }, "AND");

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

                            lblText.Text = "<br/>" + ((Maniyat.Folder)groups[idx]).Name;
                            ibtnLink.AlternateText = ((Maniyat.Folder)groups[idx]).Comment;

                            if (((Maniyat.Folder)groups[idx]).Logo == null || ((Maniyat.Folder)groups[idx]).Logo == "")
                                ibtnLink.ImageUrl = Maniyat.Consts.DATA_GROUPIMAGESLOCATION + "\\" + Maniyat.Consts.DATA_DEFAULTIMAGEGROUP;
                            else
                                ibtnLink.ImageUrl =Maniyat.Consts.DATA_GROUPIMAGESLOCATION + "\\" + ((Maniyat.Folder)groups[idx]).Logo;

                            if (Int32.TryParse(Request["npId"], out npId))
                            {
                                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                                    ibtnLink.PostBackUrl = "sculpts.aspx?gId=" + ((Maniyat.Folder)groups[idx]).Id.ToString() + "&npId=" + npId.ToString();
                            }
                            else
                                ibtnLink.PostBackUrl = "sculpts.aspx?gId=" + ((Maniyat.Folder)groups[idx]).Id.ToString();
                          
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

                            lblText.Text = "<br/>" + ((Maniyat.Sculpt)products[idx]).Name;
                            ibtnLink.AlternateText = ((Maniyat.Sculpt)products[idx]).Comment;

                            if (((Maniyat.Sculpt)products[idx]).Logo == null || ((Maniyat.Sculpt)products[idx]).Logo == "")
                                ibtnLink.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + "\\" + Maniyat.Consts.DATA_DEFAULTIMAGEPRODUCT;
                            else
                                ibtnLink.ImageUrl = Maniyat.Consts.DATA_PRODUCTIMAGESLOCATION + "\\" + ((Maniyat.Sculpt)products[idx]).Logo;

                            if (Int32.TryParse(Request["npId"], out npId))
                            {
                                if (Maniyat.Security.NotProg != null && Maniyat.Security.NotProg.Id == npId)
                                    ibtnLink.PostBackUrl = "sculptDetails.aspx?prId=" + ((Maniyat.Sculpt)products[idx]).Id.ToString() + "&npId=" + Maniyat.Security.NotProg.Id;
                            }
                            else
                                ibtnLink.PostBackUrl = "sculptDetails.aspx?prId=" + ((Maniyat.Sculpt)products[idx]).Id;

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

            if (groupId == Maniyat.Consts.DATA_LIBRARYROOTID)
                btnDeleteGroup.Enabled = btnHideGroup.Enabled = false;
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
                Maniyat.Folder folder = new Maniyat.Folder(groupId);
                Maniyat.Database.Delete(folder, new Maniyat.DataCondition(folder.DataFields["id"], Maniyat.SqlOperator.Equal, groupId));
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
                Maniyat.Folder folder = new Maniyat.Folder(groupId);

                if (btnHideGroup.Text == Maniyat.Consts.TEXT_HIDEGROUP)
                {
                    folder.IsHide = true;
                    Maniyat.Database.Update(folder, new Maniyat.DataCondition(folder.DataFields["id"], Maniyat.SqlOperator.Equal, groupId));
                }
                else
                {
                    folder.IsHide = false;
                    Maniyat.Database.Update(folder, new Maniyat.DataCondition(folder.DataFields["id"], Maniyat.SqlOperator.Equal, groupId));
                }

                btnBack_Click(sender, e);
            }
        }
    }

    protected void btnAddGroup_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminGroup.aspx?npId=" + Maniyat.Security.NotProg.Id + "&pId=" + groupId + "&gId=-1&type=2");
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminSculpt.aspx?npId=" + Maniyat.Security.NotProg.Id + "&pId=" + groupId + "&prId=-1");
    }

    protected void btnComment_Click(object sender, EventArgs e)
    {
        Response.Redirect("writeMessage.aspx?gId=" + groupId + "&pageURL=sculpts.aspx?gid=" + groupId);
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
                    Response.Redirect("sculpts.aspx?gId=" + gr.ParentId + "&npId=" + npId);
            }
            else
                Response.Redirect("sculpts.aspx?gId=" + gr.ParentId);
        }
    }
}