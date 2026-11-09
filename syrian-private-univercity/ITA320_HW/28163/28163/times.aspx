<%@ Page Language="C#" AutoEventWireup="true" CodeFile="times.aspx.cs" Inherits="adminschadual" MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    &nbsp;<br />
    <asp:HyperLink ID="bklink" runat="server" NavigateUrl="~/adminpage.aspx">Back</asp:HyperLink><br />
    <br />
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="TimeTableId"
        DataSourceID="timesds" GridLines="Both" Width="516px" CellSpacing="2">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <EditItemTemplate>
            <br />
            —ﬁ„ „⁄—› : &nbsp;<asp:Label ID="TimeTableIdLabel1" runat="server" Text='<%# Eval("TimeTableId") %>'
                Width="230px"></asp:Label><br />
            <br />
            «·‰«œÌ «·√Ê· : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("FirstClub") %>'
                Width="259px">
            </asp:DropDownList><br />
            <br />
            «·‰«œÌ «·À«‰Ì : &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("SecondClub") %>'
                Width="255px">
            </asp:DropDownList><br />
            <br />
            «·„ﬂ«‰ : &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="citiesds"
                DataTextField="placename" DataValueField="place" SelectedValue='<%# Bind("Place") %>'
                Width="287px">
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Õ›Ÿ «· €ÌÌ—« "></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton"
                runat="server" CausesValidation="False" CommandName="Cancel" Text=" —«Ã⁄ ⁄‰ «· €ÌÌ—« "></asp:LinkButton>
        </EditItemTemplate>
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <InsertItemTemplate>
            <br />
            «·‰«œÌ «·√Ê· : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("FirstClub") %>'
                Width="259px">
            </asp:DropDownList><br />
            <br />
            «·‰«œÌ «·À«‰Ì : &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("SecondClub") %>'
                Width="255px">
            </asp:DropDownList><br />
            <br />
            «·„ﬂ«‰ : &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="citiesds"
                DataTextField="placename" DataValueField="place" SelectedValue='<%# Bind("Place") %>'
                Width="287px">
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Õ›Ÿ «·ÃœÌœ"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text=" —«Ã⁄"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··„Ê⁄œ : &nbsp;<asp:Label ID="TimeTableIdLabel" runat="server" Text='<%# Eval("TimeTableId") %>'
                Width="215px"></asp:Label><br />
            <br />
            «·‰«œÌ «·√Ê· : &nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds" DataTextField="ClubName"
                DataValueField="Club" Enabled="False" SelectedValue='<%# Bind("FirstClub") %>'
                Width="239px">
            </asp:DropDownList>
            <br />
            <br />
            «·‰«œÌ «·À«‰Ì : &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" Enabled="False" SelectedValue='<%# Bind("SecondClub") %>'
                Width="243px">
            </asp:DropDownList><br />
            <br />
            «·„ﬂ«‰ : &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="citiesds"
                DataTextField="placename" DataValueField="place" Enabled="False" SelectedValue='<%# Bind("Place") %>'
                Width="273px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text=" Õ—Ì—"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Õ–›"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="ÃœÌœ"></asp:LinkButton>
        </ItemTemplate>
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            ≈œ«—… ÃœÊ· «·„‰«›”«  »Ì‰ «·‰Ê«œÌ
        </HeaderTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="clubsds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Club]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="timesds" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [TimeTable] WHERE [TimeTableId] = @original_TimeTableId AND [FirstClub] = @original_FirstClub AND [SecondClub] = @original_SecondClub AND [Place] = @original_Place"
        InsertCommand="INSERT INTO [TimeTable] ([FirstClub], [SecondClub], [Place]) VALUES (@FirstClub, @SecondClub, @Place)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TimeTable]"
        UpdateCommand="UPDATE [TimeTable] SET [FirstClub] = @FirstClub, [SecondClub] = @SecondClub, [Place] = @Place WHERE [TimeTableId] = @original_TimeTableId AND [FirstClub] = @original_FirstClub AND [SecondClub] = @original_SecondClub AND [Place] = @original_Place">
        <DeleteParameters>
            <asp:Parameter Name="original_TimeTableId" Type="Int32" />
            <asp:Parameter Name="original_FirstClub" Type="Int32" />
            <asp:Parameter Name="original_SecondClub" Type="Int32" />
            <asp:Parameter Name="original_Place" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstClub" Type="Int32" />
            <asp:Parameter Name="SecondClub" Type="Int32" />
            <asp:Parameter Name="Place" Type="Int32" />
            <asp:Parameter Name="original_TimeTableId" Type="Int32" />
            <asp:Parameter Name="original_FirstClub" Type="Int32" />
            <asp:Parameter Name="original_SecondClub" Type="Int32" />
            <asp:Parameter Name="original_Place" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstClub" Type="Int32" />
            <asp:Parameter Name="SecondClub" Type="Int32" />
            <asp:Parameter Name="Place" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="citiesds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Cities]"></asp:SqlDataSource>
    &nbsp;&nbsp;
</asp:Content>
