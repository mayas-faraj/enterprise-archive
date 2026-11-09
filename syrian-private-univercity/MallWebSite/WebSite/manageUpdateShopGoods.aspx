<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageUpdateShopGoods.aspx.cs" Inherits="mangeUpdateShopGoods" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr>
            <td colspan="2">تعديل مواد متجر</td>
        </tr>
        <tr>
            <td>أختيار المادة</td>
            <td><asp:ListBox ID="lstGoods" runat="server"/></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnDelete" runat="server" Text="حذف المادة" 
                    onclick="btnDelete_Click" /></td>
        </tr>
        <tr>
            <td>أسم المادة الجديد</td>
            <td><asp:TextBox ID="txName" runat="server" /></td>
        </tr>
        <tr>
            <td>تفاصيل المادة</td>
            <td><asp:TextBox ID="txDetiails" runat="server" /></td>
        </tr>
        <tr>
            <td>السعر الجديد</td>
            <td><asp:TextBox ID="txPrice" runat="server" /></td>
        </tr>
        <tr><td colspan="2"><asp:Label ID="lbResult" runat="server"/></td></tr>
        <tr>
            <td><asp:Button ID="btnAdd" Text="حفظ" runat="server" onclick="btnAdd_Click"/></td>
            <td><asp:Button ID="btnClear" Text="مسح" runat="server" onclick="btnClear_Click"/></td>
        </tr>
        
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click"/></td></tr>
    </table>
</asp:Content>

