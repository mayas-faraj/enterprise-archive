<%@ Language=VBScript %>

<%
Option Explicit
%>

<!--#Include File="../include/usercheck.htm" -->
<!--#Include File="../include/connect.asp" -->

<%

dim mstartdate
dim menddate
dim msupid
mstartdate=cdate(Request.Form("startdate"))
menddate=cdate(Request.Form("enddate"))
msupid=clng(Request.Form("supname"))
call connect()
dim rs1
dim sql1
sql1="select * from " & session("bookcode") &  ".supplier where supplierid=" & msupid
set rs1=server.CreateObject("ADODB.Recordset")
rs1.Open sql1,cn

sub display()
dim cmd
dim rs
dim net
dim cost
dim mamount
dim rcdqty
dim rtnqty
dim total
set cmd=server.CreateObject("adodb.command")
cmd.ActiveConnection=cn
cmd.CommandText="qryindsupplier"
cmd.CommandType=&H0002
cmd.Parameters("startdate").Value=mstartdate
cmd.Parameters("enddate").Value=menddate
cmd.Parameters("msupplierid").Value=msupid
set rs=cmd.Execute
do while not rs.EOF

		rcdqty=rs.fields("grnqty")
		if isnull(rcdqty) then
			rcdqty=0
		end if
					
		rtnqty=rs.fields("grtnqty")	
		if isnull(rtnqty) then
			rtnqty=0
		end if
		
dim rate
dim grnamount
dim grtnamount
		
		grnamount=rs.fields("grnamount")
		if isnull(grnamount)then
			grnamount=0
		end if		
		
		grtnamount=rs.fields("grtnamount")
		if isnull(grtnamount)then
			grtnamount=0
		end if
		
		net=rcdqty-rtnqty
		if isnull(net) then
			net=0
		end if
			
		mamount=grnamount-grtnamount
		if isnull(mamount) then
			mamount=0
		end if
		if mamount<>0 and net<>0 then			
			rate=mamount/net
		else 
			rate=0
		end if
			
		if mamount<> 0 then
		with response
			.Write "<tr><td>" & rs.Fields("itemname") & "</td>"
			.Write "<td><div align=right>" & rcdqty & "</div></td>"			
			.Write "<td><div align=right>" & rtnqty & "</div></td>"			 
			.Write "<td><div align=right>" & net & "</div></td>"
			.Write "<td><div align=right>" & formatnumber(rate) & "</div></td>"
			.Write "<td><div align=right>" & formatnumber(mamount) & "</div></td></tr>"
		end with
		total=total+mamount
		end if
		rs.MoveNext
loop	
	with response	
	.Write "<tr><td>Total</td>"
	.Write "<td></td><td></td><td></td><td></td>"
	.Write "<td><div align=right>" & total & "</div></td></tr>"	
	end with
	

rs.Close
set rs=nothing
rs1.Close
set rs1=nothing
cn.close
set cn=nothing		
		
end sub

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Purchase Order Report</title></HEAD>
<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR>
    <TD>Individual Supplier Report</TD>
  </TR></TABLE><TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR>
    <TD WIDTH="37%">Supplier :- <%Response.Write rs1.Fields("suppliername")%></TD>
    <TD WIDTH="37%">Start Date :-<%Response.Write mstartdate%> </TD><TD WIDTH="63%">End 
Date :- <%Response.Write menddate%></TD></TR></TABLE>
<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4">
  <TR> 
    <TD HEIGHT="37" WIDTH="40%"> 
      <div align="center">Item Name</div>
    </TD>
    <TD HEIGHT="37" WIDTH="9%"> 
      <div align="center">Received Qty</div>
    </TD>
    <TD HEIGHT="37" WIDTH="11%"> 
      <div align="center">Return Qty</div>
    </TD>
    <TD HEIGHT="37" WIDTH="11%"> 
      <div align="center">Net Qty</div>
    </TD>
    <TD HEIGHT="37" WIDTH="11%"> 
      <div align="center">Cost Price</div>
    </TD>
    <TD HEIGHT="37" WIDTH="11%"> 
      <div align="center">Amount</div>
    </TD>
  </TR>
   <%call display()%> 
</TABLE>
</BODY>
</HTML>
