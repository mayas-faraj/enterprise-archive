using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace MobileStoreManagement
{
    public partial class _Default : System.Web.UI.MobileControls.MobilePage
    {
        private static Int32 userId;
        private static String userName;
        private static Boolean isAdmin;

        private static String currentProduct;
        private static String currentCategory;

        private static System.Collections.Specialized.StringCollection products;

        static _Default()
        {
            products = new System.Collections.Specialized.StringCollection();
        }

        protected void cmdLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Core.Login(txName.Text, txPassword.Text, out userId, out isAdmin))
                {
                    userName = txName.Text;
                    this.ActiveForm = frmMain;
                }
                else
                {
                    userName = "";
                    userId = -1;
                    result.Text = "Error user name and password!";
                }       
            }  
        }

        protected void frmMain_OnActivate(object sender, EventArgs e)
        {
            cmdCategories.Visible = isAdmin;
        }
       
        protected void cmdCategories_Click(object sender, EventArgs e)
        {
            this.ActiveForm = frmEditCategory;
        }

        protected void cmdAddUser_Click(object sender, EventArgs e)
        {
            this.ActiveForm = frmAddUser;
        }

        protected void cmdEditUser_Click(object sender, EventArgs e)
        {
            this.ActiveForm = frmEditUser;
        }

        protected void cmdBrowsing_Click(object sender, EventArgs e)
        {
            products.Clear();
            lstBill.Items.Clear();
            this.ActiveForm = frmSearchCategories;
        }

        protected void cmdBills_Click(object sender, EventArgs e)
        {
            this.ActiveForm = frmBills;
        }

        protected void cmdLogout_Click(object sender, EventArgs e)
        {
            userId = -1;
            isAdmin = false;
            this.ActiveForm = frmLogin;
        }

        protected void cmdNAddUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.InsertMember(txNUserName.Text, txNPassword.Text, txNFName.Text, txNLName.Text, txNCountry.Text);
                txNUserName.Text = "";
                txNPassword.Text = "";
                txNFName.Text = "";
                txNLName.Text = "";
                txNConfirm.Text = "";
                txNCountry.Text = "";
                lbNResult.Text = "User Added";
            }
        }

        protected void cmdNClear_Click(object sender, EventArgs e)
        {
            txNUserName.Text = "";
            txNPassword.Text = "";
            txNFName.Text = "";
            txNLName.Text = "";
            txNCountry.Text = "";
            txNConfirm.Text = "";
        }

        protected void cmdEditUser1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.ChangeLoginInfo(userName, txCUserName.Text, txCPassword.Text);
                lbCResult.Text = "User login info updated";
            }
        }

        protected void cmdEditUser2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.ChangeUserInfo(userName, txCFName.Text, txCLName.Text, txCCountry.Text);
                lbCResult.Text = "User info updated";
            }
        }

        protected void frmEditCategory_OnActive(object sender, EventArgs e)
        {
            String[] categories = Core.GetCategoriesName();
            list.Items.Clear();

            foreach (String item in categories)
            {
                list.Items.Add(item);
            }
        }

        protected void cmdAddCategory_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.InsertCategory(txCategory.Text, "");
                txCategory.Text = "";
                this.ActiveForm = frmEditCategory;
            }
        }

        protected void frmProducts_OnActivate(object sender, EventArgs e)
        {
            txOldName.Text = currentCategory;

            String[] products = Core.GetProductsName(currentCategory);

            buttonsProduct.Items.Clear();

            foreach (String item in products)
            {
                buttonsProduct.Items.Add(item);  
            }
        }

        protected void frmAddProduct_OnActivate(object sender, EventArgs e)
        {
            lbl.Text = "Category: " + currentCategory;
        }

        protected void cmdAddProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.InsertProduct(currentCategory, txAddPName.Text, "", Int32.Parse(txAddPCount.Text), Single.Parse(txAddPPrice.Text));
                txAddPPrice.Text = "";
                txAddPName.Text = "";
                txAddPCount.Text = "";

                this.ActiveForm = frmProducts;
            }
        }

        protected void cmdUpdateCategory_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.ChangeCategory(txOldName.Text, txNewName.Text, "");
                txNewName.Text = "";
                this.ActiveForm = frmEditCategory;
            }
        }

        protected void cmdDeleteCategory_Click(object sender, EventArgs e)
        {
            Core.DeleteCategory(txOldName.Text);
            this.ActiveForm = frmEditCategory;
        }

        protected void cmdSelectC_Click(object sender, EventArgs e)
        {
            if (list.SelectedIndex >= 0)
            {
                currentCategory = list.Items[list.SelectedIndex].ToString();
                this.ActiveForm = frmProducts;
            }
        }

        protected void cmdEditProduct_Click(object sender, EventArgs e)
        {
            if (buttonsProduct.SelectedIndex >= 0)
            {
                currentProduct = buttonsProduct.Items[buttonsProduct.SelectedIndex].ToString();
                this.ActiveForm = frmEditProduct;
            }
        }

        protected void frmEditProduct_OnActivate(object sender, EventArgs e)
        {
            lblCN.Text = currentCategory;
            lblPN.Text = currentProduct;
        }

        protected void cmdPUpdateProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Core.ChangeProduct(currentProduct, txEditPName.Text, "", Int32.Parse(txEditPCount.Text), Single.Parse(txEditPPrice.Text));
                txEditPName.Text = "";
                txEditPPrice.Text = "";
                txEditPCount.Text = "";
                this.ActiveForm = frmProducts;
            }
        }

        protected void cmdPDeleteProduct_Click(object sender, EventArgs e)
        {
            Core.DeleteProduct(currentProduct);
            this.ActiveForm = frmProducts;
        }

        protected void frmSearchCategories_OnActivate(object sender, EventArgs e)
        {
            String[] categories = Core.GetCategoriesName();
            lstCategories.Items.Clear();

            foreach (String item in categories)
            {
                lstCategories.Items.Add(item);
            }
        }

        protected void cmdSelectCategories_Click(object seneder, EventArgs e)
        {           
            if (lstCategories.SelectedIndex >= 0)
            {
                currentCategory = lstCategories.Items[lstCategories.SelectedIndex].ToString();
                this.ActiveForm = frmSearchProducts;
            }
        }

        protected void cmdShowBill_Click(object sender, EventArgs e)
        {
            cmdDone.Visible = true;
            cmdContinue.Visible = true;
            this.ActiveForm = frmCurrentBill;
        }

        protected void frmSearchProducts_OnActivate(object sender, EventArgs e)
        {
            searchProductsLabel.Text = currentCategory;
            String[] products = Core.GetProductsName(currentCategory);
            lstProducts.Items.Clear();

            foreach (String item in products)
            {
                lstProducts.Items.Add(item);
            }
        }

        protected void cmdSelectProduct_Click(object sender, EventArgs e)
        {
            if (lstProducts.SelectedIndex >= 0)
            {
                currentProduct = lstProducts.Items[lstProducts.SelectedIndex].ToString();
                this.ActiveForm = frmProduct;
            }
        }

        protected void cmdBuy_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                products.Add(currentProduct + ';' + detailBuyCount.Text + ';' + detailPrice.Text);
                detailBuyCount.Text = "";
            }
        }

        protected void frmProduct_OnActivate(object sender, EventArgs e)
        {
            Int32 count;
            Single price; 

            Core.GetProduct(currentProduct, out count, out price);

            detailName.Text = currentProduct;
            detailCount.Text = count.ToString();
            detailPrice.Text = price.ToString();

            rangeValidator.MinimumValue = "1";
            rangeValidator.MaximumValue = detailCount.Text;
        }

        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            this.ActiveForm = frmSearchCategories;
        }

        protected void cmdDone_Click(object sender, EventArgs e)
        {
            Int32 id = Core.InsertBill(userId);

            foreach (String s in products)
            {
                String[] str = s.Split(';');

                Core.InsertBillItem(id, str[0], Convert.ToInt32(str[1]));
            }

            products.Clear();
            this.ActiveForm = frmBills;
        }

        protected void frmCurrentBill_OnActivate(object sender, EventArgs e)
        {
            Single sum = 0;
            lstBill.Items.Clear();

            lstBill.Items.Add("Item - Count - Price");
            foreach (String str in products)
            {
                String[] s = str.Split(';');
                sum += Convert.ToSingle(s[2]);
                lstBill.Items.Add(s[0] + " - " + s[1] + " - " + s[2]);
            }

            totalPrice.Text = sum.ToString();
        }

        protected void frmBills_OnActivate(object sender, EventArgs e)
        {
            String[] bills = Core.GetBills(userId);
            billsList.Items.Clear();

            foreach (String str in bills)
                billsList.Items.Add(str);
        }

        protected void cmdSelectBill_Click(object sender, EventArgs e)
        {              
            if (billsList.SelectedIndex >= 0)
            {
                String selText = billsList.Selection.ToString();
                products = Core.GetBillItems(Int32.Parse(selText.Substring(0, selText.IndexOf('-'))));

                cmdDone.Visible = false;
                cmdContinue.Visible = false;
                this.ActiveForm = frmCurrentBill;
            }
        }

        protected void cmdSelectBillTime_Click(object sender, EventArgs e)
        {
        }
    }
}
