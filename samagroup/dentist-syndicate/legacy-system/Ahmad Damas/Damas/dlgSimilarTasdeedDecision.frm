VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form dlgSimilarTasdeedDecision 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "√œŒ· „Õœœ«  «·ﬁ—«— «·ÃœÌœ"
   ClientHeight    =   2700
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7245
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2700
   ScaleWidth      =   7245
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00E1FEFF&
      ForeColor       =   &H80000008&
      Height          =   2055
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   120
      Width           =   6975
      Begin VB.TextBox txtCaption 
         Alignment       =   1  'Right Justify
         Height          =   855
         Left            =   180
         MaxLength       =   200
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Top             =   390
         Width           =   6675
      End
      Begin MSComCtl2.DTPicker dtSince 
         Height          =   375
         Left            =   5160
         TabIndex        =   4
         Top             =   1590
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40106
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«⁄ »«—« „‰  «—ÌŒ"
         Height          =   195
         Index           =   0
         Left            =   5760
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄‰Ê«‰ «·ﬁ—«—"
         Height          =   195
         Index           =   1
         Left            =   6045
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   120
         Width           =   810
      End
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2280
      Width           =   1515
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   5520
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2280
      Width           =   1515
   End
End
Attribute VB_Name = "dlgSimilarTasdeedDecision"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public CallerForm As Form

Private Sub cmdCancel_Click()
    CallerForm.DialogResult = False
    Unload Me
End Sub

Private Sub cmdOK_Click()
    CallerForm.DecisionCaption = txtCaption.text
    CallerForm.DecisionDate = dtSince.Value
    CallerForm.DialogResult = True
    Unload Me
End Sub

Private Sub Form_Load()
    txtCaption.text = CallerForm.DecisionCaption
    dtSince.Value = Date
    CallerForm.DialogResult = False
End Sub
