<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageEditShop.aspx.cs" Inherits="manageEditShop" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <table>
        <tr>
            <td colspan="2">حذف قسم</td>
        </tr>
        <tr>
            <td>قائمة الأقسام</td>
            <td><asp:ListBox ID="lstMain" runat="server" Height="200" Width="150" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lbDep" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnDelDep" runat="server" Text="حذف قسم" 
                    onclick="btnDelDep_Click" /></td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td colspan="2">حذف قسم جزئي</td>
        </tr>
        <tr>
            <td>قائمة الأقسام الجزئية</td>
            <td><asp:ListBox ID="lsSub" runat="server" Height="200" Width="150" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="Label1" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnSub" runat="server" Text="حذف قسم جزئي" 
                    onclick="btnSub_Click" /></td>
        </tr>
        <tr><td colspan="2"><asp:button ID="btnBack" runat="server" Text="عودة" 
                onclick="btnBack_Click" /></td></tr>
    </table>
</asp:Content>

