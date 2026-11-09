VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form dlgSqlSelect 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   8100
   ClientLeft      =   3015
   ClientTop       =   1725
   ClientWidth     =   6015
   Icon            =   "dlgSqlSelect.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   8100
   ScaleWidth      =   6015
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   350
      Left            =   0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   120
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmdCustomButton 
      BackColor       =   &H00E0E0E0&
      Height          =   375
      Index           =   0
      Left            =   0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   7440
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   3120
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   7440
      Width           =   1515
   End
   Begin VB.CommandButton cmdCancelDialog 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   1440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   7440
      Width           =   1515
   End
   Begin VB.CommandButton cmdPrint 
      Enabled         =   0   'False
      Height          =   350
      Left            =   120
      Picture         =   "dlgSqlSelect.frx":1CFA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   17
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
      Picture         =   "dlgSqlSelect.frx":1E7E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      TabStop         =   0   'False
      ToolTipText     =   "«·√ŒÌ—"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdNext 
      Enabled         =   0   'False
      Height          =   350
      Left            =   960
      Picture         =   "dlgSqlSelect.frx":21C2
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      TabStop         =   0   'False
      ToolTipText     =   "«· «·Ì"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdPrev 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1320
      Picture         =   "dlgSqlSelect.frx":2506
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      ToolTipText     =   "«·”«»ﬁ"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdFirst 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1680
      Picture         =   "dlgSqlSelect.frx":284A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   13
      TabStop         =   0   'False
      ToolTipText     =   "«·√Ê·"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   6375
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Tag             =   ";repeat=true;"
      Top             =   840
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
         TabIndex        =   12
         Top             =   240
         Width           =   5535
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5655
         Left            =   120
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:id,1:name,;check=,0:Integer > 0,0:required,1:required,;"
         Top             =   480
         Width           =   5535
         _cx             =   9763
         _cy             =   9975
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
         Cols            =   0
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"dlgSqlSelect.frx":2B8E
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
         Editable        =   0
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
      Picture         =   "dlgSqlSelect.frx":2BA4
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   11
      TabStop         =   0   'False
      ToolTipText     =   " ‰›Ì– »ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdCancelSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2640
      Picture         =   "dlgSqlSelect.frx":2F66
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡ »ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3360
      Picture         =   "dlgSqlSelect.frx":30EA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "»ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdCancel 
      Height          =   350
      Left            =   4080
      Picture         =   "dlgSqlSelect.frx":366E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   8
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdSave 
      Height          =   350
      Left            =   4440
      Picture         =   "dlgSqlSelect.frx":37F2
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "Õ›Ÿ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdDel 
      Height          =   350
      Left            =   4800
      Picture         =   "dlgSqlSelect.frx":3D76
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   5
      TabStop         =   0   'False
      ToolTipText     =   "Õ–›"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdUpdate 
      Height          =   350
      Left            =   5160
      Picture         =   "dlgSqlSelect.frx":4322
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   " ⁄œÌ·"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdNew 
      Height          =   350
      Left            =   5505
      Picture         =   "dlgSqlSelect.frx":48A6
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   "ÃœÌœ"
      Top             =   120
      Width           =   375
   End
   Begin VB.Menu mnuCommands 
      Caption         =   "ﬁ«∆„… «·√Ê«„—"
      Visible         =   0   'False
      Begin VB.Menu mnuNew 
         Caption         =   "ÃœÌœ"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuSave 
         Caption         =   "Õ›Ÿ"
         Shortcut        =   {F3}
      End
      Begin VB.Menu mnuPrint 
         Caption         =   "ÿ»«⁄… «·≈Ì’«·"
         Shortcut        =   {F4}
      End
      Begin VB.Menu mnuClose 
         Caption         =   "≈€·«ﬁ"
         Shortcut        =   {F5}
      End
   End
End
Attribute VB_Name = "dlgSqlSelect"
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

Public GridTag As String
Public sql As String
Public ColumnsNames As String
Public FrameCaption As String
Public Opener As Form
Public ReadOnlyDialog As Boolean
Public AlwaysPerformOnSelectEvent As Boolean
Public DontReturnOnDblClick As Integer
Private selectCanceled As Boolean
Private originalGridTag As String
Private masterFields As Scripting.Dictionary
Private shouldEdit As Boolean

Public Event OnDeleteError(ByRef theError As ErrObject, ByRef Handled As Boolean)
Public Event OnAddNew(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
'<AHMAD>
Public Event OnUpdate(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnDelete(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doBeforeAddNew(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event OnSerachCompleted(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnDeleteCompleted(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnCmdOkClicked(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event doBeforeUpdate(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)

Public DataChanged As Boolean
Public SaveAfterWhat As Controller_State
'</AHMAD>
Public Event OnSaveValidate(ByRef theGrid As VSFlexGrid, ByRef msg As String, ByRef isNotValid As Boolean)
Public Event DoBeforeSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, SaveAfter As Controller_State)
Public Event OnSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event OnSaveError(ByRef theError As ErrObject, ByVal CurrentState As Controller_State, ByRef msg As String, ByRef Handled As Boolean)
Public Event OnSaveCompleted(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnSaveCanceled(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnSearchBegin(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnSearch(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef Filter As String, ByRef DefaultType As Integer)
Public Event OnSearchCanceled(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnMoveCompleted(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnBeforeEditGrid(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long, ByRef cancel As Boolean)
Public Event OnAfterEditGrid(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
Public Event OnEllipseGrid(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
Public Event OnBeforeGridRowColChange(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long, ByVal NewRow As Long, ByVal NewCol As Long, ByRef cancel As Boolean)
Public Event OnAfterGridRowColChange(ByRef theGrid As VSFlexGrid, ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
Public Event OnCustomeButtonClick(ByVal Index As Integer)
Public Event OnBeforeRemoveHiddenFieldWhenSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnAfterRemoveHiddenFieldWhenSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)

Private Sub cmdCancel_Click()
    master.CancelSave
End Sub

Private Sub cmdCancelDialog_Click()
    Unload Me
End Sub

Private Sub cmdCancelSearch_Click()
    master.CancelSearch
    If Not shouldEdit Then
        fg.Editable = flexEDNone
    End If
End Sub

Private Sub cmdCustomButton_Click(Index As Integer)
    RaiseEvent OnCustomeButtonClick(Index)
End Sub

Private Sub cmdDel_Click()
    master.Delete
End Sub

Private Sub cmdExecSearch_Click()
    master.Search
End Sub

Private Sub cmdNew_Click()
    If Not shouldEdit Then
        fg.Editable = flexEDKbdMouse
    End If
    master.addNew
End Sub

Private Sub cmdOK_Click()
    RaiseEvent OnCmdOkClicked(fg, master.rs)
    selectCanceled = False
    Unload Me
End Sub

Private Sub cmdSave_Click()
    master.Save
End Sub

Private Sub cmdSearch_Click()
    If Not shouldEdit Then
        fg.Editable = flexEDKbdMouse
    End If
    master.BeginSearch
End Sub

Private Sub cmdUpdate_Click()
    If Not shouldEdit Then
        fg.Editable = flexEDKbdMouse
    End If
    master.Update
End Sub

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    RaiseEvent OnAfterEditGrid(fg, Row, Col)
End Sub

Private Sub fg_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    RaiseEvent OnAfterGridRowColChange(fg, OldRow, OldCol, NewRow, NewCol)
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    RaiseEvent OnBeforeEditGrid(fg, Row, Col, cancel)
End Sub

Private Sub fg_BeforeRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long, cancel As Boolean)
    RaiseEvent OnBeforeGridRowColChange(fg, OldRow, OldCol, NewRow, NewCol, cancel)
End Sub

Private Sub fg_CellButtonClick(ByVal Row As Long, ByVal Col As Long)
    RaiseEvent OnEllipseGrid(fg, Row, Col)
End Sub

Private Sub fg_DblClick()
    If shouldEdit Then
        fg.EditCell
    Else
        selectCanceled = False
        Unload Me
    End If
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    RefreshCommands btnSettings And FormSettings, Me
    If master.rs Is Nothing Then
        Exit Sub
    Else
        fg.SetFocus
    End If
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings(Me)
End Sub

Private Sub Form_Load()
    oldScaleWidth = Me.Width
    FormSettings = btall
    If ReadOnlyDialog Then
        btnSettings = 0
    Else
        btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    End If
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set master.ButtonsForm = Me
    Caption = FrameCaption
    masterFrame.Caption = FrameCaption
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    If master.rs Is Nothing Then
        MsgBox "·« ÌÊÃœ »Ì«‰«  ›Ì Â–Â «·Ê«ÃÂ…"
        Exit Sub
    End If
'    If Not (master.rs.EOF Or master.rs.EOF) Then
'        master.rs.MoveFirst
'    End If
    fg.Tag = GridTag
    originalGridTag = GridTag
    selectCanceled = True
    shouldEdit = (DontReturnOnDblClick = 1)
    If shouldEdit Then
        fg.Editable = flexEDKbdMouse
    End If
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    '<AHMAD>
        DataChanged = False
    '</AHMAD>
End Sub

Private Sub InitFrame()
    
    Dim columns() As String
    columns = Split(ColumnsNames, ",")
    
    Dim datafields As String
    datafields = GetTagValue(fg.Tag, "datafield")
    
    Dim hiddenFields As String
    hiddenFields = GetTagValue(fg.Tag, "HiddenColumns")
    
    Dim masterValues As String
    masterValues = GetTagValue(fg.Tag, "MasterValues")
    Set masterFields = New Scripting.Dictionary
    
    Dim cnt As Integer
    Dim Col As Integer
    For cnt = 0 To master.rs.Fields.count - 1
        Dim val As String
        val = GetTagValue(datafields, CStr(cnt), ":", ",")
        If Trim(val) <> "" Then
            Col = fg.Cols
            fg.Cols = fg.Cols + 1
            fg.TextMatrix(0, Col) = columns(Col)
            fg.ColAlignment(Col) = flexAlignRightCenter
            fg.FixedAlignment(Col) = flexAlignRightCenter
            fg.ColHidden(Col) = isColumnHidden(hiddenFields, cnt)
            If fg.ColHidden(Col) Then
                fg.ColWidth(Col) = 0
            End If
            val = GetTagValue(masterValues, CStr(cnt), ":", ",")
            If Trim(val) <> "" Then
                masterFields.Add master.rs.Fields(cnt).name, val
            End If
        End If
    Next
End Sub

Private Function isColumnHidden(tagValue As String, ByVal Col As Integer) As Boolean
    Dim val As String
    val = GetTagValue(tagValue, CStr(Col), ":", ",")
    If val = "true" Then
        isColumnHidden = True
    Else
        isColumnHidden = False
    End If
End Function

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
    If Not cmdOK.Enabled Then
        MsgBox "ÌÃ» Õ›Ÿ «· ⁄œÌ·«  √Ê ≈·€«ƒÂ« ⁄·Ï «·”Ã· «·Õ«·Ì ﬁ»· «·Œ—ÊÃ.", vbCritical
        cancel = True
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
        If Not TypeOf ctrl Is Menu Then
            ctrl.Left = ctrl.Left * Alpha
            ctrl.Width = ctrl.Width * Alpha
        End If
    Next
    oldScaleWidth = ScaleWidth
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    If master.rs Is Nothing Then
        Set controllers = Nothing
        Set master = Nothing
        Exit Sub
    End If
    If AlwaysPerformOnSelectEvent Or Not selectCanceled Then
        If master.rs.RecordCount > 0 Then
            master.MoveRSToSelectedRow fg, master.rs, (master.state = ST_SEARCH)
        End If
        Opener.OnSqlSelected Me
    End If
    Set controllers = Nothing
    Set master = Nothing
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    cmdOK.Enabled = False
    cmdCancelDialog.Enabled = False
    enableCustomeButtons False
    RaiseEvent OnAddNew(fg, rs)
    SaveAfterWhat = ST_ADDNEW
    fg.SetFocus
End Sub

Private Sub master_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    RaiseEvent doBeforeAddNew(fg, rs, cancel)
End Sub

Private Sub master_doBeforeUpdate(rs As ADODB.Recordset, cancel As Boolean)
    RaiseEvent doBeforeUpdate(fg, master.rs, cancel)
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    RaiseEvent OnSearchBegin(fg, rs)
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    If Not shouldEdit Then
        fg.Editable = flexEDNone
    End If
    fg.Tag = originalGridTag
    cmdOK.Enabled = True
    cmdCancelDialog.Enabled = True
    enableCustomeButtons True
    RaiseEvent OnSaveCanceled(fg, rs)
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    RaiseEvent OnSearchCanceled(fg, rs)
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    RaiseEvent OnDelete(fg, rs, cancel)
End Sub


Private Sub master_doDeleteCompleted(rs As ADODB.Recordset)
    RaiseEvent OnDeleteCompleted(fg, rs)
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    RaiseEvent OnDeleteError(ErrorObeject, cancel)
    If cancel Then Exit Sub
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    fg.Row = rs.AbsolutePosition
    RaiseEvent OnMoveCompleted(fg, rs)
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    RaiseEvent OnBeforeRemoveHiddenFieldWhenSave(fg, rs)
    removeHiddenFieldsFromDataFieldsInGridTag fg
    RaiseEvent OnAfterRemoveHiddenFieldWhenSave(fg, rs)
    Dim Key
    For Each Key In masterFields
        rs.Fields(Key) = masterFields(Key)
    Next
    RaiseEvent OnSave(fg, rs, cancel)
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    If Not shouldEdit Then
        fg.Editable = flexEDNone
    End If
    fg.Tag = originalGridTag
    cmdOK.Enabled = True
    cmdCancelDialog.Enabled = True
    enableCustomeButtons True
    Dim sort As String
    Dim df As String
    df = GetTagValue(fg.Tag, "datafield")
    sort = GetTagValue(fg.Tag, "sort")
    Dim sortDir As String
    Dim c As Integer
    For c = 0 To fg.Cols - 1
        sortDir = GetTagValue(sort, CStr(c), ":", ",")
        fg.Col = c
        If sortDir = "asc" Then
            fg.sort = flexSortGenericAscending
        ElseIf sortDir = "desc" Then
            fg.sort = flexSortGenericDescending
        End If
    Next
    RaiseEvent OnSaveCompleted(fg, rs)
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    Dim Handled As Boolean
    Handled = False
    RaiseEvent OnSaveError(ErrorObeject, state, msg, Handled)
    If Handled Then Exit Sub
    msg = "«·—Ã«¡ «· √ﬂœ „‰ ’·«ÕÌ… «·„⁄·Ê„«  «·„œŒ·…."
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    RaiseEvent OnSearch(fg, rs, S, DefaultType)
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    RaiseEvent OnSerachCompleted(fg, rs)
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    cmdOK.Enabled = False
    cmdCancelDialog.Enabled = False
    enableCustomeButtons False
    RaiseEvent OnUpdate(fg, rs)
    SaveAfterWhat = ST_UPDATE
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    RaiseEvent OnSaveValidate(ctrl, msg, checkType)
End Sub

Private Sub masterFrame_Click()
'    SelectFrame Me, masterFrame
'    Set ActiveFrame = masterFrame
End Sub

Private Sub removeHiddenFieldsFromDataFieldsInGridTag(ByRef fg As VSFlexGrid)
    Dim hiddenFields As String
    hiddenFields = GetTagValue(fg.Tag, "HiddenColumns")
    
    ' build the new dataFields
    Dim datafields As String
    datafields = GetTagValue(fg.Tag, "datafield")
    Dim i As Integer
    For i = 0 To fg.Cols - 1
        If isColumnHidden(hiddenFields, i) Then
            datafields = RemoveTag(datafields, CStr(i), ":", ",")
        End If
    Next
    fg.Tag = SetTagValue(fg.Tag, "datafield", datafields)
End Sub

Private Sub enableCustomeButtons(ByVal enable As Boolean)
    Dim icc As Integer
    For icc = 0 To cmdCustomButton.count - 1
        cmdCustomButton(icc).Enabled = enable
    Next
End Sub

Private Sub mnuClose_Click()
    If cmdOK.Enabled Then cmdOK_Click
End Sub

Private Sub mnuNew_Click()
    If cmdNew.Enabled Then cmdNew_Click
End Sub

Private Sub mnuPrint_Click()
    If cmdCustomButton(0).Enabled Then cmdCustomButton_Click 0
End Sub

Private Sub mnuSave_Click()
    If cmdSave.Enabled Then cmdSave_Click
End Sub
