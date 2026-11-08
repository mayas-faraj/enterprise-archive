VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "«·”Ã· «·Õ”«»Ì"
   ClientHeight    =   10950
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
   Picture         =   "frmMain.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.Image cmdCost 
      Height          =   615
      Left            =   12120
      Top             =   6720
      Width           =   2295
   End
   Begin VB.Image cmdEnter 
      Height          =   495
      Left            =   12120
      Top             =   5880
      Width           =   2175
   End
   Begin VB.Image command3 
      Height          =   495
      Left            =   9240
      Top             =   7680
      Width           =   2295
   End
   Begin VB.Image cmdAbout 
      Height          =   615
      Left            =   6480
      Top             =   7560
      Width           =   2295
   End
   Begin VB.Image cmdExit 
      Height          =   615
      Left            =   3600
      Top             =   7560
      Width           =   2175
   End
   Begin VB.Image command2 
      Height          =   615
      Left            =   840
      Top             =   6720
      Width           =   2175
   End
   Begin VB.Image cmdCompany 
      Height          =   615
      Left            =   3600
      Top             =   6720
      Width           =   2175
   End
   Begin VB.Image command1 
      Height          =   495
      Left            =   6600
      Top             =   6720
      Width           =   2175
   End
   Begin VB.Image cmdDahan 
      Height          =   495
      Left            =   9360
      Top             =   6720
      Width           =   2175
   End
   Begin VB.Image cmdAccount 
      Height          =   495
      Left            =   9360
      Top             =   5880
      Width           =   2175
   End
   Begin VB.Image cmdKind 
      Height          =   495
      Left            =   6600
      Top             =   5880
      Width           =   2175
   End
   Begin VB.Image cmdShow 
      Height          =   495
      Left            =   3720
      Top             =   5880
      Width           =   2175
   End
   Begin VB.Image cmdMath 
      Height          =   495
      Left            =   840
      Top             =   5880
      Width           =   2175
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdAbout_Click()
    frmAbout.Show
    frmMain.Hide
End Sub

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

Private Sub Image8_Click()

End Sub
