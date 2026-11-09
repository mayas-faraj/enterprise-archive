<%

Response.Expires=0
server.ScriptTimeout=600

dim cn

sub Connect()

set cn=server.CreateObject("ADODB.Connection")
With cn	  
    .Provider="MSDAORA.1;Password=" & session("password") & ";User ID=" & session("username") & ";Data Source=" & session("servername")
    .Open  
End With

end sub


%>
