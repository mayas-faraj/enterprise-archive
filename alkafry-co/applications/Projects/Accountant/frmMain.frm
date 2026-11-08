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
   Begin VB.CommandButton Command3 
      Caption         =   "«·„— Ã⁄"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   8400
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "«·—’Ìœ «·ﬂ·Ì"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   7200
      Width           =   2655
   End
   Begin VB.CommandButton Command1 
      Caption         =   "«·„‘ —Ì« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   6600
      Width           =   2655
   End
   Begin VB.CommandButton cmdDahan 
      Caption         =   "„·› «·œÂ«‰Ì‰"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   6000
      Width           =   2655
   End
   Begin VB.CommandButton cmdAccount 
      Caption         =   "≈œŒ«· ›« Ê—…"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   2400
      Width           =   2655
   End
   Begin VB.CommandButton cmdExit 
      Cancel          =   -1  'True
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   9000
      Width           =   2655
   End
   Begin VB.CommandButton cmdAbout 
      Caption         =   "⁄‰ «·»—‰«„Ã"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   7800
      Width           =   2655
   End
   Begin VB.CommandButton cmdCompany 
      Caption         =   "’«œ— ⁄‰ «·‘—ﬂ« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   5400
      Width           =   2655
   End
   Begin VB.CommandButton cmdCost 
      Caption         =   "’›Õ… «·“»«∆‰"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   4800
      Width           =   2655
   End
   Begin VB.CommandButton cmdMath 
      Caption         =   "«·Ã—œ «·Õ”«»Ì"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   4200
      Width           =   2655
   End
   Begin VB.CommandButton cmdShow 
      Caption         =   "⁄—÷ «·„‘ —Ì« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   3600
      Width           =   2655
   End
   Begin VB.CommandButton cmdKind 
      Caption         =   "«·ﬁÿ⁄ «·„ Ê›—…"
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   3000
      Width           =   2655
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "≈œŒ«· «·»Ì«‰« "
      Height          =   495
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1800
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

Private Sub cmdAccount_Click()
    frmEnterMany.Show
    frmMain.Hide
End Sub

Private Sub cmdCompany_Click()
    frmCoOut.Show
    frmMain.Hide
End Sub

Private Sub cmdCost_Click()
    frmMain.Hide
    frmGuest.Show
End Sub

Private Sub cmdDahan_Click()
    frmMain.Hide
    frmDahan.Show
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

Private Sub cmdMath_Click()
    frmMain.Hide
    frmAll.Show
    
End Sub

Private Sub cmdShow_Click()
    frmShow.Show
    frmMain.Hide
End Sub

Private Sub Command1_Click()
    frmOut.Show
    frmMain.Hide
End Sub

Private Sub Command2_Click()
    frmBox.Show
    frmMain.Hide
End Sub

Private Sub Command3_Click()
    frmMain.Hide
    frmRest.Show
End Sub

Private Sub Form_Load()
    Dim RegNum As String
    RegNum = GetSetting("interdiv", "internet", "i136", "0")
    If RegNum <> "interdiv8661ussr" Then
        MsgBox "value not match in the database", vbOKOnly + vbCritical, "system cash memory"
        End
    End If
End Sub
