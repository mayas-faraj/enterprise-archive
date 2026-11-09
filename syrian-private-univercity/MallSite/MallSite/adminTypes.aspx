<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminTypes.aspx.cs" Inherits="MallSite.adminTypes" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <center>
    <table>
        <tr>
            <td colspan="2"><h2>إدارة أنواع المتاجر</h2></td>
        </tr>
        <tr>
            <td>المتاجر السابقة</td>
            <td><asp:CheckBoxList ID="types" runat="server" Width="300" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bDelete" runat="server" Text="حذف المتاجر المحددة" 
                    onclick="bDelete_Click"/></td>
        </tr>
        <tr>
            <td>أسم نوع متجر جديد </td>
            <td><asp:TextBox ID="tName" runat="server"  Width="300" /></td>
        </tr>
        <tr>
            <td>تخصص المتجر </td>
            <td><asp:TextBox ID="tDetails" runat="server"  Width="300"/></td>
        </tr>
        <tr>
            <td>نوع متجر أب</td>
            <td><asp:RadioButtonList ID="parentTypes" runat="server"  Width="300"/></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lResult" runat="server" ForeColor="Red"/></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bAdd" runat="server" Text="أضافة نوع المتجر" 
                    onclick="bAdd_Click" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bBack" runat="server" Text="عودة للصفحة السابقة" 
                    onclick="bBack_Click" /></td>
        </tr>
    </table>
</center>
</asp:Content>
