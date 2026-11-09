<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table width="50%">
        <tr>
            <td colspan="2">تسجيل الدخول</td>
        </tr>
        <tr>
            <td>الأسم</td>
            <td><asp:TextBox ID="txName" runat="server" /></td>
        </tr>
        <tr>
            <td>كلمة المرور</td>
            <td><asp:TextBox TextMode="Password" ID="txPassword" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lbResult" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnLogin" runat="server" Text="إدخال" 
                    onclick="btnLogin_Click" /></td>
            <td><asp:Button ID="btnClear" runat="server" Text="مسح" /></td>
        </tr>
    </table>
</asp:Content>

