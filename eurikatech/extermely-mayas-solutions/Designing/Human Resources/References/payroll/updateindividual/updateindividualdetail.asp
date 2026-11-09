<%@ Language=VBScript %>
<%
option explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#include virtual="/payroll/include/connect.asp"-->
<%
DIM MCODE
DIM MPERIOD
dim mmasterid
dim rs1
dim rs
dim rs2
dim sql
dim sql1
dim mtotal
dim mdtotal
dim mpdays
dim madays
dim mdcheck
sub load()

MCODE=Request.Form ("EMPCODE")
set rs=server.CreateObject("ADODB.Recordset")
sql="select * from " & session("bookcode")& ".periodcheck where checkcode=-1"
rs.Open sql,cn
if not rs.EOF then 
	mperiod=rs.Fields ("code")
else 
	Response.Write "Payroll not Generated, First you will generate payroll then try again"	
	Response.End 
end if 	
'mperiod=rs.fields ("code")
rs.close
'MPERIOD=Request.Form ("PERIOD")

set rs1=server.CreateObject("ADODB.Recordset")
rs1.Open "select * from "& session ("bookcode") & ".period where code=" & mperiod ,cn
mpdays=rs1.Fields ("days")

rs1.Close 
'set rs1=server.CreateObject("ADODB.Recordset")
rs1.Open "select * from "& session ("bookcode") & ".qrysalarymasterpay where empcode='" & mcode &"' and periodcode="& mperiod ,cn
if rs1.EOF or rs1.BOF then
	Response.Write "Data Not Available"
	Response.End 
end if	
madays=rs1.Fields ("days")
mmasterid=rs1.Fields ("entryid")
'mdcheck=rs1.Fields ("dcheck")

end sub




sub loadallowance()
call connect()
set rs=server.CreateObject("ADODB.Recordset")
sql="select * from "& session ("bookcode") & ".qrysalarytransad where empcode='" & mcode &"' and periodcode="& mperiod 
rs.Open sql,cn


do while not rs.eof
	mtotal=mtotal+clng(rs.Fields ("amount"))
	with response
		.Write "<tr><td WIDTH=44% HEIGHT=30>" & rs.Fields("name") &  " </td>"
		.Write "<td WIDTH=15% HEIGHT=30 align=right>"& formatnumber(rs.Fields("amount"))& " </td>"
	    sql="javascript:edit('mcode=" & rs.fields("masterid") & "&ALCODE=" & rs.Fields ("allowancecode")& "&mamount=" & rs.Fields ("amount")& "&mname=" & server.URLEncode (rs.Fields ("name"))& "')"
		'sql1="javascript:deleterec('mcode=" & rs.fields("masterid") & "&ALCODE=" & rs.Fields ("allowancecode")& "')"
		sql1="javascript:deleterec('mcode=" & rs.fields("id")& "') "
		if isnull(rs.Fields ("chknull")) then
			.Write "<TD><A href=" & sql & ">Edit" &  "</A></TD>"	
			.Write "<TD><A href=" & sql1 & ">Delete" &  "</A></TD>"	
		end if	
	end with
	
    rs.MoveNext
loop   
rs.Close
set rs=nothing	
cn.close
set cn=nothing

end sub

sub loaddeduction()
call connect()
set rs2=server.CreateObject("ADODB.Recordset")
sql="select * from "& session ("bookcode") & ".qrysalarytransdd where empcode='" & mcode &"' and periodcode="& mperiod 
rs2.Open sql,cn
'mmasterid=rs.Fields ("masterid")

do while not rs2.eof
	mdtotal=mdtotal+clng(rs2.Fields ("amount"))
	with response
		.Write "<tr><td WIDTH=44% HEIGHT=30>" & rs2.Fields("name") &  " </td>"
		.Write "<td WIDTH=15% HEIGHT=30 align=right>" & formatnumber(rs2.Fields("amount")) &  " </td>"
	    sql="javascript:editded('mcode=" & rs2.fields("masterid") & "&ALCODE=" & rs2.Fields ("deductioncode")& "&mamount=" & rs2.Fields ("amount")& "&mname=" & server.URLEncode (rs2.Fields ("name"))& "')"
		'sql1="javascript:deleterecded('mcode=" & rs2.fields("masterid") & "&ALCODE=" & rs2.Fields ("deductioncode")& "')"
		sql1="javascript:deleterecded('mcode=" & rs2.fields("id")&"')"
		.Write "<TD><A href=" & sql & " >Edit" &  "</A></TD>"	
		.Write "<TD><A href=" & sql1 & ">Delete" &  "</A></TD>"	
	end with
    rs2.MoveNext
loop   
rs2.Close
set rs2=nothing	
cn.close
set cn=nothing

end sub


call connect()

sub fillperiod()
dim abc
dim sql
sql="select * from " & session("bookcode") &  ".period order by code"
rs.Open sql,cn
Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
	Response.Write "<OPTION VALUE=" & rs.Fields("code") & ">" & rs.Fields ("name") & "</OPTION>"
	rs.MoveNext
loop
rs.Close

end sub

sub fillcomboemp()
dim abc
dim sql
sql="select * from " & session("bookcode") &  ".empprofile order by empcode"
rs.Open sql,cn
Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
	abc=rs.Fields ("firstname")&" "& rs.Fields ("middlename")&" "&rs.Fields ("lastname")&" ("&rs.Fields ("empcode")&")"
	Response.Write "<OPTION VALUE=" & rs.Fields("empcode") & ">" & abc& "</OPTION>"
	rs.MoveNext
loop
rs.Close

end sub
%>
<script LANGUAGE="JavaScript">

function add1(ic) {
window.open("addind.asp?"+ic,"addIndallowance","height=250,width=400,status=yes,toolbar=no,menubar=no,location=no")
}


function edit(ic) {
window.open("editind.asp?"+ic,"editIndividualEmployee","height=200,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteind.asp?"+ic,"deleteIndividualEmployee","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}

function updatebydays(mperiod,masterid,mdays,odays) {
var ans
var abc
var def
abc=window.form1.mdays.value		
//def=id.value
//def.value=<%response.write mpdays%>
if (abc<=mdays) {
	ans=window.confirm("Are you Sure to Delete")
	if (ans==true) {
		window.open("updatebydays.asp?mperiod="+mperiod+"&masterid="+masterid+"&mdays="+mdays+"&odays="+odays+"&days="+abc,"deleteIndividualEmployee","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
	//	document.form1.action="updatebydays.asp?"& ic &""  
	//	document.form1.submit()  

	}	
}

if (abc>mdays) {
window.alert("Incorrect Number of Days")  
} 
}

function add1ded(ic) {
window.open("addindded.asp?"+ic,"addIndallowance","height=250,width=400,status=yes,toolbar=no,menubar=no,location=no")
}


function editded(ic) {
window.open("editindded.asp?"+ic,"editIndividualEmployee","height=200,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterecded(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteindded.asp?"+ic,"deleteIndividualEmployee","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}

</script>
<html>
<head>
<title>Update Individual Employee</title>

</head>

<body>
<!--#include virtual="/payroll/include/top.htm" --> <!--#include virtual="/payroll/include/navigation.htm" --> 
<table width="100%" border="1" cellpadding="4" bordercolor="#330000" cellspacing="0">
  <tr bgcolor="#330000"> 
    <td> 
      <div align="center"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#CCCCCC">EDITING 
        INDIVIDUAL EMPLOYEE PAYROLL</font></b></font></div>
    </td>
  </tr>
</table>
 <% call load() %> 
<form name="form1" method="post" >
 
  <table width="100%" border="1" bgcolor="#CCCCCC">
    <tr> 
      <td bgcolor="#666666"> 
        <div align="center"><font color="#FFFFFF"><b><font size="3"><%Response.Write rs1.Fields ("empname")+"   "%> 
          </font><font color="#FFFFFF"><b><font size="3"> Salary Period <%Response.Write rs1.Fields ("periodname")%></font></b></font><font size="3"> 
          </font><font color="#FFFFFF"><b><font color="#FFFFFF"><b><font size="3"> 
          (<%Response.Write mpdays%>)</font></b></font></b></font><font size="3"> 
          </font> <font size="3"> </font></b></font></div>
      </td>
    </tr>
    <tr> 
      <td height="36"> 
        <div align="center"><font color="#000000" size="4">Working Days : 
          <input type="text" name="mdays" value="<%Response.Write madays%>" size="10">
          <input type="hidden" name="Update" value="UPDATE DAYS" onclick="javascript:updatebydays('period=<%Response.Write mperiod%> &masterid=<% Response.Write mmasterid%> &mdays=<% Response.Write mpdays%> &odays=<% Response.Write madays%> ')" >
          <input type="button" name="Update" value="UPDATE DAYS" onclick="javascript:updatebydays(<%Response.Write mperiod%>,<% Response.Write mmasterid%>,<% Response.Write mpdays%>,<% Response.Write madays%> )" >
         
          </font> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="1" vspace="0" hspace="0" height="25" cellpadding="4" bordercolor="#660000" cellspacing="0" align="center">
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="22" width="51%"> 
        <div align="center"><b>Salary</b> </div>
      </td>
      <td height="22" width="49%"> 
        <div align="center"><b>Deduction</b></div>
      </td>
    </tr>
  </table>
  <table width="100%" border="1" cellpadding="4" cellspacing="0">
    
    <tr> 
      <td width="51%" valign="top"> 
        <table width="101%" border="0" cellpadding="0" cellspacing="0">
          <% call loadallowance() %> 
          <tr> 
            <td width="55%">&nbsp;</td>
            <td width="17%"> 
              <div align="left"><font color="#FFFFFF"><font color="#FFFFFF"></font></font> 
              </div>
            </td>
            <td width="15%">&nbsp; </td>
            <td width="13%"><font color="#FFFFFF"><font color="#FFFFFF"></font></font></td>
          </tr>
        </table>
      </td>
      <td width="49%" valign="top"> 
        <table width="101%" border="0" cellpadding="0" cellspacing="0">
          <% call loaddeduction()%> 
          <tr> 
            <td width="51%">&nbsp;</td>
            <td width="17%"> 
              <div align="left"><font color="#FFFFFF"><font color="#FFFFFF"><font color="#FFFFFF"></font></font></font> 
              </div>
            </td>
            <td width="17%">&nbsp; </td>
            <td width="15%"><font color="#FFFFFF"><font color="#FFFFFF"></font></font></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="1">
    <tr> 
      <td width="51%" height="29"> 
        <div align="center">
          <table width="101%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="53%">Total Salary</td>
              <td width="18%"><font color="#FFFFFF"><font color="#FFFFFF"><font color="#000000"><% Response.Write formatnumber(mtotal)%></font></font></font></td>
              <td width="15%">&nbsp;</td>
              <td width="14%">&nbsp;</td>
            </tr>
          </table>
        </div>
      </td>
      <td width="49%" height="29"> 
        <div align="center">
          <table width="101%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="51%">Total Deduction</td>
              <td width="17%"><font color="#FFFFFF"><font color="#FFFFFF"><font color="#FFFFFF"><font color="#000000"><% Response.Write formatnumber(mdtotal)%></font></font></font></font></td>
              <td width="18%">&nbsp;</td>
              <td width="14%">&nbsp;</td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="1">
    <tr> 
      <td width="51%"> 
        <div align="center">
          <input type="button" name="add" value="Add Allowances" onClick="javascript:add1('period=<%Response.Write mperiod%> &masterid=<% Response.Write mmasterid%> ' )">
        </div>
      </td>
      <td width="49%"> 
        <div align="center">
          <input type="button" name="ded" value="Add Deduction" onClick="javascript:add1ded('period=<%Response.Write mperiod%> &masterid=<% Response.Write mmasterid%> ' )">
        </div>
      </td>
    </tr>
  </table>  
  <table width="100%" border="1">
    <tr> 
      <td width="51%"> 
        <div align="center"><b>Net Salary : <font size="4"><% Response.Write formatnumber(mtotal-mdtotal)%></font></b></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p><font size="4"></font></p>
</form>
<p>&nbsp;</p>
</body>
</html>
