VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form dlgTasdeedShares 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " Ê“Ì⁄ «·Õ’’"
   ClientHeight    =   7095
   ClientLeft      =   3015
   ClientTop       =   1725
   ClientWidth     =   5985
   Icon            =   "dlgTasdeedShares.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   7095
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   350
      Left            =   0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   120
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·Õ’…"
      Height          =   2055
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   600
      Width           =   5775
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   240
         Width           =   5535
      End
      Begin VB.ComboBox cbShare 
         DataField       =   "Share"
         ForeColor       =   &H80000012&
         Height          =   315
         Left            =   2040
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   19
         Tag             =   ";search=true;check=required;"
         Top             =   540
         Width           =   2955
      End
      Begin VB.Label lblDescription 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   0
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   10241
            SubFormatType   =   0
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   735
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   ";AlwaysEnabled=false;"
         Top             =   1200
         Width           =   5535
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÃÂ… «· Ì  ÕÊ· ≈·ÌÂ«"
         Height          =   195
         Index           =   2
         Left            =   4095
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   960
         Width           =   1470
      End
      Begin VB.Label LblTotal 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   510
         Width           =   1320
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„»·€"
         Height          =   195
         Index           =   1
         Left            =   1470
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Õ’…"
         Height          =   195
         Index           =   0
         Left            =   5160
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   600
         Width           =   405
      End
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "⁄Êœ…"
      Default         =   -1  'True
      Height          =   375
      Left            =   2250
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   6600
      Width           =   1515
   End
   Begin VB.CommandButton cmdPrint 
      Enabled         =   0   'False
      Height          =   350
      Left            =   120
      Picture         =   "dlgTasdeedShares.frx":1CFA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      TabStop         =   0   'False
      ToolTipText     =   "ÿ»«⁄…"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdLast 
      Enabled         =   0   'False
      Height          =   350
      Left            =   600
      Picture         =   "dlgTasdeedShares.frx":1E7E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      TabStop         =   0   'False
      ToolTipText     =   "«·√ŒÌ—"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdNext 
      Enabled         =   0   'False
      Height          =   350
      Left            =   960
      Picture         =   "dlgTasdeedShares.frx":21C2
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      ToolTipText     =   "«· «·Ì"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdPrev 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1320
      Picture         =   "dlgTasdeedShares.frx":2506
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   13
      TabStop         =   0   'False
      ToolTipText     =   "«·”«»ﬁ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdFirst 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1680
      Picture         =   "dlgTasdeedShares.frx":284A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   12
      TabStop         =   0   'False
      ToolTipText     =   "«·√Ê·"
      Top             =   120
      Width           =   375
   End
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " Ê“Ì⁄«  «·Õ’…"
      Height          =   3855
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Tag             =   ";repeat=true;"
      Top             =   2640
      Width           =   5775
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   240
         Width           =   5535
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   3255
         Left            =   120
         TabIndex        =   1
         Tag             =   $"dlgTasdeedShares.frx":2B8E
         Top             =   480
         Width           =   5535
         _cx             =   9763
         _cy             =   5741
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   0
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         BackColorFixed  =   -2147483633
         ForeColorFixed  =   -2147483630
         BackColorSel    =   -2147483635
         ForeColorSel    =   -2147483634
         BackColorBkg    =   -2147483636
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
         Cols            =   2
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"dlgTasdeedShares.frx":2C3C
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
   End
   Begin VB.CommandButton cmdExecSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3000
      Picture         =   "dlgTasdeedShares.frx":2C8A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      ToolTipText     =   " ‰›Ì– »ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdCancelSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2640
      Picture         =   "dlgTasdeedShares.frx":304C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡ »ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3360
      Picture         =   "dlgTasdeedShares.frx":31D0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   8
      TabStop         =   0   'False
      ToolTipText     =   "»ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdCancel 
      Height          =   350
      Left            =   4080
      Picture         =   "dlgTasdeedShares.frx":3754
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdSave 
      Height          =   350
      Left            =   4440
      Picture         =   "dlgTasdeedShares.frx":38D8
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      TabStop         =   0   'False
      ToolTipText     =   "Õ›Ÿ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdDel 
      Height          =   350
      Left            =   4800
      Picture         =   "dlgTasdeedShares.frx":3E5C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Õ–›"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdUpdate 
      Height          =   350
      Left            =   5160
      Picture         =   "dlgTasdeedShares.frx":4408
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   " ⁄œÌ·"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdNew 
      Height          =   350
      Left            =   5505
      Picture         =   "dlgTasdeedShares.frx":498C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      TabStop         =   0   'False
      ToolTipText     =   "ÃœÌœ"
      Top             =   120
      Width           =   375
   End
End
Attribute VB_Name = "dlgTasdeedShares"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public controllers As New Collection

Public WithEvents detail As Controller
Attribute detail.VB_VarHelpID = -1
Public FormDetailSettings As Long
Public btnDetailSettings As Long

Dim WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public FormSettings As Long
Public btnSettings As Long

Dim ActiveFrame As frame
Dim oldScaleWidth As Long

Public ShareState As Integer

Private rsShares As ADODB.Recordset

Public Property Get ActiveController() As Controller
    If ActiveFrame = masterFrame Then
        Set ActiveController = master
    Else
        Set ActiveController = detail
    End If
End Property

Private Sub cbShare_Click()
    lblDescription.Caption = ""
    If cbShare.ListIndex < 0 Then Exit Sub
    rsShares.Filter = "Id = " & cbShare.ItemData(cbShare.ListIndex)
    If Not IsNull(rsShares!Description) Then
        lblDescription.Caption = rsShares!Description
    End If
End Sub

Private Sub cmdCancel_Click()
    ActiveController.CancelSave
End Sub

Private Sub cmdCancelSearch_Click()
    ActiveController.CancelSearch
End Sub

Private Sub cmdDel_Click()
    ActiveController.Delete
End Sub

Private Sub cmdExecSearch_Click()
    ActiveController.Search
End Sub

Private Sub cmdFirst_Click()
    ActiveController.MoveFirst
End Sub

Private Sub cmdLast_Click()
    ActiveController.MoveLast
End Sub

Private Sub cmdNew_Click()
    ActiveController.addNew
End Sub

Private Sub cmdNext_Click()
    ActiveController.MoveNext
End Sub

Private Sub cmdOK_Click()
    Unload Me
End Sub

Private Sub cmdPrev_Click()
    ActiveController.MovePrev
End Sub

Private Sub cmdSave_Click()
    ActiveController.Save
End Sub

Private Sub cmdSearch_Click()
    ActiveController.BeginSearch
End Sub

Private Sub cmdUpdate_Click()
    ActiveController.Update
End Sub

Private Sub detail_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    If master.rs.RecordCount = 0 Then
        MsgBox "ÌÃ» ≈÷«›… Õ’… ﬁ»· «·»œ¡ »≈÷«›…  ›«’Ì· «·Õ’…", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
    End If
End Sub

Private Sub detail_doDeleteCompleted(rs As ADODB.Recordset)
    calculateTotal master.rs
End Sub

Private Sub detail_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!StateShare = master.rs!id
End Sub

Private Sub detail_doSaveComplete(rs As ADODB.Recordset)
    calculateTotal master.rs
End Sub

Private Sub detail_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = "·« Ì„ﬂ‰ ≈œŒ«· «· Ê“Ì⁄ –« Â „— Ì‰ ÷„‰ «·Õ’… –« Â« Õ Ï Ê≈‰ ﬂ«‰ «·„»·€ „Œ ·›«."
End Sub

Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings(Me)
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands btnDetailSettings And FormDetailSettings, Me
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings, Me
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings, Me
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings(Me)
    Else
        btnDetailSettings = GetBtnSettings(Me)
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 6075

    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btPrev - btFirst - btNext - btLast - btPrint
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec

    FormatForm Me

    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set master.ButtonsForm = Me
    master.TraceChanges = True
    controllers.Add master, masterFrame.name

    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    Set detail.ButtonsForm = Me
    controllers.Add detail, detailFrame.name

    InitFrame

    Dim cancel As Boolean
    Dim sql As String
    sql = "SELECT * FROM TasdeedStateShare WHERE State = " & ShareState
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    master.rs.sort = "Id ASC"

    Set ActiveFrame = masterFrame
End Sub

Private Sub InitFrame()
    Dim c As Boolean
    Set rsShares = ExecuteSelect(Conn, "SELECT * FROM TasdeedShare", c)
    If rsShares.RecordCount > 0 Then
        rsShares.MoveFirst
        Do While Not rsShares.EOF
            cbShare.AddItem rsShares.Fields("Caption").Value
            cbShare.ItemData(cbShare.NewIndex) = rsShares.Fields("Id").Value
            rsShares.MoveNext
        Loop
    End If
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
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    Set detail = Nothing
    RefreshCommands 0, Me
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    detailFrame.visible = False
    LblTotal.Caption = ""
    loadDetailsRs rs
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    detailFrame.visible = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    loadDetailsRs rs
    calculateTotal rs
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!State = ShareState
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    detailFrame.visible = True
    loadDetailsRs rs
End Sub

Private Sub master_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = "·« Ì„ﬂ‰ ≈œŒ«· «·Õ’… –« Â« „— Ì‰ ÷„‰ «·Õ«·… –« Â«."
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    btnDetailSettings = GetBtnSettings(Me)
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings, Me
End Sub

Private Sub calculateTotal(ByRef rs As ADODB.Recordset)
    Dim c As Boolean
    Dim rsTotal As ADODB.Recordset
    Set rsTotal = ExecuteSelect(Conn, "SELECT Total FROM vSharesTotals WHERE Id = " & rs!id, c)
    If rsTotal.RecordCount > 0 Then
        LblTotal.Caption = rsTotal!Total
    Else
        LblTotal = "0"
    End If
    rsTotal.Close
    Set rsTotal = Nothing
End Sub

Private Sub loadDetailsRs(ByRef rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    
    If rs.RecordCount = 0 Then Exit Sub
    
    sql = "SELECT * FROM TasdeedDistribution" & vbCrLf & _
          "WHERE StateShare "

    If IsNull(rs!id) Or IsEmpty(rs!id) Then
        sql = sql & "IS NULL"
    Else
        sql = sql & "= " & rs!id
    End If

    Set detail.rs = ExecuteSelect(Conn, sql, cancel)
    If detail.rs.EOF Then Exit Sub
    detail.rs.MoveFirst
End Sub

