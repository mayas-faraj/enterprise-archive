VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_Arbah 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
   ClientHeight    =   7335
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10800
   Icon            =   "Acc_Arbah.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7335
   ScaleWidth      =   10800
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì—"
      Height          =   375
      Left            =   1755
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   6465
      Visible         =   0   'False
      Width           =   1300
   End
   Begin VB.CommandButton cmdSearch 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„⁄«Ì‰…"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   315
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   6465
      Width           =   1400
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
      Height          =   6990
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   0
      Width           =   10605
      Begin MSComCtl2.DTPicker txtFrom 
         Height          =   375
         Left            =   7455
         TabIndex        =   1
         Top             =   735
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40095
      End
      Begin VB.TextBox txtLevel 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   2670
         MaxLength       =   2
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   735
         Width           =   855
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
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   240
         Width           =   11595
      End
      Begin MSComctlLib.ProgressBar pb 
         Height          =   255
         Left            =   2670
         TabIndex        =   7
         Top             =   1215
         Visible         =   0   'False
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   1095
         Left            =   120
         TabIndex        =   11
         Top             =   480
         Visible         =   0   'False
         Width           =   1875
         _cx             =   3307
         _cy             =   1931
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
         Cols            =   7
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Acc_Arbah.frx":1CFA
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   4
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   0
         AutoSearchDelay =   2
         MultiTotals     =   0   'False
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
         Editable        =   0
         ShowComboButton =   -1  'True
         WordWrap        =   0   'False
         TextStyle       =   0
         TextStyleFixed  =   0
         OleDragMode     =   0
         OleDropMode     =   0
         DataMode        =   1
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
      Begin VSFlex7Ctl.VSFlexGrid fga 
         Height          =   4095
         Left            =   120
         TabIndex        =   5
         Top             =   1680
         Width           =   10335
         _cx             =   18230
         _cy             =   7223
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   0
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         BackColorFixed  =   14737632
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
         AllowUserResizing=   3
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   7
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   ""
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   0
         AutoSearchDelay =   2
         MultiTotals     =   0   'False
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
      Begin MSComCtl2.DTPicker txtTo 
         Height          =   375
         Left            =   4335
         TabIndex        =   2
         Top             =   735
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40095
      End
      Begin VB.Label lblStatus 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„ƒ‘— Õ«·…  ﬁœ„ ⁄„·Ì… «·„⁄«Ì‰…"
         Height          =   255
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   1215
         Visible         =   0   'False
         Width           =   2130
      End
      Begin VB.Label lblD 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   20.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   2430
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5895
         Width           =   3165
      End
      Begin VB.Label lblM 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   20.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   6330
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5895
         Width           =   3165
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„Ã „œÌ‰"
         Height          =   195
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   5985
         Width           =   555
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„Ã œ«∆‰"
         Height          =   195
         Left            =   5715
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   5985
         Width           =   525
      End
      Begin VB.Label lblBal 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   20.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   6330
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   6390
         Width           =   3165
      End
      Begin VB.Label lblBalHead 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "’«›Ì «·√—»«Õ"
         Height          =   195
         Left            =   9525
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   6480
         Width           =   930
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰  «—ÌŒ"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   9735
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   802
         Width           =   660
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï  «—ÌŒ"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   6630
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   802
         Width           =   720
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„” ÊÏ"
         Height          =   195
         Left            =   3645
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   825
         Width           =   600
      End
   End
End
Attribute VB_Name = "Acc_Arbah"
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

Dim rs As New ADODB.Recordset
Dim rsAcc As New ADODB.Recordset
Dim RowCount As Long
Dim StartBal As Double
Dim accType As Integer
Dim step, HiddenRowsCount As Long
Const DAEN = 1
Const MADIN = 2
Dim maxLevel As Integer
Dim MSection As Integer
Dim DSection As Integer
Const KIND = 1

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String

Private Sub cmdSearch_Click()
    cmdSearch.Enabled = False
    Dim accNum As Long
    Dim sql, FromDate, toDate As String
    Dim cancel As Boolean
    FromDate = txtFrom.Value
    toDate = txtTo.Value
    resetAll
    HiddenRowsCount = 0
    
    pb.Value = 0
    lblStatus.Caption = "Ã«—Ì  Õ„Ì· «·„⁄·Ê„« .."
    DoEvents
    
    sql = "SELECT num,name,acc,dest,type,isnull(parent,0) as parent FROM Acc_Raisi" & Acc_DBYear & " WHERE dest=" & KIND & " Order By acc"
    Set rsAcc = ExecuteSelect(Conn, sql, cancel)
    pb.Value = 20
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        cmdSearch.Enabled = True
        Exit Sub
    End If
    
    sql = "set dateformat dmy SELECT count(distinct accNo) as n " & _
          "From Acc_Daily" & Acc_DBYear & " " & _
          "WHERE cDate>='" & FromDate & "' AND cDate<='" & toDate & "' AND AccDest=" & KIND

'    Debug.Print Sql
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        'Debug.Print Sql
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° Ì—ÃÏ «·„Õ«Ê·… „‰ ÃœÌœ"
        cmdSearch.Enabled = True
        Exit Sub
    End If
    RowCount = rsAcc.RecordCount + rs!N
'    Debug.Print sql
    pb.Value = 60
    rs.Close
    
    sql = "set dateformat dmy SELECT accNo, AccName, SUM(d) D,SUM(M) M, AccType,AccParent, AccDest " & _
          "From Acc_Daily" & Acc_DBYear & " " & _
          "WHERE cDate>='" & FromDate & "' AND cDate<='" & toDate & "'  AND AccDest= " & KIND & _
          "GROUP BY accNo, AccName, AccType, AccParent, AccDest " & _
          "Order by AccNo"

    Set rs = ExecuteSelect(Conn, sql, cancel)
    'Debug.Print Sql
    pb.Value = 100
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° Ì—ÃÏ «·„Õ«Ê·… „‰ ÃœÌœ"
        cmdSearch.Enabled = True
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "·„ Ì‰ Ã √Ì „⁄·Ê„«  ⁄‰ «·»ÕÀ"
        cmdSearch.Enabled = True
        Exit Sub
    End If
'    rsAcc.MoveLast: rsAcc.MoveFirst
'    rs.MoveLast: rs.MoveFirst
'    Debug.Print "RowCount    =" & RowCount & ", " & rs.RecordCount & ", " & rsAcc.RecordCount
    FillData
    rs.Close
    rsAcc.Close
    'MsgBox fg.Cols
    FillFormGrid fg, KIND
    cmdSearch.Enabled = True

End Sub

Private Sub Command2_Click()
    master_doPrint master.rs
End Sub

Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = currentDatabaseName
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    txtFrom.SetFocus
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    
    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName

    oldScaleWidth = 10920
    FormSettings = btPrint
    btnSettings = btPrint
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    'Dim Cancel As Boolean
    'Set master.rs = ExecuteSelect(conn, "My SQL", Cancel)
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    SetCaption Me
End Sub

Private Sub InitFrame()
    ' Lookups & Initialize stuff
    
    
    txtFrom.Value = "1/1/" & GetCurrentAccYear(Conn)
    txtTo.Value = Day(Date) & "/" & Month(Date) & "/" & GetCurrentAccYear(Conn)
    fg.DataMode = flexDMFree
    fg.Cols = 8
    fg.ColWidth(0) = 2005
    fg.ColWidth(1) = 2005
    fg.ColWidth(2) = 2005
    fg.ColWidth(3) = 2005
    fg.ColWidth(4) = 5000
    fg.Cell(flexcpText, 0, 0) = "„œÌ‰"
    fg.Cell(flexcpText, 0, 1) = "œ«∆‰"
    fg.Cell(flexcpText, 0, 2) = "„Ã „œÌ‰"
    fg.Cell(flexcpText, 0, 3) = "„Ã œ«∆‰"
    fg.Cell(flexcpText, 0, 4) = "«”„ «·Õ”«»"
    fg.ColAlignment(0) = flexAlignRightTop
    fg.ColAlignment(1) = flexAlignRightTop
    fg.ColAlignment(2) = flexAlignRightTop
    fg.ColAlignment(3) = flexAlignRightTop
    fg.ColAlignment(4) = flexAlignRightTop
    fg.ColHidden(0) = False
    fg.ColHidden(1) = False
    fg.ColHidden(2) = True
    fg.ColHidden(3) = True
    fg.ColHidden(5) = False
    fg.ColHidden(6) = False

    fga.Cols = 5
    fga.ColWidth(0) = 1500
    fga.ColWidth(1) = 2500
    fga.ColWidth(2) = 10
    fga.ColWidth(3) = 1500
    fga.ColWidth(4) = 2500
    fga.Cell(flexcpText, 0, 0) = "„Ã „œÌ‰"
    fga.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
    fga.Cell(flexcpText, 0, 3) = "„Ã œ«∆‰"
    fga.Cell(flexcpText, 0, 4) = "«”„ «·Õ”«»"
    
    fga.ColAlignment(0) = flexAlignRightTop
    fga.ColAlignment(1) = flexAlignRightTop
    fga.ColAlignment(2) = flexAlignRightTop
    fga.ColAlignment(3) = flexAlignRightTop
    fga.ColAlignment(4) = flexAlignRightTop

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
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fga.Cols - 1
        totWidth = totWidth + fga.ColWidth(i)
    Next
    For i = 0 To fga.Cols - 1
        fga.ColWidth(i) = fga.Width * fga.ColWidth(i) / totWidth
    Next
    
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    pForm = "Arbah"
    Set ToPrintForm = Me
    Acc_MasterRep.Show 1
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Function NoParentFound(parentStack As Variant, ByRef stacktop As Integer, ByVal parent As Long, stackValues As Variant) As Boolean
    Dim Top As Integer
    If parent = -1 Then
        NoParentFound = True
        Exit Function
    End If
    Top = stacktop - 1
    While Top > 0
        If parentStack(1, Top) = parent Then
            'needs to pop elements till the top element
            pop parentStack, stacktop, Top, stackValues
            stacktop = Top + 1
            NoParentFound = False
            Exit Function
        End If
        Top = Top - 1
    Wend
    'stacktop = top + 1
    NoParentFound = True
End Function

Private Function PadName(ByVal S As String, ByVal N) As String
'    Dim i As Integer
'    For i = 2 To N
'        S = "     " & S
'    Next i
    PadName = S
End Function

Private Sub pop(parentStack As Variant, ByVal Top As Integer, ByVal i As Integer, stackValues As Variant)
    Dim j As Integer
    Dim diff As Double
    'Dim difD, difM As Double
    j = Top - 1
    Do While j > i
        stackValues(0, j - 1) = stackValues(0, j - 1) + stackValues(0, j)
        stackValues(1, j - 1) = stackValues(1, j - 1) + stackValues(1, j)
        fg.Cell(flexcpText, parentStack(2, j), 2) = stackValues(0, j)
        fg.Cell(flexcpText, parentStack(2, j), 3) = stackValues(1, j)
        
        fg.Cell(flexcpText, parentStack(2, j), 0) = stackValues(2, j)
        fg.Cell(flexcpText, parentStack(2, j), 1) = stackValues(3, j)
        stackValues(3, j - 1) = stackValues(3, j - 1) + stackValues(3, j) 'diff
        stackValues(2, j - 1) = stackValues(2, j - 1) + stackValues(2, j) 'diff
        
'        diff = stackValues(2, j) - stackValues(3, j) 'M-D
'        If diff > 0 Then 'M
'            fg.Cell(flexcpText, parentStack(2, j), 0) = diff
'            stackValues(2, j - 1) = stackValues(2, j - 1) + diff
'        ElseIf diff < 0 Then 'D
'            fg.Cell(flexcpText, parentStack(2, j), 1) = -diff
'            stackValues(3, j - 1) = stackValues(3, j - 1) - diff
'        Else 'value is 0, determine where to put it according to the account type
'            If parentStack(3, j) = 1 Then 'parent is D
'                fg.Cell(flexcpText, parentStack(2, j), 1) = -diff
'                stackValues(3, j - 1) = stackValues(3, j - 1) - diff
'            Else 'M
'                fg.Cell(flexcpText, parentStack(2, j), 0) = diff
'                stackValues(2, j - 1) = stackValues(2, j - 1) + diff
'            End If
'        End If
        j = j - 1
    Loop
End Sub

Private Sub push(parentStack As Variant, ByRef Top As Integer, ByVal Num As Long, ByVal Row As Long, ByVal parent As Long, ByVal t As Integer, stackValues As Variant)
    Dim i As Integer
    i = Top - 1
    Do While i > 0 'pop till the relevant parant
        If parentStack(1, i) = parent Then
            Exit Do
        End If
        i = i - 1
    Loop
    
    'pop the stack till i
    pop parentStack, Top, i, stackValues
    
    Top = i + 1
    parentStack(0, Top) = parentStack(1, Top - 1)
    parentStack(1, Top) = Num
    parentStack(2, Top) = Row
    parentStack(3, Top) = t
    stackValues(0, Top) = 0: stackValues(1, Top) = 0: stackValues(2, Top) = 0: stackValues(3, Top) = 0
    
    'top = top + 1
    'Debug.Print "top=" & Top
End Sub

Private Sub FillData()
    If rs.EOF Then
        Exit Sub
    End If
    rs.MoveFirst
    
    Dim i, j, lastSumRow, cstep As Long
    Dim currSanad As String
    Dim D, M, SumM, sumD, TotalSumM, TotalSumD As Double
    Dim parentStack(4, 20) As Long '0: parent id, 1: id, 2: pos
    Dim stackValues(4, 20) As Double 'SumD and SumM values for each parent, D,M for each parent
    Dim stacktop As Integer
    Dim Level As Long
    Dim AccParent As Long
    If txtLevel.text = "" Then
        Level = 100
    Else
        Level = CLng(txtLevel.text)
    End If
    
    parentStack(0, 0) = 0: parentStack(0, 1) = 0: parentStack(0, 2) = 0: parentStack(0, 3) = 0: stackValues(0, 0) = 0: stackValues(1, 0) = 0: stackValues(2, 0) = 0: stackValues(3, 0) = 0
    stacktop = 1
    
    SumM = 0: sumD = 0: TotalSumM = 0: TotalSumD = 0
    currSanad = ""
    lastSumRow = -1
    i = 0
    step = CInt(RowCount / 100)
    cstep = step
    lblStatus.Caption = "Ã«—Ì  ‰”Ìﬁ ⁄—÷ «·„⁄·Ê„« .."
    DoEvents
    pb.Value = 0
    fg.Rows = RowCount + 1
    
    maxLevel = 0
    
    Dim freeAccount As Boolean
    While i < RowCount
        freeAccount = True
        If rs.EOF Then
            AccParent = -1
        Else
            AccParent = rs!AccParent
        End If
        Do While (Not rsAcc.EOF) And NoParentFound(parentStack, stacktop, AccParent, stackValues) And i < RowCount
            freeAccount = False
            push parentStack, stacktop, CLng(rsAcc!Num), i + 1, rsAcc!parent, rsAcc!Type, stackValues
            fg.TextMatrix(i + 1, 4) = PadName("(" & rsAcc!acc & ") " & rsAcc!name, stacktop)
            fg.TextMatrix(i + 1, 5) = rsAcc!Dest
            fg.TextMatrix(i + 1, 6) = stacktop
            fg.TextMatrix(i + 1, 7) = rsAcc!Type
            
            If stacktop > Level Then
                fg.RowHidden(i + 1) = True
                HiddenRowsCount = HiddenRowsCount + 1
            End If
            
            rsAcc.MoveNext
            If rsAcc.EOF Then
                i = i + 1
                stacktop = stacktop + 1
                Exit Do
            End If
            stacktop = stacktop + 1
            i = i + 1
            
            If maxLevel < stacktop Then
                maxLevel = stacktop
            End If
            
        Loop
        TotalSumM = 0: TotalSumD = 0
        If Not rs.EOF Then
            Do While i < RowCount And Not NoParentFound(parentStack, stacktop, rs!AccParent, stackValues)
                freeAccount = False
                If IsNull(rs.Fields(2).Value) Then
                    sumD = 0
                Else
                    sumD = rs.Fields(2).Value
                End If
                
                If IsNull(rs.Fields(3).Value) Then
                    SumM = 0
                Else
                    SumM = rs.Fields(3).Value
                End If
                If sumD - SumM > 0 Then 'D
                    fg.TextMatrix(i + 1, 1) = sumD - SumM
                    stackValues(3, stacktop - 1) = stackValues(3, stacktop - 1) + sumD - SumM
                ElseIf sumD - SumM < 0 Then
                    fg.TextMatrix(i + 1, 0) = SumM - sumD
                    stackValues(2, stacktop - 1) = stackValues(2, stacktop - 1) + SumM - sumD
                Else 'the sum is zero, put it according to the type
                    If rs!accType = 1 Then 'D
                        fg.TextMatrix(i + 1, 1) = sumD - SumM
                    Else 'M
                        fg.TextMatrix(i + 1, 0) = sumD - SumM
                    End If
                End If
'                If sumD - sumM > 0 Then 'D
'                    fg.TextMatrix(i + 1, 1) = sumD - sumM
'                    stackValues(3, stacktop - 1) = stackValues(3, stacktop - 1) + sumD - sumM
'                Else
'                    fg.TextMatrix(i + 1, 0) = sumM - sumD
'                    stackValues(2, stacktop - 1) = stackValues(2, stacktop - 1) + sumM - sumD
'                End If
                stackValues(0, stacktop - 1) = stackValues(0, stacktop - 1) + SumM
                stackValues(1, stacktop - 1) = stackValues(1, stacktop - 1) + sumD
                
                fg.TextMatrix(i + 1, 2) = SumM
                fg.TextMatrix(i + 1, 3) = sumD
                fg.TextMatrix(i + 1, 4) = PadName(CStr(rs.Fields(1).Value & ""), stacktop)
                fg.TextMatrix(i + 1, 5) = rs!AccDest
                fg.TextMatrix(i + 1, 6) = stacktop
                fg.TextMatrix(i + 1, 7) = rs!accType
                If maxLevel < stacktop Then
                    maxLevel = stacktop
                End If
                
                If stacktop > Level Then
                    fg.RowHidden(i + 1) = True
                    HiddenRowsCount = HiddenRowsCount + 1
                End If
                
                rs.MoveNext
                If rs.EOF Then
                    i = i + 1
                    Exit Do
                End If
                If i >= cstep Then
                    If pb.Value <> 100 Then
                        pb.Value = pb.Value + 1
                        cstep = cstep + step
                    End If
                End If
                i = i + 1
            Loop
            If freeAccount Then
                If Not rs.EOF Then
                    If IsNull(rs.Fields(2).Value) Then
                        sumD = 0
                    Else
                        sumD = rs.Fields(2).Value
                    End If
                    
                    If IsNull(rs.Fields(3).Value) Then
                        SumM = 0
                    Else
                        SumM = rs.Fields(3).Value
                    End If
                    If sumD - SumM > 0 Then 'D
                        fg.TextMatrix(i + 1, 1) = sumD - SumM
                        stackValues(3, 0) = stackValues(3, 0) + sumD - SumM
                    ElseIf sumD - SumM < 0 Then
                        fg.TextMatrix(i + 1, 0) = SumM - sumD
                        stackValues(2, 0) = stackValues(2, 0) + SumM - sumD
                    Else 'the sum is zero, put it according to the type
                        If rs!accType = 1 Then 'D
                            fg.TextMatrix(i + 1, 1) = sumD - SumM
                        Else 'M
                            fg.TextMatrix(i + 1, 0) = sumD - SumM
                        End If
                    End If
                    stackValues(0, 0) = stackValues(0, 0) + SumM
                    stackValues(1, 0) = stackValues(1, 0) + sumD
                    
                    fg.TextMatrix(i + 1, 2) = SumM
                    fg.TextMatrix(i + 1, 3) = sumD
                    fg.TextMatrix(i + 1, 4) = PadName(CStr(rs.Fields(1).Value & ""), 1)
                    fg.TextMatrix(i + 1, 5) = rs!AccDest
                    fg.TextMatrix(i + 1, 6) = 1
                    fg.TextMatrix(i + 1, 7) = rs!accType
                    If maxLevel < stacktop Then
                        maxLevel = stacktop
                    End If
                    
                    rs.MoveNext
                    If Not rs.EOF Then
                        If i >= cstep Then
                            If pb.Value <> 100 Then
                                pb.Value = pb.Value + 1
                                cstep = cstep + step
                            End If
                        End If
                    End If
                    i = i + 1
                Else
                    MsgBox "ÌÊÃœ Œÿ√ ›Ì  ÊÃÌÂ Õ”«»«  «·‘Ã—…° «·—Ã«¡ ≈⁄«œ… «· Õﬁﬁ „‰Â«"
                    Exit Sub
                End If
            End If
        End If
    Wend
    
    pop parentStack, stacktop, 0, stackValues 'pop every thing in the stack
    
    stacktop = 0
    pb.Value = 100
    lblStatus.Caption = "⁄œœ «·”Ã·«  «·„⁄—Ê÷…: " & RowCount - HiddenRowsCount
    
    If maxLevel > Level Then
        maxLevel = Level
    End If
    lblM.Caption = stackValues(2, 0)
    lblD.Caption = stackValues(3, 0)
    Dim bal As Double
    bal = stackValues(3, 0) - stackValues(2, 0)
    If bal < 0 Then 'Faild
        lblBal.Caption = -bal
        lblBalHead.Caption = "’«›Ì «·Œ”«—…"
    Else
        lblBal.Caption = bal
        lblBalHead.Caption = "’«›Ì «·—»Õ"
    End If
    
End Sub

Private Sub resetAll()
    fg.Rows = 1
    fga.Rows = 1
    lblM.Caption = 0
    lblD.Caption = 0
    lblStatus.Caption = "„ƒ‘— Õ«·…  ﬁœ„ ⁄„·Ì… «·„⁄«Ì‰…"
    pb.Value = 0
'    txtType.text = ""
End Sub

Private Sub FillFormGrid(fg As VSFlexGrid, KIND As Integer)
    Dim i, Dj, Mj, Col As Long
    Dj = 1: Mj = 1
    fga.Clear
    SetGridColumns fga, maxLevel, MSection, DSection
    fga.Rows = fg.Rows
    
    Dim Mval, DVal, bal As Double
    
    For i = 1 To fg.Rows - 1
        If Not fg.RowHidden(i) And fg.Cell(flexcpText, i, 5) = KIND Then
            Mval = GetDoubleValue(fg.Cell(flexcpText, i, 0)) 'The second parameter is the default parameter
            DVal = GetDoubleValue(fg.Cell(flexcpText, i, 1))
            bal = Mval - DVal
            
            If Mval <> 0 Then
                Col = MSection + CInt(fg.Cell(flexcpText, i, 6)) - 1
                fga.Cell(flexcpText, Mj, DSection - 2) = fg.Cell(flexcpText, i, 4)
                fga.Cell(flexcpText, Mj, Col) = fg.Cell(flexcpText, i, 0)
                Mj = Mj + 1
                If bal < 0 Then
                    fga.Cell(flexcpText, Mj, DSection - 2) = fga.Cell(flexcpText, Mj, DSection - 2) & "/„œÌ‰"
                End If
            End If
            If DVal <> 0 Then
                Col = DSection + CInt(fg.Cell(flexcpText, i, 6)) - 1
                fga.Cell(flexcpText, Dj, Col) = fg.Cell(flexcpText, i, 1)
                fga.Cell(flexcpText, Dj, DSection + maxLevel) = fg.Cell(flexcpText, i, 4)
                Dj = Dj + 1
                If bal > 0 Then
                    fga.Cell(flexcpText, Dj, DSection + maxLevel) = fga.Cell(flexcpText, Dj, DSection + maxLevel) & "/œ«∆‰"
                End If
            End If
            
'            If (fg.Cell(flexcpText, i, 0) <> "") Then
                'put the value in the right colum according to the leve (1->0) with offset=MSetion: start of the Madin section
'                Col = MSection + CInt(fg.Cell(flexcpText, i, 6)) - 1
'                fga.Cell(flexcpText, Mj, Col) = fg.Cell(flexcpText, i, 0)
'                fga.Cell(flexcpText, Mj, DSection - 2) = fg.Cell(flexcpText, i, 4)
'                Mj = Mj + 1
'            ElseIf (fg.Cell(flexcpText, i, 1) <> "") Then
'                Col = DSection + CInt(fg.Cell(flexcpText, i, 6)) - 1
'                fga.Cell(flexcpText, Dj, Col) = fg.Cell(flexcpText, i, 1)
'                fga.Cell(flexcpText, Dj, DSection + maxLevel) = fg.Cell(flexcpText, i, 4)
'                Dj = Dj + 1
'            Else 'Both are 0, check the type of the account
'                If fg.Cell(flexcpText, i, 7) = DAEN Then 'type is Daen
'                    Col = MSection + CInt(fg.Cell(flexcpText, i, 6)) - 1
'                    fga.Cell(flexcpText, Mj, Col) = fg.Cell(flexcpText, i, 1)
'                    fga.Cell(flexcpText, Mj, DSection - 2) = fg.Cell(flexcpText, i, 4)
'                    Mj = Mj + 1
'                Else 'for all other accounts,it is /madin (default)
'                    Col = DSection + CInt(fg.Cell(flexcpText, i, 6)) - 1
'                    fga.Cell(flexcpText, Dj, Col) = fg.Cell(flexcpText, i, 0)
'                    fga.Cell(flexcpText, Dj, DSection + maxLevel) = fg.Cell(flexcpText, i, 4)
'                    Dj = Dj + 1
'                End If
'            End If
        End If
    Next i
    
    Dim motagara As Double
    motagara = GetMotagara()
    Dim balD, balM As Double
    balM = CDbl(lblM.Caption)
    balD = CDbl(lblD.Caption)
    If motagara < 0 Then
        Col = MSection
        fga.Cell(flexcpText, Mj, Col) = -motagara
        fga.Cell(flexcpText, Mj, DSection - 2) = "«·„ «Ã—…"
        balM = balM - motagara
        lblM.Caption = balM
        Mj = Mj + 1
    Else
        Col = DSection
        fga.Cell(flexcpText, Dj, Col) = motagara
        fga.Cell(flexcpText, Dj, DSection + maxLevel) = "«·„ «Ã—…"
        balD = balD + motagara
        lblD.Caption = balD
        Dj = Dj + 1
    End If
    bal = balD - balM
    If bal < 0 Then 'Faild
        lblBal.Caption = -bal
        lblBalHead.Caption = "’«›Ì «·Œ”«—…"
    Else
        lblBal.Caption = bal
        lblBalHead.Caption = "’«›Ì «·—»Õ"
    End If
    
    If Mj > Dj Then
        fga.Rows = Mj
    Else
        fga.Rows = Dj
    End If
End Sub

Private Sub SetGridColumnsOld(fga As VSFlexGrid, maxLevel As Integer)
    fga.Cols = (maxLevel + 1) * 2 + 1
    MSection = 0
    DSection = maxLevel + 2
    
    fga.ColWidth(DSection - 1) = 10 'separator
    fga.ColHidden(DSection - 1) = True
    fga.ColWidth(DSection - 2) = 2500
    fga.Cell(flexcpText, 0, DSection - 2) = "«”„ «·Õ”«»"
    fga.ColAlignment(DSection - 2) = flexAlignRightTop
    
    fga.ColWidth(DSection + maxLevel) = 2500
    fga.Cell(flexcpText, 0, DSection + maxLevel) = "«”„ «·Õ”«»"
    fga.ColAlignment(DSection + maxLevel) = flexAlignRightTop
    
    fga.ColWidth(MSection) = 1500
    fga.Cell(flexcpText, 0, MSection) = "„Ã „œÌ‰"
    fga.ColAlignment(MSection) = flexAlignRightTop
    
    fga.ColWidth(DSection) = 1500
    fga.Cell(flexcpText, 0, DSection) = "„Ã œ«∆‰"
    fga.ColAlignment(DSection) = flexAlignRightTop

    Dim i As Integer
    For i = 1 To maxLevel - 1
        fga.ColWidth(MSection + i) = 1500
        fga.Cell(flexcpText, 0, MSection + i) = " ›«’Ì·"
        fga.ColAlignment(MSection + i) = flexAlignRightTop
        
        fga.ColWidth(DSection + i) = 1500
        fga.Cell(flexcpText, 0, DSection + i) = " ›«’Ì·"
        fga.ColAlignment(DSection + i) = flexAlignRightTop
    Next i

End Sub

Private Function GetMotagara() As Double
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    sql = "set dateformat dmy select IsNull(sum(IsNull(D,0)-IsNull(M,0)),0) as bal from acc_Daily" & Acc_DBYear & " where AccDest=2 and cDate BETWEEN '" & txtFrom.Value & "' AND '" & txtTo.Value & "'"
    Set rs = ExecuteSelect(Conn, sql, cancel)
    Debug.Print sql
    If rs.EOF Then
        GetMotagara = 0
    Else
        GetMotagara = rs!bal
    End If
End Function

Private Sub txtFrom_Change()
    resetAll
End Sub

Private Sub txtLevel_Validate(cancel As Boolean)
    If Not IsNumeric(txtLevel.text) And txtLevel.text <> "" Then
        txtLevel.text = ""
    End If
End Sub

Private Sub txtTo_Change()
    resetAll
End Sub
