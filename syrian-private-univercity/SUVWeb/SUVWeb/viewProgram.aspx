<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewProgram.aspx.cs" Inherits="SUVWeb.viewProgram" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
        <tr>
        <td colspan="2"><asp:image ID="Image1" runat="server" Width="100%" AlternateText="main Image" ImageUrl="~/App_Themes/bannar.jpg"/></td>
        </tr>
        <tr>
        <td style="width:30%">
                <table>
        <tr><td>
        Welcome , <asp:Label runat="server" ID="lbName" Text="" />
        </td></tr>
        <tr><td>
        <asp:Button runat="server" ID="btnPrograms" Text="Programs" />
        </td></tr>
        <tr><td>
        <asp:LinkButton runat="server" ID="btnAddProgram" Text="AddProgram" 
                onclick="btnAddProgram_Click" />
        </td></tr>
        <tr><td>
        <asp:LinkButton runat="server" ID="btnViewPrograms" Text="View All Programs"/>
        </td></tr>
        <tr><td>
        <asp:Button runat="server" ID="btnCourses" Text="Courses" />
        </td></tr>
        <tr><td>
        <asp:Button runat="server" ID="btnRegistered" Text="Registered Students" 
                onclick="btnRegistered_Click" />
        </td></tr>
        </table>
        </td>
        <td style="width:70%">
        <center>
        <asp:Table width="70%" id="tblCourses" runat="server" BorderColor="DarkBlue" BorderWidth="5">
        <asp:TableHeaderRow>
        <asp:TableHeaderCell>
        Name
        </asp:TableHeaderCell>
        <asp:TableHeaderCell>
        Description
        </asp:TableHeaderCell>
        <asp:TableHeaderCell>
        Add
        </asp:TableHeaderCell>
        <asp:TableHeaderCell>
        View
        </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        </asp:Table>
        </center>
        </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
