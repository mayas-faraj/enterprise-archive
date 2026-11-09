VERSION 5.00
Begin VB.Form frmPaymentIsalReview 
   BackColor       =   &H00E1FEFF&
   Caption         =   "„—«Ã⁄… √Ê«„— «·ﬁ»÷"
   ClientHeight    =   3570
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9570
   Icon            =   "frmPaymentIsalReview.frx":0000
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   3570
   ScaleWidth      =   9570
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·≈Ì’«·"
      Height          =   3375
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   9375
      Begin VB.ComboBox cbReviewStatus 
         ForeColor       =   &H00404040&
         Height          =   315
         ItemData        =   "frmPaymentIsalReview.frx":1CFA
         Left            =   7440
         List            =   "frmPaymentIsalReview.frx":1D0A
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Tag             =   ";search=true;"
         Top             =   2400
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.ComboBox cbType 
         ForeColor       =   &H00404040&
         Height          =   315
         ItemData        =   "frmPaymentIsalReview.frx":1D42
         Left            =   3165
         List            =   "frmPaymentIsalReview.frx":1D4F
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   19
         Tag             =   ";search=true;"
         Top             =   960
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtDate 
         Alignment       =   1  'Right Justify
         DataField       =   "OnDate"
         Height          =   375
         Left            =   5040
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   1695
      End
      Begin VB.TextBox txtPayer 
         Alignment       =   1  'Right Justify
         DataField       =   "Payer"
         Height          =   375
         Left            =   5040
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   3735
      End
      Begin VB.TextBox txtType 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   3165
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   960
         Width           =   1335
      End
      Begin VB.CommandButton cmdTarheel 
         BackColor       =   &H00E1FEFF&
         Caption         =   " —ÕÌ·"
         Height          =   675
         Left            =   8295
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   2430
         Width           =   795
      End
      Begin VB.CommandButton cmdCancel 
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈·€«¡"
         Height          =   675
         Left            =   7440
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   2430
         Width           =   795
      End
      Begin VB.TextBox txtDescription 
         Alignment       =   1  'Right Justify
         DataField       =   "Description"
         Height          =   735
         Left            =   3165
         Locked          =   -1  'True
         MaxLength       =   500
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Tag             =   ";search=true;"
         Top             =   1440
         Width           =   5610
      End
      Begin VB.TextBox txtTotal 
         Alignment       =   1  'Right Justify
         DataField       =   "Total"
         Height          =   375
         Left            =   3165
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   1335
      End
      Begin VB.TextBox txtId 
         Alignment       =   1  'Right Justify
         DataField       =   "Id"
         Height          =   375
         Left            =   7560
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   1215
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
         Width           =   9135
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„"
         Height          =   195
         Index           =   0
         Left            =   8925
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   570
         Width           =   330
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰"
         Height          =   195
         Index           =   3
         Left            =   9075
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1050
         Width           =   180
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         Height          =   195
         Index           =   5
         Left            =   6780
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   570
         Width           =   510
      End
      Begin VB.Label lblReviewStatus 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "√„— ﬁ»÷ „·€Ï »”»»: "
         BeginProperty DataFormat 
            Type            =   0
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   675
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2430
         Visible         =   0   'False
         Width           =   8760
      End
      Begin VB.Label lblTasdeedState 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   0
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   1515
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   720
         Visible         =   0   'False
         Width           =   2880
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·»Ì«‰"
         Height          =   195
         Index           =   2
         Left            =   8880
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1530
         Width           =   375
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·‰Ê⁄"
         Height          =   195
         Index           =   4
         Left            =   4590
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1050
         Width           =   345
      End
      Begin VB.Label lblTasdeed 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   " ”œÌœ —”Ê„ ”‰ÊÌ… Ê›ﬁ"
         Height          =   255
         Left            =   1080
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";AlwaysEnabled=true;search=false;"
         Top             =   480
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„»·€"
         Height          =   195
         Index           =   1
         Left            =   4560
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   570
         Width           =   375
      End
      Begin VB.Shape shpReviewStatus 
         BackColor       =   &H00C0E0FF&
         BackStyle       =   1  'Opaque
         Height          =   975
         Left            =   120
         Top             =   2280
         Width           =   9135
      End
   End
End
Attribute VB_Name = "frmPaymentIsalReview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public controllers As New Collection

Dim WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public FormSettings As Long
Public btnSettings As Long

Dim ActiveFrame As frame
Dim oldScaleWidth As Long

Private rsMecanism As ADODB.Recordset
Private rsTasdeedState As ADODB.Recordset
Private Watha2eqMecanism As Integer

Private Sub Lock_Controls(ByVal Value As Boolean)
    txtid.locked = Value
    txtPayer.locked = Value
    txtDate.locked = Value
    txtTotal.locked = Value
    txtDescription.locked = Value
    txtType.locked = Value
End Sub

Private Sub cmdCancel_Click()
    If master.rs.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈·€«¡ «· —ÕÌ· «·¬‰ ·√‰Â ·« ÌÊÃœ ·œÌﬂ √Ê«„— ﬁ»÷ »⁄œ", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    Dim id As Integer
    Dim rsGetRealIsalID As ADODB.Recordset
    Dim sql As String
    Dim c As Boolean
    
    ActiveDatabaseName = "Fari"
    
    sql = "set dateformat dmy select id from PaymentsIsal Where id = " & master.rs!id & " and onDate = '" & master.rs!OnDate & "'"
    
    Set rsGetRealIsalID = ExecuteSelect(Conn, sql, c)
    
    If c Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡  ÕœÌœ «·≈Ì’«·", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    
    If rsGetRealIsalID.EOF Or rsGetRealIsalID.BOF Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡  ÕœÌœ «·≈Ì’«·", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    
    id = rsGetRealIsalID.Fields(0).Value
    dlgPaymentIsalCancel.id = id
    dlgPaymentIsalCancel.Show 1
    Dim F As String
    F = master.rs.Filter
    master.rs.Requery
    If F <> "0" Then
        master.rs.Filter = F
    Else
        master.rs.Filter = ""
    End If
    master.rs.Find "Id = " & id
    If master.rs.EOF Then
        If MsgBox(" „  „—«Ã⁄… Ã„Ì⁄ «·≈Ì’«·« ° Â·  —Ìœ ≈·€«¡ «·»ÕÀø ≈÷€ÿ ·« ·≈€·«ﬁ «·Ê«ÃÂ… «·Õ«·Ì….", vbYesNo Or vbMsgBoxRight Or vbMsgBoxRtlReading Or vbQuestion) = vbYes Then
            master.rs.Filter = ""
            master.rs.Find "Id = " & id
        Else
            Unload Me
        End If
    End If
End Sub

Private Sub cmdTarheel_Click()
    If master.rs.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ «· —ÕÌ· «·¬‰ ·√‰Â ·« ÌÊÃœ ·œÌﬂ √Ê«„— ﬁ»÷ »⁄œ", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    ''Dim id1 As Integer
    ''id1 = master.rs!id
    If txtType.text = "—”Ê„  ”œÌœ" Then
        performTarheel "null"
    ElseIf txtType.text = "Ê«—œ«  ÊÀ«∆ﬁ" Then
        performTarheel master.rs!mecanism
    Else
        With dlgSqlSelect
            .GridTag = ";typeof=vsflexgrid;datafield=,0:master.rs!id,1:account,2:description,;check=,1:required,2:required,;HiddenColumns=,0:true,;"
            .GridTag = .GridTag & ";lookup=,1:Account,;parentTables=,1:vAccounts,;parentFields=,1:num,;"
            .sql = "SELECT * From PaymentsTarheelMecanism"
            .ColumnsNames = ",«·Õ”«», ›’Ì· «·ﬁÌœ «·„ Ê·œ ¬·Ì«"
            .FrameCaption = "¬·Ì…  —ÕÌ· ≈Ì’«· «·ﬁ»÷ ≈·Ï «·„Õ«”»…"
            Set .Opener = Me
            .Show 1
            rsMecanism.Requery
        End With
    End If
    Dim F As String
    F = master.rs.Filter
    master.rs.Requery
    If F <> "0" Then
        master.rs.Filter = F
    Else
        master.rs.Filter = ""
    End If
    master.rs.Find "Id = " & master.rs!id
    If master.rs.EOF Then
        If MsgBox(" „  „—«Ã⁄… Ã„Ì⁄ «·≈Ì’«·« ° Â·  —Ìœ ≈·€«¡ «·»ÕÀø ≈÷€ÿ ·« ·≈€·«ﬁ «·Ê«ÃÂ… «·Õ«·Ì….", vbYesNo Or vbMsgBoxRight Or vbMsgBoxRtlReading Or vbQuestion) = vbYes Then
            master.rs.Filter = ""
            master.rs.Find "Id = " & master.rs!id
        Else
            Unload Me
        End If
    End If
End Sub

Private Sub CPos_Change()

End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "fari"
    SelectFrame Me, ActiveFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9690

    FormSettings = btall - btNew - btUpdate - btDelete - btsave - btCancel
    btnSettings = btPrint Or btSearch Or btPrev Or btFirst Or btNext Or btLast

    FormatForm Me

    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    master.TraceChanges = True
    controllers.Add master, masterFrame.name

    InitFrame

    Dim cancel As Boolean
    Dim sql As String
    
    Dim AccYear As String
    sql = " SELECT  id, Payer, OnDate, Description," & vbLf & _
          " Total, IsTasdeed,mecanism , IsCanceled, notes, sanadId, TasdeedState " & vbLf & _
          " FROM DocDbAccM.dbo.PaymentsIsal" & vbLf & _
          " Order by year(ondate),1"
    Set master.rs = ExecuteSelect(Conn, sql, cancel)

    Set ActiveFrame = masterFrame
    
    '<AHMAD>
        If master.rs.RecordCount = 0 Then
            cmdCancel.visible = False
            cmdTarheel.visible = False
        End If
    '</AHMAD>
End Sub

Private Sub InitFrame()
    Dim c As Boolean
    Set rsMecanism = ExecuteSelect(Conn, "SELECT Id, Description FROM vPaymentsTarheelMecanisms", c)
    Set rsTasdeedState = ExecuteSelect(Conn, "SELECT Id, Description FROM vTasdeedStatesDescriptions", c)
    rsMecanism.Filter = "Description like '%Ê«—œ«  „‰ «·ÊÀ«∆ﬁ%'"
    Watha2eqMecanism = rsMecanism!id
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
    Dim isVertical As Boolean
    Dim W As Single
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    RefreshCommands 0
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    lblTasdeedState.visible = False
    lblTasdeed.visible = False
    shpReviewStatus.visible = False
    cmdTarheel.visible = False
    cmdCancel.visible = False
    lblReviewStatus.visible = False
    cbType.visible = True
    cbType.ListIndex = -1
    cbReviewStatus.visible = True
    cbReviewStatus.ListIndex = -1
    Lock_Controls False
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    shpReviewStatus.visible = True
    cbType.visible = False
    cbReviewStatus.visible = False
    Lock_Controls True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    lblTasdeed.visible = False
    lblTasdeedState.visible = False
    txtType.text = "Ê«—œ«  „Œ ·›…"
    If rs!IsTasdeed = 1 Then
        txtType.text = "—”Ê„  ”œÌœ"
        lblTasdeed.visible = True
        lblTasdeedState.visible = True
        If Not IsNull(rs!TasdeedState) Then
            rsTasdeedState.Filter = "Id = " & rs!TasdeedState
            lblTasdeedState.Caption = rsTasdeedState!description
        End If
    ElseIf Not IsNull(rs!mecanism) Then
        If rs!mecanism = Watha2eqMecanism Then
            txtType.text = "Ê«—œ«  ÊÀ«∆ﬁ"
        End If
    End If
    Dim locked As Boolean
    locked = Not IsNull(rs!sanadId) Or (rs!IsCanceled = 1)
    lblReviewStatus.visible = locked
    cmdTarheel.visible = Not locked
    cmdCancel.visible = Not locked
    If locked Then
        If IsNull(rs!sanadId) Then
            lblReviewStatus.Caption = "„·€Ï »”»»: " & rs!notes
        ElseIf lblTasdeedState.visible Then
            lblReviewStatus.Caption = "„—Õ¯· ≈·Ï «·„Õ«”»…° Ê›ﬁ ¬·Ì… «· —ÕÌ· «·„Õœœ… »Õ«·… «· ”œÌœ ÷„‰ «·ﬁ—«— «·„–ﬂÊ— √⁄·«Â. ·„“Ìœ „‰ «·„⁄·Ê„«  —«Ã⁄ ”‰œ «·ﬁÌœ —ﬁ„ /" & rs!sanadId & "/"
        Else
            rsMecanism.Filter = "Id = " & rs!mecanism
            lblReviewStatus.Caption = "„—Õ¯· ≈·Ï «·„Õ«”»… Ê›ﬁ «·¬·Ì…: " & rsMecanism!description & ". ·„“Ìœ „‰ «·„⁄·Ê„«  —«Ã⁄ ”‰œ «·ﬁÌœ —ﬁ„ /" & rs!sanadId & "/"
        End If
    End If
    
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If master.rs.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ «·ÿ»«⁄… «·¬‰ ·√‰Â ·« ÌÊÃœ ·œÌﬂ √Ê«„— ﬁ»÷ »⁄œ", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    Dim lblCost, lblFormType, lbl As RptLabel
    Set DRFormIsal.DataSource = ExecuteSelect(Conn, "SELECT 1", cancel)
    DRFormIsal.DataMember = ""

    Get_DataReport_Label_byName(DRFormIsal, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblBranchPhone").Caption = Current_State.Phone
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblSerial").Caption = rs!id
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblFrom").Caption = rs!Payer
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblDate").Caption = rs!OnDate
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblDescription").Caption = rs!description
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblTotal").Caption = rs!Total & " ·.”"
    DRFormIsal.Show 1
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    If cbType.ListIndex >= 0 Then
        S = S & IIf(cbType.ListIndex = 0, "IsTasdeed=1", IIf(cbType.ListIndex = 1, "Mecanism=" & Watha2eqMecanism, "IsTasdeed=0 and Mecanism<>" & Watha2eqMecanism))
        DefaultType = 1
    End If
    If cbReviewStatus.ListIndex >= 0 Then
        If S <> "" Then S = S & " and "
        Select Case cbReviewStatus.ListIndex
            Case 0
                S = S & "IsCanceled=0 and SanadId = null"
            Case 1
                S = S & "IsCanceled=1 or SanadId <> null"
            Case 2
                S = S & "SanadId <> null"
            Case 3
                S = S & "IsCanceled=1"
        End Select
        DefaultType = 1
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then Exit Sub
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Public Sub OnSqlSelected(ByRef dialogForm As dlgSqlSelect)
    Dim mecanism As Integer
    If dialogForm.master.rs.RecordCount = 0 Or dialogForm.master.rs.EOF Then
        Exit Sub
    End If
    Select Case dialogForm.FrameCaption
        Case "¬·Ì…  —ÕÌ· ≈Ì’«· «·ﬁ»÷ ≈·Ï «·„Õ«”»…"
            performTarheel dialogForm.master.rs!id
        Case Else
            MsgBox "Œÿ√  ﬁ‰Ì  ”»» ›Ì ≈ŸÂ«— „—»⁄ «·«Œ Ì«— »œÊ‰ „⁄«·Ã… «·ﬁÌ„… «·„Œ «—…"
    End Select
End Sub

Private Sub performTarheel(ByVal mecanism As String)
    Dim c As Boolean
    Dim sql As String
    sql = "set dateformat dmy exec sp_PaymentIsalMigration " & master.rs!id & ", '" & master.rs!Payer
    sql = sql & "', '" & format(master.rs!OnDate, "dd/mm/yyyy") & "', '" & master.rs!description
    sql = sql & "', " & master.rs!Total & ", " & master.rs!IsTasdeed
    sql = sql & ", " & mecanism & ", "
    If IsNull(master.rs!TasdeedState) Then
    sql = sql & "null"
    Else
    sql = sql & master.rs!TasdeedState
    End If
    ExecuteCommand Conn, sql, c
    If c Then
    MsgBox "·„  ‰ÃÕ «·⁄„·Ì….", vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading
    Else
    MsgBox "‰ÃÕ  «·⁄„·Ì….", vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading
    End If
End Sub

