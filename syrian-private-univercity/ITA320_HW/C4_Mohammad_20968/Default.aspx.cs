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
using System.Web.Caching;
using System.Transactions;
using OnlineStoreDataSetTableAdapters;

public partial class _Default : System.Web.UI.MobileControls.MobilePage
{
    private void FillCategory()
    {
        OnlineStoreDataSet.CategoryDataTable tblCat = new OnlineStoreDataSet.CategoryDataTable();
        CategoryTableAdapter adapter = new CategoryTableAdapter();
        adapter.Fill(tblCat);
        Cache["Category"] = tblCat;
    }

    private void FillProduct()
    {
        OnlineStoreDataSet.ProductDataTable tblProd = new OnlineStoreDataSet.ProductDataTable();
        ProductTableAdapter adapter = new ProductTableAdapter();
        adapter.Fill(tblProd);
        Cache["Product"] = tblProd;
    }

    private void FillProductSize()
    {
        OnlineStoreDataSet.Product_SizeDataTable tblProdSize = new OnlineStoreDataSet.Product_SizeDataTable();
        Product_SizeTableAdapter adapter = new Product_SizeTableAdapter();
        adapter.Fill(tblProdSize);
        Cache["Product_Size"] = tblProdSize;
    }

    private void FillProductColor()
    {
        OnlineStoreDataSet.Product_ColorDataTable tblProdColor = new OnlineStoreDataSet.Product_ColorDataTable();
        Product_ColorTableAdapter adapter = new Product_ColorTableAdapter();
        adapter.Fill(tblProdColor);
        Cache["Product_Color"] = tblProdColor;
    }


    private void ShowErrorForm(string errorMessage, string backNavUrl)
    {
        Session["ErrorMessage"] = errorMessage;
        Session["ErrorBackNavURL"] = backNavUrl;
        ActiveForm = ErrorForm;
    }

    private void ShowInfoForm(string infoMessage, string backNavUrl)
    {
        Session["InfoMessage"] = infoMessage;
        Session["InfoBackNavURL"] = backNavUrl;
        ActiveForm = InfoForm;
    }

    private void DisplayCard(int cardId)
    {
        if (cardId == 0)
            return;

        OnlineStoreDataSet.CardsDataTable cardTbl = new OnlineStoreDataSet.CardsDataTable();
        CardsTableAdapter cardAdapter = new CardsTableAdapter();
        cardAdapter.FillByCard(cardTbl, cardId);

        if (cardTbl.Rows.Count == 0)
            return;

        lblCardNum.Text = cardTbl[0].Card_Id.ToString();
        lblCardCreateDate.Text = cardTbl[0].Create_Date.ToString();
        lblCardTotal.Text = cardTbl[0].Card_Total.ToString();

        OnlineStoreDataSet.Card_Detail_ViewDataTable cardDetailTbl = new OnlineStoreDataSet.Card_Detail_ViewDataTable();
        Card_Detail_ViewTableAdapter cardDetailAdapter = new Card_Detail_ViewTableAdapter();
        cardDetailAdapter.FillByCard(cardDetailTbl, cardId);
   
        oLstCardProducts.DataSource = cardDetailTbl;
        oLstCardProducts.DataBind();

        ActiveForm = CardForm;
    }

    private void AddNewCard()
    {
        int cardId = 0;
        OnlineStoreDataSet.CardsDataTable cardTbl = new OnlineStoreDataSet.CardsDataTable();
        CardsTableAdapter cardAdapter = new CardsTableAdapter();
        OnlineStoreDataSet.CardsRow dr = cardTbl.NewCardsRow();
        dr.Create_Date = DateTime.Now;
        dr.Card_Total = 0;
        dr.Session_Id = Session.SessionID;

        cardTbl.AddCardsRow(dr);

        try
        {
            cardAdapter.Update(cardTbl);
        }
        catch 
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }

        
        cardId = dr.Card_Id;

        DisplayCard(cardId);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Cache["Category"] == null)
                FillCategory();

            if (Cache["Product"] == null)
                FillProduct();

            if (Cache["Product_Size"] == null)
                FillProductSize();

            if (Cache["Product_Color"] == null)
                FillProductColor();
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

    protected void InfoForm_Activate(object sender, EventArgs e)
    {
        if ((Session["InfoMessage"] != null) && ((string)Session["InfoMessage"] != string.Empty))
        {
            lblInfoMessage.Text = (string)Session["InfoMessage"];
        }

        if ((Session["InfoBackNavURL"] != null) && ((string)Session["InfoBackNavURL"] != string.Empty))
        {
            lnkBack4.NavigateUrl = "#" + (string)Session["InfoBackNavURL"];
        }
    }


    protected void cmdAdminLog_Click(object sender, EventArgs e)
    {
        ActiveForm = LoginForm;
    }

    protected void cmdLogin_Click(object sender, EventArgs e)
    {
        OnlineStoreDataSet.UserDataTable userTbl = new OnlineStoreDataSet.UserDataTable();
        UserTableAdapter userAdapter = new UserTableAdapter();
        userAdapter.FillByUserNameAndPassword(userTbl, txtUserName.Text, txtPassword.Text);
        if (userTbl.Rows.Count > 0)
        {
            Session["User_Id"] = userTbl[0].User_Id;
            RedirectToMobilePage("Admin.aspx");
        }
        else
        {
            ShowErrorForm("Œÿ√ ›Ì «”„ «·„” Œœ„ √Ê ﬂ·„… «·”—", LoginForm.ID); 
        }
    }

    protected void CategoryListForm_Activate(object sender, EventArgs e)
    {
        if (Cache["Category"] == null)
            return;

        OnlineStoreDataSet.CategoryDataTable catTbl = (OnlineStoreDataSet.CategoryDataTable)Cache["Category"];
        oLstCategories.DataSource = catTbl;
        oLstCategories.DataBind();
    }
    protected void oLstCategories_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "DisplayProducts")
        {
            Session["Cat_Id"] = e.ListItem["Cat_Id"];
            ActiveForm = ProductListForm;
        }
    }
    protected void ProductListForm_Activate(object sender, EventArgs e)
    {
        int cId = 0;
        if (Session["Cat_Id"] != null)
            cId = Convert.ToInt32(Session["Cat_Id"]);

        OnlineStoreDataSet.CategoryDataTable catTbl = (OnlineStoreDataSet.CategoryDataTable)Cache["Category"];
        slstProdListCats.DataSource = catTbl;
        slstProdListCats.DataBind();


        if (cId > 0)
        {
            for (int i = 0; i <= slstProdListCats.Items.Count - 1; i++)
            {
                if (Convert.ToInt32(slstProdListCats.Items[i].Value) == cId)
                {
                    slstProdListCats.SelectedIndex = i;

                    OnlineStoreDataSet.ProductDataTable prodTbl = (OnlineStoreDataSet.ProductDataTable)Cache["Product"];
                    lstCatProducts.DataSource = prodTbl.Select(string.Format("Cat_Id = {0}", cId));
                    lstCatProducts.DataBind();

                    break;
                }
            }
        }

    }

    protected void cmdGetCatProds_Click(object sender, EventArgs e)
    {
        int cId = 0;
        if (slstProdListCats.SelectedIndex >= 0)
        {
            cId = Convert.ToInt32(slstProdListCats.Items[slstProdListCats.SelectedIndex].Value);
        }

        if (cId > 0)
        {
            for (int i = 0; i <= slstProdListCats.Items.Count - 1; i++)
            {
                if (Convert.ToInt32(slstProdListCats.Items[i].Value) == cId)
                {
                    slstProdListCats.SelectedIndex = i;

                    OnlineStoreDataSet.ProductDataTable prodTbl = (OnlineStoreDataSet.ProductDataTable)Cache["Product"];
                    lstCatProducts.DataSource = prodTbl.Select(string.Format("Cat_Id = {0}", cId));
                    lstCatProducts.DataBind();

                    break;
                }
            }
        }
    }

    protected void lstCatProducts_ItemCommand(object sender, ListCommandEventArgs e)
    {
        Session["Prod_Id"] = e.ListItem.Value;
        ActiveForm = ProductCardForm;
    }

    protected void oLstCardProducts_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "DisplayProduct")
        {
            Session["Card_Id"] = int.Parse(lblCardNum.Text);
            Session["Card_Detail_Id"] = int.Parse(e.ListItem["Card_Detail_Id"]);
            Session["Card_Prod_Id"] = int.Parse(e.ListItem["Prod_Id"]);

            ActiveForm = CardDetailForm;
        }
        else if (e.CommandName == "Delete")
        {
            Session["Delete_Rec_Kind"] = "Card_Detail_Id";
            Session["Delete_Rec_Back"] = ActiveForm.ID;
            Session["Card_Id"] = int.Parse(lblCardNum.Text);
            Session["Card_Detail_Id"] = int.Parse(e.ListItem["Card_Detail_Id"]);

            ActiveForm = ConfirmDeleteForm;
        }
    }
    protected void ProductCardForm_Activate(object sender, EventArgs e)
    {
        if (Session["Prod_Id"] == null)
            return;

        int pId = Convert.ToInt32(Session["Prod_Id"]);

        OnlineStoreDataSet.ProductDataTable prodTbl = (OnlineStoreDataSet.ProductDataTable)Cache["Product"];
        DataRow[] prds = prodTbl.Select(string.Format("Prod_Id = {0}", pId));

        if ((prds == null) || (prds.Length == 0))
            return;

        OnlineStoreDataSet.ProductRow dr = (OnlineStoreDataSet.ProductRow)prds[0];

        lblProductCardProductName.Text = dr.Prod_Name;
        lblProductCardProductDesc.Text = dr.Prod_Description;
        lblProuctCardPrice.Text = dr.Price.ToString();

        if ((!dr.IsImage_File_NameNull()) && (dr.Image_File_Name.Trim() != ""))
            imgProductCardImage.ImageUrl = @"~\Images\" + dr.Image_File_Name;
        else
            imgProductCardImage.ImageUrl = "";

        OnlineStoreDataSet.Product_SizeDataTable sizeTbl = (OnlineStoreDataSet.Product_SizeDataTable)Cache["Product_Size"];
        lstProductCardSize.DataSource = sizeTbl.Select(string.Format("Prod_Id = {0}", pId));
        lstProductCardSize.DataBind();

        OnlineStoreDataSet.Product_ColorDataTable colorTbl = (OnlineStoreDataSet.Product_ColorDataTable)Cache["Product_Color"];
        lstProductCardColor.DataSource = colorTbl.Select(string.Format("Prod_Id = {0}", pId));
        lstProductCardColor.DataBind();
    }

    protected void CardDetailForm_Activate(object sender, EventArgs e)
    {
        int prodId = Convert.ToInt32(Session["Card_Prod_Id"]);

        OnlineStoreDataSet.ProductDataTable prodTbl = (OnlineStoreDataSet.ProductDataTable)Cache["Product"];
        OnlineStoreDataSet.Product_SizeDataTable prodSizeTbl = (OnlineStoreDataSet.Product_SizeDataTable)Cache["Product_Size"];
        OnlineStoreDataSet.Product_ColorDataTable prodColorTbl = (OnlineStoreDataSet.Product_ColorDataTable)Cache["Product_Color"];

        OnlineStoreDataSet.ProductRow pDr = prodTbl.FindByProd_Id(prodId);

        if (pDr == null)
            return;

        DataRow[] psDrs = prodSizeTbl.Select(string.Format("Prod_Id = {0}", prodId));
        DataRow[] pcDrs = prodColorTbl.Select(string.Format("Prod_Id = {0}", prodId));

        lblCardDetailProdName.Text = pDr.Prod_Name;
        lblCardDetailDescription.Text = pDr.Prod_Description;
        lblCardDetailPrice.Text = pDr.Price.ToString();

        if ((!pDr.IsImage_File_NameNull()) && (pDr.Image_File_Name.Trim() != ""))
            imgCardDetailImgage.ImageUrl = @"~\Images\" + pDr.Image_File_Name;
        else
            imgCardDetailImgage.ImageUrl = "";

        slstCardDetailSize.DataSource = psDrs;
        slstCardDetailSize.DataBind();
        slstCardDetailColor.DataSource = pcDrs;
        slstCardDetailColor.DataBind();
       
        OnlineStoreDataSet.Card_DetailDataTable cardDetailTbl = new OnlineStoreDataSet.Card_DetailDataTable();
        Card_DetailTableAdapter cardDetailAdapter = new Card_DetailTableAdapter();
        cardDetailAdapter.FillByCardDetail(cardDetailTbl, Convert.ToInt32(Session["Card_Detail_Id"]));

        if (cardDetailTbl.Rows.Count == 0)
            return;
        OnlineStoreDataSet.Card_DetailRow detailDr = cardDetailTbl[0];
        txtCardDetailQty.Text = detailDr.Qty.ToString();

        if (!detailDr.IsProd_Size_IdNull())
        {
            for (int i = 0; i <= slstCardDetailSize.Items.Count - 1; i++)
            {
                if (detailDr.Prod_Size_Id == int.Parse(slstCardDetailSize.Items[i].Value))
                {
                    slstCardDetailSize.SelectedIndex = i;
                    break;
                }
            }
        }

        if (!detailDr.IsProd_Color_IdNull())
        {
            for (int i = 0; i <= slstCardDetailColor.Items.Count - 1; i++)
            {
                if (detailDr.Prod_Color_Id == int.Parse(slstCardDetailColor.Items[i].Value))
                {
                    slstCardDetailColor.SelectedIndex = i;
                    break;
                }
            }
        }
    }

    protected void cmdSaveCardDetail_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        OnlineStoreDataSet.Card_DetailDataTable cardDetailTbl = new OnlineStoreDataSet.Card_DetailDataTable();
        Card_DetailTableAdapter cardDetailAdapter = new Card_DetailTableAdapter();
        OnlineStoreDataSet.Card_DetailRow cardDetailDr;

        int cardId = Convert.ToInt32(Session["Card_Id"]);
        int cardDetailId = Convert.ToInt32(Session["Card_Detail_Id"]);
        int prodId = Convert.ToInt32(Session["Card_Prod_Id"]);
        int qty = int.Parse(txtCardDetailQty.Text);
        decimal price = decimal.Parse(lblCardDetailPrice.Text);
        int prodSizeId = 0;
        if (slstCardDetailSize.SelectedIndex >= 0)
            prodSizeId = Convert.ToInt32(slstCardDetailSize.Selection.Value);
        int prodColorId = 0;
        if (slstCardDetailColor.SelectedIndex >= 0)
            prodColorId = Convert.ToInt32(slstCardDetailColor.Selection.Value);

        //if (cardDetailId == -1)
        //{
        //    //User requested a new card

        //    cardDetailAdapter.FillByCardProductSizeColor(cardDetailTbl, cardId, prodId, prodSizeId, prodColorId);

        //    if (cardDetailTbl.Rows.Count > 0)
        //    {
        //        // the product is already added to the card   
        //        cardDetailDr = cardDetailTbl[0];

        //        cardDetailDr.Qty += qty;
        //    }
        //    else
        //    {
        //        // New Record
        //        cardDetailDr = cardDetailTbl.NewCard_DetailRow();

        //        cardDetailDr.Card_Id = cardId;
        //        cardDetailDr.Prod_Id = prodId; 
        //        cardDetailDr.Qty = qty;

        //        if (prodSizeId == 0)
        //            cardDetailDr.SetProd_Size_IdNull();
        //        else
        //            cardDetailDr.Prod_Size_Id = prodSizeId;
        //        if (prodColorId == 0)
        //            cardDetailDr.SetProd_Color_IdNull();
        //        else
        //            cardDetailDr.Prod_Color_Id = prodColorId;

        //        cardDetailDr.Price = price;
        //    }
        //}
        //else
        {
            // Check if thers is a card details with the same prouct, size and color
            cardDetailAdapter.FillByCardProductSizeColor(cardDetailTbl, cardId, prodId, prodSizeId, prodColorId);
            if (cardDetailTbl.Rows.Count > 0)
            {
                if (cardDetailTbl[0].Card_Detail_Id != cardDetailId)
                {
                    ShowErrorForm("ÌÊÃœ ”Ã· ¬Œ— ··„«œ… »‰›” «·ÕÃ„ Ê«··Ê‰ , ·« Ì„ﬂ‰ ≈ „«„ «· ⁄œÌ·", CardDetailForm.ID);
                    return;
                }
            }

            // Edit Record
            cardDetailAdapter.FillByCardDetail(cardDetailTbl, cardDetailId);

            if (cardDetailTbl.Rows.Count == 0)
                return;

            cardDetailDr = cardDetailTbl[0];

            if (prodSizeId == 0)
                cardDetailDr.SetProd_Size_IdNull();
            else
                cardDetailDr.Prod_Size_Id = prodSizeId;
            if (prodColorId == 0)
                cardDetailDr.SetProd_Color_IdNull();
            else
                cardDetailDr.Prod_Color_Id = prodColorId;

            cardDetailDr.Qty = qty;
        }

        

        //if (cardDetailDr.RowState == DataRowState.Detached)
        //{
        //    // New Record
        //    cardDetailTbl.AddCard_DetailRow(cardDetailDr);
        //}

        try
        {
            cardDetailAdapter.Update(cardDetailTbl);
        }
        catch 
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }

        

        DisplayCard(cardId);
    }

    protected void cmdDeleteCardDetail_Click(object sender, EventArgs e)
    {
        Session["Delete_Rec_Kind"] = "Card_Detail_Id";
        Session["Delete_Rec_Back"] = ActiveForm.ID;

        ActiveForm = ConfirmDeleteForm;
    }

    protected void ConfirmDeleteForm_Activate(object sender, EventArgs e)
    {
        if (Session["Delete_Rec_Back"] != null)
        {
            lnkBack11.NavigateUrl = "#"+(string)Session["Delete_Rec_Back"];
        }
    }

    protected void cmdDoDelete_Click(object sender, EventArgs e)
    {
        if ((string)Session["Delete_Rec_Kind"] == "Card_Detail_Id")
        {
            Card_DetailTableAdapter detailAdapter = new Card_DetailTableAdapter();
            detailAdapter.Delete(Convert.ToInt32(Session["Card_Detail_Id"]));
            DisplayCard(Convert.ToInt32(Session["Card_Id"]));
        }

    }
    protected void cmdAddToCard_Click(object sender, EventArgs e)
    {
        ActiveForm = ProductPropertiesForm;
    }

    protected void ProductPropertiesForm_Activate(object sender, EventArgs e)
    {
        if (Session["Prod_Id"] == null)
            return;

        int pId = Convert.ToInt32(Session["Prod_Id"]);

        OnlineStoreDataSet.Product_SizeDataTable sizeTbl = (OnlineStoreDataSet.Product_SizeDataTable)Cache["Product_Size"];
        slstOneProductSize.DataSource = sizeTbl.Select(string.Format("Prod_Id = {0}", pId));
        slstOneProductSize.DataBind();

        OnlineStoreDataSet.Product_ColorDataTable colorTbl = (OnlineStoreDataSet.Product_ColorDataTable)Cache["Product_Color"];
        slstOneProductColor.DataSource = colorTbl.Select(string.Format("Prod_Id = {0}", pId));
        slstOneProductColor.DataBind();

        txtOneProductQty.Text = "1";
    }

    protected void cmdAddProductToCard_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        OnlineStoreDataSet.CardsDataTable cardTbl = new OnlineStoreDataSet.CardsDataTable();
        CardsTableAdapter cardsAdapter = new CardsTableAdapter();
        cardsAdapter.FillByActive(cardTbl, Session.SessionID);

        if (cardTbl.Rows.Count == 0)
        {
            // Add New Card

            OnlineStoreDataSet.CardsRow cDr = cardTbl.NewCardsRow();

            cDr.Create_Date = DateTime.Now;
            cDr.Card_Total = 0;
            cDr.Session_Id = Session.SessionID;

            cardTbl.AddCardsRow(cDr);

            try
            {
                cardsAdapter.Update(cardTbl);
            }
            catch
            {
                ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
                return;
            }


        }


        int cardId = cardTbl[0].Card_Id;

        OnlineStoreDataSet.Card_DetailDataTable cardDetailTbl = new OnlineStoreDataSet.Card_DetailDataTable();
        Card_DetailTableAdapter cardDetailAdapter = new Card_DetailTableAdapter();
        OnlineStoreDataSet.Card_DetailRow cardDetailDr;

        int prodId = Convert.ToInt32(Session["Prod_Id"]);

        OnlineStoreDataSet.ProductDataTable prodTbl = (OnlineStoreDataSet.ProductDataTable)Cache["Product"];
        DataRow[] pords = prodTbl.Select(string.Format("Prod_Id = {0}", prodId));

        if ((pords == null) || (pords.Length == 0))
            return;

        OnlineStoreDataSet.ProductRow pDr = (OnlineStoreDataSet.ProductRow)pords[0];

        decimal price = pDr.Price;
        int qty = int.Parse(txtOneProductQty.Text);
        int prodSizeId = 0;
        if (slstOneProductSize.SelectedIndex >= 0)
            prodSizeId = Convert.ToInt32(slstOneProductSize.Selection.Value);
        int prodColorId = 0;
        if (slstOneProductColor.SelectedIndex >= 0)
            prodColorId = Convert.ToInt32(slstOneProductColor.Selection.Value);

        cardDetailAdapter.FillByCardProductSizeColor(cardDetailTbl, cardId, prodId, prodSizeId, prodColorId);

        if (cardDetailTbl.Rows.Count > 0)
        {
            // The product is already added to the card   
            cardDetailDr = cardDetailTbl[0];

            cardDetailDr.Qty += qty;
        }
        else
        {
            // New Record
            cardDetailDr = cardDetailTbl.NewCard_DetailRow();

            cardDetailDr.Card_Id = cardId;
            cardDetailDr.Prod_Id = prodId;
            cardDetailDr.Qty = qty;

            if (prodSizeId == 0)
                cardDetailDr.SetProd_Size_IdNull();
            else
                cardDetailDr.Prod_Size_Id = prodSizeId;
            if (prodColorId == 0)
                cardDetailDr.SetProd_Color_IdNull();
            else
                cardDetailDr.Prod_Color_Id = prodColorId;

            cardDetailDr.Price = price;
        }


        if (cardDetailDr.RowState == DataRowState.Detached)
        {
            cardDetailTbl.AddCard_DetailRow(cardDetailDr);
        }

        try
        {
            cardDetailAdapter.Update(cardDetailTbl);
        }
        catch
        {
            ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
            return;
        }



        //ShowInfoForm(" „  ≈÷«›… «·„«œ… ≈·Ï »ÿ«ﬁ… «·‘—«¡ »‰Ã«Õ", ActiveForm.ID);

        DisplayCard(cardId);
    }

    protected void cmdShoppingCard_Click(object sender, EventArgs e)
    {
        OnlineStoreDataSet.CardsDataTable cardTbl = new OnlineStoreDataSet.CardsDataTable();
        CardsTableAdapter cardsAdapter = new CardsTableAdapter();
        cardsAdapter.FillByActive(cardTbl, Session.SessionID);

        if (cardTbl.Rows.Count == 0)
        {
            ActiveForm = ConfirmNewCardForm;
            return;
        }
        else
        {
            DisplayCard(cardTbl[0].Card_Id);
        }

    }
    protected void cmdConfirmNewCard_Click(object sender, EventArgs e)
    {
        AddNewCard();
    }

    protected void cmdSubmitOrder_Click(object sender, EventArgs e)
    {
        if (oLstCardProducts.Items.Count == 0)
        {
            ShowErrorForm("·« ÌÊÃœ √Ì „«œ… „÷«›… ·≈·Ï »ÿ«ﬁ… «·‘—«¡", ActiveForm.ID);
            return;
        }

        Session["Card_Id"] = int.Parse(lblCardNum.Text);

        ActiveForm = SubmitCardForm;
    }

    protected void SubmitCardForm_Activate(object sender, EventArgs e)
    {

        lblOrder_Date.Text = DateTime.Now.ToShortDateString();
        txtOrder_Name.Text = "";
        txtOrder_Country.Text = "";
        txtOrder_City.Text = "";
        txtOrder_Address.Text = "";

        if (Session["Card_Id"] == null)
        {
            ShowErrorForm("Invalid Card Id", ActiveForm.ID);
            return;
        }

        OnlineStoreDataSet.CardsDataTable cardsTbl = new OnlineStoreDataSet.CardsDataTable();
        CardsTableAdapter cardsAdapter = new CardsTableAdapter();
        cardsAdapter.FillByCard(cardsTbl, Convert.ToInt32(Session["Card_Id"]));


        if (cardsTbl.Rows.Count == 0)
            return;

        lblOrder_Total.Text = cardsTbl[0].Card_Total.ToString();
        lblOrder_Freight.Text = (cardsTbl[0].Card_Total * 10 / 100).ToString();
    }

    protected void cmdDoSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if (Session["Card_Id"] == null)
            return;

        using (TransactionScope scope = new TransactionScope())
        {

            OnlineStoreDataSet.OrderDataTable orderTbl = new OnlineStoreDataSet.OrderDataTable();
            OrderTableAdapter orderAdapter = new OrderTableAdapter();
            OnlineStoreDataSet.OrderRow orderDr = orderTbl.NewOrderRow();
            orderDr.Order_Date = DateTime.Parse(lblOrder_Date.Text);
            orderDr.Order_Total = decimal.Parse(lblOrder_Total.Text);
            orderDr.Order_Freight = decimal.Parse(lblOrder_Freight.Text);
            orderDr.Order_Name = txtOrder_Name.Text;
            orderDr.Order_Country = txtOrder_Country.Text;
            orderDr.Order_City = txtOrder_City.Text;
            orderDr.Order_Address = txtOrder_Address.Text;
            orderTbl.AddOrderRow(orderDr);

            try
            {
                orderAdapter.Update(orderTbl);
            }
            catch 
            {
                ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
                return;
            }
           

            OnlineStoreDataSet.CardsDataTable cardTbl = new OnlineStoreDataSet.CardsDataTable();
            CardsTableAdapter cardAdapter = new CardsTableAdapter();
            cardAdapter.FillByCard(cardTbl, Convert.ToInt32(Session["Card_Id"]));
            cardTbl[0].Order_Id = orderDr.Order_Id;
            try
            {
                cardAdapter.Update(cardTbl);
            }
            catch 
            {
                ShowErrorForm("Œÿ√ √À‰«¡ „Õ«Ê·… «· Œ“Ì‰", ActiveForm.ID);
                return;
            }

            scope.Complete();

            Session["Order_Id"] = orderDr.Order_Id;
        }

        ActiveForm = OrderSubmittedForm;
    }

    protected void OrderSubmittedForm_Activate(object sender, EventArgs e)
    {
        if (Session["Order_Id"] != null)
            lblSubmittedOrderId.Text = Session["Order_Id"].ToString();
    }


}
