VERSION 5.00
Begin VB.Form frmEditEmploy 
   Caption         =   "Form1"
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
   Picture         =   "frmEditEmploy.frx":0000
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtDes 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   14
      Tag             =   "1"
      Text            =   " "
      Top             =   6840
      Width           =   3255
   End
   Begin VB.TextBox txtDate 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   13
      Tag             =   "1"
      Text            =   " "
      Top             =   6360
      Width           =   3255
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   12
      Tag             =   "1"
      Text            =   " "
      Top             =   5880
      Width           =   3255
   End
   Begin VB.TextBox txtAddress 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   11
      Tag             =   "1"
      Text            =   " "
      Top             =   5400
      Width           =   3255
   End
   Begin VB.TextBox txtMobile 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   10
      Tag             =   "1"
      Text            =   " "
      Top             =   4920
      Width           =   3255
   End
   Begin VB.TextBox txtPhone 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   9
      Tag             =   "1"
      Text            =   " "
      Top             =   4440
      Width           =   3255
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   4800
      TabIndex        =   8
      Tag             =   "1"
      Text            =   " "
      Top             =   3960
      Width           =   3255
   End
   Begin VB.ListBox LstEmploy 
      BackColor       =   &H00E9FEEC&
      Height          =   5160
      Left            =   11880
      TabIndex        =   0
      Top             =   3240
      Width           =   2415
   End
   Begin VB.Image cmdName 
      Height          =   615
      Left            =   12120
      MouseIcon       =   "frmEditEmploy.frx":153D1
      MousePointer    =   99  'Custom
      Top             =   9120
      Width           =   2295
   End
   Begin VB.Image cmdDelete 
      Height          =   615
      Left            =   7560
      MouseIcon       =   "frmEditEmploy.frx":15813
      MousePointer    =   99  'Custom
      Top             =   9120
      Width           =   2175
   End
   Begin VB.Image cmdExit 
      Height          =   615
      Left            =   1320
      MouseIcon       =   "frmEditEmploy.frx":15C55
      MousePointer    =   99  'Custom
      Top             =   9120
      Width           =   2175
   End
   Begin VB.Image cmdBack 
      Height          =   615
      Left            =   4440
      MouseIcon       =   "frmEditEmploy.frx":16097
      MousePointer    =   99  'Custom
      Top             =   9120
      Width           =   2175
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "„·«ÕŸ« "
      Height          =   255
      Left            =   8520
      TabIndex        =   7
      Top             =   6960
      Width           =   1335
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ «· ÊŸÌ›"
      Height          =   255
      Left            =   8520
      TabIndex        =   6
      Top             =   6480
      Width           =   1215
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„— » «·’«›Ì"
      Height          =   255
      Left            =   8520
      TabIndex        =   5
      Top             =   6000
      Width           =   1335
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·⁄‰Ê«‰"
      Height          =   255
      Left            =   8520
      TabIndex        =   4
      Top             =   5520
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÃÊ«·"
      Height          =   255
      Left            =   8520
      TabIndex        =   3
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·Â« ›"
      Height          =   255
      Left            =   8520
      TabIndex        =   2
      Top             =   4560
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈”„"
      Height          =   375
      Left            =   8520
      TabIndex        =   1
      Top             =   3960
      Width           =   1215
   End
End
Attribute VB_Name = "frmEditEmploy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    frmEditEmploy.Hide
    frmLogIn.Show
End Sub

Private Sub cmdDelete_Click()
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "update tblemploy set dwork=1 where dname='" & txtName.Text & "'"
    Set RS = ADO.Execute(selSQL)
    ADO.Close
    Set RS = Nothing
    MsgBox " „ Õ–› «·≈”„ «·„Õœœ »‰Ã«Õ , ”Ì „ ≈Ã—«¡ «· €Ì—«  »⁄œ ≈⁄«œ…  ‘€Ì· «·»—‰«„Ã", vbOKOnly, "„⁄«·Ã Õ–› «·»Ì«‰« "
End Sub

Private Sub cmdExit_Click()
    ExitProg
End Sub

Private Sub cmdName_Click()
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    Set RS = ADO.Execute("update tblemploy set dname='" & txtName.Text & "' where dname='" & LstEmploy.Text & "'")
    Set RS = ADO.Execute("update tblemploy set dphone='" & txtPhone.Text & "' where dname='" & LstEmploy.Text & "'")
    Set RS = ADO.Execute("update tblemploy set dmobile='" & txtMobile.Text & "' where dname='" & LstEmploy.Text & "'")
    Set RS = ADO.Execute("update tblemploy set daddress='" & txtAddress.Text & "' where dname='" & LstEmploy.Text & "'")
    Set RS = ADO.Execute("update tblemploy set dpay='" & txtPay.Text & "' where dname='" & LstEmploy.Text & "'")
    Set RS = ADO.Execute("update tblemploy set ddate='" & txtDate.Text & "' where dname='" & LstEmploy.Text & "'")
    Set RS = ADO.Execute("update tblemploy set ddes='" & txtDes.Text & "' where dname='" & LstEmploy.Text & "'")
    ADO.Close
    Set RS = Nothing
    MsgBox " „  ⁄œÌ· «·≈”„ «·„Õœœ »‰Ã«Õ , ”Ì „ ≈Ã—«¡ «· €Ì—«  »⁄œ ≈⁄«œ…  ‘€Ì· «·»—‰«„Ã", vbOKOnly, "„⁄«·Ã  ⁄œÌ· «·»Ì«‰« "
End Sub

Private Sub cmdPay_Click()

End Sub

Private Sub Form_Activate()
    Form_Load
End Sub

Private Sub Form_Load()
    Rep = 0
    Dim LstNum As Byte
    frmEditEmploy.Width = Screen.Width
    frmEditEmploy.Height = Screen.Height
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "select * from tblemploy where dwork=0"
    Set RS = ADO.Execute(selSQL)
    For Rep = 0 To 11
        If RS.EOF = False Then
        LstEmploy.List(Rep) = RS("dname")
        RS.MoveNext
        LstNum = LstNum + 1
    End If
    Next Rep
    ADO.Close
    Set RS = Nothing
    If LstNum = 0 Then
        MsgBox "·« ÌÊÃœ √Ì »Ì«‰«  „ÊŸ›Ì‰  „  Œ“Ì‰Â«", vbOKOnly, " ⁄œÌ· „ÊŸ›"
        cmdBack_Click
        'cmdDelete.Enabled = False
        'cmdName.Enabled = False
        'cmdPay.Enabled = False
        'Exit Sub
    End If
    LstEmploy.Selected(0) = True
    
End Sub

Private Sub LstEmploy_Click()
Dim texts As Object
LstEmploy.Refresh
On Error Resume Next
    For Each texts In frmEditEmploy
        If texts.Tag = 1 Then texts.Text = ""
    Next
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "select * from tblemploy where dname='" & LstEmploy.Text & "'"
    Set RS = ADO.Execute(selSQL)
    txtName.Text = RS("dname")
    txtPhone.Text = RS("dphone")
    txtMobile.Text = RS("dmobile")
    txtAddress.Text = RS("daddress")
    txtPay.Text = RS("dpay")
    txtDate.Text = RS("ddate")
    txtDes.Text = RS("ddes")
    ADO.Close
    Set RS = Nothing
End Sub
