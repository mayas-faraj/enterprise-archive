<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="adminMessages.aspx.cs" Inherits="adminMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
الرسائل الواردة
<br />
<table>
<tr>
<td><asp:Button ID="btnInbox" Text="الرسائل الشخصية" OnClick="btnInbox_Click" CssClass="Button" runat="server" /></td>
<td><asp:Button ID="btnGroups" Text="طلبات على المجموعات" OnClick="btnGroups_Click" CssClass="Button" runat="server" /></td>
<td><asp:Button ID="btnProducts" Text="طلبات على المواد" OnClick="btnProducts_Click" CssClass="Button" runat="server" /></td>
<td><asp:Button ID="btnSent" Text="الرسائل المرسلة" OnClick="btnSent_Click" CssClass="Button" runat="server" /></td>
<td><asp:Button ID="btnDeleted" Text="المحذوفات" OnClick="btnDeleted_Click" CssClass="Button" runat="server" /></td>
</tr>
</table>
<br />
<asp:Table ID="tblInbox" CssClass="Table_Messages" runat="server" />
<br />
<table class="Table_Controls">
<tr>
<td><asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" Text="حذف" /></td>
<td><asp:Button ID="btnBack" OnClick="btnBack_Click" runat="server" Text="عودة" /></td>
</tr>
</table>
</asp:Content>

