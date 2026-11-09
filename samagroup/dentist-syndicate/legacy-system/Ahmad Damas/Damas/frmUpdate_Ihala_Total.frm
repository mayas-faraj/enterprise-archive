VERSION 5.00
Begin VB.Form frmUpdate_Ihala_Total 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " ⁄œÌ· ﬁÌ„… «·≈Õ«·… —ﬁ„ :"
   ClientHeight    =   3930
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5490
   Icon            =   "frmUpdate_Ihala_Total.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   3930
   ScaleWidth      =   5490
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   720
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   3360
      Width           =   1455
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3225
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   3360
      Width           =   1455
   End
   Begin VB.TextBox txtNew_Total 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   2520
      Width           =   3855
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·„»·€ «·ÃœÌœ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   4005
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Label lblOld_Total 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   1800
      Width           =   3855
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·„»·€ «·ﬁœÌ„"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   4005
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1800
      Width           =   1455
   End
   Begin VB.Label lblCurer_Doctor_Name 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   1320
      Width           =   3855
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«”„ «·ÿ»Ì»"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   4005
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1320
      Width           =   1455
   End
   Begin VB.Label lblPatient_Name 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   840
      Width           =   3855
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«”„ «·„—Ì÷"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   4005
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   840
      Width           =   1455
   End
   Begin VB.Label lblCentral_Exam_ID 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   360
      Width           =   3855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "—ﬁ„ «·≈Õ«·…"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   375
      Left            =   4005
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   360
      Width           =   1455
   End
End
Attribute VB_Name = "frmUpdate_Ihala_Total"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
    Dim Cancel As Boolean
    If Trim(txtNew_Total.text) = "" Then
        Dim msg As VbMsgBoxResult
        msg = MsgBox("ÌÃ» ≈œŒ«· ﬁÌ„…’ÕÌÕ… ›Ì Â–Â «·Œ«‰… √Ê «·÷€ÿ ⁄·Ï “— ≈·€«¡ «·√„—", vbCritical, "Œÿ√ ≈œŒ«·")
        Exit Sub
    End If
     
    Dim Sql As String
    
    Sql = "Update Central_Exam Set whole_Total = " & val(txtNew_Total.text) & _
          " Where Central_Exam_ID = " & val(lblCentral_Exam_ID.Caption)

    ExecuteCommand Conn, Sql, Cancel
    
    Unload Me
    
End Sub

Private Sub txtNew_Total_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
