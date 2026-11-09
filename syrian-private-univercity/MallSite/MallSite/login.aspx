<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MallSite.login" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table>
        <tr>
            <td colspan="2"><h2>تسجيل الدخول</h2></td>
        </tr>
        <tr>
            <td>الأسم</td>
            <td><asp:TextBox ID="tName" runat="server" /></td>
        </tr>
        <tr>
            <td>كلمة المرور</td>
            <td><asp:TextBox TextMode="Password" ID="tPassword" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lResult" ForeColor="Red" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bLogin" Text="تسجيل الدخول" runat="server" 
                    onclick="bLogin_Click" /></td>
        </tr>
        <tr>
            <td colspan="2"><a href="default.aspx">عودة</a></td>
        </tr>
    </table>
</asp:Content>
