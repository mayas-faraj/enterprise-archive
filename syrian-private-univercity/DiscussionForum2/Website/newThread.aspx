<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newThread.aspx.cs" Inherits="newThread" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add new thread</title><link type="text/css" rel="Stylesheet" href="App_Theme/StyleSheet.css" />
</head>
<body> 
    <form id="form1" runat="server">
    <div>
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
<font face="arial" size="4" color="black">Create New <u><%Response.Write(topic); %></u> Thread</font><br />
    <asp:CustomValidator ID="rfvUnique" runat="server" ControlToValidate="txName" />
<br /><br />
<table border="2" style="border-color:Blue;border-collapse:collapse;background-color:Silver" width="70%">
<tr><td>
To create new thread enter the name of new thread and enter the information of the first message you would like to post ,if you wish to cancel ,simple click one in the link in the bottom of page<br /><br />
new thread name<br />
<asp:TextBox runat="server" ID="txName" Width="353px"></asp:TextBox><br />
    <br />
    Subject<br />
<asp:TextBox runat="server" ID="txSubject" Width="352px"></asp:TextBox><br />
    <br />
    Message<br />
<asp:TextBox runat="server" ID="txMessage" Height="100px" Width="353px" Rows="5" 
        Columns="40" TextMode="MultiLine"></asp:TextBox><br />
    <br />
    Your email address<br />
<asp:TextBox runat="server" ID="txEmail" Width="356px"></asp:TextBox><br />
    <br />
    <asp:Button runat="server" ID="btnPost" Text="Post" OnClick="postThread" />
</td></tr>
</table>
    </div>
    <br />
    <br />
    <a href="threads.aspx?selectTopic=<%Response.Write(qStr); %>">Return to the <%Response.Write(topic);%> threads</a><br />
    <a href="default.aspx">Return to the list of topics</a>
    </form>
</body>
</html>
