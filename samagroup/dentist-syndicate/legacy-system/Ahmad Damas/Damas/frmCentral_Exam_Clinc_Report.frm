VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCentral_Exam_Clinc_Report 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”Ã· «·„—÷Ï ›Ì ⁄Ì«œ… «·›Õ’ «·„—ﬂ“Ì"
   ClientHeight    =   6990
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11880
   Icon            =   "frmCentral_Exam_Clinc_Report.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6990
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ã· «·„—÷Ï ›Ì ⁄Ì«œ… «·›Õ’ «·„—ﬂ“Ì"
      Height          =   6870
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   45
      Width           =   11670
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
         Width           =   11385
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5130
         Left            =   90
         TabIndex        =   2
         Tag             =   $"frmCentral_Exam_Clinc_Report.frx":1CFA
         Top             =   1125
         Width           =   11490
         _cx             =   20267
         _cy             =   9049
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
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   8
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmCentral_Exam_Clinc_Report.frx":1DFF
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
      Begin MSComCtl2.DTPicker dtFrom 
         Height          =   375
         Left            =   5880
         TabIndex        =   7
         Top             =   548
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40106
      End
      Begin MSComCtl2.DTPicker dtTo 
         Height          =   375
         Left            =   1440
         TabIndex        =   8
         Top             =   548
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40106
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   240
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   615
         Width           =   690
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‰  «—ÌŒ"
         Height          =   240
         Index           =   1
         Left            =   9945
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   615
         Width           =   870
      End
      Begin VB.Label lblRecords_Count 
         Alignment       =   2  'Center
         BackColor       =   &H00800000&
         ForeColor       =   &H0000FFFF&
         Height          =   285
         Left            =   9225
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   6435
         Width           =   1410
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·»ÿ«ﬁ« "
         Height          =   285
         Index           =   0
         Left            =   10665
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   6480
         Width           =   915
      End
   End
End
Attribute VB_Name = "frmCentral_Exam_Clinc_Report"
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
Dim Init_Query As String

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state <> ST_SEARCH Then
        cancel = True
        Exit Sub
    End If
    
    If Row <> 1 Then cancel = True
    
    Debug.Print Col
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
    oldScaleWidth = 12000
    FormSettings = btall - btnew - btUpdate - btDelete - btCancel - btFirst - btLast - btPrev - btNext
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    dtTo.Value = Date
    Init_Query = "Set DateFormat DMY Select Central_Exam_ID,Exam_Date,Patient_ID,Patient_Name,Doctor_ID,Examiner_Doctor_Name," & _
                 "Organization_ID,Organization_Name,With_Exam,price from vCentral_Exam where with_Exam = 1 "
                 
    Set master.rs = ExecuteSelect(Conn, Init_Query & " order by 1", cancel)
    
    master.state = master.state + ST_FILLGRID
     
    InitFrame

    'master.MoveFirst
    Set ActiveFrame = masterFrame
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
    
    'Resize the grid fg
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    lblRecords_Count = rs.RecordCount
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
'    Me.MousePointer = 11
'    Set frmReport_Viewer.Report = New CRCentral_Exam_Clinc_Report
'    With frmReport_Viewer
'        .Report.txtCount.SetText rs.RecordCount
'        .Report.txtTitle.SetText "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ - ›—⁄ " & Current_State.Name
'        .Report.Database.SetDataSource master.rs, 3, 1
'        .Show 1
'    End With
'    Me.MousePointer = 0

    With DRPNameExam
        Set .DataSource = master.rs
        .Sections(1).Controls(1).Caption = Current_State.FullName
        .Show 1
    End With
    

End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    Dim sql, FromDate, toDate As String
    Dim cancel As Boolean
    If master.state And ST_FILLGRID Then
        master.state = master.state - ST_FILLGRID
    End If
    FromDate = dtFrom.Value
    toDate = dtTo.Value
    S = "Exam_Date >= '" & FromDate & "' AND Exam_Date <='" & toDate & "' "
    DefaultType = 1
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
