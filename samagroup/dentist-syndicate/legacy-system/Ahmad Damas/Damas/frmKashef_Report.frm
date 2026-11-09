VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmKashef_Report 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”Ã· „ÿ«·»«  «·„ƒ””« "
   ClientHeight    =   8340
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   13080
   Icon            =   "frmKashef_Report.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8340
   ScaleWidth      =   13080
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ›«’Ì· «·„ÿ«·»… —ﬁ„"
      Height          =   4590
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   ";repeat=true;"
      Top             =   3480
      Width           =   12915
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   240
         Width           =   12675
      End
      Begin VSFlex7Ctl.VSFlexGrid fgDetails 
         Height          =   3555
         Left            =   150
         TabIndex        =   4
         Tag             =   ";typeof=vsflexgrid;datafield=,0:Central_Exam_ID,1:Central_Exam_Date,2:Patient_Name,3:Curer_Doctor_Name,4:Whole_Total,;"
         Top             =   480
         Width           =   12660
         _cx             =   22331
         _cy             =   6271
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
         Cols            =   5
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmKashef_Report.frx":1CFA
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
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Ã„Ê⁄ «·≈Õ«·« "
         Height          =   255
         Left            =   5535
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4170
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label lblSum 
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
         Left            =   3975
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4170
         Visible         =   0   'False
         Width           =   1335
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
         Left            =   10290
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4170
         Width           =   1335
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·≈Õ«·« "
         Height          =   255
         Left            =   11850
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4170
         Width           =   855
      End
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·ﬂ‘Ê›« "
      Height          =   3255
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   12960
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
         Width           =   12675
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   2655
         Left            =   120
         TabIndex        =   5
         Tag             =   $"frmKashef_Report.frx":1DB6
         Top             =   480
         Width           =   12705
         _cx             =   22410
         _cy             =   4683
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
         AllowBigSelection=   0   'False
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
         FormatString    =   $"frmKashef_Report.frx":1E55
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
   End
End
Attribute VB_Name = "frmKashef_Report"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long

Public FormDetailSettings As Long
Public btnDetailSettings As Long

Dim oldScaleWidth As Long
Dim IsLoadinfForm As Boolean
Dim Current_Kashef_ID As Long
Function Get_Month_Name(Start_Date As String) As String
    Select Case DatePart("m", Start_Date)
    Case 1:  Get_Month_Name = "ﬂ«‰Ê‰ «·À«‰Ì"
    Case 2:  Get_Month_Name = "‘»«ÿ"
    Case 3:  Get_Month_Name = "¬–«—"
    Case 4:  Get_Month_Name = "‰Ì”«‰"
    Case 5:  Get_Month_Name = "√Ì«—"
    Case 6:  Get_Month_Name = "Õ“Ì—«‰"
    Case 7:  Get_Month_Name = " „Ê“"
    Case 8:  Get_Month_Name = "¬»"
    Case 9:  Get_Month_Name = "√Ì·Ê·"
    Case 10: Get_Month_Name = " ‘—Ì‰ «·√Ê·"
    Case 11: Get_Month_Name = " ‘—Ì‰ «·À«‰Ì"
    Case 12: Get_Month_Name = "ﬂ«‰Ê‰ «·√Ê·"
    End Select
End Function
Public Sub MoveRSToSelectedRow(ctrl As Control, rs As ADODB.Recordset)
        If Not (rs.EOF Or rs.BOF) Then
            If rs.EditMode = adEditAdd Then Exit Sub
        End If
        master.state = master.state + ST_FILLGRID
        If Not (rs.EOF Or rs.BOF Or rs.RecordCount = 0) Then
            rs.MoveFirst
            rs.Move ctrl.Row - 1
        End If
       ' Debug.Print ctrl.Row
        'If rs.EOF Then Debug.Print "hi"
        
        master.state = master.state - ST_FILLGRID
End Sub
Private Sub detailFrame_Click()
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands btnDetailSettings And FormDetailSettings
End Sub



Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state <> ST_SEARCH Then
        cancel = True
    ElseIf Row <> 1 Then
        cancel = True
    End If
End Sub


Private Sub fg_Click()
    MousePointer = vbHourglass
    If master.state = ST_FILLGRID Then Exit Sub
    If fg.Cell(flexcpText, fg.Row, 1) <> "" Then
'     master.rs.MoveFirst
'     MoveRSToSelectedRow fg, master.rs
'
        master_doMoveComplete master.rs
        
        Dim i As Integer
        
'        lblSum.Caption = 0
        
'        For i = 0 To fgDetails.Rows - 1
'            lblSum.Caption = val(lblSum.Caption) + val(fgDetails.Cell(flexcpText, i, 4))
'        Next i
        
    End If
    MousePointer = vbDefault
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
'    If (master.rs.RecordCount = 0) Then
'        master.addNew
'    End If
     ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    
    oldScaleWidth = 13200
    FormSettings = btall - btNew - btUpdate - btDelete - btCancel - btsave
    btnSettings = btall - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btPrev - btFirst - btNext - btLast - btNew - btPrint - btUpdate - btDelete - btCancel - btsave
    btnDetailSettings = btall - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    master.TraceChanges = True
    Set master.Form = Me
    Set master.frame = masterFrame
    Set details = New Controller
    Set details.Form = Me
    Set details.frame = detailFrame
    controllers.Add master, masterFrame.name
    controllers.Add details, detailFrame.name
    Dim cancel As Boolean
    Dim sql As String
    sql = "Select k.*,Organization_name " & _
          "from Organization_Kashef k,Organization O " & _
          " Where k.Organization_ID = O.Organization_ID "
   
    IsLoadinfForm = True
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    
    InitFrame

    Set ActiveFrame = masterFrame

    IsLoadinfForm = False
    
    If Current_State.Show_Per_Company = False Then
        fgDetails.Tag = ";typeof=vsflexgrid;datafield=,0:Central_Exam_ID,1:Central_Exam_Date,2:Patient_Name,3:Curer_Doctor_Name,4:Whole_Total,;"
    Else
        fgDetails.Tag = ";typeof=vsflexgrid;datafield=,0:Ihala_ID_in_Company,1:Central_Exam_Date,2:Patient_Name,3:Curer_Doctor_Name,4:Whole_Total,;"
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
    ResizeGrid fgDetails
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub



Private Sub master_doBeforeSearchAfterBeginSearch(rs As ADODB.Recordset, cancel As Boolean)
    Dim i As Integer
    Dim str As String
    For i = 0 To fg.Cols - 2
        str = str + Trim(fg.Cell(flexcpText, 1, i))
    Next i
    If Trim(str) = "" Then
        MsgBox "·„  ﬁ„ » ÕœÌœ „⁄«„·«  «·»ÕÀ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
    End If
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    If master.state = ST_FILLGRID Then Exit Sub
    On Error GoTo ErrHndlr
    Dim cancel As Boolean
    Dim sql As String
   
    sql = "Select  * from vCentral_exam where moved = 1 and Kashef_ID = " & val(fg.Cell(flexcpText, fg.Row, 8))
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    If Not cancel Then
        lblRecordCount.Caption = details.rs.RecordCount
        detailFrame.Caption = " ›«’Ì· «·„ÿ«·»… —ﬁ„" & val(fg.Cell(flexcpText, fg.Row, 1))
    End If
   
    If Not details.rs.EOF Then
        details.MoveFirst
    End If
ErrHndlr:
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
'--------------------------------------------------------------------------------------------------------------------
'    On Error GoTo ErrHandler
'    Dim Cancel As Boolean
'    If Details.rs.RecordCount = 0 Then Exit Sub
'    Get_DataReport_Label_byName(DrMoved_Motalabat, 1, "lblStateName").Caption = Current_State.FullName
'    Get_DataReport_Label_byName(DrMoved_Motalabat, 1, "lblAsking_No").Caption = fg.Cell(flexcpText, fg.Row, 1)
'    Get_DataReport_Label_byName(DrMoved_Motalabat, 1, "lblAsking_Date").Caption = fg.Cell(flexcpText, fg.Row, 2)
'    Get_DataReport_Label_byName(DrMoved_Motalabat, 1, "lblOrganization_No").Caption = fg.Cell(flexcpText, fg.Row, 3)
'    Get_DataReport_Label_byName(DrMoved_Motalabat, 1, "lblOrganization_Name").Caption = fg.Cell(flexcpText, fg.Row, 4)
'    Get_DataReport_Label_byName(DrMoved_Motalabat, 1, "lblAmount").Caption = fg.Cell(flexcpText, fg.Row, 6)
'    Set DrMoved_Motalabat.DataSource = Details.rs '  ExecuteSelect(Conn, "Select * from vKashef_Details where Kashef_ID = " & val(fg.Cell(flexcpText, fg.Row, 8)), cancel)
'    DrMoved_Motalabat.Show 1
'    Exit Sub
'ErrHandler:
'---------------------------------------------------------------------------------------------------------------------
    On Error GoTo errHandler
    
    Dim TmpRs As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "Set DateFormat dmy Select f.*,Organization_Name from Organization_Kashef f, Organization O " & _
          "Where O.Organization_ID = F.Organization_ID and Kashef_ID =" & val(fg.Cell(flexcpText, fg.Row, 8))
    
    Set TmpRs = ExecuteSelect(Conn, sql, cancel)
    
    If TmpRs.EOF Or TmpRs.BOF Or cancel Then Exit Sub
    
    If TmpRs.RecordCount = 0 Or details.rs.RecordCount = 0 Then Exit Sub
    
    If TmpRs!Kashef_Type = 0 Then
        With DRCompanyMoney
            Get_DataReport_Label_byName(DRCompanyMoney, 1, "lblMoved").visible = True
            .Sections(1).Controls(1).Caption = Current_State.FullName
            .Sections(1).Controls(11).Caption = TmpRs!Organization_Name
            .Sections(1).Controls(13).Caption = Get_Month_Name(TmpRs!Start_Date)
            .Sections(1).Controls(18).Caption = year(TmpRs!Start_Date)
            .Sections(1).Controls(15).Caption = TmpRs!Asking_No
            .Sections(1).Controls(16).Caption = TmpRs!Asking_Date
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name").Caption = Current_State.name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name1").Caption = Current_State.name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name2").Caption = Current_State.name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblAccount_Number").Caption = Current_State.Account_Number
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblBoss").Caption = Current_State.Boss
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblAccountant").Caption = Current_State.Accountant
            Set .DataSource = details.rs
            Dim lblTaff As RptLabel
            Set lblTaff = Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblTaff")
            lblTaff.Caption = WriteNo(TmpRs!Kashef_Amount, 0)
            .Show 1
        End With
    Else
        With DrCompanyExamList
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblMoved").visible = True
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblStateName").Caption = Current_State.name
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblOrganization_Name").Caption = TmpRs!Organization_Name
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblAsking_No").Caption = TmpRs!Asking_No
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblAsking_Date").Caption = TmpRs!Asking_Date
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblState_Name").Caption = Current_State.name
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblAccount_Number").Caption = Current_State.Account_Number
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblBoss").Caption = Current_State.Boss
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblAccountant").Caption = Current_State.Accountant
            Set .DataSource = details.rs
            Set lblTaff = Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblTaff")
            lblTaff.Caption = WriteNo(TmpRs!Kashef_Amount, 0)
            .Show 1
        End With
    End If
    Exit Sub
errHandler:
    Debug.Print Err.description
    If Err.Number = 8542 Then
        MsgBox " «·—Ã«¡  €ÌÌ— ⁄—÷ «·Ê—ﬁ ›Ì «·ÿ«»⁄… «·«› —«÷Ì…", vbCritical, "Õÿ√ ÿ»«⁄…"
        Exit Sub
    End If
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ÿ»«⁄… «· ﬁ—Ì—", vbCritical
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    detailFrame.Caption = " ›«’Ì· «·„ÿ«·»… —ﬁ„" & val(fg.Cell(flexcpText, fg.Row, 8))
End Sub

Private Sub masterFrame_Click()
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub
