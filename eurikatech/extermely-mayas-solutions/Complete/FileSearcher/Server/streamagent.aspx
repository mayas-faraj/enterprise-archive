<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (string f in Request.Files.AllKeys)
        {
            HttpPostedFile file = Request.Files[f];
            String fileName = MapPath("\\stream\\" + file.FileName);
            Int32 i = 0;

            while (System.IO.File.Exists(fileName))
            {
                fileName = MapPath("\\stream\\" + fileName.Substring(0, fileName.LastIndexOf('.')) + "(" + i + ")" + fileName.Substring(fileName.LastIndexOf('.')));
                i++;
            }

            file.SaveAs(fileName);
        }
        return;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.Main.Agent.Progress.</title>
</head>
<body>
    <b>
    Sir, The operation is ready...Stream is our job
    <br />
    any other operation.
    </b>
</body>
</html>
