VERSION 5.00
Begin VB.Form FrmChoose 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   11490
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   15330
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
   Picture         =   "FrmChoose.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   11490
   ScaleWidth      =   15330
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.Shape shpSelectKind 
      BorderColor     =   &H00BF471A&
      BorderWidth     =   3
      Height          =   1590
      Left            =   13575
      Shape           =   3  'Circle
      Top             =   2400
      Width           =   1410
   End
   Begin VB.Shape shpSelectCity 
      BorderColor     =   &H00008000&
      BorderWidth     =   3
      Height          =   1050
      Left            =   5385
      Shape           =   3  'Circle
      Top             =   6690
      Width           =   1110
   End
   Begin VB.Image imgBuild 
      Appearance      =   0  'Flat
      Height          =   1620
      Index           =   5
      Left            =   195
      Top             =   9045
      Width           =   1620
   End
   Begin VB.Image imgBuild 
      Appearance      =   0  'Flat
      Height          =   1620
      Index           =   4
      Left            =   210
      Top             =   7275
      Width           =   1620
   End
   Begin VB.Image imgBuild 
      Appearance      =   0  'Flat
      Height          =   1620
      Index           =   3
      Left            =   210
      Top             =   5475
      Width           =   1620
   End
   Begin VB.Image imgBuild 
      Appearance      =   0  'Flat
      Height          =   1620
      Index           =   2
      Left            =   225
      Top             =   3675
      Width           =   1620
   End
   Begin VB.Image imgBuild 
      Appearance      =   0  'Flat
      Height          =   1620
      Index           =   1
      Left            =   210
      Top             =   1920
      Width           =   1620
   End
   Begin VB.Image imgBuild 
      Appearance      =   0  'Flat
      Height          =   1620
      Index           =   0
      Left            =   240
      Top             =   195
      Width           =   1620
   End
   Begin VB.Image imgEnd 
      Height          =   1065
      Left            =   2880
      Top             =   10125
      Width           =   1185
   End
   Begin VB.Image imgKind 
      Appearance      =   0  'Flat
      Height          =   1215
      Index           =   1
      Left            =   13815
      Top             =   4155
      Width           =   1215
   End
   Begin VB.Image imgKind 
      Appearance      =   0  'Flat
      Height          =   1020
      Index           =   0
      Left            =   13680
      Top             =   2685
      Width           =   1125
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   495
      Index           =   11
      Left            =   9120
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   615
      Index           =   10
      Left            =   9120
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   495
      Index           =   9
      Left            =   7560
      Top             =   3840
      Width           =   1095
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   495
      Index           =   8
      Left            =   5640
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   615
      Index           =   7
      Left            =   5640
      Top             =   4680
      Width           =   1095
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   615
      Index           =   6
      Left            =   5640
      Top             =   3240
      Width           =   975
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   615
      Index           =   5
      Left            =   5400
      Top             =   5520
      Width           =   1095
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   735
      Index           =   4
      Left            =   4200
      Top             =   4920
      Width           =   1095
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   735
      Index           =   3
      Left            =   4320
      Top             =   4080
      Width           =   975
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   615
      Index           =   2
      Left            =   5040
      Top             =   8160
      Width           =   615
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   1
      Left            =   5760
      Top             =   8040
      Width           =   975
   End
   Begin VB.Image imgCity 
      Appearance      =   0  'Flat
      Height          =   735
      Index           =   0
      Left            =   5280
      Top             =   6825
      Width           =   1335
   End
   Begin VB.Label lblDescription 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Height          =   495
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   10440
      Width           =   5895
   End
   Begin VB.Image CmdEnter 
      Height          =   2535
      Left            =   13080
      Top             =   8640
      Width           =   1935
   End
End
Attribute VB_Name = "FrmChoose"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const strEnter As String = "⁄—÷ Ã„Ì⁄ «·—”«∆· «·„Œ «—…"
Const strEnd As String = "«·Œ—ÊÃ „‰ «·»—‰«„Ã"
Private Sub cmdEnter_Click()
FrmMain.Show
FrmChoose.Hide
End Sub
Private Sub CmdEnter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblDescription.Caption = strEnter Then Exit Sub
lblDescription.Caption = strEnter
End Sub

Private Sub Form_Load()
bytBuild = 0
BytCity = 0
bytKind = 0
imgBuild(0).Picture = LoadPicture(App.Path & "\file\picture\build(0).jpg")
End Sub

Private Sub lblBuy_Click(Index As Integer)
bytBuild = lblBuy(Index).Index
Select Case lblBuy(Index).Index
    Case 0
        shpSelectBuild.Left = 4040
    Case 1
        shpSelectBuild.Left = 5280
    Case 2
        shpSelectBuild.Left = 6480
    Case 3
        shpSelectBuild.Left = 7680
    Case 4
        shpSelectBuild.Left = 8880
    Case 5
        shpSelectBuild.Left = 10150
End Select
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblDescription.Caption = "" Then Exit Sub
lblDescription.Caption = ""
End Sub

Private Sub imgBuild_Click(Index As Integer)
For Rep = 0 To 5
    imgBuild(Rep).Picture = LoadPicture("")
Next Rep
bytBuild = imgBuild(Index).Index
imgBuild(Index).Picture = LoadPicture(App.Path & "\file\picture\build(" & imgBuild(Index).Index & ").jpg")
End Sub

Private Sub imgCity_Click(Index As Integer)
BytCity = imgCity(Index).Index
Select Case Index
    Case 0
        shpSelectCity.Left = 5385
        shpSelectCity.Top = 6690
    Case 1
        shpSelectCity.Left = 5640
        shpSelectCity.Top = 7980
    Case 2
        shpSelectCity.Left = 4845
        shpSelectCity.Top = 7980
    Case 3
        shpSelectCity.Left = 4380
        shpSelectCity.Top = 3915
    Case 4
        shpSelectCity.Left = 4245
        shpSelectCity.Top = 4770
    Case 5
        shpSelectCity.Left = 5490
        shpSelectCity.Top = 5325
    Case 6
        shpSelectCity.Left = 5580
        shpSelectCity.Top = 2940
    Case 7
        shpSelectCity.Left = 5700
        shpSelectCity.Top = 4485
    Case 8
        shpSelectCity.Left = 5505
        shpSelectCity.Top = 3720
    Case 9
        shpSelectCity.Left = 7590
        shpSelectCity.Top = 3570
    Case 10
        shpSelectCity.Left = 9135
        shpSelectCity.Top = 4260
    Case 11
        shpSelectCity.Left = 9150
        shpSelectCity.Top = 2715
End Select
End Sub

Private Sub imgEnd_Click()
    End
End Sub

Private Sub imgEnd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If lblDescription.Caption = strEnd Then Exit Sub
lblDescription.Caption = strEnd
End Sub

Private Sub imgKind_Click(Index As Integer)
bytKind = imgKind(Index).Index
If imgKind(Index).Index = 0 Then
    shpSelectKind.Left = 13575
    shpSelectKind.Top = 2400
Else
    shpSelectKind.Left = 13740
    shpSelectKind.Top = 3975
End If
End Sub

