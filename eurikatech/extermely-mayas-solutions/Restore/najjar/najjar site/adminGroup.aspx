<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="adminGroup.aspx.cs" Inherits="adminGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
<center class="Label_Main"><asp:Label ID="lbMain" runat="server" CssClass="Label_Main" /></center>
<br />
<table class="Table_Products">
<tr><td>إسم المجموعة</td><td><asp:TextBox ID="txName" runat="server" CssClass="TextBox" /></td></tr>
<tr><td>وصف</td><td><asp:TextBox ID="txCommet" runat="server" CssClass="TextBox" /></td></tr>
<tr><td>تحميل صورة</td><td><asp:FileUpload ID="fuImage" runat="server" CssClass="TextBox"/></td></tr>
<tr><td colspan="2"><asp:Label ID="lbStatus" runat="server" CssClass="Label_Result" /></td></tr>
<tr><td colspan="2"><asp:Label ID="lbError" runat="server" CssClass="Label_Error" /></td></tr>
<tr><td colspan="2"><asp:Button ID="btnAction" runat="server" OnClick="btnAction_Click" Text="" CssClass="Button" /></td></tr>
</table>
</asp:Content>