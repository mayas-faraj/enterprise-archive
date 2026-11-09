<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageNewShop.aspx.cs" Inherits="manageNewShop" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr>
            <td colspan="2">إضافة متجر</td>
        </tr>
        <tr>
        <td>أسم المتجر</td>
        <td><asp:TextBox ID="txName" runat="server" /></td>
        </tr>
        <tr>
        <td>الإختصاص</td>
        <td><asp:TextBox ID="txMajor" runat="server" /></td>
        </tr>
        <tr>
        <td>العنوان</td>
        <td><asp:TextBox ID="txAddress" runat="server" /></td>
        </tr>
        <tr>
        <td>تحميل صورة Jpg</td>
        <td><asp:FileUpload ID="fuImage" runat="server" /></td>
        </tr>
        <tr>
        <td>القسم الجزئي للمتجر</td>
        <td><asp:ListBox ID="lstSub" runat="server" /></td>
        </tr>
        <tr>
        <td colspan="2"><asp:Label ID="result" runat="server"/></td>
        </tr>
        <tr>
        <td><asp:Button ID="btnAdd" runat="server" Text="إضافة المتجر" 
                onclick="btnAdd_Click"/></td>
        <td><asp:Button ID="btnClear" runat="server" Text="مسح الخانات" 
                onclick="btnClear_Click"/></td>
        </tr>
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" /></td></tr>
    </table>
</asp:Content>

