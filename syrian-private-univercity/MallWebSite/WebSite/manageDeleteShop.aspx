<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageDeleteShop.aspx.cs" Inherits="manageDeleteShop" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr>
            <td colspan="2">حذف متجر</td>
        </tr>
        <tr>
            <td>قائمة المتاجر</td>
            <td><asp:ListBox ID="lsShops" runat="server" Height="200" Width="150" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lbResult" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnSub" runat="server" Text="حذف المتجر" 
                    onclick="btnSub_Click" /></td>
        </tr>
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" /></td></tr>
    </table>
</asp:Content>

