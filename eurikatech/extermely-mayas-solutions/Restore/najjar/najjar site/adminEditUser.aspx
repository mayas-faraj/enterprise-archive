<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="adminEditUser.aspx.cs" Inherits="adminEditUser" %>

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
<td colspan="2">تعديل مستخدم</td>
</tr>
<tr>
<td>الإسم</td><td><asp:TextBox ID="txName" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>كلمة المرور السابقة</td><td><asp:TextBox ID="txOldPassword" TextMode="Password" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td>كلمة المرور الجديدة</td><td><asp:TextBox ID="txNewPassword" TextMode="Password" CssClass="TextBox" runat="server" /></td>
</tr>
<tr>
<td colspan="2"><asp:Button ID="btnEditUser" runat="server" CssClass="Button" OnClick="btnEditUser_Click" Text="حفظ المستخدم" /></td>
</tr>
<tr>
<td colspan="2"><asp:Label ID="lblError" runat="server" CssClass="Label_Error" /></td>
</tr>
<tr>
<td colspan="2"><asp:Button ID="btnDelete" runat="server" CssClass="Button" OnClick="btnDelete_Click" Text="حذف المستخدم" /></td>
</tr>
</table>
</td>
</tr>
</table>
</asp:Content>

