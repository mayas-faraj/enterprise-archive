<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageShops.aspx.cs" Inherits="manageShops" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table width="50%">
        <tr><td><a href="manageDepartments.aspx">تعريف قسم رئيسي أو جزئي</a></td></tr>
        <tr><td><a href="manageUpdateShop.aspx">تعديل معلومات القسم</a></td></tr>
        <tr><td><a href="manageEditShop.aspx">حذف القسم</a></td></tr>
    </table>
    
    <br />
    <asp:Button ID="btnBack" runat="server" Text="عودة" onclick="btnBack_Click" 
    style="height: 26px" />
</asp:Content>

