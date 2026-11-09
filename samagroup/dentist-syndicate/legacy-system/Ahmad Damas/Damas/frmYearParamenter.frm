VERSION 5.00
Begin VB.Form frmYearParameter 
   Caption         =   "√œŒ· «·”‰… «· Ì  —Ìœ «·«” ⁄·«„ ⁄‰Â«"
   ClientHeight    =   1455
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4560
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   1455
   ScaleWidth      =   4560
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   330
      Left            =   1890
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   945
      Width           =   1050
   End
   Begin VB.CommandButton cmdViewReport 
      Caption         =   "⁄—÷ «· ﬁ—Ì—"
      Height          =   330
      Left            =   3105
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   945
      Width           =   1050
   End
   Begin VB.TextBox txtYear 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   360
      MaxLength       =   4
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   360
      Width           =   2580
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·”‰…"
      Height          =   195
      Left            =   3105
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   450
      Width           =   1050
   End
End
Attribute VB_Name = "frmYearParameter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdViewReport_Click()
    If val(txtYear.text) > 0 And Len(txtYear.text) = 4 Then
        Tawar2_Report_Year = val(txtYear.text)
        Acc_MasterRep.Show 1, MDIMain
        Unload Me
    Else
        MsgBox "«·—Ã«¡ «· √ﬂœ „‰ ≈œŒ«· «·”‰… »‘ﬂ· ’ÕÌÕ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
    End If
End Sub
Private Sub Form_Load()
    FormatForm Me
End Sub
Private Sub txtYear_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        cmdViewReport_Click
        Exit Sub
    ElseIf KeyAscii = 27 Then
        Unload Me
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub
