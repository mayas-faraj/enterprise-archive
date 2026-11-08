VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   6480
   ClientLeft      =   165
   ClientTop       =   555
   ClientWidth     =   7155
   LinkTopic       =   "Form1"
   ScaleHeight     =   6480
   ScaleWidth      =   7155
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    frmMain.Width = Screen.Width
    frmMain.Height = Screen.Height
    MasStart (frmMain)
End Sub

