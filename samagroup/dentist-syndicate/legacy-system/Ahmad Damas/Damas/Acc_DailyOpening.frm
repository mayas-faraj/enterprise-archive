VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_DailyOpening 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”‰œ ﬁÌœ «›  «ÕÌ"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10665
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7590
   ScaleWidth      =   10665
   Tag             =   ";AlwaysEnabled=true;"
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”‰œ «·ﬁÌœ"
      Height          =   1575
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Tag             =   "master"
      Top             =   0
      Width           =   10575
      Begin VB.ComboBox cmbSanadType 
         DataField       =   "type"
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Acc_DailyOpening.frx":0000
         Left            =   1560
         List            =   "Acc_DailyOpening.frx":0016
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   1080
         Width           =   2295
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
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   240
         Width           =   10335
      End
      Begin VB.TextBox txtid 
         Alignment       =   1  'Right Justify
         DataField       =   "id"
         Height          =   375
         Left            =   8760
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Tag             =   ";search=true;check=required;check=custom;"
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtDscrb 
         Alignment       =   1  'Right Justify
         DataField       =   "Dscrb"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;"
         Top             =   600
         Width           =   5895
      End
      Begin VB.OptionButton optMorahal 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„—Õ·… ›ﬁÿ"
         Height          =   255
         Left            =   8880
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1080
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.OptionButton optNotMorahal 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·€Ì— „—Õ·…"
         Height          =   255
         Left            =   7560
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1080
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.OptionButton optAll 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ﬂ·"
         Height          =   255
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1080
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.CommandButton cmdTarhil 
         Caption         =   " —ÕÌ·"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   1080
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker txtcDate 
         DataField       =   "cDate"
         Height          =   375
         Left            =   6600
         TabIndex        =   2
         Tag             =   ";search=true;"
         Top             =   600
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40095
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "‰Ê⁄ «·”‰œ"
         Height          =   255
         Left            =   3960
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   1110
         Width           =   720
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ"
         Height          =   255
         Left            =   8160
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Top             =   660
         Width           =   495
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„"
         Height          =   255
         Left            =   9840
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   660
         Width           =   495
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·»Ì«‰"
         Height          =   255
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   660
         Width           =   495
      End
   End
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·ﬁÌÊœ"
      Height          =   5415
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   ";repeat=true;"
      Top             =   1560
      Width           =   10575
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   240
         Width           =   10335
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4335
         Left            =   120
         TabIndex        =   9
         Tag             =   $"Acc_DailyOpening.frx":0068
         Top             =   480
         Width           =   10335
         _cx             =   18230
         _cy             =   7646
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
         BackColorFixed  =   -2147483633
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
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   0
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   6
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Acc_DailyOpening.frx":0116
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
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   285
         Left            =   8325
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   4965
         Width           =   765
      End
      Begin VB.Label lblM 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
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
         Left            =   4680
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4920
         Width           =   3615
      End
      Begin VB.Label lblD 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
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
         Left            =   840
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4920
         Width           =   3615
      End
   End
End
Attribute VB_Name = "Acc_DailyOpening"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public WithEvents detail As Controller
Attribute detail.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Long
Dim EnableDetail As Boolean
Dim KeyHandled As Boolean
Public whereClause As String
Dim loaded As Boolean

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String

Private Sub detail_doAddNew(rs As ADODB.Recordset)
    rs!sanadId = master.rs!id
    fg.Cell(flexcpFontBold, 1, 1, fg.Rows - 1, 2) = True
    fg.Cell(flexcpFontBold, 1, 1, fg.Rows - 1, 1) = True
    fg.Cell(flexcpForeColor, 1, 1, fg.Rows - 1, 1) = vbBlue
    fg.Cell(flexcpForeColor, 1, 2, fg.Rows - 1, 2) = vbRed
    fg.Col = 0
End Sub

Private Sub detail_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    If fg.Rows <= 2 And fg.Rows > 1 Then
        If MsgBox("≈·€«¡ ⁄„·Ì… ≈÷«›… ﬁÌœ ›Ì Â–Â «·„—Õ·… ”Ì·€Ì ”‰œ «·ﬁÌœ √Ì÷«° Â· √‰  „Ê«›ﬁø", vbApplicationModal + vbOKCancel + vbMsgBoxRight + vbMsgBoxRtlReading) = vbOK Then
            txtId.text = ""
            txtDscrb.text = ""
            If Not (detail.rs.EOF Or detail.rs.BOF) Then
                detail.rs.CancelUpdate
            End If
            detail.state = 0
            fg.Rows = fg.Rows - 1
            'master.rs.CancelUpdate
            'master.rs.Requery
            cancel = True
            detail.CancelSave
            If master.state = ST_ADDNEW Or master.state = ST_UPDATE Then
                masterFrame_Click
                master.CancelSave
            End If
            'RefreshCommands FormSettings And btnDetailSettings
        Else
            cancel = True
        End If
    Else
'        masterFrame_Click
'        btnSettings = btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
'        RefreshCommands FormSettings And btnSettings
        'master.CancelSave
    End If
End Sub

Private Sub detail_DoDelete(rs As ADODB.Recordset, cancel As Boolean)
    If fg.Rows = 2 Then
        MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·ﬁÌœ ·√‰ «·”‰œ ÌÃ» √‰ ÌÃÊÌ ﬁÌœ« Ê«Õœ« ⁄·Ï «·√ﬁ·", vbMsgBoxRight + vbMsgBoxRtlReading
        cancel = True
        Exit Sub
    End If
End Sub

Private Sub detail_doEOFReached(rs As ADODB.Recordset)
    If fg.Rows < 1 Then Exit Sub
    fg.Cell(flexcpFontBold, 1, 1, fg.Rows - 1, 2) = True
    fg.Cell(flexcpFontBold, 1, 1, fg.Rows - 1, 1) = True
    fg.Cell(flexcpForeColor, 1, 1, fg.Rows - 1, 1) = vbBlue
    fg.Cell(flexcpForeColor, 1, 2, fg.Rows - 1, 2) = vbRed
End Sub

Private Sub detail_doMoveComplete(rs As ADODB.Recordset)
    Dim sql As String
    sql = "select '('+acc+')'+name name from Acc_Accounts where num=" & rs!acc
    Dim rs2 As ADODB.Recordset
    Dim cancel As Boolean
    Set rs2 = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    fg.Cell(flexcpText, fg.Row, 0) = rs2!name
    If Not IsNull(rs!M) Then
        lblM.Caption = rs!M + CDbl(lblM.Caption)
    End If
   If Not IsNull(rs!D) Then
        lblD.Caption = rs!D + CDbl(lblD.Caption)
    End If
    
End Sub
Private Sub detail_doSaveComplete(rs As ADODB.Recordset)
    Dim i As Long
    Dim SumD_D, SumM_M As Double
    SumD_D = 0: SumD_M = 0
    i = 1
    Do While i < fg.Rows
            If fg.Cell(flexcpText, i, 2) <> "" Then
                SumD_D = SumD_D + CDbl(fg.Cell(flexcpText, i, 2))
            End If
            If fg.Cell(flexcpText, i, 1) <> "" Then
                SumM_M = SumM_M + CDbl(fg.Cell(flexcpText, i, 1))
            End If
            i = i + 1
    Loop
    lblD.Caption = SumD_D
    lblM.Caption = SumM_M
End Sub

Private Sub detail_doBeforeMoveComplete(rs As ADODB.Recordset, cancel As Boolean)
    lblM.Caption = 0
    lblD.Caption = 0
End Sub
Private Sub detail_doSave(rs As ADODB.Recordset, cancel As Boolean)
    If fg.Rows = 2 Then
       Dim S As Long
       S = detail.state
       detail.state = 0
        masterFrame_Click
        master.Save
        If master.state <> 0 Then
            cancel = True
            Exit Sub
        End If
        rs!sanadId = master.rs!id
        detail.state = S
        detailFrame_Click
    End If
End Sub

Private Sub detail_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If fg.Cell(flexcpText, fg.Row, 1) <> "0" And fg.Cell(flexcpText, fg.Row, 2) <> "0" Then
        checkType = True
        msg = "·«Ì„ﬂ‰ﬂ ÷»ÿ ﬁÌ„ Ì «·œ«∆‰ Ê«·„œÌ‰ „⁄«. «·—Ã«¡  ’›Ì— ≈Õœ«Â„«"
        Exit Sub
    End If
    If fg.Cell(flexcpText, fg.Row, 1) = "0" And fg.Cell(flexcpText, fg.Row, 2) = "0" Then
        checkType = True
        msg = "ÌÃ» ÷»ÿ „»·€ «·œ«∆‰ √Ê «·„œÌ‰ («·ﬁÌ„… √ﬂ»—  „«„« „‰ «·’›—)"
        Exit Sub
    End If
    If S = "accReuired" Then
        If fg.Cell(flexcpText, fg.Row, 6) = "" Then
            checkType = True
            msg = "ÌÃ»  ÕœÌœ Õ”«» ﬁ»· «·Õ›Ÿ"
            Exit Sub
        End If
    End If
    checkType = False

End Sub

Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = currentDatabaseName
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
        btnSettings = GetBtnSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    Else
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()

    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName

    EnableDetail = True
    oldScaleWidth = 10875
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btNext - btPrev - btLast - btFirst
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec - btNext - btPrev - btFirst - btLast
    FormatForm Me
    
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    controllers.Add master, masterFrame.name
    controllers.Add detail, detailFrame.name
    'Init Master rs
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "set dateformat DMY select * from Acc_SanadTMP" & Acc_DBYear & " where type=1", cancel)
    Dim sql As String
    sql = "select id, acc, D,  M, sanadid, Dscrb from Acc_detSanadTMP" & Acc_DBYear & " where sanadid="
    If master.rs.EOF Then
        sql = sql & "0"
        cmdTarhil.Enabled = False
    Else
        sql = sql & master.rs!id
    End If
    Set detail.rs = ExecuteSelect(Conn, sql, cancel)
    Set ActiveFrame = masterFrame
    KeyHandled = False
    SetCaption Me
End Sub

Private Sub Form_Resize()
    Dim Alpha As Double
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
        Exit Sub
    End If
    If MDIMain.WindowState = vbMinimized Then Exit Sub
    
    If Me.WindowState = vbMinimized Then Exit Sub
    
    If ScaleWidth = 0 Then
        Exit Sub
    End If
    Alpha = ScaleWidth / oldScaleWidth
'    masterFrame.Top = masterFrame.Top * Alpha
'    masterFrame.Left = masterFrame.Left * Alpha
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
    
    'resize grid
    'ResizeGrid fg
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fg.Cols - 1
        totWidth = totWidth + fg.ColWidth(i)
    Next
    For i = 0 To fg.Cols - 1
        fg.ColWidth(i) = (fg.Width - 100) * fg.ColWidth(i) / totWidth
    Next
    
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    Set detail = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    txtcDate.Value = Day(Date) & "/" & Month(Date) & "/" & GetCurrentAccYear(Conn)
    Dim c As Boolean
    Set detail.rs = ExecuteSelect(Conn, "select id, acc,  D,  M, sanadid, Dscrb from Acc_DetSanadTMP" & Acc_DBYear & " where sanadid=-1", c)
    If c Then
        MsgBox "ÕœÀ Œÿ√€Ì— „ Êﬁ⁄ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« . «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ ·«Õﬁ«", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    fg.Rows = 1
    txtId.text = SuggestSanadNumber
    cmdTarhil.Caption = " —ÕÌ·"
    cmdTarhil.Enabled = False
    rs!Type = 1
    lblD.Caption = 0
    lblM.Caption = 0
    'detailFrame.visible = False
End Sub
Private Function SuggestSanadNumber() As Long
    Dim sql As String
    Dim c As Boolean
    sql = "select isnull(max(id),0)+1 as m from acc_sanadtmp" & Acc_DBYear & ""
    Set rs = ExecuteSelect(Conn, sql, c)
    If c Then
        MsgBox "ÕœÀ Œÿ√€Ì— „ Êﬁ⁄ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« . «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ ·«Õﬁ«", vbMsgBoxRight + vbMsgBoxRtlReading
        SuggestSanadNumber = -1
        Exit Function
    End If
    SuggestSanadNumber = rs!M
    rs.Close
End Function

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    optAll.visible = True
    optMorahal.visible = True
    optNotMorahal.visible = True
    cmdTarhil.Enabled = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    cmdTarhil.Enabled = True
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    optAll.visible = False
    optMorahal.visible = False
    optNotMorahal.visible = False
    cmdTarhil.Enabled = True
End Sub

'Private Sub master_doDelete(rs As ADODB.Recordset, Cancel As Boolean)
'    If rs!Type = 3 Then
'        MsgBox "·«Ì„ﬂ‰ Õ–› ”‰œ«  «· ”œÌœ!"
'        Cancel = True
'        Exit Sub
'    End If
'End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    Dim cancel As Boolean
    cmdTarhil.Enabled = True
    If master.rs!state = 0 Then
        cmdTarhil.Caption = " —ÕÌ·"
        EnableDetail = True
        'fg.Enabled = True
       ' btnDetailSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
        btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec - btNext - btPrev - btFirst - btLast
        btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
        RefreshCommands FormSettings And btnSettings
    Else
        cmdTarhil.Caption = "≈·€«¡ «· —ÕÌ·"
        EnableDetail = False
        'fg.Enabled = false
        'btnDetailSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec - btnew - btUpdate - btdelete
        btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec - btNext - btPrev - btFirst - btLast - btnew - btUpdate - btDelete
        btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec - btDelete - btUpdate
        RefreshCommands FormSettings And btnSettings
    End If
    Set detail.rs = ExecuteSelect(Conn, "select id, acc, D,  M, sanadid, Dscrb from Acc_DetSanadTMP" & Acc_DBYear & " where sanadid=" & rs!id, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    If detail.rs.EOF Then Exit Sub
'        fg.Rows = 1
'    Else
    detail.rs.MoveFirst
    txtId.SetFocus
'    End If
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    pForm = "Iftitahi"
    Set ToPrintForm = Me
    Acc_MasterRep.Show vbModal, MDIMain
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    If master.state = ST_ADDNEW And fg.Rows < 2 Then
        MsgBox "·‰ Ì „ Õ›Ÿ «·”‰œ Õ Ï  œŒ· √Ê· ﬁÌœ ›ÌÂ° ⁄‰œÂ« ”Ì „ Õ›ŸÂ  ·ﬁ«∆Ì«"
        cancel = True
        detailFrame.visible = True
        detailFrame_Click
       ' detail.addNew
    End If
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    cmdTarhil.Enabled = True
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    If optAll.Value Then
        S = "id<>-1"
    ElseIf optMorahal.Value Then
        S = " state=1"
    ElseIf optNotMorahal.Value Then
        S = " state=0"
    End If
    DefaultType = 1
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    optAll.visible = False
    optMorahal.visible = False
    optNotMorahal.visible = False
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    cmdTarhil.Enabled = False
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If ctrl.name = "txtid" Then
        Dim sql As String
        Dim c As Boolean
        If master.SaveAfterWhat = ST_ADDNEW Then
            sql = " SELECT id FROM acc_sanadtmp" & Acc_DBYear & " where id=" & ctrl.text
        ElseIf master.SaveAfterWhat = ST_UPDATE Then
            sql = " SELECT id FROM acc_sanadtmp" & Acc_DBYear & " where id=" & ctrl.text & " and autoid!=" & master.rs!autoid
        Else
            checkType = False
            Exit Sub
        End If
        
        'Set rs = ExecuteSelect(conn, sql, c)
        Dim unique As Integer
        unique = IsUniqValue(sql)
        If unique < 0 Then
            msg = "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« . «·—Ã«¡«·„Õ«Ê·… „—… √Œ—Ï"
            checkType = True
            Exit Sub
        End If
        If unique = 0 Then
            msg = "—ﬁ„ «·”‰œ «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«° «·—Ã«¡  ⁄œÌ·Â"
            checkType = True
            Exit Sub
        End If
        checkType = False
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
    txtId.SetFocus
    If detail.state <> 0 Then
        detailFrame_Click
    End If
End Sub


Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    If Not master.validate Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings
        SelectFrame Me, detailFrame
        Set ActiveFrame = detailFrame
        RefreshCommands FormDetailSettings And btnDetailSettings
        fg.SetFocus
        fg.Col = 0
        If master.rs.EOF Or master.rs.BOF Or IsNull(master.rs!id) Then
            masterFrame_Click
            Exit Sub
        End If
        If fg.Rows <= 1 Then
            detail.addNew
        End If
        'fg.Row = 1
End Sub

Private Sub fg_ValidateEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    Dim c As Boolean
'    If master.State = 0 Then Exit Sub
    If Col = 0 And fg.editText <> "" Then
       Dim numeric As Boolean
       numeric = IsNumeric(fg.editText)
       If numeric Then 'He entered the number of the account
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where acc='" & fg.editText & "'", c)
       ElseIf InStr(1, fg.editText, "(") > 0 Then
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where '('+acc+')'+name like '" & fg.editText & "'", c)
       Else
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where name like '" & fg.editText & "'", c)
       End If
       If c Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            cancel = True
            Exit Sub
       End If
       If rs.RecordCount <> 1 Then
            rs.Close
            If numeric Then 'He entered the number of the account
                Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where acc='%" & fg.editText & "%'", c)
            Else
                Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where name like '%" & fg.editText & "%'", c)
            End If
            If c Then
                 MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
                 cancel = True
                 Exit Sub
            End If
            If rs.RecordCount <> 1 Then
                   GLOBAL_TAG = ";datafield=,0:acc,1:name,2:num,;"
                   GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetGridAcc,1:SetGridName,2:5,;"
                   If numeric Then
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & fg.editText & ",;"
                   Else
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & fg.editText & ",;"
                   End If
                   GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select acc,name, num from Acc_Fari" & Acc_DBYear & ";"
                   btnDetailSettings = GetBtnSettings
                   Clin_List.fg.Cols = 3
                   Clin_List.fg.ColHidden(2) = True: Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
                   Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
                   Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                   Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
                    Clin_List.fg.Row = 1
                   If numeric Then
                        Clin_List.fg.Col = 0
                   Else
                        Clin_List.fg.Col = 1
                   End If
                   Set Clin_List.CallerForm = Me
                   fg.Cell(flexcpText, fg.Row, 0) = ""
                   fg.Cell(flexcpText, fg.Row, 5) = ""
                   Clin_List.Show 1
                   RefreshCommands btnDetailSettings And FormSettings
                   If fg.Cell(flexcpText, fg.Row, 5) = "" Then cancel = True
                   Exit Sub
            End If
       End If 'rs.RecordCount <> 1
       fg.editText = "(" & rs!acc & ") " & rs!name
       fg.Cell(flexcpText, Row, 5) = rs!Num
    End If
End Sub
Public Sub SetGridAcc(val As String)
    fg.Cell(flexcpText, fg.Row, 0) = val
    fg.editText = val
End Sub
Public Sub SetGridName(val As String)
    fg.Cell(flexcpText, fg.Row, 0) = "(" & fg.text & ") " & val
    fg.editText = "(" & fg.editText & ") " & val
End Sub

Private Sub fg_BeforeRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long, cancel As Boolean)
    If KeyHandled Then
        KeyHandled = False
        cancel = True
        Exit Sub
    End If
    If OldRow = NewRow Then Exit Sub
    If detail.state And (ST_ADDNEW + ST_UPDATE) Then
        detail.Save
        If detail.state And (ST_ADDNEW + ST_UPDATE) Then
            cancel = True
        End If
    End If
End Sub
Private Sub fg_KeyDown(KeyCode As Integer, Shift As Integer)
    If Not ((fg.Row = fg.Rows - 1) And (fg.Col = 3)) Then Exit Sub
    If KeyCode = 9 Or KeyCode = 40 And Shift <> 1 Then
        If detail.state And (ST_ADDNEW + ST_UPDATE) Then
            detail.Save
            If detail.state And (ST_ADDNEW + ST_UPDATE) Then
                Exit Sub
            End If
        End If
        detail.addNew
        fg.Col = 0
        KeyHandled = True
        Exit Sub
    End If
    KeyHandled = False
End Sub


Private Sub cmdTarhil_Click()
    '<AHMAD>
        
         If Acc_DBYear <> "" Then
            MsgBox "·« Ì„ﬂ‰ﬂ  ⁄œÌ· »Ì«‰«  ”‰… „«·Ì… „ﬁ›·… ”«»ﬁ«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
            Exit Sub
        End If
        
         If master.rs.RecordCount = 0 Then
            MsgBox "·« ÌÊÃœ ”‰œ«  · ﬁÊ„ » —ÕÌ·Â«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
            Exit Sub
        End If
        
    '</AHMAD>
    If master.state = ST_SEARCH Or master.state = ST_CANCELSEARCH Then Exit Sub
        Dim cancel As Boolean
        Dim t As String
        master.rs.MoveNext
        master.rs.MovePrevious
        If cmdTarhil.Caption = " —ÕÌ·" Then
             If lblD.Caption <> lblM.Caption Then
                MsgBox "·« Ì„ﬂ‰  —ÕÌ· ”‰œ €Ì— „ Ê«“‰", vbMsgBoxRight + vbMsgBoxRtlReading
                Exit Sub
             End If
             Dim i As Long
             Dim FoundEmpty As Boolean
             FoundEmpty = False
             i = 0
             Do While i < fg.Rows
                    If Trim(fg.Cell(flexcpText, i, 3)) = "" Then
                            FoundEmpty = True
                            Exit Do
                    End If
                    i = i + 1
             Loop
             If FoundEmpty Then
                If MsgBox("ÌÊÃœ ﬁÌœ ·Ì” ·Â »Ì«‰° Â·  —Ìœ «·„ «»⁄… ›Ì «· —ÕÌ·ø", vbMsgBoxRight + vbMsgBoxRtlReading + vbInformation + vbYesNo, " ‰»ÌÂ ·ÊÃÊœ ﬁÌœ ›«—€") = vbNo Then
                    Exit Sub
                End If
            End If
             If lblD.Caption = "0" Then
                MsgBox "·« Ì„ﬂ‰  —ÕÌ· ”‰œ ›«—€", vbMsgBoxRight + vbMsgBoxRtlReading
                Exit Sub
             End If
             t = "1"
        ElseIf cmdTarhil.Caption = "≈·€«¡ «· —ÕÌ·" Then
'            If master.rs!Type = 5 Or master.rs!Type = 4 Then
'                MsgBox "·«Ì„ﬂ‰ ≈·€«¡  —ÕÌ· ”‰œ«  ≈ﬁ›«· «·—»⁄! √Ê ”‰œ«  ﬂ‘Ê› «·„ÿ«·»…", vbMsgBoxRight + vbMsgBoxRtlReading
'                Exit Sub
'            End If
             t = "0"
        End If
        ExecuteCommand Conn, "exec sp_Tarhil " & master.rs!id & ", '" & Acc_DBYear & "','" & t & "'", cancel
        If cancel Then
            MsgBox "·« Ì„ﬂ‰  —ÕÌ· «·”‰œ° Õ’· Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
            Exit Sub
        End If
        master.rs.Resync
        master.rs.MoveNext
        master.rs.MovePrevious
        master.MoveNext
        master.MovePrev
        If master.rs.EOF Then
            master.rs.Filter = ""
'            master.BeginSearch
'            master.Search
'            MsgBox "·„ Ì»ﬁ √Ì ”‰œ«  ›Ì «·»ÕÀ «·„ÿ·Ê»° "
'            master.rs.Requery
        End If
End Sub

Private Sub fg_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 114 Then
        If fg.Col <> 0 Then
            fg.text = fg.Cell(flexcpText, fg.Row - 1)
        End If
    ElseIf KeyCode = 115 Then
        If fg.Col <> 0 Then
            Dim sumCol As Double
            Dim column As Integer
            
            If fg.Col = 1 Then
                sumCol = CDbl(lblD.Caption) - CDbl(lblM.Caption)
                If fg.Cell(flexcpText, fg.Row, 2) <> "" Then
                    sumCol = sumCol - CDbl(fg.Cell(flexcpText, fg.Row, 2))
                    fg.Cell(flexcpText, fg.Row, 2) = 0
                End If
                If sumCol < 0 Then
                    fg.Col = 2
                ElseIf sumCol = 0 Then
                    Exit Sub
                End If
                fg.text = Abs(sumCol)
                Exit Sub
            End If
            If fg.Col = 2 Then
                sumCol = CDbl(lblM.Caption) - CDbl(lblD.Caption)
                If fg.Cell(flexcpText, fg.Row, 1) <> "" Then
                    sumCol = sumCol - CDbl(fg.Cell(flexcpText, fg.Row, 1))
                    fg.Cell(flexcpText, fg.Row, 1) = 0
                End If

                If sumCol < 0 Then
                    fg.Col = 1
                ElseIf sumCol = 0 Then
                    Exit Sub
                End If
                fg.text = Abs(sumCol)
                Exit Sub
            End If
        End If
    ElseIf KeyCode = 116 Then
        If fg.Col = 0 Then
            Dim cancel As Boolean
            fg.editText = " "
            fg_ValidateEdit fg.Row, 0, cancel
        End If
    ElseIf KeyCode = 13 Then
        If fg.Col < fg.Cols - 2 Then
            fg.Col = fg.Col + 1
        End If
    End If
End Sub
Private Sub txtDscrb_KeyDown(KeyCode As Integer, Shift As Integer)
    txtid_KeyDown KeyCode, Shift
End Sub

Private Sub txtDscrb_KeyUp(KeyCode As Integer, Shift As Integer)
    txtid_KeyUp KeyCode, Shift
End Sub

Private Sub txtid_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And Shift = 2 Then 'cotrol key is pressed
        If master.validate Then
            detailFrame_Click
        End If
    End If
End Sub

Private Sub txtid_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyLeft And Shift = 2 And MDIMain.cmdNext.Enabled Then 'control key is pressed
        master.MoveNext
    End If
    If KeyCode = vbKeyRight And Shift = 2 And MDIMain.cmdPrev.Enabled Then
        master.MovePrev
    End If
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKey1 And Shift = 2 Then
        masterFrame_Click
    End If
    If KeyCode = vbKey2 And Shift = 2 Then
        If master.validate Then
            detailFrame_Click
        End If
    End If
    If KeyCode = vbKeyLeft And Shift = 2 And MDIMain.cmdNext.Enabled Then 'control key is pressed
        master.MoveNext
    End If
    If KeyCode = vbKeyRight And Shift = 2 And MDIMain.cmdPrev.Enabled Then
        master.MovePrev
    End If
'    If KeyCode = vbKeyEscape Then
'        If MDIMain.cmdCancel.Enabled Then
'            MDIMain.cmdCancel.SetFocus
'            SendKeys "+{F5}", True
'        ElseIf MDIMain.cmdCancelSearch.Enabled Then
'            MDIMain.cmdCancelSearch.SetFocus
'            SendKeys "+{F8}", True
'        End If
'    End If
    'If KeyCode = 219 And Shift = 2 And MDIMain.cmdPrev.Enabled Then
'       If ActiveFrame = masterFrame And MDIMain.cmdNew.Enabled Then
            'MDIMain
            'MDIMain.cmdNew.SetFocus
            'SendKeys "^{F1}", True
'            master.addNew
'       ElseIf ActiveFrame = detailFrame And MDIMain.cmdNew.Enabled Then
'        detail.addNew
'       End If
    'End If
End Sub


