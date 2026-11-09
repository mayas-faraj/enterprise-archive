VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSComCt2.Ocx"
Begin VB.Form frmDialy_Report 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ﬁ—Ì— «·œÊ«„ «·ÌÊ„Ì"
   ClientHeight    =   9060
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   13050
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9060
   ScaleWidth      =   13050
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ﬁ—Ì— «·œÊ«„ «·ÌÊ„Ì"
      Height          =   8790
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   12915
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         Caption         =   "⁄„·Ì«  ⁄«œÌ…"
         Height          =   255
         Index           =   1
         Left            =   11400
         TabIndex        =   8
         Top             =   840
         Value           =   -1  'True
         Width           =   1215
      End
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         Caption         =   "⁄„·Ì«  Œ«ÿ∆…"
         Height          =   255
         Index           =   0
         Left            =   11400
         TabIndex        =   9
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "⁄—÷ «·»Ì«‰« "
         Height          =   360
         Left            =   285
         TabIndex        =   6
         Top             =   510
         Width           =   1305
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   12600
      End
      Begin MSComCtl2.DTPicker dtFrom 
         Height          =   375
         Left            =   7230
         TabIndex        =   2
         Top             =   510
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   20709379
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtTo 
         Height          =   375
         Left            =   1845
         TabIndex        =   3
         Top             =   510
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   20709379
         CurrentDate     =   40139
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6315
         Left            =   330
         TabIndex        =   7
         Top             =   1110
         Width           =   12315
         _cx             =   21722
         _cy             =   11139
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
         FocusRect       =   5
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmDialy_Report.frx":0000
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
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‰  «—ÌŒ"
         Height          =   240
         Index           =   1
         Left            =   10080
         TabIndex        =   5
         Top             =   570
         Width           =   870
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   240
         Left            =   5430
         TabIndex        =   4
         Top             =   570
         Width           =   690
      End
   End
End
Attribute VB_Name = "frmDialy_Report"
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
 
'Consts
Const Process_ID_ = 0
Const Process_Type_ = 1
Const Employee_ID_ = 2
Const Process_Time_ = 3

Dim rsEmployees As ADODB.Recordset

Sub Coloring_Grid()
    MousePointer = vbHourglass

    Dim i As Integer
    Dim j As Integer
    Dim start_row As Integer
    
    On Error GoTo 10
    
    If master.state = ST_SEARCH Then
        start_row = 2
    Else
        start_row = 1
    End If
    
    For i = start_row To fg.Rows - 1
        If val(fg.Cell(flexcpText, i, 1)) = 0 Then 'œŒÊ·
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(9) '√“—ﬁ
            Next j
        ElseIf val(fg.Cell(flexcpText, i, 1)) = 2 Then '»œ¡ ≈Ã«“… ”«⁄Ì…
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(5)
            Next j
        ElseIf val(fg.Cell(flexcpText, i, 1)) = 3 Then ' «‰ Â«¡ ≈Ã«“… ”«⁄Ì…
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(13)
            Next j
        Else
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(12) '√Õ„—
            Next j
        End If
   Next i
   
    MousePointer = vbDefault
    Exit Sub
10:
    MousePointer = vbDefault
    
End Sub
Public Sub Refresh_Data()
    Dim cancel As Boolean
    
    Dim sql As String
    If opt(0).Value = False Then
        sql = "Set Dateformat DMY Select Process_ID,Employee_ID,Process_Type,Process_Time " & _
              "from Employee_Continuance Where process_Date between '" & dtFrom.Value & "' and '" & dtTo.Value & "' " & _
              "order by employee_id,process_time"
    'This SELECT statement ignores the vacations during the work time
    Else
        sql = "Set Dateformat DMY Select Process_ID,Employee_ID,Process_Type,Process_Time " & _
              "from Missing_Processes Where process_Date between '" & dtFrom.Value & "' and '" & dtTo.Value & "' " & _
              "order by employee_id,process_time"
    End If
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not master.rs.EOF Then
        master.MoveFirst
    End If
    '<Ashraf>
    'RefreshCommands btnSettings And FormSettings
    '</Ashraf>
    Coloring_Grid
    ResizeGrid fg
End Sub

Private Sub cmdRefresh_Click()
    MousePointer = vbHourglass
    Refresh_Data
    MousePointer = vbDefault
End Sub

Private Sub fg_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    If OldRow = NewRow Then Exit Sub
    master.MoveRSToSelectedRow fg, master.rs
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state = ST_SEARCH And Row = 1 Then
        Exit Sub
    End If
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
     ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 13170
    FormSettings = btall
    'Data grid counts the header as a row so: "Me.fg.Rows < 1"
    If Not Current_AppUser.IsAdmin Then FormSettings = FormSettings - btUpdate - btsave - btCancel - btnew - btDelete
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    If Not Current_AppUser.IsAdmin Then btnSettings = btnSettings - btUpdate - btsave - btCancel - btnew - btDelete
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    
    InitFrame
    dtFrom.Value = format(Date, "dd/mm/yyyy")
    dtTo.Value = format(Date, "dd/mm/yyyy")
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:Process_ID,1:Process_Type,2:Employee_ID,3:Process_Time,;"
    
    fg.ColComboList(Process_Type_) = "#0;œŒÊ·|#1;Œ—ÊÃ|#2;»œ¡ ≈Ã«“… ”«⁄Ì…|#3;«‰ Â«¡ ≈Ã«“… ”«⁄Ì…"
    
    Dim cancel As Boolean
    Dim sql As String
    
    sql = "Select Employee_ID,First_Name + ' ' + Last_Name as Full_Name From employee_cv"
    Set rsEmployees = ExecuteSelect(Conn, sql, cancel)
    If Not cancel Then
        fg.ColComboList(Employee_ID_) = fg.BuildComboList(rsEmployees, "Full_Name", "Employee_ID", &HE1FEFF)
    End If
    Set ActiveFrame = masterFrame
    opt(1).Value = True
    cmdRefresh_Click
    opt(1).Value = True
    opt(0).Enabled = Current_AppUser.IsAdmin
    
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    
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
     ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    'On Error GoTo 20
    frmAdd_Process.isUpdate = False
    frmAdd_Process.Show 1
    cancel = True
    cmdRefresh_Click
    Exit Sub
20:
    Close #100
    Open "c:\ErrorAddingProcess.txt" For Output As #100
    Print #100, Err.description
    Close #100
End Sub

Private Sub master_doBeforeUpdate(rs As ADODB.Recordset, cancel As Boolean)
    '<Ashraf>
    If rs.RecordCount = 0 Then
        MsgBox "⁄„·Ì… «· ⁄œÌ· €Ì— „„ﬂ‰… ·√‰ ⁄œœ «·”Ã·«  =0", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
        Exit Sub
    End If
    '</Ashraf>
    If fg.TextMatrix(fg.Row, 0) = "" Then
        cancel = True
        Exit Sub
    End If
    master.MoveRSToSelectedRow fg, rs
    With frmAdd_Process
        .isUpdate = True
        .Process_ID = rs!Process_ID
        .Process_Type = rs!Process_Type
        .Process_Time = rs!Process_Time
        .Employee_ID = rs!Employee_ID
        .Show 1
        cancel = True
        cmdRefresh_Click
    End With
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:Process_ID,1:Process_Type,2:Employee_ID,3:Process_Time,;"
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim c As Boolean
    ExecuteCommand Conn, "Delete from Employee_Continuance Where process_ID = " & master.rs!Process_ID, c
    If c Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄„·Ì… «·Õ–› «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbCritical + vbOKOnly, "»—‰«„Ã «·œÊ«„"
    End If
    Refresh_Data
    cancel = True
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    Dim lblHeader As RptLabel
    Dim rsReport As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    Set lblHeader = Get_DataReport_Label_byName(DrDialy_Report, 1, "lblHeader")
    lblHeader.Caption = " ﬁ—Ì— «·œÊ«„ «·ÌÊ„Ì ⁄‰ «·› —… «·Ê«ﬁ⁄… »Ì‰ "
    lblHeader.Caption = lblHeader.Caption & format(dtFrom.Value, "dd/mm/yyyy") & " Ê " & format(dtTo.Value, "dd/mm/yyyy")
    
    sql = "Set DateFormat dmy Select * from vEmployees_Continuance "
    sql = sql & " Where Process_Date Between '" & dtFrom.Value & "' and '" & dtTo.Value & "' Order by Employee_ID,Process_Time"
    
    Set DrDialy_Report.DataSource = ExecuteSelect(Conn, sql, cancel)
    
    DrDialy_Report.Show 1
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.Tag = ";typeof=vsflexgrid;datafield=,4:Process_Time,;"
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:Process_ID,1:Process_Type,2:Employee_ID,3:Process_Time,;"
    If master.SaveAfterWhat = ST_ADDNEW Then
        Coloring_Grid
    End If
End Sub
Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
