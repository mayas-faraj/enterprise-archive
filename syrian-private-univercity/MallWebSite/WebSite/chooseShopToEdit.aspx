<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chooseShopToEdit.aspx.cs" Inherits="chooseShopToEdit" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr>
            <td colspan="2">تعديل مواد متجر</td>
        </tr>
        <tr>
            <td>أختيار المتجر</td>
            <td><asp:ListBox ID="lstShops" runat="server"/></td>
        </tr>
                <tr><td colspan="2"><asp:Label ID="lbResult" runat="server"/></td></tr>
        <tr>
            <td><asp:Button ID="btnChoose" Text="أختيار" runat="server" 
                    onclick="btnChoose_Click"/></td>
            <td><asp:Button ID="btnBack" Text="عودة" runat="server" onclick="btnBack_Click"/></td>
        </tr>
    </table>
</asp:Content>

