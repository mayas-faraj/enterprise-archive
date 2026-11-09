<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MallSite._default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table border="1" width="60%">
        <tr>
            <td colspan="2">المشاركون بالوظيفة</td>
        </tr>
        <tr>
            <td>Id:</td><td>Eesa_38232</td>
        </tr>
        <tr>
            <td>Id:</td><td>Ahmad_MOMen_38224</td>
        </tr>
        <tr>
            <td colspan="2"><a href="hwReport.doc">تقرير الوظيفة</a></td>
        </tr>
    </table>
    
    <asp:ListView ID="lst" runat="server" />
</asp:Content>
