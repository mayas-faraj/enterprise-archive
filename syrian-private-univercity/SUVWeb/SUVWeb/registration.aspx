<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="SUVWeb.regestraition" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div><table width="100%">
        <tr>
        <td colspan="2"><asp:image ID="Image1" runat="server" Width="100%" AlternateText="main Image" ImageUrl="~/App_Themes/bannar.jpg"/></td>
        </tr>
        <tr>
        <td style="width:30%">
        </td>
        <td style="width:70%">
        <center>
        <table width="55%">
        <tr><td>Full Name</td><td><asp:TextBox ID="txFullName" Width="300" runat="server" /></td></tr>
        <tr><td>User Name</td><td><asp:TextBox ID="txUserName" Width="300" runat="server" /></td></tr>
        <tr><td>Password</td><td><asp:TextBox ID="txPass" TextMode="Password" Width="300" runat="server" /></td></tr>
        <tr><td>Confirm Password</td><td><asp:TextBox ID="txPass2" TextMode="Password" Width="300" runat="server" /></td></tr>
        <tr><td>Email</td><td><asp:TextBox ID="txEmail" Width="300" runat="server" /></td></tr>
        <tr><td>Program Name</td><td><asp:DropDownList ID="lstPrograms" Width="300" runat="server" /></td></tr>
        <tr><td colspan="2"><asp:Button runat="server" ID="btnAdd" Text="Add" 
                onclick="btnAdd_Click"/></td></tr>
        <tr><td colspan="2"><asp:Label runat="server" ID="lbError" Text="" ForeColor="Red"/></td></tr>
        </table>
        </center>
        </td>
        </tr>
    </table></div>
    </form>
</body>
</html>
