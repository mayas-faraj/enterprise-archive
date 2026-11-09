<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="/hris/include/connect.asp" -->

<%
sub Insert()

on error resume next

dim mempcode
dim mfirstname,mmiddlename,mlastname,mdateofbirth,mplaceofbirth,mmothertongue,msex,mresaddress,mmailaddress,mnicno,meobi,mnomineeinfo,mappointmentdate,memail,mphone,mmaritalstatus
dim munit,mfundingsource,mreligion,msectarion,mnationality,mdomicile,mempstatus,mdepartment,mbloodgroup,mpf, mss
dim sql
mempcode=Request.Form("empcode")
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
mpf=Request.Form("pf")
IF MPF<>"-1"   THEN
	MPF=0
END IF	
mss=Request.Form("stopsalary")
IF mss<>"-1"   THEN
	mss=0
END IF	
mphone=Request.Form("phone")
mmaritalstatus=Request.Form("maritalstatus")
sql="insert into " & session("bookcode") &  ".empprofile"
sql=sql & " (empcode,firstname,middlename,lastname,unitcode,"
sql=sql & " fundingsourcecode,religioncode,sectarioncode,nationalitycode,"
sql=sql & " domicilecode,dateofbirth,placeofbirth,mothertongue,sex,"
sql=sql & " resaddress,mailaddress,nicno,eobino,nomineeinfo,"
sql=sql & " appointmentdate,bloodgroupcode,pf,departmentcode,email,phone,maritalstatus)"
sql=sql & " values ('" & mempcode & "','" & mfirstname & "','" & mmiddlename & "','" & mlastname & "',"
sql=sql & munit & "," & mfundingsource & "," & mreligion & "," & msectarion & "," & mnationality & "," & mdomicile & ",to_date('" & mdateofbirth & "','mm dd yy'),'"
sql=sql & mplaceofbirth & "','" & mmothertongue & "','" & msex & "','" & mresaddress & "','" & mmailaddress & "','" 
sql=sql & mnicno & "','" & meobi & "','" & mnomineeinfo & "',to_date('" & mappointmentdate & "','mm dd yy')," 
sql=sql & mbloodgroup & ",'" & mpf & "'," & mdepartment & ",'" 
sql=sql & memail & "','" & mphone & "','" & mmaritalstatus & "')" 
call connect()

cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Employee Profile cannot added to database because there is error in data, please check out"
else
	Response.Write "Record Added Successfully"
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

<P><%call insert()%></P>
<P><A href="javascript:window.history.back()">Back to Add Employee Profile </A></P>

</BODY>
</HTML>
