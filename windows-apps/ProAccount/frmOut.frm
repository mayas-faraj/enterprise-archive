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
   Picture         =   "frmOut.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.ComboBox cmbSearch 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmOut.frx":24BCE
      Left            =   1920
      List            =   "frmOut.frx":24BFF
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   2760
      Width           =   2535
   End
   Begin VB.TextBox txtSearch 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   8760
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   2760
      Width           =   2535
   End
   Begin VB.TextBox Txt 
      Alignment       =   2  'Center
      BackColor       =   &H00C0E0FF&
      Height          =   405
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Text            =   "0"
      Top             =   4680
      Width           =   1695
   End
   Begin VB.TextBox txtOut 
      Alignment       =   2  'Center
      BackColor       =   &H00C0E0FF&
      Height          =   405
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   4080
      Width           =   1695
   End
   Begin VB.ComboBox cmbToYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmOut.frx":24C5D
      Left            =   5400
      List            =   "frmOut.frx":24C8E
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   1680
      Width           =   975
   End
   Begin VB.ComboBox cmbToMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmOut.frx":24CEC
      Left            =   6480
      List            =   "frmOut.frx":24CEE
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   1680
      Width           =   735
   End
   Begin VB.ComboBox cmbToDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7320
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   1680
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄—÷ «·ﬂ·"
      Height          =   375
      Left            =   5760
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   10200
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄—÷ «·„‘ —Ì« "
      Height          =   375
      Left            =   7560
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   10200
      Width           =   1575
   End
   Begin MSFlexGridLib.MSFlexGrid Grid 
      Height          =   5055
      Left            =   3000
      TabIndex        =   14
      Top             =   4320
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   8916
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      BackColor       =   16777215
      BackColorFixed  =   12648384
      ForeColorFixed  =   12582912
      BackColorBkg    =   11588276
      RightToLeft     =   -1  'True
   End
   Begin VB.CommandButton cmdEnter 
      BackColor       =   &H00FFC0C0&
      Caption         =   "≈œŒ«·"
      Height          =   375
      Left            =   11160
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   10200
      Width           =   1575
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   3960
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   10200
      Width           =   1575
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   2160
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   10200
      Width           =   1575
   End
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H00FFC0C0&
      Caption         =   "„”Õ"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   10200
      Width           =   1575
   End
   Begin VB.TextBox Text3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   3240
      Width           =   9375
   End
   Begin VB.TextBox Text2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   2280
      Width           =   2535
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   8760
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   2280
      Width           =   2535
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7320
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1200
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmOut.frx":24CF0
      Left            =   6480
      List            =   "frmOut.frx":24CF2
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1200
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmOut.frx":24CF4
      Left            =   5400
      List            =   "frmOut.frx":24D25
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "⁄—÷ «·„Ã„Ê⁄…"
      Height          =   375
      Left            =   5880
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "»ÕÀ „ ﬁœ„"
      Height          =   375
      Left            =   11640
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "„Ã«· «· «—ÌŒ"
      Height          =   375
      Left            =   8280
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "«·„‘ —Ì« "
      Height          =   375
      Left            =   8400
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   4440
      Width           =   2175
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      X1              =   4680
      X2              =   10080
      Y1              =   3840
      Y2              =   3840
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "„·«ÕŸ« "
      Height          =   375
      Left            =   11640
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   3240
      Width           =   1455
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«·„»·€ «·„Œ—Ã ( ·.”.)"
      Height          =   375
      Left            =   5160
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   2280
      Width           =   2055
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "≈”„ «·„«œ…"
      Height          =   375
      Left            =   11520
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   2280
      Width           =   1575
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   4680
      X2              =   10080
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«· «—ÌŒ «·Õ«·Ì"
      Height          =   375
      Left            =   8280
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
End
Attribute VB_Name = "frmOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intFirst As Integer, intLast As Integer
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

Private Sub cmbSearch_Click()
    txtSearch.Text = ""
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
    If txtSearch.Text <> "" Then
        SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text & " and ( dname like '" & txtSearch.Text & "%' or ddes like '" & txtSearch.Text & "%' )"
    ElseIf cmbSearch.Text <> "" Then
        SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text & " and dname='" & cmbSearch.Text & "'"
    Else
        SelSQL = "select * from tblout where dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    End If
    FillGrid
End Sub

Private Sub Command2_Click()
    If txtSearch.Text <> "" Then
        SelSQL = "select * from tblout where dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text & " and ( dname like '" & txtSearch.Text & "%' or ddes like '" & txtSearch.Text & "%' )"
    ElseIf cmbSearch.Text <> "" Then
        SelSQL = "select * from tblout where dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text & " and dname='" & cmbSearch.Text & "'"
    Else
        SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
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
    
    SelSQL = "select dname from tblout group by dname"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbSearch.AddItem Rs("dname"), Rep
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    FillGrid

End Sub

Private Sub Grid_Click()
    thisCol = Grid.Col
    Text1.Text = Grid.TextMatrix(Grid.RowSel, 1)
    Text2.Text = Grid.TextMatrix(Grid.RowSel, 2)
    Text3.Text = Grid.TextMatrix(Grid.RowSel, 3)
    
End Sub

Private Sub Grid_SelChange()
    If IsNumeric(Grid.TextMatrix(Grid.RowSel, Grid.ColSel)) = True Then
        If thisCol <= Grid.Col Then
            Txt.Text = Txt.Text + (Int(Grid.TextMatrix(Grid.RowSel, Grid.ColSel)))
        Else
            Txt.Text = Txt.Text - (Int(Grid.TextMatrix(Grid.RowSel, Grid.ColSel)))
        End If
    End If
End Sub

Private Sub txtSearch_Change()
    cmbSearch.Text = ""
End Sub
