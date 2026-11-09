VERSION 5.00
Begin VB.Form frmPatient 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… „—Ì÷"
   ClientHeight    =   4620
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9480
   Icon            =   "frmPatient.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   4620
   ScaleWidth      =   9480
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… „—Ì÷"
      Height          =   4425
      Left            =   75
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   75
      Width           =   9375
      Begin VB.TextBox txtIdentityCard 
         Alignment       =   1  'Right Justify
         DataField       =   "CardIdentityID"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;check=required;"
         Top             =   1920
         Width           =   3135
      End
      Begin VB.CommandButton cmdWithout_Exam 
         Caption         =   "»œÊ‰ ÿ»Ì» ›«Õ’"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   3660
         Width           =   1380
      End
      Begin VB.CommandButton cmdCentral_Exam 
         Caption         =   "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
         Height          =   375
         Left            =   1890
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   3660
         Width           =   1470
      End
      Begin VB.ComboBox cmbPatient_Type 
         DataField       =   "Patient_Type_ID"
         Height          =   315
         ItemData        =   "frmPatient.frx":1CFA
         Left            =   4920
         List            =   "frmPatient.frx":1CFC
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Tag             =   ";search=true;check=required;"
         Top             =   3135
         Width           =   3135
      End
      Begin VB.CommandButton cmdSelectOrganization 
         Caption         =   "..."
         Height          =   375
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   2505
         Width           =   510
      End
      Begin VB.TextBox txtMother_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Mother_Name"
         Height          =   375
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   1920
         Width           =   3135
      End
      Begin VB.TextBox txtPatient_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_ID"
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   10241
            SubFormatType   =   0
         EndProperty
         Height          =   375
         Left            =   4920
         LinkTimeout     =   1000
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   1
         TabStop         =   0   'False
         Tag             =   ";search=true;check=interger>0;check=custom;"
         Top             =   720
         Width           =   3135
      End
      Begin VB.TextBox txtSerialNo_In_Company 
         Alignment       =   1  'Right Justify
         DataField       =   "SerialNo_In_Company"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";search=true;"
         Top             =   720
         Width           =   3135
      End
      Begin VB.TextBox txtFull_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Full_Name"
         Height          =   375
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;check=required;"
         Top             =   1320
         Width           =   3135
      End
      Begin VB.TextBox txtFather_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Father_Name"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;"
         Top             =   1320
         Width           =   3135
      End
      Begin VB.TextBox txtOrganization_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_ID"
         Height          =   375
         Left            =   5505
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;check=integer>0;check=custom;check=required;check=custom;"
         Top             =   2505
         Width           =   2550
      End
      Begin VB.TextBox txtOrganization_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_Name"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";check=required;check=custom;search=true;"
         Top             =   2520
         Width           =   3135
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
         TabIndex        =   13
         Top             =   240
         Width           =   9135
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÂÊÌ… «·„ÊŸ›"
         Height          =   195
         Left            =   3390
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   2040
         Width           =   1230
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "’›… «·„—Ì÷"
         Height          =   195
         Left            =   8445
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   ";search=true;"
         Top             =   3225
         Width           =   825
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√„"
         Height          =   195
         Left            =   8415
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";search=true;"
         Top             =   2040
         Width           =   525
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "÷„‰ «·‘—ﬂ…"
         Height          =   195
         Left            =   3750
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   840
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·»ÿ«ﬁ…"
         Height          =   195
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";search=true;"
         Top             =   810
         Width           =   795
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·„ ”·”·"
         Height          =   195
         Left            =   3660
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";search=true;"
         Top             =   690
         Width           =   1020
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„ Ê«·ﬂ‰Ì…"
         Height          =   195
         Left            =   8235
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";search=true;"
         Top             =   1440
         Width           =   885
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√»"
         Height          =   195
         Left            =   3885
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   1440
         Width           =   570
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·‘—ﬂ…"
         Height          =   195
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   2625
         Width           =   780
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·‘—ﬂ…"
         Height          =   195
         Left            =   3780
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   2625
         Width           =   795
      End
   End
End
Attribute VB_Name = "frmPatient"
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
Dim Organization_checked As Boolean
Public Force_New  As Boolean
Dim SelectedOrganizationID As Integer
Sub SetOrganization_ID(Value As String)
    txtOrganization_ID.text = Value
End Sub
Sub setOrganization_Name(Value As String)
    txtOrganization_Name.text = Value
End Sub
Sub Select_Organization(txt As TextBox)
    
    If Organization_checked Or txtFull_Name.text = "" Then Exit Sub
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim Filter As String
    
    Organization_checked = False
    
    Select Case txt
    Case txtOrganization_ID
        Filter = "convert(varchar,Organization_ID)"
    Case txtOrganization_Name
        Filter = "Organization_Name"
    End Select

   Set rs = ExecuteSelect(Conn, "select Organization_Name as Name ,Organization_ID as ID from Organization where " & Filter & " like '" & txt.text & "'", c)
   
   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Organization_checked = False
        Exit Sub
   End If
   If rs.RecordCount <> 1 Then
       rs.Close
          Set rs = ExecuteSelect(Conn, "select Organization_Name as Name ,Organization_ID as ID from Organization where " & Filter & " = '" & txt.text & "'", c)
          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Organization_checked = False
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
               'Load Clin_List
              'Set Clin_List.callerForm = Me
              GLOBAL_TAG = "datafield=,0:id,1:Name,;"
              GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetOrganization_ID,1:SetOrganization_Name,;"
              
              If txt.text <> "" Then
                
                If txt = txtOrganization_ID Then
                  GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & txt.text & ",;"
                Else
                  GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & txt.text & ",;"
                End If
                
              End If
              GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select Organization_Name as Name ,Organization_ID as ID from Organization;"
              
       '       Debug.Print "Show List"
              btnSettings = GetBtnSettings
              Clin_List.fg.Cols = 2
             Clin_List.fg.ColHidden(0) = False
             Clin_List.fg.ColHidden(1) = False
              Clin_List.fg.ColWidth(1) = 3000
              Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
              Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·‘—ﬂ…"
              Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·‘—ﬂ…"
              Set Clin_List.CallerForm = Me
              'fg.Cell(flexcpText, fg.Row, 6) = ""
              'fg.Cell(flexcpText, fg.Row, 2) = ""
              Clin_List.Show 1
              RefreshCommands btnSettings And FormSettings
              If txtOrganization_ID.text = "" Or txtOrganization_Name.text = "" Then
                Organization_checked = False
                Exit Sub
              Else
                Organization_checked = True
                 Exit Sub
              End If
              
          End If
    ElseIf rs.RecordCount = 1 Then
         txtOrganization_ID.text = rs.Fields("ID").Value
         txtOrganization_Name.text = rs.Fields("Name").Value
         Organization_checked = True
        ' SelectedOrganizationID = rs.Fields("ID").Value
    End If

End Sub

Private Sub cmdCentral_Exam_Click()

        If master.rs.RecordCount = 0 Then
            MsgBox " ÌÃ» ⁄·Ìﬂ ≈÷«›… „—Ì÷ √Ê·«", vbOKOnly + vbCritical
            Exit Sub
        End If
        
        Dim is_Nothing As Boolean
        
        is_Nothing = frmCentral_Exam.is_Loaded
        
    
        Dim Patient_Id As Long
        Patient_Id = val(txtPatient_ID.text)
        Unload Me
        ActiveDatabaseName = "Default"
'        frmCentral_Exam.with_Examiner_Doctor = True
'        frmCentral_Exam.Show
'        frmCentral_Exam.WindowState = vbMaximized
'    If Not is_Nothing Then
'        CallByName frmCentral_Exam, "Add_New_Card", VbMethod, Patient_Id
'        frmCentral_Exam.btnSettings = btMaskNew
'    End If
        Set frmCentral_Exam_With_Doctor = New frmCentral_Exam
        With frmCentral_Exam_With_Doctor
            .with_Examiner_Doctor = True
            .MousePointer = vbHourglass
            .Show
            .WindowState = vbMaximized
            CallByName frmCentral_Exam_With_Doctor, "Add_New_Card", VbMethod, Patient_Id
            .btnSettings = btMaskNew
            .cmdFix.Enabled = False
            .cmdNewPatient.Enabled = False
            .cmdPic_Teeth.Enabled = False
            .lblFixed.visible = False
            .lblMoved.visible = False
            .MousePointer = vbDefault
        End With
        
    
End Sub


Private Sub cmdSelectOrganization_Click()
    txtOrganization_ID_KeyPress 13
    
End Sub

Private Sub cmdWithout_Exam_Click()
'   Dim is_Nothing As Boolean
'
'    If master.rs.RecordCount = 0 Then
'        MsgBox " ÌÃ» ⁄·Ìﬂ ≈÷«›… „—Ì÷ √Ê·«", vbOKOnly + vbCritical
'        Exit Sub
'    End If
'
'    is_Nothing = frmCentral_Exam.is_Loaded
'
'    MousePointer = vbHourglass
'    Dim Patient_Id As Long
'    Patient_Id = val(txtPatient_ID.text)
'    Unload Me
'    ActiveDatabaseName = "Default"
'    frmCentral_Exam.with_Examiner_Doctor = False
'    frmCentral_Exam.Show
'    frmCentral_Exam.WindowState = vbMaximized
'    If Not isNothing Then
'        CallByName frmCentral_Exam, "Add_New_Card", VbMethod, Patient_Id
'        frmCentral_Exam.btnSettings = btMaskNew
'    End If
    
    
      Dim is_Nothing As Boolean

    If master.rs.RecordCount = 0 Then
        MsgBox " ÌÃ» ⁄·Ìﬂ ≈÷«›… „—Ì÷ √Ê·«", vbOKOnly + vbCritical
        Exit Sub
    End If

    is_Nothing = frmCentral_Exam.is_Loaded


    Dim Patient_Id As Long
    Patient_Id = val(txtPatient_ID.text)
    Unload Me
    
    ActiveDatabaseName = "Default"
    MDIMain.EnterClinic
    
    Set frmCentral_Exam_Without_Doctor = New frmCentral_Exam
    With frmCentral_Exam_Without_Doctor
        .MousePointer = vbHourglass
        .with_Examiner_Doctor = False
        .Show
        .WindowState = vbMaximized
        CallByName frmCentral_Exam_Without_Doctor, "Add_New_Card", VbMethod, Patient_Id
        .btnSettings = btMaskNew
        .cmdFix.Enabled = False
        .cmdNewPatient.Enabled = False
        .cmdPic_Teeth.Enabled = False
        .lblFixed.visible = False
        .lblMoved.visible = False
        .MousePointer = vbDefault
    End With

End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    ActiveDatabaseName = "Default"
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    
    Organization_checked = True
    oldScaleWidth = 9930  '9630
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from vPatient order by 1", cancel)
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    If master.rs.RecordCount = 0 Then
        cmdCentral_Exam.Enabled = False
        cmdWithout_Exam.Enabled = False
    End If
    
    If Force_New Then
        master.addNew
        btnSettings = btMaskNew
    End If
    
    If Current_State.id = 3 Then 'œÌ— «·“Ê—
        txtPatient_ID.Tag = txtPatient_ID.Tag + ";check=required;"
    Else
        txtPatient_ID.locked = True
    End If
    
    cmdCentral_Exam.Enabled = Get_Permission("Central_ExamCard")
    cmdWithout_Exam.Enabled = Get_Permission("WithoutDoctorExam")
   
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
   fillCmb cmbPatient_Type, "Select Patient_Type_ID as ID, Patient_Type as Name from FixPatient_Type order by Patient_Type Desc"
End Sub
Private Sub txtIdentityCard_GetFocus()
  txtFull_Name.SetFocus
End Sub
Function GetIfNotZeroOrganization(patient_Type As String)
   Dim sql As String
   Dim cancel As Boolean
   Dim rsCheckType As ADODB.Recordset
   If (patient_Type = "«·“ÊÃ…") Then
        sql = " SELECT PWife FROM   Organization  where  Organization_id =" & val(txtOrganization_ID.text)
   End If
    If (patient_Type = "«·√Ê·«œ") Then
   End If
   
End Function
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
   ' txtFull_Name.SetFocus
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    txtOrganization_Name.text = ""
    Organization_checked = False
    cmbPatient_Type.ListIndex = 0
    cmdCentral_Exam.Enabled = False
    cmdWithout_Exam.Enabled = False
     Dim X As String
     X = CStr(1000000 + getNextPatientId)
    Organization_checked = True
    txtPatient_ID.text = Mid(X, Len(X) - 5, 6)
    Organization_checked = False
   ' txtPatient_ID.text = getNextPatientId
End Sub

Private Sub master_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    Organization_checked = True
End Sub

Private Sub master_doBeforeDelete(rs As ADODB.Recordset, cancel As Boolean)
    txtOrganization_ID.datafield = ""
    txtOrganization_Name.datafield = ""
    cmbPatient_Type.datafield = ""
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    txtPatient_ID.locked = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    cmdCentral_Exam.Enabled = True
    cmdWithout_Exam.Enabled = True
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    txtPatient_ID.locked = False
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    MousePointer = vbHourglass
    On Error GoTo 20
    Dim rsCheck As ADODB.Recordset
    Dim sql As String
    
    sql = "Select * from Central_Exam Where Patient_ID = " & rs.Fields("Patient_id").Value
    
    Set rsCheck = ExecuteSelect(Conn, sql, cancel)
    
    If rsCheck.RecordCount <> 0 Then
        MsgBox "·„   „ ⁄„·Ì… «·Õ–› »‰Ã«Õ »”»»  Ê«Ãœ ≈Õ«·«  „— »ÿ… »Â–« «·„—Ì÷", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
        Exit Sub
    End If
    
    Conn.BeginTrans
    
    ExecuteCommand Conn, "Delete  from pic_teethshot where clientid = " & rs.Fields("Patient_id").Value, cancel
    
    ExecuteCommand Conn, "Delete  from Patient where Patient_id = " & rs.Fields("Patient_id").Value, cancel
    
    Set master.rs = ExecuteSelect(Conn, "Select * from vPatient order by 1", cancel)
    Conn.CommitTrans
    If master.rs.RecordCount = 0 Then
        master.addNew
        Exit Sub
    End If
    
    master.MoveFirst
    cancel = True
    MousePointer = vbDefault
    Exit Sub
20:
    Conn.RollbackTrans
    MsgBox "·„   „ ⁄„·Ì… «·Õ–› »‰Ã«Õ »”»»  Ê«Ãœ ≈Õ«·«  „— »ÿ… »Â–« «·„—Ì÷", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
    MousePointer = vbDefault
End Sub

Private Sub master_doDeleteCompleted(rs As ADODB.Recordset)
    txtOrganization_ID.datafield = "Organization_ID"
    txtOrganization_Name.datafield = "Organization_Name"
    cmbPatient_Type.datafield = "Patient_Type_ID"
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
    txtOrganization_ID.datafield = "Organization_ID"
    txtOrganization_Name.datafield = "Organization_Name"
    cmbPatient_Type.datafield = "Patient_Type_ID"
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    
    On Error GoTo 20
    
    Dim rsOrganization_Name As New ADODB.Recordset
    Dim Qry As String
    Dim cancel As Boolean
     
    sql = "Select Organization_Name from Organization where Organization_ID = " & rs.Fields("Organization_ID").Value
    
    Set rsOrganization_Name = ExecuteSelect(Conn, sql, cancel)

    If rsOrganization_Name.RecordCount = 1 Then
        txtOrganization_Name.text = rsOrganization_Name.Fields("Organization_Name").Value
    End If
    
    Set rsOrganization_Name = Nothing
     Dim X As String
     X = CStr(1000000 + rs!Patient_Id)
     txtPatient_ID.text = Mid(X, Len(X) - 5, 8)
  ' txtPatient_ID.text = rs!Patient_Id
    txtFull_Name.SetFocus
    Exit Sub
20:
    
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    Dim rsCount As New ADODB.Recordset
    
    Set rsCount = ExecuteSelect(Conn, "Select IsNull(count(*),0) + 1 from Patient where Organization_ID =  " & val(txtOrganization_ID.text), cancel)
         
    master.rs.Fields("SerialNo_In_Company").Value = rsCount.Fields(0).Value
    
    Set rsCount = Nothing

    txtSerialNo_In_Company.datafield = ""
    txtOrganization_Name.datafield = ""
    
End Sub
Private Sub master_doSaveError(ByVal state As Controller_State, ByRef rs As ADODB.Recordset, ByRef ErrorObeject As ErrObject, ByRef msg As String, ByRef KeepState As Boolean)
    Dim strErr As String
     strErr = master.rs.ActiveConnection.Errors(0).description
     'MsgBox strError
    If InStr(1, strErr, "IX_Patient") Then
       msg = "·« Ì„ﬂ‰ ≈œŒ«· „—Ì÷Ì‰ »‰›” «·„⁄·Ê„«  «”„ «·„—Ì÷ Ê —ﬁ„ ÂÊÌ… «·„ÊŸ› »«·‘—ﬂ… Ê ’›… «·„—Ì÷ ÌÃ» √‰  ﬂÊ‰ Ê⁄·Ê„«  ÊÕÌœ… Ê Œ«’… »ﬂ· „—Ì÷"
    End If
       
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    txtSerialNo_In_Company.datafield = "SerialNo_In_Company"
    txtSerialNo_In_Company.text = rs!SerialNo_In_Company
    txtOrganization_Name.datafield = "Organization_name"
    
   ' txtPatient_ID.text = rs!Patient_Id
    cmdCentral_Exam.Enabled = True
    cmdWithout_Exam.Enabled = True
     Dim X As String
     X = CStr(1000000 + rs!Patient_Id)
     txtPatient_ID.text = Mid(X, Len(X) - 5, 6)
    
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    If txtOrganization_Name.text <> "" Then Select_Organization txtOrganization_Name
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    txtPatient_ID.locked = False
    'If Not (master.rs.EOF Or master.rs.BOF) Then _  'Dummy code.. /By Fayez
    '    txtOrganization_Name.text = rs!Organization_Name
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    Organization_checked = False
    cmdCentral_Exam.Enabled = False
    cmdWithout_Exam.Enabled = False
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
'    If (master.State = ST_ADDNEW Or master.State = ST_UPDATE) And ctrl = txtPatient_ID Then
'
'        Dim sql As String
'        Dim Cancel As Boolean
'        Dim rsCheck As New ADODB.Recordset
'
'        sql = " select count(*) from Patient where Patient_ID = " & val(txtPatient_ID.text)
'
'        If master.State = ST_UPDATE Then
'                sql = sql + " and Patient_ID <> " & master.rs!Patient_ID
'        End If
'
'        Set rsCheck = ExecuteSelect(conn, sql, Cancel)
'
'        If rsCheck.Fields(0).Value > 0 Then
'             msg = "—ﬁ„ «·„—Ì÷ «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«ı° «·—Ã«¡ ≈œŒ«· —ﬁ„ „—Ì÷ „Œ ·›"
'             checkType = True
'        End If
'
'    End If
 '  If txtIdentityCard = "" Then
 '    msg = "·ﬁœ √œŒ·  ﬁÌ„… Œ«ÿ∆… ›Ì Â–« «·Õﬁ·"
  '   checkType = True
 '  End If
   
    Select Case ctrl
    Case txtOrganization_ID, txtOrganization_Name
        If Not Organization_checked Then
            Select_Organization ctrl
            If Organization_checked = False Then
                msg = "·ﬁœ √œŒ·  ﬁÌ„… Œ«ÿ∆… ›Ì Â–« «·Õﬁ·"
                checkType = True
            End If
        End If
    End Select
   ' If master.state = ST_ADDNEW Then
  '    If GetPatineInfo Then
  '      msg = "·« Ì„ﬂ‰ ≈œŒ«· „—Ì÷Ì‰ »‰›” «·„⁄·Ê„« "
   '     checkType = True
  '    End If
   ' End If
End Sub
Private Function GetPatineInfo()
     Dim sql As String
     Dim cancel As Boolean
    sql = " select * from vPatient where Full_Name  like '" & txtFull_Name.text & "'  and  Patient_Type_ID =" & cmbPatient_Type.ItemData(cmbPatient_Type.ListIndex) & " and CardIdentityID = " & txtIdentityCard.text
    Dim rsPatients As ADODB.Recordset
    Set rsPatients = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        GetPatineInfo = True
    End If
    If rsPatients.RecordCount > 0 Then
        GetPatineInfo = True
    Else
        GetPatineInfo = False
    End If
End Function
Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtOrganization_ID_Change()
    Organization_checked = False
    If Len(txtOrganization_ID.text) = 0 Then txtOrganization_Name.text = ""
   ' fillCmb cmbPatient_Type,""
End Sub

Private Sub txtOrganization_ID_KeyPress(KeyAscii As Integer)
    Select Case KeyAscii
    Case 13
      Select_Organization txtOrganization_ID
    Case Else
     KeyAscii = Prevent_char(KeyAscii)
    End Select
End Sub


Private Sub txtOrganization_ID_Validate(cancel As Boolean)
    If (master.state = ST_ADDNEW Or master.state = ST_UPDATE) And Not Organization_checked Then
        Select_Organization txtOrganization_ID
    End If
End Sub

Private Sub txtOrganization_Name_KeyPress(KeyAscii As Integer)
    If master.state <> ST_SEARCH And KeyAscii = 13 Then
        Select_Organization txtOrganization_Name
    End If
End Sub

Private Sub txtOrganization_Name_Validate(cancel As Boolean)
    If (master.state = ST_ADDNEW Or master.state = ST_UPDATE) And Not Organization_checked Then
        Select_Organization txtOrganization_Name
    End If
End Sub

Private Sub txtPatient_ID_KeyPress(KeyAscii As Integer)
    If master.state = ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    ElseIf State_ID <> 3 Then 'œÌ— «·“Ê—
        KeyAscii = 0
    End If
End Sub

Private Sub txtSerialNo_In_Company_KeyPress(KeyAscii As Integer)
    If master.state = ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    Else
        KeyAscii = 0
    End If
End Sub

Private Function getNextPatientId() As Long
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim seedVal As Long
    Dim maxClinicPatienId As Long
    
    '// Here Moahammad masrie will take the region seed and set new Id of Patient accourding it
    '// if seed=1 then new id of patient  will be max id of this clinic plus 1
    sql = "select IDENT_SEED(TABLE_NAME)FROM INFORMATION_SCHEMA.TABLES " & _
         " where  TABLE_NAME like 'Patient'"
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If (IsNull(rs.Fields(0))) Then
        seedVal = 1
    Else
         seedVal = rs.Fields(0)
    End If
    
    sql = "select max(Patient_ID ) from Patient where Patient_ID < " & seedVal + 99999 & " and Patient_ID >= " & seedVal
    Set rs = ExecuteSelect(Conn, sql, cancel)
        If (IsNull(rs.Fields(0))) Then
          maxClinicPatienId = seedVal
        Else
          maxClinicPatienId = rs.Fields(0)
        End If
         ExecuteCommand Conn, " dbcc checkIdent(patient, reseed , " & maxClinicPatienId & ")", cancel
         getNextPatientId = maxClinicPatienId + 1
End Function

