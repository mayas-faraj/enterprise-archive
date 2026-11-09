VERSION 5.00
Begin VB.Form Clin_BrowseFile 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "«Œ Ì«— ’Ê—… ·„⁄«·Ã…"
   ClientHeight    =   6450
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5145
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   6450
   ScaleWidth      =   5145
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "≈·€«¡"
      Height          =   375
      Left            =   120
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   5880
      Width           =   1695
   End
   Begin VB.CommandButton cmdOk 
      BackColor       =   &H00C0C0C0&
      Caption         =   "„Ê«›ﬁ"
      Height          =   375
      Left            =   2520
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   5880
      Width           =   1695
   End
   Begin VB.FileListBox File1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   5160
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   4815
   End
End
Attribute VB_Name = "Clin_BrowseFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdOk_Click()
    If File1.FileName = "" Then Exit Sub
    Pic_Drawig.Text3.Text = File1.FileName
    Unload Me
End Sub

Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub File1_DblClick()
   cmdOk_Click
End Sub

Private Sub Form_Load()
    With File1
        .Path = App.Path & "\treats"
    End With
End Sub

