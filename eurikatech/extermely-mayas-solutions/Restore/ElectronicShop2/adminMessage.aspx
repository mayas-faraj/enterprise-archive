<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="adminMessage.aspx.cs" Inherits="adminMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
إرسال رسالة عبر البريد الإلكتروني
<br />
<table class="Table_WriteMessage">
<tr>
<td>البريد الإلكتروني</td>
<td><asp:TextBox ID="txSenderEmail" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>المرسل إليه</td>
<td><asp:TextBox ID="txEmail" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>نسخ كربونية</td>
<td><asp:TextBox ID="txCc" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>عنوان الرسالة</td>
<td><asp:TextBox ID="txSubject" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>الرسالة</td>
<td><asp:TextBox ID="txMessage" CssClass="TextBox" TextMode="MultiLine" runat="server" /></td>
</tr>
<tr>
<td colspan="2">
<table class="Table_Controls">
<tr>
<td><asp:Button ID="btnSend" CssClass="Button" Text="إرسال" OnClick="btnSend_Click" runat="server" /></td>
<td><asp:Button ID="btnBack" CssClass="Button" Text="عودة" OnClick="btnBack_Click" runat="server" /></td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2"><asp:Label ID="lblError" CssClass="Label_Error" runat="server" /></td>
</tr>
</table>
</asp:Content>

