VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form dlgAcc_Master 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·√” «–"
   ClientHeight    =   8745
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11385
   Icon            =   "dlgAcc_Master.frx":0000
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   8745
   ScaleWidth      =   11385
   StartUpPosition =   2  'CenterScreen
   Tag             =   ";repeat=true;"
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·√” «–"
      Height          =   8655
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
      Width           =   11220
      Begin VB.CommandButton cmdPrint 
         BackColor       =   &H00E0E0E0&
         Caption         =   "ÿ»«⁄…"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1440
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   8160
         Width           =   1155
      End
      Begin VB.CommandButton cmdClose 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Œ—ÊÃ"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   8160
         Width           =   1155
      End
      Begin VB.CommandButton cmdSearch 
         BackColor       =   &H00E0E0E0&
         Caption         =   "„⁄«Ì‰…"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2760
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   8160
         Width           =   1155
      End
      Begin VB.TextBox txtAcc 
         Alignment       =   1  'Right Justify
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   8370
         TabIndex        =   17
         Tag             =   ";search=true;"
         Top             =   540
         Width           =   2055
      End
      Begin VB.TextBox txtType 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   585
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   540
         Visible         =   0   'False
         Width           =   615
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
         TabIndex        =   5
         Top             =   225
         Width           =   10980
      End
      Begin MSComCtl2.DTPicker txtFrom 
         Height          =   375
         Left            =   5265
         TabIndex        =   1
         Top             =   540
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40095
      End
      Begin MSComctlLib.ProgressBar pb 
         Height          =   255
         Left            =   2040
         TabIndex        =   11
         Top             =   1080
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin MSComCtl2.DTPicker txtTo 
         Height          =   375
         Left            =   2025
         TabIndex        =   2
         Top             =   540
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40095
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6615
         Left            =   120
         TabIndex        =   4
         Top             =   1485
         Width           =   10935
         _cx             =   19288
         _cy             =   11668
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
         BackColorAlternate=   -2147483643
         GridColor       =   -2147483633
         GridColorFixed  =   -2147483632
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   8
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"dlgAcc_Master.frx":1CFA
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   4
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   0
         AutoSearchDelay =   2
         MultiTotals     =   0   'False
         SubtotalPosition=   1
         OutlineBar      =   0
         OutlineCol      =   0
         Ellipsis        =   0
         ExplorerBar     =   0
         PicturesOver    =   0   'False
         FillStyle       =   0
         RightToLeft     =   -1  'True
         PictureType     =   0
         TabBehavior     =   0
         OwnerDraw       =   0
         Editable        =   2
         ShowComboButton =   -1  'True
         WordWrap        =   0   'False
         TextStyle       =   0
         TextStyleFixed  =   0
         OleDragMode     =   0
         OleDropMode     =   0
         DataMode        =   1
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
      Begin VB.Label lblStatus 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„ƒ‘— Õ«·…  ﬁœ„ ⁄„·Ì… «·„⁄«Ì‰…"
         Height          =   255
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   1080
         Width           =   2130
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   195
         Left            =   10530
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   8265
         Width           =   540
      End
      Begin VB.Label lblM 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   11.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   8625
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   8175
         Width           =   1695
      End
      Begin VB.Label lblD 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   11.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   6825
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   8175
         Width           =   1695
      End
      Begin VB.Label lblRasid 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   11.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   4545
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   8175
         Width           =   1695
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   195
         Left            =   4275
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   630
         Width           =   675
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰  «—ÌŒ"
         Height          =   195
         Left            =   7470
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   630
         Width           =   600
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Õ”«»"
         Height          =   195
         Left            =   10530
         TabIndex        =   8
         Top             =   630
         Width           =   510
      End
      Begin VB.Label lblAccount 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Height          =   255
         Left            =   8265
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1080
         Width           =   2655
      End
   End
End
Attribute VB_Name = "dlgAcc_Master"
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


Dim rs As New ADODB.Recordset
Dim RowCount As Long
Dim StartBal As Double
Dim accType As Integer
Dim step As Long
Dim cstep As Long
Dim AccountLevel As String
Dim FDaily As New Acc_DailyNew
Dim FDailyOpening As New Acc_DailyOpening
Dim FSandok As New Acc_Sandok

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String
Public Records_Count As Integer
Public Default_Acc As String
Public Sub Open_Tadamon_Master(acc As String)
    txtAcc.text = acc
    txtAcc_Validate True
    cmdSearch_Click
    txtAcc.Enabled = False
    txtFrom.Enabled = False
    txtTo.Enabled = False
End Sub
Private Sub cmdReport_Click()
'    If AccountLevel = "" Then
'        MsgBox "ÌÃ» √‰  ” ⁄—÷ œ› — «·√” «– ·Õ”«» √Ê·«"
'        Exit Sub
'    End If
''    Dim extra(4) As String
''    extra(0) = lblAccount.Caption
''    extra(1) = lblM.Caption
''    extra(2) = lblD.Caption
''    extra(3) = lblRasid.Caption
'
''    SaveToXml fg, "repxml.xml", extra
'    pForm = AccountLevel
'    Acc_MasterRep.Show 1
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub CmdPrint_Click()
    master_doPrint master.rs
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
     If master.state <> ST_SEARCH Then
        cancel = True
    ElseIf Row <> 1 Then
        cancel = True
    End If
End Sub

Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = currentDatabaseName
    SelectFrame Me, ActiveFrame
    'txtAcc.SetFocus
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()

    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName

    oldScaleWidth = 11505
    '<AHMAD>
        'FormSettings = btPrint '+ btSearch + btSearchCancel + btSearchExec
        'btnSettings = btPrint '+ btSearch
        FormSettings = btall - btnew - btUpdate - btCancel - btsave - btDelete - btFirst - btNext - btPrev - btLast
        btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    '</AHMAD>
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    
    '<AHMAD>
        txtFrom.Value = dlgTadamoniHissa_Date_Filter.dtFrom.Value
        txtTo.Value = dlgTadamoniHissa_Date_Filter.dtTo.Value
        Open_Tadamon_Master Default_Acc
    '</AHMAD>
    
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    SetCaption Me
    
    'txtAcc.SetFocus
End Sub
Private Sub InitFrame()
    
    
'    txtFrom.Value = "1/1/" & GetCurrentAccYear(Conn)
'    txtTo.Value = Day(Date) & "/" & Month(Date) & "/" & GetCurrentAccYear(Conn)
    fg.DataMode = flexDMFree
    fg.ColWidth(0) = 3000
    fg.ColWidth(1) = 1100
    fg.ColWidth(2) = 805
    fg.ColWidth(3) = 3000
    fg.ColWidth(4) = 1505
    fg.ColWidth(5) = 1505
    fg.ColWidth(6) = 1505
    fg.ColAlignment(0) = flexAlignRightTop
    fg.ColAlignment(1) = flexAlignRightTop
    fg.ColAlignment(2) = flexAlignRightTop
    fg.ColAlignment(3) = flexAlignRightTop
    
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
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub


Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:accName,1:cDate,2:id,3:Dscrb,4:M,5:D,6:type,;"
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If AccountLevel = "" Then
        MsgBox "ÌÃ» √‰  ” ⁄—÷ œ› — «·√” «– ·Õ”«» √Ê·«"
        Exit Sub
    End If
    pForm = AccountLevel
    Set ToPrintForm = Me
    Acc_MasterRep.Show 1
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
   ' cmdSearch_Click
   
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub cmdSearch_Click()
    cmdSearch.Enabled = False
    Dim accNum As Long
    Dim sql, FromDate, toDate As String
    Dim cancel As Boolean
    FromDate = txtFrom.Value
    toDate = txtTo.Value
    If txtAcc.text = "" Or txtType.text = "" Then
        MsgBox "ÌÃ»  ÕœÌœ Õ”«» ﬁ»· «·»ÕÀ"
    cmdSearch.Enabled = True
        Exit Sub
    End If
    accNum = CLng(txtAcc.text) '29 'Sandok
    accType = CInt(txtType.text) '1 'Daen
    pb.Value = 0
    lblStatus.Caption = "Ã«—Ì  Õ„Ì· «·„⁄·Ê„« .."
    DoEvents
    
    sql = "set dateformat dmy select num n from acc_Fari" & Acc_DBYear & " where acc='" & accNum & "'"
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If rs.EOF Then
        AccountLevel = "Raisi"
        fg.ColHidden(6) = True
        fg.ColHidden(0) = False
    Else
        AccountLevel = "Fari"
        fg.ColHidden(6) = False
        fg.ColHidden(0) = True
    End If
    rs.Close
    pb.Value = 20
    If accType = 1 Then ' the account is D
        sql = "set dateformat dmy select isnull(sum(D-M),0) n from acc_daily" & Acc_DBYear & " where cDate<'" & FromDate & "' and AccNo=" & accNum
    Else
        sql = "set dateformat dmy select isnull(sum(M-D),0) n from acc_daily" & Acc_DBYear & " where cDate<'" & FromDate & "' and AccNo=" & accNum
    End If
    Set rs = ExecuteSelect(Conn, sql, cancel)
    '<AHMAD>
        'StartBal = rs!n
        Records_Count = rs.RecordCount
        StartBal = 0
    '</AHMAD>
    'rs.Close
    'If RowCount = 0 Then
    '    MsgBox "·« ÌÊÃœ ”‰œ«  Œ·«· «· «—ÌŒ «·„Õœœ"
    '    Exit Sub
    'End If
    pb.Value = 40
    sql = "set dateformat dmy select count(*)  as n " & _
            "from acc_Daily" & Acc_DBYearT & " " & _
            "Where cDate>='" & FromDate & "' AND cDate<='" & toDate & "' and accNo like '" & accNum & "%'"

    Set rs = ExecuteSelect(Conn, sql, cancel)
'    Debug.Print Sql
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« . «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        cmdSearch.Enabled = True
        Exit Sub
    End If
    pb.Value = 60
    RowCount = rs!N '+ RowCount
    If RowCount = 0 Then
        MsgBox "·« ÌÊÃœ ”‰œ«  Œ·«· «· «—ÌŒ «·„Õœœ"
        pb.Value = 0
        lblStatus.Caption = ""
        cmdSearch.Enabled = True
        Exit Sub
    End If
    '«· «—ÌŒ «·”‰œ «·»Ì«‰ œ«∆‰ „œÌ‰ «·—’Ìœ «·”«»ﬁ
    sql = "set dateformat dmy select accName , cDate , id  , Dscrb , M , D , type " & _
            "from acc_daily" & Acc_DBYearT & " " & _
            "Where cDate>='" & FromDate & "' AND cDate<='" & toDate & "' and accNo like '" & accNum & "%'" & _
            " ORDER BY cDate,id " '" ORDER BY cDate,accName "

    rs.Close
    
    Dim rsSelf As New ADODB.Recordset
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    pb.Value = 100
    
    FillData master.rs
    'rs.Close
    
    cmdSearch.Enabled = True
    '<AHMAD>
    ResizeGrid fg
    '</AHMAD>
End Sub

Private Sub FillData(ByRef rs As ADODB.Recordset)
    If rs.EOF Then
        Exit Sub
    End If
    rs.MoveFirst
    
    Dim i, j, lastSumRow As Long
    Dim currSanad As String
    Dim D, M, SumM, sumD, TotalSumM, TotalSumD As Double
    SumM = 0: sumD = 0: TotalSumM = 0: TotalSumD = 0
    currSanad = ""
    lastSumRow = -1
    i = 0
    step = CInt(RowCount / 100)
    cstep = step
    lblStatus.Caption = "Ã«—Ì  ‰”Ìﬁ ⁄—÷ «·„⁄·Ê„« .."
    DoEvents
    pb.Value = 0
    fg.Rows = RowCount + 1
    While i < RowCount
        D = 0
        M = 0
        If Not IsNull(rs.Fields(4).Value) Then
            M = rs.Fields(4).Value
        End If
        If Not IsNull(rs.Fields(5).Value) Then
            D = rs.Fields(5).Value
        End If
        TotalSumM = TotalSumM + M
        TotalSumD = TotalSumD + D
        If accType = 1 Then ' D
            StartBal = StartBal + D - M
        Else
            StartBal = StartBal + M - D
        End If
        fg.TextMatrix(i + 1, 0) = CStr(rs.Fields(0).Value & "")
        fg.TextMatrix(i + 1, 1) = CStr(rs.Fields(1).Value & "")
        fg.TextMatrix(i + 1, 2) = CStr(rs.Fields(2).Value & "")
        fg.TextMatrix(i + 1, 3) = CStr(rs.Fields(3).Value & "")
        fg.TextMatrix(i + 1, 4) = CStr(rs.Fields(4).Value & "")
        fg.TextMatrix(i + 1, 5) = CStr(rs.Fields(5).Value & "")
        fg.TextMatrix(i + 1, 6) = StartBal 'sum
'            fg.TextMatrix(i + 1, 6) = CStr(rs.Fields(5).Value & "") 'sanad id
        fg.TextMatrix(i + 1, 7) = CStr(rs.Fields(6).Value & "") 'sanad type
        
        rs.MoveNext
        If i >= cstep Then
            If pb.Value <> 100 Then
                pb.Value = pb.Value + 1
                cstep = cstep + step
            End If
        End If
        i = i + 1
    Wend
    'TotalSumM = TotalSumM + sumM
    'TotalSumD = TotalSumD + sumD
    lblM.Caption = TotalSumM
    lblD.Caption = TotalSumD
    pb.Value = 100
    lblStatus.Caption = "⁄œœ «·”‰œ«  «·„⁄—Ê÷…: " & RowCount
    lblRasid.Caption = StartBal
End Sub
Private Sub fg_CellChanged(ByVal Row As Long, ByVal Col As Long)
    Select Case Col
        Case 3:
            fg.Cell(flexcpFontBold, Row, Col) = True
            fg.Cell(flexcpForeColor, Row, Col) = vbBlue

        Case 4:
            fg.Cell(flexcpFontBold, Row, Col) = True
            fg.Cell(flexcpForeColor, Row, Col) = vbRed
    End Select
    
End Sub
Private Sub fg_DblClick()
'<AHMAD>
    If master.state = ST_SEARCH And fg.Row = 1 Then Exit Sub
'</AHMAD>
Dim F As Form
If fg.IsSubtotal(fg.Row) Then
    Exit Sub
End If
       ' Set f = FDaily
    If fg.Cell(flexcpText, fg.Row, 7) = 0 Or fg.Cell(flexcpText, fg.Row, 7) = 4 Or fg.Cell(flexcpText, fg.Row, 7) = 5 Or fg.Cell(flexcpText, fg.Row, 7) = 3 Then
        Set F = FDaily
    ElseIf fg.Cell(flexcpText, fg.Row, 7) = 1 Then
        Set F = FDailyOpening
    ElseIf fg.Cell(flexcpText, fg.Row, 7) = 2 Or fg.Cell(flexcpText, fg.Row, 7) = 7 Then
        Set F = FSandok
    Else
        MsgBox "‰„ÿ Â–« «·”‰œ €Ì— „Õœœ «· ÊÃÌÂ!!! « ’· »„Ê“⁄ «·»—‰«„Ã"
        Exit Sub
    End If
    F.Show
    F.master.BeginSearch
    F.txtId.text = fg.Cell(flexcpText, fg.Row, 2)
    F.master.Search
End Sub

Private Sub txtAcc_Change()
'    txtAcc.text = " "
'    resetAll
End Sub

Private Sub txtAcc_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 116 Then
        Dim cancel As Boolean
        txtAcc.text = " "
        txtAcc_Validate cancel
    End If
End Sub

'Private Sub txtFrom_Change()
'    txtAcc.text = ""
'    resetAll
'End Sub

'Private Sub txtTo_Change()
'    txtAcc.text = ""
'    resetAll
'End Sub
Private Sub resetAll()
    fg.Rows = 1
    lblM.Caption = 0
    lblD.Caption = 0
    lblRasid.Caption = 0
    lblStatus.Caption = "„ƒ‘— Õ«·…  ﬁœ„ ⁄„·Ì… «·„⁄«Ì‰…"
    txtType.text = ""
    'txtAcc.text = ""
    lblAccount.Caption = ""
    pb.Value = 0
    AccountLevel = ""
End Sub

Private Sub txtAcc_Validate(cancel As Boolean)
    Dim c As Boolean
'    If master.State = 0 Then Exit Sub
    Dim acc As String
    acc = txtAcc.text
    If Trim(acc) <> "" Then
       Dim numeric As Boolean
       numeric = IsNumeric(acc)
       If numeric Then 'He entered the number of the account
           Set rs = ExecuteSelect(Conn, "select type,acc,name from acc_Accounts" & Acc_DBYear & " where acc='" & acc & "'", c)
       ElseIf InStr(1, acc, "(") > 0 Then
           Set rs = ExecuteSelect(Conn, "select type,acc,name from acc_Accounts" & Acc_DBYear & " where '('+acc+') '+name like '" & acc & "'", c)
       Else
           Set rs = ExecuteSelect(Conn, "select type,acc,name from acc_Accounts" & Acc_DBYear & " where name like '" & acc & "'", c)
       End If
       If c Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            cancel = True
            Exit Sub
       End If
       If rs.RecordCount <> 1 Then
            rs.Close
            If numeric Then 'He entered the number of the account
                Set rs = ExecuteSelect(Conn, "select type,acc,name from acc_Accounts" & Acc_DBYear & " where acc='%" & acc & "%'", c)
            Else
                Set rs = ExecuteSelect(Conn, "select type,acc,name from acc_Accounts" & Acc_DBYear & " where name like '%" & acc & "%'", c)
            End If
            If c Then
                 MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
                 cancel = True
                 Exit Sub
            End If
            If rs.RecordCount <> 1 Then
                   GLOBAL_TAG = ";datafield=,0:acc,1:name,2:type,;"
                   GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetGridAcc,1:SetGridName,2:SetType,;"
                   If numeric Then
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & acc & ",;"
                   Else
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & acc & ",;"
                   End If
                   GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select acc,name, type from acc_Accounts" & Acc_DBYear & ";"
                  btnSettings = GetBtnSettings
                   Clin_List.fg.Cols = 3
                   Clin_List.fg.ColHidden(2) = True: Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
                   Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
                   Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                   Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
                    Clin_List.fg.Row = 1
                   If numeric Then
                        Clin_List.fg.Col = 0
                   Else
                        Clin_List.fg.Col = 1
                   End If
                   Set Clin_List.CallerForm = Me
                   txtAcc.text = ""
                   lblAccount.Caption = ""
                   txtType.text = ""
                   Clin_List.Show 1
                   RefreshCommands btnSettings And FormSettings
                   If txtType.text = "" Then cancel = True
                   Exit Sub
            End If
       End If 'rs.RecordCount <> 1
       txtAcc.text = rs!acc ' & ") " & rs!Name
       lblAccount.Caption = "ﬂ‘› Õ”«»: " & rs!name
       txtType.text = rs!Type
    End If
End Sub
Public Sub SetGridAcc(val As String)
    txtAcc.text = val
End Sub
Public Sub SetGridName(val As String)
    lblAccount.Caption = "ﬂ‘› Õ”«»: " & val
End Sub
Public Sub SetType(val As String)
    txtType.text = val
End Sub
