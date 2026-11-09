VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Acc_AddCompanyMotalaba 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "„ÿ«·»«  ﬁœÌ„…"
   ClientHeight    =   7605
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10875
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7605
   ScaleWidth      =   10875
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„ÿ«·»«  ﬁœÌ„…"
      Height          =   7530
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
      Width           =   10665
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
         Width           =   10395
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6450
         Left            =   120
         TabIndex        =   3
         Tag             =   $"Acc_AddCompanyMotalaba.frx":0000
         Top             =   480
         Width           =   10410
         _cx             =   18362
         _cy             =   11377
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
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Acc_AddCompanyMotalaba.frx":00EF
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   0
         AutoSearchDelay =   20
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
         ComboSearch     =   1
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
         BackColor       =   &H00FF80FF&
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
         ForeColor       =   &H00FFFFFF&
         Height          =   405
         Left            =   3960
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7005
         Width           =   5580
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
         Left            =   9645
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   7005
         Width           =   855
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì» "
         Height          =   195
         Left            =   9150
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   720
         Width           =   1005
      End
   End
End
Attribute VB_Name = "Acc_AddCompanyMotalaba"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Public FormSettings As Long
Public btnSettings As Long
Dim ActiveFrame As frame
Dim oldScaleWidth As Long

Sub Get_Summaries()
    Dim i As Integer
    Dim Start_Row As Integer
    
    If master.State = ST_SEARCH Then
        Start_Row = 2
    Else
        Start_Row = 1
    End If
    
    lblSummary.Caption = 0
    
    For i = Start_Row To fg.Rows - 1
        lblSummary.Caption = val(lblSummary.Caption) + val(fg.Cell(flexcpText, i, fg.Cols - 1))
    Next i

End Sub







Private Sub Form_Activate()
    ActiveDatabaseName = "default"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
   
    oldScaleWidth = 11000
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
     ActiveDatabaseName = "default"
    Set master.rs = ExecuteSelect(Conn, "Select * from Organization_Kashef where Kashef_Type=2", Cancel)
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    Get_Summaries
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
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fg.Cols - 1
        totWidth = totWidth + fg.ColWidth(i)
    Next
    For i = 0 To fg.Cols - 1
        fg.ColWidth(i) = (fg.Width - 500) * fg.ColWidth(i) \ totWidth
    Next
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    rs!Kashef_Type = 2
    rs!Moving_Date = Day(Date) & "/" & Month(Date) & "/" & year(Date)
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    Get_Summaries
End Sub

Private Sub master_doEOFReached(rs As ADODB.Recordset)
    Get_Summaries
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, Cancel As Boolean)
    Dim rs2 As ADODB.Recordset
    Set rs2 = ExecuteSelect(Conn, "select Account_Number_ID from Organization where organization_id=" & fg.Cell(flexcpText, fg.Row, 0) & _
                                  "; select id,state from Acc_SanadTmp where type=1;", Cancel)
    Dim ComAcc As Integer
    Dim sanadId As Integer
    Dim State As Integer
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    ComAcc = rs2!Account_Number_ID
    Set rs2 = rs2.NextRecordset
    If rs2.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ Õ›Ÿ Â–Â «·„ÿ«·»… ·√‰Â ·« ÌÊÃœ ”‰œ ﬁÌœ «›  «ÕÌ ›Ì ‘Ã—… „Õ«”»… «·‰Ÿ«„", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Cancel = True
        Exit Sub
    End If
    sanadId = rs2!id
    State = rs2!State
    Dim sql As String
    Dim description As String
    description = "„ÿ«·»… ﬁœÌ„… :—ﬁ„Â«  " & fg.Cell(flexcpText, fg.Row, 1) & " Ê «—ÌŒÂ« " & fg.Cell(flexcpText, fg.Row, 2)
    sql = "exec sp_Tarhil " & sanadId & ",'',0; insert into Acc_DetSanadTmp(acc,M,sanadId,Dscrb) values(" & ComAcc & "," & fg.Cell(flexcpText, fg.Row, 3) & "," & sanadId & ",'" & description & "'" & ")"
    ExecuteCommand Conn, sql, Cancel
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    Get_Summaries
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Get_Summaries
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub


