VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FormLoad 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1440
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   ScaleHeight     =   1440
   ScaleWidth      =   5565
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CEnd 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÎÑæÌ"
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   840
      Width           =   1400
   End
   Begin MSComctlLib.ProgressBar ProgressBar 
      Height          =   375
      Left            =   255
      TabIndex        =   0
      Top             =   360
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
      Scrolling       =   1
   End
End
Attribute VB_Name = "FormLoad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CEnd_Click()
Unload Me
End Sub

