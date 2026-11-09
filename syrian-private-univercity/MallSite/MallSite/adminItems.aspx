<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminItems.aspx.cs" Inherits="MallSite.adminItems" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table>
        <tr>
            <td colspan="2"><h2>إدارة المواد</h2></td>
        </tr>
        <tr>
            <td>أختيار متجر</td>
            <td><asp:DropDownList ID="stores" runat="server" Width="300" 
                    onselectedindexchanged="stores_SelectedIndexChanged" /></td>
        </tr>
        <tr>
            <td>مواد المتجر</td>
            <td><asp:CheckBoxList ID="items" runat="server" Width="300" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bDelete" runat="server" Text="حذف المواد المحددة" 
                    onclick="bDelete_Click"/></td>
        </tr>
        <tr>
            <td>أسم المادة </td>
            <td><asp:TextBox ID="tName" runat="server"  Width="300" /></td>
        </tr>
        <tr>
            <td>وصف المادة</td>
            <td><asp:TextBox ID="tDetails" runat="server"  Width="300"/></td>
        </tr>
        <tr>
            <td>سعر المادة</td>
            <td><asp:TextBox ID="tPrice" runat="server"  Width="300"/></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lResult" runat="server" ForeColor="Red"/></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bAdd" runat="server" Text="أضافة المادة" 
                    onclick="bAdd_Click"/></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bBack" runat="server" Text="عودة للصفحة السابقة" 
                    onclick="bBack_Click"/></td>
        </tr>
    </table>
</asp:Content>
