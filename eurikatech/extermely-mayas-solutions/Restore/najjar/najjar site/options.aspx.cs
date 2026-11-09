using System;
using System.IO;

public partial class options : System.Web.UI.Page
{
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            FileStream fs = new FileStream(MapPath("marquee.dat"), FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);

            sw.WriteLine(txMarquee.Text);

            sw.Close();
            fs.Close();

            lblSaved.Text = "تم التعديل بنجاح";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}