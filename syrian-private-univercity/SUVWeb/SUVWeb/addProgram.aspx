<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProgram.aspx.cs" Inherits="SUVWeb.addProgram" %>

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
        <td colspan="2"><asp:image runat="server" Width="100%" AlternateText="main Image" ImageUrl="~/App_Themes/bannar.jpg"/></td>
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
        <asp:LinkButton runat="server" ID="btnAddProgram" Text="AddProgram" />
        </td></tr>
        <tr><td>
        <asp:LinkButton runat="server" ID="btnViewPrograms" Text="View All Programs" 
                onclick="btnViewPrograms_Click" />
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
        <table width="70%">
        <tr><td colspan="2">Add Program</td></tr>
        <tr><td>Program Name</td><td><asp:TextBox runat="server" ID="txName" Width="300" /></td></tr>
        <tr><td>Description</td><td><asp:TextBox runat="server" ID="txDescription" Width="300" /></td></tr>
        <tr><td colspan="2"><asp:Button runat="server" Text="Add" ID="btnAdd" onclick="btnAdd_Click" /></td></tr>
        </table>
        </center>
        </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>