VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmTasdeedDecisionsView 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ÇáÑÓæã ÇáÓäæíÉ"
   ClientHeight    =   7305
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9150
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   7305
   ScaleWidth      =   9150
   Tag             =   ";typeof=vsflexgrid;datafield=,0:devision_name,;check=,0:required,;"
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ÇáÑÓæã ÇáÓäæíÉ"
      Height          =   7215
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
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
         Height          =   6495
         Left            =   120
         TabIndex        =   2
         Tag             =   $"frmTasdeedDesisionsView.frx":0000
         Top             =   480
         Width           =   8775
         _cx             =   15478
         _cy             =   11456
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
         FormatString    =   $"frmTasdeedDesisionsView.frx":00AF
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
End
Attribute VB_Name = "frmTasdeedDecisionsView"
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
Public DecisionNo As Long


Private Sub detail_doAddNew(rs As ADODB.Recordset)
    Dim serial As Integer
    serial = 1
    Dim rsMax As ADODB.Recordset
    Dim c As Boolean
    Set rsMax = ExecuteSelect(Conn, "SELECT Max(Serial) FROM TasdeedState WHERE Decision = " & DecisionNo, c)
    rsMax.MoveFirst
    If Not IsNull(rsMax.Fields(0)) Then
        serial = rsMax.Fields(0).Value + 1
    End If
    fg.TextMatrix(fg.Row, SERIAL_) = serial
    fg.ColComboList(TOTAL_) = ""
End Sub

Private Sub detail_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
    fg.ColComboList(TOTAL_) = "..."
    fg.Tag = setGridTagValue(fg.Tag, "datafield", ID_, "Id")
End Sub

Private Sub detail_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, Cancel As Boolean)
    MsgBox "áÇ íãßäß ÍÐÝ åÐå ÇáÍÇáÉ¡ ÊÃßøÏ ãä ÚÏã æÌæÏ ÃØÈÇÁ ãÓÏÏíä æÝÞÇð áåÐå ÇáÍÇáÉ.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "ÍÐÝ ãÌãæÚÉ"
    Cancel = True
End Sub

Private Sub detail_doMoveComplete(rs As ADODB.Recordset)
    getStateTotal rs!id
End Sub


'Private Sub fg_CellButtonClick(ByVal Row As Long, ByVal Col As Long)
'    If Col = TOTAL_ Then
'        dlgTasdeedShares.ShareState = fg.Cell(flexcpText, Row, ID_)
'        dlgTasdeedShares.Show 1
'        getStateTotal fg.Cell(flexcpText, Row, ID_)
'    End If
'End Sub
'
Private Sub Form_Activate()
    ActiveDatabaseName = "fari"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = detailFrame Then
        RefreshCommands btnDetailSettings And FormDetailSettings
'    Else
'        RefreshCommands btnSettings And FormSettings
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = detailFrame Then
        btnDetailSettings = GetBtnSettings
'    Else
'        btnSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9270

'    FormSettings = btAll - btPrint
'    btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btPrev - btFirst - btNext - btLast - btPrint - btnew - btUpdate - btdelete - btsave - btCancel
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec

    FormatForm Me

    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    controllers.Add detail, detailFrame.name

    InitFrame


    Set ActiveFrame = detailFrame
End Sub

Private Sub InitFrame()
    ' Initialization
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

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    Set detail = Nothing
    RefreshCommands 0
End Sub

Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    'btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands btnDetailSettings And FormDetailSettings
End Sub


Private Sub loadDetailsRs(ByRef rs As ADODB.Recordset)
    Dim sql As String
    Dim Cancel As Boolean
    
    If rs.RecordCount = 0 Then Exit Sub
    
    sql = "SELECT * FROM TasdeedState" & vbCrLf & _
          "WHERE Decision "

    If IsNull(rs!id) Or IsEmpty(rs!id) Then
        sql = sql & "IS NULL"
    Else
        sql = sql & "= " & rs!id
    End If

    Set detail.rs = ExecuteSelect(Conn, sql, Cancel)
    If detail.rs.EOF Then Exit Sub
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

