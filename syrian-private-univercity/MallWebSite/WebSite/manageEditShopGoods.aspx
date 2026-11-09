<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageEditShopGoods.aspx.cs" Inherits="manageEditShopGoods" Title="Untitled Page" %>

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
        <tr>
            <td>أسم المادة</td>
            <td><asp:TextBox ID="txName" runat="server" /></td>
        </tr>
        <tr>
            <td>تفاصيل</td>
            <td><asp:TextBox ID="txDetiails" runat="server" /></td>
        </tr>
        <tr>
            <td>السعر</td>
            <td><asp:TextBox ID="txPrice" runat="server" /></td>
        </tr>
        <tr><td colspan="2"><asp:Label ID="lbResult" runat="server"/></td></tr>
        <tr>
            <td><asp:Button ID="btnAdd" Text="إضافة" runat="server" onclick="btnAdd_Click" 
                    style="height: 26px" /></td>
            <td><asp:Button ID="btnClear" Text="مسح" runat="server" onclick="btnClear_Click" /></td>
        </tr>
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" /></td></tr>
    </table>
</asp:Content>

