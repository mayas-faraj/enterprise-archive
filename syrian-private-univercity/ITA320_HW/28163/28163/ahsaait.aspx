<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ahsaait.aspx.cs" Inherits="statices" MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    &nbsp;<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="cluborderds"
        Width="540px" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <Columns>
            <asp:BoundField DataField="clubname" HeaderText="ÇáäÇÏí" ReadOnly="True" SortExpression="clubname" />
            <asp:BoundField DataField="laho" HeaderText="áå ãä ÇáÃåÏÇÝ" ReadOnly="True" SortExpression="laho" />
            <asp:BoundField DataField="alih" HeaderText="Úáíå ãä ÇáÃåÏÇÝ" ReadOnly="True" SortExpression="alih" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="cluborderds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT clubname,sum(convert(int,resultfirstclub)) as laho,sum(convert(int,resultsecondclub)) as alih&#13;&#10;FROM racetable,club&#13;&#10;WHERE&#13;&#10;club.club = racetable.firstclub and&#13;&#10;resultfirstclub is not null&#13;&#10;group by clubname&#13;&#10;union&#13;&#10;SELECT clubname,sum(convert(int,resultsecondclub)) as laho,sum(convert(int,resultfirstclub)) as alih&#13;&#10;FROM racetable,club&#13;&#10;WHERE&#13;&#10;club.club = racetable.secondclub and&#13;&#10;resultfirstclub is not null&#13;&#10;group by clubname">
    </asp:SqlDataSource>
</asp:Content>
