<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="MallSite.search" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
<center>
    <table>
        <tr>
            <td colspan="2"><h2>بحث عن المواد</h2></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:TextBox ID="tName" runat="server" /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:TextBox ID="tDetails" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bSearch" runat="server" Text="بحث" 
                    onclick="bSearch_Click" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Table ID="tResult" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="bBack" runat="server" Text="عودة" 
                    onclick="bBack_Click" /></td>
        </tr>
    </table>
</center>
</asp:Content>
