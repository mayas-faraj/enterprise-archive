VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmDoctorCV 
   BackColor       =   &H00E1FEFF&
   Caption         =   "–« Ì… «·ÿ»Ì»"
   ClientHeight    =   9705
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11205
   Icon            =   "frmDoctorCV.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   9705
   ScaleWidth      =   11205
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "–« Ì… «·ÿ»Ì»"
      Height          =   9600
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   50
      Tag             =   "master"
      Top             =   0
      Width           =   10950
      Begin VB.CommandButton Command1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "‰ﬁ«ÿ «·√‰‘ÿ… «·⁄·„Ì…"
         Height          =   495
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   137
         Top             =   8280
         Width           =   1515
      End
      Begin VB.CheckBox chkIsInTameen 
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‘ —ﬂ »«· √„Ì‰"
         DataField       =   "IsInTameen"
         ForeColor       =   &H00404040&
         Height          =   195
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   134
         Tag             =   ";search=true;"
         Top             =   5880
         Width           =   1455
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         DataField       =   "Notes_Adding"
         ForeColor       =   &H00004080&
         Height          =   495
         Left            =   4680
         MaxLength       =   500
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   46
         Tag             =   ";search=true;"
         Top             =   8760
         Width           =   4740
      End
      Begin VB.CheckBox chAddInElectList 
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈÷«›… ≈·Ï «·ﬁ«∆„… «·⁄‘Ê«∆Ì…"
         DataField       =   "IsInElectList"
         ForeColor       =   &H00404040&
         Height          =   375
         Left            =   2640
         RightToLeft     =   -1  'True
         TabIndex        =   130
         Top             =   8880
         Width           =   1935
      End
      Begin VB.CommandButton cmdElectList 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·ﬁ«∆„… «·⁄‘Ê«∆Ì…"
         Height          =   495
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   119
         Top             =   8880
         Width           =   1515
      End
      Begin VB.TextBox txtEnglishName 
         Alignment       =   2  'Center
         DataField       =   "FullNameEnglish"
         Height          =   375
         Left            =   6960
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   44
         Tag             =   ";search=true;"
         Top             =   8280
         Width           =   2475
      End
      Begin VB.TextBox txtBankAccountNo 
         Alignment       =   2  'Center
         DataField       =   "BankAccountNo"
         Height          =   375
         Left            =   2640
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   45
         Tag             =   ";search=true;"
         Top             =   8280
         Width           =   1995
      End
      Begin VB.TextBox txtMilitary 
         Alignment       =   1  'Right Justify
         DataField       =   "Military_Section"
         Height          =   375
         Left            =   4200
         RightToLeft     =   -1  'True
         TabIndex        =   127
         Tag             =   ";search=true;"
         Top             =   2760
         Width           =   1335
      End
      Begin VB.CommandButton CPicAdd 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·’Ê—… «·‘Œ’Ì…"
         Height          =   420
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   110
         Top             =   2520
         Width           =   1515
      End
      Begin VB.ComboBox cmbCollaborative_Position 
         BackColor       =   &H80000000&
         DataField       =   "Collaborative_Council_Position"
         Enabled         =   0   'False
         ForeColor       =   &H00404040&
         Height          =   315
         ItemData        =   "frmDoctorCV.frx":1CFA
         Left            =   6975
         List            =   "frmDoctorCV.frx":1CFC
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   124
         Tag             =   ";search=true;"
         Top             =   5835
         Width           =   1515
      End
      Begin VB.CheckBox chkIsCollaborative_Council_Member 
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄÷Ê ›Ì „Ã·” «·‰Ÿ«„ «· ⁄«Ê‰Ì"
         DataField       =   "isCollaborative_Council_Member"
         ForeColor       =   &H00404040&
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   123
         Top             =   5805
         Width           =   1455
      End
      Begin VB.TextBox txtGoto 
         Alignment       =   2  'Center
         ForeColor       =   &H00808000&
         Height          =   495
         Left            =   900
         MaxLength       =   25
         RightToLeft     =   -1  'True
         TabIndex        =   122
         Top             =   7545
         Width           =   735
      End
      Begin VB.CommandButton cmdGoto 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·–Â«» ≈·Ï —ﬁ„ –« Ì"
         Height          =   615
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   118
         Top             =   7545
         Width           =   765
      End
      Begin VB.CommandButton CNewPay 
         BackColor       =   &H00E0E0E0&
         Caption         =   " ”œÌœ «·—”Ê„"
         Height          =   495
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   112
         Top             =   4320
         Width           =   1515
      End
      Begin VB.CommandButton CTmpTer 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«· —«ŒÌ’ «·„ƒﬁ …"
         Height          =   495
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   113
         Top             =   4995
         Width           =   1515
      End
      Begin VB.CommandButton CMove 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«· ‰ﬁ·« "
         Height          =   495
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   114
         Top             =   5625
         Width           =   1515
      End
      Begin VB.CommandButton CStop 
         BackColor       =   &H00E0E0E0&
         Caption         =   " —ﬁÌ‰ «·ﬁÌœ Ê≈⁄«œ… «· ”ÃÌ·"
         Height          =   495
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   115
         Top             =   6255
         Width           =   1515
      End
      Begin VB.CommandButton CWath 
         BackColor       =   &H00E0E0E0&
         Caption         =   "ÊÀ«∆ﬁ „‰Ê⁄…"
         Height          =   495
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   116
         Top             =   6900
         Width           =   1515
      End
      Begin VB.CommandButton cmdCollaborative 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·‰Ÿ«„ «· ⁄«Ê‰Ì"
         Height          =   495
         Left            =   105
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   111
         Top             =   3720
         Width           =   1515
      End
      Begin VB.TextBox txtFrom 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   8400
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   106
         Top             =   6420
         Width           =   1635
      End
      Begin VB.TextBox txtTo 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   6240
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   104
         Top             =   6420
         Width           =   1635
      End
      Begin VB.TextBox dtPayingDate 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         DataField       =   "Paying_Date"
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   6240
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   32
         Top             =   7110
         Width           =   1875
      End
      Begin VB.TextBox dtResumeRegistrationDate 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         DataField       =   "Resume_Registration_Date"
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   1800
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   43
         Tag             =   ";search=true;"
         Top             =   7110
         Width           =   1695
      End
      Begin VB.TextBox TNumRet1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         DataField       =   "Resume_Registration_No"
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   4200
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   42
         Tag             =   ";search=true;"
         Top             =   7110
         Width           =   1300
      End
      Begin VB.TextBox TNum 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         Height          =   375
         Left            =   8520
         MaxLength       =   9
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   ";search=true;check=required;check=integer>0;"
         Top             =   480
         Width           =   1400
      End
      Begin VB.TextBox TName 
         Alignment       =   2  'Center
         DataField       =   "First_Name"
         Height          =   375
         Left            =   6480
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Tag             =   ";search=true;check=required;"
         Top             =   480
         Width           =   1400
      End
      Begin VB.TextBox TLName 
         Alignment       =   2  'Center
         DataField       =   "Last_Name"
         Height          =   375
         Left            =   4180
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";search=true;check=required;"
         Top             =   480
         Width           =   1300
      End
      Begin VB.ComboBox CGender 
         DataField       =   "Gender"
         ForeColor       =   &H80000012&
         Height          =   315
         Left            =   1800
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Tag             =   ";search=true;check=required;"
         Top             =   510
         Width           =   1695
      End
      Begin VB.TextBox TFName 
         Alignment       =   2  'Center
         DataField       =   "Father_Name"
         Height          =   375
         Left            =   8520
         MaxLength       =   30
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;check=required;"
         Top             =   900
         Width           =   1400
      End
      Begin VB.TextBox TMName 
         Alignment       =   2  'Center
         DataField       =   "Mother_Name"
         Height          =   375
         Left            =   6480
         MaxLength       =   60
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;check=required;"
         Top             =   900
         Width           =   1400
      End
      Begin VB.TextBox TBirthPlace 
         Alignment       =   2  'Center
         DataField       =   "Birth_Place"
         Height          =   375
         Left            =   4180
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;check=required;"
         Top             =   900
         Width           =   1300
      End
      Begin MSComCtl2.DTPicker dtBirthDate 
         DataField       =   "BirthDay"
         Height          =   375
         Left            =   1800
         TabIndex        =   7
         Tag             =   ";search=true;check=required;new=1/1/2004;"
         Top             =   900
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CalendarTitleForeColor=   16777215
         CalendarTrailingForeColor=   -2147483638
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   38250
      End
      Begin VB.TextBox TKaid 
         Alignment       =   2  'Center
         DataField       =   "Kaid_Place"
         Height          =   375
         Left            =   8520
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;check=required;"
         Top             =   1320
         Width           =   1400
      End
      Begin VB.ComboBox CNationality 
         DataField       =   "Nationality_ID"
         ForeColor       =   &H80000012&
         Height          =   315
         Left            =   6480
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Tag             =   ";search=true;check=required;"
         Top             =   1350
         Width           =   1400
      End
      Begin VB.TextBox TNumH 
         Alignment       =   2  'Center
         DataField       =   "Identification_Card_No"
         Height          =   375
         Left            =   4180
         MaxLength       =   25
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";search=true;check=required;"
         Top             =   1320
         Width           =   1300
      End
      Begin MSComCtl2.DTPicker dtIdentificationCardDate 
         DataField       =   "Identification_Card_Date"
         Height          =   375
         Left            =   1800
         TabIndex        =   11
         Tag             =   ";search=true;check=required;new=1/1/2004;"
         Top             =   1320
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   38250
      End
      Begin VB.TextBox THomeLoc 
         Alignment       =   2  'Center
         DataField       =   "House_Adress"
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   6480
         MaxLength       =   100
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         Tag             =   ";search=true;"
         Top             =   1860
         Width           =   3420
      End
      Begin VB.TextBox THomeTel 
         Alignment       =   2  'Center
         DataField       =   "House_Phone"
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   4180
         MaxLength       =   100
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";search=true;"
         Top             =   1860
         Width           =   1300
      End
      Begin VB.TextBox TMob 
         Alignment       =   2  'Center
         DataField       =   "Cell_Phone"
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   1800
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";search=true;"
         Top             =   1860
         Width           =   1695
      End
      Begin VB.TextBox TworkLoc 
         Alignment       =   2  'Center
         DataField       =   "Clinic_Adress"
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   6480
         MaxLength       =   100
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Tag             =   ";check=required;search=true;"
         Top             =   2280
         Width           =   3420
      End
      Begin VB.TextBox TWorkTel 
         Alignment       =   2  'Center
         DataField       =   "Clinic_Phone"
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   4180
         MaxLength       =   20
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";search=true;"
         Top             =   2280
         Width           =   1300
      End
      Begin VB.ComboBox CHezb 
         DataField       =   "Hezb_ID"
         ForeColor       =   &H00004080&
         Height          =   315
         Left            =   1800
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Tag             =   ";search=true;check=required;"
         Top             =   2280
         Width           =   1695
      End
      Begin VB.CommandButton CZoneHelp 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   6495
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   2700
         Visible         =   0   'False
         Width           =   325
      End
      Begin VB.CommandButton CDevisionHelp 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   8535
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   2700
         Width           =   325
      End
      Begin VB.TextBox TEmail 
         Alignment       =   2  'Center
         DataField       =   "Email"
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   1800
         MaxLength       =   60
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   ";search=true;"
         Top             =   2700
         Width           =   1545
      End
      Begin VB.TextBox TNumSer 
         Alignment       =   2  'Center
         DataField       =   "Certification_No"
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   8520
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Tag             =   ";search=true;check=required;"
         Top             =   3390
         Width           =   1400
      End
      Begin MSComCtl2.DTPicker dtCertificationDate 
         DataField       =   "Certification_Date"
         Height          =   375
         Left            =   6240
         TabIndex        =   24
         Tag             =   ";search=true;check=required;new=1/1/2004;"
         Top             =   3390
         Width           =   1515
         _ExtentX        =   2672
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   40139
      End
      Begin VB.ComboBox CCertificationLevel 
         DataField       =   "Certification_Level_ID"
         ForeColor       =   &H00000080&
         Height          =   315
         Left            =   8520
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   25
         Tag             =   ";search=true;check=required;"
         Top             =   3825
         Width           =   1400
      End
      Begin VB.ComboBox CField 
         DataField       =   "Certification_Field_ID"
         ForeColor       =   &H00000080&
         Height          =   315
         Left            =   6240
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   26
         Tag             =   ";search=true;check=required;"
         Top             =   3825
         Width           =   1515
      End
      Begin VB.CommandButton CColegeHelp 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   8525
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   4245
         Width           =   325
      End
      Begin VB.TextBox TCity 
         Alignment       =   2  'Center
         Enabled         =   0   'False
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   6240
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   47
         Tag             =   ";search=true;"
         Top             =   4245
         Width           =   1515
      End
      Begin VB.TextBox TCountry 
         Alignment       =   2  'Center
         Enabled         =   0   'False
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   8520
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   48
         Tag             =   ";search=true;"
         Top             =   4680
         Width           =   1400
      End
      Begin VB.TextBox TYearOut 
         Alignment       =   2  'Center
         DataField       =   "Graduation_Year"
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   6240
         MaxLength       =   4
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Tag             =   ";check=integer>0;search=true;check=required;"
         Top             =   4680
         Width           =   1515
      End
      Begin VB.CheckBox CPosCh 
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄÷Ê ›Ì «·„Ã·”"
         DataField       =   "IsCouncil_Member"
         ForeColor       =   &H00404040&
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Top             =   5295
         Width           =   1455
      End
      Begin VB.ComboBox CPos 
         BackColor       =   &H80000000&
         DataField       =   "Council_Position"
         Enabled         =   0   'False
         ForeColor       =   &H00404040&
         Height          =   315
         ItemData        =   "frmDoctorCV.frx":1CFE
         Left            =   6960
         List            =   "frmDoctorCV.frx":1D00
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   30
         Tag             =   ";search=true;"
         Top             =   5325
         Width           =   1515
      End
      Begin VB.ComboBox CCurrentStatus 
         DataField       =   "Current_Status_ID"
         ForeColor       =   &H00404040&
         Height          =   315
         Left            =   4200
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   33
         Tag             =   ";search=true;check=required;"
         Top             =   5325
         Width           =   1275
      End
      Begin VB.TextBox TNumIn 
         Alignment       =   2  'Center
         DataField       =   "Cyndicate_Registration_No"
         ForeColor       =   &H00008000&
         Height          =   375
         Left            =   4180
         MaxLength       =   25
         RightToLeft     =   -1  'True
         TabIndex        =   34
         Tag             =   ";search=true;check=required;"
         Top             =   3390
         Width           =   1300
      End
      Begin MSComCtl2.DTPicker dtCyndicateRegistrationDate 
         DataField       =   "Cyndicate_Registration_Date"
         Height          =   375
         Left            =   1800
         TabIndex        =   35
         Tag             =   ";search=true;check=required;new=1/1/2004;"
         Top             =   3390
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   40139
      End
      Begin VB.TextBox THealthNum 
         Alignment       =   2  'Center
         DataField       =   "Ministry_License_No"
         ForeColor       =   &H00808000&
         Height          =   375
         Left            =   4200
         MaxLength       =   25
         RightToLeft     =   -1  'True
         TabIndex        =   36
         Tag             =   ";search=true;check=required;"
         Top             =   4005
         Width           =   1300
      End
      Begin MSComCtl2.DTPicker dtMinistryLicenseDate 
         DataField       =   "Ministry_License_Date"
         Height          =   375
         Left            =   1800
         TabIndex        =   37
         Tag             =   ";search=true;check=required;new=1/1/2004;"
         Top             =   4005
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   40139
      End
      Begin VB.TextBox TNumTer 
         Alignment       =   2  'Center
         DataField       =   "License_No"
         ForeColor       =   &H00008080&
         Height          =   375
         Left            =   4200
         MaxLength       =   25
         RightToLeft     =   -1  'True
         TabIndex        =   38
         Tag             =   ";search=true;check=custom;"
         Top             =   4635
         Width           =   1300
      End
      Begin MSComCtl2.DTPicker dtLicenseDate 
         DataField       =   "License_Date"
         Height          =   375
         Left            =   1800
         TabIndex        =   39
         Tag             =   ";search=true;"
         Top             =   4635
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   40139
      End
      Begin VB.TextBox TNumStop1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         DataField       =   "Suspend_Registration_No"
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   4200
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   40
         Tag             =   ";search=true;"
         Top             =   6420
         Width           =   1300
      End
      Begin VB.TextBox TColegeName 
         Alignment       =   2  'Center
         Enabled         =   0   'False
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   8820
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   87
         Tag             =   ";search=true;"
         Top             =   4245
         Width           =   1080
      End
      Begin VB.TextBox TDevision 
         Alignment       =   2  'Center
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   8850
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";check=custom;search=true;"
         Top             =   2700
         Width           =   1080
      End
      Begin VB.TextBox TZone 
         Alignment       =   2  'Center
         ForeColor       =   &H00004080&
         Height          =   375
         Left            =   6795
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";search=true;"
         Top             =   2685
         Width           =   1080
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
         TabIndex        =   49
         Top             =   240
         Width           =   10695
      End
      Begin VB.TextBox TUniversityID 
         Alignment       =   2  'Center
         DataField       =   "University_Id"
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   9480
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   91
         Tag             =   ";search=true;"
         Top             =   4320
         Visible         =   0   'False
         Width           =   480
      End
      Begin VB.TextBox TDevisionID 
         Alignment       =   2  'Center
         DataField       =   "Devision_Id"
         ForeColor       =   &H00000080&
         Height          =   375
         Left            =   7440
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   92
         Tag             =   ";check=custom;"
         Top             =   2760
         Visible         =   0   'False
         Width           =   465
      End
      Begin VB.TextBox dtSuspendRegistrationDate 
         Alignment       =   2  'Center
         BackColor       =   &H00C0E0FF&
         DataField       =   "Suspend_Registration_Date"
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   1800
         MaxLength       =   15
         RightToLeft     =   -1  'True
         TabIndex        =   41
         Tag             =   ";search=true;"
         Top             =   6420
         Width           =   1695
      End
      Begin VB.CheckBox CPay 
         BackColor       =   &H00C0E0FF&
         Caption         =   "„”œœ ··—”Ê„"
         DataField       =   "Payed_Tax"
         Enabled         =   0   'False
         ForeColor       =   &H00800080&
         Height          =   315
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   31
         Top             =   7140
         Width           =   1455
      End
      Begin MSComCtl2.DTPicker DCurrentStatusDate 
         DataField       =   "CurrentStatus_Date"
         Height          =   375
         Left            =   1800
         TabIndex        =   133
         Tag             =   ";search=true;"
         Top             =   5280
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker DInTameenDate 
         DataField       =   "Tameen_Date"
         Height          =   375
         Left            =   1800
         TabIndex        =   136
         Tag             =   ";search=true;"
         Top             =   5760
         Visible         =   0   'False
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   60293121
         CurrentDate     =   40139
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·«‘ —«ﬂ"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   57
         Left            =   3720
         RightToLeft     =   -1  'True
         TabIndex        =   135
         Top             =   5880
         Visible         =   0   'False
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   56
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   132
         Top             =   5400
         Width           =   495
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„·«ÕŸ«  : "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   55
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   131
         Top             =   8760
         Width           =   705
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„ »«·«‰ﬂ·Ì“Ì…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   51
         Left            =   9525
         RightToLeft     =   -1  'True
         TabIndex        =   129
         Top             =   8370
         Width           =   1080
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·Õ”«» ›Ì «·»‰ﬂ"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   52
         Left            =   4815
         RightToLeft     =   -1  'True
         TabIndex        =   128
         Top             =   8370
         Width           =   1455
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "‘⁄»… «· Ã‰Ìœ"
         Height          =   375
         Left            =   5640
         RightToLeft     =   -1  'True
         TabIndex        =   126
         Top             =   2640
         Width           =   615
      End
      Begin VB.Image ImgPicture 
         BorderStyle     =   1  'Fixed Single
         Height          =   1935
         Left            =   180
         Stretch         =   -1  'True
         Top             =   480
         Width           =   1395
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   " ”œÌœ «·—”Ê„"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   53
         Left            =   9870
         RightToLeft     =   -1  'True
         TabIndex        =   120
         Top             =   6840
         Width           =   915
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·‰Ÿ«„ «· ⁄«Ê‰Ì"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   54
         Left            =   9750
         RightToLeft     =   -1  'True
         TabIndex        =   121
         Top             =   7470
         Width           =   1035
      End
      Begin VB.Label lblTranformation 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "¬Œ—  ‰ﬁ¯·"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   10200
         RightToLeft     =   -1  'True
         TabIndex        =   108
         Top             =   6180
         Width           =   585
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„‰’»"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   50
         Left            =   8700
         RightToLeft     =   -1  'True
         TabIndex        =   125
         Top             =   5895
         Width           =   480
      End
      Begin VB.Shape Shape12 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   585
         Left            =   1680
         Top             =   7590
         Width           =   9180
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Ê÷⁄ «·—«Â‰"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   40
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   117
         Top             =   5385
         Width           =   885
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   31
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   109
         Top             =   4725
         Width           =   705
         WordWrap        =   -1  'True
      End
      Begin VB.Shape Shape11 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   585
         Left            =   6210
         Top             =   6270
         Width           =   4650
      End
      Begin VB.Shape shpTranformation 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   525
         Left            =   6240
         Top             =   6360
         Width           =   4650
      End
      Begin VB.Label lblFrom 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰ﬁÊ· „‰"
         ForeColor       =   &H00800080&
         Height          =   195
         Left            =   10125
         RightToLeft     =   -1  'True
         TabIndex        =   107
         Top             =   6540
         Width           =   630
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï"
         ForeColor       =   &H00800080&
         Height          =   195
         Left            =   7980
         RightToLeft     =   -1  'True
         TabIndex        =   105
         Top             =   6540
         Width           =   255
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„"
         ForeColor       =   &H00800080&
         Height          =   195
         Index           =   49
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   103
         Top             =   7200
         Width           =   705
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         ForeColor       =   &H00800080&
         Height          =   195
         Index           =   43
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   102
         Top             =   7200
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Ê÷⁄ «·‰ﬁ«»Ì"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   44
         Left            =   9840
         RightToLeft     =   -1  'True
         TabIndex        =   101
         Top             =   5040
         Width           =   960
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«· Õ’Ì· «·⁄·„Ì"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   5
         Left            =   9735
         RightToLeft     =   -1  'True
         TabIndex        =   100
         Top             =   3180
         Width           =   1050
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "ﬁ—«— «·«‰ ”«» ≈·Ï «·‰ﬁ«»…"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   33
         Left            =   4275
         RightToLeft     =   -1  'True
         TabIndex        =   99
         Top             =   3180
         Width           =   1665
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·‘Â«œ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   12
         Left            =   9990
         RightToLeft     =   -1  'True
         TabIndex        =   98
         Top             =   3480
         Width           =   825
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·œ—Ã… «·⁄·„Ì…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   25
         Left            =   9915
         RightToLeft     =   -1  'True
         TabIndex        =   97
         Top             =   3885
         Width           =   900
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·‘⁄»…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   22
         Left            =   8040
         RightToLeft     =   -1  'True
         TabIndex        =   96
         Top             =   2775
         Width           =   450
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·»—Ìœ «·≈·ﬂ —Ê‰Ì"
         ForeColor       =   &H00000000&
         Height          =   435
         Index           =   46
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   95
         Top             =   2640
         Width           =   705
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·’›… «·Õ“»Ì…"
         ForeColor       =   &H00000000&
         Height          =   390
         Index           =   41
         Left            =   3480
         RightToLeft     =   -1  'True
         TabIndex        =   94
         Top             =   2235
         Width           =   585
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Â« › «·⁄Ì«œ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   19
         Left            =   5505
         RightToLeft     =   -1  'True
         TabIndex        =   93
         Top             =   2370
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
         Left            =   3630
         RightToLeft     =   -1  'True
         TabIndex        =   51
         Top             =   1950
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
         Left            =   5565
         RightToLeft     =   -1  'True
         TabIndex        =   52
         Top             =   1950
         Width           =   810
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÂÊÌ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   10
         Left            =   5685
         RightToLeft     =   -1  'True
         TabIndex        =   90
         Top             =   1410
         Width           =   690
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„ﬂ«‰ «·Ê·«œ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   6
         Left            =   5550
         RightToLeft     =   -1  'True
         TabIndex        =   89
         Top             =   990
         Width           =   825
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ﬂ‰Ì…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   2
         Left            =   5985
         RightToLeft     =   -1  'True
         TabIndex        =   88
         Top             =   570
         Width           =   390
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·–« Ì"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   0
         Left            =   9930
         RightToLeft     =   -1  'True
         TabIndex        =   53
         Top             =   570
         Width           =   795
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   1
         Left            =   8085
         RightToLeft     =   -1  'True
         TabIndex        =   86
         Top             =   570
         Width           =   345
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√»"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   3
         Left            =   10170
         RightToLeft     =   -1  'True
         TabIndex        =   85
         Top             =   990
         Width           =   555
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·√„"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   4
         Left            =   7920
         RightToLeft     =   -1  'True
         TabIndex        =   84
         Top             =   990
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„Õ· Ê—ﬁ„ «·ﬁÌœ"
         ForeColor       =   &H00000000&
         Height          =   390
         Index           =   8
         Left            =   9915
         RightToLeft     =   -1  'True
         TabIndex        =   83
         Top             =   1365
         Width           =   930
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Ã‰”Ì…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   9
         Left            =   7905
         RightToLeft     =   -1  'True
         TabIndex        =   82
         Top             =   1410
         Width           =   525
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„‰“·"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   15
         Left            =   9990
         RightToLeft     =   -1  'True
         TabIndex        =   81
         Top             =   1950
         Width           =   735
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·⁄Ì«œ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   18
         Left            =   10050
         RightToLeft     =   -1  'True
         TabIndex        =   80
         Top             =   2370
         Width           =   675
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„‰ÿﬁ…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   23
         Left            =   10155
         RightToLeft     =   -1  'True
         TabIndex        =   79
         Top             =   2805
         Width           =   570
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «· ”œÌœ"
         ForeColor       =   &H00800080&
         Height          =   195
         Index           =   34
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   78
         Top             =   7230
         Width           =   915
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·«Œ ’«’"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   29
         Left            =   7785
         RightToLeft     =   -1  'True
         TabIndex        =   77
         Top             =   3885
         Width           =   660
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   28
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   76
         Tag             =   ";;"
         Top             =   3480
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„œÌ‰…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   27
         Left            =   8010
         RightToLeft     =   -1  'True
         TabIndex        =   75
         Top             =   4335
         Width           =   435
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "”‰… «· Œ—Ã"
         ForeColor       =   &H00000000&
         Height          =   390
         Index           =   26
         Left            =   7920
         RightToLeft     =   -1  'True
         TabIndex        =   74
         Top             =   4672
         Width           =   525
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·œÊ·…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   21
         Left            =   10470
         RightToLeft     =   -1  'True
         TabIndex        =   73
         Top             =   4770
         Width           =   375
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Ã«„⁄…"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   20
         Left            =   10320
         RightToLeft     =   -1  'True
         TabIndex        =   72
         Top             =   4335
         Width           =   495
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   14
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   71
         Top             =   3480
         Width           =   705
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   13
         Left            =   7980
         RightToLeft     =   -1  'True
         TabIndex        =   70
         Top             =   3480
         Width           =   465
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—ﬁ„"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   37
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   69
         Top             =   4080
         Width           =   705
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   38
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   68
         Top             =   4095
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   39
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   67
         Top             =   4725
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«· —ŒÌ’ «·œ«∆„"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   24
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   66
         Top             =   4350
         Width           =   945
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "«· ”ÃÌ· ›Ì Ê“«—… «·’Õ…"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   36
         Left            =   4230
         RightToLeft     =   -1  'True
         TabIndex        =   65
         Top             =   3750
         Width           =   1710
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "ﬁ—«— «· —ﬁÌ‰"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   30
         Left            =   5130
         RightToLeft     =   -1  'True
         TabIndex        =   64
         Top             =   6180
         Width           =   810
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ "
         ForeColor       =   &H00800080&
         Height          =   195
         Index           =   32
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   63
         Top             =   6510
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„"
         ForeColor       =   &H00800080&
         Height          =   195
         Index           =   42
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   62
         Top             =   6510
         Width           =   705
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "ﬁ—«— ≈⁄«œ… «· ”ÃÌ·"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   35
         Left            =   4620
         RightToLeft     =   -1  'True
         TabIndex        =   61
         Top             =   6915
         Width           =   1320
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„‰’»"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   45
         Left            =   8685
         RightToLeft     =   -1  'True
         TabIndex        =   60
         Top             =   5385
         Width           =   480
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·„Õ«”»Ì"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Index           =   47
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   59
         Top             =   3000
         Width           =   1260
      End
      Begin VB.Label LblCollaborativeMember 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0E0FF&
         Caption         =   "€Ì— „‰ ”» ··‰Ÿ«„ «· ⁄«Ê‰Ì"
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
         Left            =   1800
         RightToLeft     =   -1  'True
         TabIndex        =   58
         Top             =   7710
         Width           =   9015
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·Ã‰”"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   48
         Left            =   3675
         RightToLeft     =   -1  'True
         TabIndex        =   57
         Top             =   570
         Width           =   390
      End
      Begin VB.Label LblAccountNo 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "???"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   210
         RightToLeft     =   -1  'True
         TabIndex        =   56
         Top             =   3360
         Width           =   1290
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒÂ«"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   7
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   55
         Top             =   990
         Width           =   510
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒÂ«"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   11
         Left            =   3555
         RightToLeft     =   -1  'True
         TabIndex        =   54
         Top             =   1410
         Width           =   510
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   1305
         Left            =   1680
         Top             =   445
         Width           =   9175
      End
      Begin VB.Shape Shape2 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   1425
         Left            =   1680
         Top             =   1815
         Width           =   9180
      End
      Begin VB.Shape Shape3 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   1905
         Left            =   6210
         Top             =   3240
         Width           =   4650
      End
      Begin VB.Shape Shape4 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   585
         Left            =   1680
         Top             =   3240
         Width           =   4500
      End
      Begin VB.Shape Shape5 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   585
         Left            =   1680
         Top             =   3840
         Width           =   4500
      End
      Begin VB.Shape Shape6 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   705
         Left            =   1680
         Top             =   4440
         Width           =   4500
      End
      Begin VB.Shape Shape7 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   585
         Left            =   1680
         Top             =   6300
         Width           =   4500
      End
      Begin VB.Shape Shape8 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   585
         Left            =   1680
         Top             =   6990
         Width           =   4500
      End
      Begin VB.Shape Shape9 
         BackColor       =   &H00E1FEFF&
         BorderColor     =   &H00C0C0C0&
         Height          =   1080
         Left            =   1680
         Top             =   5160
         Width           =   9180
      End
   End
End
Attribute VB_Name = "frmDoctorCV"
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
Public selectedZone As Integer
Public isZoneSelected As Boolean
Dim rsPictures As ADODB.Recordset

Private WithEvents dlgDoctorForm As dlgSqlSelect
Attribute dlgDoctorForm.VB_VarHelpID = -1
Private WithEvents dlgDoctorPoints As dlgSqlSelect
Attribute dlgDoctorPoints.VB_VarHelpID = -1
Private WithEvents dlgDoctorTasdeed As dlgSqlSelect
Attribute dlgDoctorTasdeed.VB_VarHelpID = -1
Private WithEvents dlgDoctorSuspend As frmDoctorSuspend
Attribute dlgDoctorSuspend.VB_VarHelpID = -1
Private WithEvents dlgDoctorLicences As dlgSqlSelect
Attribute dlgDoctorLicences.VB_VarHelpID = -1
Private WithEvents dlgZones As dlgSqlSelect
Attribute dlgZones.VB_VarHelpID = -1
Private WithEvents dlgDevisions As dlgSqlSelect
Attribute dlgDevisions.VB_VarHelpID = -1
Private rsTasdeed As ADODB.Recordset
Private rsBranches As ADODB.Recordset
Dim txtferaName, txtBranchBoss, txtBranchPhone, txtFormNumber, txtFormDate, txtDestination As String
Dim txtLicense_Start_Date, txtFormType As String
Private oldZone As String
Dim dlgDoctorTasdeed_Editing As Boolean
Function chk_IsalUpdate_Availability(Isal_No As Long) As Boolean
    Dim sql As String
    Dim Cancle As Boolean
    Dim rs As ADODB.Recordset
     
    chk_IsalUpdate_Availability = False
    
    ActiveDatabaseName = "fari"
     
    sql = "Select isNull(sanadid,-1) as sanadid from paymentsIsal Where id = " & Isal_No
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If rs.Fields(0).Value = -1 Then
        chk_IsalUpdate_Availability = True
        Set rs = Nothing
    End If
    
    ActiveDatabaseName = "default"
    
End Function

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
                .Open "DoctorPicture"
                .addNew
                .Fields("Doctor_ID").Value = master.rs.Fields("Doctor_ID").Value
            Else
                .Open "select * from DoctorPicture where Doctor_ID = " & val(master.rs.Fields("Doctor_ID"))
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
                .Open "DoctoePicture"
                .addNew
                .Fields("Doctor_ID").Value = master.rs.Fields("Doctor_ID").Value
            Else
                .Open "select * from DoctorPicture where Doctor_ID = " & val(master.rs.Fields("Doctor_ID"))
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
    Set rsPictures = ExecuteSelect(Conn, "select Picture from DoctorPicture where Doctor_ID = " & master.rs!Doctor_ID, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰«  ° «·—Ã«¡ «·„Õ«Ê·… ·«Õﬁ«", vbCritical + vbOKOnly, "Œÿ√ €Ì— „ Êﬁ⁄"
        Exit Sub
    End If
    If rsPictures.RecordCount = 0 Or IsNull(rsPictures!Picture) Then Exit Sub
    ImgPicture.datafield = "Picture"
    Set ImgPicture.DataSource = rsPictures
End Sub

Private Sub CColegeHelp_Click()
    With dlgSqlSelect
        .GridTag = ";typeof=vsflexgrid;datafield=,0:id,1:name,2:city,3:country,;check=,1:required,2:required,3:required,;HiddenColumns=,0:true,;"
        .sql = "SELECT University_Id as id, University AS name, City AS city, Country AS country ,Case when country like '%”Ê—Ì%' then 0 else 1 end as Sort_field  From FixUniversity order by Sort_Field"
        .ColumnsNames = ",«”„ «·Ã«„⁄…,«·„œÌ‰…,«·œÊ·…"
        .FrameCaption = "«·Ã«„⁄« "
        Set .Opener = Me
        .Show 1
    End With
End Sub

Private Sub CDevisionHelp_Click()
'    If Not isZoneSelected Then
'        MsgBox "⁄·Ìﬂ «Œ Ì«— «·‘⁄»… √Ê·«", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·‘⁄»…"
'        Exit Sub
'    End If
    Dim cancel As Boolean
    Dim rsDevisions As ADODB.Recordset
    Set rsDevisions = ExecuteSelect(Conn, "Select Zone_ID,Zone_Name from FixZone", cancel)
    
    Set dlgDevisions = New dlgSqlSelect
    With dlgDevisions
        .GridTag = ";typeof=vsflexgrid;datafield=,0:id,1:name,2:zone,3:head,;check=,1:required,;HiddenColumns=,0:false,"
        .GridTag = .GridTag + ";MasterValues=,2:" & selectedZone & ",;"
        .sql = "SELECT Devision_Id as id, Devision_Name as name, d.Zone_Id as zone,Zone_Name,Devision_Head as head FROM FixDevision d,FixZone z where z.zone_id = d.zone_id Order By 1"
        'WHERE Zone_Id = " & selectedZone & " Order By 2"
        .ColumnsNames = "—ﬁ„ «·„‰ÿﬁ…,«”„ «·„‰ÿﬁ…,«”„ «·‘⁄»…,—∆Ì” «·„‰ÿﬁ…"
        .FrameCaption = "«·„‰«ÿﬁ"
        .fg.ColComboList(2) = .fg.BuildComboList(rsDevisions, "Zone_Name", "Zone_ID")
        Set .Opener = Me
        .Show 1
    End With
End Sub

Private Sub CIqurar_Click()
'    frmIqurar.Show 1
End Sub

Private Sub chkIsCollaborative_Council_Member_Click()
    cmbCollaborative_Position.Enabled = (chkIsCollaborative_Council_Member.Value = 1)
    If cmbCollaborative_Position.Enabled Then
        If master.rs.EOF Or master.rs.BOF Then
            cmbCollaborative_Position.ListIndex = 0
        ElseIf IsNull(master.rs.Fields("Collaborative_Council_Position")) Then
            cmbCollaborative_Position.ListIndex = 0
        Else
           cmbCollaborative_Position.ListIndex = master.rs.Fields("Collaborative_Council_Position")
        End If
        cmbCollaborative_Position.BackColor = &H80000005
    Else
        cmbCollaborative_Position.ListIndex = -1
        cmbCollaborative_Position.BackColor = &H80000000
    End If
End Sub

Private Sub chkIsInTameen_Click()
    If chkIsInTameen.Value = 1 Then
        Label1.Item(57).visible = True
        DInTameenDate.visible = True
    Else
        Label1.Item(57).visible = False
        DInTameenDate.visible = False
    End If
End Sub

Private Sub cmdCollaborative_Click()
    dlgCollaborativeSystem.Show 1
    master.rs.Move 0
    'LoadCollaborativeSystemMembershipInfo master.rs
End Sub

Private Sub cmdElectList_Click()
    ActiveDatabaseName = "Default"
    frmElectList.Show
End Sub

Private Sub cmdGoto_Click()
    Dim sql As String
    Dim c As Boolean
    Dim rs As ADODB.Recordset
    
    If Trim(txtGoto.text) = "" Then Exit Sub
    
    master.rs.Filter = ""
    
    sql = " Select count(*) from Doctor_Cv where doctor_id = " & val(txtGoto.text)
    Set rs = ExecuteSelect(Conn, sql, c)
    If rs.Fields(0).Value = 0 Then
        MsgBox "Â–« «·—ﬁ„ «·–« Ì €Ì— „ÊÃÊœ «·—Ã«¡  €ÌÌ—Â", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        SelectTextInTextEdit txtGoto
        Exit Sub
    End If
    MousePointer = vbHourglass
    master.rs.MoveFirst
    master.rs.Find "doctor_id = " & val(txtGoto.text)
    MousePointer = vbDefault
    
End Sub

Private Sub cmdGoto_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub CMove_Click()
    If master.rs.RecordCount = 0 Then Exit Sub
    With dlgDoctorTransition
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:di,1:dt,2:br,;"
        .GridTag = .GridTag & "check=,1:required,2:required,;check=,1:date,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,;"
        .GridTag = .GridTag & "MasterValues=,0:" & master.rs!Doctor_ID & ",;"
        .GridTag = .GridTag & "lookup=,2:Branch,;parentFields=,2:Id,;parentTables=,2:Branch,;"
        .GridTag = .GridTag & "sort=,1:asc,;"
        .sql = "Set DateFormat DMY SELECT Doctor_Id AS di, On_Date AS dt, To_Branch AS br" & vbCrLf
        .sql = .sql & "FROM DoctorTransition WHERE Doctor_Id = " & master.rs!Doctor_ID
        .ColumnsNames = ", «—ÌŒ «·‰ﬁ·,≈·Ï «·›—⁄"
        .FrameCaption = " ‰ﬁ·«  «·ÿ»Ì» " & master.rs!First_Name & " " & master.rs!Last_Name
        .Tag = ";Action=SetDoctorBranch;"
        Load dlgDoctorTransition
        fillCmb .cbBranchId, "SELECT id, Branch AS name FROM Branch"
        .cbBranchId.ListIndex = GetListIndex(.cbBranchId, master.rs!original_branch_id)
        .fg.ColDataType(1) = flexDTDate
        .master.rs.sort = "dt ASC"
        Set .Opener = Me
        .cmdOK.cancel = True
        .Show 1
    End With
End Sub

Private Sub CNewPay_Click()
    If rsTasdeed Is Nothing Then
        MsgBox "·« Ì„ﬂ‰  ”œÌœ «·—”Ê„ ﬁ»· ≈œŒ«· «·„»«·€ «·„ — »… ⁄·Ï «·”«œ… «·√ÿ»«¡ ÷„‰ «·—”Ê„ «·”‰ÊÌ… „‰ ÀÊ«»  «·»—‰«„Ã.", vbOKOnly Or vbCritical Or vbMsgBoxRight Or vbMsgBoxRtlReading
        Exit Sub
    End If
    Dim id As Integer
    id = master.rs!Doctor_ID
    Set dlgDoctorTasdeed = New dlgSqlSelect
    With dlgDoctorTasdeed
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:di,1:dt,2:py,3:tid,4:id,5:Isal,6:Note,;"
        .GridTag = .GridTag & "check=,1:required,2:required,3:required,;"
        .GridTag = .GridTag & "check=,1:date,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,4:true,;"
        .GridTag = .GridTag & "MasterValues=,0:" & id & ",;"
        .GridTag = .GridTag & "sort=,1:asc,;"
        .sql = "Set DateFormat DMY SELECT Doctor_Id AS di, OnDate AS dt, "
        '<RESET ISALs IDs By Year>'
            '.sql = .sql & "Payment AS py, TasdeedState AS tid,Id,Isal" & vbCrLf
            .sql = .sql & "Payment AS py, TasdeedState AS tid,Id, isal,Note" & vbCrLf
        '</RESET ISALs IDs By Year>'
        .sql = .sql & "FROM DoctorTasdeed WHERE Doctor_Id = " & master.rs!Doctor_ID
        .ColumnsNames = ",«· «—ÌŒ,«·„»·€,«·»Ì«‰,,—ﬁ„ «·≈Ì’«·,„·«ÕŸ« "
        .FrameCaption = " ”œÌœ «·—”Ê„"
        .cmdUpdate.visible = True
        '.FormSettings = FormSettings - btUpdate
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        Load dlgDoctorTasdeed
        .fg.ColWidth(1) = 60
        .fg.ColWidth(2) = 40
        .fg.ColWidth(3) = 300
        .fg.ColWidth(5) = 55
        .fg.ColWidth(6) = 60
        .Width = 10000
        .fg.ColDataType(1) = flexDTDate
        '.fg.ColComboList(2) = .fg.BuildComboList(rsTasdeed, "Payment", "Id")
        .fg.ColComboList(3) = .fg.BuildComboList(rsTasdeed, "Payment,*Description,Serial", "Id")
        .master.rs.sort = "dt ASC"
        Set .Opener = Me
        .cmdCancelDialog.visible = False
        ' Load .cmdCustomButton(1)
        ' .cmdCustomButton(1).top = .cmdCustomButton(0).top
        ' .cmdCustomButton(1).Left = .masterFrame.Left
        ' .cmdCustomButton(0).Left = (.Width - .cmdCustomButton(0).Width) / 2
        ' .cmdOK.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
        ' .cmdCustomButton(1).visible = True
        ' .cmdCustomButton(0).visible = True
        ' .cmdCustomButton(1).Caption = "ÿ»«⁄… √„— ﬁ»÷"
        ' .cmdCustomButton(0).Caption = "ÿ»«⁄… ≈Ì’«·  ›’Ì·Ì"
        .cmdOK.Left = .masterFrame.Left + (.masterFrame.Width - .cmdOK.Width) / 2
        .cmdOK.Caption = "⁄Êœ…"
        .cmdOK.cancel = True
        .cmdCustomButton(0).visible = True
        .cmdCustomButton(0).Caption = "ÿ»«⁄… «·Ê’·"
        .cmdCustomButton(0).Left = .fg.Left
        .mnuCommands.visible = True
        .Show 1
    End With
    Dim F As Variant
    F = CStr(master.rs.Filter)
    master.rs.Requery
    If F <> "0" Then
        master.rs.Filter = F
    Else
        master.rs.Filter = ""
    End If
    master.rs.Find "Doctor_Id = " & id
    If master.rs.EOF Then
        If MsgBox("«·»ÕÀ «·Õ«·Ì ·« Ì÷„ Â–« «·ÿ»Ì» »⁄œ  ”œÌœ «·—”Ê„° Â·  —Ìœ ≈·€«¡ «·»ÕÀø ≈÷€ÿ ·« ·≈€·«ﬁ «·Ê«ÃÂ… «·Õ«·Ì….", vbYesNo Or vbMsgBoxRight Or vbMsgBoxRtlReading Or vbQuestion) = vbYes Then
            master.rs.Filter = ""
            master.rs.Find "Doctor_Id = " & id
        Else
            Unload Me
        End If
    End If
End Sub

Private Sub Command1_Click()
Set dlgDoctorPoints = New dlgSqlSelect
    With dlgDoctorPoints
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:id,1:di,2:dt,3:sc,4:gv,5:sc,;"
        .GridTag = .GridTag & "check=,2:required,3:required,4:required,;"
        .GridTag = .GridTag & "check=,2:date,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,1:true,;"
        .GridTag = .GridTag & "MasterValues=,1:" & master.rs!Doctor_ID & ",;"
        .GridTag = .GridTag & "sort=,2:asc,;"
        .GridTag = .GridTag & "lookup=,3:Name,5:Points,;"
        .GridTag = .GridTag & "parentFields=,3:ID,5:ID,;"
        .GridTag = .GridTag & "parentTables=,3:FixSciencePoint,5:FixSciencePoint,;"
        .sql = "Set DateFormat DMY SELECT Id AS id, Doctor_Id AS di,Science_Id AS sc, OnDate AS dt, "
        .sql = .sql & "Given AS gv" & vbCrLf
        .sql = .sql & "FROM DoctorSciencePoint WHERE Doctor_Id = " & master.rs!Doctor_ID
        .ColumnsNames = ",,«· «—ÌŒ,«·‰‘«ÿ «·⁄·„Ì,«·ÃÂ… «·„«‰Õ…,"
        .FrameCaption = "«·√‰‘ÿ… «·⁄·„Ì… ··√ÿ»«¡"
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        Load dlgDoctorPoints
        .Width = 9000
        .fg.ColDataType(2) = flexDTDate
        .fg.Cols = .fg.Cols + 1
        .fg.TextMatrix(0, .fg.Cols - 1) = "⁄œœ «·‰ﬁ«ÿ"
        .master.rs.sort = "dt ASC"
        Set .Opener = Me
        .cmdOK.visible = False
        .cmdCancelDialog.Caption = "⁄Êœ…"
        .cmdCancelDialog.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
        '.cmdCancelDialog.visible = False
        '.cmdCustomButton(0).Left = .masterFrame.Left
        '.cmdOK.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
        '.cmdCustomButton(0).visible = True
        '.cmdCustomButton(0).Caption = "ÿ»«⁄… «·ÊÀÌﬁ…"
        '.cmdOK.Caption = "⁄Êœ…"
        '.cmdOK.cancel = True
        'Dim hasComments As String
        'hasComments = GetTagValue(Current_State.Settings, "DOCTOR_FORM_COMMENTS")
        'If hasComments = "true" Then
        '    Load .cmdCustomButton(1)
        '    .cmdCustomButton(1).Top = .cmdCustomButton(0).Top
        '    .cmdCustomButton(1).Left = .masterFrame.Left
        '    .cmdCustomButton(0).Left = (.Width - .cmdCustomButton(0).Width) / 2
        '    .cmdOK.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
        '    .cmdCustomButton(1).visible = True
        '    .cmdCustomButton(1).Caption = "«· ⁄·Ìﬁ «·≈÷«›Ì"
        'End If
        .Show 1
    End With
End Sub

Private Sub CPicAdd_Click()
    frmImportPicture.Caller_Form = "DOCTOR_CV"
    If master.rs.RecordCount = 1 Then Load_Picture
    If rsPictures.RecordCount = 0 Then
        frmImportPicture.cmdImageEditor.Enabled = False
    End If
    frmImportPicture.Show 1
End Sub

Private Sub CPosCh_Click()
    CPos.Enabled = (CPosCh.Value = 1)
    If CPos.Enabled Then
        CPos.ListIndex = 0
        CPos.BackColor = &H80000005
    Else
        CPos.ListIndex = -1
        CPos.BackColor = &H80000000
    End If
End Sub

Private Sub CStop_Click()
    Set dlgDoctorSuspend = New frmDoctorSuspend
    With dlgDoctorSuspend
        .Doctor = master.rs!Doctor_ID
        .Show 1
        ReflectSuspendStatus .last.rs
         If ((master.rs!Payed_Tax <> CPay.Value) Or (master.rs!Paying_Date <> dtPayingDate.text)) Then
            CPay.Caption = Replace(CPay.Caption, "*", "") & "*"
            Label1(34).Caption = Replace(Label1(34).Caption, "*", "") & "*"
            CPay.Value = master.rs!Payed_Tax
            If IsNull(master.rs!Paying_Date) Then
                dtPayingDate.text = ""
            Else
                dtPayingDate.text = master.rs!Paying_Date
            End If
        End If
    End With
End Sub

Private Sub CTmpTer_Click()
    Set dlgDoctorLicences = New dlgSqlSelect
    With dlgDoctorLicences
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:di,1:dn,2:pl,3:sd,4:ed,5:lti,;"
        '.GridTag = .GridTag & "check=,1:required,2:required,3:required,4:required,5:required,;"
        .GridTag = .GridTag & "check=,1:required,2:required,3:required,5:required,;"
        .GridTag = .GridTag & "check=,3:date,4:date,;check=,4:custom,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,;"
        .GridTag = .GridTag & "MasterValues=,0:" & master.rs!Doctor_ID & ",;"
        .GridTag = .GridTag & "sort=,3:asc,;"
        .GridTag = .GridTag & "lookup=,5:License_Type_Name,;"
        .GridTag = .GridTag & "parentFields=,5:License_Type_Id,;"
        .GridTag = .GridTag & "parentTables=,5:FixLicenseType,;"
        .sql = "Set DateFormat DMY SELECT Doctor_Id AS di, Document_Num AS dn, Place AS pl, "
        .sql = .sql & "Start_Date AS sd, End_Date AS ed, License_Type_Id as lti" & vbCrLf
        .sql = .sql & "FROM DoctorLicense WHERE Doctor_Id = " & master.rs!Doctor_ID
        .ColumnsNames = ",«·—ﬁ„,«·„ﬂ«‰, «—ÌŒ «·»œ«Ì…, «—ÌŒ «·‰Â«Ì…,‰Ê⁄ «· —ŒÌ’"
        .FrameCaption = "«· —«ŒÌ’ «·„ƒﬁ …"
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        Load dlgDoctorLicences
        .Width = 9000
        .fg.ColDataType(3) = flexDTDate
        .fg.ColDataType(4) = flexDTDate
        .master.rs.sort = "sd ASC"
        Set .Opener = Me
        .cmdCancelDialog.visible = False
        .cmdOK.Left = (.Width - .cmdOK.Width) / 2
        .cmdOK.Caption = "⁄Êœ…"
        .cmdOK.cancel = True
        .Show 1
    End With
End Sub

Private Sub CWath_Click()
    
    Set dlgDoctorForm = New dlgSqlSelect
    With dlgDoctorForm
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:di,1:dt,2:ty,3:ds,4:id,5:ty,;"
        .GridTag = .GridTag & "check=,1:required,2:required,;"
        .GridTag = .GridTag & "check=,1:date,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,4:true,;"
        .GridTag = .GridTag & "MasterValues=,0:" & master.rs!Doctor_ID & ",;"
        .GridTag = .GridTag & "sort=,1:asc,;"
        .GridTag = .GridTag & "lookup=,2:Name,5:cost,;"
        .GridTag = .GridTag & "parentFields=,2:ID,5:ID,;"
        .GridTag = .GridTag & "parentTables=,2:FixFormType,5:FixFormType,;"
        .sql = "Set DateFormat DMY SELECT Doctor_Id AS di, OnDate AS dt, Type AS ty, "
        .sql = .sql & "Destination AS ds, id as id" & vbCrLf
        .sql = .sql & "FROM DoctorForm WHERE Doctor_Id = " & master.rs!Doctor_ID
        .ColumnsNames = ",«· «—ÌŒ,‰Ê⁄ «·ÊÀÌﬁ…,«·ÃÂ… «·„ÊÃ¯Â… ≈·ÌÂ«,"
        .FrameCaption = "ÊÀ«∆ﬁ «·√ÿ»«¡"
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        Load dlgDoctorForm
        .Width = 9000
        .fg.ColDataType(1) = flexDTDate
        .fg.Cols = .fg.Cols + 1
        .fg.TextMatrix(0, .fg.Cols - 1) = "«·„»·€"
        .master.rs.sort = "dt ASC"
        Set .Opener = Me
        .cmdCancelDialog.visible = False
        .cmdCustomButton(0).Left = .masterFrame.Left
        .cmdOK.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
        .cmdCustomButton(0).visible = True
        .cmdCustomButton(0).Caption = "ÿ»«⁄… «·ÊÀÌﬁ…"
        .cmdOK.Caption = "⁄Êœ…"
        .cmdOK.cancel = True
        Dim hasComments As String
        hasComments = GetTagValue(Current_State.Settings, "DOCTOR_FORM_COMMENTS")
        hasComments = "false"
        If hasComments = "true" Then
            Load .cmdCustomButton(1)
            .cmdCustomButton(1).Top = .cmdCustomButton(0).Top
            .cmdCustomButton(1).Left = .masterFrame.Left
            .cmdCustomButton(0).Left = (.Width - .cmdCustomButton(0).Width) / 2
            .cmdOK.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
            .cmdCustomButton(1).visible = True
            .cmdCustomButton(1).Caption = "«· ⁄·Ìﬁ «·≈÷«›Ì"
            
           Load .cmdCustomButton(2)
            .cmdCustomButton(2).Top = .cmdCustomButton(0).Top
            .cmdCustomButton(2).Left = .cmdCustomButton(0).Left + .cmdCustomButton(0).Width + 100
            .cmdCustomButton(2).visible = True
            .cmdCustomButton(2).Caption = "ÿ»«⁄… «·Ê’·"
        Else
            Load .cmdCustomButton(1)
            .cmdCustomButton(1).visible = False
            Load .cmdCustomButton(2)
            .cmdCustomButton(2).Top = .cmdCustomButton(0).Top
            .cmdCustomButton(2).Left = .cmdCustomButton(0).Left + .cmdCustomButton(0).Width + 100
            .cmdCustomButton(2).visible = True
            .cmdCustomButton(2).Caption = "ÿ»«⁄… «·Ê’·"
        End If
        .Show 1
    End With
End Sub

Private Sub CZoneHelp_Click()
    Set dlgZones = New dlgSqlSelect
    oldZone = TZone.text
    With dlgZones
        .GridTag = ";typeof=vsflexgrid;datafield=,0:id,1:name,;check=,1:required,;HiddenColumns=,0:false,;"
        .sql = "SELECT Zone_Id as id, Zone_Name as name FROM FixZone Order By 2"
        .ColumnsNames = "—ﬁ„ ,«”„ «·‘⁄»…"
        .FrameCaption = "«·‘⁄»"
        Set .Opener = Me
        .Show 1
    End With
End Sub

Private Sub dlgDevisions_doBeforeAddNew(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, cancel As Boolean)
    Dim msg As VbMsgBoxResult
    cancel = Not frmDoctorCV.isZoneSelected
    If cancel Then
        MsgBox "ÌÃ»  ⁄ÌÌ‰ «·‘⁄»… «· Ì  —Ìœ ≈÷«›… Â–Â «·„‰ÿﬁ… ≈·ÌÂ«", vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
    Else
        msg = MsgBox("«‰ »Â : ≈‰ «·„‰ÿﬁ… «· Ì  ﬁÊ„ »≈÷«› Â« «·¬‰ ” ﬂÊ‰  «»⁄… ·‘⁄»… :" & TZone.text & " Â· √‰  „ √ﬂœ ø", vbExclamation + vbYesNoCancel, " √ﬂÌœ")
        If msg <> vbYes Then
            cancel = True
        End If
    End If
End Sub
Private Sub dlgDevisions_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If dlgDevisions.master.state = ST_SEARCH Then
        cancel = Col = 0
    End If
End Sub

Private Sub dlgDevisions_OnBeforeRemoveHiddenFieldWhenSave(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim hiddens As String
    hiddens = GetTagValue(theGrid.Tag, "HiddenColumns")
    hiddens = SetTagValue(hiddens, "0", "true", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "HiddenColumns", hiddens)
End Sub
Private Sub dlgDevisions_OnSaveCanceled(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim hiddens As String
    hiddens = GetTagValue(theGrid.Tag, "HiddenColumns")
    hiddens = SetTagValue(hiddens, "0", "false", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "HiddenColumns", hiddens)
End Sub

Private Sub dlgDevisions_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 0) = rs!id
    Dim hiddens As String
    hiddens = GetTagValue(theGrid.Tag, "HiddenColumns")
    hiddens = SetTagValue(hiddens, "0", "false", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "HiddenColumns", hiddens)
End Sub

Private Sub dlgDoctorPoints_OnAddNew(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 2) = format(Date, "dd/mm/yyyy")
End Sub

Private Sub dlgDoctorPoints_OnAfterEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
    If Col = 3 Then
        theGrid.TextMatrix(Row, 5) = theGrid.TextMatrix(Row, 3)
    End If
End Sub

Private Sub dlgDoctorPoints_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = (Col = (theGrid.Cols - 1))
End Sub

Private Sub dlgDoctorForm_OnAddNew(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 1) = format(Date, "dd/mm/yyyy")
End Sub

Private Sub dlgDoctorForm_OnAfterEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
    If Col = 2 Then
        theGrid.TextMatrix(Row, 5) = theGrid.TextMatrix(Row, 2)
    End If
End Sub

Private Sub dlgDoctorForm_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = (Col = (theGrid.Cols - 1))
End Sub

Private Sub dlgDoctorForm_OnCustomeButtonClick(ByVal Index As Integer)
    Dim fg As VSFlexGrid
    Set fg = dlgDoctorForm.fg
    Dim R As Long
    R = fg.Row
    '<AHMAD>
        If master.rs.RecordCount = 0 Then Exit Sub
        If dlgDoctorForm.master.rs.RecordCount = 0 Then Exit Sub
    '</AHMAD>
    Dim cancel As Boolean
    'HHHHHHHHHHHHHHHHHHHHH
    Dim sql As String
    sql = "SELECT First_Name + ' ' + Father_Name + ' ' + Last_Name AS Full_Name, Mother_Name, "
    sql = sql & "c.Doctor_Id, Ministry_License_No, Ministry_License_Date, "
    sql = sql & "Cyndicate_Registration_No, n.Nationality,c.Military_Section, "
    sql = sql & "Cyndicate_Registration_Date, License_Date, c.FullNameEnglish, c.BankAccountNo, p.DoctorForm, p.Padding" & vbCrLf
    sql = sql & "FROM Doctor_CV c INNER JOIN FixNationality n "
    sql = sql & "ON c.Nationality_ID = n.Nationality_ID" & vbCrLf
    sql = sql & "LEFT OUTER JOIN (" & vbCrLf
    sql = sql & "SELECT a.Id as DoctorForm, a.Doctor_Id, b.Padding FROM DoctorForm a" & vbCrLf
    sql = sql & "LEFT OUTER JOIN DoctorFormPadding b ON a.Id = b.DoctorForm" & vbCrLf
    sql = sql & ") p on p.Doctor_Id = c.Doctor_Id" & vbCrLf
    sql = sql & "WHERE c.Doctor_ID = " & fg.TextMatrix(R, 0) & " and p.DoctorForm = " & fg.TextMatrix(R, 4)
    '/HHHHHHHHHHHHHHHHHHH
    Dim rs As ADODB.Recordset
    Dim Start_Date As String
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If Index = 0 Then
       
        Dim rpt As DataReport
        Set rpt = DRDoctorForm
        Set rpt.DataSource = rs
        rpt.DataMember = ""
        '<AHMAD>
            If rs.RecordCount = 0 Then Exit Sub
            'If IsNull(rs.Fields("License_Date").Value) Then
                Dim rsLicense_Date As ADODB.Recordset
                sql = "SET DATEFORMAT DMY Select Min(Start_Date) From DoctorLicense Where Doctor_ID = " & fg.TextMatrix(R, 0)
                Set rsLicense_Date = ExecuteSelect(Conn, sql, cancel)
                Start_Date = CStr(rsLicense_Date.Fields(0).Value & "")
            'Else
                If Start_Date = "" Then
                    Start_Date = CStr(rs!License_Date & "")
                End If
            'End If
        Get_DataReport_Label_byName(rpt, 3, "lblStart_Date").Caption = Start_Date
        txtLicense_Start_Date = Start_Date
        '</AHMAD>
        
        Get_DataReport_Label_byName(rpt, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
        txtferaName = "›—⁄ „Õ«›Ÿ… " & Current_State.name
        Get_DataReport_Label_byName(rpt, 1, "lblBranchPhone").Caption = Current_State.Phone
        txtBranchPhone = Current_State.Phone
        Get_DataReport_Label_byName(rpt, 1, "lblFormNumber").Caption = fg.TextMatrix(R, 4)
        txtFormNumber = fg.TextMatrix(R, 4)
        Get_DataReport_Label_byName(rpt, 1, "lblFormDate").Caption = fg.TextMatrix(R, 1)
        txtFormDate = fg.TextMatrix(R, 1)
        Get_DataReport_Label_byName(rpt, 2, "lblDestination").Caption = "≈·Ï " & fg.TextMatrix(R, 3)
        txtDestination = "≈·Ï " & fg.TextMatrix(R, 3)
        txtFormType = fg.TextMatrix(R, 0)
      '  Get_DataReport_Label_byName(rpt, 5, "lblBranchAccountant").Caption = Current_State.Accountant
        Get_DataReport_Label_byName(rpt, 5, "lblBranchBoss").Caption = Current_State.Boss
      
        '<AHMAD>
        'DRDoctorForm.Show 1
        Dim i As Integer
        If Current_State.id = 1 Then 'Reef
            For i = 1 To 2
                DRDoctorForm.PrintReport
            Next i
        ''Else
            ''DRDoctorForm.Show 1
        End If
    '</AHMAD>
     ' We will export doc to Microsoft Word dddddddddd
         Dim formID As Integer
         Dim sqlCmd As String
         Dim resRS As ADODB.Recordset
         formID = fg.TextMatrix(R, 2)
         sqlCmd = "select name from FixFormType where id = " & formID
          Set resRS = ExecuteSelect(Conn, sqlCmd, cancel)
         If resRS.RecordCount > 0 Then
               txtFormType = resRS.Fields(0).Value
         Else
             txtFormType = ""
         End If
          ExportForm2Word txtferaName, txtBranchBoss, txtBranchPhone, txtFormNumber, txtFormDate, txtDestination, txtLicense_Start_Date, txtFormType

        '/ We will export doc to Microsoft Word  ddddd
    Else
        If Index = 1 Then
            Set dlgDoctorFormPadding.DataSource = rs
            Load dlgDoctorFormPadding
            Dim btn As Long
            btn = GetBtnSettings(dlgDoctorForm)
            dlgDoctorFormPadding.Show 1
            dlgDoctorForm.btnSettings = btn
            RefreshCommands btn And dlgDoctorForm.FormSettings, dlgDoctorForm
        Else
            If Index = 2 Then
                'Dim lblCost, lblFormType, lbl As RptLabel
                Dim sql2 As String
                Dim resRS2 As ADODB.Recordset
                sql2 = " SELECT  id, Payer, OnDate, Description," & vbLf & _
                        " Total, IsTasdeed,mecanism , IsCanceled, notes, sanadId, TasdeedState " & vbLf & _
                        " FROM DocDbAccM.dbo.PaymentsIsal" & vbLf & _
                        " Where id = (SELECT Isal From NewDocDB.dbo.DoctorForm Where Id = " & fg.TextMatrix(R, 4) & ")"
                Set resRS2 = ExecuteSelect(Conn, sql2, cancel)
                Set DRFormIsal.DataSource = ExecuteSelect(Conn, "SELECT 1", cancel)
                DRFormIsal.DataMember = ""

                Get_DataReport_Label_byName(DRFormIsal, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
                Get_DataReport_Label_byName(DRFormIsal, 1, "lblBranchPhone").Caption = Current_State.Phone
                Get_DataReport_Label_byName(DRFormIsal, 1, "lblSerial").Caption = resRS2!id
                Get_DataReport_Label_byName(DRFormIsal, 1, "lblFrom").Caption = resRS2!Payer
                Get_DataReport_Label_byName(DRFormIsal, 1, "lblDate").Caption = resRS2!OnDate
                Get_DataReport_Label_byName(DRFormIsal, 1, "lblDescription").Caption = resRS2!description
                Get_DataReport_Label_byName(DRFormIsal, 1, "lblTotal").Caption = resRS2!Total & " ·.”"
                DRFormIsal.Show 1
            End If
        End If
    End If
End Sub

Private Sub dlgDoctorForm_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 0) = rs!di
    If Not IsNull(rs!id) Then
        theGrid.TextMatrix(theGrid.Row, 4) = rs!id
    End If
    rs.Requery
End Sub
Private Sub ExportForm2Word(ByVal txtferaName As String, ByVal txtBranchBoss As String, ByVal txtBranchPhone As String, ByVal txtFormNumber As String, ByVal txtFormDate As String, ByVal txtDestination As String, ByVal txtLicense_Start_Date As String, ByVal txtFormType As String)
   'Dim txt As String
   Dim oWordApp As Word.Application
   Dim oWordDoc As Word.Document
   ''Dim ParagHead As Word.Paragraph
   ''Dim oShape As Word.Shape
   ''Dim oGraphChart As Graph.Chart
   Dim rsYear As ADODB.Recordset
   Dim sql As String
   sql = " select Max(ID) as Cyear from Acc_ConstKashef "
   Set rsYear = ExecuteSelect(Conn, sql, cancel)
On Error GoTo err_Word_Handler
   Set oWordApp = CreateObject("Word.Application")
   oWordApp.visible = False
   Dim temp As String
   Set oWordDoc = oWordApp.Documents.Add
   Dim ImagePath As String
   ImagePath = App.Path + "\logo.bmp"
   ' ActiveDocument.Activate
   'Add some text to the document.
   Dim htmlText As String
   htmlText = "<html><head><title>AlmanarSoft</title></head><body><table dir=""rtl"" width=""100%"" ><tr><td><table style=""width:100%; height: 20%;"">"
   htmlText = htmlText + " <tr><td style=""width: 50%; height: 20%;""><table style=""width:100%; height: 100%;""><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold; text-align: center;"" valign=""middle"""
   htmlText = htmlText + " dir=""rtl"">&nbsp;‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ ›Ì ”Ê—Ì…</td></tr><tr><td style=""text-align: center; font-family: Monotype Koufi; font-size: 11pt; font-weight: bold;"" dir=""rtl"">&nbsp;›—⁄ " + Current_State.name + "</td></tr><tr><td style=""text-align: center; font-family: Monotype Koufi; font-size: 11pt; font-weight: bold;"""
   htmlText = htmlText + " dir=""rtl"">&nbsp;" + Current_State.Address + Current_State.PostBox + "</td></tr><tr><td style=""text-align: center; font-family: Monotype Koufi; font-size: 11pt; font-weight: bold;"" dir=""rtl"">&nbsp;"
   htmlText = htmlText + Current_State.Phone + Current_State.TFax + "</td></tr><tr><td style=""text-align: center; font-family: Monotype Koufi; font-size: 11pt; font-weight: bold;"""
   htmlText = htmlText + " dir=""ltr"">&nbsp;" + Current_State.Email + "</td></tr><tr><td style=""text-align: center; font-family: Monotype Koufi; font-size: 11pt; font-weight: bold;"" dir=""ltr"">&nbsp;"
   htmlText = htmlText + Current_State.webSite + "</td></tr></table></td><td style=""text-align: center; vertical-align: middle; width: 20%; height: 20%;""><img align=""middle"" dir=""rtl"" src=""" + ImagePath + """ style=""width: 100%; height: 100%"" /></td>"
   htmlText = htmlText + "<td style=""width: 30%; height: 20%""><table style=""width:100%; height: 100%;""><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold;"" valign=""middle"" dir=""rtl"">«·—ﬁ„: </td>" '" + txtFormNumber + "
   htmlText = htmlText + "</tr><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold"" dir=""rtl"">«· «—ÌŒ: </td></tr><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold"">" '" + txtFormDate + "
   htmlText = htmlText + "&nbsp;</td></tr><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold"">&nbsp;</td></tr><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold"">"
   htmlText = htmlText + "&nbsp;</td></tr><tr><td style=""font-family: Monotype Koufi; font-size: 11pt; font-weight: bold"">&nbsp;</td></tr></table></td></tr></table></td></tr>"
   '' 2nd Block
   htmlText = htmlText + "<tr><td dir=""rtl""><table style=""width:100%;""><tr><td style=""height: 30pt""></td></tr><tr><td align=""center"" dir=""rtl"" style=""font-family: 'Mudir MT'; font-size: 18pt; font-weight: bold"">"
   htmlText = htmlText + txtDestination + "</td></tr><tr><td dir=""rtl"" style=""font-family: 'Mudir MT'; font-size: 18pt"">"
   htmlText = htmlText + " ÕÌ… Ê»⁄œ:" + "</td></tr><tr><td dir=""rtl"" style=""font-family: 'Akhbar MT'; font-size: 18pt; font-weight: bold;"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ≈‰ «·œﬂ Ê— " + TName.text + " " + TLName.text + " »‰ " + TFName.text + " „‰ «·Ã‰”Ì… "
   htmlText = htmlText + CNationality.text + " „”Ã· ›Ì ›—⁄ ‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ »"
   htmlText = htmlText + Current_State.name
   htmlText = htmlText + " »—ﬁ„ / " + TNumIn.text + " /   «—ÌŒ "
   htmlText = htmlText + str(dtCyndicateRegistrationDate.Value)
   htmlText = htmlText + " Ê„”œœ ·ﬂ«›… «·—”Ê„ «·”‰ÊÌ… ·€«Ì… ⁄«„ /" + str(rsYear!Cyear)
   htmlText = htmlText + " ÊÌ„«—” «·„Â‰… ›Ì ⁄Ì«œ Â «·Œ«’…." + "</td></tr><tr><td align=""center"" dir=""rtl"" style=""font-family: 'akhbar MT'; font-size: 16pt; font-weight: bold;"">Ê»‰«¡ ⁄·Ï ÿ·»Â √⁄ÿÌ Â–Â «·ÊÀÌﬁ…</td>"
   htmlText = htmlText + "</tr></table></td></tr>"
   '' 3rd Block
   htmlText = htmlText + "<tr><td style=""height: 30pt"">&nbsp</td></tr><tr><td><table style=""width:100%;""><tr><td style=""width: 50%""></td><td style=""width: 50%""><table style=""width:100%;""><tr><td align=""center""style=""font-family: 'PT Bold Broken'; font-size: 14pt; font-weight: bold"">"
   htmlText = htmlText + "—∆Ì” ›—⁄ ‰ﬁ«»… √ÿ»«¡ «·√”‰«‰" + "</td></tr><tr><td align=""center"" style=""font-family: 'PT Bold Broken'; font-size: 14pt; font-weight: bold"">"
   htmlText = htmlText + "»„Õ«›Ÿ… " + Current_State.name + "</td></tr><tr><td align=""center"" style=""font-family: 'PT Bold Broken'; font-size: 14pt; font-weight: bold"">" + Current_State.Boss + "</td>"
   htmlText = htmlText + "</tr></table></td></tr></table></td></tr><tr><td>&nbsp</td></tr>"
   '' 4th Block
   htmlText = htmlText + "<tr><td dir=""rtl"" style=""font-family: 'Akhbar MT'; font-size: 12pt; text-decoration: underline;"">‰”Œ… ≈·Ï:</td></tr>"
   htmlText = htmlText + "<tr><td dir=""rtl"" style=""font-family: 'Akhbar MT'; font-size: 12pt;"">- «÷»«—… «·œﬂ Ê— ’«Õ» «·⁄·«ﬁ….<br />- «·’«œ—….<br />- ”œœ  —”„ «·„’œﬁ… »«·≈Ì’«· —ﬁ„ /&nbsp;&nbsp;&nbsp;&nbsp; /  «—ÌŒ&nbsp; / /&nbsp;&nbsp;&nbsp;.</td></tr></table></body></html>"
   '' end htmlText
   ''Dim detail As String
   ''Dim h1, Line1, Line2, Line3, Line4, LAddress, LFax, LEmail, LWeb, Line6, footer       As String
   oWordDoc.Content.text = ""
   ''LAddress = Current_State.Address
   ''LEmail = Current_State.Email
   ''LWeb = Current_State.webSite
   txtBranchBoss = Current_State.Boss
   ''h1 = "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ ›Ì ”Ê—Ì…" + vbNewLine
   ''Line1 = txtferaName + "                                                                      " + "«·—ﬁ„ :  " + txtFormNumber
   ''Line2 = txtBranchPhone + "  ’ . »  " + Current_State.TFax + "                                              " + "«· «—ÌŒ :  " + txtFormDate
   ''Line6 = LAddress + vbNewLine + LEmail + vbNewLine + LWeb
   ''Line3 = "                                " + txtDestination + "  "
     ''detail = h1 + Line1 + vbNewLine + Line2 + vbNewLine + Line6 + vbNewLine + Line3 + vbNewLine
     ''detail = detail + "≈‰¯ ÿ»Ì» «·√”‰«‰ «·”Ìœ : " + TName.text + "  " + TFName.text + "  " + TLName.text + "         Ê«·œ Â  :  " + TMName.text
     ''detail = detail + vbNewLine + "Ê ÌÕ„· «·Ã‰”Ì… :    " + CNationality.text
     ''detail = detail + vbNewLine + "„”Ã· ·œÏ Ê“«—… «·’Õ… ›Ì ”Ã· √ÿ»«¡ «·√”‰«‰ »—ﬁ„   " + THealthNum.text + "  » «—ÌŒ   " + str(dtMinistryLicenseDate.Value)
     ''detail = detail + vbNewLine + "Ê „”Ã· ·œÏ ›—⁄‰« »—ﬁ„   " + TNumIn.text + "    » «—ÌŒ   " + str(dtCyndicateRegistrationDate.Value)
     ''detail = detail + vbNewLine + "«⁄ÿÌ  ·Â Â–Â  ÊÀÌﬁ…  " + txtFormType
     ''footer = vbNewLine + "                                                                   " + "—∆Ì” ›—⁄ ‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ " + vbNewLine + "                                                                           " + "›Ì „Õ«›Ÿ…  " + Current_State.name
     ''footer = footer + vbNewLine + "                                                                              " + txtBranchBoss
     ''detail = detail + footer
    ''Dim myRange As Object
    ''Dim returnValue As Paragraph
    ''Dim paragraphs1 As Paragraphs
  
   'ActiveDocument.Comments.Add Range:=myRange, text:="original third paragraph"
   
   oWordDoc.Content.text = htmlText
   oWordApp.visible = False
   Dim Rpath As String
   Rpath = App.Path + "\Reports" + "\ÊÀÌﬁ…_" + TName.text + "_" + TFName.text + "_" + TLName.text + "_" + txtFormNumber + ".wmnr"
   oWordDoc.SaveAs Rpath, WdSaveFormat.wdFormatText
   oWordDoc.Close WdSaveOptions.wdDoNotSaveChanges
   MsgBox "«·„·› «·‰« Ã:" + vbNewLine + Rpath
   ''oWordDoc.SaveAs TName.text + TLName + "_ÊÀÌﬁ….mnr"
   ''Dim fileLength As Integer
   ''fileLength = Len(htmlText)
   ''ggFreeFile = FreeFile
   ''Open App.Path & "\ÊÀÌﬁ…_" & TName.text & "_" & TLName.text & ".mnr" For Random As ggFreeFile Len = fileLength
    ''Put #Line1, htmlText
   ''Close #ggFreeFile
  ' oWordDoc.Content.Font.Size = 20
  '  ActiveDocument.Content.Font.Bold = True
err_Word_Handler:
   '  MsgBox " √ﬂœ „‰ ÊÃÊœ √›Ì” ÊÊ—œ ⁄·Ï «·Õ«”»"
   'Clean up.

   Set oWordDoc = Nothing
   Set oWordApp = Nothing
            
End Sub

Private Sub dlgDoctorLicences_OnSaveValidate(theGrid As VSFlex7Ctl.VSFlexGrid, msg As String, isNotValid As Boolean)
    Dim sd As Date, ED As Date
    If theGrid.TextMatrix(theGrid.Row, 4) = "" Then Exit Sub
    sd = CDate(theGrid.TextMatrix(theGrid.Row, 3))
    ED = CDate(theGrid.TextMatrix(theGrid.Row, 4))
    msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ «‰ Â«¡ «· —ŒÌ’ √ﬂ»— „‰  «—ÌŒ »œ¡Â."
    isNotValid = ED <= sd
End Sub

Private Sub dlgDoctorSuspend_OnShouldChangeTasdeed(rsTasdeed As ADODB.Recordset, ByVal isDelete As Boolean)
    If isDelete Then
'        If Not IsNull(rsTasdeed!TasdeedStatus) Then
''            master.rs!Payed_Tax = rsTasdeed!TasdeedStatus
''            master.rs!Paying_Date = rsTasdeed!TasdeedDate
'        Else
'            master.rs!Payed_Tax = 0
'            master.rs!Paying_Date = Null
'        End If
    Else
        rsTasdeed!TasdeedStatus = master.rs!Payed_Tax
        rsTasdeed!TasdeedDate = master.rs!Paying_Date
        If IsNull(rsTasdeed!rd) Then
            master.rs!Payed_Tax = 0
            master.rs!Paying_Date = Null
        End If
    End If
End Sub

Private Sub dlgDoctorTasdeed_doBeforeUpdate(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, cancel As Boolean)
    dlgDoctorTasdeed.master.MoveRSToSelectedRow theGrid, dlgDoctorTasdeed.master.rs
    If rs.RecordCount > 0 Then
        dlgDoctorTasdeed_Editing = True
        'Dim ce As Cell
        'Set ce = theGrid.Cell(flexcpText, rs.AbsolutePosition, theGrid.Cols - 1, 0, 0)
        'If Not chk_IsalUpdate_Availability(CLng(ce)) Then
        '    MsgBox "·« Ì„ﬂ‰ﬂ  ⁄œÌ· Â–« «·≈Ì’«· ·√‰Â „—Õ· ··„Õ«”»… ° √Ì  €ÌÌ—«  ﬁ„  »≈Ã—«∆Â« ⁄·Ï Â–« «·≈Ì’«· ·‰ Ì „ Õ›ŸÂ«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        '    cancel = True
        'End If
    End If
End Sub
Private Sub dlgDoctorTasdeed_OnAddNew(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 1) = Date
    If Current_State.id = 1 Then 'Reef
        Dim TasdeedState As String
        TasdeedState = InputBox("√œŒ· —ﬁ„ «·Õ«·… „‰ ›÷·ﬂ", "Õ«·… «· ”œÌœ")
        If IsNumeric(TasdeedState) Then
            With rsTasdeed
                .MoveFirst
                Do While Not .EOF
                    If .Fields("serial").Value = val(TasdeedState) Then
                        theGrid.Cell(flexcpText, theGrid.Rows - 1, 3) = .Fields(0).Value
                        theGrid.Cell(flexcpText, theGrid.Rows - 1, 2) = .Fields("payment").Value
                        Exit Do
                    End If
                    .MoveNext
                Loop
            End With
        End If
    End If
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = False
End Sub

Private Sub dlgDoctorTasdeed_OnAfterEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
    Dim msg As VbMsgBoxResult
    If Col = 3 And theGrid.TextMatrix(Row, 3) <> "" Then
        rsTasdeed.Filter = "Id = " & theGrid.TextMatrix(Row, 3)
        If IsNull(rsTasdeed!Payment) = True Then
            MsgBox "ÌÃ»  ÕœÌœ ﬁÌ„… «·—”Ê„ „‰ «·ÀÊ«»  . ·« Ì„ﬂ‰  ”œÌœ ﬁÌ„ „⁄œÊ„…"
            Exit Sub
        End If
        If DoctorIsPaidSameTasdeed(master.rs!Doctor_ID, rsTasdeed!id) Then
             msg = MsgBox("Â· √‰  „ √ﬂœ √‰ﬂ  —Ìœ  ”œÌœ ‰›” «·—”„ ·‰›” «·ÿ»Ì» „—… ÃœÌœ…", vbQuestion + vbYesNo, "”ƒ«·")
            If msg <> vbYes Then Exit Sub
        End If
        theGrid.TextMatrix(Row, 2) = rsTasdeed!Payment
    End If
End Sub
Private Function DoctorIsPaidSameTasdeed(Doctor_ID As Integer, TasdeedState As Integer) As Boolean
    Dim sql As String
    Dim cancel As Boolean
    Dim rsDoctorTasdeed As ADODB.Recordset
    sql = "select doctor_id from  DoctorTasdeed where doctor_id = " & Doctor_ID & "  and TasdeedState = " & TasdeedState
    Set rsDoctorTasdeed = ExecuteSelect(Conn, sql, cancel)
    If rsDoctorTasdeed.RecordCount > 0 Then
        DoctorIsPaidSameTasdeed = True
 '       End If
    Else
        DoctorIsPaidSameTasdeed = False
    End If
End Function

Private Sub dlgDoctorTasdeed_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
If dlgDoctorTasdeed_Editing Then
    cancel = (Col = 1) Or (Col = 2) Or (Col = 3) Or (Col = 5)
Else
    cancel = (Col = 2) Or (Col = 5)
End If
End Sub

Private Sub dlgDoctorTasdeed_OnCustomeButtonClick(ByVal Index As Integer)
'--------------------------------------------------------------------------
'    Dim lblCost, lblFormType, lbl As RptLabel
'    Dim fg As VSFlexGrid
'    Set fg = dlgDoctorTasdeed.fg
'    Dim R As Long
'    R = fg.Row
'
'    Dim isSyrian As Boolean
'    Dim TaxId As Integer
'    TaxId = fg.TextMatrix(R, 3)
'    rsTasdeed.Filter = "Tax_ID = " & TaxId
'    isSyrian = rsTasdeed!Syrian
'
'    Dim fn As String
'    fn = master.rs!First_Name & " " & master.rs!Last_Name
'
'    Dim Cancel As Boolean
'    Dim sql As String
'    Dim rpt As DataReport
'    If Index = 0 Then
'        sql = "SELECT * FROM " & IIf(isSyrian, "FixSyrianTax", "FixNoneSyrainTax")
'        sql = sql & vbCrLf & "WHERE Tax_ID = " & TaxId
'        If isSyrian Then
'            Set rpt = DRIsalTasdeed
'        Else
'            Set rpt = DRIsalTasdeedNoneSyrian
'        End If
'    ElseIf Index = 1 Then
'        sql = "SELECT 1"
'        Set rpt = DRFormIsal
'    End If
'
'    Set rpt.DataSource = ExecuteSelect(Conn, sql, Cancel)
'    rpt.DataMember = ""
'
'    Get_DataReport_Label_byName(rpt, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
'    Get_DataReport_Label_byName(rpt, 1, "lblBranchPhone").Caption = Current_State.Phone
'    Get_DataReport_Label_byName(rpt, 1, "lblFormNumber").Caption = fg.TextMatrix(R, 4)
'    Get_DataReport_Label_byName(rpt, 1, "lblFormDate").Caption = fg.TextMatrix(R, 1)
'    Get_DataReport_Label_byName(rpt, 1, "lblDoctorId").Caption = fg.TextMatrix(R, 0)
'    Get_DataReport_Label_byName(rpt, 1, "lblFullName").Caption = fn
'
'    Dim sec As Integer
'    sec = IIf(Index = 0, 5, 1)
'    Set lblCost = Get_DataReport_Label_byName(rpt, sec, "lblCost")
'    lblCost.Caption = fg.Cell(flexcpTextDisplay, R, 2)
'    Set lblFormType = Get_DataReport_Label_byName(rpt, 1, "lblFormType")
'    lblFormType.Caption = fg.Cell(flexcpTextDisplay, R, 3)
'
'    If Index = 0 Then
'        Get_DataReport_Label_byName(rpt, 1, "lblNationality").Caption = CNationality.text
'        If isSyrian Then
'            DRIsalTasdeed.Show 1
'        Else
'            DRIsalTasdeedNoneSyrian.Show 1
'        End If
'    ElseIf Index = 1 Then
'        lblCost.top = lblCost.top + lblCost.Height
'        lblFormType.Left = lblFormType.Left - 0.5 * lblFormType.Width
'        lblFormType.Width = lblFormType.Width * 1.5
'        lblFormType.CanGrow = True
'        Set lbl = Get_DataReport_Label_byName(rpt, 1, "Label2")
'        lbl.top = lbl.top + 0.5 * lbl.Height
'        Set lbl = Get_DataReport_Label_byName(rpt, 1, "Label1")
'        lbl.top = lblCost.top
'        DRFormIsal.Show 1
'    End If
'-----------------------------------------------------
    If dlgDoctorTasdeed.master.rs.RecordCount = 0 Then Exit Sub

    ActiveDatabaseName = "fari"
    Dim sql As String
    Dim rsDataSource As ADODB.Recordset
    Dim cancel As Boolean
    Dim i As Integer
      
    With dlgDoctorTasdeed
        sql = "Select Serial,State_Name,State_Total,Share_Name,Share_Total,Tawzeeat_Name,Payment " & _
              "  From dbo.sf_Get_Isal_Tafseel( " & val(.fg.Cell(flexcpText, .fg.Row, 3)) & ")"
        Set rsDataSource = ExecuteSelect(Conn, sql, cancel)
        Set DrIsalTafseel.DataSource = rsDataSource
        
        Get_DataReport_Label_byName(DrIsalTafseel, 5, "lblAmountText").Caption = "›ﬁÿ" & WriteNo(.fg.Cell(flexcpText, .fg.Row, 2), 0) & "·Ì—… ”Ê—Ì… ·«€Ì—"
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblBranchName").Caption = Current_State.FullName
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblDoctor_id").Caption = frmDoctorCV.master.rs!Doctor_ID
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblBranchPhone").Caption = Current_State.Phone
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblDate").Caption = .fg.Cell(flexcpText, .fg.Row, 1)
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblFrom").Caption = TName.text & " " & TFName.text & " " & TLName.text
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblSerial").Caption = .fg.Cell(flexcpText, .fg.Row, 5)
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblBranchPhone").Caption = Current_State.Phone
        Get_DataReport_Label_byName(DrIsalTafseel, 1, "lblTotal").Caption = .fg.Cell(flexcpText, .fg.Row, 2)
    End With
    '<AHMAD>
        'DrIsalTafseel.Show 1
        If Current_State.id = 1 Then 'Reef
            For i = 1 To 2
                DrIsalTafseel.PrintReport
            Next i
        Else
            DrIsalTafseel.Show 1
        End If
    '</AHMAD>
   ActiveDatabaseName = "default"
   
  End Sub


Private Sub dlgDoctorTasdeed_OnDelete(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, cancel As Boolean)
    
    If IsNull(rs!Isal) Then Exit Sub
    
    Dim rsCheck As ADODB.Recordset
    Dim rsGetRealIsalID As ADODB.Recordset
    Dim sql As String
    Dim c As Boolean
    
    ActiveDatabaseName = "Fari"
    
    sql = "set dateformat dmy select id from PaymentsIsal Where id = " & rs!Isal & " and onDate = '" & rs!dt & "'"
    
    Set rsGetRealIsalID = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡  ÕœÌœ «·≈Ì’«·", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    
    If rsGetRealIsalID.EOF Or rsGetRealIsalID.BOF Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡  ÕœÌœ «·≈Ì’«·", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    
    sql = "Select  dbo.sf_Get_Payment_Moving_STatus(" & rsGetRealIsalID!id & ")"
    Set rsCheck = ExecuteSelect(Conn, sql, c)
    If rsCheck.Fields(0).Value = 3 Then
        MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·≈Ì’«· ·√‰Â „—Õ· ≈·Ï «·„Õ«”»…", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
    End If
    ActiveDatabaseName = "Default"
End Sub

Private Sub dlgDoctorTasdeed_OnEllipseGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long)
    If Col <> 2 Then Exit Sub
    Dim btn As Long
    btn = GetBtnSettings(dlgDoctorTasdeed)
    dlgDoctorTasdeed.btnSettings = btn
    ' here to go
    ' Iyad's form
    RefreshCommands btn, dlgDoctorTasdeed
    dlgDoctorTasdeed.btnSettings = GetBtnSettings(dlgDoctorTasdeed)
End Sub

Private Sub dlgDoctorTasdeed_OnSave(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, cancel As Boolean)
    theGrid.Tag = ";typeof=vsflexgrid;datafield=,1:dt,2:py,3:tid,6:Note," & _
                  ";check=,1:required,2:required,3:required,;check=,1:date,;" & _
                  "HiddenColumns=,0:true,4:true,;MasterValues=,0:25,;sort=,1:asc,;"
    dlgDoctorTasdeed_Editing = False
End Sub

Private Sub dlgDoctorTasdeed_OnSaveCanceled(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = True
    
    theGrid.Tag = ";typeof=vsflexgrid;datafield=,0:di,1:dt,2:py,3:tid,4:id,5:Isal,6:Note," & _
                  ";check=,1:required,2:required,3:required,;check=,1:date,;" & _
                  "HiddenColumns=,0:true,4:true,;MasterValues=,0:25,;sort=,1:asc,;"
    dlgDoctorTasdeed_Editing = False
                  
End Sub

Private Sub dlgDoctorTasdeed_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    
    Dim c As Boolean
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = True
    If dlgDoctorTasdeed.SaveAfterWhat = ST_ADDNEW Then
        Set rs = ExecuteSelect(Conn, dlgDoctorTasdeed.sql, c)
        rs.MoveLast
        rs.Move 0
        theGrid.Cell(flexcpText, theGrid.Rows - 1, theGrid.Cols - 2) = rs!Isal
    End If
    
    theGrid.Tag = ";typeof=vsflexgrid;datafield=,0:di,1:dt,2:py,3:tid,4:id,5:Isal,6:Note," & _
                  ";check=,1:required,2:required,3:required,;check=,1:date,;" & _
                  "HiddenColumns=,0:true,4:true,;MasterValues=,0:25,;sort=,1:asc,;"
                  
    dlgDoctorTasdeed_Editing = False
End Sub

Private Sub dlgDoctorTasdeed_OnSearch(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, Filter As String, DefaultType As Integer)
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = True
End Sub

Private Sub dlgDoctorTasdeed_OnSearchBegin(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = False
End Sub

Private Sub dlgDoctorTasdeed_OnSearchCanceled(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = True
End Sub

Private Sub dlgDoctorTasdeed_OnSerachCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = True
End Sub

Private Sub dlgDoctorTasdeed_OnUpdate(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    dlgDoctorTasdeed.cmdCustomButton(0).Enabled = False
End Sub

Private Sub dlgZones_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = Col = 0
End Sub

Private Sub dlgZones_OnBeforeRemoveHiddenFieldWhenSave(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim hiddens As String
    hiddens = GetTagValue(theGrid.Tag, "HiddenColumns")
    hiddens = SetTagValue(hiddens, "0", "true", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "HiddenColumns", hiddens)
End Sub

Private Sub dlgZones_OnSaveCanceled(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim hiddens As String
    hiddens = GetTagValue(theGrid.Tag, "HiddenColumns")
    hiddens = SetTagValue(hiddens, "0", "false", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "HiddenColumns", hiddens)
End Sub

Private Sub dlgZones_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 0) = rs!id
    Dim hiddens As String
    hiddens = GetTagValue(theGrid.Tag, "HiddenColumns")
    hiddens = SetTagValue(hiddens, "0", "false", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "HiddenColumns", hiddens)
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Default"
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 11205
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
     cmbCollaborative_Position.ListIndex = -1
    '<AHMAD Build 1.000.003>
    'If Current_State.id = 1 Then '—Ì› œ„‘ﬁ
    '    lblTranformation.visible = False
    '    lblFrom.visible = False
    '    lblTo.visible = False
    '    txtFrom.visible = False
    '    txtTo.visible = False
    'End If
    '</AHMAD Build 1.000.003>
    
    FormatForm Me
    Set master = New Controller
    'master.TraceChanges = True
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
   
    Dim cancel As Boolean
    Dim strSQL As String
    strSQL = "Set DateFormat DMY SELECT * FROM [Doctor_CV]"
    Set master.rs = ExecuteSelect(Conn, strSQL, cancel)
    If master.rs.RecordCount = 0 Then
        enableButtons False
    End If
    InitFrame
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    '<AHMAD>
        isZoneSelected = True
    '</AHMAD>
  
    Set_ControlPermission
End Sub

Private Sub InitFrame()
    ' Fill Gender combobox
    CGender.AddItem "√‰ÀÏ"
    CGender.ItemData(0) = 0
    CGender.AddItem "–ﬂ—"
    CGender.ItemData(1) = 1
    
    ' Fill Council Position combobo
    CPos.AddItem "—∆Ì” «·›—⁄"
    CPos.ItemData(0) = 0
    CPos.AddItem "√„Ì‰ «·”—"
    CPos.ItemData(1) = 1
    CPos.AddItem "«·Œ«“‰"
    CPos.ItemData(2) = 2
    CPos.AddItem "⁄÷Ê"
    CPos.ItemData(3) = 3
    CPos.AddItem "⁄÷Ê „ „„"
    CPos.ItemData(4) = 4
    CPos.AddItem "⁄÷Ê ÂÌ∆… ›—⁄"
    CPos.ItemData(5) = 5
    '<AHMAD>
    cmbCollaborative_Position.AddItem "—∆Ì” „Ã·” ≈œ«—… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
    cmbCollaborative_Position.ItemData(0) = 0
    cmbCollaborative_Position.AddItem "√„Ì‰ «·”— «·‰Ÿ«„ «· ⁄«Ê‰Ì"
    cmbCollaborative_Position.ItemData(1) = 1
    cmbCollaborative_Position.AddItem "Œ«“‰ «·‰Ÿ«„ «· ⁄«Ê‰Ì"
    cmbCollaborative_Position.ItemData(2) = 2
    cmbCollaborative_Position.AddItem "⁄÷Ê „Ã·” ≈œ«—… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
    cmbCollaborative_Position.ItemData(3) = 3
    cmbCollaborative_Position.AddItem "⁄÷Ê „ „„  ⁄«Ê‰Ì"
    cmbCollaborative_Position.ItemData(4) = 4
    cmbCollaborative_Position.AddItem "⁄÷Ê ÂÌ∆… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
    cmbCollaborative_Position.ItemData(5) = 5
    '</AHMAD>
    
    ' Fill Hezb combobox
    fillCmb CHezb, "select Hezb_ID as ID, Hezb_Name as Name from FixHezb"
    
    ' Fill Nationality combobox
    fillCmb CNationality, "select Nationality_ID as ID, Nationality as Name , Case when Nationality like '%”Ê—Ì%' then 0 else 1 end as Sort_field  from FixNationality order by Sort_Field"
    
    ' Fill CertificationLevel combobox
    fillCmb CCertificationLevel, "select Level_ID as ID, Level_Name as Name from FixCertificationLevel"
    
    ' Fill CertificationField combobox
    fillCmb CField, "select Field_ID as ID, Field_Name as Name from FixCertificationField"
    
    ' Fill CurrentStatus combobox
    fillCmb CCurrentStatus, "select Status_ID as ID, Status_Name as Name from FixStatus"
    
    ' Initialize Default Date values (setting tag value new="[?Now]")
    ' also initialize Default values for comboboxes (setting tag value new="[?1st Item]")
    Dim ctrl As Control
    For Each ctrl In Controls
        If (TypeOf ctrl Is Menu) = False Then
            If TypeOf ctrl.Container Is frame Then
                If ctrl.Container = masterFrame Then
                    If TypeOf ctrl Is DTPicker Then
                        Dim strDataField As String
                        strDataField = Trim(ctrl.datafield)
                        If strDataField <> "" Then
                            'ctrl.tag = SetTagValue(ctrl.tag, "new", CStr(Date))
                            ctrl.Tag = SetTagValue(ctrl.Tag, "new", "")
                        End If
                    ElseIf TypeOf ctrl Is ComboBox Then
    '                    Dim cb As ComboBox
    '                    Set cb = ctrl
    '                    If cb.ListCount > 0 Then
    '                        cb.tag = SetTagValue(cb.tag, "new", cb.ItemData(0))
    '                    End If
                    End If
                End If
            End If
        End If
    Next
    
    Dim cancel As Boolean
    Dim sql As String
    sql = "select top 1 Id from docdbaccm.dbo.TasdeedDecision order by Since desc"
    Set rsTasdeed = ExecuteSelect(Conn, sql, cancel)
    If rsTasdeed.RecordCount = 0 Then
        Set rsTasdeed = Nothing
    Else
        Dim D As Integer
        D = rsTasdeed!id
        sql = "SELECT * FROM docdbaccm.dbo.vTasdeedDecisionsStates WHERE Decision = " & D
        Set rsTasdeed = ExecuteSelect(Conn, sql, cancel)
    End If
    Set rsBranches = ExecuteSelect(Conn, "SELECT * FROM Branch", cancel)
  
End Sub
Private Sub Set_ControlPermission()
    CNewPay.Enabled = Get_Permission("TasdeedFees")
    CWath.Enabled = Get_Permission("docDocument")
    cmdCollaborative.Enabled = Get_Permission("collaborateSys")
     If (Get_Permission("LockDoctor_CV") = False) Then
        btnSettings = btall - btNew - btUpdate - btDelete - btsave - btCancel - btSearchCancel - btSearchExec
        RefreshCommands btnSettings And FormSettings
        CTmpTer.Enabled = False
        CMove.Enabled = False
        CStop.Enabled = False
        cmdElectList.Enabled = False
        
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
    Dim isVertical As Boolean
    Dim W As Single
    For Each ctrl In Me.Controls
        If Not TypeOf ctrl Is Menu Then
            If TypeOf ctrl Is Line Then
                isVertical = (ctrl.x1 = ctrl.X2)
                If isVertical Then
                    ctrl.x1 = ctrl.x1 * Alpha
                    ctrl.X2 = ctrl.x1
                Else
                    W = Alpha * (ctrl.X2 - ctrl.x1)
                    ctrl.x1 = ctrl.x1 * Alpha
                    ctrl.X2 = ctrl.x1 + W
                End If
            Else
                ctrl.Left = ctrl.Left * Alpha
                ctrl.Width = ctrl.Width * Alpha
            End If
        End If
    Next
    oldScaleWidth = ScaleWidth
    Set_ControlPermission
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    ' Disable Command Buttons
    enableButtons False
    
    ' Setting Default values
    ' CollaborativeSystemMembership field
    LblCollaborativeMember.Caption = "€Ì— „‰ ”» ··‰Ÿ«„ «· ⁄«Ê‰Ì"
    LblCollaborativeMember.ForeColor = &H8080FF
        
    ' University field
    TUniversityID.text = ""
    TColegeName.text = "€Ì— „Õœœ"
    TCity.text = "€Ì— „Õœœ"
    TCountry.text = "€Ì— „Õœœ"
    
    ' Reset selectedZone field
    isZoneSelected = False
    selectedZone = -1
    TDevisionID.text = ""
    TDevision.text = ""
    TZone.text = ""
    
    ' <AHMAD>
    ' Rest Transformation fields
    txtFrom.text = ""
    txtTo.text = ""
    txtGoto.Enabled = False
    cmdGoto.Enabled = False
    CHezb.text = "ÕÌ«œÌ"
    CField.text = "»œÊ‰ «Œ ’«’"
    CNationality.text = "⁄—»Ì ”Ê—Ì"
    CCurrentStatus.text = "„” „—"
    
    ' </AHMAD>
    ImgPicture.Picture = LoadPicture("")
    TNum.SetFocus
    
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    'CZoneHelp.visible = False
    'CDevisionHelp.visible = False
     '<AHMAD>
        txtGoto.Enabled = False
        cmdGoto.Enabled = False
        cmbCollaborative_Position.Enabled = True
        CPos.Enabled = True
    '</AHMAD>
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    Dim min As Integer
    min = 0
    If rs.RecordCount = 0 Then Exit Sub
    If rs.status And adAddNew Then min = 1
    If rs.RecordCount = min Then Exit Sub
    If IsNull(rs!Doctor_ID) Then Exit Sub
     '<AHMAD>
        txtGoto.Enabled = True
        cmdGoto.Enabled = True
    '</AHMAD>
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    'CZoneHelp.visible = True
    'CDevisionHelp.visible = True
     '<AHMAD>
        txtGoto.Enabled = True
        cmdGoto.Enabled = True
'        If CPosCh.Value = 0 Then
'            CPos.ListIndex = -1
'        End If
'        If chkIsCollaborative_Council_Member.Value = 0 Then
'            cmbCollaborative_Position = -1
'        End If
       
    '</AHMAD>
End Sub

Private Sub master_doCancelSearchComplete(rs As ADODB.Recordset)
     cmbCollaborative_Position.Enabled = chkIsCollaborative_Council_Member.Value = 1
     CPos.Enabled = CPosCh = 1
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    enableButtons True
    
    CPay.Caption = Replace(CPay.Caption, "*", "")
    Label1(34).Caption = Replace(Label1(34).Caption, "*", "")

    ' Load CollaborativeSystemMembership field
    LoadCollaborativeSystemMembershipInfo rs

    LblAccountNo.Caption = CStr(270000 + rs!Doctor_ID)

    If IsNull(rs!Council_Position) Then
        CPos.Enabled = False
        CPos.BackColor = &H80000000
    End If
    
    Dim Error As Boolean

    ' Load University fields
    If IsNull(rs!University_Id) Then
        TColegeName.text = "€Ì— „Õœœ"
        TCity.text = "€Ì— „Õœœ"
        TCountry.text = "€Ì— „Õœœ"
    Else
        Dim rsUniversity As ADODB.Recordset
        Dim SqlUniversity As String
        SqlUniversity = "SELECT University AS name, City AS city, Country AS country " & _
                        "From FixUniversity WHERE University_Id = " & rs!University_Id
        Set rsUniversity = ExecuteSelect(Conn, SqlUniversity, Error)
        rsUniversity.MoveFirst
        TColegeName.text = rsUniversity!name
        TCity.text = rsUniversity!city
        TCountry.text = rsUniversity!Country
    End If

    ' Load selectedZone, isZoneSelected & Devidion fields
    If IsNull(rs!devision_id) Then
        isZoneSelected = False
        selectedZone = -1
        TZone.text = ""
        TDevision.text = ""
    Else
        isZoneSelected = True
        Dim rsDevisionZone As ADODB.Recordset
        Dim SqlDevisionZone As String
        SqlDevisionZone = "SELECT Devision_Name as name, FixZone.Zone_ID as zoneId, Zone_Name as zone From  FixZone " & _
                          "Inner Join FixDevision On FixDevision.Zone_ID = FixZone.Zone_ID " & _
                          "Where Devision_ID = " & rs!devision_id
        Set rsDevisionZone = ExecuteSelect(Conn, SqlDevisionZone, Error)
        rsDevisionZone.MoveFirst
        selectedZone = rsDevisionZone!zoneId
        TZone.text = rsDevisionZone!Zone
        TDevision.text = rsDevisionZone!name
    End If

    Load_Picture
    
    ' Load last transition
    Dim sqlTransition As String
    Dim rsTransition As ADODB.Recordset
    sqlTransition = "SELECT Top 2 [To_Branch] From DoctorTransition "
    sqlTransition = sqlTransition & vbCrLf & "WHERE Doctor_Id = " & rs!Doctor_ID
    sqlTransition = sqlTransition & vbCrLf & "order by On_Date DESC"
    Set rsTransition = ExecuteSelect(Conn, sqlTransition, Error)
    If rsTransition.RecordCount > 0 Then
        rsTransition.MoveFirst
        rsBranches.Filter = "Id = " & rsTransition!To_Branch
        txtTo.text = rsBranches!branch
        If rsTransition.RecordCount > 1 Then
            rsTransition.MoveNext
            rsBranches.Filter = "Id = " & rsTransition!To_Branch
            txtFrom.text = rsBranches!branch
        Else
            rsBranches.Filter = "Id = " & rs!original_branch_id
            txtFrom.text = rsBranches!branch
        End If
    Else
        txtFrom.text = ""
        txtTo.text = ""
    End If
    
  'TNum.SetFocus = True

End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    Dim msg As VbMsgBoxResult
    msg = MsgBox("Â· √‰  „ √ﬂœ √‰ﬂ  —Ìœ ÿ»«⁄… ‘«‘… «·–« Ì… ﬂ„« ŸÂ— √„«„ﬂ", vbQuestion + vbYesNo, "”ƒ«·")
    If msg <> vbYes Then Exit Sub
    If Printer.PaperSize = vbPRPSA4 Then
        Printer.Orientation = 2
    End If
    Me.PrintForm
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    enableButtons True
     '<AHMAD>
        txtGoto.Enabled = True
        cmdGoto.Enabled = True
    '</AHMAD>
    '<Ashraf>
    LblAccountNo.Caption = str(270000 + rs!Doctor_ID)
    '</Ashraf>
End Sub

Public Sub OnSqlSelected(ByRef dialogForm As dlgSqlSelect)
    If dialogForm.master.rs.RecordCount = 0 Or dialogForm.master.rs.EOF Then
        Exit Sub
    End If
    Select Case dialogForm.FrameCaption
        Case "«·Ã«„⁄« "
            TColegeName.text = dialogForm.master.rs!name
            TCity.text = dialogForm.master.rs!city
            TCountry.text = dialogForm.master.rs!Country
            TUniversityID.text = dialogForm.master.rs!id
        Case "«·‘⁄»"
            If oldZone = dialogForm.master.rs!name Then Exit Sub
            isZoneSelected = True
            selectedZone = dialogForm.master.rs!id
            TZone.text = dialogForm.master.rs!name
            TDevision.text = ""
            TDevisionID.text = ""
        Case "«·„‰«ÿﬁ"
            TDevision.text = dialogForm.master.rs!name
            TDevisionID.text = dialogForm.master.rs!id
            TZone.text = dialogForm.master.rs!Zone_Name
            selectedZone = TZone.text = dialogForm.master.rs!Zone
            isZoneSelected = True
            'SelectZone
        Case "ÊÀ«∆ﬁ «·√ÿ»«¡"
        Case " ”œÌœ «·—”Ê„"
        Case "«· —«ŒÌ’ «·„ƒﬁ …"
            Exit Sub
        Case Else
            MsgBox "Œÿ√  ﬁ‰Ì  ”»» ›Ì ≈ŸÂ«— „—»⁄ «·«Œ Ì«— »œÊ‰ „⁄«·Ã… «·ﬁÌ„… «·„Œ «—…"
    End Select
End Sub

Public Sub LoadCollaborativeSystemMembershipInfo(ByRef rs As ADODB.Recordset)

    Dim isIn As Boolean
    Dim rsIsIn As ADODB.Recordset
    Dim cancel As Boolean
    Set rsIsIn = ExecuteSelect(Conn, "SELECT dbo.sf_IsActive_Collaborative_Doctor(" & master.rs!Doctor_ID & ")", cancel)
    If rsIsIn.RecordCount = 0 Then Exit Sub
    rsIsIn.MoveFirst
    isIn = rsIsIn.Fields(0)
    If isIn Then
        LblCollaborativeMember.Caption = "ÿ»Ì»  ⁄«Ê‰Ì: "
        LblCollaborativeMember.ForeColor = &HFF00FF
    Else
        LblCollaborativeMember.Caption = "ÿ»Ì» €Ì—  ⁄«Ê‰Ì: "
        If rs!IsCollaborative_Member = 1 Then
            LblCollaborativeMember.Caption = LblCollaborativeMember.Caption & "„‰ ”» Ê·ﬂ‰ «‘ —«ﬂÂ „ Êﬁ›° "
        End If
        LblCollaborativeMember.ForeColor = &H8080FF
    End If
    Dim msg As String
    If rs!IsCollaborative_Member = 0 Then
        msg = "·„ Ì ﬁœ„ »ÿ·» «‰ ”«» Õ Ï «·¬‰."
    Else
        msg = "«·—ﬁ„ «· ⁄«Ê‰Ì: " & rs!Doctor_ID
        msg = msg & " Ê—ﬁ„ «·«‰ ”«»: " & rs!Collaborative_Membership_No
        msg = msg & " Ê «—ÌŒÂ: " & rs!Collaborative_Membership_Date
        If Not IsNull(rs!Collaborative_Suspend_Date) Then
            msg = msg & " Ê «—ÌŒ «·≈Ìﬁ«›: " & rs!Collaborative_Suspend_Date
        End If
        If Not IsNull(rs!Collaborative_Resume_Date) Then
            msg = msg & " Ê «—ÌŒ «·«” ∆‰«›: " & rs!Collaborative_Resume_Date
        End If
        msg = msg & "."
    End If
    LblCollaborativeMember.ToolTipText = msg
    LblCollaborativeMember.Caption = LblCollaborativeMember.Caption & msg
End Sub

Public Sub SetDoctorBranch(ByVal brId As Integer, Alert As Boolean)
    If IsNull(master.rs!original_branch_id) Or (master.rs!original_branch_id <> brId) Then
        Dim choice As VbMsgBoxResult
        choice = vbOK
        If Alert Then
            choice = MsgBox("·ﬁœ ﬁ„  » ⁄œÌ· «·›—⁄ «·√’·Ì ··ÿ»Ì»° Â·  —Ìœ Õ›Ÿ Â– «· ⁄œÌ·ø", vbOKCancel Or vbQuestion Or vbMsgBoxRtlReading Or vbMsgBoxRight, "Õ›Ÿ")
        End If
        If choice = vbOK Then
            master.rs!original_branch_id = brId
        End If
    End If
End Sub

Private Sub enableButtons(enable As Boolean)
    CMove.Enabled = enable
    CWath.Enabled = enable
    cmdCollaborative.Enabled = enable
    CNewPay.Enabled = enable
    CTmpTer.Enabled = enable
    CStop.Enabled = enable
    CPicAdd.Enabled = enable
    
    Set_ControlPermission
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    KeepState = True
    msg = " √ﬂ¯œ „‰ ⁄œ„ ÊÃÊœ ÿ»Ì» ·Â «·—ﬁ„ «·–« Ì ‰›”Â."
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
'    S = ""
'    DefaultType = 1
     '<AHMAD>
        txtGoto.Enabled = False
        cmdGoto.Enabled = False
        
    '</AHMAD>
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
     '<AHMAD>
        txtGoto.Enabled = True
        cmdGoto.Enabled = True
        cmbCollaborative_Position.Enabled = CPosCh.Value = 1
        CPos.Enabled = chkIsCollaborative_Council_Member.Value = 1
    '</AHMAD>
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    '<AHMAD>
        txtGoto.Enabled = False
        cmdGoto.Enabled = False
    '</AHMAD>
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim sql As String
    Dim cancel As Boolean
    Dim rsCheck As New ADODB.Recordset
    Dim count As Integer
    Dim max As Integer
    'Check Consistency Of Dates
    If (dtBirthDate.Value >= dtCyndicateRegistrationDate.Value) Then
        checkType = True
        msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ «·Ê·«œ… ﬁ»·  «—ÌŒ «·≈‰ ”«» ··‰ﬁ«»… "
       ' Exit Sub
    End If
    If (dtBirthDate.Value >= dtCertificationDate.Value) Then  'Or (year(dtBirthDate.Value) >= year(CDate(TYearOut.text))) Then
        checkType = True
        msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ «·Ê·«œ… ﬁ»·  «—ÌŒ «·‘Â«œ…"
        'Exit Sub
    End If
    If (year(dtBirthDate.Value) >= val(TYearOut.text)) Then
        checkType = True
        msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ «·Ê·«œ… ﬁ»·  «—ÌŒ «· Œ—Ã"
       ' Exit Sub
    End If
    If dtBirthDate.Value >= dtIdentificationCardDate.Value Then
        checkType = True
        msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ «·Ê·«œ… ﬁ»·  «—ÌŒ «·ÂÊÌ…"
       ' Exit Sub
    End If
    '<AHMAD>
    '    msg = "ÌÃ»  ÕœÌœ Õﬁ· «·‘⁄»… ›Ì Õ«·  ÕœÌœ «·„‰ÿﬁ…° Ê≈·« ·‰ Ì „ Õ›Ÿ «·„‰ÿﬁ… «·„Œ «—…."
    '    checkType = (TDevisionID.text = "" And selectedZone <> -1)
        Select Case ctrl.name
        Case "TDevision"
            msg = "ÌÃ»  ÕœÌœ Õﬁ· «·‘⁄»… ›Ì Õ«·  ÕœÌœ «·„‰ÿﬁ…° Ê≈·« ·‰ Ì „ Õ›Ÿ «·„‰ÿﬁ… «·„Œ «—…."
            checkType = (TDevisionID.text = "" And selectedZone <> -1)
        Case "CPos"
            If (master.state = ST_ADDNEW Or master.state = ST_UPDATE) And CPosCh.Value = 1 Then
                'And CStr(CPos.ListIndex) Like "[0-2]" Then
                sql = " select count(*) from Doctor_CV where Council_Position = " & CPos.ListIndex
                
                If master.state = ST_UPDATE Then
                        sql = sql + " and Doctor_ID <> " & master.rs!Doctor_ID
                End If
                
                Set rsCheck = ExecuteSelect(Conn, sql, cancel)
                If cancel Then
                    checkType = True
                    msg = "ÌÃ» Õ›Ÿ «·–« Ì… √Ê·« À„ ≈÷«›… «·Õ«·… «·‰ﬁ«»Ì…"
                   Exit Sub
                End If
                If CPos.ListIndex <= 2 Or (CPos.ListIndex > 5 And CPos.ListIndex <= 8) Then
                    max = 1
                ElseIf CPos.ListIndex = 3 Or CPos.ListIndex = 9 Then
                    max = 4
                Else
                    max = 0
                End If
                    count = rsCheck.Fields(0).Value
                    checkType = (max > 0) And (count >= max)
                    msg = "Â–« «·„‰’» „ÊÃÊœ „”»ﬁ« ›Ì «·„Ã·” ° «·—Ã«¡  €ÌÌ—Â"
            End If
            Case "cmbCollaborative_Position"
                If (master.state = ST_ADDNEW Or master.state = ST_UPDATE) And chkIsCollaborative_Council_Member.Value = 1 Then
                     
                    sql = " select count(*) from Doctor_CV where Collaborative_Council_Position = " & _
                            cmbCollaborative_Position.ListIndex
                    
                    If master.state = ST_UPDATE Then
                            sql = sql + " and Doctor_ID <> " & master.rs!Doctor_ID
                    End If
                    
                    Set rsCheck = ExecuteSelect(Conn, sql, cancel)
                    
                    
                    If cmbCollaborative_Position.ListIndex <= 2 Then
                        max = 1
                    ElseIf cmbCollaborative_Position.ListIndex = 3 Then
                        max = 4
                    Else
                        max = 0
                    End If
                    
                    count = rsCheck.Fields(0).Value
                    checkType = (max > 0) And (count >= max)
                    msg = "Â–« «·„‰’» „ÊÃÊœ „”»ﬁ« ›Ì «·„Ã·” «· ⁄«Ê‰Ì° «·—Ã«¡  €ÌÌ—Â"
                    
                End If
        Case "TNumTer"
             If TNumTer.text = "" And Not IsNull(dtLicenseDate.Value) Then
                msg = " ÌÃ» ≈œŒ«· —ﬁ„ ﬁ—«— «· —ŒÌ’ «·œ«∆„ ≈–« ﬁ„  » ›⁄Ì· Œ«‰…  «—ÌŒ «· —ŒÌ’ «·œ«∆„"
                checkType = True
             End If
        End Select
    '</AHMAD>
    
End Sub

Public Sub SetTaxId(ByVal TaxId As Integer, ByVal isSyrian As Boolean)
    Dim theGrid As VSFlexGrid
    Set theGrid = dlgDoctorTasdeed.fg
    Dim Row As Long
    Row = theGrid.Row
    rsTasdeed.Filter = "Tax_ID = " & TaxId
    theGrid.TextMatrix(Row, 2) = rsTasdeed!Total
    theGrid.TextMatrix(Row, 3) = rsTasdeed!Tax_ID
    theGrid.TextMatrix(Row, 6) = rsTasdeed!Syrian
End Sub

Private Sub ReflectSuspendStatus(rsSuspend As ADODB.Recordset)
        If rsSuspend.RecordCount = 1 Then
                Dim R As Long
                TNumStop1.text = CStr(rsSuspend!sn)
                master.rs!Suspend_Registration_No = rsSuspend!sn
                dtSuspendRegistrationDate.text = CStr(rsSuspend!sd)
                master.rs!Suspend_Registration_Date = rsSuspend!sd
                If Not IsNull(rsSuspend!rn) Then
                    TNumRet1.text = CStr(rsSuspend!rn)
                Else
                    TNumRet1.text = ""
                End If
                master.rs!Resume_Registration_No = rsSuspend!rn
                If Not IsNull(rsSuspend!rn) Then
                    dtResumeRegistrationDate.text = CStr(rsSuspend!rd)
                Else
                    dtResumeRegistrationDate.text = ""
                End If
                master.rs!Resume_Registration_Date = rsSuspend!rd
        Else
                TNumStop1.text = ""
                master.rs!Suspend_Registration_No = Null
                dtSuspendRegistrationDate.text = ""
                master.rs!Suspend_Registration_Date = Null
                TNumRet1.text = ""
                master.rs!Resume_Registration_No = Null
                dtResumeRegistrationDate.text = ""
                master.rs!Resume_Registration_Date = Null
        End If
        If dlgDoctorSuspend.DataChanged = True Then
            Dim msg As VbMsgBoxResult
            msg = MsgBox("Â·  —Ìœ  €ÌÌ— Œ«‰… «·Ê÷⁄ «·—«Â‰ √ Ê„« ÌﬂÌ« Õ”» ¬Œ—  —ﬁÌ‰ ﬁÌœ √Ê ≈⁄«œ…  ”ÃÌ·ø", vbQuestion + vbYesNo, "”ƒ«·")
            If (msg = vbYes) Then
                 UpdateCurrentStatus
            End If
        End If
        ' save changes
        master.rs.Move 0
End Sub

Private Sub mnuPayments_Click()
    If CNewPay.Enabled = False Then Exit Sub
    CNewPay_Click
End Sub

Private Sub TBirthPlace_GotFocus()
    SelectTextInTextEdit TBirthPlace
End Sub

Private Sub TDevision_Change()
    isZoneSelected = False
    If TDevision.text = "" Then TZone.text = ""
End Sub

Private Sub TDevision_GotFocus()
    SelectTextInTextEdit TDevision
End Sub

Private Sub TDevision_KeyPress(KeyAscii As Integer)
If (master.state And ST_SEARCH) <> 0 Then Exit Sub
    If KeyAscii = vbKeyReturn Then
        SelectDevision
    End If
End Sub

Private Sub TDevision_LostFocus()
'    If (master.State And ST_SEARCH) <> 0 And Trim(TDevision.text) = "" Then Exit Sub
'    SelectDevision
End Sub

Private Sub TDevision_Validate(cancel As Boolean)
    If (master.state And ST_SEARCH) <> 0 And TDevision.text = "" Then Exit Sub
    SelectDevision
End Sub

Private Sub TEmail_GotFocus()
    SelectTextInTextEdit TEmail
End Sub

Private Sub TFName_GotFocus()
    SelectTextInTextEdit TFName
End Sub

Private Sub THealthNum_GotFocus()
    SelectTextInTextEdit THealthNum
End Sub

Private Sub THomeLoc_GotFocus()
    SelectTextInTextEdit THomeLoc
End Sub

Private Sub THomeTel_GotFocus()
    SelectTextInTextEdit THomeTel
End Sub

Private Sub TKaid_GotFocus()
    SelectTextInTextEdit TKaid
End Sub

Private Sub TLName_GotFocus()
    SelectTextInTextEdit TLName
End Sub

Private Sub TMName_GotFocus()
    SelectTextInTextEdit TMName
End Sub

Private Sub TMob_GotFocus()
    SelectTextInTextEdit TMob
End Sub

Private Sub TName_GotFocus()
    SelectTextInTextEdit TName
    
End Sub

Private Sub TNum_GotFocus()
    SelectTextInTextEdit TNum
End Sub

Public Sub SelectTextInTextEdit(ByRef txtCtrl As TextBox)
    txtCtrl.SelStart = 0
    txtCtrl.SelLength = Len(txtCtrl.text)
End Sub

Private Sub TNumH_GotFocus()
    SelectTextInTextEdit TNumH
End Sub

Private Sub TNumIn_GotFocus()
    SelectTextInTextEdit TNumIn
End Sub

Private Sub TNumSer_GotFocus()
    SelectTextInTextEdit TNumSer
End Sub

Private Sub TNumTer_GotFocus()
    SelectTextInTextEdit TNumTer
End Sub

Private Sub TworkLoc_GotFocus()
    SelectTextInTextEdit TworkLoc
End Sub

Private Sub TWorkTel_GotFocus()
    SelectTextInTextEdit TWorkTel
End Sub

Private Sub txtGoto_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
    If KeyAscii = 13 Then cmdGoto_Click
End Sub

Private Sub TYearOut_GotFocus()
    SelectTextInTextEdit TYearOut
End Sub

Private Sub TYearOut_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub TZone_GotFocus()
    SelectTextInTextEdit TZone
End Sub

Private Sub TZone_KeyPress(KeyAscii As Integer)
'    If (master.State And ST_SEARCH) <> 0 Then Exit Sub
'    If KeyAscii = vbKeyReturn Then
'        SelectZone
'    End If
End Sub

Private Sub TZone_LostFocus()
'    If (master.State And ST_SEARCH) <> 0 Then Exit Sub
'    If Trim(TZone.text) = "" Then Exit Sub
'    SelectZone
End Sub

Private Sub SelectZone()
    Dim rsZone As ADODB.Recordset
    Dim SqlZone As String
    Dim Error As Boolean
    SqlZone = "SELECT Zone_ID, Zone_Name FROM FixZone"
    If IsNumeric(TZone.text) Then
        SqlZone = SqlZone & vbCrLf & "WHERE Zone_Id = " & TZone.text
    Else
        SqlZone = SqlZone & vbCrLf & "WHERE Zone_Name LIKE '%" & TZone.text & "%'"
    End If
    Set rsZone = ExecuteSelect(Conn, SqlZone, Error)
    If rsZone.RecordCount = 1 Then
        rsZone.MoveFirst
        oldZone = selectedZone
        selectedZone = rsZone!Zone_id
        TZone.text = rsZone!Zone_Name
'        If selectedZone <> oldZone Then
'            TDevision.text = ""
'            TDevisionID.text = ""
'        End If
        isZoneSelected = True
    Else
        TZone.text = ""
        CZoneHelp_Click
    End If
End Sub

Private Sub SelectDevision()
'    If Not isZoneSelected Then
'        MsgBox "⁄·Ìﬂ «Œ Ì«— «·‘⁄»… √Ê·«", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·„‰ÿﬁ…"
'        Exit Sub
'    End If
    '<AHMAD>
        'If isZoneSelected Or Not IsNull(master.rs!devision_id) Then Exit Sub
        If master.rs.RecordCount = 0 And master.state <> ST_ADDNEW Then Exit Sub
        If isZoneSelected Then Exit Sub
    '</AHMAD>
    Dim rsDevision As ADODB.Recordset
    Dim SqlDevision As String
    Dim Error As Boolean
    'SqlDevision = "SELECT Devision_Id, Devision_Name FROM FixDevision WHERE Zone_Id = " & selectedZone
    SqlDevision = "SELECT Devision_Id, Devision_Name,Zone_Name,Zone_Name,Z.Zone_ID FROM FixDevision d,FixZone z  WHERE z.zone_id = d.zone_id "
    If IsNumeric(TDevision.text) Then
        SqlDevision = SqlDevision & vbCrLf & "AND Devision_Id = " & TDevision.text
    Else
        SqlDevision = SqlDevision & vbCrLf & "AND Devision_Name LIKE '%" & TDevision.text & "%'"
    End If
    Set rsDevision = ExecuteSelect(Conn, SqlDevision & " order by 1", Error)
    If rsDevision.RecordCount = 1 Then
        rsDevision.MoveFirst
        TDevision.text = rsDevision!Devision_Name
        TDevisionID.text = rsDevision!devision_id
        TZone.text = rsDevision!Zone_Name
        selectedZone = rsDevision!Zone_id
        isZoneSelected = True
        CZoneHelp.visible = False
    Else
        CDevisionHelp_Click
        'CZoneHelp.visible = True
    End If
End Sub

Private Sub UpdateCurrentStatus()
    Dim status As String
    If IsNull(master.rs!Suspend_Registration_Date) Then
        status = "„” „—"
    ElseIf IsNull(master.rs!Resume_Registration_Date) Then
        status = "„—ﬁ‰ ﬁÌœÂ"
    Else
        status = "„” „—"
    End If
    Dim rsStatus As ADODB.Recordset
    Dim Error As Boolean
    Set rsStatus = ExecuteSelect(Conn, "select Status_Id from FixStatus where Status_Name like '" + status + "'", Error)
    If rsStatus.RecordCount > 0 Then
        master.rs!Current_Status_Id = rsStatus!Status_ID
    End If
End Sub
