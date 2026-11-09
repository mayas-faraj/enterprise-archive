<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageDepartments.aspx.cs" Inherits="departments" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr><td colspan="2">إضافة قسم</td></tr>
        <tr><td>أسم القسم</td><td><asp:TextBox ID="txDepName" runat="server" /></td></tr>
        <tr><td><asp:Button ID="btnAdd" runat="server" Text="إضافة" 
                onclick="btnAdd_Click" /></td><td>
            <asp:Button ID="btnClear" runat="server" Text="مسح" onclick="btnClear_Click" /></td></tr>
        <tr><td colspan="2"><asp:Label runat="server" ID="lbResult" /></td></tr>
    </table>
    <br />
    <table>
        <tr><td colspan="2">إضافة قسم جزئي</td></tr>
        <tr><td>أسم القسم الجزئي</td><td><asp:TextBox ID="txSubDepName" runat="server" /></td></tr>
        <tr><td>القسم</td><td><asp:ListBox runat="server" ID="lstDep" /></td></tr>
        <tr><td><asp:Button ID="btnAddSub" runat="server" Text="إضافة" 
                onclick="btnAddSub_Click" /></td><td>
            <asp:Button ID="btnClearSub" runat="server" Text="مسح" 
                onclick="btnClearSub_Click" /></td></tr>
        <tr><td colspan="2"><asp:Label runat="server" ID="lbResultSub" /></td></tr>
        <tr><td colspan="2">
            <asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" Height="26px" /></td></tr>
    </table>
</asp:Content>

