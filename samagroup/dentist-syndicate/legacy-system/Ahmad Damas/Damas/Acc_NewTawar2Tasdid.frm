VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Acc_NewTawar2Tasdid 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ”œÌœ«  ’‰œÊﬁ «·ÿÊ«—∆"
   ClientHeight    =   8490
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   7185
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   14.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Acc_NewTawar2Tasdid.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8490
   ScaleWidth      =   7185
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ”œÌœ«  ’‰œÊﬁ «·ÿÊ«—∆"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   8310
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   7035
      Begin VB.OptionButton optTasdid 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„”œœÌ‰"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5655
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   810
         Width           =   1215
      End
      Begin VB.OptionButton optNotTasdid 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "€Ì— «·„”œœÌ‰"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4455
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   810
         Width           =   1215
      End
      Begin VB.OptionButton optAll 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ﬂ·"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2970
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   810
         Value           =   -1  'True
         Width           =   1215
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   6795
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6300
         Left            =   90
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:AccName,1:TasdidState,2:Amount,;"
         Top             =   1395
         Width           =   6855
         _cx             =   12091
         _cy             =   11112
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
         FormatString    =   $"Acc_NewTawar2Tasdid.frx":1CFA
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
      Begin VB.Label lblSummary 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
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
         TabIndex        =   10
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7815
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Ã„Ê⁄ «·„»«·€"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2400
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7875
         Width           =   1035
      End
      Begin VB.Label lblKind 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«” ⁄—«÷ «·√ÿ»«¡ "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   5535
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   450
         Width           =   1275
      End
      Begin VB.Shape Shape1 
         Height          =   780
         Left            =   2925
         Top             =   540
         Width           =   4020
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·√ÿ»«¡"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5970
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7875
         Width           =   750
      End
      Begin VB.Label lblRecordCount 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
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
         Left            =   3705
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7815
         Width           =   2175
      End
   End
End
Attribute VB_Name = "Acc_NewTawar2Tasdid"
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
Dim sql As String
Sub Get_Summaries()
   Dim i As Integer
    lblSummary.Caption = 0
    If master.State = ST_SEARCH Then
        For i = 2 To fg.Rows - 1
            lblSummary.Caption = val(lblSummary.Caption) + val(fg.Cell(flexcpText, i, 2))
        Next i
    Else
        For i = 1 To fg.Rows - 1
            lblSummary.Caption = val(lblSummary.Caption) + val(fg.Cell(flexcpText, i, 2))
        Next i
    End If
    lblRecordCount.Caption = master.rs.RecordCount
End Sub

Sub Get_Data()
    
    MousePointer = vbHourglass
    Dim SqlTasdid As String
    Dim SqlNotTasdid As String
    Dim Cancel As Boolean
    
    On Error GoTo ErrHandler
    
    SqlTasdid = "select AccName, sum(D) Amount,  '„”œœ' as TasdidState from Acc_Daily" & Acc_DBYear & " where type =2 and " & _
        " accNo like '270%'  and accNo <> '270' group by AccName having isNull(Sum(D),0) > 0 "
    
    SqlNotTasdid = "select '('+ acc + ') '+ name AccName,0 Amount, '€Ì— „”œœ' TasdidState" & vbCrLf & _
            "From Acc_Accounts" & Acc_DBYear & vbCrLf & _
            "where acc like '270%' and acc <> '270' " & vbCrLf & _
            "    and num not in (select distinct(accNo) from acc_daily" & Acc_DBYear & _
            " where type=2 and accno like '270%' and isNull(D,0) = 0) order by AccName"
    
    If optTasdid.Value Then
        sql = SqlTasdid & " order by 1"
    End If
    
    If optNotTasdid.Value Then
         sql = SqlNotTasdid
    End If
    
    If optAll.Value Then
        sql = SqlTasdid & " UNION " & SqlNotTasdid
    End If
    
    Set master.rs = ExecuteSelect(Conn, sql, Cancel)
    
    If Not master.rs.EOF Then
        master.rs.MoveFirst
    End If
    
    Get_Summaries
    
    MousePointer = vbDefault
    Exit Sub
ErrHandler:
    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
    MousePointer = vbDefault
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
     If master.State <> ST_SEARCH Then
        Cancel = True
    ElseIf Row <> 1 Then
        Cancel = True
    End If
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    ActiveDatabaseName = "tawar2"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 7305
    FormSettings = btall - btsave - btnew - btUpdate - btdelete - btCancel
    btnSettings = btall - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
    
    InitFrame
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    lblRecordCount.Caption = 0
    
    'opt_Click 0
    
   
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

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    Get_Summaries
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If fg.Rows = 1 Then
        MsgBox "·«  ÊÃœ „⁄·Ê„«  ·ÿ»«⁄… «· ﬁ—Ì—!. «÷€ÿ “— --⁄—÷-- ·⁄—÷ «·„⁄·Ê„« ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    pForm = "Tawar2TasdidRep"
    Acc_MasterRep.Show 1
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    Get_Summaries
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Get_Summaries
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub


Private Sub optAll_Click()
    Get_Data
End Sub

Private Sub optNotTasdid_Click()
    Get_Data
End Sub

Private Sub optTasdid_Click()
    Get_Data
End Sub
