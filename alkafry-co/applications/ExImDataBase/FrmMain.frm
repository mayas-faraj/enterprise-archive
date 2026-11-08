VERSION 5.00
Begin VB.Form FrmMain 
   BackColor       =   &H00F9DDE4&
   BorderStyle     =   0  'None
   Caption         =   "«·”Ã· «·Õ”«»Ì"
   ClientHeight    =   11520
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15360
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   8.25
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmMain.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "FrmMain.frx":06C2
   ScaleHeight     =   11520
   ScaleWidth      =   15360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.ComboBox CmbYear 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "FrmMain.frx":1B2E9
      Left            =   12285
      List            =   "FrmMain.frx":1B308
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Text            =   "2006"
      Top             =   8370
      Width           =   1185
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "FrmMain.frx":1B342
      Left            =   13515
      List            =   "FrmMain.frx":1B344
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   8370
      Width           =   855
   End
   Begin VB.Label lblDes 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2280
      Left            =   3945
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   7005
      Width           =   7155
   End
   Begin VB.Image ImgExit 
      Height          =   495
      Left            =   12180
      Top             =   9765
      Width           =   2250
   End
   Begin VB.Image ImgAbout 
      Height          =   510
      Left            =   12225
      Top             =   9075
      Width           =   2205
   End
   Begin VB.Image ImgShow 
      Height          =   480
      Left            =   12210
      Top             =   7635
      Width           =   2220
   End
   Begin VB.Image ImgEnter 
      Height          =   465
      Left            =   12405
      Top             =   6900
      Width           =   2025
   End
   Begin VB.Image ImgMath 
      Height          =   525
      Left            =   13185
      Top             =   6150
      Width           =   1245
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    For Rep = 0 To 8
        CmbMonth.List(Rep) = "0" & (Rep + 1)
    Next Rep
    For Rep = 9 To 11
        CmbMonth.List(Rep) = Rep + 1
    Next Rep
    CmbMonth.Text = "01"
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lblDes.Caption = "" Then Exit Sub
    lblDes.Caption = ""
End Sub

Private Sub Form_Unload(Cancel As Integer)
   ExitPro
End Sub

Private Sub ImgAbout_Click()
    FrmAbout.Show
    FrmMain.Hide
End Sub

Private Sub ImgAbout_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lblDes.Caption <> "" Then Exit Sub
    lblDes.Caption = "⁄—÷  ›«’Ì· ⁄‰ «·„‰ Ã"
End Sub

Private Sub ImgEnter_Click()
    FrmEnter.Show
    FrmMain.Hide
End Sub

Private Sub ImgEnter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lblDes.Caption <> "" Then Exit Sub
    lblDes.Caption = "«·≈‰ ﬁ«· ≈·Ï ’›Õ… ≈œŒ«· «·»Ì«‰«  Ê Õ›ŸÂ« ›Ì «·‰Ÿ«„"
End Sub

Private Sub ImgExit_Click()
    ExitPro
    
End Sub

Private Sub ImgExit_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lblDes.Caption <> "" Then Exit Sub
    lblDes.Caption = "«·Œ—ÊÃ „‰ «·»—‰«„Ã"
End Sub

Private Sub ImgMath_Click()
    FrmMath.Show
    FrmMain.Hide
End Sub

Private Sub ImgMath_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lblDes.Caption <> "" Then Exit Sub
    lblDes.Caption = "Õ”«» «·Ã—œ «·”‰ÊÌ ·Õ”«» «·‘—ﬂ…"
End Sub

Private Sub ImgShow_Click()
    MonthNum = CmbMonth.Text
    YearNum = CmbYear.Text
    FrmShow.Show
    FrmMain.Hide
End Sub

Private Sub ImgShow_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lblDes.Caption <> "" Then Exit Sub
    lblDes.Caption = "⁄—÷ «·„⁄·Ê„«  «·„”Ã·… ›Ì ﬁ«⁄œ… »Ì«‰«  «·‘—ﬂ…"

End Sub
