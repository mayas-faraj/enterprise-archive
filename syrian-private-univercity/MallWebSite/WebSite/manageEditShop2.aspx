<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageEditShop2.aspx.cs" Inherits="manageEditShop2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr>
            <td colspan="2">تعديل معلومات متجر</td>
        </tr>
        <tr>
            <td>أختر متجر للتعديل</td>
            <td><asp:ListBox ID="lsShops" runat="server" Height="200" Width="150" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lbResult" runat="server" /></td>
        </tr>
        <tr>
            <td>أختصاص المتجر</td>
            <td><asp:TextBox ID="txMajor" runat="server" /></td>
        </tr>
        <tr>
            <td>عنوان المتجر</td>
            <td><asp:TextBox ID="txAddress" runat="server" /></td>
        </tr>
        <tr>
            <td>تعديل صورة المتجر</td>
            <td><asp:FileUpload runat="server" ID="uploader" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnSub" runat="server" Text="حفظ التغييرات" 
                    onclick="btnSub_Click" /></td>
        </tr>
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" /></td></tr>
    </table>
</asp:Content>

