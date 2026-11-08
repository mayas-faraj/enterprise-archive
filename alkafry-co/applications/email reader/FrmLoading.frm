VERSION 5.00
Begin VB.Form FrmLoading 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   3000
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   8250
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   11.25
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FrmLoading.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   3000
   ScaleWidth      =   8250
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   45
      Top             =   2535
   End
End
Attribute VB_Name = "FrmLoading"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Timer1_Timer()
Rep = Rep + 1
If Rep = 1 Then
    FrmChoose.Show
    FrmLoading.Show
End If
If Rep = 2 Then Unload FrmLoading
End Sub
