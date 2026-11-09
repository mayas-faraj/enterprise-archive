<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminpage.aspx.cs" Inherits="admin" MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table style="width: 278px; height: 183px">
        <tr>
            <td style="width: 100px">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/cities.aspx" Width="448px">йзоМА Фежгщи ЦоД</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:HyperLink ID="clublink" runat="server" NavigateUrl="~/clubs.aspx" Width="448px">йзоМА Фежгщи ДФгоМ яМгжМи</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:HyperLink ID="playlink" runat="server" NavigateUrl="~/players.aspx" Width="439px">йзоМА Фежгщи АгзхМД</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:HyperLink ID="gametimelink" runat="server" NavigateUrl="~/times.aspx" Width="447px">йзоМА Феогяи лоФА гАЦхгяМгй</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:HyperLink ID="resultlnk" runat="server" NavigateUrl="~/results.aspx" Width="439px">йзоМА ФйслМА Дйгфл гАЦхгяМгй</asp:HyperLink></td>
        </tr>
    </table>
    &nbsp;</asp:Content>

