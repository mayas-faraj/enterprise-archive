<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table width="80%">
        <tr>
            <td colspan="3">أسم الموقع</td>
        </tr>
        <tr>
            <td>أسم المادة</td>
            <td><asp:TextBox ID="txName" runat="server" /></td>
            <td rowspan="2"><asp:Button ID="btnSearch" runat="server" Text="بحث"
                    onclick="btnSearch_Click" /></td>
        </tr>
        <tr>
            <td>مواصفات</td>
            <td><asp:TextBox ID="txDetails" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Table ID="tblResult" runat="server" Width="90%" CssClass="inner"/>
            </td>
        </tr>
    </table>
</asp:Content>

