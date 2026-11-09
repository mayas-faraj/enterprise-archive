VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmZones 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·„‰«ÿﬁ Ê«·‘⁄»"
   ClientHeight    =   7305
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9150
   Icon            =   "frmZones.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7305
   ScaleWidth      =   9150
   Tag             =   ";typeof=vsflexgrid;datafield=,0:devision_name,;check=,0:required,;"
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„‰«ÿﬁ"
      Height          =   5775
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   1425
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
         Height          =   5175
         Left            =   120
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:devision_id,1:devision_name,2:devision_head,;check=,1:required,;"
         Top             =   480
         Width           =   8775
         _cx             =   15478
         _cy             =   9128
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
         Cols            =   3
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmZones.frx":1CFA
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
      Caption         =   "«·‘⁄»"
      Height          =   1455
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   0
      Width           =   9015
      Begin VB.TextBox txtZoneId 
         Alignment       =   1  'Right Justify
         DataField       =   "Zone_Id"
         Enabled         =   0   'False
         Height          =   375
         Left            =   5880
         MaxLength       =   200
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   1995
      End
      Begin VB.TextBox TMName 
         Alignment       =   1  'Right Justify
         DataField       =   "Zone_Name"
         Height          =   375
         Left            =   5880
         MaxLength       =   200
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;check=required;"
         Top             =   960
         Width           =   1995
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
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·‘⁄»…"
         Height          =   195
         Index           =   1
         Left            =   8085
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   570
         Width           =   735
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·‘⁄»…"
         Height          =   195
         Index           =   0
         Left            =   8070
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1050
         Width           =   750
      End
   End
End
Attribute VB_Name = "frmZones"
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

Private Sub detail_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
    Dim datafield As String
    datafield = GetTagValue(fg.Tag, "datafield")
    datafield = SetTagValue(datafield, "0", "devision_id", ":", ",")
    fg.Tag = SetTagValue(fg.Tag, "datafield", datafield)
End Sub

Private Sub detail_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, Cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·„‰ÿﬁ…°  √ﬂ¯œ „‰ ⁄œ„ ÊÃÊœ √ÿ»«¡ ›Ì Â–Â «·„‰ÿﬁ….", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› „Ã„Ê⁄…"
    Cancel = True
End Sub

Private Sub detail_doSave(rs As ADODB.Recordset, Cancel As Boolean)
    rs!Zone_id = master.rs!Zone_id
    Dim datafield As String
    datafield = GetTagValue(fg.Tag, "datafield")
    datafield = SetTagValue(datafield, "0", "", ":", ",")
    fg.Tag = SetTagValue(fg.Tag, "datafield", datafield)
End Sub

Private Sub detail_doSaveComplete(rs As ADODB.Recordset)
    Dim datafield As String
    datafield = GetTagValue(fg.Tag, "datafield")
    datafield = SetTagValue(datafield, "0", "devision_id", ":", ",")
    fg.Tag = SetTagValue(fg.Tag, "datafield", datafield)
    fg.TextMatrix(fg.Row, 0) = rs!devision_id
End Sub

Private Sub detail_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = " ÊÃœ ‘⁄»… √Œ—Ï ·Â« «·«”„ –« Â."
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
    Cancel = Col = 0
End Sub

Private Sub fg_ChangeEdit()
    If Len(fg.editText) > 200 Then
        fg.editText = Left(fg.editText, 200)
    End If
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Default"
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

    FormSettings = btall - btPrint
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

    Dim Cancel As Boolean
    Dim sql As String
    Set master.rs = ExecuteSelect(Conn, "SELECT * FROM FixZone", Cancel)
    master.rs.sort = "Zone_ID ASC, Zone_Name ASC"

    Set ActiveFrame = masterFrame
End Sub

Private Sub InitFrame()
    ' Initialization
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
    If master.rs.RecordCount = 0 Or master.State = ST_ADDNEW Or master.State = ST_UPDATE Then
        MsgBox "·« Ì„ﬂ‰ﬂ «·«‰ ﬁ«· ≈·Ï «·Ã“¡ «·Œ«’ »«·„‰«ÿﬁ „«·„  ﬂ‰ ·œÌﬂ ‘⁄» „⁄—›… ° √Ê ≈–« ﬂ‰  ›Ì Ê÷⁄ ≈÷«›… √Ê  ⁄œÌ· „⁄·Ê„«  ‘⁄»… „«", vbOKCancel + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands btnDetailSettings And FormDetailSettings
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, Cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·‘⁄»…°  √ﬂ¯œ „‰ ⁄œ„ ÊÃÊœ „‰«ÿﬁ „⁄—›… ·Â–Â «·‘⁄»….", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› „Ã„Ê⁄…"
    Cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    loadDetailsRs rs
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    txtZoneId.text = rs!Zone_id
    loadDetailsRs rs
End Sub

Private Sub master_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = " ÊÃœ „‰ÿﬁ… √Œ—Ï ·Â« «·«”„ –« Â."
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
    Dim Cancel As Boolean
    
    If rs.RecordCount = 0 Then Exit Sub
    
    sql = "SELECT * FROM FixDevision " & vbCrLf & _
          "WHERE Zone_Id "

    If IsNull(rs!Zone_id) Or IsEmpty(rs!Zone_id) Then
        sql = sql & "IS NULL"
    Else
        sql = sql & "= " & rs!Zone_id
    End If

    Set detail.rs = ExecuteSelect(Conn, sql, Cancel)
    If detail.rs.EOF Then Exit Sub
    detail.rs.sort = "Devision_ID ASC, Devision_Name ASC"
End Sub

