<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeTable.aspx.cs" Inherits="Schadual" MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <strong>ÃœÊ· «·„»«—Ì«  Œ·«· «·√”»Ê⁄ «·ﬁ«œ„ :</strong><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#336666" BorderWidth="3px" CellPadding="4" DataSourceID="timetabledatasource" GridLines="Horizontal" Width="453px" BorderStyle="Double">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="Clubname" HeaderText="«·‰«œÌ «·√Ê·" SortExpression="Clubname" />
            <asp:BoundField DataField="Clubname1" HeaderText="«·‰«œÌ «·À«‰Ì" SortExpression="Clubname1" />
            <asp:BoundField DataField="Placename" HeaderText="«·„ﬂ«‰" SortExpression="Placename" />
        </Columns>
        <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:GridView>
    <asp:SqlDataSource ID="timetabledatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT c1.[Clubname],c2.[Clubname], cities.[Placename] FROM [TimeTable],club c1,club c2,cities&#13;&#10;where&#13;&#10;c1.club = timetable.firstclub and&#13;&#10;c2.club = timetable.secondclub and&#13;&#10;cities.place = timetable.place&#13;&#10;&#13;&#10;">
    </asp:SqlDataSource>
    &nbsp; &nbsp;</asp:Content>

