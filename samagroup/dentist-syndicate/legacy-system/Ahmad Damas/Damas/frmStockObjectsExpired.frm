VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmStockObjectsExpired 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·„Ê«œ „‰ ÂÌ… «·’·«ÕÌ…"
   ClientHeight    =   7515
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9600
   Icon            =   "frmStockObjectsExpired.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7515
   ScaleWidth      =   9600
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame1 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„Ê«œ"
      Height          =   4575
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   ";repeat=true;"
      Top             =   2880
      Width           =   9375
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4215
         Left            =   120
         TabIndex        =   9
         Tag             =   ";typeof=vsflexgrid;datafield=,0:id,1:name,;check=,0:Integer > 0,0:required,1:required,;"
         Top             =   240
         Width           =   9135
         _cx             =   16113
         _cy             =   7435
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
         BackColor       =   16777215
         ForeColor       =   -2147483640
         BackColorFixed  =   -2147483633
         ForeColorFixed  =   -2147483630
         BackColorSel    =   -2147483635
         ForeColorSel    =   -2147483634
         BackColorBkg    =   -2147483636
         BackColorAlternate=   16777215
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
         FormatString    =   $"frmStockObjectsExpired.frx":1CFA
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
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„Ã„Ê⁄… «·—∆Ì”Ì…"
      Height          =   2775
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   9375
      Begin VB.CommandButton CmdPrint 
         BackColor       =   &H00E0E0E0&
         Caption         =   "ÿ»«⁄…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1080
         Width           =   1665
      End
      Begin VB.CommandButton CmdPreview 
         BackColor       =   &H00E0E0E0&
         Caption         =   "„⁄«Ì‰…"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   600
         Width           =   1665
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
         Width           =   9135
      End
      Begin MSComCtl2.DTPicker dtExpire 
         Height          =   375
         Left            =   6720
         TabIndex        =   11
         Top             =   840
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.TextBox TxtGroup 
         Alignment       =   1  'Right Justify
         Enabled         =   0   'False
         Height          =   375
         Left            =   3600
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   2160
         Width           =   5250
      End
      Begin VB.CommandButton CmdGroupHelp 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Enabled         =   0   'False
         Height          =   375
         Left            =   3270
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   2160
         Width           =   325
      End
      Begin VB.OptionButton opSubGroup 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„Ã„Ê⁄«  «·Ã“∆Ì… ÷„‰ «·„Ã„Ê⁄… «· «·Ì…:"
         Height          =   255
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   1800
         Width           =   3615
      End
      Begin VB.OptionButton opAllGroups 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "ﬂ«›… «·„Ã„Ê⁄« ."
         Height          =   255
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   1440
         Value           =   -1  'True
         Width           =   2895
      End
      Begin VB.TextBox TxtGroupId 
         Alignment       =   1  'Right Justify
         DataField       =   "Group"
         Height          =   375
         Left            =   8280
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   2040
         Visible         =   0   'False
         Width           =   465
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H8000000F&
         Height          =   1335
         Left            =   3120
         Top             =   1320
         Width           =   6135
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈ŸÂ«— «·„Ê«œ «· Ì  ‰ ÂÌ ’·«ÕÌ Â« ﬁ»·"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   16
         Left            =   6630
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   570
         Width           =   2580
      End
   End
End
Attribute VB_Name = "frmStockObjectsExpired"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim WithEvents dlgGroups As dlgStockGroupSelect
Attribute dlgGroups.VB_VarHelpID = -1

Dim oldScaleWidth As Long
Public rs As ADODB.Recordset

Private Sub CmdGroupHelp_Click()
    Set dlgGroups = New dlgStockGroupSelect
    dlgGroups.Show 1
End Sub

Private Sub CmdPreview_Click()
    Dim strGroup As String
    If opSubGroup.Value And (Trim(TxtGroupId.text) <> "") Then
        strGroup = TxtGroupId.text
    Else
        strGroup = "NULL"
    End If
    Dim sql As String
    Dim cancel As Boolean
    sql = getSql(strGroup)
    Set rs = ExecuteSelect(Conn, sql, cancel)
    fg.DataMode = flexDMBoundBatch
    Set fg.DataSource = rs
    If fg.Rows > 1 Then
        fg.Cell(flexcpBackColor, 1, 6, fg.Rows - 1, 6) = &HE1FEFF
        fg.Cell(flexcpForeColor, 1, 6, fg.Rows - 1, 6) = vbRed
    End If
    ResizeGrid
    CmdPreview.Caption = " ÕœÌÀ"
    cmdPrint.Enabled = True
End Sub

Private Sub CmdPrint_Click()
    ShowReport
End Sub

Private Sub dlgGroups_OnClosingDialog(theGrid As VSFlex7Ctl.VSFlexGrid, cancel As Boolean)
    If dlgGroups.result Then
        UnBoundGrid
        Dim R As Long
        R = theGrid.Row
        SetGroupId theGrid.TextMatrix(R, 3)
        SetGroupName theGrid.TextMatrix(R, 0)
    End If
End Sub

Private Sub dtExpire_Change()
    UnBoundGrid
End Sub

Private Sub Form_Activate()
    RefreshCommands 0
    ActiveDatabaseName = "Stock"
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9720
    FormatForm Me
    dtExpire.Value = Now
    Set rs = Nothing
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
    
    ' Resize the grid fg
    ResizeGrid
End Sub

Public Sub SetGroupId(val As String)
    TxtGroupId.text = val
End Sub

Public Sub SetGroupName(val As String)
    TxtGroup.text = val
End Sub

Private Sub opAllGroups_Click()
    UnBoundGrid
    TxtGroup.Enabled = False
    CmdGroupHelp.Enabled = False
End Sub

Private Sub opSubGroup_Click()
    UnBoundGrid
    TxtGroup.Enabled = True
    CmdGroupHelp.Enabled = True
End Sub

Private Sub ResizeGrid()
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fg.Cols - 1
        totWidth = totWidth + fg.ColWidth(i)
    Next
    For i = 0 To fg.Cols - 1
        fg.ColWidth(i) = (fg.Width - 400) * fg.ColWidth(i) / totWidth
    Next
End Sub

Private Sub UnBoundGrid()
    Set rs = Nothing
    Set fg.DataSource = Nothing
    fg.Rows = 1
    cmdPrint.Enabled = False
    CmdPreview.Caption = "„⁄«Ì‰…"
End Sub

Private Sub ShowReport()

    If rs Is Nothing Then
        MsgBox "«Œ — „⁄«Ì‰… √Ê·«° À„ ﬁ„ »ÿ»«⁄… «·‰ «∆Ã.", vbQuestion Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "ÿ»«⁄…"
        Exit Sub
    End If

    Dim rpt As New DRStockJared

    Set rpt.DataSource = rs
    
    If rs.RecordCount = 0 Then
        MsgBox "·«  ÊÃœ „Ê«œ ›Ì Â–« «· ﬁ—Ì—", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·„Ê«œ „‰ ÂÌ… «·’·«ÕÌ…"
    End If
    
    Get_DataReport_Label_byName(rpt, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
    Get_DataReport_Label_byName(rpt, 1, "lblBranchPhone").Caption = Current_State.Phone
    
    Dim strGroup As String
    If opSubGroup.Value And (Trim(TxtGroupId.text) <> "") Then
        strGroup = TxtGroup.text
    Else
        strGroup = "ﬂ«›… «·„Ã„Ê⁄«  ›Ì «·„” Êœ⁄"
    End If
    
    Get_DataReport_Label_byName(rpt, 1, "Label1").Caption = "«·„Ê«œ „‰ ÂÌ… «·’·«ÕÌ…"
    Get_DataReport_Label_byName(rpt, 1, "Label16").Width = Get_DataReport_Label_byName(rpt, 1, "Label16").Width * 1.5
    Get_DataReport_Label_byName(rpt, 1, "Label16").Caption = "ﬁ»·  «—ÌŒ"
    Get_DataReport_Label_byName(rpt, 1, "Label3").Caption = format(dtExpire.Value, "dd/mm/yyyy")
    
    Get_DataReport_Label_byName(rpt, 1, "lblGroup_Name").Caption = strGroup
    Get_DataReport_Label_byName(rpt, 2, "Label5").Caption = fg.TextMatrix(0, fg.Cols - 3)
    Get_DataReport_Label_byName(rpt, 2, "Label7").Caption = fg.TextMatrix(0, fg.Cols - 2)
    Get_DataReport_Label_byName(rpt, 2, "Label8").Caption = fg.TextMatrix(0, fg.Cols - 1)
    
    Get_DataReport_Label_byName(rpt, 3, "Text9").DataFormat.format = ""
    Get_DataReport_Label_byName(rpt, 3, "Text4").DataFormat.format = "dd/mm/yyyy"
    
    rpt.Sections(5).visible = False

    rpt.Show 1
    
    Set rpt = Nothing
End Sub

Private Function getSql(ByVal strGroup As String) As String
    Dim sql As String
    Dim criteria As String
    sql = "SET DATEFORMAT DMY SELECT [Code], [Name], IsNull([Latin_Name], '-') AS Latin_Name, "
    sql = sql & "[Group], [Unit], [Net_Qty], "
    sql = sql & "IsNull(SUM([Qty_In]), 0) AS Sell_Price, "
    sql = sql & "p.[Expire_On] AS Total"
    sql = sql & vbCrLf & "FROM vPurchases p INNER JOIN vStock_Objects o"
    sql = sql & vbCrLf & "ON (p.Object = o.Id And p.Expire_On >= o.Expire_On)"
    sql = sql & vbCrLf & "WHERE o.GId IN (" & vbCrLf
    sql = sql & vbTab & "SELECT [Id] FROM fn_GetChildGroups(" & strGroup & ")"
    sql = sql & vbCrLf & ") AND p.Expire_On <= '" & format(dtExpire.Value, "dd/mm/yyyy") & "'"
    sql = sql & vbCrLf & "GROUP BY "
    sql = sql & vbCrLf & vbTab & "[Code], [Name], Latin_Name, [Group], [Unit], [Net_Qty], p.[Expire_On]"
    getSql = sql
End Function
