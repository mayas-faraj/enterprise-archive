<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="options.aspx.cs" Inherits="options" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <br />
<table class="Table_Users" width="100%">
<tr><td>شريط الإعلانات</td><td><asp:TextBox ID="txMarquee" runat="server" 
        TextMode="MultiLine" CssClass="TextBox" Height="300" 
        onload="txMarquee_Load"/></td></tr>
<tr><td colspan="2"><asp:Label ID="lblSaved" runat="server" CssClass="Label_Result"/></td></tr>
<tr><td colspan="2"><asp:Label ID="lblError" runat="server" CssClass="Label_Error"/></td></tr>
<tr><td><asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="إلغاء الأمر" /></td><td><asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="حفظ" /></td></tr>
</table>
</asp:Content>

