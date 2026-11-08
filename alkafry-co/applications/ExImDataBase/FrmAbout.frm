VERSION 5.00
Begin VB.Form FrmAbout 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   ClientHeight    =   3000
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7500
   LinkTopic       =   "Form1"
   Picture         =   "FrmAbout.frx":0000
   ScaleHeight     =   3000
   ScaleWidth      =   7500
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Image imgBack 
      Height          =   285
      Left            =   2760
      Top             =   2700
      Width           =   1530
   End
End
Attribute VB_Name = "FrmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub imgBack_Click()
    FrmMain.Show
    FrmAbout.Hide
End Sub
