VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_DailyBrowse 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·ÌÊ„Ì…"
   ClientHeight    =   7185
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11505
   Icon            =   "Acc_DailyBrowse.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7185
   ScaleWidth      =   11505
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·ÌÊ„Ì…"
      Height          =   6735
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
      Width           =   11295
      Begin VB.CommandButton Command2 
         BackColor       =   &H00E0E0E0&
         Caption         =   " ÕœÌÀ"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   600
         Width           =   1300
      End
      Begin VB.CheckBox chkCancelDay 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈Â„«· «·ÌÊ„ ›Ì «· — Ì»"
         Height          =   255
         Left            =   3120
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   6240
         Width           =   1935
      End
      Begin VB.CommandButton Command3 
         BackColor       =   &H00E0E0E0&
         Caption         =   " — Ì»  ‰«“·Ì"
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   6165
         Width           =   1300
      End
      Begin VB.CommandButton Command1 
         BackColor       =   &H00E0E0E0&
         Caption         =   " — Ì»  ’«⁄œÌ"
         Height          =   375
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   6165
         Width           =   1300
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
         Width           =   11055
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4095
         Left            =   240
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:cDate,1:id,2:SanadName,3:M,4:D,5:type,;"
         Top             =   1440
         Width           =   10935
         _cx             =   19288
         _cy             =   7223
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman"
            Size            =   14.25
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
         FormatString    =   $"Acc_DailyBrowse.frx":1CFA
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
         Editable        =   1
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
      Begin MSComCtl2.DTPicker txtFrom 
         Height          =   375
         Left            =   8145
         TabIndex        =   3
         Top             =   555
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         _Version        =   393216
         Format          =   57147393
         CurrentDate     =   40095
      End
      Begin MSComCtl2.DTPicker txtTo 
         Height          =   375
         Left            =   3945
         TabIndex        =   4
         Top             =   555
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         _Version        =   393216
         Format          =   57147393
         CurrentDate     =   40095
      End
      Begin VB.Label lblStatus 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„ƒ‘— Õ«·…  ﬁœ„ ⁄„·Ì… «·„⁄«Ì‰…"
         Height          =   255
         Left            =   8520
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1080
         Width           =   2535
      End
      Begin VB.Label lblD 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   20.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   2880
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5700
         Width           =   3615
      End
      Begin VB.Label lblM 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   20.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5700
         Width           =   3615
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   285
         Left            =   10365
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   5745
         Width           =   765
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   195
         Left            =   6345
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   675
         Width           =   675
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰  «—ÌŒ"
         Height          =   195
         Left            =   10440
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   675
         Width           =   600
      End
   End
End
Attribute VB_Name = "Acc_DailyBrowse"
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
Dim SumM As Double
Dim sumD As Double
Dim rs As New ADODB.Recordset
Dim RowCount As Long
Dim step As Long
Dim kaids As Long
Dim FDaily As New Acc_DailyNew
Dim FDailyOpening As New Acc_DailyOpening
Dim FSandok As New Acc_Sandok
Dim SortAssending As Boolean
Dim needsDeactivate As Boolean

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String

Private Sub Command1_Click()
    SortAssending = True
    If chkCancelDay.Value Then
        fg.sort = flexSortCustom
    Else
        fg.sort = flexSortGenericAscending
    End If
End Sub

Private Sub Command2_Click()
    master.rs.Requery
   ' master.Search
End Sub

Private Sub Command3_Click()
    SortAssending = False
    If chkCancelDay.Value Then
        fg.sort = flexSortCustom
    Else
        fg.sort = flexSortGenericDescending
    End If
End Sub

Private Sub fg_Compare(ByVal Row1 As Long, ByVal Row2 As Long, Cmp As Integer)
    Dim date1 As Date
    Dim date2 As Date
    Dim sortInt As Integer
   If SortAssending Then
        sortInt = 1
    Else
        sortInt = -1
    End If
    date1 = CDate(fg.Cell(flexcpText, Row1, 0))
    date2 = CDate(fg.Cell(flexcpText, Row2, 0))
    If (Month(date1) = Month(date2)) And (year(date1) = year(date2)) Then
        If fg.Cell(flexcpText, Row1, 1) = fg.Cell(flexcpText, Row2, 1) Then
            Cmp = 0
        ElseIf CLng(fg.Cell(flexcpText, Row1, 1)) < CLng(fg.Cell(flexcpText, Row2, 1)) Then
                Cmp = -1 * sortInt
        Else
                Cmp = 1 * sortInt
        End If
    ElseIf (year(date1) = year(date2)) Then
        If Month(date1) < Month(date2) Then
                Cmp = -1 * sortInt
        Else
                Cmp = 1 * sortInt
        End If
    ElseIf (year(date1) < year(date2)) Then
            Cmp = -1 * sortInt
    Else
            Cmp = 1 * sortInt
    End If
End Sub

Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = currentDatabaseName
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    needsDeactivate = True
End Sub

Private Sub Form_Deactivate()
    If needsDeactivate Then btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    
    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName

    oldScaleWidth = 11625
    FormSettings = btall - btFirst - btLast - btNext - btPrev - btUpdate - btDelete - btnew - btsave - btCancel
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec

    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Dim sql As String
    sql = "set dateformat dmy select cDate,sanadName, sum(M) as M, sum(D) as D, id,type " & _
                          "from acc_daily" & Acc_DBYear & _
                          "  " & _
                          "Group by cDate,sanadName,id,type " & _
                          "ORDER BY cDate,id"
    master.state = master.state + ST_FILLGRID
    Me.MousePointer = vbHourglass
    lblStatus.Caption = "Ã«—Ì  Õ„Ì· «·„⁄·Ê„« ... «·—Ã«¡ «·«‰ Ÿ«—"

    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    Me.MousePointer = vbNormal
    lblStatus.Caption = ""
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
    End If
'    Load FDaily
'    Load FDailyOpening
'    Load FSandok
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    SetCaption Me
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    

    txtFrom.Value = "1/1/" & GetCurrentAccYear(Conn)
    txtTo.Value = Day(Date) & "/" & Month(Date) & "/" & GetCurrentAccYear(Conn)
End Sub

Private Sub Form_Resize()
    Dim Alpha As Double
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
        Exit Sub
    End If
    If MDIMain.WindowState = vbMinimized Then Exit Sub
    
    If Me.WindowState = vbMinimized Then Exit Sub
    
    If ScaleWidth = 0 Then
        Exit Sub
    End If
    Alpha = ScaleWidth / oldScaleWidth
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
    
    'ResizeGrid fg
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fg.Cols - 1
        totWidth = totWidth + fg.ColWidth(i)
    Next
    For i = 0 To fg.Cols - 1
        fg.ColWidth(i) = (fg.Width - 100) * fg.ColWidth(i) / totWidth
    Next
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    RefreshCommands 0
End Sub

Private Sub master_doBeforeMoveComplete(rs As ADODB.Recordset, cancel As Boolean)
    SumM = 0
    sumD = 0
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    Command1.Enabled = False
    Command3.Enabled = False
    chkCancelDay.Enabled = False
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    Command1.Enabled = True
    Command3.Enabled = True
    chkCancelDay.Enabled = True
End Sub

Private Sub master_doEOFReached(rs As ADODB.Recordset)
    lblM.Caption = SumM
    lblD.Caption = sumD
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    If Not IsNull(rs!M) Then SumM = SumM + rs!M
    If Not IsNull(rs!D) Then sumD = sumD + rs!D
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
  If fg.Rows <= 1 Then
        MsgBox "ÌÃ» √‰  ” ⁄—÷ œ› — «·ÌÊ„Ì… √Ê·«"
        'Exit Sub
  
    Else
    pForm = "Daily"
    Set ToPrintForm = Me
    Acc_MasterRep.Show 1
'    Dim DRDaily As New Acc_DRDailyRep
'    'If Acc_DRDailyRep Is Nothing Then
'    '    Set Acc_DRDailyRep = New Acc_DRDailyRep
'   ' FillRsData rs, fg
'    '
    
'    Acc_DRDailyRep.Caption = "«·ÌÊ„Ì…   %d"
'    Get_DataReport_Label_byName(Acc_DRDailyRep, 1, "lblTitle").Caption = "«·ÌÊ„Ì…   %d"
'    Get_DataReport_Label_byName(Acc_DRDailyRep, 1, "lblBranch").Caption = FARI_NAME
'    Get_DataReport_Label_byName(Acc_DRDailyRep, 5, "lblMSum").Caption = lblM
'    Get_DataReport_Label_byName(Acc_DRDailyRep, 5, "lblDSum").Caption = lblD
'    Get_DataReport_Label_byName(Acc_DRDailyRep, 1, "lblFrom").Caption = txtFrom.Value
'    Get_DataReport_Label_byName(Acc_DRDailyRep, 1, "lblTo").Caption = txtTo.Value
'    Set Acc_DRDailyRep.DataSource = fg.DataSource
'    Acc_DRDailyRep.Show 1
  End If
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    
    Dim sql, FromDate, toDate As String
    Dim cancel As Boolean
    If master.state And ST_FILLGRID Then
        master.state = master.state - ST_FILLGRID
    End If
    FromDate = txtFrom.Value
    toDate = txtTo.Value
    S = "cDate>='" & FromDate & "' AND cDate<='" & toDate & "' "
    DefaultType = 1
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    lblStatus.Caption = "⁄œœ «·”‰œ«  «·„⁄—Ê÷…: " & rs.RecordCount
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub fg_DblClick()
Dim F As Form
If fg.Row = 0 Then Exit Sub
If master.state = ST_SEARCH Then
    MsgBox "ÌÃ» √‰  ‰ÂÌ «·»ÕÀ «·Õ«·Ì Õ Ï   „ﬂ‰ „‰ «” ⁄—«÷  ›«’Ì· «·”‰œ", vbMsgBoxRight + vbMsgBoxRtlReading
    Exit Sub
End If
If fg.IsSubtotal(fg.Row) Then
    Exit Sub
End If
    If fg.Cell(flexcpText, fg.Row, 5) = 0 Or fg.Cell(flexcpText, fg.Row, 5) = 4 Or fg.Cell(flexcpText, fg.Row, 5) = 5 Or fg.Cell(flexcpText, fg.Row, 5) = 3 Then
        Set F = FDaily
    ElseIf fg.Cell(flexcpText, fg.Row, 5) = 1 Then
        Set F = FDailyOpening
    ElseIf fg.Cell(flexcpText, fg.Row, 5) = 2 Or fg.Cell(flexcpText, fg.Row, 5) = 7 Then
        Set F = FSandok
    Else
        MsgBox "‰„ÿ Â–« «·”‰œ €Ì— „Õœœ «· ÊÃÌÂ!!! « ’· »„Ê“⁄ «·»—‰«„Ã"
        Exit Sub
    End If
    'f.whereClause = "where id=" & fg.Cell(flexcpText, fg.Row, 1)
    btnSettings = GetBtnSettings
    needsDeactivate = False
    F.Show
    F.master.BeginSearch
    F.txtId.text = fg.Cell(flexcpText, fg.Row, 1)
    F.master.Search
   
End Sub
Private Sub fg_CellChanged(ByVal Row As Long, ByVal Col As Long)
    If Row = 0 Then Exit Sub
    Select Case Col
        Case 2:
            fg.Cell(flexcpFontBold, Row, Col) = True
            fg.Cell(flexcpForeColor, Row, Col) = vbBlue

        Case 3:
            fg.Cell(flexcpFontBold, Row, Col) = True
            fg.Cell(flexcpForeColor, Row, Col) = vbRed
    End Select
End Sub

