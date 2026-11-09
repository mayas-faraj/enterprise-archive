<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newTopic.aspx.cs" Inherits="newTopic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>add new topic</title>
    <link type="text/css" rel="Stylesheet" href="App_Theme/StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center><table width="100%" cellpadding="0" cellspacing="0" style="border-width:0;border-collapse:collapse;padding:0 0 0 0;">
    <tr>
    <td style="width:50%;background-image:url('App_Theme/oppg.gif'); background-repeat: repeat;"></td>
        <td style="width:50;height:200;"><img width="600" height="200" alt="bannar" src="App_Theme/bannar.jpg" />
            </td><td style="width:50%;background-image:url('App_Theme/oppb.gif'); background-repeat: repeat;"></td>
    </tr>
    </table><br /><br />
    <hr width="70%" size="2" color="silver" />
</center>
<font face="arial" size="4" color="black">Create New Topic</font>
<table border="2" style="border-color:Blue;border-collapse:collapse;background-color:Silver" width="70%">
<tr><td>
To create new topic enter it is name<br /><br />
new topic name<br />
<asp:TextBox runat="server" ID="txName" Width="180"></asp:TextBox><br />
    <br />
    <asp:Button runat="server" ID="btnPost" Text="Post" OnClick="postTopic" />
</td></tr>
</table>
    <asp:RequiredFieldValidator runat="server" ID="rfvUnique" ErrorMessage="please inter unique name of topic ..." ControlToValidate="txName" />
<br />
<a href="default.aspx"><i>return to list of topics</i></a>
    </div>
    </form>
</body>
</html>