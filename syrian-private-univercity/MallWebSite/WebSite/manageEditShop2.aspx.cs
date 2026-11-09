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

public partial class manageEditShop2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillList();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageShops2.aspx");
    }
    private void fillList()
    {
        if (lsShops.SelectedIndex == -1)
        {
            lsShops.Items.Clear();
            Database.command.CommandText = "SELECT name FROM shops;";
            Database.connection.Open();

            Database.dataReader = Database.command.ExecuteReader();
            while (Database.dataReader.Read())
                lsShops.Items.Add(Database.dataReader[0].ToString());

            Database.connection.Close();
        }
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (lsShops.SelectedItem != null)
        {
            lbResult.Text = "";

            try
            {
                //if (txName.Text != "")
                //{
                //    Database.ExcuteNotQuery("UPDATE shops SET name=N'" + txName.Text + "'");
                //   lbResult.Text += "تم تعديل الأسم إلى " + txName.Text + "<br/>";
                //}

                if (txMajor.Text != "")
                {
                    Database.ExcuteNotQuery("UPDATE shops SET major=N'" + txMajor.Text + "'");
                    lbResult.Text += "تم تعديل الأختصاص إلى " + txMajor.Text + "<br/>";
                }

                if (txAddress.Text != "")
                {
                    Database.ExcuteNotQuery("UPDATE shops SET address=N'" + txAddress.Text + "'");
                    lbResult.Text += "تم تعديل العنوان إلى " + txAddress.Text + "<br/>";
                }

                if (uploader.HasFile)
                    if (uploader.PostedFile.ContentType == "image/pjpeg")
                    {
                        String imageName = lsShops.SelectedValue;
                        uploader.SaveAs(MapPath("images\\" + imageName + ".jpg"));
                        lbResult.Text += "تم تحميل صورة جديدة" + "<br/>";
                    }

                lsShops.SelectedIndex = -1;
                fillList();
            }
            catch (Exception ex)
            {
                lbResult.Text += ex.Message;
                if (Database.connection.State != ConnectionState.Closed)
                    Database.connection.Close();
            }
        }
        else
            lbResult.Text = "يرجى تحديد متجر للتعديل";
    }
}
