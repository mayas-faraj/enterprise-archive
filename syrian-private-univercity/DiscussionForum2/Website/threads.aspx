<%@ Page Language="C#" AutoEventWireup="true" CodeFile="threads.aspx.cs" Inherits="threads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>show threads</title>
    <link type="text/css" rel="Stylesheet" href="App_Theme/StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <%String qStr = Request.QueryString["selectTopic"]; %>
    <%System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename="+MapPath("App_Data\\Discussion.mdf")+";Integrated Security=True;Connect Timeout=30;user instance=true;"); %>
    <%System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select name from topics where id=" + qStr, connect); %>
    <%connect.Open(); %>
    <%String topic = cmd.ExecuteScalar().ToString(); %>
    <div>
    <center><table width="100%" cellpadding="0" cellspacing="0" style="border-width:0;border-collapse:collapse;padding:0 0 0 0;">
    <tr>
    <td style="width:50%;background-image:url('App_Theme/oppg.gif'); background-repeat: repeat;"></td>
        <td style="width:50;height:200;"><img width="600" height="200" alt="bannar" src="App_Theme/bannar.jpg" />
            </td><td style="width:50%;background-image:url('App_Theme/oppb.gif'); background-repeat: repeat;"></td>
    </tr>
    </table><br /><br />
    <hr width="70%" size="2" color="silver" />
</center>
<font face="arial" size="4" color="green"><%Response.Write(topic); %> Treads</font><br /><br />
<table width="60%" border="3" class="infoTbl">
<%cmd.CommandText = "select id,name from threads where topicId=" + qStr + " order by id"; %>
<%System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader(); %>
<%while (dr.Read())
  { %>
<tr><td>
<%Response.Write("<a href=messages.aspx?selectThread=" + dr[0].ToString() + ">" + dr[1].ToString() + "</a>"); %>
</td></tr>
<%} %>
<%connect.Close(); %>
<tr><td><a href="newThread.aspx?selectTopic=<%Response.Write(qStr); %>"><i>[ Create New Thread ]</i></a></td></tr>
</table>
<br /><br />
<a href="default.aspx">Return to the List of Topics</a>
    </div>
    </form>
</body>
</html>
