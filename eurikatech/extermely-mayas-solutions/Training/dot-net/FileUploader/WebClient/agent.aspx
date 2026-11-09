<%@ Import Namespace="System"%>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="System.Net"%>
<%@ Import NameSpace="System.Web"%>

<Script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        foreach (string f in Request.Files.AllKeys)
        {
            Random rnd = new Random();
            Double name = rnd.NextDouble();
            HttpPostedFile file = Request.Files[f];
            file.SaveAs(MapPath("\\store\\f" + name.ToString().Substring(2) + ".mp3"));
        }
    }
</Script>
<html>
<head>
<title>Here is the Agent</title>
</head>
<body>
<p> Sir, the operation is complete! </p>
</body>
</html>
