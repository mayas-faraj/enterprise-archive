<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="library.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <center class="Label_Main">
<br />
<asp:Label ID="lbGroups" runat="server" />
<asp:Table ID="tblGroups" runat="server" CssClass="Table_ProductsView" CellSpacing="10" CellPadding="20"/>
<br />
<asp:Label ID="lbProducts" runat="server" />
<asp:Table ID="tblProducts" runat="server" CssClass="Table_ProductsView" CellSpacing="10" CellPadding="20"/>
<br />
<table class="Table_Controls">
<tr>
<td><asp:Button ID="btnComment" runat="server" CssClass="Button" Text="طلب أو تعليق للمجموعة" OnClick="btnComment_Click" /></td>
<td><asp:Button Visible="false" Enabled="false" ID="btnAddGroup" runat="server" CssClass="Button" Text="إضافة مجموعة" /></td>
<td><asp:Button Visible="false" Enabled="false" ID="btnHideGroup" runat="server" CssClass="Button" Text="" /></td>
<td><asp:Button Visible="false" Enabled="false" ID="btnDeleteGroup" runat="server" CssClass="Button" Text="حذف مجموعة" /></td>
<td><asp:Button Visible="false" Enabled="false" ID="btnAddProduct" runat="server" CssClass="Button" Text="إضافة كتاب" /></td>
<td><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" CssClass="Button" Text="عودة" /></td>
<td>
أختيار العملة
<asp:DropDownList ID="ddlCurrency" runat="server" CssClass="Button">
</asp:DropDownList>
<asp:Button ID="btnCurrency" runat="server" OnClick="btnCurrency_Click" CssClass="Button" Text="حفظ العملة" />
</td>
</tr>
</table>
<br />
</center>
</asp:Content>


