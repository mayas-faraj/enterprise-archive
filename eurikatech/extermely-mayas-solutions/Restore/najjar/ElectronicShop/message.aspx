<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
<table class="Table_Messages" border="1">
<tr>
<td>بريد المرسل</td>
<td><asp:Label ID="lblSender" CssClass="Label_Message" runat="server" /></td>
</tr>
<tr>
<td>إسم المرسل</td>
<td><asp:Label ID="lblName" CssClass="Label_Message" runat="server" /></td>
</tr>
<tr>
<td>الهاتف</td>
<td><asp:Label ID="lblPhone" CssClass="Label_Message" runat="server" /></td>
</tr>
<tr>
<td>العنوان</td>
<td><asp:Label ID="lblAddress" CssClass="Label_Message" runat="server" /></td>
</tr>
<tr>
<td>تاريخ الإرسال</td>
<td><asp:Label ID="lblDate" CssClass="Label_Message" runat="server" /></td>
</tr>
<tr>
<td>موضوع الرسالة الرسالة</td>
<td><asp:Label ID="lblSubject" CssClass="Label_Message" runat="server" /></td>
</tr>
<tr>
<td colspan="2">الرسالة</td>
</tr>
<tr>
<td colspan="2"><asp:TextBox ID="txMessage" TextMode="MultiLine" runat="server" CssClass="TextBox" Height="150px" Width="150px" /></td>
</tr>
<tr><td colspan="2"><br /></td></tr>
<tr>
<td colspan="2">
<center>
<table class="Table_Controls">
<tr>
<td><asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" CssClass="Button" Text="حذف"/></td>
<td><asp:Button ID="btnReplay" runat="server" OnClick="btnReplay_Click" CssClass="Button" Text="رد" /></td>
<td><asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" CssClass="Button" Text="عودة" /></td>
</tr>
</table>
</center>
</td>
</tr>
</table>
</asp:Content>

