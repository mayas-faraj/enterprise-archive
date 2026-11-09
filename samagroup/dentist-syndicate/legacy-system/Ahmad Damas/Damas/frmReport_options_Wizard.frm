VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmReport_options_Wizard 
   Caption         =   "„’„„  ﬁ«—Ì— «·–« Ì…"
   ClientHeight    =   8370
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   11745
   Icon            =   "frmReport_options_Wizard.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8370
   ScaleWidth      =   11745
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   8475
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
      Width           =   11850
      Begin VB.CheckBox chExportExcel 
         Alignment       =   1  'Right Justify
         Caption         =   " ’œÌ— ·‹≈ﬂ”·"
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   7920
         Width           =   1335
      End
      Begin VB.CheckBox chName 
         Alignment       =   1  'Right Justify
         Caption         =   "»«·≈”„ "
         Height          =   375
         Left            =   8640
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   7920
         Width           =   975
      End
      Begin VB.CheckBox chNum 
         Alignment       =   1  'Right Justify
         Caption         =   "«·—ﬁ„"
         Height          =   375
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   7920
         Width           =   855
      End
      Begin VB.CheckBox chLastName 
         Alignment       =   1  'Right Justify
         Caption         =   "»«·ﬂ‰Ì…"
         Height          =   375
         Left            =   7560
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   7920
         Width           =   975
      End
      Begin VB.CommandButton cmdLov 
         Caption         =   "«Œ Ì«— „‰ «·ﬁ«∆„…"
         Height          =   375
         Left            =   720
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   7965
         Width           =   1275
      End
      Begin MSComDlg.CommonDialog cmnDialog 
         Left            =   5880
         Top             =   8160
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton cmbClose 
         Caption         =   "≈€·«ﬁ"
         Height          =   375
         Left            =   90
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   7965
         Width           =   555
      End
      Begin VB.CommandButton cmdDefualt_Values 
         Caption         =   "≈⁄«œ…  ⁄ÌÌ‰ «·ﬁÌ„ «·«› —«÷Ì…"
         Height          =   375
         Left            =   2040
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   7965
         Width           =   2325
      End
      Begin VB.CommandButton cmdView_Report 
         Caption         =   "⁄—÷ «· ﬁ—Ì—"
         Height          =   375
         Left            =   4440
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   7965
         Width           =   1335
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   11520
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   7020
         Left            =   120
         TabIndex        =   2
         Tag             =   $"frmReport_options_Wizard.frx":1CFA
         Top             =   495
         Width           =   11625
         _cx             =   20505
         _cy             =   12382
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   0
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         BackColorFixed  =   14737632
         ForeColorFixed  =   -2147483630
         BackColorSel    =   -2147483635
         ForeColorSel    =   -2147483634
         BackColorBkg    =   14810879
         BackColorAlternate=   14810879
         GridColor       =   -2147483633
         GridColorFixed  =   -2147483632
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   5
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   9
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmReport_options_Wizard.frx":1D99
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   0
         AutoSearchDelay =   2
         MultiTotals     =   -1  'True
         SubtotalPosition=   1
         OutlineBar      =   0
         OutlineCol      =   0
         Ellipsis        =   0
         ExplorerBar     =   0
         PicturesOver    =   0   'False
         FillStyle       =   0
         RightToLeft     =   -1  'True
         PictureType     =   0
         TabBehavior     =   1
         OwnerDraw       =   0
         Editable        =   2
         ShowComboButton =   -1  'True
         WordWrap        =   0   'False
         TextStyle       =   0
         TextStyleFixed  =   0
         OleDragMode     =   0
         OleDropMode     =   0
         DataMode        =   0
         VirtualData     =   -1  'True
         DataMember      =   ""
         ComboSearch     =   3
         AutoSizeMouse   =   -1  'True
         FrozenRows      =   0
         FrozenCols      =   0
         AllowUserFreezing=   0
         BackColorFrozen =   0
         ForeColorFrozen =   0
         WallPaperAlignment=   9
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "«Œ Ì«— «· — Ì»"
         Height          =   375
         Left            =   10680
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   7920
         Width           =   975
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "„·›"
      Begin VB.Menu mnSaveReport 
         Caption         =   "Õ›Ÿ «· ﬁ—Ì— «·Õ«·Ì"
      End
      Begin VB.Menu mnuopen 
         Caption         =   " › Õ  ﬁ—Ì— „Õ›ÊŸ „”»ﬁ«"
      End
   End
End
Attribute VB_Name = "frmReport_options_Wizard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Dim oldScaleWidth As Long
Const Arabic_Name_ = 0
Const Data_Type_ = 1
Const Show_In_Report_ = 2
Const ISFilter_ = 3
Const Filter_Type_ = 4
Const Filter_Value_ = 5
Const Start_value_ = 6
Const End_Value_ = 7
Const English_Name_ = 8
Dim Show_In_Report_fields_Count As Integer
Dim lblArr(1 To 14) As RptLabel
Dim txtArr(1 To 14) As RptTextBox
Sub Select_lookup_value()
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    Dim Arabic_Name As String
    Dim English_Name As String
    
    Arabic_Name = fg.Cell(flexcpText, fg.Row, Arabic_Name_)
    English_Name = fg.Cell(flexcpText, fg.Row, English_Name_)
    
    sql = "select Distinct " & English_Name & " from vDoctor_CV Order by 1"
          
    Set rs = ExecuteSelect(Conn, sql, c)
    
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Exit Sub
    End If
    
    GLOBAL_TAG = "datafield=,0:" & English_Name & ",;"
    GLOBAL_TAG = GLOBAL_TAG & "caller=,0:" & 5 & ",;"
    GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
    btnSettings = GetBtnSettings
    Clin_List.fg.Cols = 1
    Clin_List.fg.ColAlignment(0) = 7
    Clin_List.fg.FixedAlignment(0) = 7
    Clin_List.fg.ColAlignment(0) = flexAlignRightCenter
    Clin_List.fg.Cell(flexcpText, 0, 0) = Arabic_Name
    Set Clin_List.CallerForm = Me
    Clin_List.Show 1
    RefreshCommands btnSettings And FormSettings

End Sub

Sub Set_Report_Arrays(ByRef DrReport_Generator As DrReport_Generator_Object)
    Dim i As Integer
    
    With DrReport_Generator
    
       For i = 1 To 14
            If TypeOf .Sections(2).Controls(i) Is RptLabel Then
                Set lblArr(i) = .Sections(2).Controls(i)
            End If
            If TypeOf .Sections(3).Controls(i) Is RptTextBox Then
                Set txtArr(i) = .Sections(3).Controls(i)
            End If
        Next i

    End With
    
End Sub
Sub Push_Nodes(Caption As String, datafield As String)
    
    Dim i As Integer
    
    For i = Show_In_Report_fields_Count + 1 To 2 Step -1
        If i > 1 And i <= 14 Then
            lblArr(i).visible = True
            txtArr(i).visible = True
            lblArr(i).Caption = lblArr(i - 1).Caption
            txtArr(i).datafield = txtArr(i - 1).datafield
        Else
            lblArr(14).visible = True
            txtArr(14).visible = True
            lblArr(14).Caption = lblArr(13).Caption
            txtArr(14).datafield = txtArr(13).datafield
            'Exit For
        End If
    Next i
    
    lblArr(1).Caption = Caption
    txtArr(1).datafield = datafield
    
End Sub
Function Get_Sql_Statment() As String
    
    Dim Select_Phase As String
    Dim Where_Phase As String
    Dim i As Integer
    Dim order_Str As String
    Dim cnt As Integer
    cnt = 15
    If chExportExcel.Value = 1 Then
        cnt = 1000
    End If
    Show_In_Report_fields_Count = 0
    Get_Sql_Statment = ""
    Select_Phase = "SET DATEFORMAT DMY Select "
    
    For i = 1 To fg.Rows - 1
            
        If fg.Cell(flexcpTextDisplay, i, Show_In_Report_) = "‰⁄„" Then
         If (chExportExcel.Value = 1) Then
             Select_Phase = Select_Phase & fg.Cell(flexcpText, i, English_Name_) & " as ' " & fg.Cell(flexcpText, i, Arabic_Name_) & "',"
         Else
            Select_Phase = Select_Phase & fg.Cell(flexcpText, i, English_Name_) & " ,"
         End If
           
            
             Show_In_Report_fields_Count = Show_In_Report_fields_Count + 1
             If Show_In_Report_fields_Count < cnt Then
                Push_Nodes fg.Cell(flexcpText, i, Arabic_Name_), fg.Cell(flexcpText, i, English_Name_)
             End If
        End If
             
        If fg.Cell(flexcpTextDisplay, i, ISFilter_) = "‰⁄„" Then
            Select Case fg.Cell(flexcpTextDisplay, i, Filter_Type_)
            Case "Ì”«ÊÌ"
                If InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "ID") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " = " & _
                                                val(fg.Cell(flexcpText, i, Filter_Value_)) & " And "
                ElseIf InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "COUNCIL_POSITION") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " like '" & _
                                                        fg.Cell(flexcpText, i, Filter_Value_) & "' And "

                Else
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " like '%" & _
                                                        fg.Cell(flexcpText, i, Filter_Value_) & "%' And "
                End If
            Case "·« Ì”«ÊÌ"
                If InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "ID") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " <> " & _
                                                val(fg.Cell(flexcpText, i, Filter_Value_)) & " And "
                Else
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " not like '%" & _
                                                        fg.Cell(flexcpText, i, Filter_Value_) & "%' And "
                End If
            Case "√ﬂ»— „‰"
                If InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "ID") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " > " & _
                                                val(fg.Cell(flexcpText, i, Filter_Value_)) & " And "
                ElseIf InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "DATE") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " > '" & _
                                                        fg.Cell(flexcpText, i, Filter_Value_) & "' And "
                End If
            Case "√’€— „‰"
                If InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "ID") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " < " & _
                                                val(fg.Cell(flexcpText, i, Filter_Value_)) & " And "
                ElseIf InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "DATE") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " < '" & _
                                                        fg.Cell(flexcpText, i, Filter_Value_) & "' And "
                End If
            Case "»Ì‰ ﬁÌ„ Ì‰"
                If InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "ID") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " between " & _
                                val(fg.Cell(flexcpText, i, Start_value_)) & " And " & _
                                val(fg.Cell(flexcpText, i, End_Value_)) & " And "

                ElseIf InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "DATE") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " between '" & _
                                fg.Cell(flexcpText, i, Start_value_) & "' And '" & _
                                fg.Cell(flexcpText, i, End_Value_) & "' And "
                ElseIf InStr(UCase(fg.Cell(flexcpText, i, English_Name_)), "BIRTHDAY") > 0 Then
                    Where_Phase = Where_Phase & fg.Cell(flexcpText, i, English_Name_) & " between '" & _
                                fg.Cell(flexcpText, i, Start_value_) & "' And '" & _
                                fg.Cell(flexcpText, i, End_Value_) & "' And "
                                
                End If
            End Select
        End If
        
    Next i
    If Len(Where_Phase) > 5 Then
        Where_Phase = Left(Where_Phase, Len(Where_Phase) - 5)
        Where_Phase = " Where " & Where_Phase
    End If
    order_Str = Get_OrderOption
    If (chExportExcel.Value = 1) Then
        Select_Phase = Left(Select_Phase, Len(Select_Phase) - 1) '& ", "
    Else
        Select_Phase = Left(Select_Phase, Len(Select_Phase) - 1) & ",0 as defualt_dataField "
    End If
    Get_Sql_Statment = Select_Phase & " from vDoctor_Cv " & Where_Phase & "  " & order_Str
End Function

Private Function Get_OrderOption() As String
        Get_OrderOption = " "
        If (chNum.Value = 1) Then
           Get_OrderOption = " order by Doctor_ID"
        End If
        If (chName.Value = 1) Then
           Get_OrderOption = " order by First_Name"
        End If
        If (chLastName.Value = 1) Then
           Get_OrderOption = " order by Last_Name"
        End If
End Function

Private Sub chExportExcel_Click()
    If (chExportExcel.Value = 1) Then
        cmdView_Report.Caption = "⁄—÷ «· ﬁ—Ì— ›Ì ≈ﬂ”·"
    Else
        cmdView_Report.Caption = "⁄—÷ «· ﬁ—Ì—"
    End If
End Sub

Private Sub chLastName_Click()
  If (chLastName.Value = 1) Then
    chName.Enabled = False
    chNum.Enabled = False
  Else
    chName.Enabled = True
    chNum.Enabled = True
  End If
End Sub

Private Sub chName_Click()
 If (chName.Value = 1) Then
    chLastName.Enabled = False
    chNum.Enabled = False
  Else
    chLastName.Enabled = True
    chNum.Enabled = True
  End If
End Sub

Private Sub chNum_Click()
 If (chNum.Value = 1) Then
    chLastName.Enabled = False
    chName.Enabled = False
  Else
    chLastName.Enabled = True
    chName.Enabled = True
  End If
End Sub

Private Sub cmbClose_Click()
    Unload Me
End Sub

Private Sub cmdDefualt_Values_Click()
    Dim cancel As Boolean
    MousePointer = vbHourglass
    Set master.rs = ExecuteSelect(Conn, "select * from report_options order by 1", cancel)
    If Not master.rs.EOF Then master.MoveFirst
    MousePointer = vbDefault
End Sub

Private Sub cmdLov_Click()
    If fg.Cell(flexcpText, fg.Row, 1) <> "„Õ—›Ì" Or fg.Cell(flexcpText, fg.Row, 3) <> 1 _
        Or (fg.Cell(flexcpText, fg.Row, 4) <> "Ì”«ÊÌ" And fg.Cell(flexcpText, fg.Row, 4) <> "·« Ì”«ÊÌ") Then Exit Sub
    MousePointer = vbHourglass
    fg.Col = 5
    Select_lookup_value
    MousePointer = vbDefault
End Sub

Private Sub cmdView_Report_Click()
    
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    Dim DrReport_Generator As New DrReport_Generator_Object
    
    MousePointer = vbHourglass
    
    Set_Report_Arrays DrReport_Generator
    
    sql = Get_Sql_Statment
    If chExportExcel.Value = 1 And Show_In_Report_fields_Count = 0 Then
        MsgBox "ÌÃ» «Œ Ì«— ⁄œœ „‰ «·ÕﬁÊ· ·«ŸÂ«—Â« ›Ì ≈ﬂ”·", vbCritical + vbOKOnly
       MousePointer = vbDefault
       Exit Sub
    End If
    If chExportExcel.Value = 0 And (Show_In_Report_fields_Count = 0 Or Show_In_Report_fields_Count > 14) Then
       MsgBox "ÌÃ» «Œ Ì«— ⁄œœ ÕﬁÊ· »Ì‰ 1 Ê 14 Õﬁ· ›ﬁÿ ··ŸÂÊ— ›Ì «· ﬁ—Ì—", vbCritical + vbOKOnly
       MousePointer = vbDefault
       Exit Sub
    End If
    
    
    If Printer.PaperSize <> vbPRPSA3 And Not (Printer.PaperSize = vbPRPSA4 And Printer.Orientation = vbPRORLandscape) Then
        Dim msg As VbMsgBoxResult
        MsgBox "ÌÃ»  ⁄—Ì› ÿ«»⁄… A3 ﬁ»· ÿ»«⁄… «· ﬁ—Ì— ", vbInformation + vbOKOnly + vbMsgBoxRight + vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
        MousePointer = vbDefault
        cmnDialog.ShowPrinter
        Exit Sub
    End If
    
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If (chExportExcel.Value = 1) Then
         Export2Exel rs
         MousePointer = vbDefault
         Exit Sub
    End If
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·Õ’Ê· ⁄·Ï «·»Ì«‰«  Ì—ÃÏ «· √ﬂœ „‰ «·„œŒ·« ", vbCritical + vbOKOnly
        MousePointer = vbDefault
        Exit Sub
    End If
    
    If cancel Then Exit Sub
    Get_DataReport_Label_byName(DrReport_Generator, 1, "lblStateNAme").Caption = "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ - ›—⁄ „Õ«›Ÿ… " & Current_State.name
    If Show_In_Report_fields_Count < 14 Then
        lblArr(Show_In_Report_fields_Count + 1).visible = False
        txtArr(Show_In_Report_fields_Count + 1).visible = False
    ElseIf Show_In_Report_fields_Count = 14 Then
        lblArr(14).visible = True
        txtArr(14).visible = True
    Else
        lblArr(14).visible = False
        txtArr(14).visible = False
    End If
    
    On Error GoTo errHandler
    
    Dim Line  As RptLine
    
    Dim i As Integer
    i = 0
    Dim ctrl As Variant
    
    If Show_In_Report_fields_Count <= 14 Then
        DrReport_Generator.Sections(3).Controls(15).Width = Show_In_Report_fields_Count * 1080
        DrReport_Generator.Sections(3).Controls(16).Width = Show_In_Report_fields_Count * 1080
'        DrReport_Generator.Sections(3).Controls(18).Left = Show_In_Report_fields_Count * 1080
        Dim Left  As Integer
        Left = Show_In_Report_fields_Count * 1080 - DrReport_Generator.Sections(1).Controls(1).Width
        If Left > 0 Then
            DrReport_Generator.Sections(1).Controls(1).Left = (Left) / 2
        End If
        
    Else
        DrReport_Generator.Sections(3).Controls(15).Width = 14 * 1080
        DrReport_Generator.Sections(3).Controls(16).Width = 14 * 1080
'        DrReport_Generator.Sections(3).Controls(18).Left = 14 * 1080
        
        DrReport_Generator.Sections(1).Controls(1).Left = (14 * 1080 - DrReport_Generator.Sections(1).Controls(1).Width) / 2
        
    End If
'    DataEnvironment.Commands("vDoctor_CV").CommandType = adCmdText
'    DataEnvironment.Commands("vDoctor_CV").CommandText = Sql
    Set DrReport_Generator.DataSource = rs
    DrReport_Generator.Show 1
    MousePointer = vbDefault
    Exit Sub
errHandler:
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄„·Ì… ⁄—÷ «· ﬁ—Ì— ° «·—Ã«¡ «· √ﬂœ „‰ «·ﬁÌ„ «·„œŒ·…", vbCritical + vbOKOnly, "Œÿ√ ÿ»«⁄…"
    MousePointer = vbDefault
End Sub

Private Sub Command1_Click()
    Dim i As Integer
    For i = 1 To fg.Rows - 1
        fg.Cell(flexcpText, i, Show_In_Report_) = 1
    Next i
End Sub

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    Select Case Col
    Case ISFilter_
        If fg.TextMatrix(Row, ISFilter_) = 0 Then
            fg.TextMatrix(Row, Filter_Type_) = ""
            fg.TextMatrix(Row, Filter_Value_) = ""
            fg.TextMatrix(Row, Start_value_) = ""
            fg.TextMatrix(Row, End_Value_) = ""
        End If
    End Select
End Sub

Private Sub fg_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    If OldRow = NewRow Then Exit Sub
    cmdLov.Enabled = False
    If fg.Cell(flexcpText, fg.Row, 1) <> "„Õ—›Ì" Then Exit Sub
    cmdLov.Enabled = True
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Col > 3 And fg.Cell(flexcpTextDisplay, Row, Filter_Type_) = "‰⁄„" Then
        cancel = True
    End If
    
    If fg.Cell(flexcpTextDisplay, Row, Filter_Type_) <> "»Ì‰ ﬁÌ„ Ì‰" And Col > 5 Then
        cancel = True
    End If
    
    If fg.Cell(flexcpTextDisplay, Row, Filter_Type_) = "»Ì‰ ﬁÌ„ Ì‰" And Col = Filter_Value_ Then
        cancel = True
    End If
    
    If fg.Cell(flexcpTextDisplay, Row, Data_Type_) = "„Õ—›Ì" And (Col = Filter_Value_ Or Col = Start_value_ Or Col = End_Value_) And (fg.Cell(flexcpTextDisplay, Row, Filter_Type_) = "»Ì‰ ﬁÌ„ Ì‰" Or fg.Cell(flexcpTextDisplay, Row, Filter_Type_) = "√ﬂ»— „‰" Or fg.Cell(flexcpTextDisplay, Row, Filter_Type_) = "√’€— „‰") Then
        fg.Cell(flexcpText, Row, Filter_Value_) = ""
        fg.Cell(flexcpText, Row, Start_value_) = ""
        fg.Cell(flexcpText, Row, End_Value_) = ""
        cancel = True
        Exit Sub
    End If
    
    If fg.Cell(flexcpText, Row, 3) <> 1 And Col = 4 Then cancel = True
    
End Sub


Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
     ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    MousePointer = vbHourglass
    oldScaleWidth = 11925
    FormSettings = 0
    btnSettings = 0
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from report_options order by 1", cancel)
    InitFrame
    fg.ColComboList(2) = "#0;·«|#1;‰⁄„"
    fg.ColComboList(3) = "#0;·«|#1;‰⁄„"
    fg.ColComboList(4) = "0#;Ì”«ÊÌ|1#;·« Ì”«ÊÌ|2#;√ﬂ»— „‰|3#;√’€— „‰|4#;»Ì‰ ﬁÌ„ Ì‰"
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    MousePointer = vbDefault
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    
End Sub

Private Sub Form_Resize()
    Dim Alpha As Double
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
        Exit Sub
    End If
    If (MDIMain.WindowState = vbMinimized) Then
        Exit Sub
    End If
    If (Me.WindowState = vbMinimized) Then
        Exit Sub
    End If
    Alpha = ScaleWidth / oldScaleWidth
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        If Not (TypeOf ctrl Is CommonDialog Or TypeOf ctrl Is Menu) Then
            ctrl.Left = ctrl.Left * Alpha
            ctrl.Width = ctrl.Width * Alpha
        End If
    Next
    oldScaleWidth = ScaleWidth
    
    ResizeGrid fg
    
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub mnSaveReport_Click()
    
   dlgSaveReport.Show 1
        
End Sub

Private Sub mnuopen_Click()
    dlgBrowseFile.Show 1
End Sub
Private Sub Export2Exel(res As ADODB.Recordset)
    Dim sFileLocation As String
    Dim file As Application
    Dim oXL, oBook As Object
    '  Set oXL = CreateObject("Excel.Application")
    '  Set oBook = oXL.Workbooks.Add
    '   sFileLocation = "c:\save2.xlsx"
    'If dir(sFileLocation, vbNormal) <> "" Then Kill sFileLocation
    'res.Save sFileLocation, adPersistADTG
        
    Dim xlApp As Object
    Dim xlWb As Object
    Dim xlWs As Object
    
    Dim recArray As Variant
    
    Dim strDB As String
    Dim fldCount As Integer
    Dim recCount As Long
    Dim iCol As Integer
    Dim iRow As Integer

    ' Create an instance of Excel and add a workbook
    Set xlApp = CreateObject("Excel.Application")
    Set xlWb = xlApp.Workbooks.Add
    Set xlWs = xlWb.Worksheets("Ê—ﬁ…1")
  
    ' Display Excel and give user control of Excel's lifetime
    xlApp.visible = True
    xlApp.UserControl = True
    
    ' Copy field names to the first row of the worksheet
    fldCount = res.Fields.count
    For iCol = 1 To fldCount
        xlWs.Cells(1, iCol).Value = res.Fields(iCol - 1).name
    Next
        
    ' Check version of Excel
    If val(Mid(xlApp.Version, 1, InStr(1, xlApp.Version, ".") - 1)) > 8 Then
        'EXCEL 2000,2002,2003, or 2007: Use CopyFromRecordset
         
        ' Copy the recordset to the worksheet, starting in cell A2
        If (res.state = 0) Then
            res.Open Get_Sql_Statment, Conn, , , adCmdText
        End If
            xlWs.Cells(2, 1).CopyFromRecordset res
       
        'Note: CopyFromRecordset will fail if the recordset
        'contains an OLE object field or array data such
        'as hierarchical recordsets
        
    End If
    ' Close ADO objects
    'res.Close
   ' Set res = Nothing
    ' Release Excel references
    Set xlWs = Nothing
    Set xlWb = Nothing

    Set xlApp = Nothing


End Sub

