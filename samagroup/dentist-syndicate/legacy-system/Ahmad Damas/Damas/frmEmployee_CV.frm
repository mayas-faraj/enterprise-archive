VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmEmployee_CV 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… „ÊŸ›"
   ClientHeight    =   7290
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11790
   Icon            =   "frmEmployee_CV.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7290
   ScaleWidth      =   11790
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… „ÊŸ›"
      Height          =   7215
      Left            =   75
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Tag             =   "master"
      Top             =   0
      Width           =   11655
      Begin VB.ComboBox cmbGender 
         DataField       =   "Gender"
         Height          =   315
         ItemData        =   "frmEmployee_CV.frx":1CFA
         Left            =   2025
         List            =   "frmEmployee_CV.frx":1D04
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   65
         Tag             =   ";search=true;new=1;"
         Top             =   3600
         Width           =   1950
      End
      Begin VB.TextBox txtEmployee_Personal_No 
         Alignment       =   1  'Right Justify
         DataField       =   "Employee_Personal_No"
         Height          =   375
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   ";search=true;check=required;"
         Top             =   600
         Width           =   1935
      End
      Begin VB.TextBox txtCurrent_Job 
         Alignment       =   1  'Right Justify
         DataField       =   "Current_Job"
         Height          =   375
         Left            =   2040
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";search=true;check=required;"
         Top             =   3000
         Width           =   1935
      End
      Begin VB.TextBox txtBarCode 
         Alignment       =   1  'Right Justify
         DataField       =   "BarCode_No"
         Height          =   375
         Left            =   2040
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;check=required;check=custom;"
         Top             =   1200
         Width           =   1935
      End
      Begin VB.CheckBox chkIsDoctor 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "ÿ»Ì» ›«Õ’"
         DataField       =   "IsDoctor"
         Height          =   375
         Left            =   225
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";search=true;"
         Top             =   3660
         Width           =   1335
      End
      Begin VB.TextBox txtMain_Salary 
         Alignment       =   1  'Right Justify
         DataField       =   "Main_Salary"
         Height          =   375
         Left            =   7200
         MaxLength       =   9
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Tag             =   ";search=true;check=required;check=integer>0;"
         Top             =   6600
         Width           =   3135
      End
      Begin VB.TextBox txtCurrent_Salary 
         Alignment       =   1  'Right Justify
         DataField       =   "Current_Salary"
         Height          =   375
         Left            =   240
         MaxLength       =   9
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Tag             =   ";search=true;check=required;check=integer>0;"
         Top             =   6600
         Width           =   4815
      End
      Begin VB.TextBox txtEmail 
         Alignment       =   1  'Right Justify
         DataField       =   "Email"
         Height          =   375
         Left            =   7200
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Top             =   6000
         Width           =   3135
      End
      Begin VB.TextBox txtNotes 
         Alignment       =   1  'Right Justify
         DataField       =   "Notes"
         Height          =   375
         Left            =   240
         MaxLength       =   200
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   6000
         Width           =   4815
      End
      Begin VB.TextBox txtPrevious_Job 
         Alignment       =   1  'Right Justify
         DataField       =   "Previous_Job"
         Height          =   375
         Left            =   5040
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   5400
         Width           =   2055
      End
      Begin VB.TextBox txtResignation_Reason 
         Alignment       =   1  'Right Justify
         DataField       =   "Resignation_Reason"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   5400
         Width           =   3615
      End
      Begin VB.TextBox txtChildren 
         Alignment       =   1  'Right Justify
         DataField       =   "Children"
         Height          =   375
         Left            =   8400
         MaxLength       =   2
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   5400
         Width           =   1935
      End
      Begin VB.ComboBox cmbMarital_Status 
         Height          =   315
         Left            =   2040
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Tag             =   ";check=required;"
         Top             =   4800
         Width           =   1815
      End
      Begin VB.TextBox txtEmergency_Phone 
         Alignment       =   1  'Right Justify
         DataField       =   "Emergency_Phone"
         Height          =   375
         Left            =   5040
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   4800
         Width           =   2055
      End
      Begin VB.TextBox txtMobile 
         Alignment       =   1  'Right Justify
         DataField       =   "Mobile"
         Height          =   375
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   4800
         Width           =   1935
      End
      Begin VB.TextBox txtHouse_Address 
         Alignment       =   1  'Right Justify
         DataField       =   "House_Address"
         Height          =   375
         Left            =   2250
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   4140
         Width           =   4875
      End
      Begin VB.TextBox txtHouse_Phone 
         Alignment       =   1  'Right Justify
         DataField       =   "House_Phone"
         Height          =   375
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   4200
         Width           =   1935
      End
      Begin VB.TextBox txtGraduation_Year 
         Alignment       =   1  'Right Justify
         DataField       =   "Graduation_Year"
         Height          =   375
         Left            =   5520
         MaxLength       =   4
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";check=custom;"
         Top             =   3000
         Width           =   1575
      End
      Begin VB.TextBox txtSpecial_Qualifications 
         Alignment       =   1  'Right Justify
         DataField       =   "Special_Qualifications"
         Height          =   375
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   3600
         Width           =   4815
      End
      Begin VB.TextBox txtEducation_Level 
         Alignment       =   1  'Right Justify
         DataField       =   "Education_Level"
         Height          =   375
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   3000
         Width           =   1935
      End
      Begin VB.ComboBox cmbHezb_ID 
         Height          =   315
         Left            =   2040
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Tag             =   ";check=required;"
         Top             =   2400
         Width           =   1935
      End
      Begin VB.ComboBox cmbNationality_ID 
         DataField       =   "nationality_ID"
         Height          =   315
         Left            =   5520
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Tag             =   ";check=required;"
         Top             =   2400
         Width           =   1575
      End
      Begin VB.TextBox txtBirth_Place 
         Alignment       =   1  'Right Justify
         DataField       =   "Birth_Place"
         Height          =   375
         Left            =   2040
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";search=true;check=required;check=custom;"
         Top             =   1800
         Width           =   1935
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00D9FEFF&
         Height          =   2055
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   39
         Top             =   720
         Width           =   1815
         Begin VB.Image ImgPicture 
            Height          =   1695
            Left            =   120
            Stretch         =   -1  'True
            Top             =   240
            Width           =   1575
         End
      End
      Begin VB.CommandButton CPicAdd 
         BackColor       =   &H00E0E0E0&
         Caption         =   "≈÷«›… «·’Ê—… «·‘Œ’Ì…"
         Height          =   300
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   38
         Top             =   2805
         Width           =   1815
      End
      Begin VB.TextBox txtKaid_Place 
         Alignment       =   1  'Right Justify
         DataField       =   "Kaid_Place"
         Height          =   375
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;check=custom;check=required;"
         Top             =   1800
         Width           =   1575
      End
      Begin VB.TextBox txtIdentification_Card_No 
         Alignment       =   1  'Right Justify
         DataField       =   "Identification_Card_No"
         Height          =   375
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;check=required;"
         Top             =   1800
         Width           =   1935
      End
      Begin VB.TextBox txtMother_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Mother_Name"
         Height          =   375
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;check=required;"
         Top             =   1200
         Width           =   1935
      End
      Begin VB.TextBox txtFather_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Father_Name"
         Height          =   375
         Left            =   8400
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;check=required;"
         Top             =   1200
         Width           =   1935
      End
      Begin VB.TextBox txtLast_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Last_Name"
         Height          =   375
         Left            =   2040
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;check=required;"
         Top             =   600
         Width           =   1935
      End
      Begin VB.TextBox txtFirst_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "First_Name"
         Height          =   375
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Tag             =   ";search=true;check=required;"
         Top             =   600
         Width           =   1935
      End
      Begin MSComCtl2.DTPicker dtBirthday 
         DataField       =   "Birthday"
         Height          =   375
         Left            =   8400
         TabIndex        =   10
         Tag             =   ";check=date;search=true;"
         Top             =   2400
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
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
         TabIndex        =   2
         Top             =   240
         Width           =   11415
      End
      Begin MSComCtl2.DTPicker dtHiredate 
         DataField       =   "hiredate"
         Height          =   375
         Left            =   180
         TabIndex        =   62
         Tag             =   ";check=date;search=true;"
         Top             =   4140
         Width           =   1260
         _ExtentX        =   2223
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   38244
      End
      Begin VB.Label Label31 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· ÊŸÌ›"
         Height          =   195
         Left            =   1545
         RightToLeft     =   -1  'True
         TabIndex        =   64
         Tag             =   ";search=true;"
         Top             =   4365
         Width           =   540
      End
      Begin VB.Label Label30 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ"
         Height          =   195
         Left            =   1620
         RightToLeft     =   -1  'True
         TabIndex        =   63
         Tag             =   ";search=true;"
         Top             =   4140
         Width           =   390
      End
      Begin VB.Label Label29 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„‰’» «·ÊŸÌ›Ì"
         Height          =   195
         Left            =   4050
         RightToLeft     =   -1  'True
         TabIndex        =   61
         Tag             =   ";search=true;"
         Top             =   3090
         Width           =   1110
      End
      Begin VB.Label Label28 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—„“ »ÿ«ﬁ… «·»«—ﬂÊœ"
         Height          =   195
         Left            =   4095
         RightToLeft     =   -1  'True
         TabIndex        =   60
         Tag             =   ";search=true;"
         Top             =   1320
         Width           =   1260
      End
      Begin VB.Label Label27 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Ã‰”"
         Height          =   195
         Left            =   4410
         RightToLeft     =   -1  'True
         TabIndex        =   59
         Top             =   3720
         Width           =   390
      End
      Begin VB.Label Label26 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—« » «·√”«”Ì"
         Height          =   195
         Left            =   10425
         RightToLeft     =   -1  'True
         TabIndex        =   58
         Tag             =   ";search=true;"
         Top             =   6720
         Width           =   1050
      End
      Begin VB.Label Label25 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—« » «·Õ«·Ì"
         Height          =   195
         Left            =   5617
         RightToLeft     =   -1  'True
         TabIndex        =   57
         Tag             =   ";search=true;"
         Top             =   6720
         Width           =   900
      End
      Begin VB.Label Label24 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·»—Ìœ «·«·ﬂ —Ê‰Ì"
         Height          =   195
         Left            =   10365
         RightToLeft     =   -1  'True
         TabIndex        =   56
         Top             =   6120
         Width           =   1170
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„·«ÕŸ« "
         Height          =   195
         Left            =   5542
         RightToLeft     =   -1  'True
         TabIndex        =   55
         Top             =   6120
         Width           =   1050
      End
      Begin VB.Label Label23 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·⁄„· «·”«»ﬁ"
         Height          =   195
         Left            =   7185
         RightToLeft     =   -1  'True
         TabIndex        =   54
         Top             =   5520
         Width           =   1050
      End
      Begin VB.Label Label22 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "”»»  —ﬂ «·⁄„·"
         Height          =   195
         Left            =   3840
         RightToLeft     =   -1  'True
         TabIndex        =   53
         Top             =   5520
         Width           =   1140
      End
      Begin VB.Label Label21 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·√Ê·«œ"
         Height          =   195
         Left            =   10560
         RightToLeft     =   -1  'True
         TabIndex        =   52
         Top             =   5490
         Width           =   690
      End
      Begin VB.Label Label20 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Õ«·… «·⁄«∆·Ì…"
         Height          =   195
         Left            =   3945
         RightToLeft     =   -1  'True
         TabIndex        =   51
         Top             =   4890
         Width           =   1050
      End
      Begin VB.Label Label19 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Â« › «·ÿÊ«—∆"
         Height          =   195
         Left            =   7320
         RightToLeft     =   -1  'True
         TabIndex        =   50
         Top             =   4920
         Width           =   960
      End
      Begin VB.Label Label18 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÃÊ«·"
         Height          =   195
         Left            =   10425
         RightToLeft     =   -1  'True
         TabIndex        =   49
         Top             =   4890
         Width           =   1050
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄‰Ê«‰ «·„‰“·"
         Height          =   195
         Left            =   7320
         RightToLeft     =   -1  'True
         TabIndex        =   48
         Top             =   4290
         Width           =   870
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Â« › «·„‰“·"
         Height          =   195
         Left            =   10425
         RightToLeft     =   -1  'True
         TabIndex        =   47
         Top             =   4290
         Width           =   1050
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "”‰… «· Œ—Ã"
         Height          =   195
         Left            =   7440
         RightToLeft     =   -1  'True
         TabIndex        =   46
         Top             =   3090
         Width           =   930
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„ƒÂ·«  Œ«’…"
         Height          =   195
         Left            =   10425
         RightToLeft     =   -1  'True
         TabIndex        =   45
         Top             =   3720
         Width           =   1050
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„ƒÂ· «·⁄·„Ì"
         Height          =   195
         Left            =   10425
         RightToLeft     =   -1  'True
         TabIndex        =   44
         Top             =   3090
         Width           =   1050
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·’›… «·Õ“»Ì…"
         Height          =   195
         Left            =   4065
         RightToLeft     =   -1  'True
         TabIndex        =   43
         Top             =   2460
         Width           =   1050
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Ã‰”Ì…"
         Height          =   195
         Left            =   7440
         RightToLeft     =   -1  'True
         TabIndex        =   42
         Top             =   2520
         Width           =   810
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·Ê·«œ…"
         Height          =   195
         Left            =   10320
         RightToLeft     =   -1  'True
         TabIndex        =   41
         Tag             =   ";search=true;"
         Top             =   2520
         Width           =   1050
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„ﬂ«‰ «·Ê·«œ…"
         Height          =   195
         Left            =   4200
         RightToLeft     =   -1  'True
         TabIndex        =   40
         Tag             =   ";search=true;"
         Top             =   1920
         Width           =   1050
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„Õ· Ê —ﬁ„ «·ﬁÌœ"
         Height          =   195
         Left            =   7200
         RightToLeft     =   -1  'True
         TabIndex        =   37
         Tag             =   ";search=true;"
         Top             =   1920
         Width           =   1050
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÂÊÌ…"
         Height          =   195
         Left            =   10680
         RightToLeft     =   -1  'True
         TabIndex        =   36
         Tag             =   ";search=true;"
         Top             =   1920
         Width           =   690
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√„"
         Height          =   195
         Left            =   7545
         RightToLeft     =   -1  'True
         TabIndex        =   35
         Tag             =   ";search=true;"
         Top             =   1290
         Width           =   810
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√»"
         Height          =   195
         Left            =   10440
         RightToLeft     =   -1  'True
         TabIndex        =   34
         Tag             =   ";search=true;"
         Top             =   1290
         Width           =   1050
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ﬂ‰Ì…"
         Height          =   195
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   33
         Tag             =   ";search=true;"
         Top             =   720
         Width           =   390
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„"
         Height          =   195
         Left            =   7755
         RightToLeft     =   -1  'True
         TabIndex        =   32
         Tag             =   ";search=true;"
         Top             =   690
         Width           =   390
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·–« Ì"
         Height          =   195
         Left            =   10425
         RightToLeft     =   -1  'True
         TabIndex        =   31
         Tag             =   ";search=true;"
         Top             =   690
         Width           =   1050
      End
   End
End
Attribute VB_Name = "frmEmployee_CV"
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
Dim rsPictures As New ADODB.Recordset
Public Sub GetScan()
On Error GoTo NoScan
Dim ImgX As ImgX
Set ImgX = New ImgX
ImgX.Initialize
Const DemoPackedDIB As Boolean = False
Dim pDIB As Long
'Screen.MousePointer = vbHourglass
pDIB = TWAIN_AcquireNative(Me.hwnd, 0)
If pDIB = 0 Then
    MsgBox "No image aquired."
    'Screen.MousePointer = vbDefault
    Exit Sub
End If
pDIB = GlobalLock(pDIB)
If DemoPackedDIB Then
        ImgX.Import.FromPackedDIB pDIB, "TWAIN Aquire"
    Else
        Dim BIH As BitmapInfoHeader             'Declare imgx BitmapInfHeader Structure (40 Bytes)
        CopyMemoryPtrToBIH BIH, pDIB, Len(BIH)  'Copy it from the beginning of the DIB buffer
        ImgX.Import.FromDIB pDIB + Len(BIH), pDIB, 0, "TWAIN Aquire"
End If
TWAIN_FreeNative pDIB
ImgPicture.Picture = ImgX.Export.ToPicture
SavePicture ImgPicture.Picture, "c:\1.bmp"
ggAddPic = 2
Save_Picture
Exit Sub
NoScan:
MsgBox " √ﬂœ „‰  ‘€Ì· «·”ﬂ«‰— Ê„‰  Ê’Ì· «·ﬂ»·", vbCritical + vbOKOnly + vbMsgBoxRight, " Õ–Ì—"
Exit Sub
NoPic:
MsgBox "Â‰«ﬂ Œÿ√ ›Ì  ”ÃÌ· «·’Ê—…", vbCritical + vbOKOnly + vbMsgBoxRight, " Õ–Ì—"
End Sub

Public Sub Save_Picture()
Dim rsSavepicture As New ADODB.Recordset
Dim pic As String
Dim SF As Integer
Dim Lingth As Long
Dim ByteData() As Byte
Dim L As Long
Dim i
Dim Num As Integer

If ggAddPic = 1 Then
        frmImportPicture.cmnDialog.Filter = " ’Ê—… (*.JPG) |*.JPG|" + " ’Ê—… (*.BMP) |*.BMP|"
        frmImportPicture.cmnDialog.ShowOpen
       ' On Error GoTo Openerror
       Load_Picture
        ImgPicture.Picture = LoadPicture(frmImportPicture.cmnDialog.FileName)
        With rsSavepicture
            .LockType = adLockOptimistic
            .CursorType = adOpenKeyset
            .ActiveConnection = Conn
            .MaxRecords = 1
            If rsPictures.RecordCount = 0 Then
                .Open "Employees_Pictures"
                .addNew
                .Fields("Employee_ID").Value = master.rs.Fields("Employee_ID").Value
            Else
                .Open "select * from Employees_Pictures where Employee_ID = " & val(master.rs.Fields("Employee_ID"))
            End If
            
        End With

        If frmImportPicture.cmnDialog.FileName <> "" Then
            pic = frmImportPicture.cmnDialog.FileName
            SF = FreeFile
            Open pic For Binary Access Read As SF
            Lingth = LOF(SF)
            Num = Lingth / 100000
            L = Lingth Mod 100000
            ReDim ByteData(L)
            Get SF, , ByteData()
            rsSavepicture.Fields(2).AppendChunk ByteData()
            ReDim ByteData(100000)
            For i = 1 To Num
                Get SF, , ByteData()
                rsSavepicture.Fields(2).AppendChunk ByteData()
            Next i
        End If
    ElseIf ggAddPic = 2 Then
        
        With rsSavepicture
            .LockType = adLockOptimistic
            .CursorType = adOpenKeyset
            .ActiveConnection = Conn
            .MaxRecords = 1
            If rsPictures.RecordCount = 0 Then
                .Open "Employees_Pictures"
                .addNew
                .Fields("Employee_ID").Value = master.rs.Fields("Employee_ID").Value
            Else
                .Open "select * from Employees_Pictures where Employee_ID = " & val(master.rs.Fields("Employee_ID"))
            End If
            
        End With
        
        pic = "c:\1.bmp"
        SF = FreeFile
        Open pic For Binary Access Read As SF
        Lingth = LOF(SF)
        Num = Lingth / 100000
        L = Lingth Mod 100000
        ReDim ByteData(L)
        Get SF, , ByteData()
        rsSavepicture.Fields(2).AppendChunk ByteData()
        ReDim ByteData(100000)
        For i = 1 To Num
            Get SF, , ByteData()
            rsSavepicture.Fields(2).AppendChunk ByteData()
        Next i
        Close
        ImgPicture.Picture = LoadPicture("C:\1.bmp")
        Kill "c:\1.bmp"
End If
rsSavepicture.Update
rsSavepicture.Close
Set rsSavepicture = Nothing
Exit Sub
Openerror:
MsgBox "«·’Ê—… «· Ì  „ «Œ Ì«—Â« €Ì— ’«·Õ…", vbCritical + vbOKOnly + vbMsgBoxRight, " Õ–Ì—"
    rsSavepicture.CancelUpdate
    rsSavepicture.Close
    Set rsSavepicture = Nothing
End Sub
Sub Load_Picture()
    Dim cancel As Boolean
    ImgPicture.Picture = LoadPicture("")
    Set rsPictures = ExecuteSelect(Conn, "select Employee_Picture from employees_Pictures where Employee_ID = " & master.rs!Employee_ID, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰«  ° «·—Ã«¡ «·„Õ«Ê·… ·«Õﬁ«", vbCritical + vbOKOnly, "Œÿ√ €Ì— „ Êﬁ⁄"
        Exit Sub
    End If
    If rsPictures.RecordCount = 0 Or IsNull(rsPictures!Employee_Picture) Then Exit Sub
    ImgPicture.datafield = "Employee_Picture"
    Set ImgPicture.DataSource = rsPictures
End Sub
Sub InitFrame()
    'Hezb
    fillCmb cmbHezb_ID, "select Hezb_ID as ID,Hezb_Name  as Name from FixHezb"
    'Nationality
    fillCmb cmbNationality_ID, "select Nationality_ID as ID,Nationality  as Name from FixNationality"
    'Marital Status
    With cmbMarital_Status
        .AddItem "⁄«“»", 0
        .ItemData(0) = 0
        .AddItem "„ “ÊÃ", 1
        .ItemData(1) = 1
        .AddItem "„ÿ·ﬁ", 2
        .ItemData(2) = 2
        .AddItem "√—„·", 3
        .ItemData(2) = 3
        .AddItem "€Ì— „ Ê›—", 4
        .ItemData(3) = 4
        .ListIndex = 0
    End With
    
End Sub

Private Sub cmbMarital_Status_Click()
    Dim Previous_Children As String
    Previous_Children = txtChildren.text
    If cmbMarital_Status.ListIndex = 0 Then
       txtChildren.text = ""
       txtChildren.Enabled = False
    Else
       txtChildren.text = Previous_Children
       txtChildren.Enabled = True
    End If
End Sub

Private Sub CPicAdd_Click()
    If master.rs.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈÷«›… ’Ê—… ·„ÊŸ› ﬁ»· „·∆ Ã„Ì⁄ »Ì«‰« Â ÊÕ›ŸÂ«", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    If master.rs.RecordCount = 1 Then Load_Picture
    frmImportPicture.Caller_Form = "EMPLOYEE_CV"
    If rsPictures.RecordCount = 0 Then
        frmImportPicture.cmdImageEditor.Enabled = False
    End If
    frmImportPicture.Show 1
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
    oldScaleWidth = 11895
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    'Set master.ButtonsForm = MDIMain
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from Employee_CV", cancel)
    InitFrame
    Set ActiveFrame = masterFrame

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

Private Sub master_doAddNew(rs As ADODB.Recordset)
    ImgPicture.Picture = LoadPicture("")
    cmbHezb_ID.ListIndex = 0
    cmbNationality_ID.ListIndex = 0
    cmbMarital_Status.ListIndex = 0
    '<Ashraf>
    master.state = ST_ADDNEW
    '</Ashraf>
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
'    On Error GoTo ErrHandler
'    rs.Delete
'    Cancel = False
'    Exit Sub
'ErrHandler:
'    MsgBox "·« Ì„ﬂ‰ Õ–› Â–« «·„”Ã· Õ«·Ì«° «·—Ã«¡ «·„Õ«Ê·… ⁄‰œ„«  œŒ· ≈·Ï Â–Â «·Ê«ÃÂ… „—… √Œ—Ï"
'    Cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    cmbHezb_ID.ListIndex = GetListIndex(cmbHezb_ID, rs.Fields("Hezb_Id").Value)
    Load_Picture
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!IsDoctor = chkIsDoctor.Value
    rs!Nationality_ID = cmbNationality_ID.ItemData(cmbNationality_ID.ListIndex)
    rs!Hezb_ID = cmbHezb_ID.ItemData(cmbHezb_ID.ListIndex)
    rs!Marital_Status = cmbMarital_Status.ItemData(cmbMarital_Status.ListIndex)
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
'    If master.State = ST_ADDNEW Or master.State = ST_UPDATE Then
        Select Case ctrl
        Case txtEmployee_Personal_No
            If IsUniqValue("select Employee_Personal_No from Employee_CV where Employee_Personal_NO= " & _
                                val(txtEmployee_Personal_No.text)) = 0 Then
                msg = "Â–Â «·ﬁÌ„… „ÊÃÊœ… ›Ì ﬁ«⁄œ… «·»Ì«‰«  ° «·—Ã«¡  €ÌÌ—Â«"
                'Cancel the event
                checkType = True
            End If
        Case txtGraduation_Year
            If Len(txtGraduation_Year.text) < 4 And Len(txtGraduation_Year.text) > 0 Then
                msg = "Ì—ÃÏ «· √ﬂœ „‰ ≈œŒ«· ”‰… «· Œ—Ã »‘ﬂ· ’ÕÌÕ"
                checkType = True
            End If
        Case txtBirth_Place, txtKaid_Place, txtFirst_Name, txtFather_Name, txtMother_Name
            If IsNumeric(ctrl.text) Then
                msg = "·ﬁœ √œŒ·  ﬁÌ„… Œ«ÿ∆… ›Ì Â–« «·Õﬁ· ° Ì—ÃÏ «· √ﬂœ „‰Â«"
                checkType = True
            End If
        Case txtBarCode
            
            If master.state = ST_ADDNEW Or master.state = ST_UPDATE Then
    
            Dim sql As String
            Dim cancel As Boolean
            Dim rsCheck As New ADODB.Recordset
            
            sql = " select count(*) from Employee_CV where BarCode_No = '" & Trim(txtBarCode.text) & "'"
            
            If master.state = ST_UPDATE Then
                    sql = sql + " and Employee_ID <> " & master.rs!Employee_ID
            End If
            
            Set rsCheck = ExecuteSelect(Conn, sql, cancel)
            If cancel Then
                MsgBox "ÕœÀ Œÿ√"
            End If
            If rsCheck.Fields(0).Value > 0 Then
                checkType = True
                msg = "—„“ «·»«—ﬂÊœ «·„œŒ· „ÊÃÊœ „”»ﬁ«"
            End If
    End If
        End Select
 '   End If
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtChildren_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtCurrent_Salary_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtEmergency_Phone_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtEmployee_Personal_No_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtGraduation_Year_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtHouse_Phone_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtIdentification_Card_No_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtMain_Salary_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtMobile_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
