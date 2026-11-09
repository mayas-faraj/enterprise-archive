VERSION 5.00
Begin VB.Form dlgBrowseFile 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "«Œ Ì«—  ﬁ—Ì— „Õ›ÊŸ „”»ﬁ«"
   ClientHeight    =   6450
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   6450
   ScaleWidth      =   5010
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdDelete 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Õ–›"
      Height          =   375
      Left            =   180
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   5880
      Width           =   1200
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "≈·€«¡"
      Default         =   -1  'True
      Height          =   375
      Left            =   1935
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   5880
      Width           =   1200
   End
   Begin VB.CommandButton cmdOk 
      BackColor       =   &H00C0C0C0&
      Caption         =   "„Ê«›ﬁ"
      Height          =   375
      Left            =   3690
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   5880
      Width           =   1200
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
      Pattern         =   "*.mnr"
      TabIndex        =   0
      Top             =   480
      Width           =   4815
   End
   Begin VB.Label lblFileName 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   180
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   45
      Width           =   4740
   End
End
Attribute VB_Name = "dlgBrowseFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdDelete_Click()
    Dim msg As VbMsgBoxResult
    If File1.FileName = "" Then Exit Sub
    msg = MsgBox("Â·  —Ìœ ›⁄·« Õ–› Â–« «·„·›ø", vbQuestion + vbYesNo, "”ƒ«·")
    If msg <> vbYes Then Exit Sub
    Kill (App.Path + "\" + File1.FileName)
    File1.Refresh
End Sub

Private Sub cmdOk_Click()
    
    If File1.FileName = "" Then Exit Sub
        
    frmReport_options_Wizard.fg.LoadGrid App.Path & "\" & File1.FileName, flexFileAll, True
    
    Unload Me
    
End Sub

Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub File1_Click()
    lblFileName.Caption = File1.FileName
End Sub

Private Sub File1_DblClick()
   cmdOk_Click
End Sub

Private Sub Form_Load()
    FormatForm Me
    With File1
        .Path = App.Path
    End With
End Sub

