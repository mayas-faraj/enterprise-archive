VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Clin_List 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ﬁ«∆„… «·«Œ Ì«—"
   ClientHeight    =   6435
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6645
   Icon            =   "Clin_List.frx":0000
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   6435
   ScaleWidth      =   6645
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   6255
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;NoBlankSearchAlert=true;NoBlankSearchCancel=true;"
      Top             =   120
      Width           =   6450
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5295
         Left            =   120
         TabIndex        =   3
         Tag             =   ";typeof=vsflexgrid;NoBlankSearchAlert=true;NoBlankSearchCancel=true;"
         Top             =   720
         Width           =   6210
         _cx             =   10954
         _cy             =   9340
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
         Rows            =   2
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Clin_List.frx":1CFA
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
         TabBehavior     =   0
         OwnerDraw       =   0
         Editable        =   1
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
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   375
         Left            =   1200
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   2160
         Width           =   375
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
         TabStop         =   0   'False
         Top             =   240
         Width           =   6255
      End
   End
End
Attribute VB_Name = "Clin_List"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Dim oldScaleWidth As Long
Public CallerForm As Form
Public SearchQuery As String
Public ColsCount As Integer
Public DisableSearchOnLoad As Boolean



Private Sub fg_ChangeEdit()
    Dim OldCol As Long
    OldCol = fg.Col
'    Dim oldval As String
'    Debug.Print fg.Text
'    Debug.Print fg.EditText
'    oldval = fg.Text
    fg.Row = 0
    master.Search
    fg.Row = 1
    fg.Col = OldCol
    fg.EditCell
    fg.EditSelStart = Len(fg.text)
End Sub

Private Sub fg_DblClick()
    Dim callerTag As String
    callerTag = GetTagValue(fg.Tag, "caller")
    Dim Col As String
    Dim i As Long
    '<AHMAD>
    If fg.Row = 1 Or fg.Rows = 0 Or fg.Row = 0 Then Exit Sub
    '</AHMAD>
    For i = 0 To fg.Cols - 1
        Col = GetTagValue(callerTag, CStr(i), ":", ",")
        If Col <> "" Then
            If IsNumeric(Col) Then
                If CallerForm.fg.Col = CLng(Col) Then
                    CallerForm.fg.editText = fg.Cell(flexcpText, fg.Row, i)
                    '<AHMAD>
                    CallerForm.fg.Cell(flexcpText, CallerForm.fg.Row, Col) = fg.Cell(flexcpText, fg.Row, i)
                    '</AHMAD>
                Else
                    CallerForm.fg.Cell(flexcpText, CallerForm.fg.Row, CLng(Col)) = fg.Cell(flexcpText, fg.Row, i)
                End If
            Else
                CallByName CallerForm, Col, VbMethod, fg.Cell(flexcpText, fg.Row, i)
            End If
        End If
    Next
    Unload Me
End Sub

Private Sub fg_KeyDownEdit(ByVal Row As Long, ByVal Col As Long, KeyCode As Integer, ByVal Shift As Integer)
    If KeyCode = 13 Then
        fg_DblClick
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
Private Sub Form_Activate()
'    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
'    RefreshCommands btnSettings And FormSettings
'    Debug.Print "Activate List"
End Sub

Private Sub Form_Deactivate()
'    btnSettings = GetBtnSettings
'    Debug.Print "DeActivate List"

End Sub

Private Sub Form_Load()
    oldScaleWidth = 0 'Me.Width
'    FormSettings = btAll - btUpdate - btNew - btNext - btPrev - btFirst - btLast
'    btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec - -btUpdate - btNew - btNext - btPrev - btFirst - btLast
    FormatForm Me
    fg.Tag = fg.Tag & GLOBAL_TAG
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
    
    If ColsCount <> 0 Then
        fg.Cols = ColsCount
    End If
    
    'Debug.Print fg.tag
    'Debug.Print GetTagValue(fg.tag, "SearchQuery")
    Set master.rs = ExecuteSelect(Conn, GetTagValue(fg.Tag, "SearchQuery"), Cancel)
    If Not DisableSearchOnLoad Then
        master.MoveFirst
        master.BeginSearch
        setSearchQuery
        master.Search
    Else
        Set fg.DataSource = master.rs
        master.BeginSearch
    End If
    Set ActiveFrame = masterFrame
    Me.Width = masterFrame.Width + 330
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    Me.DisableSearchOnLoad = False
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    fg.SetFocus
    '<AHMAD>
    If fg.Rows > 1 Then
        fg.Row = 1
    End If
    '</AHMAD>
End Sub

Private Sub setSearchQuery()
    Dim initQuery As String
    initQuery = GetTagValue(fg.Tag, "initQuery")
    Dim i As Long
    Dim v As String
    For i = 0 To fg.Cols - 1
        v = GetTagValue(initQuery, CStr(i), ":", ",")
        If v <> "" Then
            fg.Cell(flexcpText, 1, i) = v
        End If
    Next
End Sub
