<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageShops2.aspx.cs" Inherits="manageShops2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
<table width="50%">
<tr><td><a href="manageNewShop.aspx">أضافة متجر جديد</a></td></tr>
<tr><td><a href="manageEditShop2.aspx">تعديل متجر</a></td></tr>
<tr><td><a href="manageDeleteShop.aspx">حذف متجر</a></td></tr>
</table>
<br />
<asp:Button ID="btnBack" runat="server" Text="عودة" onclick="btnBack_Click" />
</asp:Content>

