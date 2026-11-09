using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.Mobile;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using OnlineStoreDataSetTableAdapters;
using System.Transactions;

public partial class Admin : System.Web.UI.MobileControls.MobilePage
{

    private void CheckCacheCategory()
    {
        if (Cache["Category"]!= null)
        {
            OnlineStoreDataSet.CategoryDataTable tblCat = new OnlineStoreDataSet.CategoryDataTable();
            CategoryTableAdapter adapter = new CategoryTableAdapter();
            adapter.Fill(tblCat);
            Cache["Category"] = tblCat;
        }
    }

    private void CheckCacheProduct()
    {
        if (Cache["Product"] != null)
        {
            OnlineStoreDataSet.ProductDataTable tblProd = new OnlineStoreDataSet.ProductDataTable();
            ProductTableAdapter adapter = new ProductTableAdapter();
            adapter.Fill(tblProd);
            Cache["Product"] = tblProd;
        }
    }

    private void CheckCacheProductSize()
    {
        if (Cache["Product_Size"] != null)
        {
            OnlineStoreDataSet.Product_SizeDataTable tblProdSize = new OnlineStoreDataSet.Product_SizeDataTable();
            Product_SizeTableAdapter adapter = new Product_SizeTableAdapter();
            adapter.Fill(tblProdSize);
            Cache["Product_Size"] = tblProdSize;
        }
    }

    private void CheckCacheProductColor()
    {
        if (Cache["Product_Color"] != null)
        {
            OnlineStoreDataSet.Product_ColorDataTable tblProdColor = new OnlineStoreDataSet.Product_ColorDataTable();
            Product_ColorTableAdapter adapter = new Product_ColorTableAdapter();
            adapter.Fill(tblProdColor);
            Cache["Product_Color"] = tblProdColor;
        }
    }

    private void ShowErrorForm(string errorMessage, string backNavUrl)
    {
        Session["ErrorMessage"] = errorMessage;
        Session["ErrorBackNavURL"] = backNavUrl;
        ActiveForm = ErrorForm;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Id"] == null)
        {
            RedirectToMobilePage("Default.aspx");
        }
    }

    protected void ErrorForm_Activate(object sender, EventArgs e)
    {
        if ((Session["ErrorMessage"] != null) && ((string)Session["ErrorMessage"] != string.Empty))
        {
            lblErrorMessage.Text = (string)Session["ErrorMessage"];
        }

        if ((Session["ErrorBackNavURL"] != null) && ((string)Session["ErrorBackNavURL"] != string.Empty))
        {
            lnkBack4.NavigateUrl = "#" + (string)Session["ErrorBackNavURL"];
        }
    }

    protected void CategoryListForm_Activate(object sender, EventArgs e)
    {
        OnlineStoreDataSet.CategoryDataTable catTbl = new OnlineStoreDataSet.CategoryDataTable();
        OnlineStoreDataSetTableAdapters.CategoryTableAdapter catAdapter = new CategoryTableAdapter();
        catAdapter.Fill(catTbl);
        oLstCategories.DataSource = catTbl;
        oLstCategories.DataBind();

        oLstProduct.Items.Clear();
    }

    protected void cmdAddCategory_Click(object sender, EventArgs e)
    {
        Session["Cat_Id"] = -1;//New Category

        txtCat_Name.Text = "";
        txtCat_Description.Text = "";

        ActiveForm = CategoryForm;
    }

    protected void oLstCategories_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Session["Cat_Id"] = e.ListItem["Cat_Id"];
            ActiveForm = CategoryForm;
        }
    }

    protected void CategoryForm_Activate(object sender, EventArgs e)
    {
        if (Session["Cat_Id"] == null)
        {
            ShowErrorForm("Session variable not found", ActiveForm.ID);
            return;
        }

        if (Convert.ToInt32(Session["Cat_Id"]) == -1)
        {
            //New Category
            llbCategoryTitle.Text = "’‰› ÃœÌœ";

            txtCat_Name.Text = string.Empty;
            txtCat_Description.Text = string.Empty;

        }
        else
        {
            llbCategoryTitle.Text = "„⁄·Ê„«  «·’‰›";


            OnlineStoreDataSet.CategoryDataTable tbl = new OnlineStoreDataSet.CategoryDataTable();
            CategoryTableAdapter adapter = new CategoryTableAdapter();
            adapter.FillByCategory(tbl, Convert.ToInt32(Session["Cat_Id"]));
            if (tbl.Rows.Count > 0)
            {
                OnlineStoreDataSet.CategoryRow dr = tbl[0];
                txtCat_Name.Text = dr.Cat_Name;
                txtCat_Description.Text = dr.Cat_Description;
            }

        }
    }

    protected void cmdSaveCategory_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if (Session["Cat_Id"] == null)
            return;

        OnlineStoreDataSet.CategoryDataTable tbl = new OnlineStoreDataSet.CategoryDataTable();
        CategoryTableAdapter adapter = new CategoryTableAdapter();
        OnlineStoreDataSet.CategoryRow dr;

        if (Convert.ToInt32(Session["Cat_Id"]) == -1)
        {
            //New Category
            dr = tbl.NewCategoryRow();
        }
        else
        {
            adapter.FillByCategory(tbl, Convert.ToInt32(Session["Cat_Id"]));

            if (tbl.Rows.Count == 0)
                return;

            dr = tbl[0];    
        }

        dr.Cat_Name = txtCat_Name.Text;
        dr.Cat_Description = txtCat_Description.Text;

        if (dr.RowState == DataRowState.Detached)
            tbl.AddCategoryRow(dr);

        try
        {
            adapter.Update(tbl);
        }
        catch
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }

        CheckCacheCategory();

        ActiveForm = CategoryListForm;
    }

    protected void ProductListForm_Activate(object sender, EventArgs e)
    {
        OnlineStoreDataSet.CategoryDataTable catTbl = new OnlineStoreDataSet.CategoryDataTable();
        CategoryTableAdapter catAdapter = new CategoryTableAdapter();
        catAdapter.Fill(catTbl);
        slstProdListCats.DataSource = catTbl;
        slstProdListCats.DataBind();

        lblCatListCount.Text = string.Format("⁄œœ «·”Ã·«  {0}", catTbl.Count);

        cmdGetCatProds_Click(sender, new EventArgs());

    }

    protected void cmdAddProduct_Click(object sender, EventArgs e)
    {
        Session["Prod_Id"] = -1; //New Product

        txtProd_Name.Text = "";
        txtProd_Decription.Text = "";
        txtPrice.Text = "";
        slstProdCat.SelectedIndex = slstProdListCats.SelectedIndex;
        txtImage_File_Name.Text = "";
        imgProductImage.ImageUrl = "";

        lnkProcutSizes.Text = "«·√ÕÃ«„";
        lnkProcutColors.Text = "«·√·Ê«‰";

        ActiveForm = ProductForm;
    }

    protected void OLstProduct_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Session["Prod_Id"] = e.ListItem["Prod_Id"];
            ActiveForm = ProductForm;
        }
    }



    protected void cusVCat_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (slstProdCat.SelectedIndex < 0)
            args.IsValid = false;
    }

    protected void cmdGetCatProds_Click(object sender, EventArgs e)
    {
        if (slstProdListCats.SelectedIndex >= 0)
        {
            OnlineStoreDataSet.ProductDataTable prodTbl = new OnlineStoreDataSet.ProductDataTable();
            ProductTableAdapter prodAdapter = new ProductTableAdapter();
            prodAdapter.FillByCategory(prodTbl, Convert.ToInt32(slstProdListCats.Items[slstProdListCats.SelectedIndex].Value));
            oLstProduct.DataSource = prodTbl;
            oLstProduct.DataBind();

            lblProdListCount.Text = string.Format("⁄œœ «·”Ã·«  {0}", prodTbl.Count);
        }
        else
        {
            oLstProduct.Items.Clear();
            lblProdListCount.Text = string.Format("⁄œœ «·”Ã·«  {0}", 0);
        }

    }
    protected void ProductForm_Activate(object sender, EventArgs e)
    {
        if (Session["Prod_Id"] == null)
        {
            ShowErrorForm("Session variable not found", ActiveForm.ID);
            return;
        }

        OnlineStoreDataSet.CategoryDataTable catTbl = new OnlineStoreDataSet.CategoryDataTable();
        CategoryTableAdapter catAdapter = new CategoryTableAdapter();
        catAdapter.Fill(catTbl);
        slstProdCat.DataSource = catTbl;
        slstProdCat.DataBind();

        
        if (Convert.ToInt32(Session["Prod_Id"]) == -1)
        {
            //New Product
            lblProductTitle.Text = "„«œ… ÃœÌœ…";
        }
        else
        {
            lblProductTitle.Text = "„⁄·Ê„«  «·„«œ…";

            int pId = Convert.ToInt32(Session["Prod_Id"]);

            OnlineStoreDataSet.ProductDataTable prodTbl = new OnlineStoreDataSet.ProductDataTable();
            ProductTableAdapter prodAdapter = new ProductTableAdapter();
            prodAdapter.FillByProduct(prodTbl, pId);
            if (prodTbl.Rows.Count > 0)
            {
                OnlineStoreDataSet.ProductRow dr = prodTbl[0];
                txtProd_Name.Text = dr.Prod_Name;
                txtProd_Decription.Text = dr.Prod_Description;
                txtPrice.Text = dr.Price.ToString();
                if ((!dr.IsImage_File_NameNull()) && (dr.Image_File_Name.Trim() != ""))
                {
                    txtImage_File_Name.Text = dr.Image_File_Name;
                    imgProductImage.ImageUrl = @"~\Images\" + dr.Image_File_Name;
                }
                else
                {
                    txtImage_File_Name.Text = "";
                    imgProductImage.ImageUrl = "";
                }

                for (int i = 0; i<=slstProdCat.Items.Count-1;i++)
                {
                    if (Convert.ToInt32(slstProdCat.Items[i].Value) == dr.Cat_Id)
                    {
                        slstProdCat.SelectedIndex = i;
                        break;
                    }
                }

                string pSizes = string.Empty;
                string pColors = string.Empty;

                OnlineStoreDataSet.Product_SizeDataTable sizeTbl = new OnlineStoreDataSet.Product_SizeDataTable();
                Product_SizeTableAdapter sizeAdapter = new Product_SizeTableAdapter();
                sizeAdapter.FillByProduct(sizeTbl, pId);

                OnlineStoreDataSet.Product_ColorDataTable colorTbl = new OnlineStoreDataSet.Product_ColorDataTable();
                Product_ColorTableAdapter colorAdapter = new Product_ColorTableAdapter();
                colorAdapter.FillByProduct(colorTbl, pId);


                foreach (OnlineStoreDataSet.Product_SizeRow sdr in sizeTbl)
                    pSizes += (pSizes==string.Empty? sdr.Size_Name: ", "+sdr.Size_Name);
                lnkProcutSizes.Text = (pSizes == string.Empty ? "«·√ÕÃ«„" : "«·√ÕÃ«„ : " + pSizes);

                foreach (OnlineStoreDataSet.Product_ColorRow cdr in colorTbl)
                    pColors += (pColors == string.Empty ? cdr.Color_Name : ", " + cdr.Color_Name);
                lnkProcutColors.Text = (pColors == string.Empty ? "«·√·Ê«‰" : "«·√·Ê«‰ : " + pColors);
            }
        }
    }

    protected void cmdSaveProduct_ItemCommand(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "SecondarySave")
        {
            reqVProd_Name.Validate();
            cusVCat.Validate();
            reqVPrice.Validate();
            cmpVPrice.Validate();
            rngVPrice.Validate();
        }

        // Checking Page.IsValid with each validator because we have 2 save buttons one of them in an other form than validators
        if ((!Page.IsValid)
            ||(! reqVProd_Name.IsValid)
            ||(! cusVCat.IsValid)
            ||(! reqVPrice.IsValid)
            ||(! cmpVPrice.IsValid)
            ||(! rngVPrice.IsValid))

        {
            if (e.CommandName == "SecondarySave")
                ActiveForm = ProductForm;

            return;
        }

        if (Session["Prod_Id"] == null)
            return;

        OnlineStoreDataSet.ProductDataTable tbl = new OnlineStoreDataSet.ProductDataTable();
        ProductTableAdapter adapter = new ProductTableAdapter();
        OnlineStoreDataSet.ProductRow dr;

        if (Convert.ToInt32(Session["Prod_Id"]) == -1)
        {
            //New Product
            dr = tbl.NewProductRow();            
        }
        else
        {
            adapter.FillByProduct(tbl, Convert.ToInt32(Session["Prod_Id"]));
            if (tbl.Rows.Count == 0)
                return;
            dr = tbl[0];
        }

        dr.Prod_Name = txtProd_Name.Text;
        dr.Prod_Description = txtProd_Decription.Text;
        dr.Cat_Id = Convert.ToInt32(slstProdCat.Items[slstProdCat.SelectedIndex].Value);
        dr.Price = Convert.ToDecimal(txtPrice.Text);
        dr.Image_File_Name = txtImage_File_Name.Text;

        if (dr.RowState == DataRowState.Detached)
            tbl.AddProductRow(dr);

        try
        {
            adapter.Update(tbl);
        }
        catch
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }

        Session["Prod_Id"] = dr.Prod_Id;

        CheckCacheProduct();

        if (e.CommandName == "PrimarySave")
        {
            ActiveForm = ProductListForm;
        }
        else if (e.CommandName == "SecondarySave")
        {
            if (Session["ProductSaveForwardForm"] != null)
                ActiveForm = GetForm((string)Session["ProductSaveForwardForm"]);
            else
                ActiveForm = ProductListForm;
        }
    }

    protected void ProductSizeForm_Activate(object sender, EventArgs e)
    {
        if ((Session["Prod_Id"] != null) && ((Convert.ToInt32(Session["Prod_Id"]) == -1)))
        {
            Session["ProductSaveForwardForm"] = ProductSizeForm.ID;
            ActiveForm = SaveProductForm;
        }
        else
        {
            OnlineStoreDataSet.ProductDataTable prodTbl = new OnlineStoreDataSet.ProductDataTable();
            ProductTableAdapter prodAdapter = new ProductTableAdapter();
            prodAdapter.FillByProduct(prodTbl, Convert.ToInt32(Session["Prod_Id"]));
            lblProductSizeTitle.Text = "√ÕÃ«„ «·„«œ…  "+prodTbl[0].Prod_Name;


            FillProductSizes();
        }
    }

    private void FillProductSizes()
    {
        if (Session["Prod_Id"] == null) 
            return;

        OnlineStoreDataSet.Product_SizeDataTable sizeTbl = new OnlineStoreDataSet.Product_SizeDataTable();
        Product_SizeTableAdapter sizeAdapter = new Product_SizeTableAdapter();
        sizeAdapter.FillByProduct(sizeTbl, Convert.ToInt32(Session["Prod_Id"]));
        oLstProdSizes.DataSource = sizeTbl;
        oLstProdSizes.DataBind();
    }

    protected void cmdProdSizeAdd_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if ((Session["Prod_Id"] != null) && ((Convert.ToInt32(Session["Prod_Id"]) > 0)))
        {
            int prodId = Convert.ToInt32(Session["Prod_Id"]);

            OnlineStoreDataSet.Product_SizeDataTable sizeTbl = new OnlineStoreDataSet.Product_SizeDataTable();
            Product_SizeTableAdapter sizeAdapter = new Product_SizeTableAdapter();
            OnlineStoreDataSet.Product_SizeRow dr = sizeTbl.NewProduct_SizeRow();
            dr.Prod_Id = prodId;
            dr.Size_Name = txtSize_Name.Text;
            sizeTbl.AddProduct_SizeRow(dr);

            try
            {
                sizeAdapter.Update(sizeTbl);
            }
            catch 
            {
                ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
                return;
            }


            FillProductSizes();
            txtSize_Name.Text = "";
        }
    }

    protected void oLstProdSizes_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            if ((e.ListItem["Prod_Size_Id"] != null) && ((e.ListItem["Prod_Size_Id"] != string.Empty)))
            {
                Session["Prod_Size_Id"] = e.ListItem["Prod_Size_Id"];
                Session["Prod_Size_Name"] = e.ListItem["Size_Name"];
                ActiveForm = EditProdSizeForm;
            }

        }
        else if (e.CommandName == "Delete")
        {
            if ((e.ListItem["Prod_Size_Id"] != null) && ((e.ListItem["Prod_Size_Id"] != string.Empty)))
            {
                OnlineStoreDataSet.Product_SizeDataTable sizeTbl = new OnlineStoreDataSet.Product_SizeDataTable();
                Product_SizeTableAdapter sizeAdapter = new Product_SizeTableAdapter();

                try
                {
                    sizeAdapter.DeleteProdduct_Size(Convert.ToInt32(e.ListItem["Prod_Size_Id"]));
                }
                catch 
                {
                    ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «·Õ–›", ActiveForm.ID);
                }

                
                FillProductSizes();
                ActiveForm = ProductSizeForm;
            }
        }
    }
    protected void EditProdSizeForm_Activate(object sender, EventArgs e)
    {
        if (Session["Prod_Size_Name"] != null)
        {
            txtEditSize_Name.Text = (string)Session["Prod_Size_Name"];
        }
    }
    protected void cmdEditProdSizeSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if (Session["Prod_Size_Id"] == null)
            return;



        OnlineStoreDataSet.Product_SizeDataTable sizeTbl = new OnlineStoreDataSet.Product_SizeDataTable();
        Product_SizeTableAdapter sizeAdapter = new Product_SizeTableAdapter();

        try
        {
            sizeAdapter.FillBySize(sizeTbl, Convert.ToInt32(Session["Prod_Size_Id"]));
        }
        catch 
        {
            ShowErrorForm("Œÿ√ √À‰«¡  ⁄»∆… «·»Ì«‰« ", ActiveForm.ID);
            return;
        }

        if (sizeTbl.Rows.Count == 0)
            return;

        sizeTbl[0].Size_Name = txtEditSize_Name.Text;

        try
        {
            sizeAdapter.Update(sizeTbl);
        }
        catch 
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }

        CheckCacheProductSize();

        ActiveForm = ProductSizeForm;

    }



    protected void ProductColorForm_Activate(object sender, EventArgs e)
    {
        if ((Session["Prod_Id"] != null) && ((Convert.ToInt32(Session["Prod_Id"]) == -1)))
        {
            Session["ProductSaveForwardForm"] = ProductColorForm.ID;
            ActiveForm = SaveProductForm;
        }
        else
        {
            OnlineStoreDataSet.ProductDataTable prodTbl = new OnlineStoreDataSet.ProductDataTable();
            ProductTableAdapter prodAdapter = new ProductTableAdapter();
            prodAdapter.FillByProduct(prodTbl, Convert.ToInt32(Session["Prod_Id"]));
            lblProductColorTitle.Text = "√·Ê«‰ «·„«œ…  " + prodTbl[0].Prod_Name;

            FillProductColors();
        }
    }

    private void FillProductColors()
    {
        if (Session["Prod_Id"] == null)
            return;

        OnlineStoreDataSet.Product_ColorDataTable colorTbl = new OnlineStoreDataSet.Product_ColorDataTable();
        Product_ColorTableAdapter colorAdapter = new Product_ColorTableAdapter();
        colorAdapter.FillByProduct(colorTbl, Convert.ToInt32(Session["Prod_Id"]));
        oLstProdColors.DataSource = colorTbl;
        oLstProdColors.DataBind();
    }

    protected void cmdProdColorAdd_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if ((Session["Prod_Id"] != null) && ((Convert.ToInt32(Session["Prod_Id"]) > 0)))
        {
            int prodId = Convert.ToInt32(Session["Prod_Id"]);

            OnlineStoreDataSet.Product_ColorDataTable colorTbl = new OnlineStoreDataSet.Product_ColorDataTable();
            Product_ColorTableAdapter colorAdapter = new Product_ColorTableAdapter();
            OnlineStoreDataSet.Product_ColorRow dr = colorTbl.NewProduct_ColorRow();
            dr.Prod_Id = prodId;
            dr.Color_Name = txtColor_Name.Text;
            colorTbl.AddProduct_ColorRow(dr);

            try
            {
                colorAdapter.Update(colorTbl);
            }
            catch 
            {
                ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
                return;
            }

            

            FillProductColors();

            txtColor_Name.Text = "";
        }
    }

    protected void oLstProdColors_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            if ((e.ListItem["Prod_Color_Id"] != null) && ((e.ListItem["Prod_Color_Id"] != string.Empty)))
            {
                Session["Prod_Color_Id"] = e.ListItem["Prod_Color_Id"];
                Session["Prod_Color_Name"] = e.ListItem["Color_Name"];
                ActiveForm = EditProdColorForm;
            }

        }
        else if (e.CommandName == "Delete")
        {
            if ((e.ListItem["Prod_Color_Id"] != null) && ((e.ListItem["Prod_Color_Id"] != string.Empty)))
            {
                OnlineStoreDataSet.Product_ColorDataTable colorTbl = new OnlineStoreDataSet.Product_ColorDataTable();
                Product_ColorTableAdapter colorAdapter = new Product_ColorTableAdapter();
                colorAdapter.DeleteProduct_Color(Convert.ToInt32(e.ListItem["Prod_Color_Id"]));
                FillProductColors();
                ActiveForm = ProductColorForm;
            }
        }
    }
    protected void EditProdColorForm_Activate(object sender, EventArgs e)
    {
        if (Session["Prod_Color_Name"] != null)
        {
            txtEditColor_Name.Text = (string)Session["Prod_Color_Name"];
        }
    }
    protected void cmdEditProdColorSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if (Session["Prod_Color_Id"] == null)
            return;

        OnlineStoreDataSet.Product_ColorDataTable colorTbl = new OnlineStoreDataSet.Product_ColorDataTable();
        Product_ColorTableAdapter colorAdapter = new Product_ColorTableAdapter();
        colorAdapter.FillByColor(colorTbl, Convert.ToInt32(Session["Prod_Color_Id"]));

        if (colorTbl.Rows.Count == 0)
            return;

        colorTbl[0].Color_Name = txtEditColor_Name.Text;

        try
        {
            colorAdapter.Update(colorTbl);
        }
        catch 
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }
       

        CheckCacheProductColor();

        ActiveForm = ProductColorForm;
    }

    protected void cmdDisplayOrders_Click(object sender, EventArgs e)
    {
        OnlineStoreDataSet.OrderDataTable orderTbl = new OnlineStoreDataSet.OrderDataTable();
        OrderTableAdapter orderAdapter = new OrderTableAdapter();
        orderAdapter.FillByDisplayAllOrders(orderTbl, txtDisplayOrders_Order_Name.Text, txtDisplayOrders_Country.Text, txtDisplayOrders_City.Text);
        oLstAllOrders.DataSource = orderTbl;
        oLstAllOrders.DataBind();
        lblDisplayAllOrdersCount.Text = string.Format("⁄œœ «·”Ã·«  {0}", orderTbl.Rows.Count.ToString());
    }
    protected void CleanCardsForm_Activate(object sender, EventArgs e)
    {
        CardsTableAdapter cardsAdapter = new CardsTableAdapter();
        lblAllCards.Text = "≈Ã„«·Ì «·»ÿ«ﬁ«  " + cardsAdapter.GetAllCardsCount().ToString();
        lblSubmittedCards.Text = "≈Ã„«·Ì «·»ÿ«ﬁ«  «·„À» … " + cardsAdapter.GetSubmittedCardsCount().ToString();
        lblOldUnSubmittedCards.Text = "≈Ã„«·Ì «·»ÿ«ﬁ«  €Ì— «·„À» … «·ﬁœÌ„… " + cardsAdapter.GetUnSubmittedCardsCountBeforeDate(DateTime.Now.AddDays(-7)).ToString();
        lblNewUnSubmittedCards.Text = "≈Ã„«·Ì «·»ÿ«ﬁ«  €Ì— «·„À» … «·ÕœÌÀ… " + cardsAdapter.GetUnSubmittedCardsCountAfterDate(DateTime.Now.AddDays(-7)).ToString();
    }

    protected void cmdCleanOldCards_Click(object sender, EventArgs e)
    {
        using (TransactionScope scope = new TransactionScope())
        {
            Card_DetailTableAdapter cardDetailAdapter = new Card_DetailTableAdapter();
            cardDetailAdapter.DeleteCardDetailsBeforeDate(DateTime.Now.AddDays(-7));
            CardsTableAdapter cardsAdapter = new CardsTableAdapter();
            cardsAdapter.DeleteCardsBeforeDate(DateTime.Now.AddDays(-7));

            scope.Complete();

        }

        CleanCardsForm_Activate(sender, new EventArgs());
    }

    protected void cmdLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("User_Id");
        RedirectToMobilePage("Default.aspx");
        
    }
    protected void oLstAllOrders_ItemDataBind(object sender, ObjectListDataBindEventArgs e)
    {
        e.ListItem["Order_Summary"] = string.Format("{0} - {1} »ﬁÌ„… {2}  «—ÌŒ {3}", 
            e.ListItem["Order_Id"], e.ListItem["Order_Name"], e.ListItem["Order_Total"], DateTime.Parse(e.ListItem["Order_Date"]).ToShortDateString());

        
        
    }
    protected void cmdDisplayProductImage_Click(object sender, EventArgs e)
    {
        if (txtImage_File_Name.Text.Trim() != "")
            imgProductImage.ImageUrl = @"~\Images\" + txtImage_File_Name.Text;
        else
            imgProductImage.ImageUrl = string.Empty;
    }

}
