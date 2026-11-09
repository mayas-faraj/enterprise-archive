<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shopGoods.aspx.cs" Inherits="shopGoods" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table width="80%">
        <tr>
            <td colspan="2">
                <h1><asp:Label ID="lbShopName" runat="server" /></h1>
            </td>
        </tr>
        <tr>
            <td>الإختصاص:</td>
            <td><asp:Label ID="lbDetails" runat="server" /></td>
        </tr>
        <tr>
            <td>العنوان</td>
            <td><asp:Label ID="lbAddress" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Image ID="imgShop" runat="server" Width="400" Height="400" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Table ID="tblGoods" runat="server" Width="90%" CssClass="inner" />
            </td>
        </tr>
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" /></td></tr>
    </table>
</asp:Content>

