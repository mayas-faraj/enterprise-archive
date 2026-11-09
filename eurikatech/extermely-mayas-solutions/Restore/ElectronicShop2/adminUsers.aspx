<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="adminUsers.aspx.cs" Inherits="adminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
<table>
<tr><asp:Label ID="lblMain" CssClass="Label_Main" runat="server" /></tr>
<tr>
<td>
<table>
<tr>
<td colspan="2">إضافة مستخدم جديد</td>
</tr>
<tr>
<td>الإسم</td><td><asp:TextBox ID="txName" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>كلمة المرور</td><td><asp:TextBox ID="txPassword" TextMode="Password" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>تأكيد كلمة المرور</td><td><asp:TextBox ID="txPassword2" TextMode="Password" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td colspan="2"><asp:Button ID="btnAddUser" runat="server" CssClass="Button" OnClick="btnAddUser_Click" Text="إضافة مستخدم" /></td>
</tr>
<tr>
<td colspan="2"><asp:Label ID="lblError" runat="server" CssClass="Label_Error" /></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<asp:Table ID="tblUsers" runat="server" CssClass="Table_Users">
</asp:Table>
</td>
</tr>
</table>
<br />

<asp:Button ID="btnBack" CssClass="Button" Text="عودة" OnClick="btnBack_Click" runat="server" />
</asp:Content>

