VERSION 5.00
Object = "{8767A745-088E-4CA6-8594-073D6D2DE57A}#9.2#0"; "crviewer9.dll"
Begin VB.Form Acc_MasterRep 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ﬁ—Ì—"
   ClientHeight    =   8505
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10605
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   8505
   ScaleWidth      =   10605
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdPrintSet 
      BackColor       =   &H00E0E0E0&
      Caption         =   "≈⁄œ«œ«  «·ÿ»«⁄… .."
      Height          =   375
      Left            =   1680
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   8040
      Width           =   1400
   End
   Begin VB.CommandButton cmdClose 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   8040
      Width           =   1400
   End
   Begin CRVIEWER9LibCtl.CRViewer9 CRViewer91 
      Height          =   7965
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10485
      lastProp        =   500
      _cx             =   18494
      _cy             =   14049
      DisplayGroupTree=   0   'False
      DisplayToolbar  =   -1  'True
      EnableGroupTree =   0   'False
      EnableNavigationControls=   -1  'True
      EnableStopButton=   -1  'True
      EnablePrintButton=   0   'False
      EnableZoomControl=   -1  'True
      EnableCloseButton=   0   'False
      EnableProgressControl=   -1  'True
      EnableSearchControl=   -1  'True
      EnableRefreshButton=   0   'False
      EnableDrillDown =   -1  'True
      EnableAnimationControl=   0   'False
      EnableSelectExpertButton=   0   'False
      EnableToolbar   =   -1  'True
      DisplayBorder   =   0   'False
      DisplayTabs     =   0   'False
      DisplayBackgroundEdge=   -1  'True
      SelectionFormula=   ""
      EnablePopupMenu =   0   'False
      EnableExportButton=   -1  'True
      EnableSearchExpertButton=   0   'False
      EnableHelpButton=   0   'False
      LaunchHTTPHyperlinksInNewBrowser=   -1  'True
   End
   Begin VB.CommandButton cmdPrint 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÿ»«⁄…"
      Height          =   375
      Left            =   3240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   8040
      Width           =   1400
   End
End
Attribute VB_Name = "Acc_MasterRep"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Report As New Acc_CRMasterRep
Dim ReportRaisi As New Acc_CRMasterRaisiRep
Dim ReportDaily As New Acc_CRDailyRep
Dim Rep As Report
Dim oldScaleWidth As Integer
Dim rsSummaries As ADODB.Recordset
Dim RibaCount As Long
Function Get_IsCanceled_In_Quarter_Signatures() As String
    On Error GoTo errHandler
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim rsParameters As ADODB.Recordset
    Dim Acc_Year As String
        
    Set rsParameters = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadtmp" & Acc_DBYearSysTem, cancel)
    
    If cancel Then
        Set rsParameters = Nothing
        Get_IsCanceled_In_Quarter_Signatures = "Œÿ√"
        Exit Function
    End If
    
    Acc_Year = rsParameters.Fields(0).Value
    
    Set rsParameters = Nothing
         
    sql = "Select doctor_id from vQuarter_Signature_Details  Where Quarter_Year = " & Acc_Year & _
          " and isNull(isCanceled,0) = 1 "

          
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        Set rs = Nothing
        Get_IsCanceled_In_Quarter_Signatures = "Œÿ√"
        Exit Function
    End If
    
    Get_IsCanceled_In_Quarter_Signatures = rs.RecordCount
    
    Set rs = Nothing
    
    Exit Function
    
errHandler:
    MsgBox Err.description
End Function
'Dim Rep As New Report
Function Get_Signed_Has_No_Ijmali_Count() As String
    On Error GoTo errHandler
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim rsParameters As ADODB.Recordset
    Dim Acc_Year As String
    Dim Tajaoz As Double
        
    Set rsParameters = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadTMP" & Acc_DBYearSysTem & "  select top 1 Tajaoz from Acc_Const" & Acc_DBYearSysTem, cancel)
    
    If cancel Then
        Set rsParameters = Nothing
        Get_Signed_Has_No_Ijmali_Count = "Œÿ√"
        Exit Function
    End If
    
    Acc_Year = rsParameters.Fields(0).Value
    Set rsParameters = rsParameters.NextRecordset
    Tajaoz = rsParameters.Fields(0).Value
    Set rsParameters = Nothing
    
'    sql = "Set dateformat dmy SELECT count(*) from  " & _
'          "(Select doctor_id from Quarter_Signature qs,Quarter_Sinature_Details qsd " & _
'          " Where qs.Quarter_id = qsd.Quarter_id and qs.Quarter_Year = " & Acc_DBYearSysTem & _
'          " and Doctor_ID not in " & _
'          "     (Select Doctor_ID from sf_Get_Riba_Report" & Acc_DBYearSysTem & "('01/01/" & Acc_Year & "','31/12/" & Acc_Year & "'," & Tajaoz & "))" & _
'          " Group by doctor_id " & _
'          " Having sum(sinature_status) > 0" & _
'          ")x"
    '<Ashraf>
        sql = "Set dateformat dmy SELECT count(*) from  " & _
          "(Select doctor_id from Quarter_Signature qs,Quarter_Sinature_Details qsd " & _
          " Where qs.Quarter_id = qsd.Quarter_id and qs.Quarter_Year = " & Acc_Year & _
          " and Doctor_ID not in " & _
          "     (Select Doctor_ID from sf_Get_Riba_Report" & Acc_DBYearSysTem & "('01/01/" & Acc_Year & "','31/12/" & Acc_Year & "'," & Tajaoz & "))" & _
          " Group by doctor_id " & _
          " Having sum(sinature_status) > 0" & _
          ")x"

    '</Ashraf>
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        Set rs = Nothing
        Get_Signed_Has_No_Ijmali_Count = "Œÿ√"
        Exit Function
    End If
    
    Get_Signed_Has_No_Ijmali_Count = rs.Fields(0).Value
    
    Set rs = Nothing
    
    Exit Function
    
errHandler:
    MsgBox Err.description
    
End Function

Private Sub cmdClose_Click()
On Error Resume Next
    Report.DiscardSavedData
    ReportRaisi.DiscardSavedData
    ReportDaily.DiscardSavedData
    Rep.DiscardSavedData
    Set Report = Nothing
    Set ReportRaisi = Nothing
    Set ReportDaily = Nothing
    Set Rep = Nothing
    Unload Me

End Sub

Private Sub CmdPrint_Click()
    If pForm = "Raisi" Then
        ReportRaisi.PrintOut
    ElseIf pForm = "Daily" Then
        ReportDaily.PrintOut
    ElseIf pForm = "Fari" Then
        Report.PrintOut
    Else
        Rep.PrintOut
    End If
End Sub

Private Sub cmdPrintSet_Click()
    If pForm = "Raisi" Then
        ReportRaisi.PrinterSetup 0
    ElseIf pForm = "Daily" Then
        ReportDaily.PrinterSetup 0
    ElseIf pForm = "Fari" Then
        Report.PrinterSetup 0
    Else
        Rep.PrinterSetup 0
    End If
End Sub





Private Sub Form_Load()
    oldScaleWidth = 10695
    ScaleHeight = 7965
    On Error GoTo errHandler
    Dim Possible_Load As Boolean
    Dim Valid_Report_Instance As Boolean
    
    Valid_Report_Instance = False

    '<AHMAD>
    Report.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
    ReportRaisi.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
    ReportDaily.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
    '</AHMAD>
    Valid_Report_Instance = True


    Possible_Load = True
    SetCaption Me
    Screen.MousePointer = vbHourglass
    Dim sql As String
    Dim Conn As New ADODB.Connection
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim year As String
    OpenConnection Conn
    rs.LockType = adLockOptimistic
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    If pForm = "HissaSanawia" Then
'    <AHMAD>
'        If Acc_DBYear <> "" Then
'            MsgBox "·« Ì„ﬂ‰ ⁄—÷  ﬁ—Ì— «·Õ’… «·”‰ÊÌ… ··”‰Ê«  «·„«·Ì… «·”«»ﬁ…"
'            Exit Sub
'        End If
'   </AHMAD>

        Set Rep = New Acc_HissaSanawia
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        'Dim r As Acc_HissaSanawia
        Dim myRs As ADODB.Recordset
        Dim NoRiba As Boolean
        Dim Mycancel As Boolean
        Set myRs = ExecuteSelect(Conn, "select * from Config where settings like '%NoRiba,%'", Mycancel)
        If Mycancel Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            Exit Sub
        End If
        NoRiba = myRs.RecordCount > 0
        Dim H As String
        Dim hissa As String
        Dim LastHissa As String
        
        RibaCount = Get_Riba_Count
       
        sql = "set dateformat dmy SELECT * FROM dbo.sf_GetHissaSanawia" & Acc_DBYearSysTem & "(" & RibaCount & ") "  'GetHissaSanawiaQuery
        
        On Error GoTo ErrHissa
        rs.Open sql, Conn, , , adCmdText
        
        H = GetHissaValue(Conn, hissa, LastHissa, NoRiba)
        If hissa = "" Then
            MsgBox "·«  ÊÃœ »Ì«‰«  „«·Ì… ›Ì Â–Â «·”‰…   ⁄·ﬁ »«·Õ’… «·”‰ÊÌ…"
            hissa = 0
        End If
        If NoRiba Then
            Rep.hissa.SetText CLng(hissa)
            Rep.Text28.Suppress = True
            Rep.OldHissa.Suppress = True
        Else
            Rep.hissa.SetText CLng(hissa) * 4
            Rep.diffHissa.SetText H
            Rep.OldHissa.SetText LastHissa
        End If
        
        '<AHMAD>
            If NoRiba Then
                SetHissaDocNumWithNoRiba Conn, Rep
            Else
                Set rsSummaries = rs.Clone
                setHissaDocNum Conn, Rep
            End If
            Set rsSummaries = rs.Clone
            setHissaDocNum Conn, Rep
        '</AHMAD>
        
        'Dim CancelHissa As Boolean
        'Set rs = ExecuteSelect(Conn, sql, CancelHissa)
        If NoRiba Then
            H = GetSumHissa(rs)
            rs.MoveFirst
            Rep.diffHissa.SetText CDbl(hissa) - H
        End If
        Rep.Text10.SetText FARI_NAME
        '<AHMAD>
            Rep.txtNo_Ijmali.SetText Get_Signed_Has_No_Ijmali_Count
            Rep.txtIsCanceled.SetText Get_IsCanceled_In_Quarter_Signatures
            Rep.Text16.SetText " Ê“Ì⁄ «·Õ’… «·”‰ÊÌ… ⁄·Ï √ÿ»«¡ «·‰Ÿ«„ «· ⁄«Ê‰Ì" & " - " & "  ··”‰… «·„Õ«”»Ì…" & GetCurrentAccYear(Conn)
        '</AHMAD>
        Rep.Database.SetDataSource rs, 3, 1
        CRViewer91.ReportSource = Rep
        CRViewer91.ViewReport
        Screen.MousePointer = vbDefault
        Exit Sub
ErrHissa:
        Debug.Print Err.description
        Resume Next
    End If
    If pForm = "Tawar2HelpWait" Then
        Set Rep = New Acc_Tawar2HelpWait
        'Dim myRs As ADODB.Recordset
        'Dim cancel As Boolean
        '<AHMAD>
    '        Set rs = ExecuteSelect(Conn, "select cast(Doctor_Id as varchar(10)) u0, Doctor_Name u1, type u2, cast(day(HelpDate) as varchar(4))+'/'+cast(month(HelpDate) as varchar(4))+'/'+cast(year(HelpDate) as varchar(4)) u3, year(HelpDate) u4 " & _
'                                     " From VHelpCard where isnull(OrderPayNum,'')=''  ORDER BY HelpDate", Cancel)
            sql = "select cast(Doctor_Id as varchar(10)) u0, Doctor_Name u1, type u2, " & _
                  "cast(day(HelpDate) as varchar(4))+'/'+cast(month(HelpDate) as varchar(4))+'/'+ " & _
                  "cast(year(HelpDate) as varchar(4)) u3, year(HelpDate) u4 " & _
                  " From VHelpCard where isnull(OrderPayNum,'')=''  " & _
                  " and year(HelpDate) = " & Tawar2_Report_Year & _
                  " ORDER BY HelpDate"
            Set rs = ExecuteSelect(Conn, sql, cancel)
            Rep.txtYear.SetText str(Tawar2_Report_Year)
        '</AHMAD>
        Rep.Text10.SetText FARI_NAME
        Rep.Database.SetDataSource rs, 3, 1
        CRViewer91.ReportSource = Rep
        CRViewer91.ViewReport
        Screen.MousePointer = vbDefault
    
        Exit Sub
    End If
    If pForm = "Tawar2HelpPay" Then
        Set Rep = New Acc_Tawar2HelpPay
        'Dim myRs As ADODB.Recordset
        'Dim cancel As Boolean
        '<AHMAD>
        sql = "select cast(Doctor_Id as varchar(10)) u0, Doctor_Name u1, type u2, " & _
              "cast(day(HelpDate) as varchar(4))+'/'+cast(month(HelpDate) as varchar(4))+'/' +" & _
              "cast(year(HelpDate) as varchar(4)) u3, year(HelpDate) u4 , cast(Amount as varchar(4)) u5,  " & _
              "cast(OrderPayNum as varchar(4)) u6, Amount " & _
              " From VHelpCard " & _
              " where isnull(OrderPayNum,'')!=''  " & _
              " and year(HelpDate) = " & Tawar2_Report_Year & _
              " ORDER BY HelpDate"
        Set rs = ExecuteSelect(Conn, sql, cancel)
        Rep.txtYear.SetText str(Tawar2_Report_Year)
        '</AHMAD>
        Rep.Text10.SetText FARI_NAME
        Rep.Database.SetDataSource rs, 3, 1
        CRViewer91.ReportSource = Rep
        CRViewer91.ViewReport
        Screen.MousePointer = vbDefault
    
        Exit Sub
    End If
    If pForm = "TadamonFara" Then
        Set Rep = New Acc_TadamonFromFaraRep
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        'Dim r As Acc_KashfTabibRep
        sql = "Set DateFormat DMY select sanadName accName,cDate as Ijmali, d as a_5 " & _
              "from acc_Daily" & Acc_DBYear & " where accno='262' " & _
              " and cDate between '" & dlgTadamoniHissa_Date_Filter.Start_Date & _
              "' and '" & dlgTadamoniHissa_Date_Filter.End_Date & "'"
        rs.Open sql, Conn, , , adCmdText
        Rep.Text10.SetText FARI_NAME
        '<AHMAD>
            Rep.txtFrom.SetText dlgTadamoniHissa_Date_Filter.Start_Date
            Rep.txtTo.SetText dlgTadamoniHissa_Date_Filter.End_Date
        '</AHMAD>
        Rep.Database.SetDataSource rs, 3, 1
        CRViewer91.ReportSource = Rep
        CRViewer91.ViewReport
        Screen.MousePointer = vbDefault
        
        Exit Sub
    End If
    
    If pForm = "TadamonHissa" Then
        
        Possible_Load = True
        rs.Open "select top 1 YEAR(cDate) Y from acc_sanadTMP" & Acc_DBYear & " select top 1 Tajaoz from Acc_Const" & Acc_DBYear, Conn, , , adCmdText
        If rs.EOF Then
            MsgBox "·«  ÊÃœ »Ì«‰«  Œ·«· «·”‰… «·„«·Ì… «·Õ«·Ì…"
            Possible_Load = False
            Screen.MousePointer = vbDefault
            Exit Sub
        End If
        If IsNull(rs!Y) Then
            MsgBox "·«  ÊÃœ »Ì«‰«  Œ·«· «·”‰… «·„«·Ì… «·Õ«·Ì…"
            Possible_Load = False
            Screen.MousePointer = vbDefault
            Exit Sub
        End If
        
        If Possible_Load = True Then
            year = rs!Y
            Set rs = rs.NextRecordset
            If IsNull(rs!Tajaoz) Or rs.RecordCount = 0 Then
                MsgBox "·« Ì„ﬂ‰ ⁄—÷ Â–« «· ﬁ—Ì— »”»» ⁄œ„ ≈œŒ«· ﬁÌ„… «· Ã«Ê“ ° √Œ»— „Õ«”» «·‰Ÿ«„ «· ⁄«Ê‰Ì ·ÌﬁÊ„ »≈œŒ«· ﬁÌ„… «· Ã«Ê“ „‰ ›÷·ﬂ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
                Possible_Load = False
                Screen.MousePointer = vbDefault
                Exit Sub
            End If
            sql = GetTadamonHissaQuery(year, rs!Tajaoz)
            Debug.Print sql
            rs.Close
            rs.Open sql, Conn, , , adCmdText
            
            Set Rep = New Acc_TadamonFromTaoniRep
            Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
            'Dim r As Acc_KashfTabibRep
            Rep.Text10.SetText FARI_NAME
            '<AHMAD>
                Rep.txtFrom.SetText dlgTadamoniHissa_Date_Filter.Start_Date
                Rep.txtTo.SetText dlgTadamoniHissa_Date_Filter.End_Date
            '</AHMAD>
            Rep.Database.SetDataSource rs, 3, 1
            CRViewer91.ReportSource = Rep
            CRViewer91.ViewReport
            Screen.MousePointer = vbDefault
            Exit Sub
         End If
    End If
    
    If pForm = "KashfTabib" Or pForm = "KashfTabibTabib" Then
        rs.Open "select top 1 YEAR(cDate) Y from acc_sanadTMP" & Acc_DBYear & " select top 1 Tajaoz from Acc_Const" & Acc_DBYear, Conn, , , adCmdText
        If rs.EOF Then
            MsgBox "·«  ÊÃœ »Ì«‰«  Œ·«· «·”‰… «·„«·Ì… «·Õ«·Ì…"
            Screen.MousePointer = vbDefault
            Exit Sub
        End If
        If IsNull(rs!Y) Then
            Screen.MousePointer = vbDefault
            MsgBox "·«  ÊÃœ »Ì«‰«  Œ·«· «·”‰… «·„«·Ì… «·Õ«·Ì…"
            Exit Sub
        End If
        year = rs!Y
        Set rs = rs.NextRecordset
        sql = getHashfTabibQuery(year, rs!Tajaoz)
        '<Ashraf>
        sql = sql & " order by accName"
        '</Ashraf>
        Debug.Print sql
        rs.Close
        rs.Open sql, Conn, , , adCmdText
        If pForm = "KashfTabibTabib" Then
            If Acc_DBYear = "" Or val(Acc_DBYear) > 2005 Then
               Set Rep = New Acc_KashfTabibTabibRep2
            Else
                Set Rep = New Acc_KashfTabibTabibRep
            End If
            Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        Else
         '</Mohammad>
          ' begin this is for year 2006 and up
            If Acc_DBYear = "" Or val(Acc_DBYear) > 2005 Then
                Set Rep = New Acc_KashfTabibRep2
            Else
                Set Rep = New Acc_KashfTabibRep
            End If
         '</Mohammad>
            Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        End If
        'Dim r As Acc_KashfTabibRep
        Rep.Text9.SetText Rep.Text9.text & GetRibaAsName & " " & year
        '<Mohammad>
         If Acc_DBYear = "" Or val(Acc_DBYear) > 2005 Then
            Rep.Text29.SetText Rep.Text29.text & " " & GetCurrentDesertPercent & " %"
         End If
            
        '</Mohammad>
        Rep.Text10.SetText FARI_NAME

        Rep.Database.SetDataSource rs, 3, 1
        CRViewer91.ReportSource = Rep
        CRViewer91.ViewReport
        
        Screen.MousePointer = vbDefault
        
        Exit Sub
    End If
    
    'rs.Open "select acc c0,acc c1,acc c2,acc c3,acc c4,acc c5,acc c6 from acc_accounts where 1=0", conn, , , adCmdText
    If Possible_Load Then
        rs.Open "select c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10 from U where 1=0", Conn, , , adCmdText
    End If
    
'    Set rs = ExecuteSelect(conn, , cancel)
    Set rs.ActiveConnection = Nothing
    If pForm = "Raisi" Then
        FillRsData rs, ToPrintForm.fg
        ReportRaisi.Text9.SetText ToPrintForm.lblAccount
        ReportRaisi.Text13.SetText ToPrintForm.lblM
        ReportRaisi.Text14.SetText ToPrintForm.lblD
        ReportRaisi.Text15.SetText ToPrintForm.lblRasid
        ReportRaisi.Text17.SetText ToPrintForm.txtFrom.Value
        ReportRaisi.Text19.SetText ToPrintForm.txtTo.Value
        Set Rep = ReportRaisi
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
'        ReportRaisi.Database.SetDataSource rs, 3, 1
'        CRViewer91.ReportSource = ReportRaisi
    ElseIf pForm = "Sanad" Or pForm = "Iftitahi" Or pForm = "Sandok" Then
        Dim FF As Form
        Dim ssss As String
        ssss = "”‰œ «·ﬁÌœ —ﬁ„ "
        Set Rep = New Acc_SanadRep
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        Set FF = ToPrintForm
        If pForm = "Sanad" Then
            'Set FF = Acc_DailyNew
        ElseIf pForm = "Iftitahi" Then
            'Set FF = Acc_DailyOpening
        Else
            Set FF = Acc_Sandok
            Rep.Text6.Suppress = False
            Rep.Text5.Suppress = False
            Rep.Text6.SetText Acc_Sandok.lblBalance.Caption
            ssss = "”‰œ ﬁÌœ ’‰œÊﬁ —ﬁ„ "
        End If
        FillRsData rs, FF.fg
        Rep.Text13.SetText FF.lblM
        Rep.Text14.SetText FF.lblD
        Rep.Text17.SetText FF.txtcDate.Value
        Rep.Text19.SetText FF.txtDscrb.text
        If FF.name = "Acc_DailyNewManual" Then
            Rep.Text16.SetText ssss & FF.txtNum.text
        Else
            Rep.Text16.SetText ssss & FF.txtid.text
        End If
    ElseIf pForm = "Daily" Then
        FillRsData rs, ToPrintForm.fg
        ReportDaily.Text13.SetText ToPrintForm.lblM
        ReportDaily.Text14.SetText ToPrintForm.lblD
        ReportDaily.Text17.SetText ToPrintForm.txtFrom.Value
        ReportDaily.Text19.SetText ToPrintForm.txtTo.Value
        Set Rep = ReportDaily
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        
'        ReportDaily.Database.SetDataSource rs, 3, 1
'        CRViewer91.ReportSource = ReportDaily
    ElseIf pForm = "Mizan" Then
        FillRsData rs, ToPrintForm.fg
        'Set rep = New Acc_MizanRep
        Dim R As New Acc_MizanRep
        R.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        Dim S As String
        S = " »«·√—’œ… Ê«·„Ã«„Ì⁄"
        If ToPrintForm.optBoth Then
            R.Text13.SetText ToPrintForm.lblM
            R.Text14.SetText ToPrintForm.lblD
            R.Text6.SetText ToPrintForm.lblSumM
            R.Text21.SetText ToPrintForm.lblSumD
        Else
            R.c31.Suppress = True
            R.c41.Suppress = True
            R.c21.Width = R.c41.Width + 3200
            R.c21.Left = R.c41.Left
            R.Line6.Suppress = True
            R.Line7.Suppress = True
            R.Text6.Suppress = True
            R.Text21.Suppress = True
            
            If ToPrintForm.optSums Then
                S = " »«·„Ã«„Ì⁄"
                R.Text3.Left = 9360
                R.Text4.Left = 7680
                R.Text1.Width = R.Text1.Width + 3200
                R.Text5.Suppress = True
                R.Text2.Suppress = True
                R.Text13.SetText ToPrintForm.lblSumM
                R.Text14.SetText ToPrintForm.lblSumD
            Else
                S = " »«·√—’œ…"
                R.Text1.Width = R.Text1.Width + 3200
                R.Text3.Suppress = True
                R.Text4.Suppress = True
                R.Text13.SetText ToPrintForm.lblM
                R.Text14.SetText ToPrintForm.lblD
            End If
        End If
        S = R.Text9.text & S
        R.Text15.SetText ToPrintForm.lblRasid
        R.Text9.SetText S
                
        R.Text17.SetText ToPrintForm.txtFrom.Value
        R.Text19.SetText ToPrintForm.txtTo.Value
        Set Rep = R
    ElseIf pForm = "Mizanieh" Or pForm = "Motajara" Or pForm = "Arbah" Then
        Dim Level As Integer
        Dim F As Form
        Set F = ToPrintForm
'        If pForm = "Mizanieh" Then
'            Set F = Acc_Mizanieh
'        ElseIf pForm = "Motajara" Then
'            Set F = Acc_Motajara
'        Else
'            Set F = Acc_Arbah
'        End If
        Level = F.fga.Cols - 3
        'MsgBox Acc_Arbah.fg.Cols
        Level = Level / 2
        If Level > 4 Then
            MsgBox "·« Ì„ﬂ‰ «” ⁄—«÷  ﬁ—Ì— ⁄·Ï √ﬂÀ— „‰ 4 „” ÊÌ« "
            Screen.MousePointer = vbDefault
            Exit Sub
        End If
        
        Dim RM As Report
        'RM.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        If Level > 2 Then
            Set RM = New Acc_FinalsL4Rep
            RM.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
            
        Else
            Set RM = New Acc_FinalsL2Rep
            RM.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        End If
        If ActiveDatabaseName = "tawar2" Then
            RM.txtRepTitle.SetText "’‰œÊﬁ «·ÿÊ«—∆"
        ElseIf ActiveDatabaseName = "stock" Then
            RM.txtRepTitle.SetText "’‰œÊﬁ «·„” Êœ⁄"
        ElseIf ActiveDatabaseName = "fari" Then
            RM.txtRepTitle.SetText "’‰œÊﬁ «·›—⁄"
        ElseIf ActiveDatabaseName = "tadamonfari" Then
            RM.txtRepTitle.SetText "’‰œÊﬁ «· ÷«„‰ «·«Ã „«⁄Ì «·›—⁄Ì"
        Else
            RM.txtRepTitle.SetText "’‰œÊﬁ «·‰Ÿ«„ «· ⁄«Ê‰Ì"
        End If
        If pForm = "Mizanieh" Then
'            Set f = Acc_Mizanieh
            '<AHMAD>
           ' If InStr(1, FARI_SETTING, "NumState2") > 0 Then
                 RM.Text9.SetText "«·„Ì“«‰Ì… «·Œ «„Ì… ·‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ - ›—⁄ " & Current_State.name & " „ÊﬁÊ›… ›Ì " & format("31/12/" & GetCurrentAccYear(Conn), "dd/mm/yyyy")
                 RM.Text16.Suppress = True
                 RM.Text17.Suppress = True
                 RM.Text18.Suppress = True
                 RM.Text19.Suppress = True
           ' End If
            '</AHMAD>
            RM.Text15.Suppress = True
            RM.Text20.Suppress = True
        ElseIf pForm = "Motajara" Then
'            Set f = Acc_Motajara
            RM.Text15.SetText ToPrintForm.lblBal
            RM.Text20.SetText ToPrintForm.lblBalHead
            RM.Text9.SetText " ﬁ—Ì— «·„ «Ã—…"
        Else
'            Set f = Acc_Arbah
            RM.Text15.SetText ToPrintForm.lblBal
            RM.Text20.SetText ToPrintForm.lblBalHead
            RM.Text9.SetText " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
        End If
        FillRsData rs, F.fga
        'Set rep = New Acc_MizanRep
        If Level = 3 Then
            RM.c81.Suppress = True
            RM.c91.Suppress = True
            RM.LineH.Suppress = True
            RM.LineH2.Suppress = True
            RM.TextH.Suppress = True
            RM.TextH2.Suppress = True
            '<AHMAD>
            RM.Line18.Suppress = True
            RM.Line7.Suppress = True
            '</AHMAD>
            RM.c31.Width = RM.c31.Width + RM.c41.Width
            RM.c71.Width = RM.c71.Width + RM.c91.Width
            RM.c41.Width = 1450
            
            RM.c71.Left = RM.c91.Left
            RM.c31.Left = RM.c41.Left
            
            RM.c61.Left = RM.c71.Left + RM.c71.Width
            RM.c51.Left = RM.c61.Left + RM.c61.Width
            RM.c41.Left = RM.c51.Left + RM.c51.Width
        End If
        If Level = 1 Then
            RM.c51.Suppress = True
            RM.c41.Suppress = True
            RM.LineH.Suppress = True
            RM.LineH2.Suppress = True
            RM.TextH.Suppress = True
            RM.TextH2.Suppress = True
            RM.c11.Width = RM.c11.Width + RM.c21.Width
            RM.c31.Width = RM.c31.Width + RM.c51.Width
            RM.c21.Width = 1600
            
            RM.c31.Left = RM.c51.Left
            RM.c11.Left = RM.c21.Left
            
            RM.c21.Left = RM.c31.Left + RM.c31.Width
            'RM.c51.Left = RM.c61.Left + RM.c61.Width
            'RM.c41.Left = RM.c51.Left + RM.c51.Width
        End If
        'Else
        'End If
        RM.Text17.SetText F.txtFrom.Value
        RM.Text19.SetText F.txtTo.Value
        RM.Text13.SetText F.lblM
        RM.Text14.SetText F.lblD
        
        Set Rep = RM
    ElseIf pForm = "TasdidRep" Then
        FillRsData rs, Acc_Tasdid.fga
        Set Rep = New Acc_TasdidRep
        '<AHMAD>
            Rep.Text13.SetText Acc_Tasdid.motalabat_summary
            Rep.Text14.SetText Acc_Tasdid.tasdid_summary
        '</AHMAD>
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
    ElseIf pForm = "Tawar2TasdidRep" Then
        FillRsData rs, Acc_NewTawar2Tasdid.fg
        Set Rep = New Acc_Tawar2TasdidRep
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        Rep.txtSummary.SetText Acc_NewTawar2Tasdid.lblSummary.Caption
        If Acc_TAWAR2Tasdid.optTasdid.Value Then
            Rep.Text16.SetText " ﬁ—Ì— «·√ÿ»«¡ «·„”œœÌ‰ ·’‰œÊﬁ «·ﬂÊ«—À"
        ElseIf Acc_TAWAR2Tasdid.optNotTasdid.Value Then
            Rep.Text16.SetText " ﬁ—Ì— «·√ÿ»«¡ €Ì— «·„”œœÌ‰ ·’‰œÊﬁ «·ﬂÊ«—À"
        ElseIf Acc_TAWAR2Tasdid.optAll.Value Then
            Rep.Text16.SetText " ﬁ—Ì—  ”œÌœ «·√ÿ»«¡ ·’‰œÊﬁ «·ﬂÊ«—À"
        End If
    Else
        'Report.c01.Value = "hi"
        FillRsData rs, ToPrintForm.fg
        Report.Text20.SetText ToPrintForm.txtAcc
        Report.Text9.SetText ToPrintForm.lblAccount
        Report.Text13.SetText ToPrintForm.lblM
        Report.Text14.SetText ToPrintForm.lblD
        Report.Text15.SetText ToPrintForm.lblRasid
        Report.Text17.SetText ToPrintForm.txtFrom.Value
        Report.Text19.SetText ToPrintForm.txtTo.Value
        Set Rep = Report
        Rep.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
        
'        Report.Database.SetDataSource rs, 3, 1
'        CRViewer91.ReportSource = Report
        'CRViewer91.ReportSource = Report
    End If
    'CRViewer91.ReportSource = Report
    Rep.Text10.SetText FARI_NAME
    Rep.Database.SetDataSource rs, 3, 1
    CRViewer91.ReportSource = Rep
    CRViewer91.ViewReport
    Screen.MousePointer = vbDefault
    Exit Sub
errHandler:
    Screen.MousePointer = vbDefault
    If Valid_Report_Instance Then
        MsgBox Err.description, vbCritical + vbOKOnly, Err.Number
    End If
    MsgBox Err.description, vbCritical + vbOKOnly, Err.Number
End Sub

Private Sub Form_Resize()
'CRViewer91.Top = 0
'CRViewer91.Left = 0
'CRViewer91.Height = ScaleHeight - 700
'CRViewer91.Width = ScaleWidth
'cmdClose.Top = ScaleHeight - 600
'cmdPrint.Top = ScaleHeight - 600
'cmdPrintSet.Top = ScaleHeight - 600

'    Dim Alpha As Double
'    If oldScaleWidth = 0 Then
'        oldScaleWidth = ScaleWidth
'        Exit Sub
'    End If
'    If (MDIMain.WindowState = vbMinimized) Then
'        Exit Sub
'    End If
'    If (Me.WindowState = vbMinimized) Then
'        Exit Sub
'    End If
'    Alpha = ScaleWidth / oldScaleWidth
'    Dim ctrl As Control
'    For Each ctrl In Me.Controls
'        ctrl.Left = ctrl.Left * Alpha
'        ctrl.Width = ctrl.Width * Alpha
'    Next
'    oldScaleWidth = ScaleWidth
    If ScaleHeight < 700 Then Exit Sub
    CRViewer91.Height = ScaleHeight - 700
    CRViewer91.Width = ScaleWidth
    cmdClose.Top = ScaleHeight - 600
    cmdPrint.Top = ScaleHeight - 600
    cmdPrintSet.Top = ScaleHeight - 600
End Sub
Private Sub FillRsData(ByRef rs As ADODB.Recordset, ByRef fg As VSFlexGrid)
    Dim i, j, Col As Long
    For i = 1 To fg.Rows - 1
        If Not fg.RowHidden(i) Then
            rs.addNew
            Col = 0
            For j = 0 To fg.Cols - 1
                If Not fg.ColHidden(j) Then
                    rs.Fields(Col).Value = fg.Cell(flexcpText, i, j)
                    Col = Col + 1
                End If
            Next j
        End If
    Next i
End Sub

Private Function getHashfTabibQuery(year As String, Tajaoz As String) As String
    Dim FromDate As String
    Dim toDate As String
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    
    Select Case Acc_RibaNumber
        Case 1: FromDate = "'01/01/" & year & "'": toDate = "'31/03/" & year & "'"
        Case 2: FromDate = "'01/04/" & year & "'": toDate = "'30/06/" & year & "'"
        Case 3: FromDate = "'01/07/" & year & "'": toDate = "'30/09/" & year & "'"
        Case 4: FromDate = "'01/10/" & year & "'": toDate = "'31/12/" & year & "'"
        Case 5: FromDate = "'01/01/" & year & "'": toDate = "'31/12/" & year & "'"
    End Select

'<AHMAD>
'        Sql = "set dateformat dmy  select f.accName, f.Ijmali, f.Tajaoz, f.Daen, f.Madin, f.RasidD,f.RasidM, f.a25 as ToHissa,  " & _
'        "   cast(a25*68/100 as numeric(9,0)) as a17,      " & _
'        "   cast(a25*2/100 as numeric(9,0)) as a_5,      " & _
'        "   cast(a25*8/100 as numeric(9,0)) as a2,      " & _
'        "   case when (RealA25 - a25)>0 then 1  " & _
'        "        when (RealA25 - a25)<0 then -1  " & _
'        "        else 0 end as Error " & _
'        "from( " & _
'        " " & _
'        "select isnull(t.accName, d.AccName) as accName,isnull(t.Ijmali,0) as Ijmali, Tajaoz=case when t.Ijmali is null then 0 else t.Ijmali-t.d end , isnull(d.Daen,0) Daen, isnull(d.madin,0) Madin, " & _
'        "   a25   = case when (isnull(t.d,0)+ isnull(d.r,0))>0 then cast((isnull(t.d,0)+isnull(d.r,0))*25/100 as numeric(9,0)) else 0 end , " & _
'        "   RasidD=case when (isnull(t.d,0)+ isnull(d.r,0))>0 then isnull(t.d,0)+isnull(d.r,0)-cast((isnull(t.d,0)+isnull(d.r,0))*25/100 as numeric(9,0)) else 0 end, " & _
'        "   RasidM=case when (isnull(t.d,0)+ isnull(d.r,0))>0 then 0 else -(isnull(t.d,0)+ isnull(d.r,0)) end, " & _
'        "        RealA25=case when (isnull(t.d,0)+ isnull(d.r,0))>0 then (isnull(t.d,0)+isnull(d.r,0))*25/100  else 0 end  "
'        Sql = Sql & "from (      " & _
'        "   select accNum,AccName,sum(d) as Ijmali, d=case  when sum(D)>" & Tajaoz & " then  " & Tajaoz & " else sum(d) end      " & _
'        "   From Acc_Daily" & Acc_DBYear & "      " & _
'        "   where type=4 and AccParent=(select num from acc_accounts where acc='270')  " & _
'        "            and cDate between " & FromDate & " and " & toDate & "     " & _
'        "   group by accNum,AccName ) t FULL OUTER JOIN " & _
'        "      (      " & _
'        "   select AccNum,AccName, sum(m) as Madin, sum(d) as Daen, (sum(isnull(d,0))-sum(isnull(m,0))) r          " & _
'        "   From Acc_Daily" & Acc_DBYear & "      " & _
'        "   where ((type in (4,5) and cDate<" & FromDate & " ) or (type not in (4) and cDate < " & toDate & " ) )and AccParent=(select num from acc_accounts where acc='270')  " & _
'        "   group by accNum,AccName  " & _
'        "      ) d  " & _
'        "ON t.AccNum=d.AccNum  " & _
'        ") f where Ijmali <> 0  or rasidM <> 0 or rasidD <> 0 ORDER BY  f.accName "
'        '"and cDate < " & toDate & "     "
'</AHMAD>
        If Acc_RibaNumber = 5 Then
            sql = " Set Dateformat DMY " & _
                  " SELECT * FROM sf_Get_New_Summary_Riba_Report" & Acc_DBYear & "('01/01/" + year + "','31/03/" + year + "','01/04/" + year + "', " & _
                  "  '30/06/" + year + "','01/07/" + year + "','30/09/" + year + "', " & _
                  "  '01/10/" + year + "','31/12/" + year + "'," + Tajaoz & _
                  "  )"
            getHashfTabibQuery = sql
            Exit Function
        End If
        If GetTagValue(Current_State.Settings, "RIBA_CHECKS") = "true" And Acc_RibaNumber < 5 And pForm = "KashfTabibTabib" Then
            
            sql = "Select Start_Check_No from Riba_checks Where Acc_Year = " & val(year) & " and Riba_No = " & Acc_RibaNumber
            
            Set rs = ExecuteSelect(Conn, sql, cancel)
            If Acc_DBYear = "" Or val(Acc_DBYear) > 2005 Then
                sql = "SET DATEFORMAT DMY Select *, AutoID + " & rs!Start_Check_No & " - 1  as check_no " & _
                  " from dbo.sf_Get_New_Riba_Report" & Acc_DBYear & "(" & FromDate & "," & toDate & "," & Tajaoz & ")"
            Else
                sql = "SET DATEFORMAT DMY Select *, AutoID + " & rs!Start_Check_No & " - 1  as check_no " & _
                  " from dbo.sf_Get_Riba_Report" & Acc_DBYear & "(" & FromDate & "," & toDate & "," & Tajaoz & ")"
            End If
        Else
            If Acc_DBYear = "" Or val(Acc_DBYear) > 2005 Then
                sql = " SET DATEFORMAT DMY Select *,0 as check_no from " & _
                   " dbo.sf_Get_New_Riba_Report" & Acc_DBYear & "(" & FromDate & "," & toDate & "," & Tajaoz & ")"
            Else
                  sql = " SET DATEFORMAT DMY Select *,0 as check_no from " & _
                  " dbo.sf_Get_Riba_Report" & Acc_DBYear & "(" & FromDate & "," & toDate & "," & Tajaoz & ")"
            End If
        End If
        
        getHashfTabibQuery = sql
End Function

Private Function GetRibaAsName() As String
    Select Case Acc_RibaNumber
        Case 1: GetRibaAsName = "«·√Ê·"
        Case 2: GetRibaAsName = "«·À«‰Ì"
        Case 3: GetRibaAsName = "«·À«·À"
        Case 4: GetRibaAsName = "«·—«»⁄"
        Case 5: GetRibaAsName = "«·√Ê· Ê«·À«‰Ì Ê«·À«·À Ê«·—«»⁄"
    End Select
End Function
Private Function GetCurrentDesertPercent() As String
   Dim yearID As Integer
   Dim sqlcommGetID As String
   Dim res As ADODB.Recordset
   Dim comm As String
   If Acc_DBYear = "" Then
        sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
      comm = "select desert_percent from Acc_ConstKashef  where id=" & yearID
      Set res = ExecuteSelect(Conn, comm, cancel)
      GetCurrentDesertPercent = res.Fields("desert_percent").Value
End Function

Private Function GetTadamonHissaQuery(year As String, Tajaoz As String) As String
Dim sql As String
'sql = "declare @Tajaoz as numeric(10) " & _
'"set @Tajaoz = " & Tajaoz & "  " & _
'"set dateformat dmy " & _
'"select t.accName, t.d as Ijmali, " & _
'"    cast(cast((t.d+isnull(d.r,0))*25/100 as numeric(9,0))*2/100 as numeric(9,0)) as a_5, '«·— »⁄ «·√Ê·' AS Riba " & _
'"from (" & _
'"    select accNum,AccName,sum(d) as Ijmali, d=case  when sum(D)> @Tajaoz  then  @Tajaoz  else sum(d) end " & _
'"    From Acc_Daily" & Acc_DBYear & " " & _
'"    where type=4 and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/1/" & Year & "' and '31/3/" & Year & "' " & _
'"    group by accNum,AccName ) t " & _
'" LEFT OUTER JOIN " & _
'"     ( " & _
'"    select AccNum,AccName, sum(m) as Madin, sum(d) as Daen, (sum(d)-sum(m)) r " & _
'"        From Acc_Daily" & Acc_DBYear & " " & _
'"    where type not in (4,5) and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/1/" & Year & "' and '31/3/" & Year & "' " & _
'"    group by accNum,AccName " & _
'") d ON t.AccNum=d.AccNum " & _
'"Union " & _
'"select t.accName, t.d as Ijmali, " & _
'"    cast(cast((t.d+isnull(d.r,0))*25/100 as numeric(9,0))*2/100 as numeric(9,0)) as a_5, '«·— »⁄ «·À«‰Ì' AS Riba " & _
'"from ( " & _
'"    select accNum,AccName,sum(d) as Ijmali, d=case  when sum(D)> @Tajaoz  then  @Tajaoz  else sum(d) end " & _
'"    From Acc_Daily" & Acc_DBYear & " " & _
'"    where type=4 and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/4/" & Year & "' and '30/6/" & Year & "' " & _
'"    group by accNum,AccName ) t "
'sql = sql & " LEFT OUTER JOIN " & _
'"     ( " & _
'"    select AccNum,AccName, sum(m) as Madin, sum(d) as Daen, (sum(d)-sum(m)) r " & _
'"        From Acc_Daily" & Acc_DBYear & " " & _
'"    where type not in (4,5) and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/4/" & Year & " ' and '30/6/" & Year & "' " & _
'"    group by accNum,AccName " & _
'") d ON t.AccNum=d.AccNum " & _
'"Union " & _
'"select t.accName, t.d as Ijmali, " & _
'"    cast(cast((t.d+isnull(d.r,0))*25/100 as numeric(9,0))*2/100 as numeric(9,0)) as a_5, '«·— »⁄ «·À«·À' AS Riba " & _
'"from ( " & _
'"    select accNum,AccName,sum(d) as Ijmali, d=case  when sum(D)> @Tajaoz  then  @Tajaoz  else sum(d) end " & _
'"    From Acc_Daily" & Acc_DBYear & " " & _
'"    where type=4 and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/7/" & Year & "' and '30/9/" & Year & "' " & _
'"    group by accNum,AccName ) t " & _
'"LEFT OUTER JOIN " & _
'"     ( " & _
'"    select AccNum,AccName, sum(m) as Madin, sum(d) as Daen, (sum(d)-sum(m)) r " & _
'"        From Acc_Daily" & Acc_DBYear & " " & _
'"    where type not in (4,5) and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/10/" & Year & "' and '31/12/" & Year & "' " & _
'"    group by accNum,AccName " & _
'") d ON t.AccNum=d.AccNum " & _
'"Union " & _
'"select t.accName, t.d as Ijmali, " & _
'"    cast(cast((t.d+isnull(d.r,0))*25/100 as numeric(9,0))*2/100 as numeric(9,0)) as a_5, '«·—»⁄ «·—«»⁄' AS Riba "
'sql = sql & " from ( " & _
'"    select accNum,AccName,sum(d) as Ijmali, d=case  when sum(D)> @Tajaoz  then  @Tajaoz  else sum(d) end " & _
'"    From Acc_Daily" & Acc_DBYear & " " & _
'"    where type=4 and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/10/" & Year & "' and '31/12/" & Year & "' " & _
'"    group by accNum,AccName ) t " & _
'"LEFT OUTER JOIN " & _
'"     ( " & _
'"    select AccNum,AccName, sum(m) as Madin, sum(d) as Daen, (sum(d)-sum(m)) r " & _
'"        From Acc_Daily" & Acc_DBYear & " " & _
'"    where type not in (4,5) and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '1/1/" & Year & "' and '31/3/" & Year & "' " & _
'"    group by accNum,AccName " & _
'") d ON t.AccNum=d.AccNum order by Riba"

'<AHMAD>
'    sql = "declare @Tajaoz as numeric(10) " & _
'    "set @Tajaoz = " & Tajaoz & "  " & _
'    "set dateformat dmy " & _
'    "select t.accName, t.d as Ijmali, " & _
'    "    cast(cast((t.d+isnull(d.r,0))*25/100 as numeric(9,0))*2/100 as numeric(9,0)) as a_5 , 1 as Riba " & _
'    "from (" & _
'    "    select accNum,AccName,sum(d) as Ijmali, d=case  when sum(D)> @Tajaoz  then  @Tajaoz  else sum(d) end " & _
'    "    From Acc_Daily" & Acc_DBYear & " " & _
'    "    where type=4 and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '" & dlgTadamoniHissa_Date_Filter.Start_Date & "' and '" & dlgTadamoniHissa_Date_Filter.End_Date & "' " & _
'    "    group by accNum,AccName ) t " & _
'    " LEFT OUTER JOIN " & _
'    "     ( " & _
'    "    select AccNum,AccName, sum(m) as Madin, sum(d) as Daen, (sum(d)-sum(m)) r " & _
'    "        From Acc_Daily" & Acc_DBYear & " " & _
'    "    where type not in (4,5) and AccParent=(select num from acc_accounts" & Acc_DBYear & " where acc='270') and cDate between '" & dlgTadamoniHissa_Date_Filter.Start_Date & "' and '" & dlgTadamoniHissa_Date_Filter.End_Date & "' " & _
'    "    group by accNum,AccName " & _
'    ") d ON t.AccNum=d.AccNum "

    sql = " SET DATEFORMAT DMY Select AccName,Ijmali,a_5 " & _
          " from dbo.sf_Get_Riba_report" & Acc_DBYear & "('" & dlgTadamoniHissa_Date_Filter.Start_Date & _
          "','" & dlgTadamoniHissa_Date_Filter.End_Date & "'," & Tajaoz & ")"
          
'</AHMAD>
    
GetTadamonHissaQuery = sql

End Function

Private Function GetHissaValue(Conn As ADODB.Connection, ByRef hissaVal As String, ByRef LastHissa As String, NoRiba As Boolean) As Long
    Dim sql As String
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
If NoRiba Then
    sql = "select sum(isnull(d,0)) - sum(isnull(m,0)) hissa From Acc_DetSanad" & Acc_DBYearSysTem & _
            " where acc in (select num from Acc_Accounts" & Acc_DBYearSysTem & "  where acc='261') " & _
            " and sanadid not in (select id from acc_sanad" & Acc_DBYearSysTem & " where type = 6)"
    Set rs = ExecuteSelect(Conn, sql, cancel)
    Debug.Print sql
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        hissaVal = -1
        LastHissa = -1
        GetHissaValue = -1
        Exit Function
    End If
    If IsNull(rs!hissa) = False Then hissaVal = rs!hissa
    GetHissaValue = 0
Else
'    sql = "set nocount on DECLARE @Total as numeric(18,0), @RibaCount as int, @LastHissa as numeric (9,0), @CurrentYear as int  " & vbCrLf & _
'          "select @Total =case " & _
'                        "when sum(isNull(d,0)) - sum(isNull(m,0)) > 0 then sum(isNull(d,0)) - sum(isNull(m,0)) " & _
'                        "when sum(isNull(m,0)) - sum(isNull(d,0)) > 0 then sum(isNull(m,0)) - sum(isNull(d,0)) " & _
'                        "else 0 End  " & vbCrLf & _
'        "From Acc_DetSanad" & Acc_DBYearSysTem & vbCrLf & _
'        " where acc in (select num from Acc_Accounts" & Acc_DBYearSysTem & " where acc='261')  " & vbCrLf & _
'        " and sanadid <> (select id from acc_sanad" & Acc_DBYearSysTem & " where type = 6)" & vbCrLf & _
'        " " & vbCrLf & _
'        " select @LastHissa=oldHissa from Acc_Const" & Acc_DBYearSysTem & vbCrLf & _
'        " select top 1 @CurrentYear=year(cDate) from Acc_Daily" & Acc_DBYearSysTem & vbCrLf & _
'        "set @RibaCount = " & RibaCount & vbCrLf & _
'        "if @RibaCount!=0 " & vbCrLf & _
'        "begin " & _
'        "    select cast(isnull(@Total,0)/@RibaCount as bigint) as hissa " & vbCrLf & _
'        "    select @total-cast(isnull(@Total,0)/@RibaCount as bigint)*@RibaCount as diffHissa " & vbCrLf & _
'        "end " & vbCrLf & _
'        "Else " & vbCrLf & _
'        "begin " & vbCrLf & _
'        "    select 0  as hissa from Acc_Const" & Acc_DBYearSysTem & vbCrLf & _
'        "    select @total as diffHissa" & vbCrLf & _
'        "end " & vbCrLf & _
'        "select @LastHissa as LastHissa from Acc_Const" & Acc_DBYearSysTem
    '<Ashraf>
        sql = "set nocount on DECLARE @Total as numeric(18,0), @RibaCount as int, @LastHissa as numeric (9,0), @CurrentYear as int  " & vbCrLf & _
          "select @Total =case " & _
                        "when sum(isNull(d,0)) - sum(isNull(m,0)) > 0 then sum(isNull(d,0)) - sum(isNull(m,0)) " & _
                        "when sum(isNull(m,0)) - sum(isNull(d,0)) > 0 then sum(isNull(m,0)) - sum(isNull(d,0)) " & _
                        "else 0 End  " & vbCrLf & _
        "From Acc_DetSanad" & Acc_DBYearSysTem & vbCrLf & _
        " where acc in (select num from Acc_Accounts" & Acc_DBYearSysTem & " where acc='261')  " & vbCrLf & _
        " and sanadid <> isNull((select id from acc_sanad" & Acc_DBYearSysTem & " where type = 6),0) " & vbCrLf & _
        " " & vbCrLf & _
        " select @LastHissa=oldHissa from Acc_Const" & Acc_DBYearSysTem & vbCrLf & _
        " select top 1 @CurrentYear=year(cDate) from Acc_Daily" & Acc_DBYearSysTem & vbCrLf & _
        "set @RibaCount = " & RibaCount & vbCrLf & _
        "if @RibaCount!=0 " & vbCrLf & _
        "begin " & _
        "    select cast(isnull(@Total,0)/@RibaCount as bigint) as hissa " & vbCrLf & _
        "    select @total-cast(isnull(@Total,0)/@RibaCount as bigint)*@RibaCount as diffHissa " & vbCrLf & _
        "end " & vbCrLf & _
        "Else " & vbCrLf & _
        "begin " & vbCrLf & _
        "    select 0  as hissa from Acc_Const" & Acc_DBYearSysTem & vbCrLf & _
        "    select @total as diffHissa" & vbCrLf & _
        "end " & vbCrLf & _
        "select @LastHissa as LastHissa from Acc_Const" & Acc_DBYearSysTem

    '</Ashraf>
    Debug.Print sql
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        hissaVal = -1
        LastHissa = -1
        GetHissaValue = -1
        Exit Function
    End If
    If rs.state = adStateClosed Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        hissaVal = -1
        LastHissa = -1
        GetHissaValue = -1
        Exit Function
    End If
    
    If rs.BOF Or rs.EOF Then
        hissaVal = 0
        LastHissa = 0
        GetHissaValue = 0
        Exit Function
    End If
    If IsNull(rs!hissa) Then
        hissaVal = 0
        LastHissa = 0
        GetHissaValue = 0
        Exit Function
    End If
    
    hissaVal = rs!hissa
    Set rs = rs.NextRecordset
    If IsNull(rs!diffHissa) = False Then GetHissaValue = rs!diffHissa
    Set rs = rs.NextRecordset
    LastHissa = rs!LastHissa
End If
End Function

Private Sub setHissaDocNum(Conn As ADODB.Connection, ByRef Rep As Acc_HissaSanawia)
'<AHMAD>
'    Dim rs As ADODB.Recordset
'    Dim Cancel As Boolean
'    Dim Sql As String
'    'Sql = "select count(*) num,riba " & vbCrLf & _
'    '    "from( " & vbCrLf & _
'    '    "select isnull(cast(d.dbo_Rep1 as int),0)+ " & vbCrLf & _
'    '    "     isnull(cast(d.dbo_Rep2 as int),0)+ " & vbCrLf & _
'    '    "     isnull(cast(d.dbo_Rep3 as int),0)+ " & vbCrLf & _
'    '    "     isnull(cast(d.dbo_Rep4 as int),0) riba " & vbCrLf & _
'    '    "From " & vbCrLf & _
'    '    "( " & vbCrLf & _
'    '    "    select isnull(sum(isnull(d,0)),0) as Ijmali, AccNum " & vbCrLf & _
'    '    "    From Acc_Daily " & vbCrLf & _
'    '    "    where type=4 and AccParent=(select num from acc_accounts where acc='270') " & vbCrLf & _
'    '    "    group by accNum " & vbCrLf & _
'    '    ") x right outer join doccvt d on x.AccNum=d.dbo_NumAcc " & vbCrLf & _
'    '    "where isnull(x.Ijmali,0)>=(select oldHissa from Acc_Const) " & vbCrLf & _
'    '    ") f " & vbCrLf & _
'    '    "Where riba! = 0 " & vbCrLf & _
'    '    "group by riba " & vbCrLf & _
'    '    "order by riba"
'        Dim anRs As ADODB.Recordset
'        'Dim cancel As Boolean
'        Dim year As String
'        Set anRs = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadTMP" & Acc_DBYear, Cancel)
'        If Cancel Then
'            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
'            Exit Sub
'        End If
'        If anRs.EOF Then
'            MsgBox "·«  ÊÃœ »Ì«‰«  Œ·«· «·”‰… «·„«·Ì… «·Õ«·Ì…"
'            Exit Sub
'        End If
'        If IsNull(anRs!Y) Then
'            MsgBox "·«  ÊÃœ »Ì«‰«  Œ·«· «·”‰… «·„«·Ì… «·Õ«·Ì…"
'            Exit Sub
'        End If
'        year = anRs!Y
'
'      Sql = "select count(*) num,riba " & vbCrLf & _
'            "from(" & vbCrLf & _
'            "select d.Sinature_Status riba" & vbCrLf & _
'            "From" & vbCrLf & _
'            "    (" & vbCrLf & _
'            "    select isnull(sum(isnull(d,0)),0) - isnull(sum(isnull(m,0)),0)   as Ijmali, AccNum" & vbCrLf & _
'            "    From Acc_Daily" & vbCrLf & _
'            "    where type=4 and AccParent=(select num from acc_accounts where acc='270')" & vbCrLf & _
'            "    group by accNum" & vbCrLf & _
'            "    ) x right outer join (" & vbCrLf & _
'            "    select sum(Sinature_Status) Sinature_Status,Collaborative_Account_No dbo_NumAcc" & vbCrLf & _
'            "    from Doctor_CV cv, Quarter_Signature qs, Quarter_Sinature_Details qsd" & vbCrLf & _
'            "    Where qs.Quarter_Year =" & year & " And qsd.Doctor_ID = cv.Doctor_ID And qsd.Quarter_ID = qs.Quarter_ID" & vbCrLf & _
'            "    group by Collaborative_Account_No" & vbCrLf & _
'            "    ) d on x.AccNum=d.dbo_NumAcc" & vbCrLf & _
'            "where isnull(x.Ijmali,0)  >=(select top 1 oldHissa from Acc_Const)" & vbCrLf & _
'            ") f" & vbCrLf & _
'            "Where riba! = 0" & vbCrLf & _
'            "group by riba" & vbCrLf & _
'            "order by riba"
'
'        Dim sumRiba As Long
'        Dim sumRibaNum As Long
'        sumRiba = 0
'        sumRibaNum = 0
'        Set rs = ExecuteSelect(Conn, Sql, Cancel)
'        If Cancel Then Exit Sub
'        If rs.EOF Then Exit Sub
'        If rs!riba = 1 Then
'            Rep.Riba01.SetText rs!Num
'            Rep.NbRiba1.SetText rs!Num
'            sumRiba = rs!Num
'            sumRibaNum = rs!Num
'            rs.MoveNext
'        End If
'        Rep.sumRibaHasHissa.SetText CStr(sumRiba)
'        Rep.NbRibaSum.SetText CStr(sumRibaNum)
'        If rs.EOF Then Exit Sub
'        If rs!riba = 2 Then
'            Rep.Riba2.SetText rs!Num
'            Rep.NbRiba2.SetText rs!Num * 2
'            sumRiba = sumRiba + rs!Num
'            sumRibaNum = sumRibaNum + rs!Num * 2
'            rs.MoveNext
'        End If
'        Rep.sumRibaHasHissa.SetText CStr(sumRiba)
'        Rep.NbRibaSum.SetText CStr(sumRibaNum)
'        If rs.EOF Then Exit Sub
'        If rs!riba = 3 Then
'            Rep.Riba3.SetText rs!Num
'            Rep.NbRiba3.SetText rs!Num * 3
'            sumRiba = sumRiba + rs!Num
'            sumRibaNum = sumRibaNum + rs!Num * 3
'            rs.MoveNext
'        End If
'        Rep.sumRibaHasHissa.SetText CStr(sumRiba)
'        Rep.NbRibaSum.SetText CStr(sumRibaNum)
'        If rs.EOF Then Exit Sub
'        If rs!riba = 4 Then
'            Rep.Riba4.SetText rs!Num
'            Rep.NbRiba4.SetText rs!Num * 4
'            sumRiba = sumRiba + rs!Num
'            sumRibaNum = sumRibaNum + rs!Num * 4
'            rs.MoveNext
'        End If
'        Rep.sumRibaHasHissa.SetText CStr(sumRiba)
'        Rep.NbRibaSum.SetText CStr(sumRibaNum)
'        rs.Close
'=============================================================
    Dim Doctors_Count As Long
    
    Dim Riba4 As Long
    Dim Riba3 As Long
    Dim Riba2 As Long
    Dim Riba1 As Long
    
    With Rep
        rsSummaries.Filter = "RasidD >= 0 and Hissa > 0 and Riba = 4"
        .Riba4.SetText rsSummaries.RecordCount
        Riba4 = rsSummaries.RecordCount
        
        rsSummaries.Filter = ""
        rsSummaries.Filter = "RasidD >= 0 and Hissa > 0 and Riba = 3"
        .Riba3.SetText rsSummaries.RecordCount
        Riba3 = rsSummaries.RecordCount
        
        rsSummaries.Filter = ""
        rsSummaries.Filter = "RasidD >= 0 and Hissa > 0 and Riba = 2"
        .Riba2.SetText rsSummaries.RecordCount
        Riba2 = rsSummaries.RecordCount
        
        rsSummaries.Filter = ""
        rsSummaries.Filter = "RasidD >= 0 and Hissa > 0 and Riba = 1"
        .Riba01.SetText rsSummaries.RecordCount
        Riba1 = rsSummaries.RecordCount
        
        .sumRibaHasHissa.SetText Riba1 + Riba2 + Riba3 + Riba4
        
        .NbRiba4.SetText Riba4 * 4
        .NbRiba3.SetText Riba3 * 3
        .NbRiba2.SetText Riba2 * 2
        .NbRiba1.SetText Riba1 * 1
        
        .NbRibaSum.SetText (Riba4 * 4) + (Riba3 * 3) + (Riba2 * 2) + (Riba1)
        
        Set rsSummaries = Nothing
        
    End With
    
    
End Sub
Private Sub SetHissaDocNumWithNoRiba(ByRef Conn As ADODB.Connection, ByRef Rep As Acc_HissaSanawia)
Dim rs As ADODB.Recordset
Dim cancel As Boolean
Dim sql As String
Rep.Text3.SetText "‘—ÌÕ… 1"
Rep.Text4.SetText "‘—ÌÕ… 2"
Rep.Text5.SetText "‘—ÌÕ… 3"
Rep.Text26.SetText "‘—ÌÕ… 4"
Rep.Text32.SetText "‘—ÌÕ… 5"
Rep.Text32.Suppress = False
Rep.Riba00.Suppress = False
Rep.Text29.Left = 120
Rep.sumRibaHasHissa.Left = 120
Rep.Line24.Suppress = False
Rep.Line23.Suppress = True
Rep.Box3.Bottom = 2640
Rep.Box3.Left = 120
Rep.Line22.Left = 120
Rep.Text7.Suppress = True
Rep.Text9.Suppress = True
Rep.sumDocHasLessWorkAndSigned1.Suppress = True
Rep.sumDocHasWorkNotSigned1.Suppress = True
Rep.Line16.Bottom = Rep.Line24.Bottom
Rep.Line18.Bottom = Rep.Line24.Bottom
Rep.Line19.Bottom = Rep.Line24.Bottom
Rep.Line20.Bottom = Rep.Line24.Bottom
Rep.Line21.Bottom = Rep.Line24.Bottom
Rep.NbRiba1.Suppress = True
Rep.NbRiba2.Suppress = True
Rep.NbRiba3.Suppress = True
Rep.NbRiba4.Suppress = True
Rep.NbRibaSum.Suppress = True
Rep.Text30.Suppress = True
sql = "select count(*) num, s.id riba" & vbCrLf & _
        "From" & vbCrLf & _
        "(" & vbCrLf & _
        "select sum(isnull(Acc_Daily.d,0)) as Ijmali" & vbCrLf & _
        "From Acc_Daily right outer join Acc_Accounts on num=accNum" & vbCrLf & _
        "where (Acc_Daily.type is null or Acc_Daily.type=4) and parent=(select num from acc_accounts where acc='270')" & vbCrLf & _
        "group by num" & vbCrLf & _
        ") f, Slices s" & vbCrLf & _
        "where f.Ijmali between s.startBal and s.endBal" & vbCrLf & _
        "group by s.id order by s.id"
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    
    Dim sumRiba As Long
    sumRiba = 0
    If rs.EOF Then Exit Sub
    If rs!Riba = 0 Then rs.MoveNext
    If rs.EOF Then Exit Sub
    If rs!Riba = 1 Then
        Rep.Riba4.SetText rs!Num
        sumRiba = rs!Num
        rs.MoveNext
    End If
    Rep.sumRibaHasHissa.SetText CStr(sumRiba)
    If rs.EOF Then Exit Sub
    If rs!Riba = 2 Then
        Rep.Riba3.SetText rs!Num
        sumRiba = sumRiba + rs!Num
        rs.MoveNext
    End If
    Rep.sumRibaHasHissa.SetText CStr(sumRiba)
    If rs.EOF Then Exit Sub
    If rs!Riba = 3 Then
        Rep.Riba2.SetText rs!Num
        sumRiba = sumRiba + rs!Num
        rs.MoveNext
    End If
    Rep.sumRibaHasHissa.SetText CStr(sumRiba)
    If rs.EOF Then Exit Sub
    If rs!Riba = 4 Then
        Rep.Riba01.SetText rs!Num
        sumRiba = sumRiba + rs!Num
        rs.MoveNext
    End If
    Rep.sumRibaHasHissa.SetText CStr(sumRiba)
    If rs.EOF Then Exit Sub
    If rs!Riba = 5 Then
        Rep.Riba00.SetText rs!Num
        sumRiba = sumRiba + rs!Num
        rs.MoveNext
    End If
    Rep.sumRibaHasHissa.SetText CStr(sumRiba)
    rs.Close
End Sub
Private Function GetSumHissa(rs As ADODB.Recordset)
    rs.MoveFirst
    Dim H As Double
    H = 0
    Do While Not rs.EOF
        H = H + rs!hissa
        rs.MoveNext
    Loop
    GetSumHissa = H
End Function
