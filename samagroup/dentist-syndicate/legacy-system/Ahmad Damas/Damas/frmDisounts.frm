VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmDiscounts 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ÊÞÑíÑ ÍÓæãÇÊ ÇáÃØÈÇÁ"
   ClientHeight    =   8175
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   12765
   Icon            =   "frmDisounts.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8175
   ScaleWidth      =   12765
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ÊÞÑíÑ ÍÓæãÇÊ ÇáÃØÈÇÁ"
      Height          =   7350
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   12615
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
         Width           =   13455
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5805
         Left            =   180
         TabIndex        =   2
         Top             =   1215
         Width           =   12300
         _cx             =   21696
         _cy             =   10239
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
         Cols            =   9
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmDisounts.frx":1CFA
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
         Left            =   6888
         TabIndex        =   3
         Top             =   585
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtTo 
         Height          =   375
         Left            =   1961
         TabIndex        =   4
         Top             =   585
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40139
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "ÊÇÑíÎ ßÔÝ ÇáØÈíÈ ãä "
         Height          =   240
         Index           =   1
         Left            =   9258
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   645
         Width           =   1545
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "Åáì"
         Height          =   240
         Left            =   4710
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   645
         Width           =   285
      End
   End
End
Attribute VB_Name = "frmDiscounts"
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
    oldScaleWidth = 12885
    FormSettings = btall - btsave - btnew - btUpdate - btDelete
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Dim sql As String
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    master.state = ST_FILLGRID
    Dim cancel As Boolean
    sql = " Set DateFormat dmy " & _
          " Select Central_Exam_ID,Patient_ID,Patient_Name,Organization_ID,Organization_Name,Ihala_ID_in_Company," & _
          " Curer_Doctor_ID,Curer_Doctor_Name,Discount,Discount_Reason,Expose_Date " & _
          " From vCentral_Exam " & _
          " Where isNull(Discount,0) > 0 and Fixed = 1 " & _
          " Order by 1"
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    If Current_State.Show_Per_Company = False Then
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Central_Exam_ID,1:Patient_ID,2:Patient_Name,3:Organization_ID,4:Organization_Name,5:Curer_Doctor_ID,6:Curer_Doctor_Name,7:Discount,8:Discount_Reason,;"
    Else
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Ihala_ID_in_Company,1:Patient_ID,2:Patient_Name,3:Organization_ID,4:Organization_Name,5:Curer_Doctor_ID,6:Curer_Doctor_Name,7:Discount,8:Discount_Reason,;"
    End If
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
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If fg.Rows = 1 Then Exit Sub
    Get_DataReport_Label_byName(DrDiscount, 1, "lblFrom").Caption = dtFrom.Value
    Get_DataReport_Label_byName(DrDiscount, 1, "lblto").Caption = dtTo.Value
    Set DrDiscount.DataSource = rs
    DrDiscount.Show 1
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    Dim FromDate, toDate As String
    Dim cancel As Boolean
    If master.state And ST_FILLGRID Then
        master.state = master.state - ST_FILLGRID
    End If
    FromDate = dtFrom.Value
    toDate = dtTo.Value
    S = " Expose_Date >= '" & FromDate & "' AND Expose_Date <='" & toDate & "' "
    DefaultType = 1
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
