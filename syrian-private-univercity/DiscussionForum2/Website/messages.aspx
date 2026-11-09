<%@ Page Language="C#" AutoEventWireup="true" CodeFile="messages.aspx.cs" Inherits="messages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="App_Theme/StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%String qStr = Request.QueryString["selectThread"]; %>
    <%System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename="+MapPath("App_Data\\Discussion.mdf")+";Integrated Security=True;Connect Timeout=30;user instance=true;"); %>
    <%System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select topicId from threads where id=" + qStr, connect); %>
    <%connect.Open(); %>
    <%String topicId = cmd.ExecuteScalar().ToString(); %>
    <%cmd.CommandText = "select name from topics where id=" + topicId; %>
    <%String topicName = cmd.ExecuteScalar().ToString(); %>
    <%cmd.CommandText = "select name from threads where id=" + qStr; %>
    <%String threadName = cmd.ExecuteScalar().ToString(); %>

    <center><table width="100%" cellpadding="0" cellspacing="0" style="border-width:0;border-collapse:collapse;padding:0 0 0 0;">
    <tr>
    <td style="width:50%;background-image:url('App_Theme/oppg.gif'); background-repeat: repeat;"></td>
        <td style="width:50;height:200;"><img width="600" height="200" alt="bannar" src="App_Theme/bannar.jpg" />
            </td><td style="width:50%;background-image:url('App_Theme/oppb.gif'); background-repeat: repeat;"></td>
    </tr>
    </table></center>
    <font face="arial" size="4"><a href="threads.aspx?selectTopic=<%Response.Write(topicId); %>"><%Response.Write(topicName); %></a> : <%Response.Write(threadName); %></font>
    <br />
    <asp:CustomValidator ID="rfvUnique" runat="server" ControlToValidate="txSubject"/>
        <br />
    <%cmd.CommandText = "select subject,message,date,email from messages where threadId=" + qStr + " order By date"; %>
    <%System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader(); %>
    <%while (dr.Read())
      { %>
      <table width="80%" border="1" 
            style="border-collapse:collapse;border-color:#0000c0; border-spacing: 0px;">
      <tr style="background-color:#0000a0"><td style="width:80%"><font color="white"><%Response.Write(dr["subject"].ToString());%></font></td>
          <td><font color="white"><%Response.Write(dr["date"].ToString());%></font></td></tr>
      <tr><td colspan="2" style="background-color:#ffffa0">
      <%Response.Write(dr["message"].ToString()); %><br /><br /><%Response.Write(dr["email"].ToString()); %>
      </td></tr>
      </table>
      <br />
      <%} %>
    <br /><br />

    <table border="2" cellspacing="30" style="border-color:Blue;border-collapse:collapse;background-color:Silver" width="80%">
<tr><td>
To post new messasge in thread , type your message below and click post<br /><br />
    Subject<br />
<asp:TextBox runat="server" ID="txSubject" Width="352px"></asp:TextBox><br />
    <br />
    Message<br />
<asp:TextBox runat="server" ID="txMessage" Height="100px" Width="353px" Rows="5" 
        TextMode="MultiLine"></asp:TextBox><br />
    <br />
    Your email address<br />
<asp:TextBox runat="server" ID="txEmail" Width="356px"></asp:TextBox><br />
    <br />
    <asp:Button runat="server" ID="btnPost" Text="Post" OnClick="postMessage" />
</td></tr>
</table>
<br />
    <br />
    <a href="threads.aspx?selectTopic=<%Response.Write(topicId); %>">Return to the <%Response.Write(topicName);%> threads</a><br />
    <a href="default.aspx">Return to the list of topics</a>
    </div>
    </form>
    
</body>
</html>
