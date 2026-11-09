<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="adminCurrency.aspx.cs" Inherits="adminCurrency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
<table class="Table_Users">
<tr><td>اليرة السورية</td><td><asp:TextBox ID="txSP" runat="server" ReadOnly="true" /></td></tr>
<tr><td>Europe Euro</td><td><asp:TextBox ID="txEU" runat="server" /></td></tr>
<tr><td>US Dollar</td><td><asp:TextBox ID="txUD" runat="server" /></td></tr>
<tr><td colspan="2"><asp:Button ID="btnSave" Text="تعديل" runat="server" 
        onclick="btnSave_Click"/></td></tr>
</table>
</asp:Content>


