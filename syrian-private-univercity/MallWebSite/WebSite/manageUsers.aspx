<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageUsers.aspx.cs" Inherits="manageUsers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <center>
        <h2>المستخدمون</h2>
        <br />
        <table>
            <tr>
                <td colspan="2">أضافة مستخدم جديد</td>
            </tr>
            <tr>
                <td>أسم المستخدم</td>
                <td><asp:TextBox ID="txName" runat="server" /></td>
            </tr>
            <tr>
                <td>كلمة المرور</td>
                <td><asp:TextBox TextMode="Password" ID="txPassword" runat="server" /></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnAdd" runat="server" Text="أضافة" onclick="btnAdd_Click" /></td>
                <td><asp:Button ID="btnClear" runat="server" Text="مسح" onclick="btnClear_Click" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lbResultAdd" runat="server" ForeColor="Green" /></td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td colspan="2">حذف مستخدم<br /></td>
            </tr>
            <tr>
                <td>المستخدمون</td>
                <td><asp:ListBox runat="server" ID="lsUsers"/></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button runat="server" ID="btnDelete" Text="حذف مستخدم" 
                        onclick="btnDelete_Click" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lbResultDelete" runat="server" ForeColor="Green" /></td>
            </tr>
        </table>
        <br />
        <asp:Button runat="server" ID="btnBack" Text="عودة" onclick="btnBack_Click" />
    </center>
</asp:Content>

