<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <table>
        <tr>
        <td>الإسم</td>
        <td><asp:TextBox ID="txName" runat="server" CssClass="TextBox" /></td>
        </tr>
        <tr>
        <td>كلمة المرور</td>
        <td><asp:TextBox ID="txPassword" runat="server" TextMode="Password" CssClass="TextBox" /></td>
        </tr>
        <tr>
        <td>شيفرة التحقق</td>
        <td><asp:Image CssClass="Image_Code" ID="imgCode" ImageUrl="" runat="server" /></td>
        </tr>
        <tr>
        <td>كتابة الشيفرة</td>
        <td><asp:TextBox id="txCode" runat="server"  CssClass="TextBox"/></td>
        </tr>
        <tr>
        <td colspan="2"><asp:Button ID="btnLogin" Text="تسجيل الدخول" OnClick="btn_Login" runat="server" CssClass="Button" /></td>
        </tr>
      </table>
      <br />
      <asp:Label ID="lblError" CssClass="Label_Error" runat="server" /> 
</asp:Content>

