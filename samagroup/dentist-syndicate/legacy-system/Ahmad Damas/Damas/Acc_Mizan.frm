VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_Mizan 
   BackColor       =   &H00E1FEFF&
   Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
   ClientHeight    =   7350
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11400
   Icon            =   "Acc_Mizan.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7350
   ScaleWidth      =   11400
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì—"
      Height          =   375
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   6360
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
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   6360
      Width           =   1400
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
      Height          =   6855
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   0
      Width           =   11175
      Begin VB.OptionButton optBoth 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»«·√—’œ… Ê«·„Ã«„Ì⁄"
         Height          =   255
         Left            =   1320
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   1080
         Width           =   1935
      End
      Begin VB.OptionButton optSums 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»«·„Ã«„Ì⁄"
         Height          =   255
         Left            =   2160
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   840
         Width           =   1095
      End
      Begin VB.OptionButton optRasid 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»«·√—’œ…"
         Height          =   255
         Left            =   2280
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   600
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.CheckBox chkBalanced 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈ŸÂ«— «·Õ”«»«  «·„—’œ…"
         Height          =   255
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   600
         Value           =   1  'Checked
         Width           =   2055
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
         Width           =   10935
      End
      Begin VB.TextBox txtLevel 
         Alignment       =   1  'Right Justify
         Height          =   495
         Left            =   6600
         MaxLength       =   2
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   480
         Width           =   855
      End
      Begin VB.TextBox txtAcc 
         Alignment       =   1  'Right Justify
         Height          =   495
         Left            =   3480
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   480
         Width           =   1935
      End
      Begin MSComctlLib.ProgressBar pb 
         Height          =   255
         Left            =   3480
         TabIndex        =   4
         Top             =   1110
         Visible         =   0   'False
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4095
         Left            =   120
         TabIndex        =   9
         Top             =   1560
         Width           =   10935
         _cx             =   19288
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
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Acc_Mizan.frx":1CFA
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
      Begin MSComCtl2.DTPicker txtFrom 
         Height          =   375
         Left            =   8760
         TabIndex        =   17
         Top             =   550
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40095
      End
      Begin MSComCtl2.DTPicker txtTo 
         Height          =   375
         Left            =   8760
         TabIndex        =   18
         Top             =   1050
         Width           =   1455
         _ExtentX        =   2566
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
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   1110
         Visible         =   0   'False
         Width           =   2130
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H80000001&
         Height          =   975
         Left            =   120
         Top             =   480
         Width           =   3255
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
         Left            =   6360
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5760
         Width           =   2295
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
         Left            =   8760
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5760
         Width           =   2295
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   195
         Left            =   10515
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   5850
         Width           =   540
      End
      Begin VB.Label lblSumM 
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
         Left            =   2520
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5760
         Width           =   2295
      End
      Begin VB.Label lblSumD 
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
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5760
         Width           =   2295
      End
      Begin VB.Label lblRasid 
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
         Left            =   6360
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   6360
         Width           =   2295
      End
      Begin VB.Label lblRasidTitle 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—’Ìœ"
         Height          =   195
         Left            =   9345
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   6450
         Width           =   1035
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰  «—ÌŒ"
         Height          =   195
         Left            =   10455
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   600
         Width           =   600
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   195
         Left            =   10380
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1080
         Width           =   675
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„” ÊÏ"
         Height          =   195
         Left            =   7575
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   630
         Width           =   600
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "··Õ”«»"
         Height          =   195
         Left            =   5625
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   630
         Width           =   510
      End
   End
End
Attribute VB_Name = "Acc_Mizan"
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
Dim lblSumMLeft, lblSumDLeft As Long

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String

Private Sub chkBalanced_Click()
    resetAll
End Sub

Private Sub cmdSearch_Click()
    cmdSearch.Enabled = False
    Dim accNum As Long
    Dim sql, FromDate, toDate As String
    Dim cancel As Boolean
    FromDate = txtFrom.Value
    toDate = txtTo.Value
    resetAll
    HiddenRowsCount = 0
    If optRasid.Value = True Then
        fg.ColHidden(0) = False
        fg.ColHidden(1) = False
        fg.ColHidden(2) = True
        fg.ColHidden(3) = True
        lblM.visible = True
        lblD.visible = True
        lblSumM.visible = False
        lblSumD.visible = False
    ElseIf optSums.Value = True Then
        fg.ColHidden(0) = True
        fg.ColHidden(1) = True
        fg.ColHidden(2) = False
        fg.ColHidden(3) = False
        lblM.visible = False
        lblD.visible = False
        lblSumM.visible = True
        lblSumM.Left = lblM.Left
        lblSumD.visible = True
        lblSumD.Left = lblD.Left
    ElseIf optBoth.Value = True Then
        fg.ColHidden(0) = False
        fg.ColHidden(1) = False
        fg.ColHidden(2) = False
        fg.ColHidden(3) = False
        lblM.visible = True
        lblD.visible = True
        lblSumM.visible = True
        lblSumM.Left = lblSumMLeft
        lblSumD.visible = True
        lblSumD.Left = lblSumDLeft
    End If
    
    pb.Value = 0
    lblStatus.Caption = "Ã«—Ì  Õ„Ì· «·„⁄·Ê„« .."
    DoEvents
    
    sql = "SELECT num,name,acc,dest,type,isnull(parent,0) as parent FROM Acc_Raisi" & Acc_DBYear & " Order By acc"
    Set rsAcc = ExecuteSelect(Conn, sql, cancel)
    pb.Value = 20
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        cmdSearch.Enabled = True
        Exit Sub
    End If
    
    sql = "set dateformat dmy SELECT count(distinct accNo) as n " & _
          "From Acc_Daily" & Acc_DBYear & " " & _
          "WHERE cDate>='" & FromDate & "' AND cDate<='" & toDate & "' "

'    Debug.Print Sql
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
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
          "WHERE cDate>='" & FromDate & "' AND cDate<='" & toDate & "' " & _
          "GROUP BY accNo, AccName, AccType, AccParent, AccDest " & _
          "Order by AccNo"

    Set rs = ExecuteSelect(Conn, sql, cancel)
'    Debug.Print Sql
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
    cmdSearch.Enabled = True
    ResizeGrid fg
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

    oldScaleWidth = 11520
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
    Dim CurrentAccYear As String
    CurrentAccYear = GetCurrentAccYear(Conn)
    SetCaption Me
    txtFrom.Value = "01/01/" & CurrentAccYear
    txtTo.Value = "31/12/" & CurrentAccYear
    
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    
    
    txtFrom.Value = "1/1/" & GetCurrentAccYear(Conn)
    txtTo.Value = Day(Date) & "/" & Month(Date) & "/" & GetCurrentAccYear(Conn)
    fg.DataMode = flexDMFree
    fg.Cols = 7
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
    fg.ColHidden(4) = False
    fg.ColHidden(5) = True
    fg.ColHidden(6) = True

    lblSumMLeft = lblSumM.Left: lblSumDLeft = lblSumD.Left:

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
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    pForm = "Mizan"
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

        fg.Cell(flexcpText, parentStack(2, j), 0) = stackValues(2, j)
        fg.Cell(flexcpText, parentStack(2, j), 1) = stackValues(3, j)
       'diff = stackValues(1, j) - stackValues(0, j)
        'If diff > 0 Then 'D
            stackValues(3, j - 1) = stackValues(3, j - 1) + stackValues(3, j) 'diff
        'Else
            stackValues(2, j - 1) = stackValues(2, j - 1) + stackValues(2, j) 'diff
        'End If
        'If chkBalanced.Value=0 and stackValues(1, j) = stackValues(0, j) Then
        '    fg.RowHidden(parentStack(2, j)) = True
        'End If
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
    Debug.Print "top=" & Top
End Sub

Private Function getLevelColor(ByVal Level As Integer) As Long
    Dim Color As Long
    Select Case Level
        Case 1: Color = &HC0&          '&HC0&  '&H2D7E1
        Case 2: Color = &H0
'        Case 3: color = &H8000&
'        Case 4: color = &H808000
'        Case 5: color = &H404040
'        Case 6: color = &H404040
'        Case 7: color = &H404040
'        Case 8: color = &H404040
'        Case 9: color = &H404040
'        Case 10: color = &H404040
        'Else
        '    color = &H404040
    End Select
    getLevelColor = Color
End Function

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
    While i < RowCount
        If rs.EOF Then
            AccParent = -1
        Else
            AccParent = rs!AccParent
        End If
        Do While (Not rsAcc.EOF) And NoParentFound(parentStack, stacktop, AccParent, stackValues) And i < RowCount
            'Debug.Print rs!AccParent & "," & rsAcc!Num
            push parentStack, stacktop, CLng(rsAcc!Num), i + 1, rsAcc!parent, rsAcc!Type, stackValues
                'Debug.Print "after top=" & stacktop
            fg.TextMatrix(i + 1, 4) = PadName("(" & rsAcc!acc & ") " & rsAcc!name, stacktop)
            fg.TextMatrix(i + 1, 5) = rsAcc!Dest
            fg.TextMatrix(i + 1, 6) = stacktop
            fg.Cell(flexcpFontBold, i + 1, 0, i + 1, 3) = True
            fg.Cell(flexcpForeColor, i + 1, 0, i + 1, 4) = getLevelColor(1)
            fg.Cell(flexcpBackColor, i + 1, 0, i + 1, 4) = &HE1FEFF
            
            If stacktop > Level Then
                fg.RowHidden(i + 1) = True
                HiddenRowsCount = HiddenRowsCount + 1
            End If
            
            If txtAcc.text <> "" And InStr(rsAcc!acc, txtAcc.text) <> 1 Then
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
        Loop
        TotalSumM = 0: TotalSumD = 0
        If Not rs.EOF Then
            Do While i < RowCount And Not NoParentFound(parentStack, stacktop, rs!AccParent, stackValues)
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
                If txtAcc.text <> "" And InStr(rs!AccNo, txtAcc.text) <> 1 Then
                    fg.RowHidden(i + 1) = True
                    HiddenRowsCount = HiddenRowsCount + 1
                Else
                    Dim diff As Double
                    diff = sumD - SumM
                    If diff > 0 Then 'D
                        fg.TextMatrix(i + 1, 1) = diff
                        stackValues(3, stacktop - 1) = stackValues(3, stacktop - 1) + diff
                    ElseIf diff < 0 Then
                        diff = -diff
                        fg.TextMatrix(i + 1, 0) = diff
                        stackValues(2, stacktop - 1) = stackValues(2, stacktop - 1) + diff
                    Else 'the sum is zero, put it according to the type
                        If rs!accType = 1 Then 'D
                            fg.TextMatrix(i + 1, 1) = diff
                        Else 'M
                            diff = -diff
                            fg.TextMatrix(i + 1, 0) = diff
                        End If
                    End If
                    
                    
                    stackValues(0, stacktop - 1) = stackValues(0, stacktop - 1) + SumM
                    stackValues(1, stacktop - 1) = stackValues(1, stacktop - 1) + sumD
                    
                    fg.TextMatrix(i + 1, 2) = SumM
                    fg.TextMatrix(i + 1, 3) = sumD
                    fg.TextMatrix(i + 1, 4) = PadName(CStr(rs.Fields(1).Value & ""), stacktop)
                    fg.TextMatrix(i + 1, 5) = rs!AccDest
                    fg.TextMatrix(i + 1, 6) = stacktop
                    fg.Cell(flexcpForeColor, i + 1, 4) = getLevelColor(2)
                    fg.Cell(flexcpFontBold, i + 1, 0, i + 1, 3) = True
                    fg.Cell(flexcpForeColor, i + 1, 0) = vbBlue
                    fg.Cell(flexcpForeColor, i + 1, 1) = vbRed
                    fg.Cell(flexcpForeColor, i + 1, 2) = vbBlue
                    fg.Cell(flexcpForeColor, i + 1, 3) = vbRed
                    'fg.RowHidden(i + 1) = False
                    If chkBalanced.Value = 0 And SumM = sumD Then
                        fg.RowHidden(i + 1) = True
                        HiddenRowsCount = HiddenRowsCount + 1
                    End If
                    
                    If stacktop > Level Then
                        fg.RowHidden(i + 1) = True
                        HiddenRowsCount = HiddenRowsCount + 1
                    End If
                End If
'                If txtAcc.text <> "" And InStr(rs!AccNo, txtAcc.text) <> 1 Then
'                    fg.RowHidden(i + 1) = True
'                    HiddenRowsCount = HiddenRowsCount + 1
'                End If
                
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
        End If
    Wend
    
    pop parentStack, stacktop, 0, stackValues 'pop every thing in the stack
    
    stacktop = 0
'    If optRasid.Value = True Then
        lblM.Caption = stackValues(2, 0)
        lblD.Caption = stackValues(3, 0)
'    Else
        lblSumM.Caption = stackValues(0, 0)
        lblSumD.Caption = stackValues(1, 0)
'    End If
    Dim R As Double
    R = stackValues(2, 0) - stackValues(3, 0)
    If R < 0.001 And R > -0.001 Then
        R = 0
    End If
    If R < 0 Then
        lblRasidTitle.Caption = "«·—’Ìœ œ«∆‰"
        R = Abs(R)
    ElseIf R > 0 Then
        lblRasidTitle.Caption = "«·—’Ìœ „œÌ‰"
    Else
        lblRasidTitle.Caption = "«·—’Ìœ"
    End If
    lblRasid.Caption = R
    
    pb.Value = 100
    lblStatus.Caption = "⁄œœ «·”Ã·«  «·„⁄—Ê÷…: " & RowCount - HiddenRowsCount
    Debug.Print RowCount
    Debug.Print HiddenRowsCount
    Debug.Print fg.Rows
End Sub

Private Sub optBoth_Click()
    chkBalanced.Value = 1 'Always show all the accounts
    chkBalanced.Enabled = False
    lblM.visible = True
    lblD.visible = True
    lblSumM.visible = True
    lblSumD.visible = True
    
'    optSums.Value = Not optSums.Value
    resetAll
End Sub

Private Sub optRasid_Click()
'    fg.ColHidden(0) = False
'    fg.ColHidden(1) = False
'    fg.ColHidden(2) = True
'    fg.ColHidden(3) = True
'    fg.Rows = 1
'    chkBalanced.Value = 1
    lblM.visible = True
    lblD.visible = True
    lblSumM.visible = False
    lblSumD.visible = False
    
    chkBalanced.Enabled = True
'    optRasid.Value = Not optRasid.Value
    resetAll
End Sub

Private Sub optSums_Click()
'    fg.ColHidden(0) = True
'    fg.ColHidden(1) = True
'    fg.ColHidden(2) = False
'    fg.ColHidden(3) = False
'    fg.Rows = 1
    lblM.visible = False
    lblD.visible = False
    lblSumM.visible = True
    lblSumD.visible = True
    
    chkBalanced.Value = 1 'Always show all the accounts
    chkBalanced.Enabled = False
'    optSums.Value = Not optSums.Value
    resetAll
End Sub

Private Sub txtAcc_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 116 Then
        Dim cancel As Boolean
        txtAcc.text = " "
        txtAcc_Validate cancel
    End If
End Sub

Private Sub txtAcc_Validate(cancel As Boolean)
    Dim c As Boolean
'    If master.State = 0 Then Exit Sub
    Dim acc As String
    acc = txtAcc.text
    If acc <> "" Then
       Dim numeric As Boolean
       numeric = IsNumeric(acc)
       If numeric Then 'He entered the number of the account
           Set rs = ExecuteSelect(Conn, "select type,acc,name from Acc_raisi" & Acc_DBYear & " where acc='" & acc & "'", c)
       ElseIf InStr(1, acc, "(") > 0 Then
           Set rs = ExecuteSelect(Conn, "select type,acc,name from Acc_raisi" & Acc_DBYear & " where '('+acc+') '+name like '" & acc & "'", c)
       Else
           Set rs = ExecuteSelect(Conn, "select type,acc,name from Acc_raisi" & Acc_DBYear & " where name like '" & acc & "'", c)
       End If
       If c Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            cancel = True
            Exit Sub
       End If
       If rs.RecordCount <> 1 Then
            rs.Close
            If numeric Then 'He entered the number of the account
                Set rs = ExecuteSelect(Conn, "select type,acc,name from Acc_raisi" & Acc_DBYear & " where acc='%" & acc & "%'", c)
            Else
                Set rs = ExecuteSelect(Conn, "select type,acc,name from Acc_raisi" & Acc_DBYear & " where name like '%" & acc & "%'", c)
            End If
            If c Then
                 MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
                 cancel = True
                 Exit Sub
            End If
            If rs.RecordCount <> 1 Then
                   GLOBAL_TAG = ";datafield=,0:acc,1:name,2:type,;"
                   GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetGridAcc,1:SetGridName,2:SetType,;"
                   If numeric Then
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & acc & ",;"
                   Else
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & acc & ",;"
                   End If
                   GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select acc,name, type from Acc_raisi" & Acc_DBYear & ";"
                  btnSettings = GetBtnSettings
                   Clin_List.fg.Cols = 3
                   Clin_List.fg.ColHidden(2) = True: Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
                   Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
                   Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                   Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
                    Clin_List.fg.Row = 1
                   If numeric Then
                        Clin_List.fg.Col = 0
                   Else
                        Clin_List.fg.Col = 1
                   End If
                   Set Clin_List.CallerForm = Me
                   txtAcc.text = ""
                   'lblAccount.Caption = ""
                   'txtType.text = ""
                   Clin_List.Show 1
                   RefreshCommands btnSettings And FormSettings
                   If txtAcc.text = "" Then cancel = True
                   Exit Sub
            End If
       End If 'rs.RecordCount <> 1
       txtAcc.text = rs!acc ' & ") " & rs!Name
       'lblAccount.Caption = "ﬂ‘› Õ”«»: " & rs!Name
       'txtType.text = rs!Type
    End If
End Sub

Public Sub SetGridAcc(val As String)
    txtAcc.text = val
End Sub
Public Sub SetGridName(val As String)
'    lblAccount.Caption = "ﬂ‘› Õ”«»: " & val
End Sub
Public Sub SetType(val As String)
'    txtType.text = val
End Sub

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

Private Sub resetAll()
    fg.Rows = 1
    lblM.Caption = 0
    lblD.Caption = 0
    lblSumM.Caption = 0
    lblSumD.Caption = 0
    lblRasid.Caption = 0
    lblStatus.Caption = "„ƒ‘— Õ«·…  ﬁœ„ ⁄„·Ì… «·„⁄«Ì‰…"
    pb.Value = 0
'    txtType.text = ""
End Sub
