<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clubs.aspx.cs" Inherits="adminteams" MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <asp:HyperLink ID="bklink" runat="server" NavigateUrl="~/adminpage.aspx">Back</asp:HyperLink><br />
    <br />
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="Club"
        DataSourceID="clubsds" Width="446px" ForeColor="#333333">
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <EditItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··‰«œÌ : &nbsp;<asp:Label ID="ClubLabel1" runat="server" Text='<%# Eval("Club") %>'
                Width="191px"></asp:Label><br />
            <br />
            «”„ «·‰«œÌ : &nbsp;<asp:TextBox ID="ClubNameTextBox" runat="server" Text='<%# Bind("ClubName") %>'
                Width="223px"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Õ›Ÿ «· €ÌÌ—« "></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton
                ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text=" —«Ã⁄ ⁄‰ «· €ÌÌ—« "></asp:LinkButton>
        </EditItemTemplate>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="≈÷«›… ‰«œÌ"></asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <br />
            «”„ «·‰«œÌ : &nbsp;<asp:TextBox ID="ClubNameTextBox" runat="server" Text='<%# Bind("ClubName") %>'
                Width="263px"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Õ›Ÿ"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton"
                runat="server" CausesValidation="False" CommandName="Cancel" Text=" —«Ã⁄"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··‰«œÌ :
            <asp:Label ID="ClubLabel" runat="server" Text='<%# Eval("Club") %>' Width="213px"></asp:Label><br />
            <br />
            «”„ «·‰«œÌ : &nbsp;<asp:Label ID="ClubNameLabel" runat="server" Text='<%# Bind("ClubName") %>'
                Width="248px"></asp:Label><br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text=" Õ—Ì—"></asp:LinkButton>
            &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                CommandName="Delete" Text="Õ–›"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                CommandName="New" Text="‰«œÌ ÃœÌœ"></asp:LinkButton>
        </ItemTemplate>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            ≈œ«—… «·‰Ê«œÌ&nbsp;
        </HeaderTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="clubsds" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Club] WHERE [Club] = @original_Club AND [ClubName] = @original_ClubName"
        InsertCommand="INSERT INTO [Club] ([ClubName]) VALUES (@ClubName)" OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [Club]" UpdateCommand="UPDATE [Club] SET [ClubName] = @ClubName WHERE [Club] = @original_Club AND [ClubName] = @original_ClubName">
        <DeleteParameters>
            <asp:Parameter Name="original_Club" Type="Int32" />
            <asp:Parameter Name="original_ClubName" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ClubName" Type="String" />
            <asp:Parameter Name="original_Club" Type="Int32" />
            <asp:Parameter Name="original_ClubName" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ClubName" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

