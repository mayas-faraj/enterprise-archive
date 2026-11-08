VERSION 5.00
Begin VB.Form frmBox 
   Caption         =   "Form1"
   ClientHeight    =   10950
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
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox Text11 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   5880
      Width           =   2655
   End
   Begin VB.ComboBox cmbKind 
      Height          =   405
      Left            =   2640
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   4440
      Width           =   2655
   End
   Begin VB.TextBox Text10 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   4440
      Width           =   2655
   End
   Begin VB.TextBox Text8 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   5280
      Width           =   2655
   End
   Begin VB.ComboBox cmbToYear 
      Height          =   405
      ItemData        =   "frmBox.frx":0000
      Left            =   5880
      List            =   "frmBox.frx":0031
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   2280
      Width           =   975
   End
   Begin VB.ComboBox cmbToMonth 
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   2280
      Width           =   735
   End
   Begin VB.ComboBox cmbToDay 
      Height          =   405
      Left            =   7800
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   2280
      Width           =   735
   End
   Begin VB.CommandButton Command2 
      Caption         =   "ÚÑÖ ÇáãÌÇá"
      Height          =   495
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   3480
      Width           =   3735
   End
   Begin VB.TextBox Text9 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2633
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   8160
      Width           =   2655
   End
   Begin VB.TextBox Text7 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2633
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   6480
      Width           =   2655
   End
   Begin VB.TextBox Text6 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2633
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   5880
      Width           =   2655
   End
   Begin VB.TextBox Text5 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   7553
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   6480
      Width           =   2655
   End
   Begin VB.TextBox Text4 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   7553
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   7080
      Width           =   2655
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ÚÑÖ ÇáãÚáæãÇÊ"
      Height          =   495
      Left            =   5753
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   2880
      Width           =   3735
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "frmBox.frx":008F
      Left            =   5926
      List            =   "frmBox.frx":00C0
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1800
      Width           =   975
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      ItemData        =   "frmBox.frx":011E
      Left            =   7006
      List            =   "frmBox.frx":0120
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1800
      Width           =   735
   End
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   7846
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1800
      Width           =   615
   End
   Begin VB.CommandButton Command4 
      Caption         =   "ÚæÏÉ"
      Height          =   375
      Left            =   8003
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   9840
      Width           =   1815
   End
   Begin VB.CommandButton Command5 
      Caption         =   "ÎÑæÌ"
      Height          =   375
      Left            =   5213
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   9840
      Width           =   1815
   End
   Begin VB.TextBox Text3 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2633
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   9000
      Width           =   7455
   End
   Begin VB.TextBox Text2 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2633
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   5280
      Width           =   2655
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   7553
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   8160
      Width           =   2655
   End
   Begin VB.Label Label14 
      Alignment       =   2  'Center
      Caption         =   "ÇáßãíÉ ÇáãÈÇÚÉ"
      Height          =   375
      Left            =   10440
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   5880
      Width           =   2175
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      Caption         =   "ãä ÃÌá"
      Height          =   375
      Left            =   5640
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   4440
      Width           =   1575
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      Caption         =   "ÊßáÝÉ ÇáÞØÚ ÇáãÊæÝÑÉ"
      Height          =   375
      Left            =   10440
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   4440
      Width           =   1935
   End
   Begin VB.Line Line3 
      BorderWidth     =   3
      DrawMode        =   5  'Not Copy Pen
      X1              =   2640
      X2              =   12600
      Y1              =   5040
      Y2              =   5040
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      DrawMode        =   5  'Not Copy Pen
      X1              =   2640
      X2              =   12600
      Y1              =   8760
      Y2              =   8760
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   2640
      X2              =   12600
      Y1              =   7920
      Y2              =   7920
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      Caption         =   "ÇáãÈíÚÇÊ ÇáãÞÈæÖÉ"
      Height          =   495
      Left            =   10560
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   5280
      Width           =   1695
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      Caption         =   "ÇáãÏÝæÚÇÊ ÇáÕÇÝíÉ"
      Height          =   375
      Left            =   5460
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   8160
      Width           =   1935
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "ÇáÍÓæãÇÊ"
      Height          =   375
      Left            =   5460
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   6480
      Width           =   1935
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "ÇáÕÇÏÑ Úä ÇáÔÑßÇÊ"
      Height          =   375
      Left            =   5460
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   5880
      Width           =   1935
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "ÑÈÍ ÇáãÈíÚÇÊ ÇáãÏÝæÚÉ"
      Height          =   375
      Left            =   10560
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   6480
      Width           =   1935
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "ÑÈÍ ÇáãÈíÚÇÊ ÇáÛíÑ ãÏÝæÚÉ"
      Height          =   375
      Left            =   10440
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   7080
      Width           =   2175
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Caption         =   "ÊÇÑíÎ"
      Height          =   375
      Left            =   8686
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   1800
      Width           =   615
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "ÇáÈÇÞí ÇáÕÇÝí"
      Height          =   375
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   9000
      Width           =   1935
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "ÇáãÔÊÑíÇÊ ÇáíæãíÉ"
      Height          =   375
      Left            =   5460
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   5280
      Width           =   1935
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "ÑÈÍ ÇáãÈíÚÇÊ ÇáßáíÉ"
      Height          =   375
      Left            =   10380
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   8160
      Width           =   1935
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "ÇáÑÕíÏ Çáßáí"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   27.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5866
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   600
      Width           =   3495
   End
End
Attribute VB_Name = "frmBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    If cmbKind.Text = "" Then
        SelSQL = "select * from tbldata where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tbldata where dmat='" & cmbKind.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Text1.Text = 0
    Text2.Text = 0
    Text3.Text = 0
    Text4.Text = 0
    Text5.Text = 0
    Text6.Text = 0
    Text7.Text = 0
    Text8.Text = 0
    Text9.Text = 0
    Text11.Text = 0
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text5.Text = Text5.Text + CInt(Rs("dwin"))
        Text8.Text = Text8.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    Set Rs = ADO.execute(SelSQL)
    If cmbKind.Text = "" Then
        SelSQL = "select * from tblguest where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tblguest where dmat='" & cmbKind.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text4.Text = Text4.Text + CInt(Rs("dwin"))
        Text8.Text = Text8.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text2.Text = Text2.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    SelSQL = "select dmoney from tblcoout where ddate1=" & cmbDay.Text & " / " & cmbMonth.Text & " / " & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text6.Text = Text6.Text + CInt(Rs("dmoney"))
        Text9.Text = Text9.Text + CInt(Rs("dmoney"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text & " and ddes like '" & "ÍÓã ÝÇÊæÑÉ" & "%'"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text7.Text = Text7.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    
    Text3 = Text8 - Text9
End Sub

Private Sub Command2_Click()
    Dim dCopy As String
    dCopy = " dday>=" & cmbDay.Text & " and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dday<=" & cmbToDay.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    If cmbKind.Text = "" Then
        SelSQL = "select * from tbldata where" & dCopy
    Else
        SelSQL = "select * from tbldata where dmat='" & cmbKind.Text & "' and" & dCopy
    End If
    Set Rs = ADO.execute(SelSQL)
    Text1.Text = 0
    Text2.Text = 0
    Text3.Text = 0
    Text4.Text = 0
    Text5.Text = 0
    Text6.Text = 0
    Text7.Text = 0
    Text8.Text = 0
    Text9.Text = 0
    Text11.Text = 0
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text5.Text = Text5.Text + CInt(Rs("dwin"))
        Text8.Text = Text8.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    If cmbKind.Text = "" Then
        SelSQL = "select * from tblguest where" & dCopy
    Else
        SelSQL = "select * from tblguest where dmat='" & cmbKind.Text & "' and" & dCopy
    End If
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text4.Text = Text4.Text + CInt(Rs("dwin"))
        Text8.Text = Text8.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblout where" & dCopy
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text2.Text = Text2.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    SelSQL = "select dmoney from tblcoout where ddate1=" & cmbDay.Text & " / " & cmbMonth.Text & " / " & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text6.Text = Text6.Text + CInt(Rs("dmoney"))
        Text9.Text = Text9.Text + CInt(Rs("dmoney"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblout where ddes like '" & "ÍÓã ÝÇÊæÑÉ" & "%'  and" & dCopy
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text6.Text = Text6.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    Text3 = Text8 - Text9
End Sub

Private Sub Command4_Click()
    frmMain.Show
    frmBox.Hide
End Sub

Private Sub Command5_Click()
    ExitPro
End Sub

Private Sub Form_Load()
    On Error Resume Next
    Text10.Text = 0
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    
    For Rep = 1 To 31
        cmbToDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbToMonth.List(Rep - 1) = Rep
    Next Rep
    
    cmbToDay.Text = Day(Now)
    cmbToMonth.Text = Month(Now)
    cmbToYear.Text = Year(Now)
    
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    SelSQL = "select * from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbKind.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
    SelSQL = "select * from tblkind order by dname"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text10.Text = Text10.Text + (Rs("dprice") * Rs("dlot"))
        Rs.movenext
    Loop

    Command1_Click
End Sub

