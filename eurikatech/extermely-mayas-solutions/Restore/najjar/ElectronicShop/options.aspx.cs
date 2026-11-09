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
            StreamWriter sw = new StreamWriter(fs, System.Text.Encoding.Default);

            sw.Write(txMarquee.Text);

            sw.Close();
            fs.Close();

            lblSaved.Text = "تم التعديل بنجاح";
            fillText();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void fillText()
    {
        FileStream fs = new FileStream(MapPath("marquee.dat"), FileMode.OpenOrCreate, FileAccess.Read);
        StreamReader sr = new StreamReader(fs, System.Text.Encoding.Default);

        txMarquee.Text = sr.ReadToEnd();

        sr.Close();
        fs.Close();
    }
    protected void txMarquee_Load(object sender, EventArgs e)
    {
        fillText();
    }
}