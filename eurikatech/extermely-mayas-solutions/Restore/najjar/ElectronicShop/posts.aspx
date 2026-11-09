<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="posts.aspx.cs" Inherits="products" %>

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
<table class="Table_Controls">
<tr>
<td><asp:Button Visible="false" Enabled="false" ID="btnAddProduct" runat="server" 
        CssClass="Button" Text="إضافة مقال" /></td>
<td><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" CssClass="Button" Text="عودة" /></td>
</tr>
</table>
<br />
</center>
</asp:Content>


