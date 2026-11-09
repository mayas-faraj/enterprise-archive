VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmExaminer_Doctor 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”Ã· «·√ÿ»«¡ «·›«Õ’Ì‰"
   ClientHeight    =   3510
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9510
   Icon            =   "frmExaminer_Doctor.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   3510
   ScaleWidth      =   9510
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ã· «·√ÿ»«¡ «·›«Õ’Ì‰"
      Height          =   3300
      Left            =   75
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Tag             =   "master"
      Top             =   120
      Width           =   9375
      Begin VB.TextBox txtDoctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   6870
         MaxLength       =   4
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   ";search=true;check=required;check=custom;"
         Top             =   540
         Width           =   1400
      End
      Begin VB.TextBox txtSalary 
         Alignment       =   1  'Right Justify
         DataField       =   "salary"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   270
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   ";check=required;new=0;"
         Top             =   2745
         Width           =   1845
      End
      Begin MSComCtl2.DTPicker dtJoining_Date 
         DataField       =   "Joining_Date"
         Height          =   375
         Left            =   3870
         TabIndex        =   10
         Tag             =   ";search=true;"
         Top             =   2745
         Width           =   2850
         _ExtentX        =   5027
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.TextBox txtLast_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Last_Name"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   255
         Locked          =   -1  'True
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";search=true;check=required;"
         Top             =   540
         Width           =   1300
      End
      Begin VB.TextBox txtFistr_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "First_Name"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   2255
         Locked          =   -1  'True
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Tag             =   ";search=true;check=required;"
         Top             =   540
         Width           =   3375
      End
      Begin VB.TextBox txtClinc_Phone 
         Alignment       =   1  'Right Justify
         DataField       =   "Clinic_Phone"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   6870
         Locked          =   -1  'True
         MaxLength       =   20
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;"
         Top             =   2160
         Width           =   1400
      End
      Begin VB.TextBox txtClinc_Address 
         Alignment       =   1  'Right Justify
         DataField       =   "Clinic_Adress"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   255
         Locked          =   -1  'True
         MaxLength       =   100
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Tag             =   ";check=required;search=true;"
         Top             =   2160
         Width           =   5340
      End
      Begin VB.TextBox txtMobile 
         Alignment       =   1  'Right Justify
         DataField       =   "Cell_Phone"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   255
         Locked          =   -1  'True
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   1050
         Width           =   3180
      End
      Begin VB.TextBox txtHome_Phone 
         Alignment       =   1  'Right Justify
         DataField       =   "House_Phone"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   6870
         Locked          =   -1  'True
         MaxLength       =   10
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;"
         Top             =   1560
         Width           =   1400
      End
      Begin VB.TextBox txtHome_Address 
         Alignment       =   1  'Right Justify
         DataField       =   "House_Adress"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   255
         Locked          =   -1  'True
         MaxLength       =   100
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         Tag             =   ";search=true;"
         Top             =   1560
         Width           =   5340
      End
      Begin VB.TextBox txtMother_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Mother_Name"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   4195
         Locked          =   -1  'True
         MaxLength       =   60
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;check=required;"
         Top             =   1050
         Width           =   1400
      End
      Begin VB.TextBox txtFather_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Father_Name"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   6870
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;check=required;"
         Top             =   1050
         Width           =   1400
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
         Top             =   240
         Width           =   9135
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—« »"
         Height          =   195
         Index           =   7
         Left            =   2415
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   2835
         Width           =   390
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·≈‰ ”«» ··√ÿ»«¡ «·›«Õ’Ì‰"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   6
         Left            =   6840
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   2835
         Width           =   2355
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ﬂ‰Ì…"
         Height          =   195
         Index           =   2
         Left            =   1695
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   630
         Width           =   390
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·–« Ì"
         Height          =   195
         Index           =   0
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   630
         Width           =   795
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„"
         Height          =   195
         Index           =   1
         Left            =   6075
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   630
         Width           =   345
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Â« › «·⁄Ì«œ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   19
         Left            =   8385
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   2160
         Width           =   870
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÃÊ«·"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   17
         Left            =   3645
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   1200
         Width           =   435
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Â« › «·„‰“·"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   16
         Left            =   8430
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   1650
         Width           =   810
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√»"
         Height          =   195
         Index           =   3
         Left            =   8520
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   1140
         Width           =   555
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√„"
         Height          =   195
         Index           =   4
         Left            =   5985
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   1140
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄‰Ê«‰ «·„‰“·"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   15
         Left            =   5820
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   1650
         Width           =   900
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄‰Ê«‰ «·⁄Ì«œ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   18
         Left            =   5730
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   2160
         Width           =   990
         WordWrap        =   -1  'True
      End
   End
End
Attribute VB_Name = "frmExaminer_Doctor"
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
Dim Select_Doctor As Boolean
Dim txtArray(8) As TextBox
Sub set_txtArray()
    Set txtArray(0) = txtFistr_Name
    Set txtArray(1) = txtLast_Name
    Set txtArray(2) = txtFather_Name
    Set txtArray(3) = txtMother_Name
    Set txtArray(4) = txtClinc_Address
    Set txtArray(5) = txtClinc_Phone
    Set txtArray(6) = txtHome_Address
    Set txtArray(7) = txtHome_Phone
    Set txtArray(8) = txtMobile
End Sub
Sub Find_Doctor()

    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    
    
    
    sql = "select first_name + ' ' + last_name as Full_Name,Doctor_ID from vCollaborative_Doctors " & _
          " where doctor_id not in(select b.doctor_id from vExaminer_doctor b) " & _
          " and dbo.sf_IsActive_Collaborative_Doctor(Doctor_ID) = 1 Order by 2"
          
    Set rs = ExecuteSelect(Conn, sql, c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Exit Sub
    End If
        
    If rs.RecordCount = 0 Then Exit Sub
    Select_Doctor = False
       
'    GLOBAL_TAG = ";datafield=,0:Doctor_ID,1:First_Name,2:Last_Name,3:Father_Name,4:Mother_Name,5:" & _
'                 "Collaborative_Membership_No,6:Collaborative_Membership_Date,7:Clinic_Phone," & _
'                 "8:Clinic_Adress,;"

    GLOBAL_TAG = ";datafield=,0:Doctor_ID,1:Full_Name,;"
                 
    GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetDoctor_Information,;"
    
    GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
    
    Clin_List.ColsCount = 9
    

    btnSettings = GetBtnSettings
    Clin_List.fg.Cols = 2
    Clin_List.fg.ColHidden(0) = False
    Clin_List.fg.ColHidden(1) = False
    Clin_List.fg.ColWidth(1) = 3000
    Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
    
    Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·ÿ»Ì»"
    Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·ÿ»Ì»"
   
    Set Clin_List.CallerForm = Me
     Clin_List.Show 1
    
    RefreshCommands btnSettings And FormSettings
    
        
End Sub

Sub SetDoctor_Information(Value As Long)

    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    
    
    Select_Doctor = True
    
    Unload Clin_List
    
    Set rs = ExecuteSelect(Conn, "select * from vCollaborative_Doctors where Doctor_ID = " & Value, cancel)

    If rs.RecordCount = 0 Then
        rs.Close
        Exit Sub
    End If
    
    With rs
        txtDoctor_ID.text = !Doctor_ID
        txtFistr_Name.text = !First_Name
        txtLast_Name.text = !Last_Name
        txtFather_Name.text = !Father_Name
        txtMother_Name.text = !Mother_Name
        txtClinc_Address.text = !Clinic_Adress & ""
        txtClinc_Phone.text = !Clinic_Phone & ""
        txtMobile.text = !Cell_Phone & ""
        txtHome_Phone.text = !House_Phone & ""
        txtHome_Address.text = !house_Adress & ""
        .Close
    End With
    
    
    
    Set rs = Nothing

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
    oldScaleWidth = 9630
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "Select * from vExaminer_Doctor order by 1", cancel)
    InitFrame
    set_txtArray
    'master.MoveFirst
    Set ActiveFrame = masterFrame
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
'    Dim i As Integer
'    Dim W As Long
'    Dim totWidth As Long
'    totWidth = 0
'    For i = 0 To fg.Cols - 1
'        totWidth = totWidth + fg.ColWidth(i)
'    Next
'    For i = 0 To fg.Cols - 1
'        fg.ColWidth(i) = fg.Width * fg.ColWidth(i) / totWidth
'    Next
    
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    dtJoining_Date.Value = Date
    Find_Doctor
    txtDoctor_ID.SetFocus
End Sub

Private Sub master_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    Dim rsCheck
    Dim c As Boolean
    Dim sql As String
    
    
    
    sql = "select first_name + ' ' + last_name as Full_Name,Doctor_ID from vCollaborative_Doctors " & _
          " where doctor_id not in(select b.doctor_id from vExaminer_doctor b)  order by 2"
          
    Set rsCheck = ExecuteSelect(Conn, sql, c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Exit Sub
    End If
    
    
    
    If rsCheck.RecordCount = 0 Then
        cancel = True
        MsgBox "·« Ì„ﬂ‰ﬂ ≈÷«›… ÿ»Ì» ›«Õ’ ÃœÌœ ·√‰Â ·« ÌÊÃœ √Ì ÿ»Ì»  ⁄«Ê‰Ì €Ì— „œ—Ã ›Ì ”Ã· «·√ÿ»«¡ «·›«Õ’Ì‰", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
    End If
    
    Set rsCheck = Nothing
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    Dim i As Integer
    
    For i = 0 To 7
        txtArray(i).locked = False
    Next i
    
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
     txtFather_Name.datafield = "Father_Name"
    txtMother_Name.datafield = "Mother_Name"
    txtFistr_Name.datafield = "First_Name"
    txtLast_Name.datafield = "Last_Name"
    txtClinc_Address.datafield = "Clinic_Adress"
    txtClinc_Phone.datafield = "Clinic_Phone"
    txtHome_Address.datafield = "House_Adress"
    txtHome_Phone.datafield = "House_Phone"
    txtMobile.datafield = "Cell_Phone"
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    Dim i As Integer
    For i = 0 To 7
        txtArray(i).locked = True
    Next i
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    
    Dim c As Boolean
    Dim rsCentral_Exam As New ADODB.Recordset
    Dim sql As String
    
    cancel = True
        
    sql = "Select Doctor_ID from Central_Exam where Doctor_Id = " & rs!Doctor_ID
    Set rsCentral_Exam = ExecuteSelect(Conn, sql, c)
    
    If rsCentral_Exam.RecordCount <> 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·ÿ»Ì» „‰ ”Ã· «·√ÿ»«¡ «·›«Õ’Ì‰ »”»» ÊÃÊœ »ÿ«ﬁ«  ›Õ’ „—ﬂ“Ì ·Â", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    ExecuteCommand Conn, "Delete Examiner_Doctor where Examiner_Doctor_ID = " & rs!Examiner_Doctor_ID, c
    
    rs.Requery
    
    If rs.RecordCount = 0 Then master.addNew
    
    
    
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    Dim c As Boolean
    Dim i As Integer
    Dim txt As TextBox
    For i = 0 To 8
        txtArray(i).datafield = ""
    Next i
'
'
'    master.rs.CancelUpdate
'    If master.State = ST_ADDNEW Then
'        ExecuteCommand Conn, "SET DATEFORMAT DMY Insert Into Examiner_Doctor (Doctor_ID,Joining_Date,Salary) values (" & val(txtDoctor_ID.text) & _
'        ",'" & dtJoining_Date.Value & "'," & val(txtSalary.text) & _
'        ")", c
'    Else
'        ExecuteCommand Conn, "SET DATEFORMAT DMY Update Examiner_Doctor Set Doctor_ID = " & val(txtDoctor_ID.text) & _
'        ",joining_Date = '" & dtJoining_Date.Value & "',Salary = " & val(txtSalary.text) & " where examiner_doctor_id = " & master.rs!Examiner_Doctor_ID, c
'    End If
'
'    RefreshCommands FormSettings And btMaskSave
'    If master.State And ST_ADDNEW Then master.State = master.State - ST_ADDNEW
'    If master.State And ST_UPDATE Then master.State = master.State - ST_UPDATE
'
'    Cancel = True
    
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    txtFather_Name.datafield = "Father_Name"
    txtMother_Name.datafield = "Mother_Name"
    txtFistr_Name.datafield = "First_Name"
    txtLast_Name.datafield = "Last_Name"
    txtClinc_Address.datafield = "Clinic_Adress"
    txtClinc_Phone.datafield = "Clinic_Phone"
    txtHome_Address.datafield = "House_Adress"
    txtHome_Phone.datafield = "House_Phone"
    txtMobile.datafield = "Cell_Phone"
End Sub


Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Dim i As Integer
    For i = 0 To 7
        txtArray(i).locked = True
    Next i
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    
'    If ctrl = txtDoctor_ID Then
'
'        If master.State = ST_ADDNEW Or master.State = ST_UPDATE Then
'
'        Dim sql As String
'        Dim cancel As Boolean
'        Dim rsCheck As New ADODB.Recordset
'
'        sql = " select count(*) from vExaminer_Doctor where doctor_id = " & val(txtDoctor_ID.text)
'
'        If master.State = ST_UPDATE Then
'                sql = sql + " and examiner_doctor_id <> " & master.rs!Examiner_doctor_id
'        End If
'
'        Set rsCheck = ExecuteSelect(conn, sql, cancel)
'
'        If rsCheck.Fields(0).Value > 0 Then
'            checkType = True
'            msg = "Â–« «·ÿ»Ì» „÷«› „”»ﬁ« ·”Ã· «·√ÿ»«¡ «·›«Œ’Ì‰"
'            txtDoctor_ID.SetFocus
'        End If
'
'    End If
    
'    End If
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtDoctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Find_Doctor
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtDoctor_ID_Validate(cancel As Boolean)
    If (master.state = ST_ADDNEW Or master.state = ST_UPDATE) And Not Select_Doctor Then
        Find_Doctor
    End If
End Sub

Private Sub txtSalary_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
