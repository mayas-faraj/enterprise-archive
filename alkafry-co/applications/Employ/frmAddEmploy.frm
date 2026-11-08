VERSION 5.00
Begin VB.Form frmAddEmploy 
   Caption         =   "”Ã· «·„ÊŸ›Ì‰"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
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
   Picture         =   "frmAddEmploy.frx":0000
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command3 
      BackColor       =   &H00004000&
      Caption         =   "≈” ⁄«œ… „ÊŸ›"
      Enabled         =   0   'False
      Height          =   4695
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   3480
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.ListBox lstEmploy 
      BackColor       =   &H00E9FEEC&
      Height          =   4650
      Left            =   2640
      TabIndex        =   12
      Top             =   3480
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.TextBox txtDate 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8640
      TabIndex        =   11
      Text            =   " "
      Top             =   6960
      Width           =   2895
   End
   Begin VB.TextBox txtPay 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8640
      TabIndex        =   10
      Top             =   6360
      Width           =   2895
   End
   Begin VB.TextBox txtAddress 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8640
      TabIndex        =   9
      Text            =   " "
      Top             =   5760
      Width           =   2895
   End
   Begin VB.TextBox txtMobile 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8640
      TabIndex        =   8
      Text            =   " "
      Top             =   5160
      Width           =   2895
   End
   Begin VB.TextBox txtPhone 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8640
      TabIndex        =   7
      Text            =   " "
      Top             =   4560
      Width           =   2895
   End
   Begin VB.TextBox txtName 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8640
      TabIndex        =   6
      Text            =   " "
      Top             =   3960
      Width           =   2895
   End
   Begin VB.Image Command2 
      Height          =   1215
      Left            =   5040
      MouseIcon       =   "frmAddEmploy.frx":15AFF
      MousePointer    =   99  'Custom
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Image Command1 
      Height          =   615
      Left            =   12120
      MouseIcon       =   "frmAddEmploy.frx":15F41
      MousePointer    =   99  'Custom
      Top             =   9120
      Width           =   2295
   End
   Begin VB.Image cmdExit 
      Height          =   495
      Left            =   1320
      MouseIcon       =   "frmAddEmploy.frx":16383
      MousePointer    =   99  'Custom
      Top             =   9240
      Width           =   2175
   End
   Begin VB.Image cmdBack 
      Height          =   615
      Left            =   8400
      MouseIcon       =   "frmAddEmploy.frx":167C5
      MousePointer    =   99  'Custom
      Top             =   9120
      Width           =   2295
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ «· ÊŸÌ›"
      Height          =   495
      Left            =   11760
      TabIndex        =   5
      Top             =   6960
      Width           =   1695
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„— » «·’«›Ì"
      Height          =   375
      Left            =   11760
      TabIndex        =   4
      Top             =   6360
      Width           =   1695
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·⁄‰Ê«‰"
      Height          =   255
      Left            =   11760
      TabIndex        =   3
      Top             =   5760
      Width           =   1695
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·ÃÊ«·"
      Height          =   375
      Left            =   11700
      TabIndex        =   2
      Top             =   5160
      Width           =   1815
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "—ﬁ„ «·Â« ›"
      Height          =   375
      Left            =   11760
      TabIndex        =   1
      Top             =   4560
      Width           =   1695
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "≈”„ «·„ÊŸ›"
      Height          =   255
      Left            =   11880
      TabIndex        =   0
      Top             =   3960
      Width           =   1455
   End
End
Attribute VB_Name = "frmAddEmploy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    frmAddEmploy.Hide
    frmLogIn.Show
End Sub

Private Sub cmdExit_Click()
    ExitProg
End Sub

Private Sub Command1_Click()
    Beep
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "insert into tblemploy (dname,dfire,dpay,dphone,dmobile,daddress,ddate) values ('" & txtName.Text & "',0," & txtPay.Text & ",'" & txtPhone.Text & "','" & txtMobile.Text & "','" & txtAddress.Text & "','" & txtDate.Text & "')"
    Set RS = ADO.Execute(selSQL)
    ADO.Close
    Set RS = Nothing
    txtName.Text = " "
    txtPhone.Text = " "
    txtAddress.Text = " "
    txtPay.Text = ""
    txtDate.Text = " "
    txtMobile = " "
End Sub

Private Sub Command2_Click()
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "select * from tblemploy where dwork=1"
    Set RS = ADO.Execute(selSQL)
    If RS.EOF = True And RS.BOF = True Then
        MsgBox "·« ÌÊÃœ „ÊŸ› ”«»ﬁ Õ Ï «·¬‰", vbOKOnly, ""
        Exit Sub
    End If
    RS.MoveFirst
    LstEmploy.Visible = True
    For Rep = 0 To 11
    If RS.EOF = False Then
        LstEmploy.List(Rep) = RS("dname")
        RS.MoveNext
    End If
    Next Rep
    ADO.Close
    Set RS = Nothing
End Sub

Private Sub Command3_Click()
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "update tblemploy set dwork=0 where dname='" & LstEmploy.Text & "' "
    Set RS = ADO.Execute(selSQL)
End Sub

Private Sub Form_Load()
    frmAddEmploy.Width = Screen.Width
    frmAddEmploy.Height = Screen.Height
End Sub

Private Sub LstEmploy_Click()
    If LstEmploy.Text <> "" Then
        Command3.Enabled = True
        Command3.Visible = True
    End If
End Sub
