<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="store.aspx.cs" Inherits="MallSite.store" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table>
        <tr>
            <td><h2>عرض معلومات المتجر</h2></td>
        </tr>
        <tr>
            <td><asp:Label ID="lTitle" runat="server" ForeColor='#0f0fa9' /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lDesc" runat="server" ForeColor='#0f0fa9' /></td>
        </tr>
        <tr>
            <td><asp:Image ID="img" runat="server" Width="300" Height="300" /></td>
        </tr>
        <tr>
            <td><asp:Table BorderStyle="Solid" runat="server" ID="tItems" /></td>
        </tr>
        <tr>
            <td><asp:Button runat="server" ID="bBack" Text="عودة" onclick="bBack_Click" 
                    style="height: 26px" /></td>
        </tr>
        
    </table>
</asp:Content>
