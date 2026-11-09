VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Acc_Dalil 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
   ClientHeight    =   7755
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   7320
   Icon            =   "Acc_Dlil.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7755
   ScaleWidth      =   7320
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
      Height          =   6615
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   7095
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5895
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   6855
         _cx             =   12091
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
         Rows            =   10
         Cols            =   11
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   300
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Acc_Dlil.frx":1CFA
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   2
         AutoSearchDelay =   5
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
         ComboSearch     =   0
         AutoSizeMouse   =   -1  'True
         FrozenRows      =   0
         FrozenCols      =   2
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
         Width           =   6855
      End
   End
End
Attribute VB_Name = "Acc_Dalil"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Dim oldScaleWidth As Long
Dim UpdateGrid As Boolean
Const ACC_ = 0
Const NAME_ = 1
Const DEST_ = 2
Const STARTBAL_ = 3
Const BAL_ = 4
Const D_ = 5
Const M_ = 6
Const TYPE_ = 7
Const NUM_ = 8
Const LEVEL_ = 9
Const PARENT_ = 10

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
If Row = 1 Then cancel = True
End Sub

Private Sub fg_KeyPressEdit(ByVal Row As Long, ByVal Col As Long, KeyAscii As Integer)
     If fg.Col = 2 Or fg.Col = 3 Then KeyAscii = 0
End Sub

Private Sub fg_StartEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = Not (Col = ACC_ Or Col = NAME_ Or Col = DEST_ Or Col = TYPE_)
End Sub

Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = currentDatabaseName
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()

    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName

    oldScaleWidth = 7440 'Me.Width
    FormSettings = btall - btPrint - btNext - btPrev - btLast - btFirst - btSearchCancel - btSearchExec - btSearch
    btnSettings = btall - btCancel - btsave
    FormatForm Me
    
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select num,name, parent,startBal,Dest,type,D,M,acc from Acc_Accounts order by acc", cancel)
    Set ActiveFrame = masterFrame
    With fg
    
        ' layout
        .Rows = 1
        '.Cols = 10
        '.ColWidth(0) = 1000
       ' .FixedCols = 0
        '.ExtendLastCol = True
'        .TextMatrix(0, 0) = "Tag"
'        .TextMatrix(0, 1) = "Value"
'        .ColAlignment(-1) = flexAlignRightTop
        '.Editable = flexEDKbdMouse
                
        ' outline
        .OutlineCol = 0
        .OutlineBar = flexOutlineBarSimpleLeaf
        '.MergeCells = flexMergeOutline
        
        ' other
        '.AllowUserResizing = flexResizeColumns
        '.AllowSelection = False
        '.GridLines = flexGridFlatVert
         .ColComboList(TYPE_) = "|#0; »·«|#1; œ«∆‰|#2; „œÌ‰"
         .ColComboList(DEST_) = "|#0;„Ì“«‰Ì… |#1; √—»«Õ ÊŒ”«∆—|#2;„ «Ã—…"
    End With
'    fg.Redraw = False
    fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "1" & vbTab & ""
    fg.IsSubtotal(fg.Rows - 1) = True
    fg.RowOutlineLevel(fg.Rows - 1) = 1

    FillGrid fg, master.rs, 2, 0
'    fg.Redraw = True
    SetCaption Me
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
'    masterFrame.Top = masterFrame.Top * Alpha
'    masterFrame.Left = masterFrame.Left * Alpha
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
    
    'resize grid
    'ResizeGrid fg
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fg.Cols - 1
        totWidth = totWidth + fg.ColWidth(i)
    Next
    For i = 0 To fg.Cols - 1
        fg.ColWidth(i) = fg.Width * fg.ColWidth(i) / totWidth
    Next
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Function GetChildPosition(Row As Long) As Long
    Dim Level As Integer
    Level = CInt(fg.Cell(flexcpText, fg.Row, LEVEL_))
    Dim R As Long
    R = Row + 1
    Do While R < fg.Rows
        If CInt(fg.Cell(flexcpText, R, LEVEL_)) <= Level Then
            GetChildPosition = R
            Exit Function
        End If
        R = R + 1
    Loop
    GetChildPosition = R
End Function
Private Sub master_doAddNew(rs As ADODB.Recordset)
    Dim Row As Long
    Dim state As Integer
    UpdateGrid = False
    If fg.Row = 0 Then
        state = master.state
        master.state = master.state - ST_ADDNEW
        fg.Row = 1
        master.state = state
    End If
    Row = GetChildPosition(fg.Row)
    fg.AddItem "", Row
    
    fg.IsSubtotal(Row) = True
    fg.RowOutlineLevel(Row) = CInt(fg.Cell(flexcpText, fg.Row, LEVEL_)) + 1
   '      rs!parent = CInt(fg.Cell(flexcpText, fg.Row, PARENT_))
    Dim parent As String
    parent = fg.Cell(flexcpText, fg.Row, NUM_)
    If parent <> "" Then
        rs!parent = CInt(parent)
    End If
    state = master.state
    master.state = 0
    fg.Row = Row
    fg.TopRow = Row
    fg.Cell(flexcpText, fg.Row, PARENT_) = parent
    fg.Col = ACC_
    fg.AutoSearch = flexSearchNone
    master.state = state
End Sub

Private Sub master_doBeforeDelete(rs As ADODB.Recordset, cancel As Boolean)
    cancel = True
    If fg.Row <= 2 Then
        cancel = True
        MsgBox "ÌÃ» √‰  Õœœ Õ”«»« ﬁ»· Õ–›Â"
        Exit Sub
    End If
    If MsgBox("Â· √‰  „ √ﬂœ „‰ ⁄„·Ì… «·Õ–›ø", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading + vbYesNo, " √ﬂÌœ ⁄„·Ì… «·Õ–›") = vbNo Then Exit Sub
    Dim ButtonsForm As Form
    RefreshCommands FormSettings And btMaskDelete, ButtonsForm
    master.MoveRSToSelectedRow fg, master.rs
    master.rs.MovePrevious
On Error GoTo errHandler
    rs.Delete
    fg.Rows = 1
    fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "1" & vbTab & ""
    fg.IsSubtotal(fg.Rows - 1) = True
    fg.RowOutlineLevel(fg.Rows - 1) = 1
    rs.MoveFirst
    Me.MousePointer = vbHourglass
    FillGrid fg, master.rs, 2, 0
    Me.MousePointer = vbNormal
    Exit Sub
errHandler:
    MsgBox "·« Ì„ﬂ‰ Õ–› Â–« «·”Ã· ·√‰Â „— »ÿ »ﬁÌÊœ „Õ«”»Ì… √Ê √‰Â Õ”«» —∆Ì”Ì", vbMsgBoxRight + vbMsgBoxRtlReading + vbCritical
     rs.CancelUpdate
End Sub

Private Sub master_doBeforeUpdate(rs As ADODB.Recordset, cancel As Boolean)
   ' <AHMAD>
        'UpdateGrid = True
    '</AHMAD>
    If fg.Row < 2 Then
        MsgBox "ÌÃ» √‰  Õœœ Õ”«»« · ⁄œÌ·Â", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
    End If
    '<AHMAD>
        UpdateGrid = True
    '</AHMAD>
    fg.AutoSearch = flexSearchNone
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    If Not UpdateGrid Then
        fg.RemoveItem fg.Row
    End If
    UpdateGrid = False
    '<AHMAD>
        fg.Rows = 1
        fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "1" & vbTab & ""
        fg.IsSubtotal(fg.Rows - 1) = True
        fg.RowOutlineLevel(fg.Rows - 1) = 1
        Me.MousePointer = vbHourglass
        If master.SaveAfterWhat = ST_ADDNEW Then
            rs.CancelUpdate
        End If
        RefreshCommands FormSettings And btMaskCancel
        rs.Requery
        FillGrid fg, master.rs, 2, 0
        Me.MousePointer = vbNormal
        master.state = 0
        cancel = True
    '</AHMAD>
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    masterFrame.Tag = ";repeat=true;"
    fg.Tag = ";typeof=vsflexgrid;check=," & ACC_ & ":required," & NAME_ & ":required," & DEST_ & ":required," & TYPE_ & ":required,;check=," & ACC_ & ":integer>0,;check=," & ACC_ & ":custom,;"
    If Not master.validate Then
        masterFrame.Tag = ""
        fg.Tag = ""
        cancel = True
        RefreshCommands FormSettings And btMaskUpdate, MDIMain
        Exit Sub
    End If
    masterFrame.Tag = ""
    fg.Tag = ""
    
'    If Not CheckAccName(fg.Cell(flexcpText, fg.Row, ACC_), fg.Cell(flexcpText, fg.Row, PARENT_)) Then
'        MsgBox "—ﬁ„ «·Õ”«» €Ì— ’ÕÌÕ° ÌÃ» √‰ Ì Ê«›ﬁ „⁄ —ﬁ„ «·Õ”«» «·—∆Ì”Ì"
'        Cancel = True
'    End If
    master.MoveRSToSelectedRow fg, master.rs
    master.state = master.state + ST_FILLGRID
    If rs.EOF Then
        master.rs.MovePrevious
    ElseIf Not (rs.BOF) Then
        If rs.EditMode <> adEditAdd Then master.rs.MovePrevious
    End If
    master.state = master.state - ST_FILLGRID
    
    rs!name = fg.Cell(flexcpText, fg.Row, NAME_)
    rs!acc = fg.Cell(flexcpText, fg.Row, ACC_)
    rs!Dest = fg.Cell(flexcpText, fg.Row, DEST_)
    rs!Type = fg.Cell(flexcpText, fg.Row, TYPE_)
    
    'rs.Update
'    cancel = True
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    If Not UpdateGrid Then
        fg.Rows = 1
        rs.MoveFirst
        fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "1" & vbTab & ""
        fg.IsSubtotal(fg.Rows - 1) = True
        fg.RowOutlineLevel(fg.Rows - 1) = 1

        Me.MousePointer = vbHourglass
        master.rs.Requery
        FillGrid fg, master.rs, 2, 0
        Me.MousePointer = vbNormal
    End If
    UpdateGrid = False
    fg.AutoSearch = flexSearchFromCursor
'    Dim val As String
'    master.rs.Resync
'    val = cmbAcc.ItemData(cmbAcc.ListIndex)
'    cmbAcc.Clear
'    cmbAcc.AddItem "«·„—Ì÷ «·Õ«·Ì", 0
'    cmbAcc.ItemData(0) = -1
'    fillCmb cmbAcc, "select name , id from Clin_Accounts where parent=1", 1
''    rs.Requery
'     cmbAcc.ListIndex = GetListIndex(cmbAcc, rs!Accountant)
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
'    '<AHMAD>
'        'UpdateGrid = True
'    '</AHMAD>
'    If fg.Row < 2 Then
'        MsgBox "ÌÃ» √‰  Õœœ Õ”«»« · ⁄œÌ·Â"
'        'master.CancelSave
'        Exit Sub
'    End If
'    '<AHMAD>
'        UpdateGrid = True
'    '</AHMAD>
'    fg.AutoSearch = flexSearchNone
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim count As Integer
    If S = "custom" Then
    ''Must be state
        If master.SaveAfterWhat = ST_ADDNEW Then
            count = IsUniqValue("select * from Acc_Accounts" & Acc_DBYear & " where acc='" & fg.Cell(flexcpText, fg.Row, ACC_) & "'")
        Else
            count = IsUniqValue("select * from Acc_Accounts" & Acc_DBYear & " where acc='" & fg.Cell(flexcpText, fg.Row, ACC_) & "' and num!=" & fg.Cell(flexcpText, fg.Row, NUM_))
        End If
        If count < 0 Then
            msg = "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
            checkType = True
            Exit Sub
        End If
        checkType = (count = 0)
        If checkType Then
            msg = "—ﬁ„ «·Õ”«» ÌÃ» √‰ ÌﬂÊ‰ ÊÕÌœ«"
            Exit Sub
        End If
        checkType = Not CheckAccName(fg.Cell(flexcpText, fg.Row, ACC_), fg.Cell(flexcpText, fg.Row, PARENT_), msg)
        If checkType Then
'            msg = "—ﬁ„ «·Õ”«» €Ì— „ Ê«›ﬁ „⁄ «·Õ”«» «·—∆Ì”Ì"
            Exit Sub
        End If
    Else
        checkType = False
    End If
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub FillGrid(fg As VSFlexGrid, rs As ADODB.Recordset, ByVal Level As Integer, parent As Long)
    Debug.Print Level & "," & parent
    Do While Not rs.EOF
        If (rs!parent <> parent) Or (IsNull(rs!parent) And parent <> 0) Then Exit Sub 'And IsNull(rs!Parent) Then Exit Sub
        Dim balance As Double
        If rs!Type = 1 Then
            balance = rs!D - rs!M
        Else
            balance = rs!M - rs!D
        End If
        fg.AddItem rs!acc & vbTab & rs!name & vbTab & rs!Dest & vbTab & rs!StartBal & vbTab & balance & vbTab & rs!D & vbTab & rs!M & vbTab & rs!Type & vbTab & rs!num & vbTab & Level & vbTab & rs!parent
        fg.IsSubtotal(fg.Rows - 1) = True
        fg.RowOutlineLevel(fg.Rows - 1) = Level
'        If Num = 4 Then
'        Debug.Print rs!Num & "," & rs!acc
'        End If
        Dim p As Long
        p = rs!num
        rs.MoveNext
        If rs.EOF Then
            Exit Sub
        End If
        FillGrid fg, rs, Level + 1, p
    Loop
End Sub

Private Function CheckAccName(acc As String, ByVal parent As String, ByRef msg) As Boolean
    Dim parentAcc As String
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    'check new account looks like a child for the parent accounts
    If Trim(parent) = "" Then
        parent = "0"
    End If
    Set rs = ExecuteSelect(Conn, "select acc from Acc_Accounts" & Acc_DBYear & " where num=" & parent, cancel)
    If cancel Then
        msg = "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        CheckAccName = False
        Exit Function
    End If
    If rs.EOF Then
'        CheckAccName = False
        parentAcc = acc
    Else
        parentAcc = rs!acc
    End If
    If InStr(acc, parentAcc) <> 1 Then
        msg = "—ﬁ„ «·Õ”«» ·« Ìœ· ⁄·Ï √‰Â Õ”«» ›—⁄Ì ··Õ”«» «·—∆Ì”Ì «·–Ì Õœœ Â"
        CheckAccName = False
        Exit Function
    End If
'    End If
    'check new account looks like a brother for the childs of the parent account
    Set rs = ExecuteSelect(Conn, "select top 1 acc from Acc_Accounts" & Acc_DBYear & " where isnull(parent,0)=" & parent, cancel)
    If cancel Then
        msg = "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        CheckAccName = False
        Exit Function
    End If
    If rs.EOF Then
        CheckAccName = True
        Exit Function
    End If
    
    If Len(acc) <> Len(rs!acc) Then
        msg = "—ﬁ„ «·Õ”«» «·„œŒ· ·« Ìÿ«»ﬁ «· —ﬁÌ„ «·„⁄ „œ ··Õ”«»«  ›Ì Â–« «·„” ÊÏ"
        CheckAccName = False
        Exit Function
    End If
    'check if changing a parent to a patern not compatible with child
    If master.state = ST_ADDNEW Then 'when inserting new acc, no need for this check
        CheckAccName = True
        Exit Function
    End If
If fg.Cell(flexcpText, fg.Row, NUM_) <> "" Then
     Set rs = ExecuteSelect(Conn, "select top 1 acc from Acc_Accounts" & Acc_DBYear & " where parent=" & fg.Cell(flexcpText, fg.Row, NUM_), cancel)
     If cancel Then
        msg = "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        CheckAccName = False
            Exit Function
        End If
        If rs.EOF Then
          CheckAccName = True
        Exit Function
        End If
        If InStr(rs!acc, acc) <> 1 Then
             msg = "—ﬁ„ «·Õ”«» ·« Ìœ· ⁄·Ï √‰Â Õ”«» —∆Ì”Ì ··Õ”«»«  «·›—⁄Ì… «·„ÊÃÊœ…"
            CheckAccName = False
            Exit Function
        End If
End If
    CheckAccName = True
End Function

Private Sub fg_BeforeRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long, cancel As Boolean)
    If OldRow = NewRow Then Exit Sub
    If master.state And (ST_ADDNEW + ST_UPDATE) Then
        master.Save
        If master.state And (ST_ADDNEW + ST_UPDATE) Then
            cancel = True
        End If
    End If
    
End Sub
Private Sub fg_KeyDown(KeyCode As Integer, Shift As Integer)
    If Not ((fg.Row = fg.Rows - 1) And (fg.Col = 3)) Then Exit Sub
    If KeyCode = 9 Or KeyCode = 40 And Shift <> 1 Then
        If master.state And (ST_ADDNEW + ST_UPDATE) Then
            master.Save
            If master.state And (ST_ADDNEW + ST_UPDATE) Then
                Exit Sub
            End If
        End If
        master.addNew
        fg.Col = 0
    End If
End Sub


