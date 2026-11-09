VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmAdd_Process 
   BackColor       =   &H80000018&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "≈÷«›… ⁄„·Ì… ÃœÌœ…"
   ClientHeight    =   3255
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6570
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   3255
   ScaleWidth      =   6570
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox mskProcess_Time 
      Height          =   315
      Left            =   1605
      ScaleHeight     =   255
      ScaleWidth      =   2160
      TabIndex        =   9
      Top             =   1905
      Width           =   2220
   End
   Begin VB.ComboBox cmbEmployees 
      Height          =   315
      Left            =   1590
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   880
      Width           =   2235
   End
   Begin VB.ComboBox cmbProcess_Kind 
      Height          =   315
      ItemData        =   "frmEdit_Process_Date.frx":0000
      Left            =   1590
      List            =   "frmEdit_Process_Date.frx":0010
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   360
      Width           =   2235
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   450
      Left            =   405
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   2475
      Width           =   975
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "„Ê«›ﬁ"
      Height          =   450
      Left            =   5220
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   2475
      Width           =   975
   End
   Begin MSComCtl2.DTPicker dtProcess_Date 
      Height          =   315
      Left            =   1620
      TabIndex        =   8
      Top             =   1380
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   556
      _Version        =   393216
      CustomFormat    =   "dd/MM/yyyy"
      Format          =   81985539
      CurrentDate     =   40093
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Êﬁ  «·⁄„·Ì…"
      Height          =   315
      Left            =   4080
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   1905
      Width           =   900
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ «·⁄„·Ì…"
      Height          =   315
      Left            =   4080
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1400
      Width           =   900
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«”„ «·„ÊŸ›"
      Height          =   315
      Left            =   4080
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   880
      Width           =   900
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "‰Ê⁄ «·⁄„·Ì…"
      Height          =   315
      Left            =   4080
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   360
      Width           =   900
   End
End
Attribute VB_Name = "frmAdd_Process"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Public isUpdate  As Boolean
Public Process_ID As Long
Public Process_Time As Date
Public Process_Type As Integer
Public Employee_ID As Integer
Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
On Error GoTo errHandler
    Dim sql As String
    
    With rs
        .ActiveConnection = Conn
        .LockType = adLockOptimistic
        .CursorType = adOpenKeyset
        If Not isUpdate Then
            sql = "Employee_Continuance"
            .MaxRecords = 1
            .Open sql
            .addNew
        Else
            sql = "Select * from Employee_Continuance Where Process_ID = " & Process_ID
            .Open sql
        End If
        !Employee_ID = cmbEmployees.ItemData(cmbEmployees.ListIndex)
        !Process_Date = dtProcess_Date.Value
        !Process_Time = dtProcess_Date.Value & " "
        !Process_Type = cmbProcess_Kind.ListIndex
        .Update
        .Close
        frmDialy_Report.Refresh_Data
    End With
    MsgBox " „  «·⁄„·Ì… »‰Ã«Õ", vbInformation + vbOKOnly, "»—‰«„Ã «·œÊ«„"
    If isUpdate Then
        Unload Me
    End If
    Exit Sub
errHandler:
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄„·Ì… «·Õ›Ÿ «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbCritical + vbOKOnly, "»—‰«„Ã «·œÊ«„"
    rs.CancelUpdate
End Sub

Private Sub Form_Load()
    cmbProcess_Kind.ListIndex = 0
    fillCmb cmbEmployees, "Select employee_id as id,First_name + ' ' + last_name as name from employee_cv"
    dtProcess_Date.Value = format(Date, "dd/mm/yyyy")
    
    If isUpdate Then
        cmbEmployees.ListIndex = GetListIndex(cmbEmployees, Employee_ID)
        cmbProcess_Kind.ListIndex = Process_Type
        dtProcess_Date.Value = format(Process_Time, "dd/mm/yyyy")
        ''mskProcess_Time.text = format(Process_Time, "hh:mm AM/PM")
        Caption = " ⁄œÌ· ⁄„·Ì… œÊ«„"
    End If
    
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set rs = Nothing
End Sub

Private Sub mskProcess_Time_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        cmdOK_Click
    End If
End Sub
