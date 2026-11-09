VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form dlgDoctorTransition 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   7575
   ClientLeft      =   3015
   ClientTop       =   1725
   ClientWidth     =   5970
   Icon            =   "dlgDoctorTransition.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   7575
   ScaleWidth      =   5970
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   350
      Left            =   0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Height          =   350
      Left            =   960
      Picture         =   "dlgDoctorTransition.frx":1CFA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   19
      TabStop         =   0   'False
      ToolTipText     =   "Õ›Ÿ"
      Top             =   285
      Width           =   375
   End
   Begin VB.ComboBox cbBranchId 
      ForeColor       =   &H80000012&
      Height          =   315
      Left            =   1440
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   17
      Tag             =   ";search=true;check=required;"
      Top             =   300
      Width           =   3135
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   2250
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   7080
      Width           =   1515
   End
   Begin VB.CommandButton cmdPrint 
      Enabled         =   0   'False
      Height          =   350
      Left            =   120
      Picture         =   "dlgDoctorTransition.frx":227E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      TabStop         =   0   'False
      ToolTipText     =   "ÿ»«⁄…"
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdLast 
      Enabled         =   0   'False
      Height          =   350
      Left            =   600
      Picture         =   "dlgDoctorTransition.frx":2402
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      TabStop         =   0   'False
      ToolTipText     =   "«·√ŒÌ—"
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdNext 
      Enabled         =   0   'False
      Height          =   350
      Left            =   960
      Picture         =   "dlgDoctorTransition.frx":2746
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      ToolTipText     =   "«· «·Ì"
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdPrev 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1320
      Picture         =   "dlgDoctorTransition.frx":2A8A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   13
      TabStop         =   0   'False
      ToolTipText     =   "«·”«»ﬁ"
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdFirst 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1680
      Picture         =   "dlgDoctorTransition.frx":2DCE
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   12
      TabStop         =   0   'False
      ToolTipText     =   "«·√Ê·"
      Top             =   840
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   5775
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Tag             =   ";repeat=true;"
      Top             =   1200
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
         TabIndex        =   11
         Top             =   240
         Width           =   5535
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5175
         Left            =   120
         TabIndex        =   1
         Tag             =   ";typeof=vsflexgrid;datafield=,0:id,1:name,;check=,0:Integer > 0,0:required,1:required,;"
         Top             =   480
         Width           =   5535
         _cx             =   9763
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
         FormatString    =   $"dlgDoctorTransition.frx":3112
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
      Picture         =   "dlgDoctorTransition.frx":3128
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      ToolTipText     =   " ‰›Ì– »ÕÀ"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdCancelSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2640
      Picture         =   "dlgDoctorTransition.frx":34EA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡ »ÕÀ"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3360
      Picture         =   "dlgDoctorTransition.frx":366E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   8
      TabStop         =   0   'False
      ToolTipText     =   "»ÕÀ"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdCancel 
      Height          =   350
      Left            =   4080
      Picture         =   "dlgDoctorTransition.frx":3BF2
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdSave 
      Height          =   350
      Left            =   4440
      Picture         =   "dlgDoctorTransition.frx":3D76
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      TabStop         =   0   'False
      ToolTipText     =   "Õ›Ÿ"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdDel 
      Height          =   350
      Left            =   4800
      Picture         =   "dlgDoctorTransition.frx":42FA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Õ–›"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdUpdate 
      Height          =   350
      Left            =   5160
      Picture         =   "dlgDoctorTransition.frx":48A6
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   " ⁄œÌ·"
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton cmdNew 
      Height          =   350
      Left            =   5505
      Picture         =   "dlgDoctorTransition.frx":4E2A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      TabStop         =   0   'False
      ToolTipText     =   "ÃœÌœ"
      Top             =   840
      Width           =   375
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«·›—⁄ «·√”«”Ì"
      Height          =   195
      Index           =   0
      Left            =   4770
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   360
      Width           =   1005
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   1  'Opaque
      Height          =   615
      Left            =   120
      Top             =   120
      Width           =   5775
   End
End
Attribute VB_Name = "dlgDoctorTransition"
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

Public GridTag As String
Public Sql As String
Public ColumnsNames As String
Public FrameCaption As String
Public Opener As Form
Private originalGridTag As String
Private masterFields As Scripting.Dictionary

Private Sub cmdCancel_Click()
    master.CancelSave
End Sub

Private Sub cmdCancelSearch_Click()
    master.CancelSearch
End Sub

Private Sub cmdDel_Click()
    master.Delete
End Sub

Private Sub cmdExecSearch_Click()
    master.Search
End Sub

Private Sub cmdNew_Click()
    master.addNew
End Sub

Private Sub cmdOk_Click()
    Unload Me
End Sub

Private Sub cmdSave_Click()
    master.Save
End Sub

Private Sub cmdSearch_Click()
    master.BeginSearch
End Sub

Private Sub cmdUpdate_Click()
    master.Update
End Sub

Private Sub Command1_Click()
    If cbBranchId.ListIndex >= 0 Then
        CallByName Opener, GetTagValue(Me.Tag, "Action"), VbMethod, cbBranchId.ItemData(cbBranchId.ListIndex), False
    Else
        MsgBox "⁄·Ìﬂ «Œ Ì«— «”„ «·›—⁄ √Ê·«.", vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading Or vbCritical, "Õ›Ÿ"
    End If
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
'    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings, Me
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
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
    Dim Cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, Sql, Cancel)
    fg.Tag = GridTag
    originalGridTag = GridTag
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
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

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If Trim(cbBranchId.text) = "" Then
        MsgBox "ÌÃ»  ÕœÌœ «·›—⁄ «·√”«”Ì ﬁ»· «·Œ—ÊÃ.", vbCritical
        Cancel = True
        Exit Sub
    End If
    If Not cmdOK.Enabled Then
        MsgBox "ÌÃ» Õ›Ÿ «· ⁄œÌ·«  √Ê ≈·€«ƒÂ« ⁄·Ï «·”Ã· «·Õ«·Ì ﬁ»· «·Œ—ÊÃ.", vbCritical
        Cancel = True
        Exit Sub
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

Private Sub Form_Unload(Cancel As Integer)
    If cbBranchId.ListIndex >= 0 Then
        CallByName Opener, GetTagValue(Me.Tag, "Action"), VbMethod, cbBranchId.ItemData(cbBranchId.ListIndex), True
    End If
    frmDoctorCV.master.rs.Move 0
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0, Me
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    cmdOK.Enabled = False
End Sub

Private Sub master_doBeforeAddNew(rs As ADODB.Recordset, Cancel As Boolean)
    
    If frmDoctorCV.master.rs.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈÷«›…  ‰ﬁ· ﬁ»· ≈÷«›… ÿ»Ì» Ê«Õœ ⁄·Ï «·√ﬁ· ›Ì «·–« Ì…", vbCritical + vbOKOnly, "⁄œœ «·”Ã·«  = 0"
        Cancel = True
        Exit Sub
    End If
    
    If IsNull(frmDoctorCV.master.rs("original_branch_id").Value) Then
        MsgBox "ﬁ»· ≈÷«›…  ‰ﬁ· ·Â–« «·ÿ»Ì» ÌÃ» ÷»ÿ Œ«‰… «·›—⁄ «·√”«”Ì Ê«·÷€ÿ ⁄·Ï “— «·Õ›Ÿ «·„Ã«Ê— ·Â«", vbInformation, ""
        Cancel = True
    End If
                                    
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
    fg.Tag = originalGridTag
    cmdOK.Enabled = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    fg.Row = rs.AbsolutePosition
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, Cancel As Boolean)
    removeHiddenFieldsFromDataFieldsInGridTag fg
    For Each Key In masterFields
        rs.Fields(Key) = masterFields(Key)
    Next
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    fg.Tag = originalGridTag
    cmdOK.Enabled = True
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
End Sub

Private Sub master_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = "·« Ì„ﬂ‰ ≈œŒ«· «‰ ﬁ«·Ì‰ »«· «—ÌŒ –« Â."
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    cmdOK.Enabled = False
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
