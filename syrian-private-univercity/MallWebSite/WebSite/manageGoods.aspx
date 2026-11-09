<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageGoods.aspx.cs" Inherits="manageGoods" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table width="50%">
<tr><td><a href="manageEditShopGoods.aspx">أضافة مواد</a></td></tr>
<tr><td><a href="chooseShopToEdit.aspx">تعديل مواد أو حذفها</a></td></tr>
</table>
<br />
<asp:Button ID="btnBack" runat="server" Text="عودة" onclick="btnBack_Click" />
</asp:Content>

