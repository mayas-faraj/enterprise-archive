VERSION 5.00
Begin VB.Form FrmAppLogin 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "«·œŒÊ· ≈·Ï «·»—‰«„Ã"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   5730
   Icon            =   "frmAppLogin.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2175
   ScaleWidth      =   5730
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtUser 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   540
      MaxLength       =   30
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   360
      Width           =   3360
   End
   Begin VB.TextBox txtPwd 
      Alignment       =   2  'Center
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   540
      MaxLength       =   30
      PasswordChar    =   "*"
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   960
      Width           =   3360
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   2115
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1665
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   4095
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton CEnd 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Œ—ÊÃ „‰ «·»—‰«„Ã"
      Height          =   375
      Left            =   135
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«”„ «·„” Œœ„"
      Height          =   195
      Index           =   2
      Left            =   4276
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   450
      Width           =   915
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ﬂ·„… «·„—Ê—"
      Height          =   195
      Index           =   0
      Left            =   4358
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1050
      Width           =   750
   End
End
Attribute VB_Name = "FrmAppLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub CEnd_Click()
    If cmdCancel.visible = True Then
        Unload MDIMain
    Else
        End
    End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub COk_Click()
set_appUser txtUser.text, txtPwd.text
If Current_AppUser.id <> 0 Then
        Close #200
        Open "c:\user.txt" For Output As #200
        Print #200, txtUser.text
        Close #200
        Unload Me
        With MDIMain
            .Set_Permissions
            Do While Not .ActiveForm Is Nothing
                Unload .ActiveForm
            Loop
            .Show
            .Caption = "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ " + " - „Õ«›Ÿ… " + Current_State.name
            .Caption = .Caption & " - «”„ «·„” Œœ„" & " " & Current_AppUser.name
        End With
    Else
        MsgBox "«·—Ã«¡ «· √ﬂœ „‰ «”„ «·„” Œœ„ Êﬂ·„… «·„—Ê—.", vbOKOnly + vbCritical + vbMsgBoxRight, " ‰»ÌÂ"
End If
End Sub
Sub set_appUser(User_name As String, Pwd As String)
    
    Dim rs As New ADODB.Recordset
    Dim Cancel As Boolean
    Dim Sql As String
    
    Sql = "select Id,Full_Name,IsAdmin from users where upper(user_name) = '" & UCase(User_name) & "' and upper(password)" & _
          " = '" & UCase(Pwd) & "'"
    Set rs = ExecuteSelect(Conn, Sql, Cancel)
    
    If rs.EOF Or rs.BOF Then
        chkUser = 0
     Else
        Current_AppUser.id = rs.Fields(0).Value
        Current_AppUser.name = rs.Fields(1).Value
        If rs.Fields(2).Value = 0 Then
            Current_AppUser.IsAdmin = False
        Else
            Current_AppUser.IsAdmin = True
        End If
    End If
    
    Set rs = Nothing

End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Default"
    '<Ashraf>
    txtPwd.SetFocus
    '</Ashraf>
End Sub

Private Sub Form_Load()
    On Error GoTo 10
    Dim str As String
    Open "c:\user.txt" For Input As #255
    Input #255, str
    Close #255
    txtUser.text = str
10:
End Sub


