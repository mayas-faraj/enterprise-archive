VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmAllCanceledTreatsReport 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ﬁ—Ì— ≈Ã„«·Ì »«·„⁄«·Ã«  «·„Õ”Ê„…"
   ClientHeight    =   8760
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   14940
   Icon            =   "frmAllCanceledTreatsReport.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8760
   ScaleWidth      =   14940
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ﬁ—Ì— ≈Ã„«·Ì »«·„⁄«·Ã«  «·„Õ”Ê„…"
      Height          =   8295
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   14655
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
         Width           =   14415
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   7245
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   14340
         _cx             =   25294
         _cy             =   12779
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
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   10
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmAllCanceledTreatsReport.frx":1CFA
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
         Caption         =   "«·„Ã„Ê⁄"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   13545
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   7800
         Width           =   855
      End
      Begin VB.Label lblSummary 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FF80FF&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   405
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   7800
         Width           =   3780
      End
   End
End
Attribute VB_Name = "frmAllCanceledTreatsReport"
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
Private Sub GetSummary()
    Dim i As Integer
    Dim start_row As Integer
    Dim summary As Double
    If master.state = ST_SEARCH Then
        start_row = 2
    Else
        start_row = 1
    End If
    
    For i = start_row To fg.Rows - 1
        summary = summary + val(fg.Cell(flexcpText, i, 7))
    Next i
    
    lblSummary.Caption = summary
    
End Sub



Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
    Cancel = Not (master.state = ST_SEARCH And Row = 1)
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
    oldScaleWidth = 15060 ' TODO: Put the Form.Width value here
    FormSettings = btall - btDelete - btnew - btUpdate
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "Select * from vCanceledTreats order by 1", Cancel)
    InitFrame
    If Not master.rs.EOF Then
        master.MoveFirst
    End If
    
    GetSummary
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    If Not Current_State.Show_Per_Company Then
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:central_exam_id,1:curer_doctor_id,2:curer_doctor_name,3:patient_id,4:patient_name,5:organization_name,6:name,7:cost,8:numTeeth,9:notes,;"
    Else
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Ihala_ID_in_Company,1:curer_doctor_id,2:curer_doctor_name,3:patient_id,4:patient_name,5:organization_name,6:name,7:cost,8:numTeeth,9:notes,;"
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
    GetSummary
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    Get_DataReport_Label_byName(DrAllCanceledTreats, 1, "lblHeader").Caption = Current_State.FullName
    Set DrAllCanceledTreats.DataSource = rs
On Error GoTo ErrHandler:
    Dim intOrientation As Integer
    intOrientation = Printer.Orientation
    If Printer.PaperSize = vbPRPSA4 Then
        Printer.Orientation = 2
    End If
    DrAllCanceledTreats.Show vbModal
    Printer.Orientation = intOrientation
    Exit Sub
ErrHandler:
    MsgBox "Õ’· Œÿ√ √À‰«¡ ÿ»«⁄… «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    GetSummary
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
