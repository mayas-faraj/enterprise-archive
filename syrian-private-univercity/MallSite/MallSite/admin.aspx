<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="MallSite.admin" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table>
        <tr>
            <td>صفحة أدارة الموقع</td>
        </tr>
        <tr>
            <td><a href='adminTypes.aspx'>أدارة أنواع المتاجر</a></td>
        </tr>
        <tr>
            <td><a href='adminStores.aspx'>أدارة المتاجر</a></td>
        </tr>
        <tr>
            <td><a href='adminItems.aspx'>أدراة مواد المتجر</a></td>
        </tr>
        <tr>
            <td><a href='adminVisitors.aspx'>عرض شكاوى الزوار</a></td>
        </tr>
                <tr>
            <td><a href='default.aspx'>عودة</a></td>
        </tr>
    </table>
</asp:Content>
