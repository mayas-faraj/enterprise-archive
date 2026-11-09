VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmStockCatalog 
   BackColor       =   &H00E1FEFF&
   Caption         =   "„Ã„Ê⁄«  «·„” Êœ⁄"
   ClientHeight    =   6690
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11400
   Icon            =   "frmStockCatalog.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6690
   ScaleWidth      =   11400
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„Ê«œ"
      Height          =   6495
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   5535
      Begin VB.CheckBox chkdetailFrame 
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
         Width           =   5295
      End
      Begin VSFlex7Ctl.VSFlexGrid fgd 
         Height          =   5895
         Left            =   120
         TabIndex        =   5
         Tag             =   ";typeof=vsflexgrid;datafield=,0:id,1:Code,2:Name,3:Unit,;"
         Top             =   480
         Width           =   5295
         _cx             =   9340
         _cy             =   10398
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
         Cols            =   8
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmStockCatalog.frx":1CFA
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   -1  'True
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
         FrozenCols      =   2
         AllowUserFreezing=   0
         BackColorFrozen =   0
         ForeColorFrozen =   0
         WallPaperAlignment=   9
      End
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„Ã„Ê⁄«  «·„” Êœ⁄"
      Height          =   6495
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   6960
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5895
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   6720
         _cx             =   11853
         _cy             =   10398
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
         TreeColor       =   8388608
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   3
         SelectionMode   =   0
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
         FormatString    =   $"frmStockCatalog.frx":1DF7
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
         Width           =   6675
      End
   End
End
Attribute VB_Name = "frmStockCatalog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public controllers As New Collection
Dim WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Dim WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Double

Dim UpdateGrid As Boolean
Const NUM_ = 0
Const NAME_ = 1
Const NOTE_ = 2
Const ID_ = 3
Const LEVEL_ = 4
Const PARENT_ = 5
Const POSITION_ = 6

Const O_CODE_ = 0
Const O_NAME_ = 1
Const O_LATIN_ = 2
Const O_DESC_ = 3
Const O_UNIT_ = 4
Const O_SELL_ = 5
Const O_MIN_ = 6
Const O_MAX_ = 7

Const SELECT_GROUP = "select Id, Code as Name, Name as Num, Parent, Notes as note from Stock_Group"

Dim level As Integer
Dim NewRow As Integer
Dim rowToBeDeleted As Long
Dim disableOnRowChanged As Boolean
Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

Private Sub details_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    
    Dim rsUnits As ADODB.Recordset
    
    Set rsUnits = ExecuteSelect(Conn, "Select ID,Name from Stock_Unit", cancel)
    
    If rsUnits.RecordCount = 0 Then
        MsgBox "·« ÌÊÃœ Ê«Õœ«  „Ê«œ „⁄—›… ÷„‰ «·»—‰«„Ã ° ”Ì „ › Õ Ê«ÃÂ… «·Ê«Õœ«  · ⁄—Ì› Ê«Õœ«  ··„Ê«œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Dim dlgStockUnit As New dlgSqlSelect
        With dlgStockUnit
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .Sql = "SELECT Name FROM Stock_Unit ORDER BY 1"
            Set .Opener = Me
            .ColumnsNames = "«”„ «·Ê«Õœ…"
            .FrameCaption = "«·Ê«Õœ« "
            .Show 1
        End With
        rsUnits.Requery
        fgd.ColComboList(4) = fgd.BuildComboList(rsUnits, "Name", "ID")
        cancel = True
    End If
End Sub
Public Sub onSqlSelected(ByRef dialogForm As dlgSqlSelect)

End Sub

Private Sub details_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·„«œ…° ⁄·Ìﬂ Õ–› ›Ê« Ì— √Ê· «·„œ… Ê«·»Ì⁄ Ê«·‘—«¡ «· Ì Ê—œ  ›ÌÂ« Â–Â «·„«œ… √Ê·«", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› „«œ…"
    cancel = True
End Sub

Private Sub details_doSave(rs As ADODB.Recordset, cancel As Boolean)
    details.rs!group = fg.TextMatrix(fg.Row, ID_)
End Sub

Private Sub details_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    msg = " Õﬁﬁ „‰ ⁄œ„ ÊÃÊœ „«œ… √Œ—Ï ·Â« «·—„“ √Ê «·«”„ –« Â."
    KeepState = True
End Sub

Private Sub details_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim i As Integer
    Dim c As String
    If ctrl.Col = 2 Then
        i = 1
        msg = "ÌÃ» ≈œŒ«· √Õ—› ·« Ì‰Ì… ›ﬁÿ ›Ì Â–« «·Õﬁ·."
        While i <= Len(Trim(ctrl.text))
            c = Mid(ctrl, i, 1)
            checkType = (c = " ")
            checkType = checkType Or (c >= "a" And c <= "z")
            checkType = checkType Or (c >= "A" And c <= "Z")
            checkType = checkType Or (c >= "0" And c <= "9")
            checkType = Not checkType
            If checkType Then Exit Sub
            i = i + 1
        Wend
        Exit Sub
    End If
    If ctrl.Col = 7 Then
        Dim min, max As String
        Dim minVal, maxVal As Double
        max = Trim(ctrl.TextMatrix(ctrl.Row, O_MAX_))
        min = Trim(ctrl.TextMatrix(ctrl.Row, O_MIN_))
        
        If Not IsNumeric(max) Or Not IsNumeric(min) Then
            msg = "ÌÃ» ≈œŒ«· ﬁÌ„ —ﬁ„Ì… ›Ì Õﬁ·Ì «·Õœ «·√œ‰Ï Ê «·Õœ «·√⁄·Ï"
            checkType = True
        End If
        
        If max = "" Then Exit Sub
        maxVal = val(max)
        If Trim(min) = "" Then Exit Sub
        minVal = val(min)
        msg = "ÌÃ» √‰ ÌﬂÊ‰ «·Õœ «·√⁄·Ï √ﬂ»— „‰ «·Õœ «·√œ‰Ï"
        checkType = maxVal < minVal
    End If
    
End Sub

Private Sub fg_AfterCollapse(ByVal Row As Long, ByVal State As Integer)
    fg.Row = Row
End Sub

Private Sub fg_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    If OldRow = NewRow Then Exit Sub
    If disableOnRowChanged Then Exit Sub
    MousePointer = vbHourglass
    If NewRow > 1 Then
        btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
        btnDetailSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
        PopulateGroupObjects NewRow
    Else
        btnSettings = btNew
        btnDetailSettings = 0
        fgd.Rows = 1
    End If
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
    MousePointer = vbDefault
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = (Row < 2)
End Sub

Private Sub fg_ChangeEdit()
    If fg.Row < 2 Or fg.Col <> NAME_ Then Exit Sub
    fg.editText = Left(fg.editText, 10)
End Sub

Private Sub fg_LostFocus()
    If fg.Row < 2 Then Exit Sub
    If (master.State And (ST_ADDNEW Or ST_UPDATE)) <> 0 Then Exit Sub
    MoveRSToSelectedRow fg, master.rs
    fg.TextMatrix(fg.Row, NAME_) = master.rs!name
    fg.TextMatrix(fg.Row, NUM_) = master.rs!Num
    If IsNull(master.rs!Note) Then
        fg.TextMatrix(fg.Row, NOTE_) = ""
    Else
        fg.TextMatrix(fg.Row, NOTE_) = master.rs!Note
    End If
End Sub


Private Sub fgd_BeforeScrollTip(ByVal Row As Long)
    fgd.ToolTipText = "«·„«œ…: " & fgd.TextMatrix(Row, O_NAME_)
End Sub

Private Sub fgd_ChangeEdit()
    If fgd.Row < 1 Or fgd.Col <> O_CODE_ Then Exit Sub
    fgd.editText = Left(fgd.editText, 10)
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Stock"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
    If (master.State And (ST_UPDATE Or ST_ADDNEW)) <> 0 Then
        Dim op As String
        op = "'ÃœÌœ'"
        If (master.State And ST_UPDATE) <> 0 Then op = "' ⁄œÌ·'"
        MsgBox "»”»» «— »«ÿ «·œ·Ì· »⁄œ… »ÿ«ﬁ«  √Œ—Ï° ·–·ﬂ ”Ì „ ≈·€«¡ ⁄„·Ì… " & op & " «·Õ«·Ì…° Ê” „  ÕœÌÀ „Õ ÊÏ «·œ·Ì·.", vbOKOnly Or vbInformation Or vbMsgBoxRight Or vbMsgBoxRtlReading, " ‰»ÌÂ"
        master.CancelSave
    End If
    disableOnRowChanged = False
    master.rs.Requery
    BuildTree fg.Row
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    Else
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 12930
    FormSettings = btAll - btSearch - btFirst - btLast - btPrev - btNext - btPrint
    btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    FormDetailSettings = btAll - btFirst - btLast - btPrev - btNext - btPrint
    btnDetailSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    master.TraceChanges = True
    Set master.Form = Me
    Set master.frame = masterFrame
    Set details = New Controller
    Set details.Form = Me
    Set details.frame = detailFrame
    controllers.Add master, masterFrame.name
    controllers.Add details, detailFrame.name
    
    disableOnRowChanged = True
    InitFrame
    
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, SELECT_GROUP, cancel)
    
    Set ActiveFrame = masterFrame
    With fg
    
        .Rows = 1
        .FixedCols = 0
        .ColAlignment(-1) = flexAlignRightTop
        .Editable = flexEDKbdMouse
                
        .OutlineCol = 0
        .OutlineBar = flexOutlineBarSimpleLeaf
        
        .AllowSelection = False
    End With
    
    
    BuildTree 1

End Sub

Private Sub InitFrame()
    ' Initilize
    
    fgd.Tag = ";typeof=vsflexgrid;"
    fgd.Tag = fgd.Tag & "datafield=,0:code,1:name,2:latin_name,3:description,"
    fgd.Tag = fgd.Tag & "4:unit,5:sell_price,6:min_qty,7:max_qty,;"
    fgd.Tag = fgd.Tag & "check=,0:required,1:required,4:required,;"
    fgd.Tag = fgd.Tag & "check=,2:custom,5:real>0,6:real>0,7:real>0,7:custom,;"
    fgd.Tag = fgd.Tag & "lookup=,4:Name,;parentFields=,4:ID,;parentTables=,4:Stock_Unit,;"
    
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
    ' ResizeGrid fgd
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    Set details = Nothing
    Set master = Nothing
    RefreshCommands 0
End Sub

Private Function GetChildPosition(Row As Long) As Long
    
    On Error Resume Next
    level = CInt(fg.Cell(flexcpText, fg.Row, LEVEL_))
    If Err.Number <> 0 Then
        level = 2
    End If
    
    Dim R As Long
    R = Row + 1
    Do While R < fg.Rows
        If CInt(fg.Cell(flexcpText, R, LEVEL_)) <= level Then
            GetChildPosition = R
            Exit Function
        End If
        R = R + 1
    Loop
    GetChildPosition = R
    
End Function

Private Sub master_doAddNew(rs As ADODB.Recordset)
    Dim Row As Long
    Dim State As Integer
    UpdateGrid = False
    If fg.Row = 0 Then
        State = master.State
        master.State = master.State - ST_ADDNEW
        disableOnRowChanged = True
        fg.Row = 1
        disableOnRowChanged = False
        master.State = State
    End If

    Row = GetChildPosition(fg.Row)
    fg.AddItem "", Row
    fg.IsSubtotal(Row) = True
    fg.RowOutlineLevel(Row) = CInt(fg.Cell(flexcpText, fg.Row, LEVEL_)) + 1

    NewRow = Row

    Dim parent As String
    parent = fg.Cell(flexcpText, fg.Row, ID_)
    If parent <> "" Then
        rs!parent = CInt(parent)
    End If
    State = master.State
    master.State = 0
    disableOnRowChanged = True
    fg.Row = Row
    fg.TopRow = Row
    disableOnRowChanged = False
    master.State = State
    masterFrame.Tag = ";repeat=true;"
    fg.Tag = ";typeof=vsflexgrid;"
End Sub

Private Sub master_DoBeforeDelete(rs As ADODB.Recordset, cancel As Boolean)
    masterFrame.Tag = ";repeat=true;"
    fg.Tag = ";typeof=vsflexgrid;"
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    If Not UpdateGrid Then
        fg.RemoveItem fg.Row
    End If
    UpdateGrid = False
    masterFrame.Tag = ""
    fg.Tag = ""
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    rowToBeDeleted = fg.Row
    MoveRSToSelectedRow fg, master.rs
End Sub

Private Sub master_doDeleteCompleted(rs As ADODB.Recordset)
    masterFrame.Tag = ""
    fg.Tag = ""
    BuildTree rowToBeDeleted
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    cancel = True
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·„Ã„Ê⁄…° ⁄·Ìﬂ Õ–› „«  ÕÊÌÂ „‰ „Ã„Ê⁄«  Ê„‰ „Ê«œ √Ê·«.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› „Ã„Ê⁄…"
    masterFrame.Tag = ""
    fg.Tag = ""
    BuildTree rowToBeDeleted
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    masterFrame.Tag = ";repeat=true;"
    fg.Tag = ";typeof=vsflexgrid;check=," & NUM_ & ":required," & NAME_ & ":required,;"
    If Not master.validate Then
        masterFrame.Tag = ""
        fg.Tag = ""
        cancel = True
        RefreshCommands FormSettings And btMaskUpdate
        Exit Sub
    End If
   
    MoveRSToSelectedRow fg, master.rs
    
    rs!name = fg.Cell(flexcpText, fg.Row, NAME_)
    rs!Num = fg.Cell(flexcpText, fg.Row, NUM_)
    rs!Note = fg.Cell(flexcpText, fg.Row, NOTE_)
    
'    masterFrame.tag = ""
'    fg.tag = ""
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    
    If Not UpdateGrid Then
         fg.TextMatrix(NewRow, LEVEL_) = level + 1
         fg.TextMatrix(NewRow, ID_) = rs!id
         fg.TextMatrix(NewRow, POSITION_) = rs.AbsolutePosition
         If Not IsNull(rs!parent) Then fg.TextMatrix(NewRow, PARENT_) = rs!parent
    End If
    UpdateGrid = False

    masterFrame.Tag = ""
    fg.Tag = ""
End Sub

Private Sub master_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    Dim R As Long
    Dim S As Controller_State
    S = master.State
    disableOnRowChanged = True
    If Not IsNull(rs!parent) Then
    'Else
        fg.Row = getRowByID(rs!parent)
    End If
    
    disableOnRowChanged = False
    msg = "Â‰«·ﬂ „Ã„Ê⁄… √Œ—Ï ·Â« «·«”„ √Ê «·—„“ –« Â."
    KeepState = True
    masterFrame.Tag = ""
    fg.Tag = ""
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    UpdateGrid = True
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

Private Sub FillGrid(fg As VSFlexGrid, rs As ADODB.Recordset, ByVal level As Integer, parent As Long)
    Do While Not rs.EOF
        master.rs.MoveFirst
        master.rs.Find "Id = " & rs!id
        fg.AddItem rs!Num & vbTab & rs!name & vbTab & rs!Note & vbTab & rs!id & vbTab & level & vbTab & rs!parent & vbTab & master.rs.AbsolutePosition
        fg.IsSubtotal(fg.Rows - 1) = True
        fg.RowOutlineLevel(fg.Rows - 1) = level
        Dim P As Long
        P = rs!id
        Dim rsChildren As ADODB.Recordset
        Dim cancel As Boolean
        Set rsChildren = ExecuteSelect(Conn, SELECT_GROUP & " WHERE parent = " & P, cancel)
        FillGrid fg, rsChildren, level + 1, P
        Set rsChildren = Nothing
        rs.MoveNext
    Loop
End Sub

Private Function CheckAccName(acc As String, parent As String) As Boolean
    CheckAccName = True
End Function

Private Sub fg_BeforeRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long, cancel As Boolean)
    If OldRow = NewRow Or OldRow < 2 Then Exit Sub
    If details.State And (ST_ADDNEW Or ST_UPDATE) Then
        details.Save
        If details.State And (ST_ADDNEW Or ST_UPDATE) Then
            cancel = True
            detailFrame_Click
            Exit Sub
        End If
    End If
    If master.State And (ST_ADDNEW Or ST_UPDATE) Then
        master.Save
        If master.State And (ST_ADDNEW + ST_UPDATE) Then
            cancel = True
            masterFrame_Click
            Exit Sub
        End If
    End If
    If master.rs.EditMode = adEditAdd Then Exit Sub
    MoveRSToSelectedRow fg, master.rs
    fg.TextMatrix(OldRow, NAME_) = master.rs!name
    fg.TextMatrix(OldRow, NUM_) = master.rs!Num
    If IsNull(master.rs!Note) Then
        fg.TextMatrix(OldRow, NOTE_) = ""
    Else
        fg.TextMatrix(OldRow, NOTE_) = master.rs!Note
    End If
'    Dim isModified As Boolean
'    isModified = master.rs!name <> fg.TextMatrix(OldRow, name)
'    isModified = isModified Or master.rs!Num <> fg.TextMatrix(OldRow, NUM_)
'    isModified = isModified Or master.rs!Note <> fg.TextMatrix(OldRow, NOTE_)
'    If isModified Then
'        ' to do
'    End If
End Sub

Private Sub PopulateGroupObjects(ByVal GroupRow As Long)
    Dim Sql As String
    Dim cancel As Boolean
    
    Dim group As String
    group = Trim(fg.TextMatrix(GroupRow, ID_))
    
    Sql = "SELECT * " & vbCrLf & _
          "FROM Stock_Object" & vbCrLf & _
          "WHERE "
          
    If group = "" Then
        Sql = Sql & "[Group] IS NULL"
    Else
        Sql = Sql & "[Group] = " & group
    End If
    
    Set details.rs = ExecuteSelect(Conn, Sql, cancel)
    If details.rs.EOF Then Exit Sub
    details.rs.MoveFirst
End Sub

Public Sub MoveRSToSelectedRow(ByRef ctrl As Control, rs As ADODB.Recordset)
        If Not (rs.EOF Or rs.BOF) Then
            If rs.EditMode = adEditAdd Then Exit Sub
        End If
        master.State = master.State + ST_FILLGRID
        rs.MoveFirst
        rs.Move CLng(ctrl.TextMatrix(ctrl.Row, POSITION_)) - 1
        master.State = master.State - ST_FILLGRID
End Sub

Private Sub BuildTree(ByVal SelectedRow As Long)
    Dim rootsRS As ADODB.Recordset
    Dim cancel As Boolean
    MousePointer = vbHourglass
    Set rootsRS = ExecuteSelect(Conn, SELECT_GROUP & " WHERE parent IS NULL", cancel)
    fg.Rows = 1
    fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "1" & vbTab & "" & vbTab & ""
    fg.IsSubtotal(1) = True
    fg.RowOutlineLevel(1) = 1
    Dim masterState As Controller_State
    masterState = master.State
    master.State = ST_FILLGRID
    FillGrid fg, rootsRS, 2, 0
    master.State = masterState
    MousePointer = vbDefault
    If SelectedRow >= fg.Rows Then
        SelectedRow = fg.Rows - 1
    End If
    fg.Row = SelectedRow
    Set rootsRS = Nothing
End Sub

Private Function getRowByID(ByVal id As Integer) As Long
    getRowByID = fg.FindRow(CStr(id), , ID_)
End Function

