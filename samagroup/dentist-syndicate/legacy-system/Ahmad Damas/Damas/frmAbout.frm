VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   0  'None
   ClientHeight    =   7005
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmAbout.frx":0000
   ScaleHeight     =   7005
   ScaleWidth      =   9885
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOk 
      BackColor       =   &H80000018&
      Caption         =   "≈€·«ﬁ"
      Height          =   375
      Left            =   8550
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   6525
      Width           =   1230
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i As Long
Private Sub cmdOK_Click()
    Unload Me
End Sub


