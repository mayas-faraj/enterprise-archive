VERSION 5.00
Begin VB.Form dlgSaveReport 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Õ›Ÿ «· ﬁ—Ì—"
   ClientHeight    =   1980
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   1980
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txt 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   308
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   405
      Width           =   3210
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   398
      TabIndex        =   1
      Top             =   1395
      Width           =   1365
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Õ›Ÿ"
      Default         =   -1  'True
      Height          =   375
      Left            =   2918
      TabIndex        =   0
      Top             =   1395
      Width           =   1365
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«”„ «·„·›"
      Height          =   240
      Left            =   3683
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   472
      Width           =   690
   End
End
Attribute VB_Name = "dlgSaveReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
    
    If txt.text = "" Then Exit Sub
    
    frmReport_options_Wizard.fg.SaveGrid App.Path & "\" & txt.text & ".mnr", flexFileAll, True
    Unload Me
    MsgBox " „  ⁄„·Ì… «·Õ›Ÿ »‰Ã«Õ", vbInformation + vbOKOnly, "Õ›Ÿ"
    
    
    
End Sub

Private Sub Form_Load()
    FormatForm Me
End Sub
