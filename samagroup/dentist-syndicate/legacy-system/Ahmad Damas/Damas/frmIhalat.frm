VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmIhalat 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·≈Õ«·« "
   ClientHeight    =   8595
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10140
   Icon            =   "frmIhalat.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8595
   ScaleWidth      =   10140
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·≈Õ«·« "
      Height          =   7980
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   90
      Width           =   10095
      Begin VB.CheckBox Check1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H80000018&
         Caption         =   " Œ÷⁄ ·Õ”„ «÷«›Ì"
         DataField       =   "Has_More_Discount"
         Height          =   255
         Left            =   2640
         RightToLeft     =   -1  'True
         TabIndex        =   48
         Top             =   6240
         Width           =   1215
      End
      Begin VB.TextBox txtPatient_Mother_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Mother_Name"
         Enabled         =   0   'False
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   45
         Tag             =   ";search=true;"
         Top             =   1800
         Width           =   3495
      End
      Begin VB.TextBox txtPatient_Father_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Father_Name"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6060
         RightToLeft     =   -1  'True
         TabIndex        =   44
         Tag             =   ";search=true;"
         Top             =   1800
         Width           =   2175
      End
      Begin VB.TextBox txtExaminer_Doctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6045
         RightToLeft     =   -1  'True
         TabIndex        =   33
         Tag             =   ";search=true;"
         Top             =   3870
         Width           =   2190
      End
      Begin VB.ComboBox cmbWith_Exam 
         DataField       =   "with_Exam"
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "frmIhalat.frx":1CFA
         Left            =   6075
         List            =   "frmIhalat.frx":1D04
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   37
         Tag             =   ";search=true;"
         Top             =   4440
         Width           =   2130
      End
      Begin VB.ComboBox cmbPricCat 
         DataField       =   "PriceCat"
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "frmIhalat.frx":1D11
         Left            =   315
         List            =   "frmIhalat.frx":1D1B
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   39
         Top             =   4455
         Width           =   3495
      End
      Begin VB.CommandButton cmdPic_Teeth 
         Caption         =   "«·‘«‘… «·”‰Ì… ( ··«” ⁄—«÷ ›ﬁÿ )"
         Height          =   375
         Left            =   180
         RightToLeft     =   -1  'True
         TabIndex        =   36
         Top             =   7440
         Width           =   2445
      End
      Begin VB.TextBox txtExaminer_Doctor_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Examiner_Doctor_Name"
         Enabled         =   0   'False
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   32
         Tag             =   ";search=true;"
         Top             =   3870
         Width           =   3495
      End
      Begin VB.CommandButton cmdUnFix 
         Caption         =   "≈·€«¡  À»Ì  «·≈Õ«·…"
         Height          =   375
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   31
         Top             =   7440
         Visible         =   0   'False
         Width           =   1680
      End
      Begin VB.TextBox txtDiscount 
         Alignment       =   1  'Right Justify
         DataField       =   "Discount"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   6135
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Top             =   6690
         Width           =   2190
      End
      Begin VB.TextBox txtDiscount_Reason 
         Alignment       =   1  'Right Justify
         DataField       =   "Discount_Reason"
         ForeColor       =   &H000000FF&
         Height          =   555
         Left            =   360
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   27
         Top             =   6600
         Width           =   3495
      End
      Begin VB.CommandButton cmdSelect_Curer_Doctor 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   5760
         Width           =   375
      End
      Begin VB.TextBox txtCurer_Doctor_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Curer_Doctor_Name"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   360
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Tag             =   ";search=true;"
         Top             =   5760
         Width           =   3495
      End
      Begin VB.TextBox txtCurer_Doctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Curer_Doctor_ID"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   6510
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   ";search=true;check=required;"
         Top             =   5760
         Width           =   1815
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
         Width           =   9825
      End
      Begin VB.TextBox txtPatient_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_ID"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6060
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;check=required;"
         Top             =   1275
         Width           =   2175
      End
      Begin VB.TextBox txtTreatment_Total 
         Alignment       =   1  'Right Justify
         DataField       =   "Treatment_Total"
         Enabled         =   0   'False
         Height          =   375
         Left            =   375
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   3345
         Width           =   3495
      End
      Begin VB.TextBox txtOrganization_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_Name"
         Enabled         =   0   'False
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;"
         Top             =   2325
         Width           =   3495
      End
      Begin VB.TextBox txtOrganization_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_ID"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6045
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   2325
         Width           =   2190
      End
      Begin VB.TextBox txtPatient_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Patient_Name"
         Enabled         =   0   'False
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;"
         Top             =   1275
         Width           =   3495
      End
      Begin VB.TextBox txtCentral_Exam_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Central_Exam_ID"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6030
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;"
         Top             =   720
         Width           =   2190
      End
      Begin VB.ComboBox cmbPatient_Type 
         DataField       =   "Patient_Type_ID"
         Enabled         =   0   'False
         Height          =   315
         Left            =   6045
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   ";new=0;"
         Top             =   2880
         Width           =   2190
      End
      Begin VB.ComboBox cmbExam_Total 
         DataField       =   "Exam_Total_ID"
         Enabled         =   0   'False
         Height          =   315
         Left            =   6045
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   3375
         Width           =   2190
      End
      Begin MSComCtl2.DTPicker dtCentral_Exam_Date 
         DataField       =   "Central_Exam_Date"
         Height          =   375
         Left            =   360
         TabIndex        =   10
         Tag             =   ";search=true;check=required;check=date;"
         Top             =   720
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   661
         _Version        =   393216
         Enabled         =   0   'False
         Format          =   67502081
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtExam_Date 
         DataField       =   "Exam_Date"
         Height          =   375
         Left            =   360
         TabIndex        =   11
         Tag             =   ";search=true;check=required;check=date;"
         Top             =   2850
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   661
         _Version        =   393216
         Enabled         =   0   'False
         Format          =   67502081
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtExpose_Date 
         DataField       =   "Expose_Date"
         Height          =   375
         Left            =   6120
         TabIndex        =   41
         Tag             =   ";search=true;check=custom;"
         Top             =   6210
         Width           =   2190
         _ExtentX        =   3863
         _ExtentY        =   661
         _Version        =   393216
         CalendarForeColor=   64
         CalendarTitleForeColor=   0
         CheckBox        =   -1  'True
         Format          =   67502081
         CurrentDate     =   40139
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√„"
         Height          =   195
         Index           =   9
         Left            =   4530
         RightToLeft     =   -1  'True
         TabIndex        =   47
         Top             =   1890
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√»"
         Height          =   195
         Index           =   6
         Left            =   8820
         RightToLeft     =   -1  'True
         TabIndex        =   46
         Top             =   1890
         Width           =   570
      End
      Begin VB.Label lblExaminer_Doctor_ID 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì» «·›«Õ’"
         Height          =   195
         Left            =   8475
         RightToLeft     =   -1  'True
         TabIndex        =   35
         Top             =   3960
         Width           =   1260
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„⁄ ÿ»Ì» ›«Õ’"
         Height          =   195
         Left            =   8595
         RightToLeft     =   -1  'True
         TabIndex        =   38
         Top             =   4500
         Width           =   1035
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
         Left            =   180
         RightToLeft     =   -1  'True
         TabIndex        =   43
         Top             =   5085
         Width           =   9735
      End
      Begin VB.Label lblExpose_Date 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·ﬂ‘›"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   8415
         RightToLeft     =   -1  'True
         TabIndex        =   42
         Top             =   6300
         Width           =   1380
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "›∆…  ”⁄Ì— «·„⁄«·Ã« "
         Height          =   195
         Left            =   4095
         RightToLeft     =   -1  'True
         TabIndex        =   40
         Top             =   4515
         Width           =   1380
      End
      Begin VB.Label lblExaminer_Doctor_Name 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·ÿ»Ì» «·›«Õ’"
         Height          =   195
         Left            =   4148
         RightToLeft     =   -1  'True
         TabIndex        =   34
         Top             =   3960
         Width           =   1275
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ﬁÌ„… «·Õ”„"
         ForeColor       =   &H000000FF&
         Height          =   195
         Index           =   3
         Left            =   8730
         RightToLeft     =   -1  'True
         TabIndex        =   30
         Top             =   6780
         Width           =   750
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "”»» «·Õ”„"
         ForeColor       =   &H000000FF&
         Height          =   195
         Index           =   2
         Left            =   4410
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Top             =   6780
         Width           =   765
      End
      Begin VB.Label lblCurer_Doctor_Name 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·ÿ»Ì» «·„⁄«·Ã"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   4155
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Top             =   5850
         Width           =   1260
      End
      Begin VB.Label lblCurer_Doctor_ID 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì» «·„⁄«·Ã"
         ForeColor       =   &H000000FF&
         Height          =   195
         Index           =   0
         Left            =   8490
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   5850
         Width           =   1245
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H000000FF&
         BorderWidth     =   2
         Height          =   1725
         Left            =   180
         Top             =   5580
         Width           =   9735
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ »ÿ«ﬁ… «·„—Ì÷"
         Height          =   195
         Index           =   14
         Left            =   8520
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   1365
         Width           =   1185
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈Ã„«·Ì «·„⁄«·Ã…"
         Height          =   195
         Index           =   13
         Left            =   4245
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   3435
         Width           =   1080
      End
      Begin VB.Label lblExam_Date 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·›Õ’"
         Height          =   195
         Left            =   4358
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   2940
         Width           =   855
      End
      Begin VB.Label lblExam_Total 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ﬁÌ„… «·›Õ’"
         Height          =   195
         Left            =   8715
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   3435
         Width           =   780
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·„ƒ””…"
         Height          =   195
         Index           =   8
         Left            =   4335
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   2415
         Width           =   900
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·„ƒ””…"
         Height          =   195
         Index           =   7
         Left            =   8670
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   2415
         Width           =   885
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·„—Ì÷"
         Height          =   195
         Index           =   5
         Left            =   4403
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   1365
         Width           =   765
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "’›… «·„—Ì÷"
         Height          =   195
         Index           =   4
         Left            =   8715
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   2940
         Width           =   795
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·≈Õ«·…"
         Height          =   195
         Index           =   1
         Left            =   4365
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   810
         Width           =   840
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·≈Õ«·…"
         Height          =   195
         Index           =   0
         Left            =   8760
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   810
         Width           =   705
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   4425
         Left            =   120
         Top             =   600
         Width           =   9735
      End
   End
End
Attribute VB_Name = "frmIhalat"
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
Public Open_For_Fixing_Ihala As Boolean
Dim Curer_Doctor_checked As Boolean
Public Central_Exam_ID As Long
 Dim Previous_BtnSettings As Long
Dim Now_Ufixing_Ihala As Boolean
Public FrmCentral_Exam_ButtonSettings As Long
Public Caller_Form As frmCentral_Exam
Sub Set_Controls_Enable_Status(Enable_Status)
    
    dtExam_Date.Enabled = Enable_Status
    dtCentral_Exam_Date.Enabled = Enable_Status
    txtCentral_Exam_ID.Enabled = Enable_Status
    txtOrganization_ID.Enabled = Enable_Status
    txtOrganization_Name.Enabled = Enable_Status
    txtPatient_ID.Enabled = Enable_Status
    txtPatient_Name.Enabled = Enable_Status
    txtTreatment_Total.Enabled = Enable_Status
    txtExaminer_Doctor_ID.Enabled = Enable_Status
    txtExaminer_Doctor_Name.Enabled = Enable_Status
    txtPatient_Father_Name.Enabled = Enable_Status
    txtPatient_Mother_Name.Enabled = Enable_Status
    cmbPatient_Type.Enabled = Enable_Status
    cmbWith_Exam.Enabled = Enable_Status
    
    If master.rs.RecordCount = 0 Then Exit Sub
    
End Sub
Sub Set_Curer_Doctor_ID(Value As String)
    txtCurer_Doctor_ID.text = Value
    MousePointer = vbDefault
End Sub
Sub Set_Curer_Doctor_Name(Value As String)
    txtCurer_Doctor_Name.text = Value
End Sub
Sub Select_Curer_Doctor()
    MousePointer = vbHourglass
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    Dim Curer_Doctor_ID As Long
    
    Curer_Doctor_ID = val(txtCurer_Doctor_ID.text)
    
    Curer_Doctor_checked = False
    
    sql = "select First_Name + ' ' + Last_Name as Name ,Doctor_ID as ID,Father_Name,Mother_Name from VCollaborative_Doctors"
    
    If Curer_Doctor_ID <> 0 Then
        sql = sql & " where Doctor_id = " & Curer_Doctor_ID
    End If
    
    sql = sql & " order by doctor_ID"
          
   Set rs = ExecuteSelect(Conn, sql, c)
   
   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Curer_Doctor_checked = False
        Exit Sub
   End If
   
   If rs.RecordCount <> 1 Then
       rs.Close
          
          sql = "select first_name + ' ' + last_name as Name ,Doctor_ID as ID,Father_Name,Mother_Name " & _
                "from VCollaborative_Doctors order by doctor_ID"
                
          Set rs = ExecuteSelect(Conn, sql, c)
          
          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Curer_Doctor_checked = False
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
               'Load Clin_List
              'Set Clin_List.callerForm = Me
              GLOBAL_TAG = "datafield=,0:id,1:Name,2:Father_Name,3:Mother_Name,;"
              GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Curer_Doctor_ID,1:Set_Curer_Doctor_Name,;"
              'GLOBAL_TAG = GLOBAL_TAG & "initQuery=0:" & txtExaminer_Doctor_ID.text & ",;"
              GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
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
         txtCurer_Doctor_ID.text = rs.Fields("ID").Value
         txtCurer_Doctor_Name.text = rs.Fields("Name").Value
         Curer_Doctor_checked = True
    End If
   
    MousePointer = vbDefault

End Sub

Private Sub Check1_Click()
If (Check1.Value = 1) Then
    Check1.BackColor = &HFF&
Else
    Check1.BackColor = &H80000018
End If
End Sub

Private Sub cmdPic_Teeth_Click()
    btnSettings = GetBtnSettings
    MDIMain.EnterClinic
    If master.state <> 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ «·‘«‘… «·”‰Ì… ﬁ»· Õ›Ÿ «·»ÿ«ﬁ… √Ê √À‰«¡ ⁄„·Ì… «·»ÕÀ", vbCritical + vbOKOnly
        Exit Sub
    End If
    Pic_TeethImg.MaxIhalaPrice = Get_Organization_Limit(master.rs!Organization_Id, master.rs!Central_Exam_Date)
    Pic_TeethImg.IhalaID = master.rs!Central_Exam_ID
    Pic_TeethImg.Client_ID = master.rs!Patient_Id
    Pic_TeethImg.Organization_Id = master.rs!Organization_Id
     '<AHMAD>
    Pic_TeethImg.Central_Exam_Date = format(master.rs!Central_Exam_Date, "dd/mm/yyyy")
    Pic_TeethImg.Patient_Name = master.rs!Patient_Name
    '</AHMAD>
    
    Pic_TeethImg.Editable = 0
    
    If IsNull(master.rs!price) Then
        Pic_TeethImg.CentralPrice = 0
    Else
        Pic_TeethImg.CentralPrice = master.rs!price
    End If
    
    Pic_TeethImg.Caption = Pic_TeethImg.Caption & " ··≈Õ«·… —ﬁ„ " & txtCentral_Exam_ID & " ··„—Ì÷ " & txtPatient_Name & " „‰ " & txtOrganization_Name
    Pic_TeethImg.cmdRemoveTreatments.Enabled = False
    Pic_TeethImg.Show 1, MDIMain
    RefreshCommands btnSettings
End Sub

Private Sub cmdSelect_Curer_Doctor_Click()
    txtCurer_Doctor_ID_Validate False
End Sub

Private Sub cmdUnFix_Click()
    If master.rs!Moved = 1 Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈·€«¡  À»Ì  Â–Â «·≈Õ«·… ·√‰Â« „ı—Õ·…", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    Dim msg As VbMsgBoxResult
    msg = MsgBox("”Ê› Ì „ ≈·€«¡  À»Ì  Â–Â «·≈Õ«·… :" & Chr(10) + Chr(13) & "√Ì √‰Â ”Ê› Ì „ Õ–› Ã„Ì⁄ «·„⁄·Ê„«  «·„ ⁄·ﬁ… » À»Ì  Â–Â «·≈Õ«·… Ê ⁄œÌ· Ê÷⁄Â« ≈·Ï €Ì— „À» … ° Â· √‰  „ √ﬂœø", vbQuestion + vbYesNoCancel + vbMsgBoxRight + vbMsgBoxRtlReading, "”ƒ«·")
    If msg <> vbYes Then Exit Sub
    RefreshCommands 0
    master.rs!Fixed = 0
    master.rs!Curer_Doctor_ID = Null
    master.rs!Expose_Date = Null
    master.rs!discount = 0
    master.rs!Discount_Reason = Null
    master.rs!Has_More_Discount = Null
    master.rs.Update
    txtCurer_Doctor_ID.text = ""
    txtCurer_Doctor_Name.text = ""
    dtExpose_Date.Value = Null
    txtDiscount.text = ""
    txtDiscount_Reason.text = ""
    cmdPic_Teeth.visible = True
    cmdUnFix.visible = False
    Check1.Value = False
    MsgBox " „ ≈·€«¡  À»Ì  Â–Â «·≈Õ«·… »‰Ã«Õ", vbInformation + vbOKOnly
    Unload Me
End Sub

Private Sub Form_Activate()
    'If ActiveFrame = masterFrame Then Exit Sub
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    Dim Ihaleh_Nesab As Boolean
    Ihaleh_Nesab = Get_Permission("Ihaleh_Nesab")
    If Ihaleh_Nesab = True Then
    'Check1.Enabled = True
        Check1.visible = True
    Else
    'Check1.Enabled = False
        Check1.visible = False
    End If
    Previous_BtnSettings = GetBtnSettings
    
    oldScaleWidth = 10260
    FormSettings = btall - btPrint - btDelete - btNew - btUpdate - btCancel
    
    RefreshCommands btnSettings And FormSettings
    
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Dim sql As String
    
    sql = "Select * from vCentral_Exam"
    
    If Open_For_Fixing_Ihala Then
        sql = sql & " where Central_Exam_ID = " & Central_Exam_ID
    Else
        sql = sql & " Where Curer_Doctor_ID Is Not Null "
    End If
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    InitFrame
    
    
    If master.rs!Moved = 1 Then
        If Open_For_Fixing_Ihala Then
            btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
        Else
            btnSettings = btall - btSearchCancel - btSearchExec
        End If
    Else
        btnSettings = 0
    End If
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    If GetTagValue(Current_State.Settings, "SHOW_PER_COM") = "false" Then
        lblIhala_Id_In_Company.visible = False
    End If
    
    Now_Ufixing_Ihala = False
    
    If master.rs.RecordCount = 0 Then
        cmdPic_Teeth.visible = False
    End If
    
    If Not master.rs.EOF Then
        master.rs.MoveFirst
    End If
    
    Set_Controls_Enable_Status False
    
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    fillCmb cmbPatient_Type, "Select Patient_type_ID as ID,Patient_type as Name from FixPatient_Type order by 1"
    fillCmb cmbExam_Total, "Select ID , Name from Fixexam_Total order by 1"
End Sub

Private Sub Set_Exam_Status()
    
    Dim i As Integer
    
    If master.rs!With_Exam = 1 Then
        
        lblExam_Date.visible = True
        lblExam_Total.visible = True
        lblExaminer_Doctor_ID.visible = True
        lblExaminer_Doctor_Name.visible = True
        txtExaminer_Doctor_ID.visible = True
        txtExaminer_Doctor_Name.visible = True
        dtExam_Date.visible = True
        cmbExam_Total.visible = True
        cmbExam_Total.datafield = "Exam_Total_ID"
        dtExam_Date.datafield = "Exam_Date"
        
'        lblExpose_Date.visible = False
'        dtExpose_Date.visible = False
'        dtExpose_Date.DataField = ""
'        dtExpose_Date.tag = ""
        
    Else
        
        lblExam_Date.visible = False
        lblExam_Total.visible = False
        dtExam_Date.visible = False
        cmbExam_Total.visible = False
        lblExaminer_Doctor_ID.visible = False
        lblExaminer_Doctor_Name.visible = False
        txtExaminer_Doctor_ID.visible = False
        txtExaminer_Doctor_Name.visible = False
        cmbExam_Total.datafield = ""
        dtExam_Date.datafield = ""
        
'        lblExpose_Date.visible = True
'        dtExpose_Date.visible = True
'        dtExpose_Date.DataField = "Expose_Date"
'        'dtExpose_Date.tag = ""
        
    End If
    
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
    Dim c As Boolean
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
    If Caller_Form Is Nothing Then Exit Sub
    If Caller_Form.master Is Nothing Or Open_For_Fixing_Ihala = False Then Exit Sub
    With Caller_Form
        If Open_For_Fixing_Ihala Then
            .btnSettings = FrmCentral_Exam_ButtonSettings
            CallByName Caller_Form, "Get_Detail_Summeries", VbMethod
        End If
    End With
    Set Caller_Form = Nothing
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    Set_Controls_Enable_Status True
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
   Set_Controls_Enable_Status False
End Sub

Private Sub master_doCancelSearchComplete(rs As ADODB.Recordset)
    Set_Controls_Enable_Status False
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)


    If rs!Fixed = 1 Then
        cmdUnFix.visible = True
        If Not Open_For_Fixing_Ihala Then
            btnSettings = btall - btSearchCancel - btSearchExec - btsave
        Else
            btnSettings = btall - btCancel - btSearchCancel - btSearchExec - btsave
        End If
        RefreshCommands btnSettings And FormSettings
    Else
        cmdUnFix.visible = False
        dtExpose_Date.Value = Date
        If Not Open_For_Fixing_Ihala Then
            btnSettings = btall - btSearchCancel - btSearchExec - btsave
        Else
            btnSettings = btall - btCancel - btSearchCancel - btSearchExec
        End If
        RefreshCommands btnSettings And FormSettings
    End If
     
    Set_Exam_Status 'With or Without Examiner Doctor
    
    
    lblIhala_Id_In_Company.Caption = "—ﬁ„ Â–Â «·≈Õ«·… ÷„‰ ≈Õ«·«  Â–Â «·‘—ﬂ… = " & rs!Ihala_ID_in_Company
    
    Dim X As String
    X = CStr(1000000 + rs!Patient_Id)
    txtPatient_ID.text = Mid(X, Len(X) - 5, 6)
    
    MDIMain.cmdSave.Enabled = rs!Fixed = 0
    
    '-*************************
'    Dim sql As String
'    sql = "select dbo.sf_Get_Treatment_Total(" & rs!Central_Exam_ID & ")"
'    Dim totalRs As Recordset
'    Dim cancel As Boolean
'    Set totalRs = ExecuteSelect(Conn, sql, cancel)
'    If cancel Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    If totalRs.EOF Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    txtTreatment_Total.text = totalRs.Fields(0).Value
    
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!Fixed = 1
    dtExam_Date.datafield = ""
    dtCentral_Exam_Date.datafield = ""
    txtCentral_Exam_ID.datafield = ""
    txtOrganization_ID.datafield = ""
    txtOrganization_Name.datafield = ""
    txtPatient_ID.datafield = ""
    txtPatient_Name.datafield = ""
    txtTreatment_Total.datafield = ""
    cmbPatient_Type.datafield = ""
    
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    dtExam_Date.datafield = "Exam_Date"
    dtCentral_Exam_Date.datafield = "Central_Exam_Date"
    txtCentral_Exam_ID.datafield = "Central_Exam_ID"
    txtOrganization_ID.datafield = "organization_ID"
    txtOrganization_Name.datafield = "Organization_Name"
    txtPatient_ID.datafield = "Patient_ID"
    txtPatient_Name.datafield = "Patient_Name"
    cmbExam_Total.datafield = "Exam_Total_ID"
    cmbPatient_Type.datafield = "Patient_Type_ID"
    
    cmdUnFix.visible = (rs!Fixed = 1)
    
    If master.rs.RecordCount <> 0 Then
        cmdPic_Teeth.visible = True
    End If
    
    
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Set_Controls_Enable_Status False
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim ask As VbMsgBoxResult
    If master.rs!With_Exam And ctrl = dtExpose_Date Then
        If dtExpose_Date.Value < master.rs!Exam_Date Then
            checkType = True
            msg = "·« Ì„ﬂ‰ ≈œŒ«·  «—ÌŒ ﬂ‘› √’€— „‰  «—ÌŒ «·›Õ’"
        End If
    End If
    If txtCurer_Doctor_ID.text = txtExaminer_Doctor_ID.text Then
        ask = MsgBox("«·ÿ»Ì» «·„⁄«·Ã ÂÊ ‰›”Â «·ÿ»Ì» «·›«Õ’ Â·  —Ìœ «·„ «»⁄…", vbYesNo, "√ÿ»«¡ «·√”‰«‰")
       If ask <> vbYes Then
           checkType = True
           'msg = "ÌÃ» «Œ Ì«— ÿ»Ì» „⁄«·Ã ¬Œ— Õ Ï Ì „ «·Õ›Ÿ"
           txtCurer_Doctor_ID.text = " "
           txtCurer_Doctor_ID_Validate False
          Exit Sub
        End If
    End If
    If Check1.visible And dtExpose_Date.Value And master.rs!Exam_Date Then
        Dim dif As Integer
        Dim cdmd As String
        Dim canc As Boolean
        Dim dayes As Integer
        cdmd = "SELECT isnull(dayes,0) d FROM Acc_ConstDiscountKashef where ID = (select MAX(ID) from Acc_ConstDiscountKashef)"
        dayes = Conversion.CInt(ExecuteSelect(Conn, cdmd, canc)!D)
        cdmd = "SET dateformat dmy SELECT isnull(datediff(dd,'" & master.rs!Exam_Date & "','" & dtExpose_Date.Value & "'),0) as diff"
        dif = Conversion.CInt(ExecuteSelect(Conn, cdmd, canc)!diff)
        If dif >= dayes Then
            ask = MsgBox("«·›—ﬁ »Ì‰  «—ÌŒ «·›Õ’ Ê «—ÌŒ «·ﬂ‘› ÂÊ " & dif & " ÌÊ„° «·≈Õ«·… ”Ê›  Œ÷⁄ ·‰”»… «·Õ”„ «·≈÷«›Ì", vbOKOnly, "√ÿ»«¡ «·√”‰«‰")
            If ask = vbOK Then
                Check1.Value = 1
            End If
        End If
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then Exit Sub
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtDiscount_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtCurer_Doctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        txtCurer_Doctor_ID_Validate False
        Exit Sub
    End If
    KeyAscii = Prevent_char(KeyAscii)
    
End Sub
Private Sub txtCurer_Doctor_ID_Validate(cancel As Boolean)
    Select_Curer_Doctor
    cancel = Not Curer_Doctor_checked
End Sub


