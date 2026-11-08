VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmOut 
   Caption         =   "«·„œ›Ê⁄« "
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
   RightToLeft     =   -1  'True
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtOut 
      Alignment       =   2  'Center
      Height          =   405
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   4440
      Width           =   3015
   End
   Begin VB.ComboBox cmbToYear 
      Height          =   405
      ItemData        =   "frmOut.frx":0000
      Left            =   5880
      List            =   "frmOut.frx":0031
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   1920
      Width           =   975
   End
   Begin VB.ComboBox cmbToMonth 
      Height          =   405
      ItemData        =   "frmOut.frx":008F
      Left            =   6960
      List            =   "frmOut.frx":0091
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   1920
      Width           =   735
   End
   Begin VB.ComboBox cmbToDay 
      Height          =   405
      Left            =   7800
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   1920
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "⁄—÷ «·ﬂ·"
      Height          =   375
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   10320
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "⁄—÷ «·„‘ —Ì« "
      Height          =   375
      Left            =   7673
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   10320
      Width           =   1815
   End
   Begin MSFlexGridLib.MSFlexGrid Grid 
      Height          =   5055
      Left            =   3120
      TabIndex        =   15
      Top             =   5040
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   8916
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      RightToLeft     =   -1  'True
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "≈œŒ«·"
      Height          =   375
      Left            =   11513
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   10320
      Width           =   1815
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   3833
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   10320
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   1913
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   10320
      Width           =   1815
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "„”Õ"
      Height          =   375
      Left            =   9593
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   10320
      Width           =   1815
   End
   Begin VB.TextBox Text3 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2520
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   3600
      Width           =   9375
   End
   Begin VB.TextBox Text2 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   2520
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   3000
      Width           =   2535
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   3000
      Width           =   2535
   End
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   7793
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1440
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      ItemData        =   "frmOut.frx":0093
      Left            =   6953
      List            =   "frmOut.frx":0095
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1440
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "frmOut.frx":0097
      Left            =   5873
      List            =   "frmOut.frx":00C8
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1440
      Width           =   975
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      Caption         =   "„Ã«· «· «—ÌŒ"
      Height          =   375
      Left            =   8760
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "«·„‘ —Ì« "
      Height          =   375
      Left            =   8400
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   4440
      Width           =   2175
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      X1              =   4800
      X2              =   10200
      Y1              =   4200
      Y2              =   4200
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Caption         =   "„·«ÕŸ« "
      Height          =   375
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Caption         =   "«·„»·€ «·„Œ—Ã ( ·.”.)"
      Height          =   375
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   3000
      Width           =   2055
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "≈”„ «·„«œ…"
      Height          =   375
      Left            =   12120
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   3000
      Width           =   1575
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   4800
      X2              =   10200
      Y1              =   2640
      Y2              =   2640
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "«· «—ÌŒ «·Õ«·Ì"
      Height          =   375
      Left            =   8760
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   1440
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "«·„œ›Ê⁄«  Ê «·„Œ—Ã« "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   27.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   480
      Width           =   5415
   End
End
Attribute VB_Name = "frmOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub FillGrid()
    Set Rs = ADO.execute(SelSQL)
    Dim Plus As Long
    Rep = 1
    Plus = 0
    Grid.Clear
    Grid.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 1) = "«”„ «·„«œ…"
    Grid.TextMatrix(0, 2) = "«·„»·€ «·„Œ—Ã"
    Grid.TextMatrix(0, 3) = "„·«ÕŸ« "

    Do While Not Rs.EOF
        Grid.Rows = Rep + 1
        Grid.TextMatrix(Rep, 0) = Rs("dday") & "/" & Rs("dmonth") & "/" & Rs("dyear")
        Grid.TextMatrix(Rep, 1) = Rs("dname")
        Grid.TextMatrix(Rep, 2) = Rs("dprice")
        Grid.TextMatrix(Rep, 3) = Rs("ddes")
        Plus = Plus + Rs("dprice")
        Rep = Rep + 1
        Rs.movenext
    Loop
    txtOut.Text = Plus
End Sub


Private Sub cmdBack_Click()
    frmMain.Show
    frmOut.Hide
End Sub

Private Sub cmdClear_Click()
    Text1 = ""
    Text2 = ""
    Text3 = ""
End Sub

Private Sub cmdEnter_Click()
    SelSQL = "insert into tblout (dname,dprice,ddes,dday,dmonth,dyear) values ('" & Text1.Text & "'," & Text2.Text & ",'" & Text3.Text & "'," & cmbDay.Text & " , " & cmbMonth.Text & " , " & cmbYear.Text & ")"
    Set Rs = ADO.execute(SelSQL)
    cmdClear_Click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub Command1_Click()
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    FillGrid
End Sub

Private Sub Command2_Click()
    SelSQL = "select * from tblout where dday>=" & cmbDay.Text & " and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dday<=" & cmbToDay.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    FillGrid
End Sub

Private Sub Form_Load()
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
    
    Grid.ColWidth(0) = 1500
    Grid.ColWidth(1) = 2400
    Grid.ColWidth(2) = 1900
    Grid.ColWidth(3) = 3000
    
    Grid.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 1) = "«”„ «·„«œ…"
    Grid.TextMatrix(0, 2) = "«·„»·€ «·„Œ—Ã"
    Grid.TextMatrix(0, 3) = "„·«ÕŸ« "
    
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    FillGrid

End Sub


