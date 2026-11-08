VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Begin VB.Form frmCoOut 
   Caption         =   " „ÊÌ· «·„Õ·"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   12
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   Picture         =   "frmCoOut.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txt 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Text            =   "0"
      Top             =   1800
      Width           =   1455
   End
   Begin VB.ComboBox cmbName 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   7605
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   1800
      Width           =   2175
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   4125
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   1800
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      ItemData        =   "frmCoOut.frx":17713
      Left            =   3285
      List            =   "frmCoOut.frx":17715
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   1800
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      ItemData        =   "frmCoOut.frx":17717
      Left            =   2205
      List            =   "frmCoOut.frx":17748
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   1800
      Width           =   975
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFC0&
      Caption         =   "≈œŒ«· ÃœÌœ"
      Height          =   7575
      Left            =   10920
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   3000
      Width           =   4095
      Begin VB.CommandButton Command6 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Õ–›"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   5160
         Width           =   3615
      End
      Begin VB.CommandButton Command5 
         BackColor       =   &H00FFC0C0&
         Caption         =   " ⁄œÌ·"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   4680
         Width           =   3615
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   405
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   480
         Width           =   2415
      End
      Begin VB.TextBox Text2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   405
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1080
         Width           =   2415
      End
      Begin VB.TextBox Text3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   405
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1680
         Width           =   2415
      End
      Begin VB.TextBox Text4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   405
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   2280
         Width           =   2415
      End
      Begin VB.CommandButton Command1 
         BackColor       =   &H00FFC0C0&
         Caption         =   "≈œŒ«·"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   3720
         Width           =   3615
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H00FFC0C0&
         Caption         =   "„”Õ"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   4200
         Width           =   3615
      End
      Begin VB.CommandButton Command3 
         BackColor       =   &H00FFC0C0&
         Caption         =   "⁄Êœ…"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   5640
         Width           =   3615
      End
      Begin VB.CommandButton Command4 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Œ—ÊÃ"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   6120
         Width           =   3615
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFC0&
         Caption         =   "«·„»·€ ··„œÌ‰"
         Height          =   375
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFC0&
         Caption         =   "«·»Ì«‰"
         Height          =   375
         Left            =   2880
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFC0&
         Caption         =   "«·„»·€ ··„œ«‰"
         Height          =   375
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFC0&
         Caption         =   "«·»Ì«‰"
         Height          =   375
         Left            =   2880
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   2280
         Width           =   855
      End
      Begin VB.Line Line3 
         BorderWidth     =   3
         X1              =   480
         X2              =   3720
         Y1              =   3240
         Y2              =   3240
      End
   End
   Begin MSFlexGridLib.MSFlexGrid Grid 
      Height          =   7455
      Left            =   360
      TabIndex        =   17
      Top             =   3120
      Width           =   10380
      _ExtentX        =   18309
      _ExtentY        =   13150
      _Version        =   393216
      BackColor       =   16777215
      ForeColor       =   0
      ForeColorFixed  =   12582912
      BackColorBkg    =   16777152
      RightToLeft     =   -1  'True
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   1080
      Width           =   4815
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "›Ê« Ì— «·‘—ﬂ…"
      Height          =   375
      Left            =   10080
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Label Label12 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   4965
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   1800
      Width           =   615
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   1440
      X2              =   11880
      Y1              =   2520
      Y2              =   2520
   End
End
Attribute VB_Name = "frmCoOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intFirst As Integer, intLast As Integer
Private Sub cmbName_Change()
    cmbName_Click
End Sub

Private Sub cmbName_Click()
    Dim dPay1 As Long, dPay2 As Long, dMoney As Long
    Label2.Caption = cmbName.Text
    SelSQL = "select * from tblcoout where dcompany='" & cmbName.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    
        Rep = 1
        Grid.Clear
        Grid.TextMatrix(0, 0) = "„œÌ‰"
        Grid.TextMatrix(0, 1) = "«· «—ÌŒ"
        Grid.TextMatrix(0, 2) = "«·»Ì«‰"
        Grid.TextMatrix(0, 3) = "«·œ«∆‰"
        Grid.TextMatrix(0, 4) = "«· «—ÌŒ"
        Grid.TextMatrix(0, 5) = "«·»Ì«‰"
        Grid.TextMatrix(0, 6) = "«·—’Ìœ"
        Do While Not Rs.EOF
            Grid.Rows = Rep + 1
            Grid.Row = Rep
            Grid.Col = 0
            Grid.Text = Rs("dpay1")
            Grid.Col = 1
            Grid.Text = Rs("ddate1")
            Grid.Col = 2
            Grid.Text = Rs("ddes1")
            Grid.Col = 3
            Grid.Text = Rs("dpay2")
            Grid.Col = 4
            Grid.Text = Rs("ddate2")
            Grid.Col = 5
            Grid.Text = Rs("ddes2")
            Grid.Col = 6
            Grid.Text = Rs("dmoney")
            dPay1 = dPay1 + Rs("dpay1")
            dPay2 = dPay2 + Rs("dpay2")
            dMoney = dMoney + Rs("dmoney")
            Rep = Rep + 1
            Rs.movenext
        Loop
        Grid.Rows = Rep + 1
        Grid.Row = Rep
        Grid.Col = 0
        Grid.Text = dPay1
        Grid.Col = 3
        Grid.Text = dPay2
        Grid.Col = 6
        Grid.Text = dMoney
End Sub

Private Sub Command1_Click()
    Dim ddate As String
    ddate = cmbDay.Text & " \ " & cmbMonth.Text & " \ " & cmbYear.Text
    SelSQL = "insert into tblcoout (dcompany,dpay1,ddate1,ddes1,dpay2,ddate2,ddes2,dmoney) values ('" & cmbName.Text & "'," & Text1.Text & ",'" & ddate & "','" & Text2.Text & "'," & Text3.Text & ",'" & ddate & "','" & Text4.Text & "','" & CDbl(Text1.Text) - CDbl(Text3.Text) & "')"
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "select dcompany from tblcoout group by dcompany"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbName.List(Rep) = Rs("dcompany")
        Rep = Rep + 1
        Rs.movenext
    Loop
    cmbName_Click
    Command2_Click
End Sub

Private Sub Command2_Click()
    Text1 = ""
    Text2 = ""
    Text3 = ""
    Text4 = ""
End Sub

Private Sub Command3_Click()
    frmDahan.Hide
    frmMain.Show
End Sub

Private Sub Command4_Click()
    ExitPro
End Sub

Private Sub Command5_Click()
    Dim Ms As Byte, Ct_Des1 As String, Ct_Des2 As String
    Ms = MsgBox("√„ √ﬂœ „‰  ⁄œÌ· «·”Ã· «·„Õœœ", vbYesNo + vbQuestion, Grid.TextMatrix(Grid.RowSel, 2))
    If Ms = vbNo Then Exit Sub
    Copy = " where dcompany='" & cmbName.Text & "' and ddes1='" & Grid.TextMatrix(Grid.RowSel, 2) & "' and ddes2='" & Grid.TextMatrix(Grid.RowSel, 5) & "'"
    Set Rs = ADO.execute("update tblcoout set dpay1=" & Text1.Text & Copy)
    Set Rs = ADO.execute("update tblcoout set ddes1='" & Text2.Text & "'" & Copy)
    Copy = " where dcompany='" & cmbName.Text & "' and ddes1='" & Text2.Text & "' and ddes2='" & Grid.TextMatrix(Grid.RowSel, 5) & "'"
    Set Rs = ADO.execute("update tblcoout set dpay2=" & Text3.Text & Copy)
    Set Rs = ADO.execute("update tblcoout set ddes2='" & Text4.Text & "'" & Copy)
    Copy = " where dcompany='" & cmbName.Text & "' and ddes1='" & Text2.Text & "' and ddes2='" & Text4.Text & "'"
    Set Rs = ADO.execute("update tblcoout set dmoney=" & CDbl(Text1.Text) - CDbl(Text3.Text) & Copy)
    cmbName_Click
    Command2_Click
End Sub

Private Sub Command6_Click()
    Dim Ms As Byte, Copy As String
    Ms = MsgBox("√„ √ﬂœ „‰ Õ–› «·”Ã· «·„Õœœ", vbYesNo + vbQuestion, Grid.TextMatrix(Grid.RowSel, 2))
    If Ms = vbNo Then Exit Sub
    SelSQL = "delete from tblcoout where ddes1='" & Grid.TextMatrix(Grid.RowSel, 2) & "' and ddes2='" & Grid.TextMatrix(Grid.RowSel, 5) & "'"
    Set Rs = ADO.execute(SelSQL)
    cmbName_Click
    Command2_Click
End Sub


Private Sub Txt_Click()
    txt = 0
End Sub

Private Sub Form_Load()
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    
    Grid.Cols = 7
    Grid.ColWidth(0) = 1000
    Grid.ColWidth(1) = 1500
    Grid.ColWidth(2) = 2000
    Grid.ColWidth(3) = 1000
    Grid.ColWidth(4) = 1500
    Grid.ColWidth(5) = 2000
    Grid.ColWidth(6) = 1200
    
    Grid.ColAlignment(0) = 3
    Grid.ColAlignment(1) = 3
    Grid.ColAlignment(2) = 3
    Grid.ColAlignment(3) = 3
    Grid.ColAlignment(4) = 3
    Grid.ColAlignment(5) = 3
    Grid.ColAlignment(6) = 3
    
    Grid.TextMatrix(0, 0) = "„œÌ‰"
    Grid.TextMatrix(0, 1) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 2) = "«·»Ì«‰"
    Grid.TextMatrix(0, 3) = "«·œ«∆‰"
    Grid.TextMatrix(0, 4) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 5) = "«·»Ì«‰"
    Grid.TextMatrix(0, 6) = "«·—’Ìœ"

    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    SelSQL = "select dcompany from tblcoout group by dcompany"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbName.List(Rep) = Rs("dcompany")
        Rep = Rep + 1
        Rs.movenext
    Loop
End Sub

Private Sub Grid_DblClick()
    Text1.Text = Grid.TextMatrix(Grid.RowSel, 0)
    Text2.Text = Grid.TextMatrix(Grid.RowSel, 2)
    Text3.Text = Grid.TextMatrix(Grid.RowSel, 3)
    Text4.Text = Grid.TextMatrix(Grid.RowSel, 5)
End Sub

Private Sub grid_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    intFirst = Grid.RowSel
End Sub

Private Sub grid_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim bytStep As Integer
    intLast = Grid.RowSel
    txt = 0
    If intLast >= intFirst Then bytStep = 1 Else bytStep = -1
    For Rep = intFirst To intLast Step bytStep
        If IsNumeric(Grid.TextMatrix(Rep, Grid.ColSel)) = True Then
        txt.Text = txt.Text + Int(Grid.TextMatrix(Rep, Grid.ColSel))
        End If
    Next Rep
End Sub
