<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="CourseDetails.aspx.cs" Inherits="CourseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
<br />
<table class="Table_ProductDetails" border="2">
<tr><td><asp:Label ID="lbName" runat="server" CssClass="Label_Result" /></td><td rowspan="4"><asp:Image ID="imgProduct" ImageUrl="" runat="server" /></td></tr>
<tr><td><asp:Label ID="lblLevel" runat="server" CssClass="Label_Result" /></td></tr>
<tr><td><asp:Label ID="lblPeriod" runat="server" CssClass="Label_Result" /></td></tr>
<tr><td><asp:Label ID="lbDate" runat="server" CssClass="Label_Result" /></td></tr>
<tr><td><asp:Label ID="lbComment" runat="server" CssClass="Label_Result" /></td></tr>
<tr><td rowspan="2"><asp:Label ID="lbDetails" runat="server" CssClass="Label_Result" /></td><td>السعر</td></tr>
<tr><td><asp:Label ID="lbPrice" runat="server" CssClass="Label_Price" /></td></tr>
</table>
<br />
<table class="Table_Controls">
<tr>
<td><asp:Button ID="btnComment" runat="server" CssClass="Button" 
        Text="كتابة أستفسار" OnClick="btnComment_Click" /></td>
<td><asp:Button ID="btnEdit" runat="server" CssClass="Button" Enabled="false" Visible="false" Text="تعديل" /></td>
<td><asp:Button ID="btnHide" runat="server" CssClass="Button" Enabled="false" Visible="false" Text="" /></td>
<td><asp:Button ID="btnDelete" runat="server" CssClass="Button" Enabled="false" Visible="false" Text="حذف" /></td>
<td><asp:Button ID="btnBack" runat="server" CssClass="Button" Text="عودة" OnClick="btnBack_Click" /></td>
</tr>
</table>
</asp:Content>

