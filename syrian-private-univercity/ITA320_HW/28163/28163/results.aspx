<%@ Page Language="C#" AutoEventWireup="true" CodeFile="results.aspx.cs" Inherits="adminresult"  MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <asp:HyperLink ID="bklink" runat="server" NavigateUrl="~/adminpage.aspx">Back</asp:HyperLink><br />
    <br />
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="RaceId"
        DataSourceID="resuds" ForeColor="#333333" Width="547px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditItemTemplate>
            <br />
            —„“ „⁄—› ··ﬁ«¡ : &nbsp;<asp:Label ID="RaceIdLabel1" runat="server" Text='<%# Eval("RaceId") %>'
                Width="222px"></asp:Label><br />
            <br />
            «·‰«œÌ «·√Ê· : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("FirstClub") %>'
                Width="269px">
            </asp:DropDownList><br />
            <br />
            «·‰«œÌ «·„‰«›” : &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("SecondClub") %>'
                Width="257px">
            </asp:DropDownList><br />
            <br />
            „ﬂ«‰ «··ﬁ«¡ : &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="citiesds"
                DataTextField="placename" DataValueField="place" SelectedValue='<%# Bind("RacePlace") %>'
                Width="273px">
            </asp:DropDownList><br />
            <br />
            ‰ ÌÃ… «·‰«œÌ «·√Ê· : &nbsp;<asp:TextBox ID="ResultFirstClubTextBox" runat="server"
                Text='<%# Bind("ResultFirstClub") %>' Width="235px"></asp:TextBox><br />
            <br />
            ‰ ÌÃ… «·‰«œÌ «·„‰«›” : &nbsp;<asp:TextBox ID="ResultSecondClubTextBox" runat="server"
                Text='<%# Bind("ResultSecondClub") %>' Width="231px"></asp:TextBox><br />
            <br />
            «·Âœ«› : &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="playerds"
                DataTextField="PlayerName" DataValueField="Palyer" SelectedValue='<%# Bind("Goaler") %>'
                Width="305px">
            </asp:DropDownList><br />
            <br />
            «·√”»Ê⁄ : &nbsp;<asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("period") %>'
                Width="307px">
                <asp:ListItem Selected="True">«·√Ê·</asp:ListItem>
                <asp:ListItem>«·À«‰Ì</asp:ListItem>
                <asp:ListItem>«·À«·À</asp:ListItem>
                <asp:ListItem>«·—«»⁄</asp:ListItem>
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Õ›Ÿ «· €ÌÌ—« "></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton
                ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text=" —«Ã⁄ ⁄‰ «·Õ›Ÿ"></asp:LinkButton>
        </EditItemTemplate>
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <InsertItemTemplate>
            <br />
            «·‰«œÌ «·√Ê· : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("FirstClub") %>'
                Width="275px">
            </asp:DropDownList><br />
            <br />
            &nbsp; «·‰«œÌ «·„‰«›” :&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="clubsds" DataTextField="ClubName"
                DataValueField="Club" SelectedValue='<%# Bind("SecondClub") %>' Width="257px">
            </asp:DropDownList><br />
            <br />
            „ﬂ«‰ «··ﬁ«¡ : &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="citiesds"
                DataTextField="placename" DataValueField="place" SelectedValue='<%# Bind("RacePlace") %>'
                Width="281px">
            </asp:DropDownList><br />
            <br />
            ‰ ÌÃ… «·›—Ìﬁ «·√Ê· : &nbsp;<asp:TextBox ID="ResultFirstClubTextBox" runat="server"
                Text='<%# Bind("ResultFirstClub") %>' Width="237px"></asp:TextBox><br />
            <br />
            ‰ ÌÃ… «·›—Ìﬁ «·À«‰Ì : &nbsp;<asp:TextBox ID="ResultSecondClubTextBox" runat="server"
                Text='<%# Bind("ResultSecondClub") %>' Width="233px"></asp:TextBox><br />
            <br />
            «·Âœ«› : &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="playerds"
                DataTextField="PlayerName" DataValueField="Palyer" SelectedValue='<%# Bind("Goaler") %>'
                Width="297px">
            </asp:DropDownList><br />
            <br />
            «·√”»Ê⁄ :
            <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("period") %>'
                Width="295px">
                <asp:ListItem Selected="True">«·√Ê·</asp:ListItem>
                <asp:ListItem>«·À«‰Ì</asp:ListItem>
                <asp:ListItem>«·À«·À</asp:ListItem>
                <asp:ListItem>«·—«»⁄</asp:ListItem>
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Õ›Ÿ «·ÃœÌœ"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:LinkButton
                ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text=" —«Ã⁄"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··ﬁ«¡ : &nbsp;<asp:Label ID="RaceIdLabel" runat="server" Text='<%# Eval("RaceId") %>'
                Width="242px"></asp:Label><br />
            <br />
            «·‰«œÌ «·√Ê· : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" Enabled="False" SelectedValue='<%# Bind("FirstClub") %>'
                Width="257px">
            </asp:DropDownList>
            <br />
            <br />
            «·‰«œÌ «·„‰«›” : &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" Enabled="False" SelectedValue='<%# Bind("SecondClub") %>'
                Width="257px">
            </asp:DropDownList><br />
            <br />
            „ﬂ«‰ «·„»«—… : &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="citiesds"
                DataTextField="placename" DataValueField="place" Enabled="False" SelectedValue='<%# Bind("RacePlace") %>'
                Width="265px">
            </asp:DropDownList>
            <br />
            <br />
            ‰ ÌÃ… «·‰«œÌ «·√Ê· : &nbsp;<asp:Label ID="ResultFirstClubLabel" runat="server" Text='<%# Bind("ResultFirstClub") %>'
                Width="227px"></asp:Label><br />
            <br />
            ‰ ÌÃ… «·‰«œÌ «·À«‰Ì : &nbsp;<asp:Label ID="ResultSecondClubLabel" runat="server"
                Text='<%# Bind("ResultSecondClub") %>' Width="230px"></asp:Label><br />
            <br />
            «·Âœ«› : &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="playerds"
                DataTextField="PlayerName" DataValueField="Palyer" Enabled="False" SelectedValue='<%# Bind("Goaler") %>'
                Width="289px">
            </asp:DropDownList>
            <br />
            <br />
            «·√”»Ê⁄ : &nbsp;<asp:DropDownList ID="DropDownList5" runat="server" Enabled="False"
                SelectedValue='<%# Bind("period") %>' Width="287px">
                <asp:ListItem Selected="True">«·√Ê·</asp:ListItem>
                <asp:ListItem>«·À«‰Ì</asp:ListItem>
                <asp:ListItem>«·À«·À</asp:ListItem>
                <asp:ListItem>«·—«»⁄</asp:ListItem>
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text=" Õ—Ì—"></asp:LinkButton>
            &nbsp; &nbsp;
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Õ–›"></asp:LinkButton>
            &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                CommandName="New" Text="ÃœÌœ"></asp:LinkButton>
        </ItemTemplate>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <HeaderTemplate>
            ≈œ«—… «·‰ «∆Ã ··„‰«›”…
        </HeaderTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="citiesds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Cities]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="resuds" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [RaceTable] WHERE [RaceId] = @original_RaceId AND [FirstClub] = @original_FirstClub AND [SecondClub] = @original_SecondClub AND [RacePlace] = @original_RacePlace AND [ResultFirstClub] = @original_ResultFirstClub AND [ResultSecondClub] = @original_ResultSecondClub AND [Goaler] = @original_Goaler AND [Period] = @original_Period"
        InsertCommand="INSERT INTO [RaceTable] ([FirstClub], [SecondClub], [RacePlace], [ResultFirstClub], [ResultSecondClub], [Goaler], [Period]) VALUES (@FirstClub, @SecondClub, @RacePlace, @ResultFirstClub, @ResultSecondClub, @Goaler, @Period)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [RaceTable]"
        UpdateCommand="UPDATE [RaceTable] SET [FirstClub] = @FirstClub, [SecondClub] = @SecondClub, [RacePlace] = @RacePlace, [ResultFirstClub] = @ResultFirstClub, [ResultSecondClub] = @ResultSecondClub, [Goaler] = @Goaler, [Period] = @Period WHERE [RaceId] = @original_RaceId AND [FirstClub] = @original_FirstClub AND [SecondClub] = @original_SecondClub AND [RacePlace] = @original_RacePlace AND [ResultFirstClub] = @original_ResultFirstClub AND [ResultSecondClub] = @original_ResultSecondClub AND [Goaler] = @original_Goaler AND [Period] = @original_Period">
        <DeleteParameters>
            <asp:Parameter Name="original_RaceId" Type="Int32" />
            <asp:Parameter Name="original_FirstClub" Type="Int32" />
            <asp:Parameter Name="original_SecondClub" Type="Int32" />
            <asp:Parameter Name="original_RacePlace" Type="Int32" />
            <asp:Parameter Name="original_ResultFirstClub" Type="String" />
            <asp:Parameter Name="original_ResultSecondClub" Type="String" />
            <asp:Parameter Name="original_Goaler" Type="Int32" />
            <asp:Parameter Name="original_Period" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstClub" Type="Int32" />
            <asp:Parameter Name="SecondClub" Type="Int32" />
            <asp:Parameter Name="RacePlace" Type="Int32" />
            <asp:Parameter Name="ResultFirstClub" Type="String" />
            <asp:Parameter Name="ResultSecondClub" Type="String" />
            <asp:Parameter Name="Goaler" Type="Int32" />
            <asp:Parameter Name="Period" Type="String" />
            <asp:Parameter Name="original_RaceId" Type="Int32" />
            <asp:Parameter Name="original_FirstClub" Type="Int32" />
            <asp:Parameter Name="original_SecondClub" Type="Int32" />
            <asp:Parameter Name="original_RacePlace" Type="Int32" />
            <asp:Parameter Name="original_ResultFirstClub" Type="String" />
            <asp:Parameter Name="original_ResultSecondClub" Type="String" />
            <asp:Parameter Name="original_Goaler" Type="Int32" />
            <asp:Parameter Name="original_Period" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstClub" Type="Int32" />
            <asp:Parameter Name="SecondClub" Type="Int32" />
            <asp:Parameter Name="RacePlace" Type="Int32" />
            <asp:Parameter Name="ResultFirstClub" Type="String" />
            <asp:Parameter Name="ResultSecondClub" Type="String" />
            <asp:Parameter Name="Goaler" Type="Int32" />
            <asp:Parameter Name="Period" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="clubsds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Club]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="playerds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Players]"></asp:SqlDataSource>
</asp:Content>

