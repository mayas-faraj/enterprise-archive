<%@ Page Language="C#" AutoEventWireup="true" CodeFile="declares.aspx.cs" Inherits="opinions" MasterPageFile="~/FootMaster.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <strong><span style="font-size: 16pt; color: #009900"><span style="color: #000099;
        text-decoration: underline"><em>≈ﬁ —«Õ«  «·ﬁ—«¡:<br />
        </em></span>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="decdatasource" ForeColor="#333333" GridLines="None" Width="504px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="pername" HeaderText="«”„ ’«Õ» «·«ﬁ —«Õ" SortExpression="pername" />
                <asp:BoundField DataField="E_mail" HeaderText="«·»—Ìœ «·«·ﬂ —Ê‰Ì" SortExpression="E_mail" />
                <asp:BoundField DataField="declaretext" HeaderText="‰’ «·«ﬁ —«Õ" SortExpression="declaretext" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="decdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [pername], [E_mail], [declaretext] FROM [declares]"></asp:SqlDataSource>
        <br />
        <span style="font-size: 25px; color: #ff0066"> ”ÃÌ· «ﬁ —«Õ ÃœÌœ:<br />
            <br />
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White"
                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="decid"
                DataSourceID="decshowds" GridLines="Both" Width="572px">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <EditItemTemplate>
                    decid:
                    <asp:Label ID="decidLabel1" runat="server" Text='<%# Eval("decid") %>'></asp:Label><br />
                    pername:
                    <asp:TextBox ID="pernameTextBox" runat="server" Text='<%# Bind("pername") %>'>
                    </asp:TextBox><br />
                    E_mail:
                    <asp:TextBox ID="E_mailTextBox" runat="server" Text='<%# Bind("E_mail") %>'>
                    </asp:TextBox><br />
                    declaretext:
                    <asp:TextBox ID="declaretextTextBox" runat="server" Text='<%# Bind("declaretext") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </EditItemTemplate>
                <RowStyle BackColor="White" ForeColor="#330099" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <InsertItemTemplate>
                    <br />
                    «”„ «·„ﬁ —Õ :
                    <asp:TextBox ID="pernameTextBox" runat="server" Text='<%# Bind("pername") %>' Width="325px"></asp:TextBox><br />
                    <br />
                    «·»—Ìœ «·≈·ﬂ —Ê‰Ì :
                    <asp:TextBox ID="E_mailTextBox" runat="server" Text='<%# Bind("E_mail") %>' Width="289px"></asp:TextBox><br />
                    <br />
                    ‰’ «·≈ﬁ —«Õ «·ÃœÌœ :
                    <asp:TextBox ID="declaretextTextBox" runat="server" Text='<%# Bind("declaretext") %>'
                        Width="263px"></asp:TextBox><br />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Õ›Ÿ"></asp:LinkButton>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text=" —«Ã⁄ Õ›Ÿ"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <br />
                    «”„ «·„ﬁ —Õ :
                    <asp:Label ID="pernameLabel" runat="server" Text='<%# Bind("pername") %>'></asp:Label><br />
                    <br />
                    «·»—Ìœ «·≈·ﬂ —Ê‰Ì :
                    <asp:Label ID="E_mailLabel" runat="server" Text='<%# Bind("E_mail") %>'></asp:Label><br />
                    <br />
                    ‰’ «·≈ﬁ —«Õ :
                    <asp:Label ID="declaretextLabel" runat="server" Text='<%# Bind("declaretext") %>'></asp:Label><br />
                    <br />
                    &nbsp;
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="≈ﬁ —«Õ ÃœÌœ"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <HeaderTemplate>
                    ≈ﬁ —«Õ«  “Ê«— «·„Êﬁ⁄
                </HeaderTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="decshowds" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [declares] WHERE [decid] = @original_decid AND [pername] = @original_pername AND [E_mail] = @original_E_mail AND [declaretext] = @original_declaretext"
                InsertCommand="INSERT INTO [declares] ([pername], [E_mail], [declaretext]) VALUES (@pername, @E_mail, @declaretext)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [declares]"
                UpdateCommand="UPDATE [declares] SET [pername] = @pername, [E_mail] = @E_mail, [declaretext] = @declaretext WHERE [decid] = @original_decid AND [pername] = @original_pername AND [E_mail] = @original_E_mail AND [declaretext] = @original_declaretext">
                <DeleteParameters>
                    <asp:Parameter Name="original_decid" Type="Int32" />
                    <asp:Parameter Name="original_pername" Type="String" />
                    <asp:Parameter Name="original_E_mail" Type="String" />
                    <asp:Parameter Name="original_declaretext" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pername" Type="String" />
                    <asp:Parameter Name="E_mail" Type="String" />
                    <asp:Parameter Name="declaretext" Type="String" />
                    <asp:Parameter Name="original_decid" Type="Int32" />
                    <asp:Parameter Name="original_pername" Type="String" />
                    <asp:Parameter Name="original_E_mail" Type="String" />
                    <asp:Parameter Name="original_declaretext" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="pername" Type="String" />
                    <asp:Parameter Name="E_mail" Type="String" />
                    <asp:Parameter Name="declaretext" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </span>
        <br />
        &nbsp;&nbsp;
    </span></strong>
</asp:Content>

