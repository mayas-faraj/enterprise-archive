<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SUVWeb._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SUV Main page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
        <tr>
        <td colspan="2"><asp:image runat="server" Width="100%" AlternateText="main Image" ImageUrl="~/App_Themes/bannar.jpg"/></td>
        </tr>
        <tr>
        <td style="width:30%">
        <table width="100%">
        <tr>
        <td>user name:</td>
        <td><asp:TextBox ID="txName" runat="server"/></td>
        </tr>
        <tr>
        <td>password:</td>
        <td><asp:TextBox ID="txPassword" runat="server" TextMode="Password"/></td>
        </tr>
        <tr>
        <td>Auth. Level:</td>
        <td>
        <asp:DropDownList runat="server" ID="lstAuth">
        <asp:ListItem Text="Select.." Selected="True"/>
        <asp:ListItem Text="ISIS Staff" />
        <asp:ListItem Text="ISIS Student" />
        </asp:DropDownList>
        </td>
        </tr>
        <tr>
        <td colspan="2"><asp:Button Text="login" runat="server" ID="btnLogin" 
                onclick="btnLogin_Click" /></td>
        </tr>
        <tr>
        <td colspan="2"><asp:Button Text="A New Student registration" runat="server" 
                ID="btnRegister" onclick="btnRegister_Click" /></td>
        </tr>
        <tr>
        <td colspan="2"><asp:Label runat="server" ID="lbError" ForeColor="Red" Text="" /></td>
        </tr>
        </table>
        </td>
        <td style="width:70%"><center><asp:Image AlternateText="welcome" ImageUrl="~/App_Themes/main.jpg" runat="server"/></center></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
