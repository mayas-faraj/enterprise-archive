VERSION 5.00
Begin VB.Form frmLogIn 
   Caption         =   "»—‰«„Ã «·„ÊŸ›Ê‰"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   Icon            =   "frmLogIn.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "frmLogIn.frx":0442
   RightToLeft     =   -1  'True
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   Begin VB.Image botTotal 
      Height          =   495
      Left            =   840
      MouseIcon       =   "frmLogIn.frx":185F3
      MousePointer    =   99  'Custom
      Top             =   5400
      Width           =   2175
   End
   Begin VB.Image botLast 
      Height          =   495
      Left            =   3720
      MouseIcon       =   "frmLogIn.frx":18A35
      MousePointer    =   99  'Custom
      Top             =   5400
      Width           =   2175
   End
   Begin VB.Image botAbout 
      Height          =   495
      Left            =   8040
      MouseIcon       =   "frmLogIn.frx":18E77
      MousePointer    =   99  'Custom
      Top             =   6360
      Width           =   2175
   End
   Begin VB.Image botChange 
      Height          =   495
      Left            =   6600
      MouseIcon       =   "frmLogIn.frx":192B9
      MousePointer    =   99  'Custom
      Top             =   5400
      Width           =   2175
   End
   Begin VB.Image botAdd 
      Height          =   495
      Left            =   9480
      MouseIcon       =   "frmLogIn.frx":196FB
      MousePointer    =   99  'Custom
      Top             =   5400
      Width           =   2175
   End
   Begin VB.Image botPay 
      Height          =   495
      Left            =   12360
      MouseIcon       =   "frmLogIn.frx":19B3D
      MousePointer    =   99  'Custom
      Top             =   5400
      Width           =   2175
   End
   Begin VB.Image botExit 
      Appearance      =   0  'Flat
      Height          =   495
      Left            =   4920
      MouseIcon       =   "frmLogIn.frx":19F7F
      MousePointer    =   99  'Custom
      Top             =   6360
      Width           =   2295
   End
End
Attribute VB_Name = "frmLogIn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub botAbout_Click()
        frmLogIn.Hide
        frmAbout.Show
End Sub

Private Sub botAdd_Click()
    frmLogIn.Hide
    frmAddEmploy.Show
End Sub

Private Sub botChange_Click()
    frmLogIn.Hide
    frmEditEmploy.Show
End Sub

Private Sub botExit_Click()
    ExitProg
End Sub

Private Sub botLast_Click()
    frmLogIn.Hide
    frmEmpMath.Show
End Sub

Private Sub botPay_Click()
    frmLogIn.Hide
    frmMath.Show
End Sub

Private Sub botTotal_Click()
    frmLogIn.Hide
    frmTotals.Show
End Sub

Private Sub Form_Load()
    frmLogIn.Width = Screen.Width
    frmLogIn.Height = Screen.Height
End Sub
