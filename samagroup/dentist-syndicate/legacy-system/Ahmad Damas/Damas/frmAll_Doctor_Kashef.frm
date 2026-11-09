VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmAll_Doctor_Kashef 
   BackColor       =   &H00E1FEFF&
   Caption         =   "√—’œ… «·√ÿ»«¡"
   ClientHeight    =   6960
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9345
   Icon            =   "frmAll_Doctor_Kashef.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6960
   ScaleWidth      =   9345
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "√—’œ… «·√ÿ»«¡"
      Height          =   6255
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   30
      Width           =   9135
      Begin VB.CommandButton cmdView 
         Caption         =   "„⁄«Ì‰…"
         Height          =   330
         Left            =   180
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   5835
         Width           =   1275
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
         Width           =   8925
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4830
         Left            =   135
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:Doctor_ID,1:Doctor_Name,2:Total,;"
         Top             =   945
         Width           =   8880
         _cx             =   15663
         _cy             =   8520
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
         Cols            =   3
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmAll_Doctor_Kashef.frx":1CFA
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
         Left            =   5160
         TabIndex        =   8
         Top             =   480
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   20643843
         CurrentDate     =   40179
      End
      Begin MSComCtl2.DTPicker dtTo 
         Height          =   375
         Left            =   720
         TabIndex        =   9
         Top             =   480
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   20643843
         CurrentDate     =   40543
      End
      Begin VB.Label lblSum 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   11.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   330
         Left            =   6165
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   5835
         Width           =   1695
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈Ã„«·Ì «·„»«·€"
         Height          =   195
         Left            =   8025
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   5910
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " «—ÌŒ «·ﬂ‘› „‰  «—ÌŒ"
         Height          =   240
         Left            =   7335
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   540
         Width           =   1545
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   240
         Left            =   3345
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   585
         Width           =   690
      End
   End
End
Attribute VB_Name = "frmAll_Doctor_Kashef"
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




Private Sub cmdView_Click()
    MousePointer = vbHourglass
    ActiveDatabaseName = "Default"
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "Set Dateformat DMY Select * from dbo.sf_Get_All_Doctor_Kashef('" & dtFrom.Value & "','" & _
          dtTo.Value & "')"
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    If master.state And ST_FILLGRID Then
        master.state = master.state - ST_FILLGRID
    End If
    If Not master.rs.EOF Then
        master.MoveFirst
    End If
    
    MousePointer = vbDefault
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state <> ST_SEARCH Then
        cancel = True
    Else
        If Row <> 1 Then cancel = True
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
    oldScaleWidth = 9465
    FormSettings = btall - btnew - btUpdate - btCancel - btsave - btDelete
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    InitFrame
    Dim cancel As Boolean
    'master.state = master.state + ST_FILLGRID
    ActiveDatabaseName = "Default"
    Dim sql As String
    
    sql = "Set Dateformat DMY Select * from sf_Get_All_Doctor_Kashef('01/01/2004','01/01/2004')"

    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    master.MoveFirst
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

Private Sub master_doEOFReached(rs As ADODB.Recordset)
    Dim i As Integer
    
    lblSum.Caption = 0
    
    For i = 1 To fg.Rows - 1
          lblSum.Caption = val(fg.Cell(flexcpText, i, fg.Cols - 1)) + val(lblSum.Caption)
    Next i
    
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
   
    Get_DataReport_Label_byName(DrAll_Doctor_Kashef, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrAll_Doctor_Kashef, 1, "lblFrom").Caption = format(dtFrom.Value, "dd/mm/yyyy")
    Get_DataReport_Label_byName(DrAll_Doctor_Kashef, 1, "lblTo").Caption = format(dtTo.Value, "dd/mm/yyyy")
    Set DrAll_Doctor_Kashef.DataSource = master.rs
    DrAll_Doctor_Kashef.Show 1
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
'    Dim Sql, FromDate, toDate As String
'    Dim Cancel As Boolean
'    If master.state And ST_FILLGRID Then
'        master.state = master.state - ST_FILLGRID
'    End If
'    FromDate = dtFrom.Value
'    toDate = dtTo.Value
'    S = "Expose_Date >= '" & FromDate & "' AND Expose_Date <='" & toDate & "' "
'    DefaultType = 1
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
