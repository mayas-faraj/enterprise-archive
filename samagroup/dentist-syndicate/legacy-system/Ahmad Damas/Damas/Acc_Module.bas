Attribute VB_Name = "Module2"
Option Explicit
Public Level As String
Public SelectType As String
Public pForm As String
Public ToPrintForm As Form
'Public Acc_DBUser As String
Public Acc_DBYear As String
'<AHMAD>
Public Acc_DBYearM As String
Public Acc_DBYearT As String
Public Acc_DBYearK As String
Public Acc_DBYearS As String
Public Acc_DBYearSysTem As String
'</AHMAD>
Public Acc_RibaNumber As Integer
Global ggAccName As String
Global FARI_NAME As String
Global FARI_NAME1 As String
Global FARI_TEL As String
Global FARI_SETTING As String
Public Function Get_Riba_Count() As Long
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim LastHissa As Long
    Dim CurrentYear As Long
    '<AHMAD>
        If Acc_DBYear = "" Then
            Set rs = ExecuteSelect(Conn, "Select oldHissa from Acc_Const;select top 1 year(cDate) from Acc_Daily", cancel)
        Else
            Set rs = ExecuteSelect(Conn, "Select oldHissa from Acc_Const" & Acc_DBYear & ";select '" & Acc_DBYearSysTem & " '", cancel)
        End If
    '</AHMAD>
    
    LastHissa = rs.Fields(0).Value
    Set rs = rs.NextRecordset
    CurrentYear = rs.Fields(0).Value

    sql = "select xx.s1+yy.s2 from" & _
            " (select isNull(sum(d.Sinature_Status),0)  as s1" & _
            " From " & _
            " ( " & _
              " select isnull(sum(isnull(d,0)),0) as Ijmali, accNum,isnull(sum(isnull(M,0)),0) as Madin,dbo.sf_Get_Doctor_ID_ByAcc(AccNum) Doctor_ID " & _
              " From Acc_Daily" & Acc_DBYear & _
              " where type=4 and AccParent=(select num from acc_accounts" & Acc_DBYearSysTem & " where acc='270') " & _
              " group by accNum " & _
              " ) x right outer join (select sum(Sinature_Status) Sinature_Status,qsd.Doctor_ID " & _
              " from  Quarter_Signature qs, Quarter_Sinature_Details qsd " & _
              " where qs.Quarter_Year=" & CurrentYear & "  and qsd.Quarter_ID=qs.Quarter_ID " & _
              " group by Doctor_ID " & _
              " ) d on x.Doctor_ID=d.Doctor_ID " & _
              " where isnull(x.Ijmali,0) +  dbo.sf_Get_Doctor_Final_Rasid" & Acc_DBYearSysTem & " (x.AccNum)  >= " & LastHissa & _
              " ) xx" & _
              " ,(select isnull(sum(Sinature_Status),0) as s2 " & _
              " from Doctor_CV dcv inner join Quarter_Sinature_Details qsd on dcv.Doctor_ID=qsd.Doctor_ID" & _
              " inner join Quarter_Signature qs on qsd.Quarter_ID=qs.Quarter_ID" & _
              " where qs.Quarter_Year=" & CurrentYear & _
              " and dcv.Collaborative_Account_no not in (select AccNum from Acc_Daily where type <> 6)) yy"
              Set rs = ExecuteSelect(Conn, sql, cancel)
      Debug.Print sql
      Get_Riba_Count = rs.Fields(0).Value
End Function
Public Function GetCurrentAccYear(ByRef Conn As ADODB.Connection) As String
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    sql = "select top 1 year(cDate) y from Acc_SanadTmp" & Acc_DBYear
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        GetCurrentAccYear = year(Date)
    ElseIf (rs.RecordCount = 0) Then
        GetCurrentAccYear = year(Date)
    Else
        GetCurrentAccYear = rs!Y
    End If
End Function

Public Function GetDoubleValue(val As String, Optional default As Double = 0) As Double
    If val = "" Then
        GetDoubleValue = default
        Exit Function
    End If
    
    If IsNumeric(val) Then
        GetDoubleValue = CDbl(val)
        Exit Function
    End If
    GetDoubleValue = default
End Function

Public Sub SetGridColumns(fga As VSFlexGrid, maxLevel As Integer, ByRef MSection As Integer, ByRef DSection As Integer)
    fga.Cols = (maxLevel + 1) * 2 + 1
    MSection = 0
    DSection = maxLevel + 2
    
    Dim i As Integer
    
    For i = 0 To fga.Cols - 1
        fga.ColHidden(i) = False
    Next i
    
    fga.ColWidth(DSection - 1) = 10 'separator
    fga.ColHidden(DSection - 1) = True
    
    fga.ColWidth(DSection - 2) = 2500
    fga.Cell(flexcpText, 0, DSection - 2) = "«”„ «·Õ”«»"
    fga.ColAlignment(DSection - 2) = flexAlignRightTop
    
    fga.ColWidth(DSection + maxLevel) = 2500
    fga.Cell(flexcpText, 0, DSection + maxLevel) = "«”„ «·Õ”«»"
    fga.ColAlignment(DSection + maxLevel) = flexAlignRightTop
    
    fga.ColWidth(MSection) = 1500
    fga.Cell(flexcpText, 0, MSection) = "„Ã „œÌ‰"
    fga.ColAlignment(MSection) = flexAlignRightTop
    
    fga.ColWidth(DSection) = 1500
    fga.Cell(flexcpText, 0, DSection) = "„Ã œ«∆‰"
    fga.ColAlignment(DSection) = flexAlignRightTop

    'Dim i As Integer
    For i = 1 To maxLevel - 1
        fga.ColWidth(MSection + i) = 1500
        fga.Cell(flexcpText, 0, MSection + i) = " ›«’Ì·"
        fga.ColAlignment(MSection + i) = flexAlignRightTop
        
        fga.ColWidth(DSection + i) = 1500
        fga.Cell(flexcpText, 0, DSection + i) = " ›«’Ì·"
        fga.ColAlignment(DSection + i) = flexAlignRightTop
    Next i

End Sub
Public Sub SetCaption(F As Form)
     Dim S As String
     S = ""
     If Acc_DBYear <> "" Then
        S = " -------- «·”‰… «·„«·Ì…" & Acc_DBYear
     End If
     F.Caption = F.Caption & "/" & ggAccName & S
End Sub

Public Sub CloseRiba(R As Integer, with_checks As Boolean)
    If MsgBox("·‰ Ì„ﬂ‰ﬂ «· —«Ã⁄ ·«Õﬁ« ⁄‰ ≈ﬁ›«· «·—»⁄° ·–«  √ﬂœ „‰ √‰ﬂ ÿ»⁄   ﬁ—Ì— ﬂ‘› «·√ÿ»«¡° Ê„‰ √‰ﬂ ÷»ÿ  ﬁÌ„… «· Ã«Ê“«  »‘ﬂ· ’ÕÌÕ ﬁ»· ≈ﬁ›«· «·—»⁄" & vbCrLf & "Â· √‰  „ √ﬂœ „‰ √‰ﬂ  —Ìœ ≈ﬁ›«· «·—»⁄ø", vbYesNo, " √ﬂÌœ ≈ﬁ›«· «·—»⁄") = vbNo Then Exit Sub
            
    Dim sql As String
    Dim Conn As New ADODB.Connection
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    OpenConnection Conn
    Set rs = ExecuteSelect(Conn, "    select top 1 year(cDate) as y from acc_Daily", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ…  «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·…„‰ ÃœÌœ"
        Conn.Close
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "·«  ÊÃœ √Ì ”‰œ«  ›Ì Â–Â «·”‰…° ·–« ·« Ì„ﬂ‰ ≈ﬁ›«· «·—»⁄ Õ«·Ì«."
        Conn.Close
        Exit Sub
    End If
    Dim year As String
    Dim FromDate, toDate As String
    year = rs!Y
    rs.Close
    Select Case R
        Case 1: FromDate = "'01/01/" & year & "'": toDate = "'31/03/" & year & "'"
        Case 2: FromDate = "'01/04/" & year & "'": toDate = "'30/06/" & year & "'"
        Case 3: FromDate = "'01/07/" & year & "'": toDate = "'30/09/" & year & "'"
        Case 4: FromDate = "'01/10/" & year & "'": toDate = "'31/12/" & year & "'"
    End Select
    sql = "set dateformat dmy select count(*) n from Acc_Daily " & _
          "where type=4 and AccParent=(select num from acc_accounts where acc='270') and cDate between " & FromDate & " and " & toDate
    'Debug.Print Sql
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ…  «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·…„‰ ÃœÌœ"
        Conn.Close
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "·«  ÊÃœ √Ì ”‰œ«  ›Ì Â–« «·—»⁄° ·–« ·« Ì„ﬂ‰ ≈ﬁ›«· «·—»⁄ Õ«·Ì«."
        Conn.Close
        Exit Sub
    End If
    If rs!N <= 0 Then
        MsgBox "·«  ÊÃœ √Ì ”‰œ«  ›Ì Â–« «·—»⁄° ·–« ·« Ì„ﬂ‰ ≈ﬁ›«· «·—»⁄ Õ«·Ì«."
        Conn.Close
        Exit Sub
    End If
    '<AHMAD>
        
        
        If Not with_checks Then
            sql = "SET DateFormat DMY exec sp_CloseRiba " & R
        Else
            With Acc_CloseRibas
                sql = "SET DateFormat DMY exec sp_CloseRiba " & R & "," & _
                    .txtFirst_Check_No.text & ",'" & str(.dtCheck_No.Value) & "'"
            End With
        End If
        
        ExecuteCommand Conn, sql, cancel
        
    '</AHMAD>
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ…  «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·…„‰ ÃœÌœ"
        Conn.Close
        Exit Sub
    End If
    MsgBox " „  —ÕÌ· «·—»⁄ »‰Ã«Õ"
End Sub

Public Function AcceptableValueForCompany(cnn1 As ADODB.Connection, val As Double, oldVal As Double, v As String, vISKaid As Boolean) As Boolean
     
    Dim sql, S As String
    Dim rs As New ADODB.Recordset
    Dim c As Boolean
    If vISKaid Then
        S = "(select isnull(tasdid,0) from Acc_TasdidSanad where sanad=" & v & ")"
    Else
        S = v
    End If
    sql = "set dateformat dmy select x.dbo_ComName, x.Organization_ID, x.dbo_NumSend, " & vbCrLf & _
            "x.dbo_dateSend, x.dbo_Total, x.dbo_ComNumAcc," & vbCrLf & _
            "dbo_Id, isnull(tt.D,0) as rasid," & vbCrLf & _
            "case when x.dbo_Total=tt.D then 2 when tt.d is null then 0 else 1 end as  dbo_Paid" & vbCrLf & _
            "From " & vbCrLf & _
            "(select Organization_Name dbo_ComName, Asking_NO dbo_NumSend, Asking_Date dbo_dateSend, M dbo_Total, Kashef_ID dbo_Id, Organization.Organization_ID, Organization.Account_Number_ID  dbo_ComNumAcc " & vbCrLf & _
            "from Organization inner join Organization_Kashef on (Organization.Organization_ID=Organization_Kashef.Organization_ID) " & vbCrLf & _
            "inner join Acc_DetSanadTMP" & Acc_DBYear & " on (Organization_Kashef.SanadID=Acc_DetSanadTMP.SanadId) " & vbCrLf & _
            "Where Organization.Account_Number_ID = Acc_DetSanadTMP.acc " & vbCrLf & _
            ") x " & vbCrLf & _
            "left outer join ( " & vbCrLf & _
            "     select t.tasdid, sum(d.d) D " & vbCrLf & _
            "     from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & vbCrLf & _
            "     Where t.sanad = d.id " & vbCrLf & _
            "    group by t.tasdid " & vbCrLf & _
            ")tt on tt.tasdid=x.dbo_Id " & vbCrLf & _
            "Where X.dbo_Total! = IsNull(tt.d, 0) and x.dbo_id=" & S '& vbCrLf & _
            '"ORDER BY x.dbo_ComName,x.dbo_dateSend "
    
'    Sql = "    select sum(d.d) D , l.dbo_total tot " & _
'          "  from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d, ListCompanyAll" & Acc_DBYear & " l " & _
'          "  where t.sanad=d.id and l.dbo_id=t.tasdid " & _
'          "        and t.tasdid = " & S & _
'          "  group by l.dbo_total "
'    Debug.Print Sql
    Set rs = ExecuteSelect(cnn1, sql, c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        Exit Function
    End If
    If rs.EOF Then
        AcceptableValueForCompany = True
        Exit Function
    End If
    If rs.RecordCount = 0 Then
        AcceptableValueForCompany = True
        Exit Function
    End If
    If rs!D - oldVal + val > rs!Tot Then
        AcceptableValueForCompany = False
    Else
        AcceptableValueForCompany = True
    End If

End Function


