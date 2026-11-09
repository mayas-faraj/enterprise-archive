<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cities.aspx.cs" Inherits="cities"  MasterPageFile="~/FootMaster.master"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <asp:HyperLink ID="bklink" runat="server" NavigateUrl="~/adminpage.aspx">Back</asp:HyperLink><br />
    <br />
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
        DataKeyNames="place" DataSourceID="citiesds" GridLines="Both" Width="469px">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <EditItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··„œÌ‰… : &nbsp;<asp:Label ID="placeLabel1" runat="server" Text='<%# Eval("place") %>'
                Width="219px"></asp:Label><br />
            <br />
            «·„œÌ‰… : &nbsp;<asp:TextBox ID="placenameTextBox" runat="server" Text='<%# Bind("placename") %>'
                Width="279px"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Õ›Ÿ «· €ÌÌ—« "></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton"
                runat="server" CausesValidation="False" CommandName="Cancel" Text=" —«Ã⁄ ⁄‰ «· €ÌÌ—« "></asp:LinkButton>
        </EditItemTemplate>
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <InsertItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··„œÌ‰… : &nbsp;<asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>'
                Width="225px"></asp:TextBox><br />
            <br />
            «·„œÌ‰… : &nbsp;<asp:TextBox ID="placenameTextBox" runat="server" Text='<%# Bind("placename") %>'
                Width="283px"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Õ›Ÿ"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text=" —«Ã⁄ ⁄‰ «·Õ›Ÿ"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            —ﬁ„ „⁄—› ··„ﬂ«‰ : &nbsp;
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' Width="226px"></asp:Label><br />
            <br />
            «·„ﬂ«‰ : &nbsp;<asp:Label ID="placenameLabel" runat="server" Text='<%# Bind("placename") %>'
                Width="284px"></asp:Label><br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text=" Õ—Ì—"></asp:LinkButton>
            &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                CommandName="Delete" Text="Õ–›"></asp:LinkButton>
            &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                CommandName="New" Text="„œÌ‰… ÃœÌœ…"></asp:LinkButton>
        </ItemTemplate>
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            ≈œ«—… «·„œ‰ «· Ì  Ã—Ì »Â« «·„»«—Ì« 
        </HeaderTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="citiesds" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Cities] WHERE [place] = @original_place AND [placename] = @original_placename"
        InsertCommand="INSERT INTO [Cities] ([place], [placename]) VALUES (@place, @placename)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cities]"
        UpdateCommand="UPDATE [Cities] SET [placename] = @placename WHERE [place] = @original_place AND [placename] = @original_placename">
        <DeleteParameters>
            <asp:Parameter Name="original_place" Type="Int32" />
            <asp:Parameter Name="original_placename" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="placename" Type="String" />
            <asp:Parameter Name="original_place" Type="Int32" />
            <asp:Parameter Name="original_placename" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="place" Type="Int32" />
            <asp:Parameter Name="placename" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
