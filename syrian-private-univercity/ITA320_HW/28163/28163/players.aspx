<%@ Page Language="C#" AutoEventWireup="true" CodeFile="players.aspx.cs" Inherits="adminplayers"  MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <asp:HyperLink ID="bklink" runat="server" NavigateUrl="~/adminpage.aspx">Back</asp:HyperLink><br />
    &nbsp;<asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="3"
        DataKeyNames="Palyer" DataSourceID="playerds" Width="511px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" GridLines="Both">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <EditItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··«⁄» : &nbsp;<asp:Label ID="PalyerLabel1" runat="server" Text='<%# Eval("Palyer") %>'
                Width="255px"></asp:Label><br />
            <br />
            «”„ «··«⁄» : &nbsp;<asp:TextBox ID="PlayerNameTextBox" runat="server" Text='<%# Bind("PlayerName") %>'
                Width="275px"></asp:TextBox><br />
            <br />
            «·‰«œÌ «·– Ì·⁄» ›ÌÂ : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("Club") %>'
                Width="244px">
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Õ›Ÿ «· €ÌÌ—« "></asp:LinkButton>
            &nbsp; &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server"
                CausesValidation="False" CommandName="Cancel" Text=" —«Ã⁄ ⁄‰ «·Õ›Ÿ"></asp:LinkButton>
        </EditItemTemplate>
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <InsertItemTemplate>
            <br />
            «”„ «··«⁄» : &nbsp;<asp:TextBox ID="PlayerNameTextBox" runat="server" Text='<%# Bind("PlayerName") %>'
                Width="281px"></asp:TextBox><br />
            <br />
            «·‰«œÌ «·–Ì Ì·⁄» ›ÌÂ : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server"
                DataSourceID="clubsds" DataTextField="ClubName" DataValueField="Club" SelectedValue='<%# Bind("Club") %>'
                Width="244px">
            </asp:DropDownList><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Õ›Ÿ «·ÃœÌœ"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:LinkButton
                ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text=" —«Ã⁄ ⁄‰ «·ÃœÌœ"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··«⁄» : &nbsp;<asp:Label ID="PalyerLabel" runat="server" Text='<%# Eval("Palyer") %>'
                Width="250px"></asp:Label><br />
            <br />
            «”„ «··«⁄» : &nbsp;<asp:Label ID="PlayerNameLabel" runat="server" Text='<%# Bind("PlayerName") %>'
                Width="283px"></asp:Label><br />
            <br />
            «·‰«œÌ «·–Ì Ì·⁄» »Â : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="clubsds"
                DataTextField="ClubName" DataValueField="Club" Enabled="False" SelectedValue='<%# Bind("Club") %>'
                Width="244px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text=" Õ—Ì—"></asp:LinkButton>
            &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                CommandName="Delete" Text="Õ–› «··«⁄»"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                CommandName="New" Text="≈÷«›… ·«⁄»"></asp:LinkButton>
        </ItemTemplate>
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            ≈œ«—… «··«⁄»Ì‰ ›Ì «·‰Ê«œÌ «·„Œ ·›…
        </HeaderTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="clubsds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Club]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="playerds" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Players] WHERE [Palyer] = @original_Palyer AND [PlayerName] = @original_PlayerName AND [Club] = @original_Club"
        InsertCommand="INSERT INTO [Players] ([PlayerName], [Club]) VALUES (@PlayerName, @Club)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Players]"
        UpdateCommand="UPDATE [Players] SET [PlayerName] = @PlayerName, [Club] = @Club WHERE [Palyer] = @original_Palyer AND [PlayerName] = @original_PlayerName AND [Club] = @original_Club">
        <DeleteParameters>
            <asp:Parameter Name="original_Palyer" Type="Int32" />
            <asp:Parameter Name="original_PlayerName" Type="String" />
            <asp:Parameter Name="original_Club" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="PlayerName" Type="String" />
            <asp:Parameter Name="Club" Type="Int32" />
            <asp:Parameter Name="original_Palyer" Type="Int32" />
            <asp:Parameter Name="original_PlayerName" Type="String" />
            <asp:Parameter Name="original_Club" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="PlayerName" Type="String" />
            <asp:Parameter Name="Club" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    &nbsp;&nbsp;
</asp:Content>
