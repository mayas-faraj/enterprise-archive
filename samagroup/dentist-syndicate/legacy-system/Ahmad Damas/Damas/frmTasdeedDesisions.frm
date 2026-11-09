VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmTasdeedDecisions 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ÈíÇäÇÊ ÇáÑÓæã ÇáÓäæíÉ"
   ClientHeight    =   7305
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9150
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7305
   ScaleWidth      =   9150
   Tag             =   ";typeof=vsflexgrid;datafield=,0:devision_name,;check=,0:required,;"
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ÈäæÏ ÇáÞÑÇÑ"
      Height          =   5295
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   1920
      Width           =   9015
      Begin VB.CheckBox chkdetailFrame 
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
         Width           =   8775
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4695
         Left            =   120
         TabIndex        =   2
         Tag             =   $"frmTasdeedDesisions.frx":0000
         Top             =   480
         Width           =   8775
         _cx             =   15478
         _cy             =   8281
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
         AllowSelection  =   0   'False
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   7
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmTasdeedDesisions.frx":00AF
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
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ÇáÞÑÇÑ"
      Height          =   1935
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   0
      Width           =   9015
      Begin VB.CommandButton cmdAddSimilar 
         BackColor       =   &H00E0E0E0&
         Caption         =   "ÅÖÇÝÉ ÞÑÇÑ ÌÏíÏ ããÇËá"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   1440
         Width           =   1755
      End
      Begin VB.TextBox txtCaption 
         Alignment       =   1  'Right Justify
         DataField       =   "Caption"
         Height          =   855
         Left            =   120
         MaxLength       =   200
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   6
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   7515
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
         TabIndex        =   4
         Top             =   240
         Width           =   8775
      End
      Begin MSComCtl2.DTPicker dtSince 
         DataField       =   "Since"
         Height          =   375
         Left            =   5880
         TabIndex        =   8
         Tag             =   ";search=true;check=required;new=1/1/2004;"
         Top             =   1440
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ÚäæÇä ÇáÞÑÇÑ"
         Height          =   195
         Index           =   1
         Left            =   8010
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   450
         Width           =   810
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ÇÚÊÈÇÑÇð ãä ÊÇÑíÎ"
         Height          =   195
         Index           =   0
         Left            =   7725
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1530
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmTasdeedDecisions"
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

Const SERIAL_ = 0
Const DESCRIPTION_ = 1
Const IS_SYRIAN_ = 2
Const SHOULD_CHANGE_DOCTOR_STATUS_ = 3
Const TOTAL_ = 4
Const ID_ = 5

Public DecisionCaption As String
Public DecisionDate As Date
Public DialogResult As Boolean

Private Sub cmdAddSimilar_Click()
    DecisionCaption = txtCaption
    With dlgSimilarTasdeedDecision
        Set .CallerForm = Me
        .Show 1
    End With
    If Not DialogResult Then Exit Sub
    Dim c As Boolean
    Dim msg As String
    Dim sql As String
    sql = "SET DATEFORMAT DMY EXEC sp_AddSimilarTasdeedDecision " & master.rs!id & ", '"
    sql = sql & DecisionCaption & "', '" & format(DecisionDate, "dd/mm/yyyy") & "'"
    ExecuteCommand Conn, sql, c
    If Not c Then
        msg = "ÊãÊ ÇáÚãáíÉ ÈäÌÇÍ¡ ÓíÊã ÇáÇäÊÞÇá Åáì ÇáÞÑÇÑ ÇáÌÏíÏ"
    Else
        msg = "áã ÊäÌÍ ÇáÚãáíÉ ÈÓÈÈ ÇÎÊíÇÑ ÊÇÑíÎ ÛíÑ ãäÇÓÈ."
    End If
    MsgBox msg, vbOKOnly Or vbInformation Or vbMsgBoxRight Or vbMsgBoxRtlReading
    If Not c Then
        Set master.rs = ExecuteSelect(Conn, "SELECT * FROM TasdeedDecision", cancel)
        master.rs.sort = "Since Desc"
        master.rs.Find "Since = '" & DecisionDate & "'"
    End If
End Sub

Private Sub detail_doAddNew(rs As ADODB.Recordset)
    Dim serial As Integer
    serial = 1
    Dim rsMax As ADODB.Recordset
    Dim c As Boolean
    Set rsMax = ExecuteSelect(Conn, "SELECT Max(Serial) FROM TasdeedState WHERE Decision = " & master.rs!id, c)
    rsMax.MoveFirst
    If Not IsNull(rsMax.Fields(0)) Then
        serial = rsMax.Fields(0).Value + 1
    End If
    fg.TextMatrix(fg.Row, SERIAL_) = serial
    fg.ColComboList(TOTAL_) = ""
End Sub

Private Sub detail_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.ColComboList(TOTAL_) = "..."
    fg.Tag = setGridTagValue(fg.Tag, "datafield", ID_, "Id")
End Sub

Private Sub detail_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "áÇ íãßäß ÍÐÝ åÐå ÇáÍÇáÉ¡ ÊÃßøÏ ãä ÚÏã æÌæÏ ÃØÈÇÁ ãÓÏÏíä æÝÞÇð áåÐå ÇáÍÇáÉ.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "ÍÐÝ ãÌãæÚÉ"
    cancel = True
End Sub

Private Sub detail_doMoveComplete(rs As ADODB.Recordset)
    getStateTotal rs!id
End Sub

Private Sub detail_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!Decision = master.rs!id
    fg.Tag = setGridTagValue(fg.Tag, "datafield", ID_, "")
End Sub

Private Sub detail_doSaveComplete(rs As ADODB.Recordset)
    fg.ColComboList(TOTAL_) = "..."
    fg.Cell(flexcpText, fg.Row, ID_) = rs!id
    fg.Tag = setGridTagValue(fg.Tag, "datafield", ID_, "Id")
End Sub

Private Sub detail_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = "ÊæÌÏ ÍÇáÉ ÃÎÑì áåÇ ÇáÑÞã ÇáãÊÓáÓá ÐÇÊå."
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If fg.ColComboList(TOTAL_) = "" Then
        cancel = Col = TOTAL_
    End If
End Sub

Private Sub fg_CellButtonClick(ByVal Row As Long, ByVal Col As Long)
    If Col = TOTAL_ Then
        dlgTasdeedShares.ShareState = fg.Cell(flexcpText, Row, ID_)
        dlgTasdeedShares.Show 1
        getStateTotal fg.Cell(flexcpText, Row, ID_)
    End If
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "fari"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = detailFrame Then
        RefreshCommands btnDetailSettings And FormDetailSettings
    Else
        RefreshCommands btnSettings And FormSettings
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = detailFrame Then
        btnDetailSettings = GetBtnSettings
    Else
        btnSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9270

    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btPrev - btFirst - btNext - btLast - btPrint
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec

    FormatForm Me

    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    master.TraceChanges = True
    controllers.Add master, masterFrame.name

    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    controllers.Add detail, detailFrame.name

    InitFrame

    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "SELECT * FROM TasdeedDecision", cancel)
    master.rs.sort = "Since Desc"

    Set ActiveFrame = masterFrame
End Sub

Private Sub InitFrame()
    ' Initialization
    dtSince.Tag = SetTagValue(dtSince.Tag, "new", Date)
    fg.ColComboList(TOTAL_) = "..."
    fg.ColComboList(IS_SYRIAN_) = "#0;áÇ|#1;äÚã"
    fg.ColComboList(SHOULD_CHANGE_DOCTOR_STATUS_) = fg.ColComboList(IS_SYRIAN_)
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
    Set detail = Nothing
    RefreshCommands 0
End Sub

Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands btnDetailSettings And FormDetailSettings
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    cmdAddSimilar.Enabled = False
    detailFrame.visible = False
    loadDetailsRs rs
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    cmdAddSimilar.Enabled = True
    detailFrame.visible = True
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "áÇ íãßäß ÍÐÝ åÐÇ ÇáÞÑÇÑ¡ ÊÃßøÏ ãä ÚÏã æÌæÏ ÃØÈÇÁ ãÓÏÏíä ÈãæÌÈ åÐÇ ÇáÞÑÇÑ.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "ÍÐÝ ãÌãæÚÉ"
    cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    loadDetailsRs rs
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    Dim rsReport As ADODB.Recordset
    sql = "SELECT ts.id,Serial, Description, case when IsSyrian = 1 then 'äÚã' else 'áÇ' end as isSyrian," & vbLf & _
          "case when ShouldChangeDoctorStatus = 1 then 'äÚã' else 'áÇ' end as ShouldChangeDoctorStatus," & vbLf & _
          "Notes ,x.Total as payment " & vbLf & _
          "FROM TasdeedState ts inner join" & vbLf & _
          " (" & vbLf & _
              "SELECT State.Id, SUM(Distrib.Payment) AS Total" & vbLf & _
              "FROM   TasdeedDistribution Distrib RIGHT OUTER JOIN" & vbLf & _
              "TasdeedStateShare StateShare ON Distrib.StateShare = StateShare.Id RIGHT OUTER JOIN" & vbLf & _
              "TasdeedState State ON StateShare.State = State.Id LEFT OUTER JOIN" & vbLf & _
              "TasdeedShare Share ON StateShare.Share = Share.Id AND State.Id = Share.Id" & vbLf & _
              "GROUP BY State.Id" & vbLf & _
              ")x" & vbLf & _
              "on x.id = ts.id" & vbLf & _
              "Where Decision = " & master.rs!id
    Set rsReport = ExecuteSelect(Conn, sql, cancel)
    
    Set DrPaymentsDecision.DataSource = rsReport
    
    Get_DataReport_Label_byName(DrPaymentsDecision, 1, "lblHeader").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrPaymentsDecision, 1, "lblDecisionTitle").Caption = master.rs!Caption
    Get_DataReport_Label_byName(DrPaymentsDecision, 1, "lblDecisionDate").Caption = master.rs!since
    
    DrPaymentsDecision.Show vbModal
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    cmdAddSimilar.Enabled = True
    detailFrame.visible = True
    loadDetailsRs rs
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = "íæÌÏ ÞÑÇÑ ÂÎÑ áå ÇáÊÇÑíÎ ÐÇÊå."
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    cmdAddSimilar.Enabled = False
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub loadDetailsRs(ByRef rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    
    If rs.RecordCount = 0 Then Exit Sub
    
    sql = "SELECT * FROM TasdeedState" & vbCrLf & _
          "WHERE Decision "

    If IsNull(rs!id) Or IsEmpty(rs!id) Then
        sql = sql & "IS NULL"
    Else
        sql = sql & "= " & rs!id
    End If

    Set detail.rs = ExecuteSelect(Conn, sql, cancel)
    On Error Resume Next
    detail.rs.sort = "Serial ASC"
End Sub

Private Function setGridTagValue(ByVal Tag As String, ByVal name As String, ByVal column As Integer, ByVal Value As String) As String
    Dim tagName As String
    tagName = GetTagValue(Tag, name)
    tagName = SetTagValue(tagName, CStr(column), Value, ":", ",")
    setGridTagValue = SetTagValue(Tag, name, tagName)
End Function

Private Sub getStateTotal(ByVal state As Integer)
    Dim c As Boolean
    Dim rsTotal As ADODB.Recordset
    Set rsTotal = ExecuteSelect(Conn, "SELECT Total FROM vStatesTotals WHERE Id = " & state, c)
    If rsTotal.RecordCount > 0 Then
        fg.TextMatrix(fg.Row, TOTAL_) = rsTotal!Total
    Else
        fg.TextMatrix(fg.Row, TOTAL_) = "0"
    End If
    rsTotal.Close
    Set rsTotal = Nothing
End Sub

