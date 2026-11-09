<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="materials.aspx.cs" Inherits="SUVWeb.materials" %>

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
        <asp:Table ID="tblUser" Width="100%" BorderColor="Blue" BorderWidth="5" runat="server">
        <asp:TableHeaderRow>
        <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>Price</asp:TableHeaderCell>
        <asp:TableHeaderCell>Delete</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        </asp:Table>
        </td>
        <td style="width:70%"><center>
        <asp:Table ID="tblCourses" Width="100%" BorderColor="Blue" BorderWidth="5" runat="server">
        <asp:TableHeaderRow>
        <asp:TableHeaderCell>Course</asp:TableHeaderCell>
        <asp:TableHeaderCell>Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>Maximum Number</asp:TableHeaderCell>
        <asp:TableHeaderCell>Register Number</asp:TableHeaderCell>
        <asp:TableHeaderCell>Price</asp:TableHeaderCell>
        <asp:TableHeaderCell>Register Now</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        </asp:Table>
        </center></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
