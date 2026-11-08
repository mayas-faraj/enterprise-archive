VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   3000
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   7500
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmAbout.frx":0000
   ScaleHeight     =   3000
   ScaleWidth      =   7500
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label lblBack 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÚæÏÉ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00004000&
      Height          =   375
      Left            =   120
      MouseIcon       =   "frmAbout.frx":B91B
      MousePointer    =   99  'Custom
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub lblBack_Click()
    frmAbout.Hide
    frmLogIn.Show
End Sub
