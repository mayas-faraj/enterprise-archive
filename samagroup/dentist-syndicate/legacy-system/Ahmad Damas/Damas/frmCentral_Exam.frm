VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmCentral_Exam 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
   ClientHeight    =   7860
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10830
   Icon            =   "frmCentral_Exam.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7860
   ScaleWidth      =   10830
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Enabled         =   0   'False
      Height          =   1275
      Left            =   210
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   5760
      Width           =   9870
      Begin VB.TextBox txtTreatment_Total 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FF80FF&
         DataField       =   "Treatment_Total"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   6105
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   31
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   720
         Width           =   2190
      End
      Begin VB.TextBox txtWhole_Total 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FF80FF&
         DataField       =   "Whole_Total"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   225
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   30
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   720
         Width           =   3510
      End
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   240
         Width           =   9675
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„Ã«„Ì⁄"
         Height          =   195
         Left            =   9315
         RightToLeft     =   -1  'True
         TabIndex        =   34
         Top             =   0
         Width           =   585
      End
      Begin VB.Label lblTreatment_Total 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈Ã„«·Ì «·„⁄«·Ã« "
         Height          =   195
         Left            =   8595
         RightToLeft     =   -1  'True
         TabIndex        =   33
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   810
         Width           =   1200
      End
      Begin VB.Label lblWhole_Total 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈Ã„«·Ì «·≈Õ«·…"
         Height          =   195
         Left            =   4155
         RightToLeft     =   -1  'True
         TabIndex        =   32
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   810
         Width           =   960
      End
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
      Height          =   7665
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   90
      Width           =   10215
      Begin VB.CommandButton cmdChangeFloor 
         Caption         =   " €ÌÌ— «·”ﬁÊ›"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   49
         Top             =   4560
         Width           =   1335
      End
      Begin VB.TextBox txtIhalaID_Per_Company 
         Alignment       =   1  'Right Justify
         DataField       =   "Ihala_ID_in_Company"
         Height          =   375
         Left            =   6120
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   47
         Tag             =   ";search=true;"
         Top             =   4590
         Visible         =   0   'False
         Width           =   2190
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   " ÕœÌÀ «·»Ì«‰« "
         Height          =   375
         Left            =   3960
         RightToLeft     =   -1  'True
         TabIndex        =   46
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7110
         Width           =   1140
      End
      Begin VB.TextBox txtPatient_Father_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Father_Name"
         Height          =   375
         Left            =   6120
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   41
         Tag             =   ";search=true;"
         Top             =   1890
         Width           =   2190
      End
      Begin VB.TextBox txtPatient_Mother_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Mother_Name"
         Height          =   375
         Left            =   225
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   40
         Tag             =   ";search=true;"
         Top             =   1890
         Width           =   3495
      End
      Begin VB.CommandButton cmdNewPatient 
         Caption         =   "≈÷«›… „—Ì÷ ÃœÌœ"
         Height          =   375
         Left            =   5160
         RightToLeft     =   -1  'True
         TabIndex        =   37
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7110
         Width           =   1380
      End
      Begin VB.CommandButton cmdFix 
         Caption         =   " À»Ì  «·≈Õ«·…"
         Height          =   375
         Left            =   6600
         RightToLeft     =   -1  'True
         TabIndex        =   36
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7110
         Width           =   1380
      End
      Begin VB.CommandButton cmdPic_Teeth 
         Caption         =   "«·‘«‘… «·”‰Ì…"
         Height          =   375
         Left            =   8055
         RightToLeft     =   -1  'True
         TabIndex        =   35
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7110
         Width           =   2100
      End
      Begin VB.ComboBox cmbPricCat 
         DataField       =   "PriceCat"
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "frmCentral_Exam.frx":1CFA
         Left            =   225
         List            =   "frmCentral_Exam.frx":1D04
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   25
         Top             =   3090
         Width           =   3495
      End
      Begin VB.CommandButton cmdSelct_Patient 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   1275
         Width           =   375
      End
      Begin VB.CommandButton cmdSelect_Examiner_Doctor 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   3615
         Width           =   375
      End
      Begin VB.TextBox txtOrganization_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_Name"
         Height          =   375
         Left            =   225
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";search=true;"
         Top             =   2505
         Width           =   3495
      End
      Begin VB.TextBox txtOrganization_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_ID"
         Height          =   375
         Left            =   6120
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";search=true;"
         Top             =   2505
         Width           =   2190
      End
      Begin VB.TextBox txtPatient_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Name"
         Height          =   375
         Left            =   225
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;"
         Top             =   1275
         Width           =   3495
      End
      Begin VB.TextBox txtExaminer_Doctor_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Examiner_Doctor_Name"
         Height          =   375
         Left            =   225
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;"
         Top             =   3615
         Width           =   3495
      End
      Begin VB.TextBox txtExaminer_Doctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         Height          =   375
         Left            =   6495
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;check=required;"
         Top             =   3615
         Width           =   1815
      End
      Begin VB.TextBox txtPatient_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_ID"
         Height          =   375
         Left            =   6495
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;check=required;"
         Top             =   1275
         Width           =   1815
      End
      Begin VB.TextBox txtCentral_Exam_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Central_Exam_ID"
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;"
         Top             =   720
         Width           =   2175
      End
      Begin VB.ComboBox cmbExam_Total 
         DataField       =   "Exam_Total_ID"
         Height          =   315
         ItemData        =   "frmCentral_Exam.frx":1D22
         Left            =   6120
         List            =   "frmCentral_Exam.frx":1D24
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Tag             =   ";search=true;"
         Top             =   4170
         Width           =   2190
      End
      Begin VB.TextBox txtPatient_Type 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Type"
         Height          =   375
         Left            =   6120
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";search=true;"
         Top             =   3060
         Width           =   2190
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   9825
      End
      Begin MSComCtl2.DTPicker dtExam_Date 
         DataField       =   "Exam_Date"
         Height          =   315
         Left            =   225
         TabIndex        =   44
         Tag             =   ";search=true;"
         Top             =   4170
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16646147
         CurrentDate     =   40106
      End
      Begin MSComCtl2.DTPicker dtCentral_Exam_Date 
         DataField       =   "Central_Exam_Date"
         Height          =   315
         Left            =   225
         TabIndex        =   45
         Tag             =   ";search=true;check=custom;"
         Top             =   720
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16646147
         CurrentDate     =   40106
      End
      Begin VB.Label lblIhalaID_Per_Com 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·≈Õ«·… ÷„‰ ≈Õ«·«  «·‘—ﬂ…"
         Height          =   435
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   48
         Top             =   4590
         Visible         =   0   'False
         Width           =   1710
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√»"
         Height          =   195
         Index           =   3
         Left            =   8925
         RightToLeft     =   -1  'True
         TabIndex        =   43
         Top             =   1980
         Width           =   570
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√„"
         Height          =   195
         Index           =   0
         Left            =   4380
         RightToLeft     =   -1  'True
         TabIndex        =   42
         Top             =   1980
         Width           =   510
      End
      Begin VB.Label lblMoved 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "„—Õ·…"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   39
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7110
         Width           =   1650
      End
      Begin VB.Label lblFixed 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "„À» …"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Left            =   2175
         RightToLeft     =   -1  'True
         TabIndex        =   38
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7110
         Width           =   1650
      End
      Begin VB.Label lblIhala_Id_In_Company 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0E0FF&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H008080FF&
         Height          =   375
         Left            =   225
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   5160
         Width           =   9735
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "›∆…  ”⁄Ì— «·„⁄«·Ã« "
         Height          =   195
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Top             =   3150
         Width           =   1380
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ »ÿ«ﬁ… «·„—Ì÷"
         Height          =   195
         Index           =   14
         Left            =   8580
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   1365
         Width           =   1260
      End
      Begin VB.Label lblExam_Total 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ﬁÌ„… «·›Õ’"
         Height          =   195
         Left            =   8580
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   4230
         Width           =   1260
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·„ƒ””…"
         Height          =   195
         Index           =   8
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   2595
         Width           =   1380
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·„ƒ””…"
         Height          =   195
         Index           =   7
         Left            =   8580
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   2595
         Width           =   1260
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·„—Ì÷"
         Height          =   195
         Index           =   5
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   1365
         Width           =   1380
      End
      Begin VB.Label lblExaminer_Doctor_Name 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·ÿ»Ì» «·›«Õ’"
         Height          =   195
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   3705
         Width           =   1380
      End
      Begin VB.Label lblExaminer_Doctor_ID 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì» «·›«Õ’"
         Height          =   195
         Left            =   8580
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   3705
         Width           =   1260
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·≈Õ«·…"
         Height          =   195
         Index           =   1
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   810
         Width           =   1380
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·≈Õ«·…"
         Height          =   195
         Index           =   0
         Left            =   8580
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   810
         Width           =   1260
      End
      Begin VB.Label lblPrice 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   0
            Format          =   """·.”.˛"" #,##0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   5610
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   4170
         Width           =   465
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "’›… «·„—Ì÷"
         Height          =   195
         Index           =   4
         Left            =   8580
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   3150
         Width           =   1260
      End
      Begin VB.Label lblExam_Date 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·›Õ’"
         Height          =   195
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   4230
         Width           =   1380
      End
   End
End
Attribute VB_Name = "frmCentral_Exam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
Public controllers As New Collection
Dim ActiveFrame As frame
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public FormSettings As Long
Public btnSettings As Long

Public WithEvents detail As Controller
Attribute detail.VB_VarHelpID = -1

Dim WithEvents dlgOrganization_Limit As dlgSqlSelect
Attribute dlgOrganization_Limit.VB_VarHelpID = -1

Dim oldScaleWidth As Long
Dim Patient_checked As Boolean
Dim Examiner_Doctor_checked As Boolean
Dim txtArray(6) As TextBox

Public with_Examiner_Doctor As Boolean
Dim Save_After As Controller_State
Dim Central_Exam_ID As Long
Public Patient_Id As Long
Public is_Loaded As Boolean
Public permissionIhalaFixed As Boolean
Public Open_By_Patient_Card As Boolean
Dim Start_Record_Count As Double
Public SaveState As Integer
Public startRang   As Long
Public EndRang  As Long
Public setPermissionRange As Boolean
Public seedVal As Long
Sub Get_Detail_Summeries()
    
    Dim sql As String
    Dim cancel As Boolean
    If master.rs.EOF Or master.rs.BOF Or master.state = ST_ADDNEW Or Open_By_Patient_Card Then
        lblFixed.visible = False
        lblMoved.visible = False
        Exit Sub
    End If
    sql = "Select Whole_Total,Treatment_Total,Fixed,Organization_ID from vCentral_Exam Where Central_Exam_ID = " & master.rs!Central_Exam_ID
    
    Set detail.rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then Exit Sub
    If detail.rs.RecordCount = 0 Then Exit Sub
    detail.rs.Move 0
    
    chkmasterFrame.Value = 0
    
    lblFixed.visible = CBool(detail.rs!Fixed = 1)
    MousePointer = vbDefault
End Sub
Sub Lock_Fram_Contenets(Lock_Type As Boolean)
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        If ctrl.Container Is masterFrame Then
           Select Case ctrl.name
           Case "chkmasterFrame"
                ctrl.Value = 1
           Case "txtTreatment_Total", "txtWhole_Total"
                ctrl.locked = Lock_Type
           Case "cmdFix", "cmdNewPatient", "cmdPic_Teeth", "cmbPricCat", "cmdRefresh"
           Case Else
                If Not TypeOf ctrl Is Label Then
                    ctrl.Enabled = Lock_Type
                End If
            End Select
        End If
    Next ctrl
    If Lock_Type Then
        chkmasterFrame.Value = 1
    Else
        chkmasterFrame.Value = 0
    End If
End Sub
Public Sub Add_New_Card(Patient_Id As Long)
    master.addNew
    DoEvents
    txtPatient_ID.text = Patient_Id
    txtPatient_ID_KeyPress 13
    RefreshCommands FormSettings And btMaskNew
    txtPatient_ID.SetFocus
    Open_By_Patient_Card = True
    Get_Detail_Summeries
    MousePointer = vbDefault
End Sub

Sub Set_PriceCat(Value As Integer)
    cmbPricCat.ListIndex = Value
    If (cmbPricCat.ListIndex = 0) And (cmbExam_Total.ListCount > 1) Then
        cmbExam_Total.ListIndex = 1
    End If
End Sub
Sub Clear_Controls()
    txtExaminer_Doctor_ID.text = ""
    txtExaminer_Doctor_Name.text = ""
    txtCentral_Exam_ID.text = ""
    txtTreatment_Total.text = 0
    txtPatient_ID.text = ""
    txtPatient_Name.text = ""
    txtOrganization_ID.text = ""
    txtOrganization_Name.text = ""
    txtPatient_Type.text = ""
End Sub
Sub set_txtArray()
    Set txtArray(0) = txtPatient_Name
    Set txtArray(1) = txtOrganization_Name
    Set txtArray(2) = txtOrganization_ID
    Set txtArray(3) = txtExaminer_Doctor_Name
    Set txtArray(4) = txtPatient_Type
    Set txtArray(5) = txtPatient_Father_Name
    Set txtArray(6) = txtPatient_Mother_Name
End Sub

Sub Set_Patient_ID(Value As String)
    Dim X As String
    'x = CStr(1000000 + CInt(Value))
    X = CStr(1000000 + val(Value))
    txtPatient_ID.text = Mid(X, Len(X) - 5, 6)
    MousePointer = vbDefault
End Sub
Sub Set_Patient_Name(Value As String)
    txtPatient_Name.text = Value
End Sub
Sub Set_Mother_Name(Value As String)
    txtPatient_Mother_Name.text = Value
End Sub
Sub Set_Father_Name(Value As String)
    txtPatient_Father_Name.text = Value
End Sub
Sub Set_Organization_ID(Value As String)
    txtOrganization_ID.text = Value
    MousePointer = vbDefault
End Sub
Sub Set_Organization_Name(Value As String)
    txtOrganization_Name.text = Value
End Sub
Sub Set_Examiner_Doctor_ID(Value As String)
    txtExaminer_Doctor_ID.text = Value
    Examiner_Doctor_checked = True
    MousePointer = vbDefault
End Sub
Sub Set_Examiner_Doctor_Name(Value As String)
    txtExaminer_Doctor_Name.text = Value
End Sub
Sub Set_Patient_Type(Value As String)
    txtPatient_Type.text = Value
End Sub
Sub Select_Examiner_Doctor()
    If Not with_Examiner_Doctor Then Exit Sub
    MousePointer = vbHourglass
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    Dim Doctor_ID As Long
    
    Examiner_Doctor_checked = False
    
    Doctor_ID = val(txtExaminer_Doctor_ID.text)

    sql = "select first_name + ' ' + last_name as Name ,Doctor_ID as ID,Father_Name,Mother_Name " & _
          "  from VExaminer_Doctor"

    If Doctor_ID <> 0 Then
        sql = sql & " where Doctor_id = " & val(txtExaminer_Doctor_ID.text)
    End If
    
    sql = sql & " Order by Doctor_ID"

   Set rs = ExecuteSelect(Conn, sql, c)

   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Examiner_Doctor_checked = False
        Exit Sub
   End If

   If rs.RecordCount <> 1 Then
       rs.Close

          sql = "select first_name + ' ' + last_name as Name ,Doctor_ID as ID,Father_Name,Mother_Name " & _
                "from VExaminer_Doctor " & _
                " order by 2"


          Set rs = ExecuteSelect(Conn, sql, c)

          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Examiner_Doctor_checked = False
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
               'Load Clin_List
              'Set Clin_List.callerForm = Me
              GLOBAL_TAG = ""
              GLOBAL_TAG = "datafield=,0:id,1:name,2:Father_Name,3:Mother_Name,;"
              GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Examiner_Doctor_ID,1:Set_Examiner_Doctor_Name,;"
              'GLOBAL_TAG = GLOBAL_TAG & "initQuery=0:" & txtExaminer_Doctor_ID.text & ",;"
              GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
       '       Debug.Print "Show List"
              btnSettings = GetBtnSettings
              Clin_List.fg.Cols = 4
              Clin_List.fg.ColAlignment(3) = 7
              Clin_List.fg.FixedAlignment(3) = 7
              Clin_List.fg.ColWidth(0) = 1000
              Clin_List.fg.ColWidth(1) = 2000
              Clin_List.fg.ColWidth(2) = 1000
              Clin_List.fg.ColWidth(3) = 1000
              Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
              Clin_List.fg.Cell(flexcpText, 0, 0) = "«·—ﬁ„ «·–« Ì"
              Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·ÿ»Ì»"
              Clin_List.fg.Cell(flexcpText, 0, 2) = "«·√»"
              Clin_List.fg.Cell(flexcpText, 0, 3) = "«·√„"
              Set Clin_List.CallerForm = Me
              Clin_List.Show 1
              RefreshCommands btnSettings And FormSettings
              Exit Sub
          End If
    ElseIf rs.RecordCount = 1 Then
         txtExaminer_Doctor_ID.text = rs.Fields("ID").Value
         txtExaminer_Doctor_Name.text = rs.Fields("Name").Value
         'txtExaminer_Doctor_Name.SetFocus
         Examiner_Doctor_checked = True
    End If
    MousePointer = vbDefault
End Sub

Sub Select_Patient()
    MousePointer = vbHourglass
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    
    
    If Patient_checked And Trim(txtPatient_ID.text) <> "" Then Exit Sub
    
    
    Patient_checked = False
    
    sql = " select Full_Name as Name ,Patient_ID as ID,Organization_Name,Organization_ID,Patient_Type, " & _
          " Father_Name,Mother_Name,PriceCat from vPatient" & _
          " where patient_id = " & val(txtPatient_ID.text)
          
   Set rs = ExecuteSelect(Conn, sql, c)
   
   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Patient_checked = False
        Exit Sub
   End If
   
   If rs.RecordCount <> 1 Then
       rs.Close
          sql = " select Full_Name as Name ,substring(CAST((1000000 + Patient_ID) as varchar(7)),2,6) as ID,Organization_Name,Organization_ID,Patient_Type" & _
                " ,PriceCat,Father_Name,Mother_Name from vPatient"

          Set rs = ExecuteSelect(Conn, sql, c)
          
          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Patient_checked = False
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
               'Load Clin_List
              'Set Clin_List.callerForm = Me
              GLOBAL_TAG = "datafield=,0:Name,1:id,2:Organization_Name,3:Organization_ID,4:Patient_Type,5:PriceCat,;"
              GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Patient_Name,1:Set_Patient_Id,2:Set_Organization_Name,3:Set_Organization_ID,4:Set_Patient_Type,5:Set_PriceCat,6:Set_Father_Name,7:Set_Mother_Name,;"
              'GLOBAL_TAG = GLOBAL_TAG & "initQuery=1:" & fg.EditText & ",;"
              GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
              Debug.Print "Show List"
              btnSettings = GetBtnSettings
              Clin_List.DisableSearchOnLoad = True
              Clin_List.ColsCount = 6
              Clin_List.fg.ColHidden(3) = True
              Clin_List.fg.ColAlignment(2) = 7
              Clin_List.fg.FixedAlignment(2) = 7
              Clin_List.fg.ColAlignment(4) = 7
              Clin_List.fg.FixedAlignment(4) = 7
              Clin_List.fg.ColHidden(5) = True
              Clin_List.fg.ColWidth(0) = 4000
              Clin_List.fg.ColWidth(1) = 3000
              Clin_List.fg.ColWidth(2) = 6000
              Clin_List.fg.ColWidth(4) = 2300
              Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
              Clin_List.fg.Cell(flexcpText, 0, 0) = "«”„ «·„—Ì÷"
              Clin_List.fg.Cell(flexcpText, 0, 1) = "—ﬁ„ «·„—Ì÷"
              Clin_List.fg.Cell(flexcpText, 0, 2) = "«”„ «·‘—ﬂ…"
              Clin_List.fg.Cell(flexcpText, 0, 4) = "‰Ê⁄ «·„—Ì÷"
              Set Clin_List.CallerForm = Me
              Clin_List.Show 1
              RefreshCommands btnSettings And FormSettings
              Exit Sub
          End If
        End If
        
    If rs.RecordCount = 1 Then
         txtPatient_ID.text = rs.Fields("ID").Value
         txtPatient_Name.text = rs.Fields("Name").Value
         txtOrganization_ID.text = rs.Fields("Organization_ID").Value
         txtOrganization_Name.text = rs.Fields("Organization_Name").Value
         txtPatient_Type.text = rs.Fields("Patient_Type").Value
         cmbPricCat.ListIndex = rs!PriceCat
         txtPatient_Father_Name.text = rs.Fields("Father_Name").Value & ""
         txtPatient_Mother_Name.text = rs.Fields("Mother_Name").Value & ""
         Patient_checked = True
    End If
    MousePointer = vbDefault
End Sub



Private Sub cmbExam_Total_Click()
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    Dim IOrF As Integer
    Dim IOrFD As Date
    Dim theDate As Date
    Dim thePrice As Integer
    
    If cmbExam_Total.ListIndex = -1 Then Exit Sub
    
    thePrice = 0
    
    Set rs = ExecuteSelect(Conn, "Select ISNULL(IhalaOrFix,1),IhalaOrFixDate from FixExam", cancel)
    If (Not cancel) And (Not IsNull(dtExam_Date.Value)) And (Not IsNull(dtCentral_Exam_Date.Value)) Then
        IOrF = Conversion.CInt(rs.Fields(0).Value)
        If (IOrF = 1) Then
            theDate = dtCentral_Exam_Date.Value
        Else
            theDate = dtExam_Date.Value
        End If
        IOrFD = Conversion.CDate(rs.Fields(1).Value)
        If theDate > IOrFD Then
            thePrice = 1
        End If
    End If

    If thePrice = 1 Then
        Set rs = ExecuteSelect(Conn, "Select Price1 from FixExam_Total where id = " & _
                            cmbExam_Total.ItemData(cmbExam_Total.ListIndex), cancel)
    Else
        Set rs = ExecuteSelect(Conn, "Select Price from FixExam_Total where id = " & _
                            cmbExam_Total.ItemData(cmbExam_Total.ListIndex), cancel)
    End If
    
    If Not cancel Then
        lblPrice.Caption = rs.Fields(0).Value
        If val(txtWhole_Total.text) < 200 And with_Examiner_Doctor = True Then
            txtWhole_Total.text = lblPrice.Caption
        End If
    End If
    Set rs = Nothing
    
End Sub


Private Sub cmdChangeFloor_Click()

    If txtOrganization_Name.text = "" Or txtOrganization_ID.text = "" Then
        MsgBox "ÌÃ» ⁄·Ìﬂ «Œ Ì«— „ƒ””… √Ê·«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
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
        .sql = .sql & " FROM Organization_Limit WHERE Organization_ID = " & txtOrganization_ID.text
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
Public Sub OnSqlSelected(ByRef dlgOrganization_Limit As dlgSqlSelect)
    
End Sub
Private Sub cmdFix_Click()
'    Dim rsDateComparing As New ADODB.Recordset
'    Dim Cancel As Boolean
'    Dim sql As String
'    Dim MonthBetween As Integer
'    sql = "Set DateFormat DMY SELECT DATEDIFF(month, '" & dtExam_Date.Value & "',GETDATE())"
'    With rsDateComparing
'        Set rsDateComparing = ExecuteSelect(Conn, sql, Cancel)
'        MonthBetween = Abs(rsDateComparing.Fields(0).Value)
'        If MonthBetween > 6 Then
'            MsgBox "·« Ì„ﬂ‰ﬂ Õ›Ÿ Â–Â «·≈Õ«·… ° ·√‰ «·›«—ﬁ »Ì‰  «—ÌŒ «·›Õ’ Ê«· «—ÌŒ «·Õ«·Ì Ì Ã«Ê“ «·Õœ «·„”„ÊÕ »Â", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
'            Exit Sub
'        End If
'    End With

   If master.rs.RecordCount = 0 Then
        MsgBox "ÌÃ» ≈÷«›… ≈Õ«·… √Ê·«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    If master.state = ST_ADDNEW Or master.state = ST_UPDATE Then Exit Sub
    MDIMain.EnterClinic
    With frmIhalat
        Set .Caller_Form = Me
        .Open_For_Fixing_Ihala = True
        .Central_Exam_ID = val(txtCentral_Exam_ID.text)
        .FrmCentral_Exam_ButtonSettings = GetBtnSettings
        .Show
     End With
End Sub

Private Sub cmdNewPatient_Click()
    If master.state <> 0 Then Exit Sub
    Unload Me
    
    frmPatient.Force_New = True
    frmPatient.Show
    frmPatient.Force_New = False

    'frmPatient.master.addNew
End Sub

Private Sub cmdPic_Teeth_Click()
    Dim LineNumber As Integer
    On Error GoTo errHandler
    LineNumber = 0
    If master.rs.RecordCount = 0 Then
        MsgBox "ÌÃ» ≈÷«›… ≈Õ«·… √Ê·«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    Dim rsCheckOtherIhal As ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    Dim canEditToothImg As Boolean
    btnSettings = GetBtnSettings
    MDIMain.EnterClinic
    
    If master.state <> 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ «·‘«‘… «·”‰Ì… ﬁ»· Õ›Ÿ «·»ÿ«ﬁ… √Ê √À‰«¡ ⁄„·Ì… «·»ÕÀ", vbCritical + vbOKOnly
        Exit Sub
    End If
    LineNumber = 1
    With Pic_TeethImg
        .MaxIhalaPrice = Get_Organization_Limit(detail.rs!Organization_Id, master.rs!Central_Exam_Date)
        .IhalaID = master.rs!Central_Exam_ID
        .Client_ID = master.rs!Patient_Id
        .Organization_Id = detail.rs!Organization_Id
        '<AHMAD>
        .Central_Exam_Date = format(master.rs!Central_Exam_Date, "dd/mm/yyyy")
        .Patient_Name = txtPatient_Name.text
        '</AHMAD>
        
'        sql = "Select count(central_exam_id) from Central_Exam Where Central_exam_id > " & master.rs!Central_Exam_ID & _
'            " and Patient_id= " & master.rs!Patient_Id
'
'        Set rsCheckOtherIhal = ExecuteSelect(Conn, sql, Cancel)
'
'        If rsCheckOtherIhal.Fields(0).Value > 0 Then
'            MsgBox "Â–« «·„—Ì÷ ·œÌÂ ≈Õ«·«  »⁄œ Â–Â «·≈Õ«·… ° ·–·ﬂ ”Ì „ › Õ «·‘«‘… «·”‰Ì… ··«” ⁄—«÷ ›ﬁÿ ·√‰ Â‰«ﬂ „⁄«·Ã«  Ì„ﬂ‰ √‰  ƒÀ— ⁄·Ï «·„⁄«·Ã«  «·„Ã—«… ›Ì «·≈Õ«··«  «· «·Ì…", vbInformation + vbOKOnly + vbMsgBoxRight + vbMsgBoxRtlReading, "··ﬁ—«¡… ›ﬁÿ"
'        End If
'
'        If rsCheckOtherIhal.Fields(0).Value = 0 And master.rs!Moved = 0 And detail.rs!Fixed = 0 Then
        LineNumber = 2
        canEditToothImg = Get_Permission("canUpdateTeethImg")
        If master.rs!Moved = 0 And detail.rs!Fixed = 0 And canEditToothImg = True Then
            .Editable = 1
        Else
            .Editable = 0
        End If
             
        
        
        LineNumber = 3
        If IsNull(master.rs!price) Then
            .CentralPrice = 0
        Else
            .CentralPrice = master.rs!price
        End If
        .Caption = Pic_TeethImg.Caption & " ··≈Õ«·… —ﬁ„ " & txtCentral_Exam_ID & " ··„—Ì÷ " & txtPatient_Name & " „‰ " & txtOrganization_Name
        .Show 1, MDIMain
    End With
    
    LineNumber = 4
    
'    'On Error Resume Next
'    If with_Examiner_Doctor Then
'        master.rs.Resync adAffectCurrent, adResyncAllValues 'adAffectCurrent, adResyncAllValues
'    Else
'        master.rs.Requery
'    End If

'    Dim Current_id As Long
'    Dim rsFilter As Variant
'
'    Current_id = master.rs!Central_Exam_ID

'    rsFilter = master.rs.Filter
'    If with_Examiner_Doctor Then
'        Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 1 order by 1", Cancel)
'    Else
'        Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 0 order by 1", Cancel)
'    End If
'    master.rs.Filter = rsFilter
'    master.rs.Find "Central_Exam_Id = " & Current_id
'
'    Dim Sql As String
'    Sql = "select dbo.sf_Get_Treatment_Total(" & Current_id & ")"
'    Dim totalRs As Recordset
'
'    Set totalRs = ExecuteSelect(Conn, Sql, Cancel)
'    If Cancel Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    If totalRs.EOF Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    txtTreatment_Total.text = totalRs.Fields(0).Value

    Get_Detail_Summeries
    LineNumber = 5
    Set_RecordCountFromAll master.rs
    LineNumber = 6
    Exit Sub
errHandler:

    Close #OpenPicTeethForm
    Open "c:\OpenPicTeethForm.txt" For Output As #OpenPicTeethForm
    Print #OpenPicTeethForm, Err.description
    Close #OpenPicTeethForm
    
    Close #LineNumber
    Open "c:\LineNumber.txt" For Output As #LineNumber
    Print #LineNumber, str(LineNumber)
    Close #LineNumber
End Sub

Private Sub cmdRefresh_Click()
    
    If master.rs.RecordCount = 0 Then Exit Sub
    
    MousePointer = vbHourglass
    
    Dim Current_id As Long
    Dim cancel As Boolean
    Dim rsFilter As Variant
    
    Current_id = master.rs!Central_Exam_ID
    
    rsFilter = master.rs.Filter
    
    txtCentral_Exam_ID.text = master.rs!Central_Exam_ID
    
    If with_Examiner_Doctor Then
       ' Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 1 and central_exam_id=4719 order by 1", Cancel)
       Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 1 and  Central_Exam_ID between " & startRang & " and " & EndRang & "  order by 1", cancel)
    Else
       ' Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 0 and central_exam_id=4719 order by 1", Cancel)
       Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 0 and  Central_Exam_ID between " & startRang & " and " & EndRang & "  order by 1", cancel)
    End If
    
    master.rs.Filter = rsFilter
    
    master.rs.Find "Central_Exam_Id = " & Current_id
    MsgBox " „  ÕœÌÀ «·»Ì«‰«  »‰Ã«Õ", vbExclamation + vbOKOnly, ""
    MousePointer = vbDefault
    
End Sub

Private Sub cmdSelct_Patient_Click()
    txtPatient_ID_Validate False
End Sub

Private Sub cmdSelect_Examiner_Doctor_Click()
    txtExaminer_Doctor_ID_Validate False
End Sub


Private Sub detail_doAddNew(rs As ADODB.Recordset)
    master.addNew
End Sub

Private Sub detail_doBeginSearch(rs As ADODB.Recordset)
    master.BeginSearch
End Sub

Private Sub detail_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    master.CancelSave
End Sub

Private Sub detail_DoDelete(rs As ADODB.Recordset, cancel As Boolean)
    master.Delete
End Sub

Private Sub detail_doMoveComplete(rs As ADODB.Recordset)
    chkmasterFrame.Value = 0
End Sub

Private Sub detail_doUpdate(rs As ADODB.Recordset)
    master.Update
End Sub

Private Sub detailFrame_Click()
    chkmasterFrame.Value = 0
End Sub

Private Sub Form_Activate()
    Set ActiveFrame = masterFrame
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    ActiveDatabaseName = "Default"
    If detail.rs Is Nothing Then Exit Sub
    If master.rs.RecordCount <> 0 Then lblFixed.visible = detail.rs!Fixed = 1
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub
Private Function GetSeedVal()
    Dim sql As String
    Dim cancel As Boolean
    Dim rsSeed As ADODB.Recordset
' < get Seed value and get only card in this seed
    sql = "select IDENT_SEED(TABLE_NAME)FROM INFORMATION_SCHEMA.TABLES " & _
         " where  TABLE_NAME like 'Central_Exam'"
    Set rsSeed = ExecuteSelect(Conn, sql, cancel)
    seedVal = rsSeed.Fields(0)
    GetSeedVal = seedVal
End Function
Private Sub Form_Load()
    Dim sql As String
     Dim cancel As Boolean
    oldScaleWidth = 10410
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec

    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set ActiveFrame = master.frame
    
    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    
    controllers.Add master, masterFrame.name
    controllers.Add detail, detailFrame.name
    InitFrame
    GetRangOfCheckCard
   If (setPermissionRange = False) Then Exit Sub
    If with_Examiner_Doctor Then
       ' Set master.rs = ExecuteSelect(Conn, "SET DATEFORMAT DMY Select * from vCentral_Exam where with_exam = 1 and central_exam_id=6902 order by 1", Cancel)
        Set master.rs = ExecuteSelect(Conn, "SET DATEFORMAT DMY Select * from vCentral_Exam where with_exam = 1  and  Central_Exam_ID between " & startRang & " and " & EndRang & " order by 1", cancel)
    Else
        ' Set master.rs = ExecuteSelect(Conn, "SET DATEFORMAT DMY Select * from vCentral_Exam where with_exam = 0  and central_exam_id=6902 order by 1", Cancel)
        Set master.rs = ExecuteSelect(Conn, "SET DATEFORMAT DMY Select * from vCentral_Exam where with_exam = 0 and  Central_Exam_ID between " & startRang & " and " & EndRang & " order by 1", cancel)
    End If
    
    If master.rs.RecordCount <> 0 Then
        Start_Record_Count = master.rs.RecordCount
    End If
    
    master.MoveFirst
    
    set_txtArray
    

    Set_Exam_Status 'With or Without Examiner Doctor
    
    If master.rs.RecordCount = 0 Then
        cmdPic_Teeth.visible = False
        cmdFix.visible = False
        lblMoved.visible = False
        lblFixed.visible = False
    End If
    
'    master.MoveFirst
    Set ActiveFrame = masterFrame
    
    If Not Current_State.Show_Per_Company Then
        lblIhala_Id_In_Company.visible = False
    Else
        lblIhalaID_Per_Com.visible = True
        txtIhalaID_Per_Company.visible = True
    End If
    
'    If State_ID = 4 Then '≈œ·»
'        txtWhole_Total.locked = False
'        txtWhole_Total.BackColor = &H80000005
'    End If
    
    is_Loaded = True
      
    Set_Permission
End Sub

Private Sub InitFrame()
    ' Lookups & Initialize stuff
    'fillCmb cmbPatient_Type, "Select Patient_type_ID as ID,Patient_type as Name from FixPatient_Type order by 1"
    fillCmb cmbExam_Total, "Select ID , Name from FixExam_Total order by 1"
    
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
    If Not with_Examiner_Doctor Then
     lblWhole_Total.Left = detailFrame.Width - 5000
     txtWhole_Total.Left = lblWhole_Total.Left - (txtWhole_Total.Width + 500)
    End If
   Set_Permission

End Sub

Private Sub Set_Permission()
'<mohMas
    Dim canEditTeathImg As Boolean
   ' ////////////////////
     Dim IhalaID As Long
      If txtCentral_Exam_ID.text = "" Then
      Exit Sub
      End If
      IhalaID = val(txtCentral_Exam_ID.text)
      Dim rsRangCentralExam As ADODB.Recordset
      Set rsRangCentralExam = ExecuteSelect(Conn, "Select CenterExamFromID , CenterExamToID   from Users where Id = " & Current_AppUser.id, cancel)
      ' ≈–« ﬂ«‰  «·≈Õ«·… ÷„‰ «·„Ã«· «·„Õœœ ›Ì «·’·«ÕÌ« 
      If IhalaID <= rsRangCentralExam.Fields(1) And IhalaID >= rsRangCentralExam.Fields(0) Then
            '  À»Ì  «·≈Õ«·…
        permissionIhalaFixed = Get_Permission("FixedIhala")
        If permissionIhalaFixed = True Then
            cmdFix.Enabled = True
            cmdFix.visible = True
        Else
             cmdFix.Enabled = False
             cmdFix.visible = False
        End If
        ' ’·«ÕÌ… «·‘«‘… «·”‰Ì…
        canEditTeathImg = Get_Permission("canUpdateTeethImg")
        If canEditTeathImg = True Then
              Pic_TeethImg.Editable = 1
              cmdPic_Teeth.visible = True
             cmdPic_Teeth.Caption = "«·‘«‘… «·”‰Ì…"
        Else
             cmdPic_Teeth.visible = True
             Pic_TeethImg.Editable = 0
             cmdPic_Teeth.Caption = "«·‘«‘… «·”‰Ì… («” ⁄—«÷ ›ﬁÿ)"
         End If
          cmdNewPatient.visible = Get_Permission("patientCard")
          FormSettings = btall
          'If Save_After = ST_ADDNEW Then   'Or Save_After = ST_UPDATE    Exit Sub
          '   FormSettings = btAll - btsave
          '    RefreshCommands btnSettings And FormSettings
          'Else
          '     RefreshCommands btnSettings And FormSettings
          'End If
         ' If (GetSeedVal > 2000000) Then
         '   RefreshCommands btnSettings And FormSettings
         ' End If
         Else
          cmdNewPatient.visible = False
          cmdFix.visible = False
          cmdPic_Teeth.visible = False
          FormSettings = btall - btPrint - btDelete - btNew - btUpdate - btCancel '- btsave
          RefreshCommands btnSettings And FormSettings
      End If
        '<mohMas
End Sub
Private Sub GetRangOfCheckCard()
      Dim rsRangCentralExam As ADODB.Recordset
      Set rsRangCentralExam = ExecuteSelect(Conn, "Select CenterExamFromID , CenterExamToID   from Users where Id = " & Current_AppUser.id, cancel)
      ' ≈–« ﬂ«‰  «·≈Õ«·… ÷„‰ «·„Ã«· «·„Õœœ ›Ì «·’·«ÕÌ« 
      If (IsNull(rsRangCentralExam.Fields(0)) Or IsNull(rsRangCentralExam.Fields(1))) Then
        MsgBox "ÌÃ»  ÕœÌœ „Ã«· «·≈Õ«·«  «·„”„ÊÕ… ·ﬂ· „” Œœ„ „‰ «·’·«ÕÌ« "
        setPermissionRange = False
       Exit Sub
      End If
      
      startRang = rsRangCentralExam.Fields(0)
      EndRang = rsRangCentralExam.Fields(1)
      setPermissionRange = True
     
End Sub
Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
    is_Loaded = False
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    Dim rsSeed As ADODB.Recordset
    Dim seedVal As Long
    Dim maxCentralExamID As Long
    
    dtExam_Date.Value = Date
    dtCentral_Exam_Date.Value = Date
    txtPatient_Name.text = ""
    cmbExam_Total.ListIndex = 0
    txtTreatment_Total.text = 0
    txtPatient_Type.text = ""
    Save_After = ST_ADDNEW
    lblFixed.visible = False
    lblMoved.visible = False
    cmbExam_Total.ListIndex = 0
    If with_Examiner_Doctor Then dtExam_Date.Value = Date
    Lock_Fram_Contenets True
    txtWhole_Total.text = val(lblPrice.Caption)
    cmdNewPatient.Enabled = False
    cmdFix.Enabled = False
    cmdRefresh.Enabled = False
    cmdPic_Teeth.Enabled = False
    'Central_Exam_ID
    '// Here Moahammad masrie will take the region seed and set new Id of Patient accourding it
    '// if seed=1 then new id of patien  will be max id of this clinic plus 1
    sql = "select IDENT_SEED(TABLE_NAME)FROM INFORMATION_SCHEMA.TABLES " & _
         " where  TABLE_NAME like 'Central_Exam'"
    Set rsSeed = ExecuteSelect(Conn, sql, cancel)
    seedVal = rsSeed.Fields(0)
    sql = "select max(Central_Exam_id ) from Central_Exam where Central_Exam_id < " & seedVal + 999999 & " and Central_Exam_id >= " & seedVal
    Set rsSeed = ExecuteSelect(Conn, sql, cancel)
        If (IsNull(rsSeed.Fields(0))) Then
          maxCentralExamID = seedVal '- 1
        Else
          maxCentralExamID = rsSeed.Fields(0)
        End If
         ExecuteCommand Conn, " dbcc checkIdent(Central_Exam, reseed , " & maxCentralExamID & ")", cancel
    'Central_Exam
End Sub

Private Sub master_doBeforeUpdate(rs As ADODB.Recordset, cancel As Boolean)
    If master.rs.RecordCount = 0 Then cancel = True
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    Dim i As Integer
    For i = 0 To UBound(txtArray)
        txtArray(i).locked = False
    Next i
    cmdFix.Enabled = False
    cmdRefresh.Enabled = False
    cmdPic_Teeth.Enabled = False
    lblPrice.visible = False
    
    lblFixed.visible = False
    lblMoved.visible = False
    txtIhalaID_Per_Company.locked = False
    
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    cmdFix.Enabled = True
    cmdPic_Teeth.Enabled = True
    cmdNewPatient.Enabled = True
    cmdRefresh.Enabled = True
    Set_Permission
    Get_Detail_Summeries

''    'If Save_After <> ST_UPDATE Then Exit Sub
''
''    Central_Exam_ID = rs!Central_Exam_ID
''
''    ' rs.Requery
'
'    rs.Find "central_Exam_ID=" & Central_Exam_ID
''
'    RefreshCommands FormSettings And btMaskCancel
''
'    master.State = 0
''
'    Cancel = True
 
End Sub

Private Sub master_doCancelSaveComplete(rs As ADODB.Recordset)
    If rs.EOF Or rs.BOF Then Exit Sub
    rs.Find "Central_Exam_ID = " & master.rs!Central_Exam_ID
    Select_Patient
    If with_Examiner_Doctor Then
        Select_Examiner_Doctor
    End If
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    Dim i As Integer
    
    If rs.EOF Or rs.BOF Then Exit Sub
    For i = 0 To UBound(txtArray)
        txtArray(i).locked = True
    Next i

    If with_Examiner_Doctor Then
        lblPrice.visible = True
    End If
    
    lblMoved.visible = CBool(master.rs!Moved = 1)
    lblFixed.visible = CBool(detail.rs!Fixed = 1)
    
    If Start_Record_Count = 0 Then Exit Sub
    
    cmdFix.Enabled = True
    cmdPic_Teeth.Enabled = True
    cmdNewPatient.Enabled = True
    cmdRefresh.Enabled = True
    txtIhalaID_Per_Company.locked = True
    Set_Permission
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim i As Integer
    Dim c As Boolean
    Dim c1 As Boolean
    Dim sql As String
    
    
    Dim rsCheck As New ADODB.Recordset
    
    Set rsCheck = ExecuteSelect(Conn, "Select count(*) from Pic_ClientTreats where IhalaID = " & master.rs!Central_Exam_ID, c1)
    
    If rsCheck.Fields(0).Value <> 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·≈Õ«·… »”»» ÊÃÊœ √⁄„«· „Ã—«… ›ÌÂ«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
        Exit Sub
    End If
    
    Set rsCheck = Nothing
    
    For i = 0 To UBound(txtArray)
        txtArray(i).datafield = ""
    Next i
'    '************Delete Record from the table

    Dim step As Integer

    On Error GoTo errHandler

    step = 0

    ExecuteCommand Conn, "Delete from Central_Exam where central_Exam_ID = " & rs!Central_Exam_ID, c
    
    Set master.rs = Nothing
    
    sql = "Select * from vCentral_Exam where "
    sql = sql + "   Central_Exam_ID between " & startRang & " and " & EndRang & " and "
    
    If with_Examiner_Doctor Then
        sql = sql + "With_Exam = 1"
    Else
        sql = sql + "With_Exam = 0"
    End If
    
    Set master.rs = ExecuteSelect(Conn, sql & " order by 1", c)
    
    master_doDeleteCompleted rs
    
    If Not master.rs.EOF Then
        master.MoveFirst
    Else
        Clear_Controls
    End If

'    master_doDeleteCompleted rs
'
'    rs.MoveNext
'
'    If rs.RecordCount > 0 Then
'        rs.MoveFirst
'    Else
'        master.addNew
'    End If
    cancel = True
    Exit Sub

errHandler:
    If step <> 0 Then
        Err.Raise Err.Number
        Exit Sub
    End If
    cancel = False
    rs.CancelUpdate
    Call master_doDeleteError(rs, Err, cancel)
    If Not cancel Then
        MsgBox "Õ’· Œÿ√ √À‰«¡ ⁄„·Ì… «·Õ–›° Õ«Ê· „—… √Œ—Ï Ê›Ì Õ«·  ﬂ—«— «·Œÿ√° «·—Ã«¡ «·« ’«· »„Ê“⁄ «·»—‰«„Ã.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Œÿ√ —ﬁ„ " & Err.Number
    End If
    
End Sub

Private Sub master_doDeleteCompleted(rs As ADODB.Recordset)
    txtPatient_Name.datafield = "Patient_Name"
    txtOrganization_Name.datafield = "Organization_Name"
    txtOrganization_ID.datafield = "Organization_ID"
    txtExaminer_Doctor_Name.datafield = "Examiner_Doctor_Name"
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    If cancel Then Exit Sub
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
End Sub
Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    'KeepState = True
   ' Dim strError As String
    ' strError = rs.ActiveConnection.Errors(0).description
    ' If InStr(1, strError, "can't modify invoice detail object") Then
    '     msg = "·« Ì„ﬂ‰ﬂ  ⁄œÌ· Õﬁ· «·„«œ… ·√Õœ √ﬁ·«„ «·›« Ê—…° ﬁ„ »Õ–› Â–« «·ﬁ·„ Ê≈œŒ«· ﬁ·„ ÃœÌœ »«·„«œ… «·ÃœÌœ…"
  
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    
    If rs.EOF Or rs.BOF Or rs.RecordCount = 0 Then Exit Sub
    lblMoved.visible = CBool(master.rs!Moved = 1)
    lblIhala_Id_In_Company.Caption = "—ﬁ„ Â–Â «·≈Õ«·… ÷„‰ ≈Õ«·«  Â–Â «·‘—ﬂ… = " & rs!Ihala_ID_in_Company
    
    Dim X As String
    X = CStr(1000000 + rs!Patient_Id)
    txtPatient_ID.text = Mid(X, Len(X) - 5, 6)
    cmbExam_Total_Click
'    Dim Sql As String
'    Sql = "select dbo.sf_Get_Treatment_Total(" & rs!Central_Exam_ID & ")"
'    Dim totalRs As Recordset
'    Dim Cancel As Boolean
'    Set totalRs = ExecuteSelect(Conn, Sql, Cancel)
'    If Cancel Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    If totalRs.EOF Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    txtTreatment_Total.text = totalRs.Fields(0).Value
    
    Lock_Fram_Contenets (rs!Moved = 0)
    Set_Permission
    If Not Open_By_Patient_Card Then Get_Detail_Summeries
    
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    Dim patient_Date As ADODB.Recordset
    Dim bCnt As Integer
    If (Save_After = ST_ADDNEW) Then
        bCnt = 0
    Else
        bCnt = 1
    End If
    Set patient_Date = ExecuteSelect(Conn, "SELECT IsNull(count(*),0) as cnt from vCentral_Exam WHERE Central_Exam_Date = '" & dtCentral_Exam_Date.Value & "' AND Patient_ID = " & txtPatient_ID.text, cancel)
    
    If (Not (patient_Date Is Nothing)) And (Not cancel) And (patient_Date!cnt > bCnt) Then
        MsgBox "·«Ì„ﬂ‰  ﬂ—«— «Õ«·… ·‰›” «·„—Ì÷ ›Ì ‰›” «· «—ÌŒ", vbInformation + vbOKOnly + vbMsgBoxRtlReading, "„·«ÕŸ…"
        cancel = True
        Exit Sub
    End If
    Dim i As Integer
    
    For i = 0 To UBound(txtArray)
        txtArray(i).datafield = ""
    Next i
    
    cmbPricCat.datafield = ""
    
    If with_Examiner_Doctor Then
        rs!With_Exam = 1
    Else
        rs!With_Exam = 0
    End If
    
    Save_After = master.state
    
    '--------------------------------
     Dim rsCount As New ADODB.Recordset
     'If master.SaveAfterWhat = ST_ADDNEW Then
        
        Set rsCount = ExecuteSelect(Conn, "Select IsNull(count(*),0) + 1 from vCentral_Exam where Organization_ID =  " & val(txtOrganization_ID.text), cancel)
             
        rs.Fields("Ihala_ID_In_Company").Value = rsCount.Fields(0).Value
        txtIhalaID_Per_Company.text = rsCount.Fields(0).Value
        Set rsCount = Nothing
    'End If
        
    If val(txtWhole_Total.text) = 0 Then
         txtWhole_Total.text = lblPrice.Caption
    End If
    
   Open_By_Patient_Card = False
   '--------------------------------
    
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    Screen.MousePointer = vbHourglass
   
    
    
    txtPatient_Name.datafield = "Patient_Name"
    txtOrganization_Name.datafield = "Organization_Name"
    txtOrganization_ID.datafield = "Organization_ID"
    txtExaminer_Doctor_Name.datafield = "Examiner_Doctor_Name"
    cmbPricCat.datafield = "PriceCat"
    
    txtCentral_Exam_ID.text = rs!Central_Exam_ID
    
    cmdPic_Teeth.visible = True
    cmdPic_Teeth.Enabled = True
    cmdFix.visible = True
    cmdFix.Enabled = True
    cmdRefresh.Enabled = True
    cmdNewPatient.Enabled = True
    Set_Permission
'    If master.SaveAfterWhat = ST_ADDNEW Then
'
'        Dim Current_id As Long
'        Dim Cancel As Boolean
'        Dim rsFilter As Variant
'
'        Current_id = rs!Central_Exam_ID
'
'        rsFilter = rs.Filter
'
'        txtCentral_Exam_ID.text = rs!Central_Exam_ID
'
'        If with_Examiner_Doctor Then
'            Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 1 order by 1", Cancel)
'        Else
'            Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where with_exam = 0 order by 1", Cancel)
'        End If
'
'        master.rs.Filter = rsFilter
'
'        master.rs.Find "Central_Exam_Id = " & Current_id
'
'    End If

    ExecuteCommand Conn, "Set Dateformat DMY exec sp_UpdateWholeTotal " & rs!Central_Exam_ID & ",'" & rs!Central_Exam_Date & "'", cancel

    Get_Detail_Summeries
    
    lblIhala_Id_In_Company.Caption = "—ﬁ„ Â–Â «·≈Õ«·… ÷„‰ ≈Õ«·«  Â–Â «·‘—ﬂ… = " & rs!Ihala_ID_in_Company
    txtIhalaID_Per_Company.text = rs!Ihala_ID_in_Company & ""
    Screen.MousePointer = vbDefault
    Open_By_Patient_Card = False
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    If with_Examiner_Doctor Then
        S = "With_Exam = 1"
    Else
        S = "With_Exam = 0"
    End If
    DefaultType = 1
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Dim i As Integer
     
    If rs.EOF Or rs.BOF Then Exit Sub
    
    For i = 0 To UBound(txtArray)
        txtArray(i).locked = True
    Next i
    If with_Examiner_Doctor Then
        lblPrice.visible = True
    End If
    
    txtIhalaID_Per_Company.locked = True
    
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    If rs.RecordCount = 0 Then Exit Sub
    cmdFix.Enabled = False
    cmdPic_Teeth.Enabled = False
    cmdNewPatient.Enabled = False
    cmdRefresh.Enabled = False
    Central_Exam_ID = rs!Central_Exam_ID
    Save_After = ST_UPDATE
    If rs!Moved = 1 Or rs!Fixed = 1 Then Exit Sub
    Lock_Fram_Contenets True
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    
    Dim rsDateComparing As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    Dim MonthBetween As Integer
    
    If UCase(ctrl.name) = "DTCENTRAL_EXAM_DATE" Then
        sql = "Set Dateformat DMY SELECT DATEDIFF(month, '" & dtExam_Date.Value & "','" & dtCentral_Exam_Date.Value & "')"
        With rsDateComparing
            Set rsDateComparing = ExecuteSelect(Conn, sql, cancel)
            If cancel Then
                msg = "Â‰«ﬂ Œÿ√ ›Ì ÷»ÿ «· «—ÌŒ «·«› —«÷Ì ·ÃÂ«“ «·ﬂ„»ÌÊ — Œ«’ ﬂ ° «·—Ã«¡ «· √ﬂœ „‰ ÷»ÿ «· «—ÌŒ «·«› —«÷Ì« »«· ‰”Ìﬁ «· «·Ì   dd/mm/yyyy"
                checkType = True
            End If
            MonthBetween = Abs(rsDateComparing.Fields(0).Value)
            If MonthBetween > 3 And with_Examiner_Doctor Then
                msg = "·« Ì„ﬂ‰ﬂ Õ›Ÿ Â–Â «·≈Õ«·… ° ·√‰ «·›«—ﬁ »Ì‰  «—ÌŒ «·≈Õ«·… Ê «—ÌŒ «·›Õ’ Ì Ã«Ê“ «·Õœ «·„”„ÊÕ »Â"
                checkType = True
            End If
        End With
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then Exit Sub
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    Set_Permission
End Sub

Private Sub Set_Exam_Status()
    
    Dim i As Integer
    
    If with_Examiner_Doctor Then
        
        Me.Caption = "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
        
        Me.masterFrame = "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
        
        lblExam_Date.visible = True
        lblExaminer_Doctor_ID.visible = True
        lblExam_Total.visible = True
        lblExaminer_Doctor_Name.visible = True
        dtExam_Date.visible = True
        txtExaminer_Doctor_ID.visible = True
        txtExaminer_Doctor_Name.visible = True
        cmbExam_Total.visible = True
        cmdSelect_Examiner_Doctor.visible = True
        
        
        txtExaminer_Doctor_ID.datafield = "Doctor_ID"
        txtExaminer_Doctor_Name.datafield = "Examiner_Doctor_Name"
        cmbExam_Total.datafield = "Exam_Total_ID"
        dtExam_Date.datafield = "Exam_Date"
        
        txtExaminer_Doctor_ID.Tag = ";search=true;check=required;"
        'dtExpose_Date.tag = ";search=true;check=required;check=date;"
        
        lblPrice.visible = True
        
        'lblExpose_Date.visible = False
        'dtExpose_Date.visible = False
        'dtExpose_Date.DataField = ""
        'dtExpose_Date.tag = ""
        
    Else
    
        Me.Caption = "≈Õ«·… »œÊ‰ ÿ»Ì» ›«Õ’"
        
        Me.masterFrame = "≈Õ«·… »œÊ‰ ÿ»Ì» ›«Õ’"
        
        lblExam_Date.visible = False
        lblExaminer_Doctor_ID.visible = False
        lblExam_Total.visible = False
        lblExaminer_Doctor_Name.visible = False
        dtExam_Date.visible = False
        txtExaminer_Doctor_ID.visible = False
        txtExaminer_Doctor_Name.visible = False
        cmbExam_Total.visible = False
        cmdSelect_Examiner_Doctor.visible = False
        
        txtExaminer_Doctor_ID.datafield = ""
        txtExaminer_Doctor_Name.datafield = ""
        cmbExam_Total.datafield = ""
        dtExam_Date.datafield = ""
        
        txtExaminer_Doctor_ID.Tag = ";search=true;"
        dtExam_Date.Tag = ";check=required;check=date;"
        
        
        lblPrice.visible = False
        
        dtExam_Date.visible = False
        
        
        lblTreatment_Total.visible = False
        txtTreatment_Total.visible = False
        
'        dtExpose_Date.visible = True
'        lblExpose_Date.visible = True
'        dtExpose_Date.DataField = "Expose_Date"
'        dtExpose_Date.tag = ";check=required;check=date;"
        
    End If
    
    
'    If master.rs.RecordCount = 0 Then
'        cmdPic_Teeth.visible = False
'        cmdFix.visible = False
'    End If
    
    
    
End Sub

Private Sub txtCentral_Exam_ID_KeyPress(KeyAscii As Integer)
    If master.state = ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub txtOrganization_ID_Change()
    cmdChangeFloor.visible = txtOrganization_ID.text <> ""
End Sub

Private Sub txtPatient_ID_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
        txtPatient_ID_Validate False
        Exit Sub
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtPatient_ID_Validate(cancel As Boolean)
    Select_Patient
    cancel = Not Patient_checked
End Sub

Private Sub txtExaminer_Doctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        txtExaminer_Doctor_ID_Validate False
        Exit Sub
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtExaminer_Doctor_ID_Validate(cancel As Boolean)
    Select_Examiner_Doctor
    cancel = Not Examiner_Doctor_checked
End Sub

Private Sub txtWhole_Total_KeyPress(KeyAscii As Integer)
    If Not lblMoved.visible Then
        KeyAscii = Prevent_char(KeyAscii)
    End If
End Sub
