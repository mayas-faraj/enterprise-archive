<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="management.aspx.cs" Inherits="management" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
<table width="50%">
<tr><td><a href="manageShops.aspx">أدارة الأقسام</a></td></tr>
<tr><td><a href="manageShops2.aspx">أدارة المتاجر</a></td></tr>
<tr><td><a href="manageGoods.aspx">إدارة المواد</a></td></tr>
<tr><td><a href="manageUsers.aspx">إدارة المستخدمون</a></td></tr>
</table>
<br />
<asp:Button ID="btnBack" runat="server" Text="عودة" onclick="btnBack_Click" />
</asp:Content>