<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCourse.aspx.cs" Inherits="SUVWeb.addCourse" %>

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
        <tr><td>Program Name</td><td><asp:DropDownList runat="server" ID="lstPrograms"/></td></tr>
        <tr><td>Semester</td><td>
        <asp:DropDownList runat="server" ID="lstSemesters">
        <asp:ListItem Text="S9" />
        <asp:ListItem Text="S10"/>
        <asp:ListItem Text="S11" Selected="True" />
        <asp:ListItem Text="S12"/>
        </asp:DropDownList>
        </td></tr>
        <tr><td>Code</td><td><asp:TextBox runat="server" ID="txCode"/></td></tr>
        <tr><td>Course name</td><td><asp:TextBox runat="server" ID="txCourseName"/></td></tr>
        <tr><td>Number Of Sessions</td><td><asp:TextBox runat="server" ID="txNumOfSessions"/></td></tr>
        <tr><td>price</td><td><asp:TextBox runat="server" ID="txPrice"/></td></tr>
        <tr><td>Max Number of students</td><td><asp:TextBox runat="server" ID="txMaxStd"/></td></tr>
        <tr><td>Open</td><td><asp:CheckBox Checked="true" runat="server" ID="chkOpen" /></td></tr>
        <tr><td><asp:Button runat="server" Text="Add" ID="btnAdd" onclick="btnAdd_Click"/></td></tr>
        </table>
        </center>
        </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
