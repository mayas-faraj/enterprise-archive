<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
<table>
<tr>
<td><asp:Label ID="lblMain" CssClass="Label_Title" runat="server" /></td>
<td><asp:Button ID="btnLogout" OnClick="btnLogout_Click" Text="تسجيل الخروج" runat="server" /></td>
</tr>
<tr>
<td colspan="2">
<br />
<table>
<tr><td><asp:Button ID="btnMessages" runat="server" OnClick="btnMessages_Click" Text="الرسائل الواردة" /></td></tr>
<tr><td><asp:Button ID="btnMessage" runat="server" OnClick="btnMessage_Click" Text="ارسال رسالة" /></td></tr>
<tr><td><asp:Button ID="btnProducts" runat="server" OnClick="btnProducts_Click" Text="المنتجات والمجموعات" /></td></tr>
<tr><td><asp:Button ID="btnUsers" runat="server" OnClick="btnUsers_Click" Text="المستخدمين" /></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><asp:Label ID="lblNewMessage" CssClass="Label_Result" runat="server" /></td></tr>
</table>
</td>
</tr>
</table>

</asp:Content>

