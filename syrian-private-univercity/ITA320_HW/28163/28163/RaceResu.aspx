<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaceResu.aspx.cs" Inherits="Results" MasterPageFile="~/FootMaster.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <strong><span style="font-size: 14pt; color: #ff0066">‰ «∆Ã «·„»«—Ì«  Œ·«· «·√”»Ê⁄:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="periodds" DataTextField="period"
            DataValueField="period" Width="215px" AutoPostBack="True">
        </asp:DropDownList>
        <br />
    <br />
    </span></strong>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#336666" BorderWidth="3px" CellPadding="4" DataSourceID="RaceResDataSource" Width="565px" BorderStyle="Double" GridLines="Horizontal">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="clubname" HeaderText="«·‰«œÌ «·√Ê·" SortExpression="clubname" />
            <asp:BoundField DataField="clubname1" HeaderText="«·‰«œÌ «·À«‰Ì" SortExpression="clubname1" />
            <asp:BoundField DataField="placename" HeaderText="«·„ﬂ«‰" SortExpression="placename" />
            <asp:BoundField DataField="Column1" HeaderText="«·‰ ÌÃ…" ReadOnly="True" SortExpression="Column1" />
            <asp:BoundField DataField="playername" HeaderText="«·Âœ«›" SortExpression="playername" />
        </Columns>
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:GridView>
    <asp:SqlDataSource ID="periodds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="select distinct(period) from racetable"></asp:SqlDataSource>
    <asp:SqlDataSource ID="RaceResDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT c1.clubname,c2.clubname,cities.placename,resultfirstclub+' * '+resultsecondclub,players.playername&#13;&#10;FROM racetable,club c1,club c2,players,cities&#13;&#10;WHERE&#13;&#10;c1.club = racetable.firstclub and&#13;&#10;c2.club = racetable.secondclub and&#13;&#10;players.palyer = goaler and&#13;&#10;raceplace = cities.place">
    </asp:SqlDataSource>
    &nbsp;
    <br />
</asp:Content>

