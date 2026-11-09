VERSION 5.00
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "comct332.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIMain 
   BackColor       =   &H00E1FEFF&
   Caption         =   "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰"
   ClientHeight    =   8190
   ClientLeft      =   60
   ClientTop       =   510
   ClientWidth     =   11400
   Icon            =   "MDIMain.frx":0000
   LinkTopic       =   "MDIForm1"
   RightToLeft     =   -1  'True
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.PictureBox PMain 
      Align           =   3  'Align Left
      BackColor       =   &H00E1FEFF&
      Height          =   7275
      Left            =   0
      RightToLeft     =   -1  'True
      ScaleHeight     =   7215
      ScaleWidth      =   9885
      TabIndex        =   3
      Top             =   465
      Width           =   9945
   End
   Begin ComCtl3.CoolBar CoolBar 
      Align           =   1  'Align Top
      Height          =   465
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   11400
      _ExtentX        =   20108
      _ExtentY        =   820
      BandCount       =   2
      _CBWidth        =   11400
      _CBHeight       =   465
      _Version        =   "6.7.8988"
      Child1          =   "Frame2"
      MinWidth1       =   705
      MinHeight1      =   405
      Width1          =   690
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "Frame1"
      MinWidth2       =   1995
      MinHeight2      =   405
      Width2          =   2550
      NewRow2         =   0   'False
      Begin VB.Frame Frame2 
         BorderStyle     =   0  'None
         Height          =   405
         Left            =   165
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   30
         Width           =   705
         Begin VB.CommandButton cmdClose 
            Caption         =   "≈€·«ﬁ"
            Height          =   350
            Left            =   0
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   6
            Top             =   0
            Width           =   615
         End
      End
      Begin VB.Frame Frame1 
         BorderStyle     =   0  'None
         Height          =   405
         Left            =   1095
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   30
         Width           =   10215
         Begin VB.CommandButton cmdCalculator 
            Height          =   350
            Left            =   600
            Picture         =   "MDIMain.frx":1CFA
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   8
            ToolTipText     =   "¬·… Õ«”»…"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdNew 
            Enabled         =   0   'False
            Height          =   350
            Left            =   10305
            Picture         =   "MDIMain.frx":1F77
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   9
            ToolTipText     =   "ÃœÌœ"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdUpdate 
            Enabled         =   0   'False
            Height          =   350
            Left            =   9585
            Picture         =   "MDIMain.frx":24D7
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   14
            ToolTipText     =   " ⁄œÌ·"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdDel 
            Enabled         =   0   'False
            Height          =   350
            Left            =   8775
            Picture         =   "MDIMain.frx":2A5B
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   15
            ToolTipText     =   "Õ–›"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdSave 
            Enabled         =   0   'False
            Height          =   350
            Left            =   7995
            Picture         =   "MDIMain.frx":3007
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   18
            ToolTipText     =   "Õ›Ÿ"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdCancel 
            Enabled         =   0   'False
            Height          =   350
            Left            =   7320
            Picture         =   "MDIMain.frx":358B
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   19
            ToolTipText     =   "≈·€«¡"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdSearch 
            Enabled         =   0   'False
            Height          =   350
            Left            =   4920
            Picture         =   "MDIMain.frx":370F
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   20
            ToolTipText     =   "»ÕÀ"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdCancelSearch 
            Enabled         =   0   'False
            Height          =   350
            Left            =   4200
            Picture         =   "MDIMain.frx":3C93
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   21
            ToolTipText     =   "≈·€«¡ »ÕÀ"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdExecSearch 
            Enabled         =   0   'False
            Height          =   350
            Left            =   4560
            Picture         =   "MDIMain.frx":3E17
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   22
            ToolTipText     =   " ‰›Ì– »ÕÀ"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdFirst 
            Enabled         =   0   'False
            Height          =   350
            Left            =   2280
            Picture         =   "MDIMain.frx":41D9
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   23
            ToolTipText     =   "«·√Ê·"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdPrev 
            Enabled         =   0   'False
            Height          =   350
            Left            =   1920
            Picture         =   "MDIMain.frx":451D
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   24
            ToolTipText     =   "«·”«»ﬁ"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdNext 
            Enabled         =   0   'False
            Height          =   350
            Left            =   1560
            Picture         =   "MDIMain.frx":4861
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   25
            ToolTipText     =   "«· «·Ì"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdLast 
            Enabled         =   0   'False
            Height          =   350
            Left            =   1200
            Picture         =   "MDIMain.frx":4BA5
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   26
            ToolTipText     =   "«·√ŒÌ—"
            Top             =   0
            Width           =   375
         End
         Begin VB.CommandButton cmdPrint 
            Enabled         =   0   'False
            Height          =   350
            Left            =   120
            Picture         =   "MDIMain.frx":4EE9
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   27
            ToolTipText     =   "ÿ»«⁄…"
            Top             =   0
            Width           =   375
         End
      End
   End
   Begin VB.PictureBox PP 
      Align           =   4  'Align Right
      BackColor       =   &H00E1FEFF&
      Height          =   7275
      Left            =   11400
      RightToLeft     =   -1  'True
      ScaleHeight     =   7275
      ScaleWidth      =   0
      TabIndex        =   1
      Top             =   465
      Width           =   0
      Begin VB.CommandButton Clinck 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·⁄Ì«œ…"
         Height          =   375
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   2160
         Width           =   1935
      End
      Begin VB.CommandButton CHide 
         Caption         =   "<"
         Height          =   855
         Left            =   0
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   5640
         Width           =   200
      End
      Begin VB.CommandButton CAbout 
         BackColor       =   &H00E0E0E0&
         Caption         =   "ÕÊ· «·»—‰«„Ã"
         Height          =   375
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   4800
         Visible         =   0   'False
         Width           =   1935
      End
      Begin VB.CommandButton CMoneyList 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·ﬂ‘› «·„«·Ì ··≈Õ«·« "
         Height          =   375
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   0
         Width           =   1935
      End
      Begin VB.PictureBox PMoneyList 
         BackColor       =   &H00FFECCE&
         Height          =   15
         Left            =   0
         RightToLeft     =   -1  'True
         ScaleHeight     =   15
         ScaleWidth      =   1935
         TabIndex        =   13
         Top             =   360
         Visible         =   0   'False
         Width           =   1935
      End
      Begin VB.CommandButton CTeethPic 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·’Ê—… «·”‰Ì…"
         Height          =   375
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   360
         Width           =   1935
      End
      Begin VB.CommandButton CMailBox 
         BackColor       =   &H00E0E0E0&
         Caption         =   "’‰œÊﬁ «·»—Ìœ"
         Height          =   375
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   1800
         Width           =   1935
      End
      Begin VB.CommandButton CMagazine 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·„Ã·…"
         Height          =   375
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   1440
         Width           =   1935
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   100
         Left            =   720
         Top             =   5160
      End
   End
   Begin MSComctlLib.StatusBar StB 
      Align           =   2  'Align Bottom
      Height          =   450
      Left            =   0
      TabIndex        =   0
      Top             =   7740
      Width           =   11400
      _ExtentX        =   20108
      _ExtentY        =   794
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   8
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Bevel           =   2
            Text            =   "≈‰Â«¡ «·»—‰«„Ã"
            TextSave        =   "≈‰Â«¡ «·»—‰«„Ã"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            Object.Width           =   2117
            MinWidth        =   2117
            TextSave        =   "06/07/2014"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            Object.Width           =   2117
            MinWidth        =   2117
            TextSave        =   "05:53 ’"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   1
            Object.Width           =   6173
            MinWidth        =   6173
            Object.ToolTipText     =   "«”„ „Œœ„ ﬁ«⁄œ… «·»Ì«‰« "
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.ToolTipText     =   "‰”Œ… ﬁ«⁄œ… «·»Ì«‰« "
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
            Alignment       =   1
            Enabled         =   0   'False
            Object.Width           =   1058
            MinWidth        =   1058
            TextSave        =   "CAPS"
         EndProperty
         BeginProperty Panel7 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   2
            Alignment       =   1
            AutoSize        =   1
            Enabled         =   0   'False
            Object.Width           =   1058
            MinWidth        =   1058
            TextSave        =   "NUM"
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   7832
            MinWidth        =   7832
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      Height          =   0
      Left            =   0
      ScaleHeight     =   0
      ScaleWidth      =   11400
      TabIndex        =   29
      Top             =   465
      Width           =   11400
   End
   Begin VB.Menu mnuFile 
      Caption         =   "„·›"
      Begin VB.Menu MnuSnapShot 
         Caption         =   " Ê·Ìœ «·‰”Œ… «·√Ê·Ì… ·· “«„‰"
         Visible         =   0   'False
      End
      Begin VB.Menu MnuMerge 
         Caption         =   "„“«„‰… „⁄ «·‰ﬁ«»…"
      End
      Begin VB.Menu MnuBTNNew 
         Caption         =   "ÃœÌœ"
         Shortcut        =   +{F1}
      End
      Begin VB.Menu mnuBtnUpdate 
         Caption         =   " ⁄œÌ·"
         Shortcut        =   +{F2}
      End
      Begin VB.Menu MnuBtnDel 
         Caption         =   "Õ–›"
         Shortcut        =   +{F3}
      End
      Begin VB.Menu MnuBtnSave 
         Caption         =   "Õ›Ÿ "
         Shortcut        =   +{F4}
      End
      Begin VB.Menu MnuBtnCancel 
         Caption         =   "≈·€«¡"
         Shortcut        =   +{F5}
      End
      Begin VB.Menu MnuBtnBeginSearch 
         Caption         =   "»ÕÀ"
         Shortcut        =   +{F6}
      End
      Begin VB.Menu MnuBtnExecSearch 
         Caption         =   " ‰›Ì– »ÕÀ"
         Shortcut        =   +{F7}
      End
      Begin VB.Menu MnuBtnCancelSearch 
         Caption         =   "≈·€«¡ »ÕÀ"
         Shortcut        =   +{F8}
      End
      Begin VB.Menu MnuBtnFirst 
         Caption         =   "«·√Ê·"
         Shortcut        =   ^F
      End
      Begin VB.Menu MnuBtnPrev 
         Caption         =   "«·”«»ﬁ"
         Shortcut        =   ^D
      End
      Begin VB.Menu MnuBtnNext 
         Caption         =   "«· «·Ì"
         Shortcut        =   ^S
      End
      Begin VB.Menu MnuBtnLast 
         Caption         =   "«·√ŒÌ—"
         Shortcut        =   ^A
      End
      Begin VB.Menu MnuBtnPrint 
         Caption         =   "ÿ»«⁄…"
         Shortcut        =   ^P
      End
      Begin VB.Menu Mnu1 
         Caption         =   "-"
      End
      Begin VB.Menu MnuEnd 
         Caption         =   "≈‰Â«¡ «·»—‰«„Ã"
      End
   End
   Begin VB.Menu mnuBranch 
      Caption         =   "«·›—⁄"
      Begin VB.Menu mnuBranch_Diwan 
         Caption         =   "œÌÊ«‰ «·›—⁄"
         Begin VB.Menu mnuBranch_Send 
            Caption         =   "”Ã· «·’«œ— «·⁄«„"
         End
         Begin VB.Menu mnuBranch_Recive 
            Caption         =   "”Ã· «·Ê«—œ «·⁄«„"
         End
         Begin VB.Menu mnuDoctorCV 
            Caption         =   "–« Ì… «·√ÿ»«¡"
         End
         Begin VB.Menu mnuQuarter_Signature 
            Caption         =   " ÊﬁÌ⁄ «·√—»«⁄"
         End
         Begin VB.Menu mnuQuick_Search 
            Caption         =   "»ÕÀ ”—Ì⁄"
            Shortcut        =   {F9}
         End
         Begin VB.Menu mnu_ElectList 
            Caption         =   "«·ﬁ«∆„… «·⁄‘Ê«∆Ì…"
         End
         Begin VB.Menu mnuDoctor_CV_Reports 
            Caption         =   " ﬁ«—Ì— «·–« Ì…"
         End
      End
      Begin VB.Menu mnuCouncil 
         Caption         =   "„Ã·” «·≈œ«—…"
         Begin VB.Menu mnuCouncil_CV 
            Caption         =   "–« Ì… «·„Ã·”"
         End
         Begin VB.Menu mnuCouncil_Meeting 
            Caption         =   "„Õ«÷— «·≈Ã „«⁄« "
            Begin VB.Menu mnuBranch_Council_Meeting 
               Caption         =   "Ã·”… „Ã·” «·›—⁄"
            End
            Begin VB.Menu mnuCollaborative_Council_Meeting 
               Caption         =   "Ã·”… „Ã·” «·‰Ÿ«„ «· ⁄«Ê‰Ì"
            End
         End
         Begin VB.Menu mnuLecture 
            Caption         =   "‰œÊ«  Ê „Õ«÷—« "
         End
      End
      Begin VB.Menu mnuEmployees 
         Caption         =   "≈œ«—ÌÌ‰ Ê„ÊŸ›Ì‰"
         Begin VB.Menu mnuEmployee_CV 
            Caption         =   "»ÿ«ﬁ… „ÊŸ›"
         End
         Begin VB.Menu mnuEmployee_Continuance 
            Caption         =   "«·œÊ«„"
            Begin VB.Menu mnuBarCode 
               Caption         =   "«·»«—ﬂÊœ"
            End
            Begin VB.Menu mnuContinuance_Report 
               Caption         =   "«·œÊ«„ «·ÌÊ„Ì"
            End
            Begin VB.Menu mnuAll_Employees 
               Caption         =   "”Ã· œÊ«„ «·„ÊŸ›Ì‰ «·⁄«„"
            End
         End
      End
   End
   Begin VB.Menu mnuCach 
      Caption         =   "’‰œÊﬁ «·›—⁄"
      Begin VB.Menu mnuPaymentsMecanisms 
         Caption         =   "¬·Ì«   —ÕÌ· ≈Ì’«·«  «·ﬁ»÷"
      End
      Begin VB.Menu mnuPaymentIsal 
         Caption         =   "≈Ì’«· ﬁ»÷"
      End
      Begin VB.Menu mnuCashSeparator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPaymentIsalReview 
         Caption         =   "„—«Ã⁄… √Ê«„— «·ﬁ»÷"
      End
      Begin VB.Menu mnuPaymentIsalReport 
         Caption         =   " ﬁ—Ì— √Ê«„— «·ﬁ»÷"
      End
   End
   Begin VB.Menu mnuCollaborative 
      Caption         =   "«·‰Ÿ«„ «· ⁄«Ê‰Ì"
      Begin VB.Menu mnuCollaborativeDiwan 
         Caption         =   "œÌÊ«‰ «·‰Ÿ«„"
         Begin VB.Menu mnuCollaborative_Send 
            Caption         =   "«·»—Ìœ «·’«œ—"
         End
         Begin VB.Menu mnuCollaborative_Recive 
            Caption         =   "«·»—Ìœ «·Ê«—œ"
         End
      End
      Begin VB.Menu mnuCards 
         Caption         =   "»ÿ«ﬁ« "
         Begin VB.Menu mnuOrganiazation 
            Caption         =   "»ÿ«ﬁ… „ƒ””…"
         End
         Begin VB.Menu MnuCommTeethTreat 
            Caption         =   "« ›«ﬁÌ«  ‘—Êÿ «·⁄·«Ã"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuPatient 
            Caption         =   "»ÿ«ﬁ… „—Ì÷"
         End
         Begin VB.Menu mnuExaminer_Doctor 
            Caption         =   "”Ã· «·√ÿ»«¡ «·›«Õ’Ì‰"
         End
      End
      Begin VB.Menu mnuIhalat 
         Caption         =   "«·≈Õ«·« "
         Begin VB.Menu mnuCentral_Exam 
            Caption         =   "»ÿ«ﬁ… ›Õ’ „—ﬂ“Ì"
         End
         Begin VB.Menu mnuWithout_Doctor 
            Caption         =   "»œÊ‰ ÿ»Ì» ›«Õ’"
         End
         Begin VB.Menu mnuIhaleh 
            Caption         =   "≈Õ«·« "
         End
         Begin VB.Menu mnuOldArchive 
            Caption         =   "«·√—‘Ì› «·ﬁœÌ„"
            Visible         =   0   'False
            Begin VB.Menu mnuExam 
               Caption         =   "√Ê—«ﬁ «·›Õ’"
            End
            Begin VB.Menu mnuOldIhalat 
               Caption         =   "«·≈Õ«·« "
            End
         End
      End
      Begin VB.Menu mnuCollaborative_Reports 
         Caption         =   " ﬁ«—Ì—"
         Begin VB.Menu mnuCentral_Exam_Clinc_Report 
            Caption         =   "”Ã· «·„—÷Ï ›Ì ⁄Ì«œ… «·›Õ’ «·„—ﬂ“Ì"
         End
         Begin VB.Menu mnuKashef_Tabib 
            Caption         =   "ﬂ‘› ≈Õ«·«  ÿ»Ì»"
         End
         Begin VB.Menu mnuOrganization_Kashef 
            Caption         =   "ﬂ‘› „ÿ«·»… „ƒ””…"
         End
         Begin VB.Menu mnuOrganizations 
            Caption         =   "”Ã· «·„ƒ””«  «· Ì ·Â« ⁄ﬁÊœ"
         End
         Begin VB.Menu mnuCollaborative_Doctors 
            Caption         =   "”Ã· «·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰"
         End
         Begin VB.Menu mnoKashef_Report 
            Caption         =   "”Ã· „ÿ«·»«  «·„ƒ””« "
         End
         Begin VB.Menu mnuAll_Organization_Kashef 
            Caption         =   "√—’œ… «·„ƒ””« "
         End
         Begin VB.Menu mnuAll_Doctor_Kashef 
            Caption         =   "√—’œ… «·√ÿ»«¡"
         End
         Begin VB.Menu mnuDiscount 
            Caption         =   " ﬁ—Ì— «·≈Õ«·«  «· Ì ›ÌÂ« Õ”„ "
         End
         Begin VB.Menu mnusepsystem 
            Caption         =   "-"
         End
         Begin VB.Menu mnuAllCanceledTreats 
            Caption         =   " ﬁ—Ì— ≈Ã„«·Ì »«·„⁄«·Ã«  «·„Õ”Ê„…"
         End
      End
   End
   Begin VB.Menu mnuTadamoni 
      Caption         =   "’‰œÊﬁ «· ÷«„‰ «·›—⁄Ì"
      Begin VB.Menu mnuHelpCard 
         Caption         =   "»ÿ«ﬁ… ≈⁄«‰…"
      End
      Begin VB.Menu mnuHelpReport 
         Caption         =   "«·”Ã· «·⁄«„ ·»ÿ«ﬁ«  «·≈⁄«‰« "
      End
      Begin VB.Menu mnuInharitance 
         Caption         =   "ÃœÊ·  Ê“Ì⁄ «” Õﬁ«ﬁ «·Ê—À…"
      End
      Begin VB.Menu mnuInharitance_Report 
         Caption         =   "«·”Ã· «·⁄«„ ·ÃœÊ·  Ê“Ì⁄ «” Õﬁ«ﬁ «·Ê—À…"
      End
      Begin VB.Menu MnuAccTadamon 
         Caption         =   "„Õ«”»… «· ÷«„‰ «·›—⁄Ì"
         Begin VB.Menu MnuAccTadamonTDalil 
            Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
         End
         Begin VB.Menu MnuAccTadamonDailyOpening 
            Caption         =   "ﬁÌœ «›  «ÕÌ"
         End
         Begin VB.Menu MnuAccTadamonDaily 
            Caption         =   "”‰œ ﬁÌœ"
         End
         Begin VB.Menu MnuAccTadamonSandok 
            Caption         =   "«·’‰œÊﬁ"
         End
         Begin VB.Menu mnuAccTadamon_Dialy_Browse 
            Caption         =   "«·ÌÊ„Ì…"
         End
         Begin VB.Menu mnuAccTadamon_Master 
            Caption         =   "œ› — «·√” «–"
         End
         Begin VB.Menu mnuTadamonMotajrah 
            Caption         =   " ﬁ—Ì— «·„ «Ã—…"
         End
         Begin VB.Menu mnuTadamonArbah 
            Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
         End
         Begin VB.Menu mnuTadamonMizan 
            Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
         End
         Begin VB.Menu mnuTadamonMizanieh 
            Caption         =   "«·„Ì“«‰Ì…"
         End
         Begin VB.Menu MnuAccTadamonClose 
            Caption         =   "≈ﬁ›«· «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu MnuAccTadamonChangeYear 
            Caption         =   " €ÌÌ— «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu MnuAccTadamonHissa 
            Caption         =   "Õ’… ’‰œÊﬁ «· ÷«„‰ „‰ «·‰Ÿ«„ «· ⁄«Ê‰Ì"
         End
         Begin VB.Menu MnuAccTadamonHissaFari 
            Caption         =   "Õ’… ’‰œÊﬁ «· ÷«„‰ „‰ «·›—⁄"
         End
      End
   End
   Begin VB.Menu mnuStock 
      Caption         =   "«·„” Êœ⁄"
      Begin VB.Menu mnuStockGroup 
         Caption         =   "»ÿ«ﬁ… „Ã„Ê⁄…"
      End
      Begin VB.Menu mnuStockObject 
         Caption         =   "»ÿ«ﬁ… „«œ…"
      End
      Begin VB.Menu mnuStockCatalog 
         Caption         =   "œ·Ì· «·„Ê«œ"
      End
      Begin VB.Menu mnuStockSeparator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStartStockObjects 
         Caption         =   "»÷«⁄… √Ê· „œ…"
      End
      Begin VB.Menu mnuStockInvoice 
         Caption         =   "«·›Ê« Ì—"
         Begin VB.Menu mnuStockInvoiceIn 
            Caption         =   "≈œŒ«·"
         End
         Begin VB.Menu mnuStockInvoiceOut 
            Caption         =   "≈Œ—«Ã"
         End
      End
      Begin VB.Menu mnuStockSeparator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStockJard 
         Caption         =   "Ã—œ «·„Ê«œ ›Ì «·„” Êœ⁄"
      End
      Begin VB.Menu mnuStockObjectsUnder 
         Caption         =   " ﬁ—Ì— ‰ﬁ’ «·ﬂ„Ì«  ›Ì «·„Ê«œ"
      End
      Begin VB.Menu mnuStockObjectsOver 
         Caption         =   " ﬁ—Ì— “Ì«œ… «·ﬂ„Ì«  ›Ì «·„Ê«œ"
      End
      Begin VB.Menu mnuStockObjectsExpired 
         Caption         =   " ﬁ—Ì— «·„Ê«œ „‰ ÂÌ… «·’·«ÕÌ…"
      End
      Begin VB.Menu mnuStockSeparator3 
         Caption         =   "-"
      End
      Begin VB.Menu MnuAccS 
         Caption         =   "„Õ«”»… «·„” Êœ⁄"
         Begin VB.Menu MnuAccSTDalil 
            Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
         End
         Begin VB.Menu MnuAccSDailyOpening 
            Caption         =   "ﬁÌœ «›  «ÕÌ"
         End
         Begin VB.Menu MnuAccSDaily 
            Caption         =   "”‰œ ﬁÌœ"
         End
         Begin VB.Menu MnuAccSSandok 
            Caption         =   "«·’‰œÊﬁ"
         End
         Begin VB.Menu mnuAccS_Dialy_Browse 
            Caption         =   "«·ÌÊ„Ì…"
         End
         Begin VB.Menu mnuAccS_Master 
            Caption         =   "œ› — «·√” «–"
         End
         Begin VB.Menu mnuSMotajrah 
            Caption         =   " ﬁ—Ì— «·„ «Ã—…"
         End
         Begin VB.Menu mnuSArbah 
            Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
         End
         Begin VB.Menu mnuSMizan 
            Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
         End
         Begin VB.Menu mnuSMizanieh 
            Caption         =   "«·„Ì“«‰Ì…"
         End
         Begin VB.Menu MnuSAccClose 
            Caption         =   "≈ﬁ›«· «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu MnuSAccChangeYear 
            Caption         =   " €ÌÌ— «·”‰… «·„«·Ì…"
         End
      End
   End
   Begin VB.Menu mnuAccounting 
      Caption         =   "«·„Õ«”»…"
      Begin VB.Menu MnuAccTaaoni 
         Caption         =   "„Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
         Begin VB.Menu MnuAccTDalil 
            Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
         End
         Begin VB.Menu MnuAccDailyOpening 
            Caption         =   "ﬁÌœ «›  «ÕÌ"
         End
         Begin VB.Menu MnuAccDaily 
            Caption         =   "”‰œ ﬁÌœ"
         End
         Begin VB.Menu MnuAcc_DailyNewTabib 
            Caption         =   "”‰œ  ⁄œÌ· √⁄„«· «·ÿ»Ì»"
         End
         Begin VB.Menu MnuAccSandok 
            Caption         =   "«·’‰œÊﬁ"
         End
         Begin VB.Menu mnuAcc_Dialy_Browse 
            Caption         =   "«·ÌÊ„Ì…"
         End
         Begin VB.Menu mnuAcc_Master 
            Caption         =   "œ› — «·√” «–"
         End
         Begin VB.Menu mnuMotajrah 
            Caption         =   " ﬁ—Ì— «·„ «Ã—…"
         End
         Begin VB.Menu mnuArbah 
            Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
         End
         Begin VB.Menu mnuMizan 
            Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
         End
         Begin VB.Menu mnuMizanieh 
            Caption         =   "«·„Ì“«‰Ì…"
         End
         Begin VB.Menu MnuAccClose 
            Caption         =   "≈ﬁ›«· «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu MnuAccChangeYear 
            Caption         =   " €ÌÌ— «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu mnuBrowseOrgVouchers 
            Caption         =   "„⁄«Ì‰… ﬁÌÊœ «·‘—ﬂ«  «·‰« Ã… ›Ì «·ﬁÌœ «·«›  «ÕÌ «· «·Ì"
         End
         Begin VB.Menu MnuAccTasdid 
            Caption         =   " ”œÌœ ﬂ‘Ê› „ÿ«·»… «·‘—ﬂ« "
         End
         Begin VB.Menu MnuAccOldKashf 
            Caption         =   "„ÿ«·»«  ﬁœÌ„…"
         End
         Begin VB.Menu MnuAccCloseRiba 
            Caption         =   "≈ﬁ›«· «·—»⁄"
         End
         Begin VB.Menu mnuOpenClosedRibas 
            Caption         =   "«· —«Ã⁄ ⁄‰ ﬁ›· «·√—»«⁄ Ê «·Õ’…"
         End
         Begin VB.Menu MnuKashfTabib 
            Caption         =   "ﬂ‘› ≈Õ«·«  «·√ÿ»«¡"
         End
         Begin VB.Menu MnuAccHissaSanawia 
            Caption         =   "«·Õ’… «·”‰ÊÌ…"
            Begin VB.Menu mnuLockHissa 
               Caption         =   " ﬁ—Ì— «·„Õ«”» Ê ﬁ›· «·Õ’…"
            End
            Begin VB.Menu mnuSigned_Not_In_Hissa 
               Caption         =   " ﬁ—Ì— «·√ÿ»«¡ «·„Êﬁ⁄Ì‰ √—»«⁄ Ê€Ì— Ÿ«Â—Ì‰ ›Ì  ﬁ—Ì— «·Õ’…"
            End
            Begin VB.Menu mnuSigned_But_Less_Than_LastHissa 
               Caption         =   " ﬁ—Ì— «·√ÿ»«¡ «·„Êﬁ⁄Ì‰ √—»«⁄ Ê √⁄„«·Â„ √ﬁ· „‰ «·Õ’… «·”«»ﬁ…"
            End
            Begin VB.Menu mnuHas_Ijmali_Has_No_Signatures 
               Caption         =   " ﬁ—Ì— «·√ÿ»«¡ «·–Ì‰ ·œÌÂ„ √⁄„«· Ê€Ì— „Êﬁ⁄Ì‰"
            End
            Begin VB.Menu mnuAbsoulit 
               Caption         =   " ﬁ—Ì— ’«›Ì √⁄„«· «·√ÿ»«¡"
            End
         End
      End
      Begin VB.Menu MnuAccFari 
         Caption         =   "„Õ«”»… «·›—⁄"
         Begin VB.Menu MnuAccFariTDalil 
            Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
         End
         Begin VB.Menu MnuAccFariDailyOpening 
            Caption         =   "ﬁÌœ «›  «ÕÌ"
         End
         Begin VB.Menu MnuAccFariDaily 
            Caption         =   "”‰œ ﬁÌœ"
         End
         Begin VB.Menu MnuAccFariDailyManual 
            Caption         =   "”‰œ ﬁÌœ ÌœÊÌ"
         End
         Begin VB.Menu MnuAccFariSandok 
            Caption         =   "«·’‰œÊﬁ"
         End
         Begin VB.Menu mnuAccFari_Dialy_Browse 
            Caption         =   "«·ÌÊ„Ì…"
         End
         Begin VB.Menu mnuAccFari_Master 
            Caption         =   "œ› — «·√” «–"
         End
         Begin VB.Menu mnuFariMotajrah 
            Caption         =   " ﬁ—Ì— «·„ «Ã—…"
         End
         Begin VB.Menu mnuFariArbah 
            Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
         End
         Begin VB.Menu mnuFariMizan 
            Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
         End
         Begin VB.Menu mnuFariMizanieh 
            Caption         =   "«·„Ì“«‰Ì…"
         End
         Begin VB.Menu MnuAccFariClose 
            Caption         =   "≈ﬁ›«· «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu MnuAccFariChangeYear 
            Caption         =   " €ÌÌ— «·”‰… «·„«·Ì…"
         End
      End
      Begin VB.Menu MnuAccTawar2 
         Caption         =   "’‰œÊﬁ «·ÿÊ«—∆"
         Begin VB.Menu MnuAccTawar2TDalil 
            Caption         =   "«·œ·Ì· «·„Õ«”»Ì"
         End
         Begin VB.Menu MnuAccTawar2DailyOpening 
            Caption         =   "ﬁÌœ «›  «ÕÌ"
         End
         Begin VB.Menu MnuAccTawar2Daily 
            Caption         =   "”‰œ ﬁÌœ"
         End
         Begin VB.Menu MnuAccTawar2Sandok 
            Caption         =   "«·’‰œÊﬁ"
         End
         Begin VB.Menu mnuAccTawar2_Dialy_Browse 
            Caption         =   "«·ÌÊ„Ì…"
         End
         Begin VB.Menu mnuAccTawar2_Master 
            Caption         =   "œ› — «·√” «–"
         End
         Begin VB.Menu mnuTawar2Motajrah 
            Caption         =   " ﬁ—Ì— «·„ «Ã—…"
         End
         Begin VB.Menu mnuTawar2Arbah 
            Caption         =   " ﬁ—Ì— «·√—»«Õ Ê«·Œ”«∆—"
         End
         Begin VB.Menu mnuTawar2Mizan 
            Caption         =   "„Ì“«‰ «·„—«Ã⁄…"
         End
         Begin VB.Menu mnuTawar2Mizanieh 
            Caption         =   "«·„Ì“«‰Ì…"
         End
         Begin VB.Menu MnuAccTawar2Close 
            Caption         =   "≈ﬁ›«· «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu MnuAccTawar2ChangeYear 
            Caption         =   " €ÌÌ— «·”‰… «·„«·Ì…"
         End
         Begin VB.Menu mnuSeperator 
            Caption         =   "-"
         End
         Begin VB.Menu mnuTawar2_Limits 
            Caption         =   "”ﬁ› «·≈⁄«‰« "
         End
         Begin VB.Menu MnuAccTawar2_Tasdid 
            Caption         =   " ”œÌœ«  ’‰œÊﬁ «·ÿÊ«—∆"
         End
         Begin VB.Menu MnuAccTawar2_I3ana 
            Caption         =   "≈⁄«‰«  ’‰œÊﬁ «·ÿÊ«—∆"
         End
      End
   End
   Begin VB.Menu mnuTabib 
      Caption         =   "«·ÿ»Ì»"
      Begin VB.Menu mnuTabib_Recive 
         Caption         =   "Ê«—œ „‰ «·√ÿ»«¡"
      End
      Begin VB.Menu mnuTabib_Send 
         Caption         =   " ⁄«„Ì„ Ê »«·Ì€"
      End
   End
   Begin VB.Menu mnuCentral_Mail 
      Caption         =   "»—Ìœ «·‰ﬁ«»… «·„—ﬂ“Ì…"
      Begin VB.Menu mnuSent 
         Caption         =   "’«œ—"
      End
      Begin VB.Menu mnuRecived 
         Caption         =   "Ê«—œ"
      End
   End
   Begin VB.Menu MNUManage 
      Caption         =   "≈œ«—… «·»—‰«„Ã"
      Begin VB.Menu mnuLock_Doctor_CV 
         Caption         =   "≈ﬁ›«· «·–« Ì…"
      End
      Begin VB.Menu mnuFix 
         Caption         =   "«·ÀÊ«» "
         Begin VB.Menu mnuBranches 
            Caption         =   "«·›—Ê⁄"
         End
         Begin VB.Menu mnuTax 
            Caption         =   "«·—”Ê„"
         End
         Begin VB.Menu mnuStockUnits 
            Caption         =   "«·Ê«Õœ« "
         End
         Begin VB.Menu mnuUniversity 
            Caption         =   "«·Ã«„⁄« "
         End
         Begin VB.Menu mnuNationality 
            Caption         =   "«·Ã‰”Ì« "
         End
         Begin VB.Menu mnuCertificationField 
            Caption         =   "«·«Œ ’«’« "
         End
         Begin VB.Menu mnuDoctorForms 
            Caption         =   "√‰Ê«⁄ «·ÊÀ«∆ﬁ"
         End
         Begin VB.Menu mnuStatus 
            Caption         =   "«·Ê÷⁄ «·—«Â‰"
         End
         Begin VB.Menu mnuPatient_Type 
            Caption         =   "’›… «·„—Ì÷"
         End
         Begin VB.Menu mnuHezb 
            Caption         =   "«·’›… «·Õ“»Ì…"
         End
         Begin VB.Menu mnuExam_Total 
            Caption         =   "√”⁄«— «·›Õ’"
         End
         Begin VB.Menu mnuLicenseTypes 
            Caption         =   "√‰Ê«⁄ «· —«ŒÌ’"
         End
         Begin VB.Menu mnuCertificationLevel 
            Caption         =   "«·œ—Ã… «·⁄·„Ì…"
         End
         Begin VB.Menu mnuHoliday 
            Caption         =   "«·⁄ÿ· «·—”„Ì…"
         End
         Begin VB.Menu mnuScincePoints 
            Caption         =   "«·√‰‘ÿ… «·⁄·„Ì…"
         End
         Begin VB.Menu mnuZones 
            Caption         =   "«·„‰«ÿﬁ Ê«·‘⁄»"
         End
         Begin VB.Menu mnuFixOrganization_Type 
            Caption         =   " ’‰Ì› «·„ƒ””« "
         End
         Begin VB.Menu mnuMeeting_Clause 
            Caption         =   "»‰Êœ „Õ÷— «Ã „«⁄ «·„Ã·”"
         End
         Begin VB.Menu mnuTasdeedDistributionType 
            Caption         =   "√‰Ê«⁄  Ê“Ì⁄«  «·Õ’’"
         End
         Begin VB.Menu mnuTasdeedShare 
            Caption         =   "Õ’’  ”œÌœ«  «·—”Ê„ «·”‰ÊÌ…"
         End
         Begin VB.Menu mnuMaxRed 
            Caption         =   "”ﬁ› «·Œ „ «·√Õ„—"
         End
      End
      Begin VB.Menu Mnulogin 
         Caption         =   " ”ÃÌ· œŒÊ·"
      End
      Begin VB.Menu mnuPrev 
         Caption         =   "’·«ÕÌ«  «·»—‰«„Ã"
      End
      Begin VB.Menu mnuTreatTooth 
         Caption         =   "«·„⁄«·Ã«  «·”‰Ì…"
         Begin VB.Menu mnuGlobalTreat 
            Caption         =   "œ·Ì· «·„⁄«·Ã«  «·”‰Ì…"
         End
         Begin VB.Menu MnuPicPrices 
            Caption         =   " ⁄—›… «·„⁄«·Ã«  «·”‰Ì…"
         End
      End
      Begin VB.Menu mnuServerName 
         Caption         =   " €ÌÌ— «”„ «·„Œœ„"
      End
   End
   Begin VB.Menu Mnu_About 
      Caption         =   "ÕÊ· «·»—‰«„Ã"
   End
End
Attribute VB_Name = "MDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private WithEvents SQLMerge As SQLMerge
Attribute SQLMerge.VB_VarHelpID = -1
Private WithEvents SQLMrgSnapshot As SQLSnapshot
Attribute SQLMrgSnapshot.VB_VarHelpID = -1
Private WithEvents SQLDistribution As SQLDistribution
Attribute SQLDistribution.VB_VarHelpID = -1

Dim i As Integer
Dim I1 As Long
Dim HPic As Boolean
Dim O As Boolean

' Fix<forms>
Public WithEvents frmOrganizationType As frmSqlSelect
Attribute frmOrganizationType.VB_VarHelpID = -1
Public WithEvents frmHolidy As frmSqlSelect
Attribute frmHolidy.VB_VarHelpID = -1
Public WithEvents frmPatient_Type As frmSqlSelect
Attribute frmPatient_Type.VB_VarHelpID = -1
Public WithEvents frmExam_Total As frmSqlSelect
Attribute frmExam_Total.VB_VarHelpID = -1
Public WithEvents frmIhalat_New As frmSqlSelect
Attribute frmIhalat_New.VB_VarHelpID = -1
Public WithEvents frmCertificationLevel As frmSqlSelect
Attribute frmCertificationLevel.VB_VarHelpID = -1
Public WithEvents frmCertificationField As frmSqlSelect
Attribute frmCertificationField.VB_VarHelpID = -1
Public WithEvents frmStatus As frmSqlSelect
Attribute frmStatus.VB_VarHelpID = -1
Public WithEvents frmNationality As frmSqlSelect
Attribute frmNationality.VB_VarHelpID = -1
Public WithEvents frmHezb As frmSqlSelect
Attribute frmHezb.VB_VarHelpID = -1
Public WithEvents frmMeeting_Clause As frmSqlSelect
Attribute frmMeeting_Clause.VB_VarHelpID = -1
' Doctor CV Forms
Public WithEvents frmBranches As frmSqlSelect
Attribute frmBranches.VB_VarHelpID = -1
Public WithEvents frmUniversity As frmSqlSelect
Attribute frmUniversity.VB_VarHelpID = -1
Public WithEvents frmLicenseType As frmSqlSelect
Attribute frmLicenseType.VB_VarHelpID = -1
Public WithEvents frmDoctorForms As frmSqlSelect
Attribute frmDoctorForms.VB_VarHelpID = -1
Public WithEvents frmDoctorScincePoints As frmSqlSelect
Attribute frmDoctorScincePoints.VB_VarHelpID = -1
Public WithEvents frmMainTreat As frmSqlSelect
Attribute frmMainTreat.VB_VarHelpID = -1
' Doctor Tasdeed Forms
Public WithEvents frmTasdeedDistributionType As frmSqlSelect
Attribute frmTasdeedDistributionType.VB_VarHelpID = -1
Public WithEvents frmTasdeedShare As frmSqlSelect
Attribute frmTasdeedShare.VB_VarHelpID = -1
Private rsTasdeedAccounts As ADODB.Recordset
' Stock forms
Public WithEvents frmStockGroup As frmSqlSelect
Attribute frmStockGroup.VB_VarHelpID = -1
Public frmStockStart As frmStockInvoice
Attribute frmStockStart.VB_VarHelpID = -1
Public frmStockInvoiceIn As frmStockInvoice
Attribute frmStockInvoiceIn.VB_VarHelpID = -1
Public frmStockInvoiceOut As frmStockInvoice
Attribute frmStockInvoiceOut.VB_VarHelpID = -1
Public WithEvents frmStockUnit As frmSqlSelect
Attribute frmStockUnit.VB_VarHelpID = -1
Public frmStockObjectsJard As frmStockJard
Public frmStockObjectsOver As frmStockJard
Public frmStockObjectsUnder As frmStockJard
' Cach Payments forms
Public WithEvents frmPaymentsMechanism As frmSqlSelect
Attribute frmPaymentsMechanism.VB_VarHelpID = -1
Public WithEvents frmPaymentIsal As frmSqlSelect
Attribute frmPaymentIsal.VB_VarHelpID = -1

Private explicit_close As Boolean
Private isClosingNow As Boolean
Public WithEvents dlgBrowseOrgVouchers As dlgSqlSelect
Attribute dlgBrowseOrgVouchers.VB_VarHelpID = -1

Public Sub EnterClinic()
    PMain.visible = False
    PP.visible = False
    CoolBar.visible = True
    Me.Picture = PMain.Picture
'    OpenConnection conn
End Sub
Sub Close_All_Connections()
    If connDefault.state = 1 Then connDefault.Close
    If connFari.state = 1 Then connFari.Close
    If connTadamonFari.state = 1 Then connTadamonFari.Close
    If connTawar2.state = 1 Then connTawar2.Close
    If connStock.state = 1 Then connStock.Close
    If Conn.state = 1 Then Conn.Close
    
    Set connDefault = Nothing
    Set connFari = Nothing
    Set connTadamonFari = Nothing
    Set connTawar2 = Nothing
     
    Timer1.Enabled = False
    
    Set frmCentral_Exam_Without_Doctor = Nothing
    Set frmCentral_Exam_With_Doctor = Nothing
    
End Sub
Public Sub Set_Permissions()

    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    
    Set rs = ExecuteSelect(Conn, "Select * from Users where Id = " & Current_AppUser.id, cancel)
    
    With rs
        If !IsAdmin = 1 Then mnuPrev.Enabled = True Else mnuPrev.Enabled = False
        If !branch = 1 Then mnuBranch.Enabled = True Else mnuBranch.Enabled = False
        If !Collaborative_System = 1 Then mnuCollaborative.Enabled = True Else mnuCollaborative.Enabled = False
        If !Central_Exam = 1 Then mnuCentral_Exam.Enabled = True Else mnuCentral_Exam.Enabled = False
        If !Ihaleh = 1 Then mnuIhaleh.Enabled = True Else mnuIhaleh.Enabled = False
        If !AccTaaoni = 1 Then MnuAccTaaoni.Enabled = True Else MnuAccTaaoni.Enabled = False
        If !accFari = 1 Then MnuAccFari.Enabled = True Else MnuAccFari.Enabled = False
        If !AssS = 1 Then MnuAccS.Enabled = True Else MnuAccS.Enabled = False
        If !AccTawar2 = 1 Then MnuAccTawar2.Enabled = True Else MnuAccTawar2.Enabled = False
        If !AccTadamoni = 1 Then mnuTadamoni.Enabled = True Else mnuTadamoni.Enabled = False
        If !Tax = 1 Then mnuTax.Enabled = True Else mnuTax.Enabled = False
        If !Nationality = 1 Then mnuNationality.Enabled = True Else mnuNationality.Enabled = False
        If !Hezb = 1 Then mnuHezb.Enabled = True Else mnuHezb.Enabled = False
        If !Univercity = 1 Then mnuUniversity.Enabled = True Else mnuUniversity.Enabled = False
        If !Branches = 1 Then mnuBranches.Enabled = True Else mnuBranches.Enabled = False
        If !License_Types = 1 Then mnuLicenseTypes.Enabled = True Else mnuLicenseTypes.Enabled = False
        If !DoctorForms = 1 Then mnuDoctorForms.Enabled = True Else mnuDoctorForms.Enabled = False
        If !Holiday = 1 Then mnuHoliday.Enabled = True Else mnuHoliday.Enabled = False
        If !Exam_Total = 1 Then mnuExam_Total.Enabled = True Else mnuExam_Total.Enabled = False
        If !PicPrices = 1 Then MnuPicPrices.Enabled = True Else MnuPicPrices.Enabled = False
                
        If !NezamReports = 1 Then mnuCollaborative_Reports.Enabled = True Else mnuCollaborative_Reports.Enabled = False
        
        If !Organization_Type = 1 Then mnuFixOrganization_Type.Enabled = True Else mnuFixOrganization_Type.Enabled = False
        If !Meeting_Clause = 1 Then mnuMeeting_Clause.Enabled = True Else mnuMeeting_Clause.Enabled = False
        If !StockUnits = 1 Then mnuStockUnits.Enabled = True Else mnuStockUnits.Enabled = False
        If !Tabib = 1 Then mnuTabib.Enabled = True Else mnuTabib.Enabled = False
        If !Accounting = 1 Then mnuAccounting.Enabled = True Else mnuAccounting.Enabled = False
        If !Stock = 1 Then mnuStock.Enabled = True Else mnuStock.Enabled = False
        
        If !patient_Type = 1 Then mnuPatient_Type.Enabled = True Else mnuPatient_Type.Enabled = False
        If !CertificationField = 1 Then mnuCertificationField.Enabled = True Else mnuCertificationField.Enabled = False
        If !CertificationLevel = 1 Then mnuCertificationLevel.Enabled = True Else mnuCertificationLevel.Enabled = False
        If !CurrentStatus = 1 Then mnuStatus.Enabled = True Else mnuStatus.Enabled = False
        If !Zones = 1 Then mnuZones.Enabled = True Else mnuZones.Enabled = False
        ' <Moh Masrie>
        If !Central_ExamCard = 1 Then mnuCentral_Exam.Enabled = True Else mnuCentral_Exam.Enabled = False
        If !WithoutDoctorExam = 1 Then mnuWithout_Doctor.Enabled = True Else mnuWithout_Doctor.Enabled = False
        If !DoctorChecker = 1 Then mnuExaminer_Doctor.Enabled = True Else mnuExaminer_Doctor.Enabled = False
        If !OrganizationCard = 1 Then mnuOrganiazation.Enabled = True Else mnuOrganiazation.Enabled = False
        If !patientCard = 1 Then mnuPatient.Enabled = True Else mnuPatient.Enabled = False
        If !TreatsTree = 1 Then mnuGlobalTreat.Enabled = True Else mnuGlobalTreat.Enabled = False
        If !Doctor_CV = 1 Then mnuDoctorCV.Enabled = True Else mnuDoctorCV.Enabled = False
        
        If !CloseDoctor_CV = 1 Then mnuLock_Doctor_CV.Enabled = True Else mnuLock_Doctor_CV.Enabled = False
        If !SendRecord = 1 Then mnuBranch_Send.Enabled = True Else mnuBranch_Send.Enabled = False
        If !ReceiveRecord = 1 Then mnuBranch_Recive.Enabled = True Else mnuBranch_Recive.Enabled = False
        If !quarterSignature = 1 Then mnuQuarter_Signature.Enabled = True Else mnuQuarter_Signature.Enabled = False
        If !LockDoctor_CV = 1 Then
            mnuDoctor_CV_Reports.Enabled = True
            mnu_ElectList.Enabled = True
        Else
            mnuDoctor_CV_Reports.Enabled = False
            mnu_ElectList.Enabled = False
        End If
        ' <Moh Masrie>
        mnuTasdeedDistributionType.Enabled = !Tax = 1
        mnuTax.Enabled = !Tax = 1
        mnuTasdeedShare.Enabled = !accFari = 1
        mnuCach.Enabled = !accFari = 1
        mnuCentral_Mail.Enabled = !IsAdmin
        .Close
    End With

    Set rs = Nothing
End Sub


Private Sub cmdCalculator_Click()
    Shell "calc.exe", vbNormalFocus
End Sub

Private Sub cmdCancel_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.CancelSave
'    cmdNew.Enabled = True
'    cmdCancel.Enabled = False
'    cmdSave.Enabled = False
End Sub

Private Sub cmdCancelSearch_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.CancelSearch
'    cmdSearch.Enabled = True
'    cmdExecSearch.Enabled = False
'    cmdCancelSearch.Enabled = False
End Sub

Private Sub cmdClose_Click()
    If MDIMain.ActiveForm Is Nothing Then
            RefreshCommands 0
            Unload Me
            Exit Sub
    End If
    Unload MDIMain.ActiveForm
    
    If MDIMain.ActiveForm Is Nothing Then
            RefreshCommands 0
    End If
End Sub

Private Sub cmdDel_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.Delete
End Sub

Private Sub cmdExecSearch_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.Search
'    cmdSearch.Enabled = True
'    cmdExecSearch.Enabled = False
'    cmdCancelSearch.Enabled = False
End Sub

Private Sub cmdFirst_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.MoveFirst
End Sub

Private Sub cmdLast_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.MoveLast
End Sub

Private Sub cmdNew_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.addNew
'    cmdNew.Enabled = False
'    cmdSave.Enabled = True
'    cmdCancel.Enabled = True
End Sub

Private Sub cmdNext_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.MoveNext
End Sub

Private Sub cmdPrev_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.MovePrev
End Sub

Private Sub CmdPrint_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.PrintReport
End Sub

Private Sub cmdSave_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.Save
'    cmdNew.Enabled = True
'    cmdCancel.Enabled = False
'    cmdSave.Enabled = False
End Sub

Private Sub cmdSearch_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.BeginSearch
End Sub

Private Sub cmdUpdate_Click()
    Dim cont As Controller
    Set cont = getController()
    cont.Update
End Sub



Private Sub dlgBrowseOrgVouchers_OnCustomeButtonClick(ByVal Index As Integer)
    Dim Filter
    dlgBrowseOrgVouchers.MousePointer = vbHourglass
    Filter = dlgBrowseOrgVouchers.master.rs.Filter
    If InStr(Filter, "isSummary = 1") > 0 Then 'Summaries only mode
        dlgBrowseOrgVouchers.cmdCustomButton(0).Caption = "«·„Ã«„Ì⁄ ›ﬁÿ"
        If Trim(Replace(dlgBrowseOrgVouchers.master.rs.Filter, "and isSummary = 1", "")) = "" Then
            dlgBrowseOrgVouchers.master.rs.Filter = 0
        Else
            dlgBrowseOrgVouchers.master.rs.Filter = Replace(dlgBrowseOrgVouchers.master.rs.Filter, "and isSummary = 1", "")
        End If
        
        If Trim(Replace(dlgBrowseOrgVouchers.master.rs.Filter, "isSummary = 1", "")) = "" Then
            dlgBrowseOrgVouchers.master.rs.Filter = 0
        Else
            dlgBrowseOrgVouchers.master.rs.Filter = Replace(dlgBrowseOrgVouchers.master.rs.Filter, "isSummary = 1", "")
        End If
        
    Else 'Show all records mode
        dlgBrowseOrgVouchers.cmdCustomButton(0).Caption = "⁄—÷ «·ﬂ·"
        If Filter = 0 Or Filter = "" Then
            dlgBrowseOrgVouchers.master.rs.Filter = " isSummary = 1"
        Else
             dlgBrowseOrgVouchers.master.rs.Filter = dlgBrowseOrgVouchers.master.rs.Filter & " and isSummary = 1"
        End If
    End If
    dlgBrowseOrgVouchers.master.state = ST_UPDATE
    If Not dlgBrowseOrgVouchers.master.rs.EOF Then
        dlgBrowseOrgVouchers.master.rs.MoveFirst
    End If
    dlgBrowseOrgVouchers.MousePointer = vbDefault
End Sub
Private Sub frmBranches_OnDeleteError(theError As ErrObject, Handled As Boolean)
    Handled = True
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·›—⁄° ⁄·Ìﬂ Õ–› «· ‰ﬁ·«  ≈·Ï Â–« «·›—⁄ √Ê·«.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› ›—⁄"
End Sub

Private Sub frmBranches_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
    Handled = True
    msg = "Â‰«·ﬂ ›—⁄ ¬Œ— ·Â «·«”„ –« Â."
End Sub
Private Sub frmDoctorScincePoints_OnDeleteError(theError As ErrObject, Handled As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·‰‘«ÿ° ⁄·Ìﬂ Õ–›Â „‰ «·√‰‘ÿ… «·⁄·„Ì… ··√ÿ»«¡ √Ê·«.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› ‰‘«ÿ"
    Handled = True
End Sub
Private Sub frmDoctorScincePoints_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
    msg = "Â‰«·ﬂ ‰‘«ÿ ⁄·„Ì ¬Œ— ·Â «·«”„ –« Â."
    Handled = True
End Sub
Private Sub frmDoctorForms_OnDeleteError(theError As ErrObject, Handled As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·ÊÀÌﬁ…° ⁄·Ìﬂ Õ–›Â« „‰ ÊÀ«∆ﬁ «·√ÿ»«¡ √Ê·«.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› ÊÀÌﬁ…"
    Handled = True
End Sub

Private Sub frmDoctorForms_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
    msg = "Â‰«·ﬂ ÊÀÌﬁ… √Œ—Ï ·Â« «·«”„ –« Â."
    Handled = True
End Sub

Private Sub frmPaymentIsal_OnAddNew(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    theGrid.TextMatrix(theGrid.Row, 2) = format(Now, "dd/mm/yyyy")
End Sub

Private Sub frmPaymentIsal_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    cancel = Col = 0
End Sub

Private Sub frmPaymentIsal_OnPrint(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim lblCost, lblFormType, lbl As RptLabel
    Dim R As Long
    Dim retStr As String
    Dim PrintTimes As Integer
    R = theGrid.Row

    Set DRFormIsal.DataSource = ExecuteSelect(Conn, "SELECT 1", cancel)
    DRFormIsal.DataMember = ""

    Get_DataReport_Label_byName(DRFormIsal, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblBranchPhone").Caption = Current_State.Phone
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblSerial").Caption = theGrid.TextMatrix(R, 0)
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblFrom").Caption = theGrid.TextMatrix(R, 1)
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblDate").Caption = theGrid.TextMatrix(R, 2)
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblDescription").Caption = theGrid.TextMatrix(R, 3)
    Get_DataReport_Label_byName(DRFormIsal, 1, "lblTotal").Caption = theGrid.TextMatrix(R, 4) & " ·.”"
    '<AHMAD>
    If Current_State.id = 1 Then  'Reef
        For i = 1 To 2
            DRFormIsal.PrintReport
        Next i
        Exit Sub
    End If
    retStr = InputBox("√œŒ· ⁄œœ «·‰”Œ „‰ ›÷·ﬂ", "⁄œœ «·‰”Œ", 2)
    If Not IsNumeric(retStr) Then
        DRFormIsal.PrintReport
    Else
        PrintTimes = val(retStr)
        If PrintTimes > 3 Then PrintTimes = 3
        For i = 1 To PrintTimes
            DRFormIsal.PrintReport
        Next i
    End If
    '</AHMAD>
End Sub

Private Sub frmPaymentIsal_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim cancel As Boolean
    Set rs = ExecuteSelect(Conn, frmPaymentIsal.sql, cancel)
    rs.MoveLast
    theGrid.TextMatrix(theGrid.Row, 0) = rs!id
End Sub

Private Sub frmStockGroup_OnActivateForm()
    With frmStockGroup
        If (.master.state And (ST_UPDATE Or ST_ADDNEW)) <> 0 Then
            Dim op As String
            op = "'ÃœÌœ'"
            If (.master.state And ST_UPDATE) <> 0 Then op = "' ⁄œÌ·'"
            MsgBox "»”»» «— »«ÿ »ÿ«ﬁ… „Ã„Ê⁄… »⁄œ… »ÿ«ﬁ«  √Œ—Ï° ·–·ﬂ ”Ì „ ≈·€«¡ ⁄„·Ì… " & op & " «·Õ«·Ì…° Ê” „  ÕœÌÀ „Õ ÊÏ «·»ÿ«ﬁ….", vbOKOnly Or vbInformation Or vbMsgBoxRight Or vbMsgBoxRtlReading, " ‰»ÌÂ"
            .master.CancelSave
        End If
        .master.rs.Requery
'        If (.master.rs.RecordCount = 0) Then
'            .master.addNew
'        Else
            .master.rs.sort = "Code ASC, Name ASC"
'        End If
        .fg.ColComboList(3) = .fg.ColComboList(3) & "|#-1; "
    End With
End Sub

Private Sub frmStockGroup_OnBeforeEditGrid(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Col = 3 Then
        Dim rs As ADODB.Recordset
        Dim c As Boolean
        Dim sql As String
        Set rs = ExecuteSelect(Conn, "Select Count(*) from Stock_Group", c)
        If rs.Fields(0).Value = 0 Then
            MsgBox "·« ÌÊÃœ „Ã„Ê⁄… —∆Ì”Ì… ·√‰ Â–Â ÂÌ √Ê· „Ã„Ê⁄… Ì „  ⁄—Ì›Â« ›Ì «·„” Êœ⁄", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
            cancel = True
        End If
    End If
End Sub

Private Sub frmStockGroup_OnDeleteError(theError As ErrObject, Handled As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–Â «·„Ã„Ê⁄…° ⁄·Ìﬂ Õ–› „«  ÕÊÌÂ „‰ „Ã„Ê⁄«  Ê„‰ „Ê«œ √Ê·«.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› „Ã„Ê⁄…"
    Handled = True
End Sub

Private Sub frmStockGroup_OnGridChangeEdit(theGrid As VSFlex7Ctl.VSFlexGrid)
    If theGrid.Row < 1 Or theGrid.Col <> 1 Then Exit Sub
    theGrid.editText = Left(theGrid.editText, 10)
End Sub

Private Sub frmStockGroup_OnSave(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset, cancel As Boolean)
    Dim parent As Integer
    parent = Trim(theGrid.TextMatrix(theGrid.Row, 3))
    If parent = -1 Then
        rs!parent = Null
        Dim df As String
        df = GetTagValue(theGrid.Tag, "datafield")
        df = SetTagValue(df, "3", "", ":", ",")
        theGrid.Tag = SetTagValue(theGrid.Tag, "datafield", df)
    End If
End Sub

Private Sub frmStockGroup_OnSaveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    Dim df As String
    df = GetTagValue(theGrid.Tag, "datafield")
    df = SetTagValue(df, "3", "parent", ":", ",")
    theGrid.Tag = SetTagValue(theGrid.Tag, "datafield", df)
End Sub

Private Sub frmStockGroup_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
    msg = "Â‰«·ﬂ „Ã„Ê⁄… √Œ—Ï ·Â« «·«”„ √Ê «·—„“ –« Â."
    Handled = True
End Sub

Private Sub frmStockGroup_OnSaveValidate(theGrid As VSFlex7Ctl.VSFlexGrid, msg As String, isNotValid As Boolean)
    Dim id, parent As Integer
    id = Trim(theGrid.TextMatrix(theGrid.Row, 0))
    If Trim(theGrid.TextMatrix(theGrid.Row, 3)) <> "" Then
        parent = Trim(theGrid.TextMatrix(theGrid.Row, 3))
    Else
        parent = -1
        theGrid.TextMatrix(theGrid.Row, 3) = -1
    End If
    If (frmStockGroup.master.state And ST_ADDNEW) <> 0 Then Exit Sub
    If parent = -1 Then Exit Sub
    isNotValid = (parent = id) Or isChildOf(parent, id)
    msg = "·ﬁœ ﬁ„  »«Œ Ì«— „Ã„Ê⁄… —∆Ì”Ì… „Õ Ê«… ÷„‰ «·„Ã„Ê⁄… «·Õ«·Ì…."
End Sub

Private Sub frmStockUnit_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
    msg = " √ﬂ¯œ „‰ ⁄œ„ ÊÃÊœ Ê«Õœ… √Œ—Ï ·Â« «·«”„ –« Â."
    Handled = True
End Sub

Private Sub frmTasdeedDistributionType_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
    msg = " √ﬂ¯œ „‰ ⁄œ„ ÊÃÊœ «·»Ì«‰ –« Â „”»ﬁ«."
    Handled = True
End Sub

Private Sub frmTasdeedShare_OnGridKeyDown(theGrid As VSFlex7Ctl.VSFlexGrid, KeyCode As Integer, Shift As Integer)
    If theGrid.Col = 4 And theGrid.text = "" And KeyCode = vbKeyReturn Then
        HelpSelectAccount frmTasdeedShare, "caller=,2:3,3:4,;", False, ""
    End If
End Sub

Private Sub frmTasdeedShare_OnGridValidateEdit(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    Dim fltr As String
    Dim numeric As Boolean
    Dim editText As String
    editText = theGrid.editText
    If Col = 4 And editText <> "" Then
        numeric = IsNumeric(editText)
        If numeric Then 'He entered the number of the account
            fltr = "acc='" & editText & "'"
        ElseIf InStr(1, editText, "(") > 0 Then
            fltr = "account like '" & editText & "'"
        Else
            fltr = "name like '" & editText & "'"
        End If
        rsTasdeedAccounts.Filter = fltr
        If rsTasdeedAccounts.RecordCount <> 1 Then
             If numeric Then 'He entered the number of the account
                 fltr = "acc='%" & editText & "%'"
             Else
                 fltr = "name like '%" & editText & "%'"
             End If
             rsTasdeedAccounts.Filter = fltr
        End If
        If rsTasdeedAccounts.RecordCount = 1 Then
            theGrid.editText = rsTasdeedAccounts!Account
            theGrid.TextMatrix(Row, 3) = rsTasdeedAccounts!Num
            Exit Sub
        End If
        theGrid.Cell(flexcpText, theGrid.Row, 3) = ""
        HelpSelectAccount frmTasdeedShare, "caller=,2:3,3:4,;", numeric, editText
        cancel = theGrid.TextMatrix(Row, 3) = ""
    End If
End Sub

Private Sub frmTasdeedShare_OnMoveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    rsTasdeedAccounts.Filter = "num = " & rs!Account
    If rsTasdeedAccounts.RecordCount = 1 Then
        On Error Resume Next
        theGrid.Cell(flexcpText, theGrid.Row, 4) = rsTasdeedAccounts!Account
    End If
End Sub

Private Sub MDIForm_Load()
    Dim strPath As String
    
    
'    If Current_State.id = 1 Then
'        MnuMerge.visible = False
'        MnuSnapShot.visible = False
'    End If
    StB.Panels(4).text = ggConect.ggServer(1)
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    
    ActiveDatabaseName = "default"
    sql = "Select version_id from version"
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If Not cancel Then
        If Not (rs.EOF Or rs.BOF) Then
            StB.Panels(5).text = rs!version_id
        End If
    Else
        If Not isClosingNow Then
            MsgBox "≈‰ ‰”Œ… ﬁ«⁄œ… «·»Ì«‰«  «· Ì Ì⁄„· ⁄·ÌÂ« «·»—‰«„Ã €Ì— „⁄—Ê›… ° «·—Ã«¡ «·« ’«· »„—ﬂ“ «·„‰«—", vbCritical + vbOKOnly, "Œÿ√"
        End If
        End
    End If
    
    If State_ID = 1 Then
        mnuOldArchive.visible = True
    End If
    
    On Error GoTo 10
    strPath = App.Path & "\bg.bmp"
    PMain.Picture = LoadPicture(strPath)
    
'    copy the mdi navigator pitures to c:\

'    SavePicture cmdNew.Picture, "c:\New.bmp"
'    SavePicture cmdUpdate.Picture, "c:\Edit.bmp"
'    SavePicture cmdCancel.Picture, "c:\CancelSave.bmp"
'    SavePicture cmdDel.Picture, "c:\Delete.bmp"
'    SavePicture cmdSearch.Picture, "c:\Search.bmp"
'    SavePicture cmdExecSearch.Picture, "c:\ExeSearch.bmp"
'    SavePicture cmdCancelSearch.Picture, "c:\CancelSearch.bmp"
'    SavePicture cmdPrint.Picture, "c:\Print.bmp"
'    SavePicture cmdCalculator.Picture, "c:\Calculator.bmp"
     'SavePicture cmdSave.Picture, "c:\Save.bmp"
    
    
    
    Exit Sub
10:
    PMain.Picture = LoadPicture("")
    
End Sub
Private Sub MDIForm_QueryUnload(cancel As Integer, UnloadMode As Integer)
    Dim M As VbMsgBoxResult
    M = vbYes
    If Not explicit_close Then
        M = MsgBox("Â·  —Ìœ »«· √ﬂÌœ ≈‰Â«¡ «·»—‰«„Ã ø", vbYesNo + vbQuestion + vbMsgBoxRight, "”ƒ«·")
    End If
    cancel = (M <> vbYes)
End Sub

Private Sub MDIForm_Unload(cancel As Integer)
    On Error Resume Next
    isClosingNow = True
   Close_All_Connections
End Sub

Private Sub mnoKashef_Report_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmKashef_Report.Show
End Sub

Private Sub Mnu_About_Click()
     frmAbout.Show 1
    'frmPicture_Effects.Show
    'Pic_Drawig.Show
End Sub



Private Sub mnu_ElectList_Click()
  ActiveDatabaseName = "Default"
  EnterClinic
  frmElectList.Show
End Sub

Private Sub mnuAbsoulit_Click()
    
    On Error GoTo errHandler
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim rsParameters As ADODB.Recordset
    Dim Acc_Year As String
    Dim LastHissa As Double
    Dim Tajaoz As Double
    
    MousePointer = vbHourglass
        
    Set rsParameters = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadTMP  select top 1 oldHissa,Tajaoz from Acc_Const", cancel)
    
    If cancel Then
        Set rsParameters = Nothing
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    If rsParameters.EOF Or rsParameters.BOF Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ Â–« «· ﬁ—Ì— ·√‰Â ·« ÌÊÃœ ”‰œ«  ﬁÌœ  Œ’ „Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì »⁄œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        MousePointer = vbDefault
        Exit Sub
    End If
    Acc_Year = rsParameters.Fields(0).Value
    Set rsParameters = rsParameters.NextRecordset
    LastHissa = rsParameters.Fields(0).Value
    Tajaoz = rsParameters.Fields(1).Value
    Set rsParameters = Nothing
    
     sql = " Declare @Last_Hissa Numeric " & _
            " Set @Last_Hissa = " & LastHissa & _
            " set dateformat dmy " & _
            " select isNull(zemam.acc,rb.accNum) accNum,accName,ijmali,isNull(Daen,0) as Daen,isNull(Madin,0) as Madin,cast(Ijmali + isNull(Daen,0) - isNull(Madin,0) as numeric) as absoulit, " & _
            " case when Ijmali + isNull(Daen,0) - isNull(Madin,0) >= @Last_Hissa then '‰⁄„' else '·«' end get_Hissa,Doctor_ID, " & _
            " isNull(RasidD,0) as RasidD ,isNull(RasidM,0) as  RasidM " & _
            " From " & _
            " (select accNum,accName,ijmali,Doctor_ID from sf_get_riba_report('01/01/" & Acc_Year & "','31/12/" & Acc_Year & "'," & Tajaoz & " ) ) rb left outer join " & _
            "( " & _
               " select  d.Acc, " & _
               " isNull(case when isNull(sum(isNull(d.d,0)),0) = isNull(sum(isNull(d.m,0)),0) then 0 else isNull(sum(isNull(d.d,0)),0) end,0) Daen, " & _
               " isNull(case when isNull(sum(isNull(d.d,0)),0) = isNull(sum(isNull(d.m,0)),0) then 0 else isNull(sum(isNull(d.m,0)),0) end,0) Madin, " & _
               " isNull(case when  isNull(sum(isNull(d.d,0)),0) - isNull(sum(isNull(d.m,0)),0) > 0 then isNull(sum(isNull(d.d,0)),0) else 0 end,0) rasidD, " & _
               " isNull(case when  isNull(sum(isNull(d.m,0)),0) - isNull(sum(isNull(d.d,0)),0) > 0 then isNull(sum(isNull(d.m,0)),0) else 0 end,0) rasidM " & _
               " from acc_sanad s,acc_detsanad d,acc_accounts a " & _
               " Where s.type not in (4,5) and a.parent = (Select num from acc_accounts where  acc = '270') " & _
               " and a.num = d.acc and s.id = d.sanadid " & _
               " group by d.acc " & _
            ") zemam " & _
            " on zemam.acc = rb.accNum " & _
            " Order by doctor_id"
          
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Set rs = Nothing
        Exit Sub
    End If
    
    Set DrAbsoluteHissa.DataSource = rs
    
    Get_DataReport_Label_byName(DrAbsoluteHissa, 1, "lblAcc_Year").Caption = Acc_Year
    Get_DataReport_Label_byName(DrAbsoluteHissa, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrAbsoluteHissa, 1, "lblHeader").Caption = mnuAbsoulit.Caption
    Get_DataReport_Label_byName(DrAbsoluteHissa, 1, "lblLastHissa").Caption = LastHissa
    
    '<Ashraf>
    Dim rsHissa As ADODB.Recordset
    Dim HasHissaCNT As Integer
    Set rsHissa = rs
    If rsHissa.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ ⁄—÷ «·‰«›–… ·√‰ ⁄œœ «·”Ã·«  = 0"
        MousePointer = vbDefault
        Exit Sub
    Else
        rsHissa.MoveFirst
    End If
    While Not rsHissa.EOF
        If rsHissa!get_Hissa = "‰⁄„" Then HasHissaCNT = HasHissaCNT + 1
        rsHissa.MoveNext
    Wend
    Get_DataReport_Label_byName(DrAbsoluteHissa, 5, "lblHasNoHissaCount").Caption = rs.RecordCount - HasHissaCNT
    Get_DataReport_Label_byName(DrAbsoluteHissa, 5, "lblHasHissaCount").Caption = HasHissaCNT
    '</Ashraf>

    DrAbsoluteHissa.Show 1
    
    Set rs = Nothing
    '<Ashraf>
    Set rsHissa = Nothing
    '</Ashraf>
    
    MousePointer = vbDefault
    Exit Sub
    
errHandler:
    '<Ashraf>
    MousePointer = vbDefault
    '</Ashraf>
    MsgBox Err.description
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
    
End Sub

Private Sub MnuAcc_DailyNewTabib_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_DailyNewTabib.Show
End Sub

Private Sub mnuAcc_Dialy_Browse_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_DailyBrowse.Show
End Sub

Private Sub mnuAcc_Master_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Master.Show
End Sub

Private Sub MnuAccChangeYear_Click()
    
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_ChangeYear.Show vbModal, Me
End Sub

Private Sub MnuAccClose_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_CloseYear.Show vbModal, Me
End Sub

Private Sub MnuAccCloseRiba_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_CloseRibas.Show vbModal, Me
End Sub

Private Sub MnuAccDaily_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_DailyNew.Show
End Sub

Private Sub MnuAccDailyOpening_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_DailyOpening.Show
End Sub

Private Sub MnuAccFariDailyManual_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_DailyNewManual
    F.Show
End Sub

Private Sub MnuAccOldKashf_Click()
    ActiveDatabaseName = "default"
    EnterClinic
    Acc_AddCompanyMotalaba.Show
End Sub

Private Sub MnuAccSandok_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Sandok.Show
End Sub
Private Sub MnuAccTadamonHissa_Click()
    With dlgTadamoniHissa_Date_Filter
        .Caption = .Caption & " - Õ’… «· ÷«„‰ «·›—⁄Ì „‰ «·‰Ÿ«„ «· ⁄«Ê‰Ì" & Acc_DBYear
        .Hissa_Type = 1
        .Show 1
    End With
End Sub

Private Sub MnuAccTadamonHissaFari_Click()
    With dlgTadamoniHissa_Date_Filter
        .Caption = .Caption & " - Õ’… «· ÷«„‰ «·›—⁄Ì „‰ «·›—⁄" & Acc_DBYear
        .Hissa_Type = 0
        .Show 1
    End With
End Sub

Private Sub MnuAccTasdid_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Tasdid.Show
    'Acc_Tasdid.Left = (Screen.Width - Acc_Tasdid.Width) / 2
    End Sub

Private Sub MnuAccTawar2_I3ana_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Acc_Tawar2Help.Show
End Sub

Private Sub MnuAccTawar2_Tasdid_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    '<AHMAD>
        'Acc_TAWAR2Tasdid.Show vbModal, Me
        Acc_NewTawar2Tasdid.Show
    '</AHMAD>
End Sub

Private Sub MnuAccTDalil_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Dalil.Show
End Sub

Private Sub mnuAll_Doctor_Kashef_Click()
    MousePointer = vbHourglass
    EnterClinic
    ActiveDatabaseName = "Default"
    frmAll_Doctor_Kashef.Show
    MousePointer = vbDefault
End Sub

Private Sub mnuAll_Employees_Click()
    ActiveDatabaseName = "Defualt"
    EnterClinic
    frmEmployee_Total_Continuane.Show
End Sub

Private Sub mnuAll_Organization_Kashef_Click()
    MousePointer = vbHourglass
    EnterClinic
    ActiveDatabaseName = "Default"
    frmAll_Organization_Kashef.Show
    MousePointer = vbDefault
End Sub

Private Sub mnuAllCanceledTreats_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmAllCanceledTreatsReport.Show
End Sub

Private Sub mnuArbah_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Arbah.Show
End Sub

Private Sub mnuBarCode_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmBarCode.Show
End Sub

Private Sub mnuBranch_Council_Meeting_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Dim frmBranch_Council_Meeting As New frmCouncil_Meeting
    frmBranch_Council_Meeting.Council_Type = 0
    frmBranch_Council_Meeting.Show
End Sub

Private Sub mnuBranches_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmBranches Is Nothing Then
        Set frmBranches = New frmSqlSelect
        With frmBranches
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Branch AS name FROM Branch ORDER BY 1"
            .ColumnsNames = "«”„ «·›—⁄"
            .FrameCaption = "«·›—Ê⁄"
            .Show
        End With
    Else
        frmBranches.Show
    End If
End Sub

Private Sub mnuBrowseOrgVouchers_Click()
    EnterClinic
    Set dlgBrowseOrgVouchers = New dlgSqlSelect
    With dlgBrowseOrgVouchers
        Screen.MousePointer = vbHourglass
        .GridTag = ";typeof=vsflexgrid;"
        .GridTag = .GridTag & "datafield=,0:accAccounts_Acc,1:Name,2:D,3:M,4:dscrb,5:RasidD,6:RasidM,7:isSummary,;"
        .sql = "select accAccounts_Acc, Name, D, M, dscrb, RasidD, RasidM, isSummary from vBrowseOrgVouchers order by accAccounts_Acc,sort_field,isSummary"
        .ColumnsNames = "—ﬁ„ «·Õ”«»,«”„ «·‘—ﬂ…,œ«∆‰,„œÌ‰,«·‘—Õ,«·—’Ìœ «·œ«∆‰,«·—’Ìœ «·„œÌ‰,"
        .FrameCaption = mnuBrowseOrgVouchers.Caption
'        .Caption = .FrameCaption
        .cmdNew.visible = False
        .cmdUpdate.visible = False
        .cmdCancel.visible = False
        .cmdDel.visible = False
        .cmdSave.visible = False
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        Load dlgBrowseOrgVouchers
        .fg.Cols = 7
        .fg.ColWidth(0) = 200
        .fg.ColWidth(1) = 500
        .fg.ColWidth(2) = 200
        .fg.ColWidth(3) = 200
        .fg.ColWidth(4) = 500
        .fg.ColWidth(5) = 200
        .fg.ColWidth(6) = 200
        .Width = 12000
        Set .Opener = Me
        .cmdCancelDialog.visible = False
        .cmdOK.Caption = "⁄Êœ…"
        .cmdOK.cancel = True
        .cmdCustomButton(0).visible = True
        .cmdCustomButton(0).Caption = "«·„Ã«„Ì⁄ ›ﬁÿ"
        .cmdCustomButton(0).Left = .fg.Left
        Screen.MousePointer = vbDefault
        .Show 1
    End With
End Sub

Private Sub MnuBtnBeginSearch_Click()
    If cmdSearch.Enabled Then
        cmdSearch_Click
    End If
End Sub

Private Sub MnuBtnCancel_Click()
    If cmdCancel.Enabled Then
        cmdCancel_Click
    End If
End Sub

Private Sub MnuBtnCancelSearch_Click()
    If cmdCancelSearch.Enabled Then
        cmdCancelSearch_Click
    End If
End Sub

Private Sub MnuBtnDel_Click()
    If cmdDel.Enabled Then
        cmdDel_Click
    End If
End Sub

Private Sub MnuBtnExecSearch_Click()
    If cmdExecSearch.Enabled Then
        cmdExecSearch_Click
    End If
End Sub

Private Sub MnuBtnFirst_Click()
    If cmdFirst.Enabled Then
        cmdFirst_Click
    End If
End Sub

Private Sub MnuBtnLast_Click()
    If cmdLast.Enabled Then
        cmdLast_Click
    End If
End Sub

Private Sub MnuBTNNew_Click()
    If cmdNew.Enabled Then
        cmdNew_Click
    End If
End Sub

Private Sub MnuBtnNext_Click()
    If cmdNext.Enabled Then
        cmdNext_Click
    End If
End Sub

Private Sub MnuBtnPrev_Click()
    If cmdPrev.Enabled Then
        cmdPrev_Click
    End If
End Sub

Private Sub MnuBtnPrint_Click()
    If cmdPrint.Enabled Then
        CmdPrint_Click
    End If
End Sub

Private Sub MnuBtnSave_Click()
    If cmdSave.Enabled Then
        cmdSave_Click
    End If
End Sub

Private Sub mnuBtnUpdate_Click()
    If cmdUpdate.Enabled Then
        cmdUpdate_Click
    End If
End Sub

Public Sub mnuCentral_Exam_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
'    Set frmCentral_Exam_With_Doctor = New frmCentral_Exam
'    frmCentral_Exam_With_Doctor.with_Examiner_Doctor = True
'    frmCentral_Exam_With_Doctor.Show
    frmCentral_Exam.with_Examiner_Doctor = True
    MousePointer = vbHourglass
    frmCentral_Exam.Show
    MousePointer = vbDefault
End Sub

Private Sub mnuCentral_Exam_Clinc_Report_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmCentral_Exam_Clinc_Report.Show
End Sub

Private Sub mnuCertificationField_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmCertificationField Is Nothing Then
        Set frmCertificationField = New frmSqlSelect
        With frmCertificationField
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Field_Name as Name FROM FixCertificationField ORDER BY 1"
            .ColumnsNames = "«”„ «·«Œ ’«’"
            .FrameCaption = "«·«Œ ’«’« "
            .Show
        End With
    Else
        frmCertificationField.Show
    End If
End Sub

Private Sub mnuCertificationLevel_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmCertificationLevel Is Nothing Then
        Set frmCertificationLevel = New frmSqlSelect
        With frmCertificationLevel
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Level_Name AS Name FROM FixCertificationLevel ORDER BY 1"
            .ColumnsNames = "«·œ—Ã… «·⁄·„Ì…"
            .FrameCaption = "«·œ—Ã… «·⁄·„Ì…"
            .Show
        End With
    Else
        frmCertificationLevel.Show
    End If
End Sub

Private Sub mnuCollaborative_Council_Meeting_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Dim frmCollaborative_Council_Meeting As New frmCouncil_Meeting
    frmCollaborative_Council_Meeting.Council_Type = 1
    frmCollaborative_Council_Meeting.Show
End Sub

Private Sub mnuCollaborative_Doctors_Click()
    MousePointer = vbHourglass
    ActiveDatabaseName = "Default"
    EnterClinic
    frmCollaborative_Doctors.Show
    MousePointer = vbDefault
End Sub

Private Sub mnuCollaborative_Recive_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmCollaborative_Recive.Show
End Sub

Private Sub mnuCollaborative_Send_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmCollaborative_Send.Show
   ' Pic_TeethTreats.Show
End Sub

Private Sub MnuCommTeethTreat_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Pic_CommTreats.Show
End Sub

Private Sub mnuContinuance_Report_Click()
    ActiveDatabaseName = "Default"
     EnterClinic
    'frmEmployee_Continuance_Report.Show
    frmDialy_Report.Show
End Sub

'Private Sub MnuCopy_Click()
'    ActiveDatabaseName = "Default"
'    EnterClinic
'    Pic_CopyTreats.Show 1
'End Sub

Private Sub mnuCouncil_CV_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmCouncil_CV.Show
End Sub

Private Sub mnuDiscount_Click()
    ActiveDatabaseName = "default"
    EnterClinic
    frmDiscounts.Show
End Sub

'Private Sub mnuCouncil_Meeting_Click()
'    ActiveDatabaseName = "Default"
'    EnterClinic
'    frmCouncil_Meeting.Show
'End Sub

Private Sub mnuDoctor_CV_Reports_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmReport_options_Wizard.Show
End Sub

Private Sub mnuDoctorCV_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmDoctorCV.Show
End Sub

Private Sub mnuDoctorForms_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmDoctorForms Is Nothing Then
        Set frmDoctorForms = New frmSqlSelect
        With frmDoctorForms
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,1:cost,;check=,0:required,1:required,;check=,1:integer>0,;"
            .sql = "SELECT Name, Cost FROM FixFormType ORDER BY 1"
            .ColumnsNames = "«”„ «·ÊÀÌﬁ…,«·„»·€"
            .FrameCaption = "«·ÊÀ«∆ﬁ"
            .Show
        End With
    Else
        frmDoctorForms.Show
    End If
End Sub

Private Sub mnuEmployee_CV_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmEmployee_CV.Show
End Sub

Private Sub MnuEnd_Click()
    Unload Me
End Sub


Private Sub mnuExam_Click()
    EnterClinic
    ActiveDatabaseName = "default"
    frmOld_Exam.Show
End Sub

Private Sub mnuExam_Total_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmExam_Total Is Nothing Then
        Set frmExam_Total = New frmSqlSelect
        With frmExam_Total
            .GridTag = ";typeof=vsflexgrid;datafield=,0:Name,1:Price,2:Price1,;check=,0:required,1:integer,2:integer,;"
            .sql = "SELECT Name,Price,Price1 from FixExam_Total ORDER BY 1"
            .ColumnsNames = "«·«”„, ”⁄Ì—… 1, ”⁄Ì—… 2"
            .FrameCaption = "√”⁄«— «·›Õ’"
            .Show
        End With
    Else
        frmExam_Total.Show
    End If
End Sub

Private Sub mnuExaminer_Doctor_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmExaminer_Doctor.Show
End Sub

Private Sub mnuFixOrganization_Type_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmOrganizationType Is Nothing Then
        Set frmOrganizationType = New frmSqlSelect
        With frmOrganizationType
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "Select Organization_Type_Name as name from FixOrganization_Type order by 1"
            .ColumnsNames = "«”„ «· ’‰Ì›"
            .FrameCaption = " ’‰Ì› «·„ƒ””« "
            .Show
        End With
    Else
        frmOrganizationType.Show
    End If
End Sub

Private Sub mnuGlobalTreat_Click()
  ActiveDatabaseName = "Default"
    EnterClinic
    Pic_TreatTree.Show
    
 ' ActiveDatabaseName = "Default"
  '  EnterClinic
  '  If frmMainTreat Is Nothing Then
  '      Set frmMainTreat = New frmSqlSelect
  '      frmMainTreat.FormSettings = btall - btDelete
  '      'frmMainTreat.btnSettings = frmMainTreat.btnSettings - btDelete
  '      With frmMainTreat
  '          .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
  '          .sql = "Select  name  from Pic_GlobalTreatNames order by 1"
  '          .ColumnsNames = "√”„«¡ «·„⁄«·Ã«  «·—∆Ì”Ì…"
  '          .FrameCaption = "«·„⁄«·Ã«  «·—∆Ì”Ì…"
  '          .Show
  '      End With
  '  Else
  '      frmMainTreat.Show
  '  End If
  '  frmMainTreat.FormSettings = btall - btDelete
End Sub
Private Sub frmMainTreat_OnSaveError(theError As ErrObject, ByVal CurrentState As Controller_State, msg As String, Handled As Boolean)
       Handled = True
       msg = "Â‰«·ﬂ „⁄«·Ã… »‰›” «·≈”„ . ÌÃ» ⁄œ„ ≈÷«›… „⁄«·Ã Ì‰ »‰›” «·≈”„."
  
     ' Dim sql As String
     '   sql
     '  Dim unique As Integer
     '   unique = IsUniqValue(sql)
     '   If unique < 0 Then
     '       msg = "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« . «·—Ã«¡«·„Õ«Ê·… „—… √Œ—Ï"
     '       checkType = True
     '       Exit Sub
     '   End If
     '   If unique = 0 Then
     '       msg = "—ﬁ„ «·”‰œ «·–Ì √œŒ· Â „ÊÃÊœ „”»ﬁ«° «·—Ã«¡  ⁄œÌ·Â"
     '       checkType = True
     '       Exit Sub
     '   End If
     '   checkType = False
 '    Handled = True
 '    Dim strError As String
 '   strError = rs.ActiveConnection.Errors(0).description
 '   If InStr(1, strError, "can't modify invoice detail object") Then
 '       msg = "·« Ì„ﬂ‰ﬂ  ⁄œÌ· Õﬁ· «·„«œ… ·√Õœ √ﬁ·«„ «·›« Ê—…° ﬁ„ »Õ–› Â–« «·ﬁ·„ Ê≈œŒ«· ﬁ·„ ÃœÌœ »«·„«œ… «·ÃœÌœ…"
 '   ElseIf InStr(1, strError, "stock unbalanced") Then
 '       msg = "·« Ì„ﬂ‰ ≈ „«„ Â–Â «·⁄„·Ì… ·√‰Â«  ”»» Œ·· ›Ì ﬂ„Ì… «·„Ê«œ."
 '   Else
 '       msg = "·« Ì„ﬂ‰ﬂ ≈œŒ«· ﬁ·„Ì‰ ·‰›” «·„«œ… ›Ì ›« Ê—… Ê«Õœ…."
 '   End If
 '   KeepState = True
 '   msg = "Â–Â «·”‰… „ÊÃÊœ… „”»ﬁ« °«·—Ã«¡ «· √ﬂœ „‰ «·„⁄·Ê„«  «·„œŒ·…"
 '  MousePointer = vbDefault

End Sub

Private Sub mnuHas_Ijmali_Has_No_Signatures_Click()
    On Error GoTo errHandler
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim rsParameters As ADODB.Recordset
    Dim Acc_Year As String
    Dim LastHissa As Double
    Dim Tajaoz As Double
    
    MousePointer = vbHourglass
        
    Set rsParameters = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadTMP  select top 1 oldHissa,Tajaoz from Acc_Const", cancel)
    
    If cancel Then
        Set rsParameters = Nothing
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    If rsParameters.EOF Or rsParameters.BOF Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ Â–« «· ﬁ—Ì— ·√‰Â ·« ÌÊÃœ ”‰œ«  ﬁÌœ  Œ’ „Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì »⁄œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        MousePointer = vbDefault
        Exit Sub
    End If
    If rsParameters.EOF Or rsParameters.BOF Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ Â–« «· ﬁ—Ì— ·√‰Â ·« ÌÊÃœ ”‰œ«  ﬁÌœ  Œ’ „Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì »⁄œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        MousePointer = vbDefault
        Exit Sub
    End If
    Acc_Year = rsParameters.Fields(0).Value
    Set rsParameters = rsParameters.NextRecordset
    LastHissa = rsParameters.Fields(0).Value
    Tajaoz = rsParameters.Fields(1).Value
    Set rsParameters = Nothing
    
     sql = "  Set Dateformat dmy " & _
          "  Select doctor_id,dbo.sf_Get_Doctor_Full_Name(doctor_id) Doctor_Name,0 as ribacount" & _
          "  from   sf_Get_Riba_Report('01/01/" & Acc_Year & "','31/12/" & Acc_Year & "'," & Tajaoz & ") " & _
          "  Where ijmali > 0 and doctor_id in " & _
          " ( " & _
          "   Select Doctor_ID from vQuarter_Signature_Details " & _
          "   Where quarter1 + quarter2 + quarter3 + quarter4 = 0 " & _
          "   And quarter_year = " & Acc_Year & _
          "  ) "
          
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Set rs = Nothing
        Exit Sub
    End If
    
    Set DrSigned_But_Not_In_HissaReport.DataSource = rs
    
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblAcc_Year").Caption = Acc_Year
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblHeader").Caption = mnuHas_Ijmali_Has_No_Signatures.Caption
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblLastHissa").Caption = LastHissa
    
    DrSigned_But_Not_In_HissaReport.Show 1
    
    Set rs = Nothing
    MousePointer = vbDefault
    Exit Sub
    
errHandler:
    MsgBox Err.description
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
End Sub

Private Sub mnuHelpCard_Click()
    EnterClinic
    frmHelpCard.Show
End Sub

Private Sub mnuHelpReport_Click()
    EnterClinic
    frmHelpCard_Report.Show
End Sub

Private Sub mnuHezb_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmHezb Is Nothing Then
        Set frmHezb = New frmSqlSelect
        With frmHezb
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Hezb_Name AS Name FROM FixHezb ORDER BY 1"
            .ColumnsNames = "«·’›… «·Õ“»Ì…"
            .FrameCaption = "«·’›… «·Õ“»Ì…"
            .Show
        End With
    Else
        frmHezb.Show
    End If
End Sub

Private Sub mnuHoliday_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmHolidy Is Nothing Then
        Set frmHolidy = New frmSqlSelect
        With frmHolidy
            .GridTag = ";typeof=vsflexgrid;datafield=,0:Holiday_Name,1:Holiday_Date,;check=,0:required,1:date,;"
            .sql = "Set Dateformat DMY SELECT Holiday_Name,Holiday_Date from FixHoliday ORDER BY Holiday_Date"
            .ColumnsNames = "«”„ «·⁄ÿ·…, «—ÌŒ «·⁄ÿ·…"
            .FrameCaption = "«·⁄ÿ· «·—”„Ì…"
            .Show
        End With
    Else
        frmHolidy.Show
    End If
End Sub

Private Sub mnuIhaleh_Click()
    ActiveDatabaseName = "Default"
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "Select count(*) from central_exam where fixed = 1"
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If rs.Fields(0).Value = 0 Then
        MsgBox " ·«Ì„ﬂ‰ﬂ › Õ Â–Â «·‘«‘… ·√‰Â ·«  ÊÃœ ·œÌﬂ ≈Õ«·«  „À» … »⁄œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    EnterClinic
    frmIhalat.Open_For_Fixing_Ihala = False
'    Set frmIhalat_New = New frmIhalat
'    frmIhalat_New.Show
    frmIhalat.Show
End Sub


Private Sub mnuInharitance_Click()
    EnterClinic
    frmInheritance.Show
End Sub

Private Sub mnuInharitance_Report_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmInharitance_Report.Show
End Sub

Private Sub mnuKashef_Tabib_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmKashef_Tabib.Show
End Sub

Private Sub MnuKashfTabib_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_KashfTabib.Show vbModal, Me
End Sub

Private Sub mnuLecture_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmLecture.Show
End Sub

Private Sub mnuLicenseTypes_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmLicenseType Is Nothing Then
        Set frmLicenseType = New frmSqlSelect
        With frmLicenseType
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT License_Type_Name as name FROM FixLicenseType Order By 1"
            .ColumnsNames = "‰Ê⁄ «· —ŒÌ’"
            .FrameCaption = "√‰Ê«⁄ «· —«ŒÌ’"
            .Show
        End With
    Else
        frmLicenseType.Show
    End If
End Sub

Private Sub mnuLock_Doctor_CV_Click()
    ActiveDatabaseName = "default"
    dlgLock_Doctor_CV.Show 1
End Sub

Private Sub mnuLockHissa_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_CloseHissa.Show vbModal, Me
End Sub

Private Sub Mnulogin_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    FrmAppLogin.cmdCancel.visible = True
    
    FrmAppLogin.Show 1
End Sub

Private Sub mnuMainTreats_Click()
  
End Sub

Private Sub mnuMaxRed_Click()
'<MHD>
    Dim maxRS As ADODB.Recordset
    Dim cansell As Boolean
    Dim maxRedValue As Double
    On Error GoTo fff
    maxRedValue = 12000
    Set maxRS = ExecuteSelect(Conn, "SELECT TOP 1 Rem FROM Version", cansell)
    If Not cansell Then
        If IsNull(maxRS!Rem) Then
            ExecuteCommand Conn, "UPDATE Version SET Rem = '" & maxRedValue & "'", cansell
        Else
            maxRedValue = CDbl(maxRS!Rem)
        End If
    End If
    
Dim strRes As String
strRes = InputBox("ﬁÌ„… «·”ﬁ› «·ﬁœÌ„ " & maxRedValue & "° √œŒ· ﬁÌ„… ÃœÌœ… ·”ﬁ› «·Œ „ «·√Õ„—. ")
If strRes <> "" Then
    maxRedValue = CDbl(strRes)
    If maxRedValue > 0 And maxRedValue < 100000 Then
        ExecuteCommand Conn, "UPDATE Version SET Rem = '" & maxRedValue & "'", cansell
        MsgBox " „  €ÌÌ— ﬁÌ„… «·”ﬁ›.", vbInformation + vbOKOnly, " „  ⁄„·Ì… «·Õ›Ÿ"
    End If
End If
Exit Sub
fff:
  MsgBox "√œŒ· ﬁÌ„… ÕﬁÌﬁÌ….", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
'</MHD>
End Sub

Private Sub mnuMeeting_Clause_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmMeeting_Clause Is Nothing Then
        Set frmMeeting_Clause = New frmSqlSelect
        With frmMeeting_Clause
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,1:text,;check=,1:required,;"
            .sql = "Select Meeting_Clause_Name  as name, Meeting_Clause_Text as Text from FixMeeting_Clause order by 1"
            .ColumnsNames = "«”„ «·»‰œ,«·‰’ «·«› —«÷Ì ··»‰œ"
            .FrameCaption = "»‰Êœ „Õ÷— «Ã „«⁄ «·„Ã·”"
            .Show
        End With
    Else
        frmMeeting_Clause.Show
    End If
End Sub
Private Sub Init(ByRef SQLMerge As SQLMerge, name As String)
    Set SQLDistribution = New SQLDistribution
'    Set SQLMrgSnapshot = New SQLSnapshot
'    Set SQLTxnSnapshot = New SQLSnapshot
    
    On Error GoTo Failure
    
    'Load Merge Subscription Properties
    SQLMerge.Publisher = "SERVER" 'Environ("COMPUTERNAME")
    SQLMerge.PublisherSecurityMode = DB_AUTHENTICATION
    '<AHMAD>
'        SQLMerge.PublisherLogin = "repl_user"
'        SQLMerge.PublisherPassword = "Xeina352004"
         SQLMerge.PublisherLogin = "sa"
         SQLMerge.PublisherPassword = "217"
    '</AHMAD>
    SQLMerge.PublisherDatabase = name '"DocDB"
    SQLMerge.Publication = name '"DocDB"
    SQLMerge.Subscriber = Environ("COMPUTERNAME")
    '<AHMAD>
        'SQLMerge.SubscriberSecurityMode = NT_AUTHENTICATION
        SQLMerge.SubscriberSecurityMode = DB_AUTHENTICATION
        SQLMerge.SubscriberLogin = "sa"
        SQLMerge.SubscriberPassword = "217"
    '</AHMAD>
    SQLMerge.SubscriberDatabase = name '"DocDB"
    SQLMerge.SubscriptionType = ANONYMOUS
    
'    SQLMrgSnapshot.Publisher = Environ("COMPUTERNAME")
'    SQLMrgSnapshot.PublisherDatabase = "Northwind"
'    SQLMrgSnapshot.Distributor = Environ("COMPUTERNAME")
'    SQLMrgSnapshot.Publication = "SampleMergePublication"
'    SQLMrgSnapshot.DistributorSecurityMode = NT_AUTHENTICATION
'    SQLMrgSnapshot.PublisherSecurityMode = NT_AUTHENTICATION
'    SQLMrgSnapshot.ReplicationType = MERGE
       
    Exit Sub
    
Failure:
    PrintErrors SQLDistribution
End Sub

Private Sub DoMerge(ByRef SQLMerge As SQLMerge)
    On Error GoTo Failure
    
    Dim replerr As SQLReplError
    
    FormLoad.ProgressBar.Value = 0
    'ProgressLabel.Caption = "Starting Merge Replication."
    'ProgressLabel.Refresh
    MnuMerge.Enabled = False
    
    'Initialize
    SQLMerge.Initialize
    
    'Run
    SQLMerge.Run
    
    'Terminate
    SQLMerge.Terminate
         
    'Reset objects
    FormLoad.ProgressBar.Value = 0
    MnuMerge.Enabled = True
    
    Exit Sub
        
Failure:
    
    For Each replerr In SQLMerge.ErrorRecords
        MsgBox replerr.description, vbCritical, "SQL Replication Sample Failure"
    Next replerr
    
    'ProgressLabel.Caption = ""
    FormLoad.ProgressBar.Value = 0
    MnuMerge.Enabled = True

End Sub


Private Sub mnuOldIhalat_Click()
    EnterClinic
    ActiveDatabaseName = "Default"
    frmOld_Ihalat.Show
End Sub

Private Sub mnuOpenClosedRibas_Click()
     ActiveDatabaseName = "default"
     EnterClinic
     frmOpenClosedRibas.Show vbModal
End Sub

Private Sub mnuPaymentIsal_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    If Not frmPaymentIsal Is Nothing Then
        Unload frmPaymentIsal
    End If
    Set frmPaymentIsal = New frmSqlSelect
    With frmPaymentIsal
        .GridTag = ";typeof=vsflexgrid;datafield=,0:Id,1:Payer,2:OnDate,3:Description,4:Total,;"
        .GridTag = .GridTag & "check=,2:required,3:required,4:required,;"
        .GridTag = .GridTag & "check=,2:date,4:real>0,;HiddenColumns=,0:true,;"
        .sql = "SELECT  id, Payer, OnDate, Description, Total FROM PaymentsIsal ORDER BY year(ondate),1"
        .ColumnsNames = "—ﬁ„ «·≈Ì’«·,„‰,«· «—ÌŒ,«·»Ì«‰,«·„»·€"
        .FrameCaption = "≈Ì’«·«  «·ﬁ»÷"
        Load frmPaymentIsal
        .FormSettings = btNew Or btsave Or btCancel Or btSearch Or btSearchExec Or btSearchCancel Or btPrint
        .fg.ColHidden(0) = False
        .fg.ColWidth(0) = .fg.ColWidth(1) / 2
        ResizeGrid .fg
        .Show
    End With
End Sub

Private Sub mnuPaymentIsalReport_Click()
    ActiveDatabaseName = "Fari"
    EnterClinic
    'frmPaymentIsalReport.Show
    frmPaymentOrders_Report.Show
End Sub

Private Sub mnuPaymentIsalReview_Click()
    ActiveDatabaseName = "fari"
    Dim c As Boolean
    Dim rs As ADODB.Recordset
    Set rs = ExecuteSelect(Conn, "SELECT count(*) FROM PaymentsTarheelMecanism Where Description like '%Ê«—œ«  „‰ «·ÊÀ«∆ﬁ%'", c)
    If rs.Fields(0).Value < 1 Then
        MsgBox "Ì‘ —ÿ ·› Õ Â–Â «·‘«‘…  ⁄—Ì› ¬·Ì…  Ê“Ì⁄ √Ê«„— «·ﬁ»÷ «”„Â« : Ê«—œ«  „‰ «·ÊÀ«∆ﬁ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    EnterClinic
    frmPaymentIsalReview.Show
End Sub

Private Sub mnuPaymentsMecanisms_Click()
    Dim c As Boolean
    ActiveDatabaseName = "fari"
    EnterClinic
    If Not frmPaymentsMechanism Is Nothing Then
        Unload frmPaymentsMechanism
    End If
    Set frmPaymentsMechanism = New frmSqlSelect
    If Not rsTasdeedAccounts Is Nothing Then
        rsTasdeedAccounts.Close
    End If
    Set rsTasdeedAccounts = ExecuteSelect(Conn, "select num,acc,name, account from DocDbAccM.dbo.vAccounts", c)
    With frmPaymentsMechanism
        .GridTag = ";typeof=vsflexgrid;datafield=,0:Account,1:Description,;"
        .GridTag = .GridTag & "check=,0:required,1:required,;"
        .GridTag = .GridTag & "new=,1:Ê«—œ« ,;"
        .sql = "SELECT Account, Description FROM PaymentsTarheelMecanism"
        .ColumnsNames = ",«·»Ì«‰"
        .FrameCaption = "¬·Ì«   —ÕÌ· ≈Ì’«·«  «·ﬁ»÷ ≈·Ï «·„Õ«”»…"
        Load frmPaymentsMechanism
        .fg.Cols = 3
        .fg.ColHidden(0) = True
        .fg.ColWidth(0) = 0
        .fg.TextMatrix(0, 2) = "≈·Ï Õ”«»"
        .fg.ColWidth(2) = .fg.ColWidth(1)
        .fg.ColAlignment(2) = flexAlignRightCenter
        If .master.rs.RecordCount > 0 Then
            .master.MoveFirst
        End If
        .Show
    End With
End Sub

Private Sub MnuPicPrices_Click()
   ActiveDatabaseName = "Default"
    EnterClinic
    Pic_Prices.Show
End Sub

Private Sub mnuQuick_Search_Click()
    ActiveDatabaseName = "default"
    Dim rsCheck As ADODB.Recordset
    Dim cancel As Boolean
    
    Set rsCheck = ExecuteSelect(Conn, "Select count(*) from Doctor_CV", cancel)
    
    If rsCheck.Fields(0).Value = 0 Then
        MsgBox "·« Ì„ﬂ‰ › Õ Â–Â «·‘«‘… ·√‰ ⁄œœ «·√ÿ»«¡ «·„”Ã·Ì‰ ›Ì «·»—‰«„Ã = 0", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    EnterClinic
    frmQuick_Search.Show
End Sub

Private Sub mnuRecived_Click()
    EnterClinic
    Dim frm As New frmCentral_Mail
    frm.Mail_Type = Recived
    frm.Show
End Sub

Private Sub MnuSAccChangeYear_Click()
     ActiveDatabaseName = "Stock"
    EnterClinic
    Dim F As New Acc_ChangeYear
    F.Show vbModal, Me
End Sub

Private Sub MnuSAccClose_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Acc_CloseYear.Show vbModal, Me
End Sub

Private Sub mnuScincePoints_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmDoctorScincePoints Is Nothing Then
        Set frmDoctorScincePoints = New frmSqlSelect
        With frmDoctorScincePoints
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,1:points,;check=,0:required,1:required,;check=,1:integer>0,;"
            .sql = "SELECT Name, Points FROM FixSciencePoint ORDER BY 1"
            .ColumnsNames = "«·‰‘«ÿ «·⁄·„Ì,⁄œœ «·‰ﬁ«ÿ"
            .FrameCaption = "«·√‰‘ÿ… «·⁄·„Ì…"
            .Show
        End With
    Else
        frmDoctorScincePoints.Show
    End If
End Sub

Private Sub mnuSent_Click()
    EnterClinic
    Dim frm As New frmCentral_Mail
    frm.Mail_Type = Sent
    frm.Show
End Sub

Private Sub mnuServerName_Click()
    Dim serverName As String
    serverName = InputBox("√œŒ· «”„ «·„Œœ„ «·–Ì ÌÕÊÌ ﬁ«⁄œ… «·»Ì«‰« ")
    If serverName = "" Then
        Exit Sub
    End If
    Write_New_HA "Alphabatical", serverName, "MicrosoftTabib", "Anahon"
    StB.Panels(4).text = ggConect.ggServer(1)
    MsgBox "·ﬁœ  „  €ÌÌ— «”„ «·„Œœ„ »‰Ã«Õ  Ê”Ê› Ì „ ≈€·«ﬁ «·»—‰«„Ã «·¬‰", vbInformation + vbOKOnly, serverName
    Close_All_Connections
    End
End Sub

Private Sub mnuSigned_But_Less_Than_LastHissa_Click()
    On Error GoTo errHandler
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim rsParameters As ADODB.Recordset
    Dim Acc_Year As String
    Dim LastHissa As Double
    Dim Tajaoz As Double
    
    MousePointer = vbHourglass
        
    Set rsParameters = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadTMP  select top 1 oldHissa,Tajaoz from Acc_Const", cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Set rsParameters = Nothing
        Exit Sub
    End If
    If rsParameters.EOF Or rsParameters.BOF Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ Â–« «· ﬁ—Ì— ·√‰Â ·« ÌÊÃœ ”‰œ«  ﬁÌœ  Œ’ „Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì »⁄œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        MousePointer = vbDefault
        Exit Sub
    End If
    Acc_Year = rsParameters.Fields(0).Value
    Set rsParameters = rsParameters.NextRecordset
    LastHissa = rsParameters.Fields(0).Value
    Tajaoz = rsParameters.Fields(1).Value
    Set rsParameters = Nothing

    sql = "  Set dateformat dmy " & _
          "  Select doctor_id,dbo.sf_get_doctor_full_name(doctor_id) doctor_name,riba as ribacount " & _
          "  from sf_gethissasanawia(" & Get_Riba_Count & ")" & _
          "  Where Riba > 0 and ijmali + dbo.sf_Get_Doctor_Final_Rasid(AccNum) < " & LastHissa
          
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Set rs = Nothing
        Exit Sub
    End If
             
    
    Set DrSigned_But_Not_In_HissaReport.DataSource = rs
    
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblAcc_Year").Caption = Acc_Year
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblHeader").Caption = mnuSigned_But_Less_Than_LastHissa.Caption
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblLastHissa").Caption = LastHissa
    
    DrSigned_But_Not_In_HissaReport.Show 1
    
    Set rs = Nothing
    MousePointer = vbDefault
    Exit Sub
    
errHandler:
    MsgBox Err.description
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
End Sub

Private Sub mnuSigned_Not_In_Hissa_Click()
    On Error GoTo errHandler
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim rsParameters As ADODB.Recordset
    Dim Acc_Year As String
    Dim LastHissa As Double
    Dim Tajaoz As Double
    
    MousePointer = vbHourglass
        
    Set rsParameters = ExecuteSelect(Conn, "select top 1 YEAR(cDate) Y from acc_sanadTMP  select top 1 oldHissa,Tajaoz from Acc_Const", cancel)
    
    If cancel Then
        Set rsParameters = Nothing
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    If rsParameters.EOF Or rsParameters.BOF Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ Â–« «· ﬁ—Ì— ·√‰Â ·« ÌÊÃœ ”‰œ«  ﬁÌœ  Œ’ „Õ«”»… «·‰Ÿ«„ «· ⁄«Ê‰Ì »⁄œ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        MousePointer = vbDefault
        Exit Sub
    End If
    Acc_Year = rsParameters.Fields(0).Value
    Set rsParameters = rsParameters.NextRecordset
    LastHissa = rsParameters.Fields(0).Value
    Tajaoz = rsParameters.Fields(1).Value
    Set rsParameters = Nothing
    
     sql = " Set dateformat dmy " & _
          "  Select qsd.doctor_id,dbo.sf_Get_Doctor_Full_Name(qsd.doctor_id) Doctor_Name,Sum(sinature_status) as ribacount" & _
          "  from   Quarter_Signature qs,Quarter_Sinature_Details qsd " & _
          "  Where qs.Quarter_id = qsd.Quarter_id " & _
          "  and  qs.Quarter_Year = " & Acc_Year & _
          "  and qsd.Doctor_ID not in " & _
          " (Select Doctor_ID from dbo.sf_GetHissaSanawia(" & Get_Riba_Count & ")) " & _
          " Group by qsd.doctor_id " & _
          "  Having Sum(sinature_status) > 0 "
          
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Set rs = Nothing
        Exit Sub
    End If
    
    Set DrSigned_But_Not_In_HissaReport.DataSource = rs
    
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblAcc_Year").Caption = Acc_Year
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblHeader").Caption = mnuSigned_Not_In_Hissa.Caption
    Get_DataReport_Label_byName(DrSigned_But_Not_In_HissaReport, 1, "lblLastHissa").Caption = LastHissa
    
    DrSigned_But_Not_In_HissaReport.Show 1
    
    Set rs = Nothing
    MousePointer = vbDefault
    Exit Sub
    
errHandler:
    MsgBox Err.description
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
End Sub

Private Sub mnuStatus_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmStatus Is Nothing Then
        Set frmStatus = New frmSqlSelect
        With frmStatus
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Status_Name AS Name FROM FixStatus ORDER BY 1"
            .ColumnsNames = "«·Ê÷⁄ «·—«Â‰"
            .FrameCaption = "«·√Ê÷«⁄ «·—«Â‰…"
            .Show
        End With
    Else
        frmStatus.Show
    End If
End Sub

Private Sub mnuTasdeedDistributionType_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    If frmTasdeedDistributionType Is Nothing Then
        Set frmTasdeedDistributionType = New frmSqlSelect
        With frmTasdeedDistributionType
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Name FROM TasdeedDistributionType ORDER BY 1"
            .ColumnsNames = "«·»Ì«‰"
            .FrameCaption = "√‰Ê«⁄  Ê“Ì⁄«  «·Õ’’"
            .Show
        End With
    Else
        frmTasdeedDistributionType.Show
    End If
End Sub

Private Sub mnuTasdeedShare_Click()
    Dim c As Boolean
    ActiveDatabaseName = "fari"
    EnterClinic
    If Not frmTasdeedShare Is Nothing Then
        Unload frmTasdeedShare
    End If
    Set frmTasdeedShare = New frmSqlSelect
    If Not rsTasdeedAccounts Is Nothing Then
        rsTasdeedAccounts.Close
    End If
    Set rsTasdeedAccounts = ExecuteSelect(Conn, "select num,acc,name, account from DocDbAccM.dbo.vAccounts", c)
    With frmTasdeedShare
        .GridTag = ";typeof=vsflexgrid;datafield=,0:Caption,1:Description,2:CorrespondingSanadDscription,3:Account,;"
        .GridTag = .GridTag & "check=,0:required,1:required,2:required,4:required,;"
        .GridTag = .GridTag & "new=,2:Ê«—œ«  „‰ «· ”œÌœ« ,;"
        .sql = "SELECT Caption, Description, CorrespondingSanadDscription, Account"
        .sql = .sql & vbCrLf & "FROM TasdeedShare ORDER BY 1"
        .ColumnsNames = "«·Õ’…, Ê÷ÌÕ,»Ì«‰  ›’Ì· «·ﬁÌœ «·„ Ê·œ ¬·Ì«,"
        .FrameCaption = "Õ’’  ”œÌœ«  «·—”Ê„ «·”‰ÊÌ…"
        Load frmTasdeedShare
        .fg.Cols = 5
        .fg.ColHidden(3) = True
        .fg.ColWidth(3) = 0
        .fg.TextMatrix(0, 4) = "«·Õ”«» «·Œ«’ »«·Õ’…"
        .fg.ColWidth(4) = .fg.ColWidth(2)
        .fg.ColAlignment(4) = flexAlignRightCenter
        If .master.rs.RecordCount > 0 Then
            .master.MoveFirst
        End If
        .Show
    End With
End Sub

Private Sub mnuTawar2_Limits_Click()
    
    Dim frmTawar2_Limits As frmSqlSelect
    
    ActiveDatabaseName = "tawar2"
    EnterClinic
    If frmTawar2_Limits Is Nothing Then
        Set frmTawar2_Limits = New frmSqlSelect
        With frmTawar2_Limits
            .GridTag = ";typeof=vsflexgrid;datafield=,0:Limit_Year,1:Limit_Value,;check=,0:required,1:required,;check=,0:integer=Year,1:real>0,;"
            .sql = "SELECT * FROM Tawar2_Limits ORDER BY 1 Desc"
            .ColumnsNames = "«·”‰…,«·”ﬁ›"
            .FrameCaption = "”ﬁ› «·≈⁄«‰« "
            .Show
        End With
    Else
        frmTawar2_Limits.Show
    End If
    
End Sub

Private Sub mnuTreat_Click()
  
    
End Sub

Private Sub mnuTreatPrice_Click()
  
End Sub

Private Sub mnuZones_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmZones.Show
End Sub

Private Function SQLDistribution_Status(ByVal Message As String, ByVal Percent As Long) As STATUS_RETURN_CODE
    'Update progress information
    FormLoad.ProgressBar.Value = Percent
    'ProgressLabel.Caption = Message
    
    'Allow other events
    DoEvents
    
    'Setting the return code to CANCEL will cause the control to cancel operation
    SQLDistribution_Status = Success
    
End Function

Private Sub PrintErrors(c As Object)
    If Err.Number <> 0 Then
        MsgBox Err.description, vbCritical, "SQL Replication Sample Failure"
    End If
    
End Sub
Private Function SQLMerge_Status(ByVal Message As String, ByVal Percent As Long) As STATUS_RETURN_CODE
    'Update progress information
    FormLoad.ProgressBar.Value = Percent
    'ProgressLabel.Caption = Message
    
    'Allow other events
    DoEvents
    
    SQLMerge_Status = Success
    
End Function


Private Sub MnuMerge_Click()
'Dim DocDBMerge As SQLMerge
'Dim DocDBAccMerge As SQLMerge
'Dim DocDBAccMMerge As SQLMerge
'Dim DocDBAccTMerge As SQLMerge
'Dim DocDBAccSMerge As SQLMerge
''Set SQLMerge = New SQLMerge
'Set DocDBMerge = New SQLMerge
'Set DocDBAccMerge = New SQLMerge
'Set DocDBAccMMerge = New SQLMerge
'Set DocDBAccTMerge = New SQLMerge
'Set DocDBAccSMerge = New SQLMerge
'Init DocDBMerge, "newDocDB"
'Init DocDBAccMerge, "DocDBAccK"
'Init DocDBAccMMerge, "DocDBAccM"
'Init DocDBAccTMerge, "DocDBAccT"
'Init DocDBAccSMerge, "newDocDBAccS"
'
'DoMerge DocDBMerge
'DoMerge DocDBAccMerge
'DoMerge DocDBAccMMerge
'DoMerge DocDBAccTMerge
'DoMerge DocDBAccSMerge

'Dim pubsDbMerg As New SQLMerge
'Init pubsDbMerg, "pubs"
'DoMerge pubsDbMerg
EnterClinic
frmSyncronize.Show 1

'---------------------------------------------------------------------
'Dim cancel As Boolean
'
'ActiveDatabaseName = "Default"
'
'ExecuteCommand Conn, "exec Start_Syncronizing", cancel
'If cancel Then
'    MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ √À‰«¡ »œ¡ ⁄„·Ì… «·„“«„‰…", vbCritical + vbOKOnly, "Œÿ√"
'    Exit Sub
'End If

'MsgBox " „  ⁄„·Ì… «·„“«„‰… »‰Ã«Õ", vbInformation + vbOKOnly

End Sub

'Private Sub MergeSnapshot_Click()
'    On Error GoTo Failure
'
'    Dim replerr As SQLReplError
'    FormLoad.Show 1
'    FormLoad.ProgressBar.Value = 0
'    'ProgressLabel.Caption = "Starting Merge Snapshot Generation."
'    'ProgressLabel.Refresh
'    MergeSnapshot.Enabled = False
'
'    'Initialize
'    SQLMrgSnapshot.Initialize
'
'    'Run
'    SQLMrgSnapshot.Run
'
'    'Terminate
'    SQLMrgSnapshot.Terminate
'
'    'Reset objects
'    MergeSnapshot.Enabled = True
'
'    Exit Sub
'
'Failure:
'    For Each replerr In SQLMrgSnapshot.ErrorRecords
'        MsgBox replerr.Description, vbCritical, "SQL Replication Sample Failure"
'    Next replerr
'    'ProgressLabel.Caption = ""
'    FormLoad.ProgressBar.Value = 0
'    MergeSnapshot.Enabled = True
'End Sub

Private Function SQLTxnSnapshot_Status(ByVal Message As String, ByVal Percent As Long) As STATUS_RETURN_CODE
    'Update progress information
    FormLoad.ProgressBar.Value = Percent
    'ProgressLabel.Caption = Message
    
    'Allow other events
    DoEvents
    
    'Setting the return code to CANCEL will cause the control to cancel operation
    SQLTxnSnapshot_Status = Success
    
End Function

Private Function SQLMrgSnapshot_Status(ByVal Message As String, ByVal Percent As Long) As STATUS_RETURN_CODE
    'Update progress information
    FormLoad.ProgressBar.Value = Percent
    'ProgressLabel.Caption = Message
    
    'Allow other events
    DoEvents
    
    'Setting the return code to CANCEL will cause the control to cancel operation
    SQLMrgSnapshot_Status = Success
    
End Function


Private Sub mnuMizan_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Mizan.Show
End Sub

Private Sub mnuMizanieh_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Mizanieh.Show
End Sub

Private Sub mnuMotajrah_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    Acc_Motajara.Show
End Sub

Private Sub mnuNationality_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmNationality Is Nothing Then
        Set frmNationality = New frmSqlSelect
        With frmNationality
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Nationality AS Name FROM FixNationality ORDER BY 1"
            .ColumnsNames = "«·Ã‰”Ì…"
            .FrameCaption = "«·Ã‰”Ì« "
            .Show
        End With
    Else
        frmNationality.Show
    End If
End Sub

Private Sub mnuOrganiazation_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmOrganization.Show
End Sub

Private Sub mnuOrganization_Kashef_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmOrganization_Kashef.Show
End Sub

Private Sub mnuOrganizations_Click()
    
    ActiveDatabaseName = "Default"
       
    Dim rsReport As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    
    sql = "   SELECT Organization.Organization_ID, Organization.Organization_Name, " & _
          " FixOrganization_Type.Organization_Type_Name, Organization.Phone, " & _
          " Organization.Fax, Organization.Address FROM Organization INNER JOIN " & _
          " FixOrganization_Type ON Organization.Organization_Type_ID = " & _
          " FixOrganization_Type.Organization_Type_ID "
    
    
    Set rsReport = ExecuteSelect(Conn, sql, cancel)
            
    With DRCompanyList
        Get_DataReport_Label_byName(DRCompanyList, 1, "lblStateName").Caption = Current_State.FullName
        Set .DataSource = rsReport
        .Show 1
    End With
    Set rsReport = Nothing
End Sub

Private Sub mnuPatient_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmPatient.Show
End Sub

Private Sub mnuBranch_Recive_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmBranch_Recive.Show
End Sub

Private Sub mnuBranch_Send_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmBranch_Send.Show
End Sub

Private Sub mnuPatient_Type_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    If frmPatient_Type Is Nothing Then
        Set frmPatient_Type = New frmSqlSelect
        With frmPatient_Type
            .GridTag = ";typeof=vsflexgrid;datafield=,0:Patient_Type,;check=,0:required,1:date,;"
            .sql = "SELECT Patient_Type from FixPatient_Type ORDER BY 1"
            .ColumnsNames = "’›… «·„—Ì÷"
            .FrameCaption = "’›… «·„—Ì÷"
            .Show
        End With
    Else
        frmPatient_Type.Show
    End If
End Sub

Private Sub MnuPrev_Click()
    EnterClinic
    frmPermissions.Show
End Sub

Private Sub mnuQuarter_Signature_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    '<AHMAD>
        'frmQuarter_Signature.Show
        frmNewQuarter_Signature.Show
    '</AHMAD>
End Sub

Private Sub MnuSnapShot_Click()
'    On Error GoTo Failure
'
'    Dim replerr As SQLReplError
'    FormLoad.Show
'    FormLoad.ProgressBar.Value = 0
'    'ProgressLabel.Caption = "Starting Merge Snapshot Generation."
'    'ProgressLabel.Refresh
'    MnuSnapShot.Enabled = False
'
'    Set SQLMrgSnapshot = New SQLSnapshot
'    SQLMrgSnapshot.Publisher = "SERVER" 'Environ("COMPUTERNAME")
'    SQLMrgSnapshot.PublisherSecurityMode = DB_AUTHENTICATION
'    SQLMrgSnapshot.PublisherLogin = "repl_user"
'    SQLMrgSnapshot.PublisherPassword = "Xeina352004"
'    SQLMrgSnapshot.PublisherDatabase = Name '"DocDB"
'    SQLMrgSnapshot.Publication = Name '"DocDB"
'    SQLMrgSnapshot.Subscriber = Environ("COMPUTERNAME")
'    SQLMrgSnapshot.SubscriberSecurityMode = NT_AUTHENTICATION
'    SQLMrgSnapshot.SubscriberDatabase = Name '"DocDB"
'    SQLMrgSnapshot.SubscriptionType = ANONYMOUS
'
'    'Initialize
'    SQLMrgSnapshot.Initialize
'
'    'Run
'    SQLMrgSnapshot.Run
'
'    'Terminate
'    SQLMrgSnapshot.Terminate
'
'    'Reset objects
'    MnuSnapShot.Enabled = True
'
'    Exit Sub
'
'Failure:
'    For Each replerr In SQLMrgSnapshot.ErrorRecords
'        MsgBox "ÕœÀ Œÿ√ ›Ì  Ê·Ìœ «·‰”Œ… «·√Ê·Ì… ·· “«„‰. «·Œÿ√ ÂÊ: " & replerr.Description, vbCritical, "SQL Snapshot Failure"
'    Next replerr
'    'ProgressLabel.Caption = ""
'    FormLoad.ProgressBar.Value = 0
'    MnuSnapShot.Enabled = True
End Sub

Private Sub mnuStartStockObjects_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockStart Is Nothing Then
        Set frmStockStart = New frmStockInvoice
        With frmStockStart
            .InvoiceType = 0
            On Error Resume Next
            .Show
        End With
    Else
        On Error Resume Next
        frmStockStart.Show
    End If
End Sub

Private Sub mnuStockCatalog_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    frmStockCatalog.Show
End Sub

Private Sub mnuStockGroup_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockGroup Is Nothing Then
        Set frmStockGroup = New frmSqlSelect
        With frmStockGroup
            .GridTag = ";typeof=vsflexgrid;"
            .GridTag = .GridTag & "datafield=,0:id,1:code,2:name,3:parent,4:notes,;"
            .GridTag = .GridTag & "check=,1:required,2:required,3:custom,;HiddenColumns=,0:true,;"
            .GridTag = .GridTag & "lookup=,3:Name,;parentFields=,3:Id,;parentTables=,3:Stock_Group,;"
            .sql = "SELECT * FROM Stock_Group Order by Code ASC"
            .ColumnsNames = ",«·—„“,«·«”„,«·„Ã„Ê⁄… «·—∆Ì”Ì…,„·«ÕŸ« "
            .FrameCaption = "»ÿ«ﬁ… „Ã„Ê⁄…"
            Load frmStockGroup
            .Show
        End With
    Else
        frmStockGroup.Show
    End If
End Sub

Private Sub mnuStockInvoiceIn_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockInvoiceIn Is Nothing Then
        Set frmStockInvoiceIn = New frmStockInvoice
        With frmStockInvoiceIn
            .InvoiceType = 1
            .Show
        End With
    Else
        frmStockInvoiceIn.Show
    End If
End Sub

Private Sub mnuStockInvoiceOut_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockInvoiceOut Is Nothing Then
        Set frmStockInvoiceOut = New frmStockInvoice
        With frmStockInvoiceOut
            .InvoiceType = 2
            .Show
        End With
    Else
        frmStockInvoiceOut.Show
    End If
End Sub

Private Sub mnuStockJard_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockObjectsJard Is Nothing Then
        Set frmStockObjectsJard = New frmStockJard
        With frmStockObjectsJard
            .JardKind = 0
            .Caption = mnuStockJard.Caption
            .Show
        End With
    Else
        frmStockObjectsJard.Show
    End If
End Sub

Private Sub mnuStockObject_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    frmStockObject.Show
End Sub

Private Sub mnuStockObjectsExpired_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    frmStockObjectsExpired.Show
End Sub

Private Sub mnuStockObjectsOver_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockObjectsOver Is Nothing Then
        Set frmStockObjectsOver = New frmStockJard
        With frmStockObjectsOver
            .JardKind = 2
            .Caption = mnuStockObjectsOver.Caption
            .Show
        End With
    Else
        frmStockObjectsOver.Show
    End If
End Sub

Private Sub mnuStockObjectsUnder_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockObjectsUnder Is Nothing Then
        Set frmStockObjectsUnder = New frmStockJard
        With frmStockObjectsUnder
            .JardKind = 1
            .Caption = mnuStockObjectsUnder.Caption
            .Show
        End With
    Else
        frmStockObjectsUnder.Show
    End If
End Sub

Public Sub mnuStockUnits_Click()
    ActiveDatabaseName = "Stock"
    EnterClinic
    If frmStockUnit Is Nothing Then
        Set frmStockUnit = New frmSqlSelect
        With frmStockUnit
            .GridTag = ";typeof=vsflexgrid;datafield=,0:name,;check=,0:required,;"
            .sql = "SELECT Name FROM Stock_Unit ORDER BY 1"
            .ColumnsNames = "«”„ «·Ê«Õœ…"
            .FrameCaption = "«·Ê«Õœ« "
            .Show
        End With
    Else
        frmStockUnit.Show
    End If
End Sub

Private Sub mnuTabib_Recive_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmTabib_Recive.Show
End Sub

Private Sub mnuTabib_Send_Click()
    ActiveDatabaseName = "Default"
    EnterClinic
    frmTabib_Send.Show
End Sub

Private Sub mnuTax_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    frmTasdeedDecisions.Show
End Sub

'Private Sub MnuTeethImg_Click()
'EnterClinic
'Pic_TeethImg.Show 1
'End Sub

'Private Sub MnuTeethTreats_Click()
'    EnterClinic
'    Pic_TeethTreats.Show
'End Sub

Private Sub mnuUniversity_Click()
    ActiveDatabaseName = "Default"
    If frmUniversity Is Nothing Then
        Set frmUniversity = New frmSqlSelect
    End If
    EnterClinic
    With frmUniversity
        .GridTag = ";typeof=vsflexgrid;datafield=,0:name,1:city,2:country,;check=,0:required,1:required,2:required,;"
        .sql = "SELECT University AS name, City AS city, Country AS country From FixUniversity ORDER BY University_Id"
        .ColumnsNames = "«”„ «·Ã«„⁄…,«·„œÌ‰…,«·œÊ·…"
        .FrameCaption = "«·Ã«„⁄« "
        .Show
    End With
End Sub

Public Sub mnuWithout_Doctor_Click()
    
'    Set frmCentral_Exam_Without_Doctor = New frmCentral_Exam
'    frmCentral_Exam_Without_Doctor.with_Examiner_Doctor = False
'    frmCentral_Exam_Without_Doctor.Show

    ActiveDatabaseName = "Default"
    EnterClinic
    Set frmCentral_Exam_Without_Doctor = New frmCentral_Exam
    frmCentral_Exam_Without_Doctor.with_Examiner_Doctor = False
    frmCentral_Exam_Without_Doctor.Show
End Sub

Private Sub StB_PanelClick(ByVal Panel As MSComctlLib.Panel)
If Panel = "≈‰Â«¡ «·»—‰«„Ã" Then
'    Dim M
'    M = MsgBox("Â·  —Ìœ »«· √ﬂÌœ ≈‰Â«¡ «·»—‰«„Ã ø", vbYesNo + vbQuestion + vbMsgBoxRight, "”ƒ«·")
'    If M = vbYes Then End
    Unload Me
End If
End Sub


Private Function isChildOf(ByVal id As String, ByVal parent As String) As Boolean
    isChildOf = False
    Dim rsChildren As ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    sql = "SELECT Id, Parent FROM Stock_Group Where Parent "
    If parent = "" Then
        sql = sql & "IS NULL"
    Else
        sql = sql & "= " & parent
    End If
    Set rsChildren = ExecuteSelect(Conn, sql, cancel)
    If rsChildren.RecordCount = 0 Then
        Exit Function
    End If
    rsChildren.MoveFirst
    Do While Not rsChildren.EOF
        ' Handling corrupted data
        If (rsChildren!id = parent) Then
            isChildOf = (parent = id)
            Exit Do
        End If
        isChildOf = (rsChildren!id = id)
        If isChildOf Then
            Exit Do
        End If
        isChildOf = isChildOf(id, rsChildren!id)
        If isChildOf Then
            Exit Do
        Else
            rsChildren.MoveNext
        End If
    Loop
    Set rsChildren = Nothing
End Function

Private Sub mnuAccS_Dialy_Browse_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_DailyBrowse
    F.Show
End Sub

Private Sub mnuAccS_Master_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Master
    F.Show
End Sub

'Private Sub mnuAccSChangeYear_Click()
'    ActiveDatabaseName = "stock"
'    EnterClinic
'    Dim f As New Acc_ChangeYear
'    f.Show vbModal, Me
'End Sub

'Private Sub mnuAccSClose_Click()
'    ActiveDatabaseName = "stock"
'    EnterClinic
'    Dim f As New Acc_CloseYear
'    f.Show vbModal, Me
'End Sub

Private Sub mnuAccSDaily_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_DailyNew
    F.Show
End Sub

Private Sub mnuAccSDailyOpening_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_DailyOpening
    F.Show
End Sub

Private Sub mnuAccSSandok_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Sandok
    F.Show
End Sub

Private Sub mnuAccSTDalil_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Dalil
    F.Show
End Sub

Private Sub mnuSArbah_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Arbah
    F.Show
End Sub

Private Sub mnuSMizan_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Mizan
    F.Show
End Sub

Private Sub mnuSMizanieh_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Mizanieh
    F.Show
End Sub

Private Sub mnuSMotajrah_Click()
    ActiveDatabaseName = "stock"
    EnterClinic
    Dim F As New Acc_Motajara
    F.Show
End Sub

Private Sub mnuAccFari_Dialy_Browse_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_DailyBrowse
    F.Show
End Sub

Private Sub mnuAccFari_Master_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Master
    F.Show
End Sub

Private Sub mnuAccFariChangeYear_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_ChangeYear
    F.Show vbModal, Me
End Sub

Private Sub mnuAccFariClose_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_CloseYear
    F.Show vbModal, Me
End Sub

Private Sub mnuAccFariDaily_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_DailyNew
    F.Show
End Sub

Private Sub mnuAccFariDailyOpening_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_DailyOpening
    F.Show
End Sub

Private Sub mnuAccFariSandok_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Sandok
    F.Show
End Sub

Private Sub mnuAccFariTDalil_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Dalil
    F.Show
End Sub

Private Sub mnuFariArbah_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Arbah
    F.Show
End Sub

Private Sub mnuFariMizan_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Mizan
    F.Show
End Sub

Private Sub mnuFariMizanieh_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Mizanieh
    F.Show
End Sub

Private Sub mnuFariMotajrah_Click()
    ActiveDatabaseName = "fari"
    EnterClinic
    Dim F As New Acc_Motajara
    F.Show
End Sub

Private Sub mnuAccTadamon_Dialy_Browse_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_DailyBrowse
    F.Show
End Sub

Private Sub mnuAccTadamon_Master_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Master
    F.Show
End Sub

Private Sub mnuAccTadamonChangeYear_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_ChangeYear
    F.Show vbModal, Me
End Sub

Private Sub mnuAccTadamonClose_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_CloseYear
    F.Show vbModal, Me
End Sub

Private Sub mnuAccTadamonDaily_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_DailyNew
    F.Show
End Sub

Private Sub mnuAccTadamonDailyOpening_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_DailyOpening
    F.Show
End Sub

Private Sub mnuAccTadamonSandok_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Sandok
    F.Show
End Sub

Private Sub mnuAccTadamonTDalil_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Dalil
    F.Show
End Sub

Private Sub mnuTadamonArbah_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Arbah
    F.Show
End Sub

Private Sub mnuTadamonMizan_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Mizan
    F.Show
End Sub

Private Sub mnuTadamonMizanieh_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Mizanieh
    F.Show
End Sub

Private Sub mnuTadamonMotajrah_Click()
    ActiveDatabaseName = "tadamonfari"
    EnterClinic
    Dim F As New Acc_Motajara
    F.Show
End Sub

Private Sub mnuAccTawar2_Dialy_Browse_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_DailyBrowse
    F.Show
End Sub

Private Sub mnuAccTawar2_Master_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_Master
    F.Show
End Sub

Private Sub mnuAccTawar2ChangeYear_Click()
    
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_ChangeYear
    F.Show vbModal, Me
End Sub

Private Sub mnuAccTawar2Close_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_CloseYear
    F.Show vbModal, Me
End Sub

Private Sub mnuAccTawar2Daily_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_DailyNew
    F.Show
End Sub

Private Sub mnuAccTawar2DailyOpening_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_DailyOpening
    F.Show
End Sub

Private Sub mnuAccTawar2Sandok_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_Sandok
    F.Show
End Sub

Private Sub mnuAccTawar2TDalil_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_Dalil
    F.Show
End Sub

Private Sub mnuTawar2Arbah_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_Arbah
    F.Show
End Sub

Private Sub mnuTawar2Mizan_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_Mizan
    F.Show
End Sub

Private Sub mnuTawar2Mizanieh_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic
    Dim F As New Acc_Mizanieh
    F.Show
End Sub

Private Sub mnuTawar2Motajrah_Click()
    ActiveDatabaseName = "tawar2"
    EnterClinic

    Dim F As New Acc_Motajara
    F.Show
End Sub

Public Sub ExitClinic()
    PMain.visible = True
    PP.visible = True
    CoolBar.visible = False
'    OpenConnection conn
End Sub

Private Sub Timer1_Timer()
    If ActiveForm Is Nothing Then
        ExitClinic
    End If
End Sub

Private Sub HelpSelectAccount(ByRef Caller As Form, ByVal callerAction As String, ByVal numeric As Boolean, ByVal editText As String)
    Caller.btnSettings = GetBtnSettings
    GLOBAL_TAG = ";datafield=,0:acc,1:name,2:num,3:account,;"
    GLOBAL_TAG = GLOBAL_TAG & callerAction
    If numeric Then
        GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & editText & ",;"
    Else
        GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & editText & ",;"
    End If
    GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select num,acc,name, account from DocDbAccM.dbo.vAccounts;"
    Clin_List.fg.Cols = 4
    Clin_List.fg.ColHidden(3) = True: Clin_List.fg.ColHidden(2) = True
    Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
    Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
    Clin_List.fg.ColWidth(2) = 0: Clin_List.fg.ColWidth(3) = 0
    Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
    Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
    Clin_List.fg.Row = 1
    If numeric Then
        Clin_List.fg.Col = 0
    Else
        Clin_List.fg.Col = 1
    End If
    Set Clin_List.CallerForm = Caller
    Clin_List.Show 1
    RefreshCommands Caller.btnSettings And Caller.FormSettings
End Sub

Private Sub frmPaymentsMechanism_OnGridKeyDown(theGrid As VSFlex7Ctl.VSFlexGrid, KeyCode As Integer, Shift As Integer)
    If theGrid.Col = 2 And theGrid.text = "" And KeyCode = vbKeyReturn Then
        HelpSelectAccount frmPaymentsMechanism, "caller=,2:0,3:2,;", False, ""
    End If
End Sub

Private Sub frmPaymentsMechanism_OnGridValidateEdit(theGrid As VSFlex7Ctl.VSFlexGrid, ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    Dim fltr As String
    Dim numeric As Boolean
    Dim editText As String
    editText = theGrid.editText
    If Col = 2 And editText <> "" Then
        numeric = IsNumeric(editText)
        If numeric Then 'He entered the number of the account
            fltr = "acc='" & editText & "'"
        ElseIf InStr(1, editText, "(") > 0 Then
            fltr = "account like '" & editText & "'"
        Else
            fltr = "name like '" & editText & "'"
        End If
        rsTasdeedAccounts.Filter = fltr
        If rsTasdeedAccounts.RecordCount <> 1 Then
             If numeric Then 'He entered the number of the account
                 fltr = "acc='%" & editText & "%'"
             Else
                 fltr = "name like '%" & editText & "%'"
             End If
             rsTasdeedAccounts.Filter = fltr
        End If
        If rsTasdeedAccounts.RecordCount = 1 Then
            theGrid.editText = rsTasdeedAccounts!Account
            theGrid.TextMatrix(Row, 0) = rsTasdeedAccounts!Num
            Exit Sub
        End If
        theGrid.Cell(flexcpText, theGrid.Row, 0) = ""
        HelpSelectAccount frmPaymentsMechanism, "caller=,2:0,3:2,;", numeric, editText
        cancel = theGrid.TextMatrix(Row, 0) = ""
    End If
End Sub

Private Sub frmPaymentsMechanism_OnMoveCompleted(theGrid As VSFlex7Ctl.VSFlexGrid, rs As ADODB.Recordset)
    rsTasdeedAccounts.Filter = "num = " & rs!Account
    If rsTasdeedAccounts.RecordCount = 1 Then
        On Error Resume Next
        theGrid.Cell(flexcpText, theGrid.Row, 2) = rsTasdeedAccounts!Account
    End If
End Sub
Public Sub OnSqlSelected(dlg As dlgSqlSelect)

End Sub

