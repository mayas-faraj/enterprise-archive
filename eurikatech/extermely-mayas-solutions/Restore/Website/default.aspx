<%@ Page Language="C#" AutoEventWireup="true" Debug="false"  CodeFile="default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Discussion Forum</title>
</head>
<body>
<form id="form1" runat="server">
    <%System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename="+MapPath("App_Data\\Discussion.mdf")+";Integrated Security=True;Connect Timeout=30;user instance=true;"); %>
    <%System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select id,name from topics order by id",connect); %>
    <%connect.Open(); %>
    <%System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader(); %>
    <center><font face="times new roman" size="5" color="maroon">Simple Discussion Forum</font><br /><br />
    <hr width="70%" size="2" color="silver" />
    <table width="70%" bgcolor="silver" border="3" cellpadding="0" cellspacing="4">
    <tr align="left">
    <td>Name</td><td>ali</td><td>ahmad</td>
    </tr>
    <tr align="left">
    <td>Email</td><td colspan="2">test@test.com</td>
    </tr>
    <tr align="left">
    <td>Class</td><td colspan="2">class 7</td>
    </tr>
    <tr align="left">
    <td colspan="3" align="center"><a href="myReport.aspx">My Report</a></td>
    </tr>
    </table>
    </center><br />
    <hr width="70%" size="2" color="silver" /><br /><br />
    <font face="Arial" color="green" size="3">Topics</font><br />
    <table border="2" width="70%" cellpadding="0" cellspacing="4">
    <%Int32 i = 0; %>
    <%while (dr.Read()) { if (i % 2 == 0) Response.Write("<tr><td><a href=threads.aspx?selectTopic=" + dr[0].ToString() + ">" + dr[1].ToString() + "</a></td>"); else Response.Write("<td><a href=threads.aspx?selectTopic=" + dr[0].ToString() + ">" + dr[1].ToString() + "</a></td></tr>"); i++; }%>
    <%if (i % 2 != 0) Response.Write("</tr>"); connect.Close(); %>
    <tr>
    <td colspan="2"><a href="newTopic.aspx"><i>[ Create New Topic]</i></a></td>
    </tr>
    </table>
    </form>
</body>
</html>
