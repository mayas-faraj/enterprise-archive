VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmSqlSelect 
   BackColor       =   &H00E1FEFF&
   ClientHeight    =   6480
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   5940
   Icon            =   "frmSqlSelect.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6480
   ScaleWidth      =   5940
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   6375
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
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
         TabIndex        =   1
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
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   0
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
         FormatString    =   $"frmSqlSelect.frx":1CFA
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
Attribute VB_Name = "frmSqlSelect"
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
Private originalGridTag As String
Private masterFields As Scripting.Dictionary
Private currentDatabaseName As String

Public Event OnDeleteError(ByRef theError As ErrObject, ByRef Handled As Boolean)
Public Event OnSaveError(ByRef theError As ErrObject, ByVal CurrentState As Controller_State, ByRef msg As String, ByRef Handled As Boolean)
Public Event OnSaveValidate(ByRef theGrid As VSFlexGrid, ByRef msg As String, ByRef isNotValid As Boolean)
Public Event OnSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef Cancel As Boolean)
Public Event OnSaveCompleted(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnAfterInitFrame()
Public Event OnActivateForm()
Public Event OnGridChangeEdit(ByRef theGrid As VSFlexGrid)
Public Event OnGridValidateEdit(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
Public Event OnAddNew(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnSaveCanceled(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnSearchBegin(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnSearch(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset, ByRef Filter As String, ByRef DefaultType As Integer)
Public Event OnSearchCanceled(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnMoveCompleted(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnBeforeEditGrid(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long, ByRef Cancel As Boolean)
Public Event OnAfterEditGrid(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
Public Event OnEllipseGrid(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
Public Event OnBeforeGridRowColChange(ByRef theGrid As VSFlexGrid, ByVal Row As Long, ByVal Col As Long, ByVal NewRow As Long, ByVal NewCol As Long, ByRef Cancel As Boolean)
Public Event OnAfterGridRowColChange(ByRef theGrid As VSFlexGrid, ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
Public Event OnCustomeButtonClick(ByVal Index As Integer)
Public Event OnBeforeRemoveHiddenFieldWhenSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)
Public Event OnAfterRemoveHiddenFieldWhenSave(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)

Public Event OnGridKeyDown(ByRef theGrid As VSFlexGrid, KeyCode As Integer, Shift As Integer)
Public Event OnPrint(ByRef theGrid As VSFlexGrid, ByRef rs As ADODB.Recordset)

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    RaiseEvent OnAfterEditGrid(fg, Row, Col)
End Sub

Private Sub fg_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    RaiseEvent OnAfterGridRowColChange(fg, OldRow, OldCol, NewRow, NewCol)
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
    RaiseEvent OnBeforeEditGrid(fg, Row, Col, Cancel)
End Sub

Private Sub fg_BeforeRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long, Cancel As Boolean)
    RaiseEvent OnBeforeGridRowColChange(fg, OldRow, OldCol, NewRow, NewCol, Cancel)
End Sub

Private Sub fg_CellButtonClick(ByVal Row As Long, ByVal Col As Long)
    RaiseEvent OnEllipseGrid(fg, Row, Col)
End Sub

Private Sub fg_ChangeEdit()
    RaiseEvent OnGridChangeEdit(fg)
End Sub

Private Sub fg_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent OnGridKeyDown(fg, KeyCode, Shift)
End Sub

Private Sub fg_ValidateEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
    RaiseEvent OnGridValidateEdit(fg, Row, Col, Cancel)
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = currentDatabaseName
    SelectFrame Me, ActiveFrame
    RefreshCommands btnSettings And FormSettings, MDIMain
    RaiseEvent OnActivateForm
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 6060
    FormSettings = btall - btFirst - btLast - btNext - btPrev - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set master.ButtonsForm = MDIMain
    Me.Caption = FrameCaption
    masterFrame.Caption = FrameCaption
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, sql, Cancel)
    fg.Tag = GridTag
    originalGridTag = GridTag

    currentDatabaseName = ActiveDatabaseName
    InitFrame

    If master.rs.EOF Or master.rs.BOF Then
        master.rs.Requery
    Else
        master.rs.Move 0
    End If

    Set ActiveFrame = masterFrame
End Sub

Private Sub InitFrame()
    ' Lookups & Initialize stuff
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
    RaiseEvent OnAfterInitFrame
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
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    RaiseEvent OnAddNew(fg, rs)
    fg.SetFocus
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    RaiseEvent OnSearchBegin(fg, rs)
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
    fg.Tag = originalGridTag
    RaiseEvent OnSaveCanceled(fg, rs)
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    RaiseEvent OnSearchCanceled(fg, rs)
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, Cancel As Boolean)
    RaiseEvent OnDeleteError(ErrorObeject, Cancel)
    If Cancel Then Exit Sub
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    Cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    fg.Row = rs.AbsolutePosition
    RaiseEvent OnMoveCompleted(fg, rs)
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    RaiseEvent OnPrint(fg, rs)
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, Cancel As Boolean)
    RaiseEvent OnBeforeRemoveHiddenFieldWhenSave(fg, rs)
    removeHiddenFieldsFromDataFieldsInGridTag fg
    RaiseEvent OnAfterRemoveHiddenFieldWhenSave(fg, rs)
    Dim Key
    For Each Key In masterFields
        rs.Fields(Key) = masterFields(Key)
    Next
    RaiseEvent OnSave(fg, rs, Cancel)
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    fg.Tag = originalGridTag
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

