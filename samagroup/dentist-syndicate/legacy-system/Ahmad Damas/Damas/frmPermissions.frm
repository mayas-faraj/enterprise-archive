VERSION 5.00
Begin VB.Form frmPermissions 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… „” Œœ„"
   ClientHeight    =   9930
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11475
   Icon            =   "frmPermissions.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   9930
   ScaleWidth      =   11475
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   9675
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   45
      Width           =   11370
      Begin VB.CheckBox chkSignature 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ÊﬁÌ⁄ «·√—»«⁄"
         DataField       =   "quarterSignature"
         Height          =   375
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   63
         Top             =   7440
         Width           =   1215
      End
      Begin VB.CheckBox Check5 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "Õ”„ «·≈Õ«·… «·≈÷«›Ì"
         DataField       =   "Ihaleh_Nesab"
         Height          =   255
         Left            =   530
         RightToLeft     =   -1  'True
         TabIndex        =   62
         Top             =   6360
         Width           =   1080
      End
      Begin VB.CheckBox chNezamReports 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ﬁ«—Ì— «·‰Ÿ«„ «· ⁄«Ê‰Ì"
         DataField       =   "NezamReports"
         Height          =   255
         Left            =   600
         RightToLeft     =   -1  'True
         TabIndex        =   61
         Top             =   7440
         Width           =   1815
      End
      Begin VB.CheckBox chUpdateDoc 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ⁄œÌ· «·–« Ì…"
         DataField       =   "LockDoctor_CV"
         Height          =   375
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   60
         Top             =   7800
         Width           =   1230
      End
      Begin VB.CheckBox chDocuments 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ÊÀ«∆ﬁ"
         DataField       =   "docDocument"
         Height          =   375
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   59
         Top             =   8160
         Width           =   1095
      End
      Begin VB.CheckBox chPayed 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ”œÌœ «·—”Ê„"
         DataField       =   "TasdeedFees"
         Height          =   375
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   58
         Top             =   8160
         Width           =   1230
      End
      Begin VB.CheckBox chCollaborate 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "‰Ÿ«„  ⁄«Ê‰Ì"
         DataField       =   "collaborateSys"
         Height          =   375
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   57
         Top             =   7800
         Width           =   1200
      End
      Begin VB.CheckBox chLockCV 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈ﬁ›«· «·–« Ì…"
         DataField       =   "CloseDoctor_CV"
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         TabIndex        =   56
         Top             =   7440
         Width           =   1215
      End
      Begin VB.CheckBox chSend 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "”Ã· ’«œ—"
         DataField       =   "SendRecord"
         Height          =   375
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   55
         Top             =   8520
         Width           =   1080
      End
      Begin VB.CheckBox chRecieve 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "œÌÊ«‰ ”Ã· Ê«—œ"
         DataField       =   "ReceiveRecord"
         Height          =   375
         Left            =   6600
         RightToLeft     =   -1  'True
         TabIndex        =   54
         Top             =   8520
         Width           =   1455
      End
      Begin VB.CheckBox chDoctor_CV 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·–« Ì…"
         DataField       =   "Doctor_CV"
         Height          =   375
         Left            =   7110
         RightToLeft     =   -1  'True
         TabIndex        =   53
         Top             =   7440
         Width           =   960
      End
      Begin VB.CheckBox chkPicPrices 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ⁄—›… «·„⁄«·Ã«  «·”‰Ì…"
         DataField       =   "PicPrices"
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         TabIndex        =   52
         Top             =   3960
         Width           =   1875
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         DataField       =   "CenterExamFromID"
         DataMember      =   "Command1"
         DataSource      =   "DataEnvironment1"
         Height          =   285
         Left            =   3000
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   51
         Tag             =   ";required=true;search=true;check=integer>0;check=required;"
         Top             =   8280
         Width           =   1440
      End
      Begin VB.TextBox txtToNumber 
         Alignment       =   1  'Right Justify
         DataField       =   "CenterExamToID"
         DataMember      =   "Command1"
         DataSource      =   "DataEnvironment1"
         Height          =   285
         Left            =   720
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   50
         Tag             =   ";required=true;search=true;check=integer>0;check=required;"
         Top             =   8280
         Width           =   1440
      End
      Begin VB.CheckBox Check4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»ÿ«ﬁ… „ƒ””…"
         DataField       =   "OrganizationCard"
         Height          =   255
         Left            =   3000
         RightToLeft     =   -1  'True
         TabIndex        =   46
         Top             =   6720
         Width           =   1815
      End
      Begin VB.CheckBox Check3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»ÿ«ﬁ… „—Ì÷"
         DataField       =   "patientCard"
         Height          =   255
         Left            =   840
         RightToLeft     =   -1  'True
         TabIndex        =   45
         Top             =   7080
         Width           =   1575
      End
      Begin VB.CheckBox Check2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "”Ã· «·√ÿ»«¡ «·›«Õ’Ì‰"
         DataField       =   "DoctorChecker"
         Height          =   255
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   44
         Top             =   7080
         Width           =   2055
      End
      Begin VB.CheckBox chTeethImg 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·‘«‘… «·”‰Ì…"
         DataField       =   "canUpdateTeethImg"
         Height          =   255
         Left            =   1080
         RightToLeft     =   -1  'True
         TabIndex        =   43
         Top             =   6720
         Width           =   1335
      End
      Begin VB.CheckBox chWithoutDoc 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»ÿ«ﬁ… ›Õ’ »œÊ‰ ÿ»Ì» "
         DataField       =   "WithoutDoctorExam"
         Height          =   255
         Left            =   2520
         RightToLeft     =   -1  'True
         TabIndex        =   42
         Top             =   7440
         Width           =   2295
      End
      Begin VB.CheckBox chCentralExam 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
         DataField       =   "Central_ExamCard"
         Height          =   255
         Left            =   3120
         RightToLeft     =   -1  'True
         TabIndex        =   41
         Top             =   6360
         Width           =   1695
      End
      Begin VB.CheckBox chIhalaFixed 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " À»Ì  «·≈Õ«·…"
         DataField       =   "FixedIhala"
         Height          =   255
         Left            =   1080
         RightToLeft     =   -1  'True
         TabIndex        =   40
         Top             =   6360
         Width           =   1335
      End
      Begin VB.CheckBox chkExam_Total 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "√”⁄«— «·›Õ’"
         DataField       =   "Exam_Total"
         Height          =   375
         Left            =   480
         RightToLeft     =   -1  'True
         TabIndex        =   39
         Top             =   5400
         Width           =   1935
      End
      Begin VB.CheckBox chkZones 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„‰«ÿﬁ Ê «·‘⁄»"
         DataField       =   "Zones"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   38
         Top             =   5760
         Width           =   1425
      End
      Begin VB.CheckBox chkCertificationField 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·≈Œ ’«’« "
         DataField       =   "CertificationField"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   37
         Top             =   5400
         Width           =   1425
      End
      Begin VB.CheckBox chkCerrentStatus 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Ê÷⁄ «·—«Â‰"
         DataField       =   "CurrentStatus"
         Height          =   375
         Left            =   915
         RightToLeft     =   -1  'True
         TabIndex        =   36
         Top             =   5040
         Width           =   1470
      End
      Begin VB.CheckBox chkCertificationLevel 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·œ—Ã… «·⁄·„Ì…"
         DataField       =   "CertificationLevel"
         Height          =   375
         Left            =   915
         RightToLeft     =   -1  'True
         TabIndex        =   35
         Top             =   4680
         Width           =   1425
      End
      Begin VB.CheckBox chkTabib 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ÿ»Ì»"
         DataField       =   "Tabib"
         Height          =   375
         Left            =   960
         RightToLeft     =   -1  'True
         TabIndex        =   33
         Top             =   2160
         Width           =   2670
      End
      Begin VB.CheckBox Check1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         Caption         =   "≈„ﬂ«‰Ì… «·œŒÊ· ≈·Ï ‘«‘… «·”„«ÕÌ« "
         DataField       =   "isAdmin"
         ForeColor       =   &H000000FF&
         Height          =   330
         Left            =   3720
         RightToLeft     =   -1  'True
         TabIndex        =   32
         Top             =   1800
         Width           =   2850
      End
      Begin VB.CheckBox chkStock 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„” Êœ⁄"
         DataField       =   "Stock"
         Height          =   375
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   31
         Top             =   6120
         Width           =   960
      End
      Begin VB.CheckBox chkAccTaware2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Õ«”»… ’‰œÊﬁ «·ÿÊ«—∆"
         DataField       =   "AccTawar2"
         Height          =   375
         Left            =   5370
         RightToLeft     =   -1  'True
         TabIndex        =   30
         Top             =   5610
         Width           =   2670
      End
      Begin VB.CheckBox chkTaaoni 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
         DataField       =   "AccTaaoni"
         Height          =   375
         Left            =   5370
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Top             =   5190
         Width           =   2670
      End
      Begin VB.CheckBox chkAccFari 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Õ«”»… «·›—⁄"
         DataField       =   "AccFari"
         Height          =   375
         Left            =   5370
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Top             =   4755
         Width           =   2670
      End
      Begin VB.CheckBox chkIhaleh 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·‰Ÿ«„ «· ⁄«Ê‰Ì / ≈Õ«·« "
         DataField       =   "Ihaleh"
         Height          =   375
         Left            =   5370
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   3240
         Width           =   2670
      End
      Begin VB.CheckBox chkCentral_Exam 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·‰Ÿ«„ «· ⁄«Ê‰Ì / ›Õ’ „—ﬂ“Ì"
         DataField       =   "Central_Exam"
         Height          =   375
         Left            =   5370
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Top             =   2880
         Width           =   2670
      End
      Begin VB.CheckBox chkAccS 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Õ«”»… «·„” Êœ⁄"
         DataField       =   "AssS"
         Height          =   375
         Left            =   5760
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   6480
         Width           =   2070
      End
      Begin VB.CheckBox chkAccTadamoni 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "’‰œÊﬁ «· ÷«„‰ «·≈Ã „«⁄Ì «·›—⁄Ì"
         DataField       =   "AccTadamoni"
         Height          =   375
         Left            =   3960
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   2160
         Width           =   2670
      End
      Begin VB.CheckBox chkAccounting 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„Õ«”»…"
         DataField       =   "Accounting"
         Height          =   375
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   4440
         Width           =   960
      End
      Begin VB.CheckBox chkCollaborative 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·‰Ÿ«„ «· ⁄«Ê‰Ì"
         DataField       =   "Collaborative_System"
         Height          =   375
         Left            =   6675
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   2520
         Width           =   1365
      End
      Begin VB.CheckBox chkBranch 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·›—⁄"
         DataField       =   "branch"
         Height          =   375
         Left            =   7320
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   7080
         Width           =   750
      End
      Begin VB.CheckBox chkTax 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—”Ê„ Ê√‰Ê«⁄  Ê“Ì⁄«  «·Õ’’"
         DataField       =   "Tax"
         Height          =   375
         Left            =   2520
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   2835
         Width           =   2265
      End
      Begin VB.CheckBox chkBranches 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·›—Ê⁄"
         DataField       =   "Branches"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   3255
         Width           =   1425
      End
      Begin VB.CheckBox chkUnivercity 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Ã«„⁄« "
         DataField       =   "Univercity"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   3960
         Width           =   1425
      End
      Begin VB.CheckBox chkHezh 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·’›… «·Õ“»Ì…"
         DataField       =   "Hezb"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   3600
         Width           =   1425
      End
      Begin VB.CheckBox chkNationality 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Ã‰”Ì« "
         DataField       =   "Nationality"
         Height          =   375
         Left            =   465
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   2835
         Width           =   1875
      End
      Begin VB.CheckBox chkDoctorForms 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "√‰Ê«⁄ «·ÊÀ«∆ﬁ"
         DataField       =   "DoctorForms"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   4680
         Width           =   1425
      End
      Begin VB.CheckBox chkHoliday 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·⁄ÿ· «·—”„Ì…"
         DataField       =   "Holiday"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   5040
         Width           =   1425
      End
      Begin VB.CheckBox chkMeeting_Clause 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»‰Êœ „Õ«÷— «·≈Ã „«⁄« "
         DataField       =   "Meeting_Clause"
         Height          =   375
         Left            =   465
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   3600
         Width           =   1875
      End
      Begin VB.CheckBox chkStockUnits 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Ê«Õœ« "
         DataField       =   "StockUnits"
         Height          =   375
         Left            =   480
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   3960
         Width           =   1875
      End
      Begin VB.CheckBox chkBranches121212 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "√‰Ê«⁄ «· —«ŒÌ’"
         DataField       =   "License_Types"
         Height          =   375
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   4320
         Width           =   1425
      End
      Begin VB.CheckBox ckTreatTree 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "œ·Ì· «·„⁄«·Ã«  «·”‰Ì…"
         DataField       =   "TreatsTree"
         Height          =   375
         Left            =   6120
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   3600
         Width           =   1875
      End
      Begin VB.CheckBox chkFixOrganization_Type 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ’‰Ì› «·„ƒ””« "
         DataField       =   "Organization_Type"
         Height          =   375
         Left            =   465
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   3255
         Width           =   1875
      End
      Begin VB.CheckBox chkPatient_Type 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "’›… «·„—Ì÷"
         DataField       =   "Patient_Type"
         Height          =   375
         Left            =   465
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   4320
         Width           =   1875
      End
      Begin VB.TextBox txtFul_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "full_name"
         Height          =   375
         Left            =   885
         MaxLength       =   250
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";required=true;search=true;"
         Top             =   765
         Width           =   5715
      End
      Begin VB.TextBox txtUser_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "user_name"
         DataMember      =   "Command1"
         DataSource      =   "DataEnvironment1"
         Height          =   375
         Left            =   4440
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";required=true;search=true;"
         Top             =   1350
         Width           =   2160
      End
      Begin VB.TextBox txtPassword 
         Alignment       =   1  'Right Justify
         DataField       =   "Password"
         Height          =   375
         IMEMode         =   3  'DISABLE
         Left            =   885
         MaxLength       =   50
         PasswordChar    =   "*"
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";check=required;search=true;"
         Top             =   1320
         Width           =   2160
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
         Width           =   8055
      End
      Begin VB.Shape Shape7 
         Height          =   1725
         Left            =   5280
         Top             =   7200
         Width           =   2850
      End
      Begin VB.Shape Shape6 
         Height          =   1545
         Left            =   480
         Top             =   6240
         Width           =   4650
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„‰ —ﬁ„ :"
         Height          =   255
         Left            =   4080
         RightToLeft     =   -1  'True
         TabIndex        =   49
         Top             =   8280
         Width           =   930
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Õ Ï —ﬁ„:"
         Height          =   255
         Left            =   2160
         RightToLeft     =   -1  'True
         TabIndex        =   48
         Top             =   8280
         Width           =   690
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„Ã«· »ÿ«ﬁ«  «·›Õ’"
         Height          =   255
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   47
         Top             =   7920
         Width           =   1530
      End
      Begin VB.Shape Shape5 
         Height          =   765
         Left            =   480
         Top             =   7920
         Width           =   4650
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ÀÊ«» "
         Height          =   240
         Left            =   4200
         RightToLeft     =   -1  'True
         TabIndex        =   34
         Top             =   2520
         Width           =   555
      End
      Begin VB.Shape Shape4 
         Height          =   6240
         Left            =   240
         Top             =   2640
         Width           =   4980
      End
      Begin VB.Shape Shape3 
         Height          =   885
         Left            =   5280
         Top             =   6120
         Width           =   2850
      End
      Begin VB.Shape Shape2 
         Height          =   1425
         Left            =   5280
         Top             =   4605
         Width           =   2850
      End
      Begin VB.Shape Shape1 
         Height          =   1740
         Left            =   5280
         Top             =   2640
         Width           =   2850
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„ «·ﬂ«„·"
         Height          =   255
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   840
         Width           =   930
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·„” Œœ„"
         Height          =   255
         Left            =   6750
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1395
         Width           =   930
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "ﬂ·„… «·”—"
         Height          =   255
         Left            =   3060
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1395
         Width           =   930
      End
   End
End
Attribute VB_Name = "frmPermissions"
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



Private Sub chkAccounting_Click()
    If chkAccounting.Value = 0 Then
        chkAccFari.Value = 0
        chkTaaoni.Value = 0
        chkAccTaware2.Value = 0
    End If
End Sub

Private Sub chkCollaborative_Click()
    If chkCollaborative.Value = 0 Then
        chkCentral_Exam.Value = 0
        chkIhaleh.Value = 0
    End If
End Sub

Private Sub chkStock_Click()
    If chkStock.Value = 0 Then chkAccS.Value = 0
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
    oldScaleWidth = 8595 '
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    ActiveDatabaseName = "Default"
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "Select * from Users order by ID", cancel)
    master.rs.Find "ID = " & Current_AppUser.id
    InitFrame
    
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
'        fg.ColWidth(i) = (fg.Width - 400) * fg.ColWidth(i) / totWidth
'    Next
    
End Sub

Private Sub Form_Unload(cancel As Integer)

    MDIMain.Set_Permissions

    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
    
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    If master.rs.RecordCount = 1 Then
        MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·„” Œœ„ ·√‰Â «·„” Œœ„ «·ÊÕÌœ «·„ »ﬁÌ ·œÌﬂ Ê·‰  ” ÿÌ⁄ «·œŒÊ· ≈·Ï «·»—‰«„Ã ›Ì Õ«· Õ–›Â", vbCritical + vbOKOnly, "⁄„·… „„‰Ê⁄…"
        cancel = True
        Beep
    End If
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!AccStock = chkAccS.Value
End Sub
'Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
'  MsgBox "hiiiiiiiiiiiiii"
'End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
Private Sub chkBranch_Click()
    If (chkBranch.Value = 1) Then
        chDoctor_CV.Value = 1
        chCollaborate.Value = 1
        chPayed.Value = 1
        chSend.Value = 1
        chRecieve.Value = 1
        chLockCV.Value = 1
        chDocuments.Value = 1
        chUpdateDoc.Value = 1
        chkSignature.Value = 1
    Else
        chDoctor_CV.Value = 0
        chCollaborate.Value = 0
        chPayed.Value = 0
        chSend.Value = 0
        chRecieve.Value = 0
        chLockCV.Value = 0
        chDocuments.Value = 0
        chUpdateDoc.Value = 0
        chkSignature.Value = 0
     End If
End Sub
