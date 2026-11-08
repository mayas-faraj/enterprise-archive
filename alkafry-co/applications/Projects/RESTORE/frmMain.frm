VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "«·”Ã· «·Õ”«»Ì"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   12
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   7800
      Width           =   2655
   End
   Begin VB.CommandButton cmdAbout 
      Caption         =   "⁄‰ «·»—‰«„Ã"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   7080
      Width           =   2655
   End
   Begin VB.CommandButton cmdCompany 
      Caption         =   "’«œ— ⁄‰ «·‘—ﬂ« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   6360
      Width           =   2655
   End
   Begin VB.CommandButton cmdCost 
      Caption         =   "’›Õ… «·“»«∆‰"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   5640
      Width           =   2655
   End
   Begin VB.CommandButton cmdMath 
      Caption         =   "«·Ã—œ «·Õ”«»Ì"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   4920
      Width           =   2655
   End
   Begin VB.CommandButton cmdShow 
      Caption         =   "⁄—÷ «·„‘ —Ì« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   4200
      Width           =   2655
   End
   Begin VB.CommandButton cmdKind 
      Caption         =   "«·ﬁÿ⁄ «·„ Ê›—…"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   3480
      Width           =   2655
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "≈œŒ«· «·»Ì«‰« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   2760
      Width           =   2655
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "«·”Ã· «·Õ”«»Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   5520
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   600
      Width           =   4215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdCost_Click()
    frmMain.Hide
    frmGuest.Show
End Sub

Private Sub cmdEnter_Click()
    frmEnter.Show
    frmMain.Hide
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub cmdKind_Click()
    frmKind.Show
    frmMain.Hide
End Sub
