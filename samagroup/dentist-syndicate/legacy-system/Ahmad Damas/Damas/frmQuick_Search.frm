VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmQuick_Search 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÕÀ ”—Ì⁄"
   ClientHeight    =   8340
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   13050
   Icon            =   "frmQuick_Search.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8340
   ScaleWidth      =   13050
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÕÀ ”—Ì⁄"
      Height          =   7965
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   12915
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
         Width           =   12600
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6960
         Left            =   165
         TabIndex        =   2
         Tag             =   $"frmQuick_Search.frx":1CFA
         Top             =   570
         Width           =   12630
         _cx             =   22278
         _cy             =   12277
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
         FormatString    =   $"frmQuick_Search.frx":1D95
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
         Left            =   10410
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7605
         Width           =   1335
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·⁄œœ «·≈Ã„«·Ì"
         Height          =   255
         Left            =   11790
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7605
         Width           =   1005
      End
   End
End
Attribute VB_Name = "frmQuick_Search"
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
    oldScaleWidth = 13170
    FormSettings = btall - btnew - btUpdate - btdelete - btCancel - btsave
    btnSettings = btall - btSearch - btPrint
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
    MousePointer = vbHourglass
    
    master.State = master.State + ST_FILLGRID
    
    Set master.rs = ExecuteSelect(Conn, "Select * from vQuick_Search", Cancel)
    
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    master.BeginSearch
    MousePointer = vbDefault
    lblRecordCount.Caption = master.rs.RecordCount
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

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    lblRecordCount.Caption = master.rs.RecordCount
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    Set DrQuick_Search.DataSource = rs
    DrQuick_Search.Show
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
   lblRecordCount.Caption = master.rs.RecordCount
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
