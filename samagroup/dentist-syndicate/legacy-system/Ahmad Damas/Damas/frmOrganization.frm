VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmOrganization 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… „ƒ””…"
   ClientHeight    =   4710
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9525
   Icon            =   "frmOrganization.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   4710
   ScaleWidth      =   9525
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… „ƒ””…"
      Height          =   4155
      Left            =   90
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   45
      Width           =   9375
      Begin VB.CommandButton cmdLimit 
         BackColor       =   &H00E0E0E0&
         Caption         =   " €Ì— «·”ﬁÊ›"
         Height          =   375
         Left            =   2160
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   3585
         Width           =   1695
      End
      Begin VB.TextBox txtAccount_Number 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   225
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   3030
         Width           =   3120
      End
      Begin MSComCtl2.DTPicker dtMembership_Date 
         DataField       =   "Membership_Date"
         Height          =   375
         Left            =   5520
         TabIndex        =   7
         Tag             =   ";check=date;check=required;search=true;"
         Top             =   3030
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   661
         _Version        =   393216
         Format          =   57409537
         CurrentDate     =   40139
      End
      Begin VB.TextBox txtOrganization_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_Name"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Tag             =   ";search=true;check=required;check=custom;"
         Top             =   600
         Width           =   3135
      End
      Begin VB.ComboBox cmbOrganization_Type_ID 
         DataField       =   "Organization_type_ID"
         Height          =   315
         Left            =   4920
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   1200
         Width           =   3135
      End
      Begin VB.TextBox txtAddress 
         Alignment       =   1  'Right Justify
         DataField       =   "Address"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   2400
         Width           =   7815
      End
      Begin VB.TextBox txtFax 
         Alignment       =   1  'Right Justify
         DataField       =   "Fax"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1800
         Width           =   3135
      End
      Begin VB.TextBox txtMemberOf 
         Alignment       =   1  'Right Justify
         DataField       =   "MemberOf"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   1200
         Width           =   3135
      End
      Begin VB.TextBox txtPhone 
         Alignment       =   1  'Right Justify
         DataField       =   "Phone"
         Height          =   375
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   1800
         Width           =   3135
      End
      Begin VB.TextBox txtOrganization_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_ID"
         Height          =   375
         Left            =   4920
         MaxLength       =   4
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   ";search=true;"
         Top             =   600
         Width           =   3135
      End
      Begin VB.CommandButton cmdAgreement 
         BackColor       =   &H00E0E0E0&
         Caption         =   "« ›«ﬁÌ… ‘—Êÿ «·⁄·«Ã"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   3585
         Width           =   1695
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
         TabIndex        =   9
         Top             =   240
         Width           =   9135
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·‘—ﬂ…"
         Height          =   195
         Left            =   8295
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";search=true;"
         Top             =   690
         Width           =   765
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· ’‰Ì›"
         Height          =   195
         Left            =   8295
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";search=true;"
         Top             =   1290
         Width           =   765
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·Â« ›"
         Height          =   195
         Left            =   8295
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";search=true;"
         Top             =   1920
         Width           =   765
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·⁄‰Ê«‰"
         Height          =   195
         Left            =   8295
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   2520
         Width           =   765
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·«‰ ”«»"
         Height          =   195
         Left            =   8175
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   3150
         Width           =   1005
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·Õ”«» »„Õ«”»… «·‰Ÿ«„"
         Height          =   195
         Left            =   3450
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";search=true;"
         Top             =   3150
         Width           =   1860
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·›«ﬂ”"
         Height          =   195
         Left            =   3720
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   1920
         Width           =   900
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ì »⁄ ·‹:"
         Height          =   195
         Left            =   3720
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   1320
         Width           =   900
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·‘—ﬂ…"
         Height          =   195
         Left            =   3720
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";search=true;"
         Top             =   690
         Width           =   900
      End
   End
End
Attribute VB_Name = "frmOrganization"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Dim oldScaleWidth As Long
Dim Save_After As Controller_State
Dim WithEvents dlgOrganization_Limit As dlgSqlSelect
Attribute dlgOrganization_Limit.VB_VarHelpID = -1
Public Sub OnSqlSelected(ByRef dlgOrganization_Limit As dlgSqlSelect)
    
End Sub
Function get_account_Number(Acc_Number_ID As Long) As String
    Dim rs As New ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "Select acc from acc_accounts where num = " & Acc_Number_ID
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Or rs.EOF Or rs.BOF Then
        get_account_Number = 0
    Else
        get_account_Number = rs.Fields(0).Value
    End If
End Function

Private Sub cmdAgreement_Click()
    If master.rs.RecordCount = 0 Then
        MsgBox "ÌÃ» ⁄·Ìﬂ ≈÷«›… «·„ƒ””… √Ê·«", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    btnSettings = GetBtnSettings
    MDIMain.EnterClinic
    Pic_CommTreats.Show
    Pic_CommTreats.master.BeginSearch
    Pic_CommTreats.txtOrganization_ID.text = txtOrganization_ID.text
    Pic_CommTreats.master.Search
End Sub

Private Sub cmdLimit_Click()
    
    If frmOrganization.master.rs.RecordCount = 0 Then
        MsgBox "ÌÃ» ⁄·Ìﬂ ≈÷«›… „ƒ””… √Ê·«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    Set dlgOrganization_Limit = New dlgSqlSelect
    With dlgOrganization_Limit
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:Limit_id,1:Limit_Date,2:Limit,;"
        .GridTag = .GridTag & "check=,1:required,2:required,;"
        .GridTag = .GridTag & "check=,1:date,;check=,2:integer>0,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,;"
        .sql = "Set DateFormat DMY SELECT  Organization_ID,Limit_Date,Limit, Limit_ID "
        .sql = .sql & " FROM Organization_Limit WHERE Organization_ID = " & master.rs!Organization_Id
        .sql = .sql & " Order by Limit_Date"
        .ColumnsNames = ", «—ÌŒ  €ÌÌ— «·”ﬁ›,«·”ﬁ› «·ÃœÌœ"
        .FrameCaption = " €Ì— «·”ﬁÊ›"
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        Load dlgOrganization_Limit
        .Width = 7000
        .fg.ColDataType(1) = flexDTDate
        '.fg.ColDataType(4) = flexDTDate
        '.master.rs.sort = "Limit_Date ASC"
        Set .Opener = Me
        .cmdCancelDialog.visible = False
        .cmdOK.Left = (.Width - .cmdOK.Width) / 2
        .cmdOK.Caption = "⁄Êœ…"
        .cmdOK.cancel = True
        .Show 1
    End With
    
End Sub

Private Sub Dealing_Amount_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub dlgOrganization_Limit_Load()

End Sub


Private Sub dlgOrganization_Limit_OnDeleteCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim cancel As Boolean
    Set rs = ExecuteSelect(Conn, "Select * from Organization_Limit Where Organization_ID = " & frmOrganization.master.rs!Organization_Id & " order by Limit_Date ", cancel)
    theGrid.Rows = rs.RecordCount + 1
    If Not rs.EOF Then
        rs.MoveLast
    End If
End Sub

Private Sub dlgOrganization_Limit_OnSave(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, cancel As Boolean)
    dlgOrganization_Limit.GridTag = ";typeof=vsflexgrid;datafield=,1:Limit_Date,2:Limit,;check=,1:required,2:required,;check=,1:date,;check=,integer > 0,;HiddenColumns=,0:true,;"
    rs!Organization_Id = master.rs!Organization_Id
End Sub

Private Sub dlgOrganization_Limit_OnSaveCanceled(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    dlgOrganization_Limit.GridTag = ";typeof=vsflexgrid;datafield=,0:Limit_id,1:Limit_Date,2:Limit,;check=,1:required,2:required,;check=,1:date,;check=,integer > 0,;HiddenColumns=,0:true,;"
End Sub

Private Sub dlgOrganization_Limit_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.Tag = ";typeof=vsflexgrid;datafield=,0:Limit_id,1:Limit_Date,2:Limit,;check=,1:required,2:required,;check=,1:date,;check=,integer > 0,;HiddenColumns=,0:true,;"
    theGrid.Cell(flexcpText, theGrid.Row, 0) = rs.Fields(0).Value
End Sub

Private Sub dlgOrganization_Limit_OnSearchCanceled(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
'    Dim Cancel  As Boolean
'    theGrid.Clear , flexClearData
'    Set rs = ExecuteSelect(Conn, "Select * from Organization_Limit Where Organization_ID = " & _
'                master.rs!Organization_Id & "Order by Limit_Date", Cancel)
'    rs.Filter = ""
'    rs.Requery
'    If Not rs.EOF Then
'        rs.MoveLast
'    End If
'    theGrid.Rows = rs.RecordCount + 1
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    If MDIMain.ActiveForm.name <> "Pic_CommTreats" Then
        btnSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9615
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select *  from Organization order by 1", cancel)
    InitFrame
    If master.rs.RecordCount = 0 Then
        cmdAgreement.Enabled = False
        cmdLimit.Enabled = False
    End If
    
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    fillCmb cmbOrganization_Type_ID, "select Organization_Type_id as ID,Organization_Type_Name as Name from FixOrganization_Type order by 1"
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
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    cmdAgreement.Enabled = False
    cmdLimit.Enabled = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    cmdAgreement.Enabled = True
    cmdLimit.Enabled = True
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    cmdAgreement.Enabled = True
    cmdLimit.Enabled = True
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
'    cmbOrganization_Type_ID.ListIndex = _
'            GetListIndex(cmbOrganization_Type_ID, rs.Fields("Organization_Type_ID").Value)
    
    Dim cancel As Boolean
    Dim rsAccount_Number As ADODB.Recordset
    If Not IsNull(master.rs!Account_Number_ID) Then
        Set rsAccount_Number = ExecuteSelect(Conn, "Select acc from acc_accounts where num = " & master.rs!Account_Number_ID, cancel)
        
        If Not (cancel Or rsAccount_Number.EOF Or rsAccount_Number.BOF) Then
            txtAccount_Number.text = rsAccount_Number.Fields(0).Value
        Else
            txtAccount_Number.text = ""
        End If
    End If
    
End Sub


Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    Save_After = master.state
    txtAccount_Number.datafield = ""
    End Sub
    Private Sub master_doSaveError(ByVal state As Controller_State, ByRef rs As ADODB.Recordset, ByRef ErrorObeject As ErrObject, ByRef msg As String, ByRef KeepState As Boolean)
        msg = "«”„ «·„ƒ””… «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«ı° «·—Ã«¡ ≈œŒ«· «”„ „ƒ””… „Œ ·› , ÌÃ» ≈·€«¡ «·≈÷«›… Ê «·„Õ«Ê·… „‰ ÃœÌœ"
    End Sub
Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    If Save_After = ST_ADDNEW Then
        txtOrganization_ID.text = rs!Organization_Id
        rs.Requery
        rs.MoveLast
        txtAccount_Number.text = get_account_Number(rs!Account_Number_ID)
    End If
    txtAccount_Number.datafield = "Account_Number_ID"
    cmdAgreement.Enabled = True
    cmdLimit.Enabled = True
    'MsgBox "ÌÃ» ≈⁄«œ… › Õ «·Ê«ÃÂ… „‰ ÃœÌœ · Õ„Ì· —ﬁ„ «·‘—ﬂ… «·„œŒ·… ÕœÌÀ«"
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select *  from Organization order by Organization_id desc", cancel)
    master.RefreshNav
  ' InitFrame
   ' Dim cancel As Boolean
    'master.rs = ExecuteSelect(Conn, " select * from Organization ", cancel)
End Sub


Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    cmdAgreement.Enabled = True
    cmdLimit.Enabled = True
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    If master.state = ST_SEARCH Then
        cmdAgreement.Enabled = False
        cmdLimit.Enabled = False
    End If
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    cmdAgreement.Enabled = False
    cmdLimit.Enabled = False
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
      Dim sql As String
      Dim cancel As Boolean
      Dim rsCheck As New ADODB.Recordset
     'If (master.state = ST_ADDNEW Or master.state = ST_UPDATE) And ctrl = txtOrganization_ID Then
     '
'
'        sql = " select count(*) from Organization where Organization_ID = " & val(txtOrganization_ID.text)
'
'        If master.state = ST_UPDATE Then
'                sql = sql + " and Organization_ID <> " & master.rs!Organization_Id
'        End If
'        Set rsCheck = ExecuteSelect(Conn, sql, cancel)
'        If rsCheck.Fields(0).Value > 0 Then
'             msg = "—ﬁ„ «·„ƒ””… «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«ı° «·—Ã«¡ ≈œŒ«· —ﬁ„ „ƒ””… „Œ ·›"
'             checkType = True
'        End If
'
'    End If
'   If ctrl = txtOrganization_Name And master.state = ST_ADDNEW Then
'        sql = " select count(Organization_ID) from Organization where Organization_Name like  '" & txtOrganization_Name.text & "'"
'        Set rsCheck = Nothing
'        Set rsCheck = ExecuteSelect(Conn, sql, cancel)
'        If rsCheck.Fields(0).Value > 0 Then
'             msg = "«”„ «·„ƒ””… «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«ı° «·—Ã«¡ ≈œŒ«· «”„ „ƒ””… „Œ ·›"
'             checkType = True
'        End If
'   End If ' if new
End Sub

Private Sub txtLimit_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    txtOrganization_Name.SetFocus
    cmbOrganization_Type_ID.ListIndex = 0
    dtMembership_Date.Value = True
    dtMembership_Date.Value = Date
    cmdAgreement.Enabled = False
    cmdLimit.Enabled = False
    txtAccount_Number.text = ""
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtBranch_Account_No_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtLasting_Worker_Limit_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtOrganization_ID_KeyPress(KeyAscii As Integer)
    If master.state <> ST_SEARCH Then
        KeyAscii = 0
    Else
        KeyAscii = Prevent_char(KeyAscii)
    End If
End Sub

Private Sub txtTemporary_worker_Limit_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtOrganization_Name_Change()
  '  Dim sql As String
  '  Dim rsCheck As ADODB.Recordset
  ' If master.state = ST_ADDNEW Then
  '      sql = " select count(*) from Organization where Organization_Name like ' " & txtOrganization_Name.text & "'"
  '      Set rsCheck = ExecuteSelect(Conn, sql, cancel)
  '      If rsCheck.Fields(0).Value > 0 Then
  '           msg = "«”„ «·„ƒ””… «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«ı° «·—Ã«¡ ≈œŒ«· «”„ „ƒ””… „Œ ·›"
  '           checkType = True
  '      End If
  ' End If ' if new
End Sub
