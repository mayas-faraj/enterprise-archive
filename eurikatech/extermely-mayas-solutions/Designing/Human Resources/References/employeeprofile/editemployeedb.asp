<%@ Language=VBScript %>
<%
Option Explicit
%>

<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

<%
sub update()

on error resume next

dim mempcode
dim mfirstname,mmiddlename,mlastname,mdateofbirth,mplaceofbirth,mmothertongue,msex,mresaddress,mmailaddress,mnicno,meobi,mnomineeinfo,mappointmentdate,memail,mphone,mmaritalstatus
dim munit,mfundingsource,mreligion,msectarion,mnationality,mdomicile,mdepartment,mbloodgroup, mpf, mss
dim sql
mempcode=Request.QueryString("mempno")
mfirstname=Request.Form("firstname") 
mmiddlename=Request.Form("middlename") 
mlastname=Request.Form("lastname") 
munit=cint(Request.Form("unit"))
mfundingsource=cint(Request.Form("fundingsource"))
mreligion=cint(Request.Form("religion"))
msectarion=cint(Request.Form("sect"))
mnationality=cint(Request.Form("nationality"))
mdomicile=cint(Request.Form("domicile"))
mdateofbirth=Request.Form("dateofbirth")
mplaceofbirth=Request.Form("placeofbirth")
mmothertongue=Request.Form("mothertongue")
msex=Request.Form("empsex")
mresaddress=Request.Form("resaddress")
mmailaddress=Request.Form("mailaddress")
mnicno=Request.Form("nicno")
meobi=Request.Form("eobino")
mnomineeinfo=Request.Form("nomineeinfo")
mappointmentdate=Request.Form("dateappoint")
mbloodgroup=cint(Request.Form("bloodgroup"))
mdepartment=cint(Request.Form("department"))
memail=Request.Form("emailaddress")
mphone=Request.Form("phone")
mmaritalstatus=Request.Form("maritalstatus")
mpf=Request.Form("pf")
if mpf="on" then
	mpf=-1
else
	mpf=0
end if		
mss=Request.Form("stopsalary")
if mss="on" then
	mss=-1
else
	mss=0
end if		
sql="update " & session("bookcode") &  ".empprofile set "
sql=sql & " firstname='" & mfirstname & "',"
sql=sql & " middlename='" & mmiddlename & "',"
sql=sql & " lastname='" & mlastname & "',"
sql=sql & " unitcode=" & munit & ","
sql=sql & " fundingsourcecode=" & mfundingsource & ","
sql=sql & " religioncode=" & mreligion & ","
sql=sql & " sectarioncode=" & msectarion & ","
sql=sql & " nationalitycode=" & mnationality & ","
sql=sql & " domicilecode=" & mdomicile & ","
sql=sql & " dateofbirth=to_date('" & mdateofbirth & "','mm dd yy'),"
sql=sql & " placeofbirth='" & mplaceofbirth & "',"
sql=sql & " mothertongue='" & mmothertongue & "',"
sql=sql & " sex='" & msex & "',"
sql=sql & " resaddress='" & mresaddress & "',"
sql=sql & " mailaddress='" & mmailaddress & "',"
sql=sql & " nicno='" & mnicno & "',"
sql=sql & " eobino='" & meobi & "',"
sql=sql & " pf=" & mpf & ","
sql=sql & " stopsalary=" & mss & ","
sql=sql & " nomineeinfo='" & mnomineeinfo & "',"
sql=sql & " appointmentdate=to_date('" & mappointmentdate & "','mm dd yy'),"
sql=sql & " bloodgroupcode=" & mbloodgroup & ","
sql=sql & " departmentcode=" & mdepartment & ","
sql=sql & " email='" & memail & "',"
sql=sql & " phone='" & mphone & "',"
sql=sql & " maritalstatus='" & mmaritalstatus & "'"
sql=sql & " where empcode='" & mempcode & "'"
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Entry cannot updated to database because there is error in data, please check out"
else
	Response.Write "Record Updated Successfully"
end if	
cn.close
set cn=nothing

end sub

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<P><%call update()%></P><P><A href="javascript:window.history.back()">Back to Edit </A></P>

</BODY>
</HTML>
