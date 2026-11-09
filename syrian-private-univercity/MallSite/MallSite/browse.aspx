<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="browse.aspx.cs" Inherits="MallSite.browse" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h1>عرض قائمة المتاجر</h1>
    
    <asp:Table runat="server" ID="tMain" />
    
    <asp:Button runat="server" ID="bBack" Text="عودة" onclick="bBack_Click" />
</asp:Content>
