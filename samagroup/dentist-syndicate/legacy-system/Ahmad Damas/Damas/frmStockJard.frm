VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmStockJard 
   BackColor       =   &H00E1FEFF&
   ClientHeight    =   8025
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9600
   Icon            =   "frmStockJard.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8025
   ScaleWidth      =   9600
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame1 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„Ê«œ"
      Height          =   5430
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   ";repeat=true;"
      Top             =   2400
      Width           =   9375
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4695
         Left            =   120
         TabIndex        =   9
         Tag             =   ";typeof=vsflexgrid;datafield=,0:id,1:name,;check=,0:Integer > 0,0:required,1:required,;"
         Top             =   240
         Width           =   9135
         _cx             =   16113
         _cy             =   8281
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
         FormatString    =   $"frmStockJard.frx":1CFA
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
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·≈Ã„«·Ì"
         Height          =   255
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5055
         Width           =   975
      End
      Begin VB.Label lblTotal 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5025
         Width           =   1335
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·„Ê«œ"
         Height          =   255
         Left            =   8355
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5025
         Width           =   735
      End
      Begin VB.Label lblRecordCount 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Left            =   6915
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   5025
         Width           =   1335
      End
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„Ã„Ê⁄… «·—∆Ì”Ì…"
      Height          =   2295
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   9375
      Begin VB.CheckBox chkEmptyRows 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "√ŸÂ— ﬂ«›… «·„Ê«œ („ ÷„‰« «·„Ê«œ €Ì— „ Ê›—… Õ«·Ì« ›Ì «·„” Êœ⁄)."
         Height          =   255
         Left            =   3840
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   1920
         Value           =   1  'Checked
         Width           =   5415
      End
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
      Begin VB.TextBox TxtGroup 
         Alignment       =   1  'Right Justify
         Enabled         =   0   'False
         Height          =   375
         Left            =   3600
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1320
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
         Top             =   1320
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
         Top             =   960
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
         Top             =   600
         Value           =   -1  'True
         Width           =   2895
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
      Begin VB.TextBox TxtGroupId 
         Alignment       =   1  'Right Justify
         DataField       =   "Group"
         Height          =   375
         Left            =   8280
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1200
         Visible         =   0   'False
         Width           =   465
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H8000000F&
         Height          =   1335
         Left            =   3120
         Top             =   480
         Width           =   6135
      End
   End
End
Attribute VB_Name = "frmStockJard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim WithEvents dlgGroups As dlgStockGroupSelect
Attribute dlgGroups.VB_VarHelpID = -1

Dim oldScaleWidth As Long
Public rs As ADODB.Recordset
' JardKind: Ã—œ ⁄«œÌ:0 Ã—œ ‰ﬁ’ ﬂ„Ì« :1 Ã—œ “Ì«œ… ﬂ„Ì« :2
Public JardKind As Integer

Private Sub chkEmptyRows_Click()
    UnBoundGrid
End Sub

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
    Dim Sql As String
    Dim Cancel As Boolean
    Sql = getSql(JardKind, strGroup)
    Set rs = ExecuteSelect(Conn, Sql, Cancel)
    fg.DataMode = flexDMBoundBatch
    Set fg.DataSource = rs
    setHeaders JardKind
    ResizeGrid
    CmdPreview.Caption = " ÕœÌÀ"
    cmdPrint.Enabled = True
    
    lblRecordCount.Caption = fg.Rows - 1
    
    Dim i As Integer
    lblTotal.Caption = 0
    For i = 1 To fg.Rows - 1
        lblTotal.Caption = val(lblTotal.Caption) + val(fg.Cell(flexcpText, i, 7))
    Next i
    
    
    
End Sub

Private Sub CmdPrint_Click()
    ShowReport
End Sub

Private Sub dlgGroups_OnClosingDialog(theGrid As VSFlex7Ctl.VSFlexGrid, Cancel As Boolean)
    If dlgGroups.Result Then
        UnBoundGrid
        Dim r As Long
        r = theGrid.Row
        SetGroupId theGrid.TextMatrix(r, 3)
        SetGroupName theGrid.TextMatrix(r, 0)
    End If
End Sub

Private Sub Form_Activate()
    RefreshCommands 0
    ActiveDatabaseName = "Stock"
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9720
    FormatForm Me
    setHeaders JardKind
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
    Dim rpt As New DRStockJared
       
    Set rpt.DataSource = rs
    
    If rs.RecordCount = 0 Then
        MsgBox "·«  ÊÃœ „Ê«œ ›Ì «·„Ã„Ê⁄… «·„Õœœ…", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Ã—œ"
    End If
    
    Get_DataReport_Label_byName(rpt, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
    Get_DataReport_Label_byName(rpt, 1, "lblBranchPhone").Caption = Current_State.Phone
    
    Dim strGroup As String
    If opSubGroup.Value And (Trim(TxtGroupId.text) <> "") Then
        strGroup = TxtGroup.text
    Else
        strGroup = "ﬂ«›… «·„Ã„Ê⁄«  ›Ì «·„” Êœ⁄"
    End If
    
    Get_DataReport_Label_byName(rpt, 1, "lblGroup_Name").Caption = strGroup
    Get_DataReport_Label_byName(rpt, 2, "Label7").Caption = fg.TextMatrix(0, fg.Cols - 2)
    Get_DataReport_Label_byName(rpt, 2, "Label8").Caption = fg.TextMatrix(0, fg.Cols - 1)
    
    Dim t4, t9 As RptTextBox
    Set t4 = Get_DataReport_Label_byName(rpt, 3, "Text4")
    Set t9 = Get_DataReport_Label_byName(rpt, 3, "Text9")
    Select Case JardKind
        Case 0
            Get_DataReport_Label_byName(rpt, 1, "Label1").Caption = "Ã—œ «·„Ê«œ ›Ì «·„” Êœ⁄"
            rpt.Sections(5).visible = True
        Case 1
            Get_DataReport_Label_byName(rpt, 1, "Label1").Caption = "«·‰ﬁ’ ›Ì ﬂ„Ì«  «·„Ê«œ"
            rpt.Sections(5).visible = False
            t4.DataFormat.format = ""
            t9.DataFormat.format = ""
        Case 2
            Get_DataReport_Label_byName(rpt, 1, "Label1").Caption = "«·“Ì«œ… ›Ì ﬂ„Ì«  «·„Ê«œ"
            rpt.Sections(5).visible = False
            t4.DataFormat.format = ""
            t9.DataFormat.format = ""
    End Select

    rpt.Show 1
    
    Set rpt = Nothing
End Sub

' JardKind: Ã—œ ⁄«œÌ:0 Ã—œ ‰ﬁ’ ﬂ„Ì« :1 Ã—œ “Ì«œ… ﬂ„Ì« :2
Private Function getSql(ByVal JardKind As Integer, ByVal strGroup As String) As String
    Dim Sql As String
    Dim criteria As String
    Sql = "SELECT [Code], [Name], IsNull([Latin_Name], '-') AS Latin_Name, "
    Sql = Sql & "[Group], [Unit], [Net_Qty], "
    Select Case JardKind
        Case 0
            Sql = Sql & "IsNull([Sell_Price], 0) AS Sell_Price, "
            Sql = Sql & "IsNull([Net_Qty] * [Sell_Price], 0) AS Total"
            criteria = ""
        Case 1
            Sql = Sql & "IsNull([Min_Qty], 0) AS Sell_Price, "
            Sql = Sql & "IsNull([Min_Qty] - [Net_Qty], 0) AS Total"
            criteria = " AND ([Net_Qty] < [Min_Qty])"
        Case 2
            Sql = Sql & "IsNull([Max_Qty], 0) AS Sell_Price, "
            Sql = Sql & "IsNull([Net_Qty] - [Max_Qty], 0) AS Total"
            criteria = " AND ([Net_Qty] > [Max_Qty])"
    End Select
    Sql = Sql & vbCrLf & "FROM vStock_Objects WHERE GId IN (" & vbCrLf
    Sql = Sql & vbTab & "SELECT [Id] FROM fn_GetChildGroups(" & strGroup & ")"
    Sql = Sql & vbCrLf & ")" & criteria
    If chkEmptyRows.Value = 0 Then
        Sql = Sql & vbCrLf & "AND Net_Qty > 0"
    End If
    getSql = Sql
End Function

Private Sub setHeaders(ByVal JardKind As Integer)
    Select Case JardKind
        Case 0
            fg.TextMatrix(0, fg.Cols - 2) = "«·”⁄—"
            fg.TextMatrix(0, fg.Cols - 1) = "«·≈Ã„«·Ì"
            fg.ColFormat(fg.Cols - 2) = "$"
            fg.ColFormat(fg.Cols - 1) = "$"
        Case 1
            fg.TextMatrix(0, fg.Cols - 2) = "«·Õœ «·√œ‰Ï"
            fg.TextMatrix(0, fg.Cols - 1) = "«·‰ﬁ’"
            fg.ColFormat(fg.Cols - 2) = ""
            fg.ColFormat(fg.Cols - 1) = ""
        Case 2
            fg.TextMatrix(0, fg.Cols - 2) = "«·Õœ «·√⁄·Ï"
            fg.TextMatrix(0, fg.Cols - 1) = "«·“Ì«œ…"
            fg.ColFormat(fg.Cols - 2) = ""
            fg.ColFormat(fg.Cols - 1) = ""
    End Select
    fg.Cell(flexcpBackColor, 0, fg.Cols - 1) = &H8000000C
    If fg.Rows > 1 Then
        fg.Cell(flexcpBackColor, 1, fg.Cols - 1, fg.Rows - 1, fg.Cols - 1) = &HE1FEFF
        fg.Cell(flexcpForeColor, 1, fg.Cols - 1, fg.Rows - 1, fg.Cols - 1) = vbRed
    End If
End Sub
