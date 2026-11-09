VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Pic_TeethTreats 
   BackColor       =   &H00E1FEFF&
   Caption         =   "—»ÿ «·„⁄«·Ã«  »«·√”‰«‰"
   ClientHeight    =   8820
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10215
   Icon            =   "Pic_TeethTreats.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8820
   ScaleWidth      =   10215
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„⁄«·Ã« "
      Height          =   5655
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   ";repeat=true;"
      Top             =   2400
      Width           =   9975
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
         Width           =   9735
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4935
         Left            =   120
         TabIndex        =   3
         Tag             =   ";typeof=vsflexgrid;datafield=,0:name,1:pic,2:id,3:treatid,;"
         Top             =   480
         Width           =   9735
         _cx             =   17171
         _cy             =   8705
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
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
         BackColorBkg    =   14810879
         BackColorAlternate=   14810879
         GridColor       =   -2147483633
         GridColorFixed  =   -2147483632
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   0
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Pic_TeethTreats.frx":1CFA
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
      Caption         =   "«·”‰"
      Height          =   2175
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   9975
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         DataField       =   "num"
         Height          =   375
         Left            =   7440
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   540
         Width           =   1455
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
         Width           =   9735
      End
      Begin VB.Label lblTmp 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Height          =   375
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   540
         Width           =   1335
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·”‰"
         Height          =   255
         Left            =   9000
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   600
         Width           =   735
      End
   End
End
Attribute VB_Name = "Pic_TeethTreats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public WithEvents detail As Controller
Attribute detail.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Double



Private Sub detail_DoDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim c As Boolean
    ExecuteCommand Conn, "delete from Pic_TeethTreat where id=" & rs!ID & " and treatid=" & rs!treatid, c
    rs.Requery
    rs.MoveFirst
    cancel = True
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = (Col = 0)
End Sub

Private Sub fg_DblClick()
    'Show the drawing grid
    'MsgBox fg.Cell(flexcpText, fg.Row, 2) & "," & fg.Cell(flexcpText, fg.Row, 3)
    Pic_Drawig.Show 1
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 10335
    FormSettings = btAll
    btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    FormDetailSettings = btAll - btNext - btPrev - btLast - btFirst - btSearch
    btnDetailSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from Pic_Teeth", cancel)
    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    Set detail.rs = ExecuteSelect(Conn, "select * from VPic_TeethTreat where 1=0", cancel)
    controllers.Add master, masterFrame.Name
    controllers.Add detail, detailFrame.Name
    Set ActiveFrame = masterFrame
End Sub

Private Sub Form_Resize()
    'Dim Alph As Long
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
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
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    Dim cancel As Boolean
    Set detail.rs = ExecuteSelect(Conn, "select * from VPic_TeethTreat where id=" & rs!ID, cancel)
    detail.rs.MoveFirst
    If rs!tmp = 0 Then
        lblTmp.Caption = "ﬂ«„·"
    Else
        lblTmp.Caption = "·»‰Ì"
    End If
End Sub

Private Sub masterFrame_Click()
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub detailFrame_Click()
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

