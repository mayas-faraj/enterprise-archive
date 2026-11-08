VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmRest 
   Caption         =   "’›Õ… «·„— Ã⁄"
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
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   1320
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      ItemData        =   "frmRest.frx":0000
      Left            =   6720
      List            =   "frmRest.frx":0002
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   1320
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "frmRest.frx":0004
      Left            =   5640
      List            =   "frmRest.frx":0035
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   1320
      Width           =   975
   End
   Begin VB.TextBox txtName 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   2400
      Width           =   2415
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   525
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   9600
      Width           =   4335
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   495
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   8880
      Width           =   4335
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "„”Õ"
      Height          =   495
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   8160
      Width           =   4335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "«·»ÕÀ ⁄‰ «·ﬁÿ⁄"
      Height          =   495
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   7440
      Width           =   4335
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Index           =   5
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Tag             =   "1"
      Top             =   6360
      Width           =   2415
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Index           =   4
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Tag             =   "1"
      Top             =   5760
      Width           =   2415
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Index           =   3
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Tag             =   "1"
      Top             =   5160
      Width           =   2415
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Index           =   2
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Tag             =   "1"
      Top             =   4560
      Width           =   2415
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Index           =   1
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   "1"
      Top             =   3960
      Width           =   2415
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Index           =   0
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   3360
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid Grid 
      Height          =   4815
      Left            =   720
      TabIndex        =   14
      Top             =   2400
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   8493
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      RightToLeft     =   -1  'True
   End
   Begin MSFlexGridLib.MSFlexGrid Grid2 
      Height          =   2655
      Left            =   720
      TabIndex        =   20
      Top             =   7440
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   4683
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      RightToLeft     =   -1  'True
   End
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   8400
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   1320
      Width           =   615
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "«·„‘ —Ì"
      Height          =   375
      Left            =   13320
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      X1              =   10680
      X2              =   14040
      Y1              =   3000
      Y2              =   3000
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   10680
      X2              =   14040
      Y1              =   7080
      Y2              =   7080
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·„«œ… 6"
      Height          =   375
      Left            =   13080
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   6360
      Width           =   1455
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·„«œ… 5"
      Height          =   375
      Left            =   13080
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   5760
      Width           =   1455
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·„«œ… 4"
      Height          =   375
      Left            =   13080
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   5160
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·„«œ… 3"
      Height          =   375
      Left            =   13080
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   4560
      Width           =   1455
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·„«œ… 2"
      Height          =   375
      Left            =   13080
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   3960
      Width           =   1455
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·„«œ… 1"
      Height          =   375
      Left            =   13080
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   3360
      Width           =   1455
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "«·„— Ã⁄« "
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
      Left            =   5633
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   360
      Width           =   3975
   End
End
Attribute VB_Name = "frmRest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    frmRest.Hide
    frmMain.Show
End Sub

Private Sub cmdDelete_Click()
    For Rep = 0 To 5
        cmbKind(Rep) = 0
    Next Rep
    txtName.Text = ""
    Grid.Clear
    Grid2.Clear
        Grid.TextMatrix(0, 0) = "«· «—ÌŒ"
        Grid.TextMatrix(0, 1) = "«·„‘ —Ì"
        Grid.TextMatrix(0, 2) = "«”„ «·ﬁÿ⁄…"
        Grid.TextMatrix(0, 3) = "«·⁄œœ"
        Grid.TextMatrix(0, 4) = "«·”⁄— «·≈›—«œÌ"
        Grid.TextMatrix(0, 5) = "«·”⁄— «·≈Ã„«·Ì"
        Grid.TextMatrix(0, 6) = "«·„œ›Ê⁄"
        
        Grid2.TextMatrix(0, 0) = "«· «—ÌŒ"
        Grid2.TextMatrix(0, 1) = "«·„‘ —Ì"
        Grid2.TextMatrix(0, 2) = "«”„ «·ﬁÿ⁄…"
        Grid2.TextMatrix(0, 3) = "«·⁄œœ"
        Grid2.TextMatrix(0, 4) = "«·”⁄— «·≈›—«œÌ"
        Grid2.TextMatrix(0, 5) = "«·”⁄— «·≈Ã„«·Ì"
        Grid2.TextMatrix(0, 6) = "«·„œ›Ê⁄"

End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub Command1_Click()
    Dim bytRep As Integer, bytRep2 As Integer
    bytRep = 1
    bytRep2 = 1
    Grid.Clear
    Grid2.Clear
    Grid.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 1) = "«·„‘ —Ì"
    Grid.TextMatrix(0, 2) = "«”„ «·ﬁÿ⁄…"
    Grid.TextMatrix(0, 3) = "«·⁄œœ"
    Grid.TextMatrix(0, 4) = "«·”⁄— «·≈›—«œÌ"
    Grid.TextMatrix(0, 5) = "«·”⁄— «·≈Ã„«·Ì"
    Grid.TextMatrix(0, 6) = "«·„œ›Ê⁄"
        
    Grid2.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid2.TextMatrix(0, 1) = "«·„‘ —Ì"
    Grid2.TextMatrix(0, 2) = "«”„ «·ﬁÿ⁄…"
    Grid2.TextMatrix(0, 3) = "«·⁄œœ"
    Grid2.TextMatrix(0, 4) = "«·”⁄— «·≈›—«œÌ"
    Grid2.TextMatrix(0, 5) = "«·”⁄— «·≈Ã„«·Ì"
    Grid2.TextMatrix(0, 6) = "«·„œ›Ê⁄"

    For Rep = 0 To 5
        If cmbKind(Rep) = "" Then Exit For
        If txtName = "" Then
        SelSQL = "select * from tblguest where dmat='" & cmbKind(Rep) & "'"
        Else
        SelSQL = "select * from tblguest where dmat='" & cmbKind(Rep) & "' and dname='" & txtName.Text & "'"
        End If
        Set Rs = ADO.execute(SelSQL)
        Do While Not Rs.EOF
            Grid.Rows = bytRep + 1
            Grid.TextMatrix(bytRep, 0) = Rs("dday") & "\" & Rs("dmonth") & "\" & Rs("dyear")
            Grid.TextMatrix(bytRep, 1) = Rs("dname")
            Grid.TextMatrix(bytRep, 2) = Rs("dmat")
            Grid.TextMatrix(bytRep, 3) = Rs("dnum")
            Grid.TextMatrix(bytRep, 4) = Rs("dsprice")
            Grid.TextMatrix(bytRep, 5) = Rs("dprice")
            Grid.TextMatrix(bytRep, 6) = Rs("dpay")
            
            bytRep = bytRep + 1
            Rs.movenext
        Loop
    
        If txtName = "" Then
        SelSQL = "select * from tbldata where dmat='" & cmbKind(Rep) & "'"
        Else
        SelSQL = "select * from tbldata where dmat='" & cmbKind(Rep) & "' and dname='" & txtName.Text & "'"
        End If
        Set Rs = ADO.execute(SelSQL)
        On Error Resume Next
        Do While Not Rs.EOF
            Grid2.Rows = bytRep2 + 1
            Grid2.TextMatrix(bytRep2, 0) = Rs("dday") & "\" & Rs("dmonth") & "\" & Rs("dyear")
            Grid2.TextMatrix(bytRep2, 1) = Rs("dname")
            Grid2.TextMatrix(bytRep2, 2) = Rs("dmat")
            Grid2.TextMatrix(bytRep2, 3) = Rs("dnum")
            Grid2.TextMatrix(bytRep2, 4) = Rs("dsprice")
            Grid2.TextMatrix(bytRep2, 5) = Rs("dprice")
            Grid2.TextMatrix(bytRep2, 6) = Rs("dprice")
            bytRep2 = bytRep2 + 1
            Rs.movenext
        Loop
        
    Next Rep
End Sub

Private Sub Form_Load()
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    Grid.Cols = 7
    Grid2.Cols = 7
    
    Grid.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 1) = "«·„‘ —Ì"
    Grid.TextMatrix(0, 2) = "«”„ «·ﬁÿ⁄…"
    Grid.TextMatrix(0, 3) = "«·⁄œœ"
    Grid.TextMatrix(0, 4) = "«·”⁄— «·≈›—«œÌ"
    Grid.TextMatrix(0, 5) = "«·”⁄— «·≈Ã„«·Ì"
    Grid.TextMatrix(0, 6) = "«·„œ›Ê⁄"
    

    Grid2.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid2.TextMatrix(0, 1) = "«·„‘ —Ì"
    Grid2.TextMatrix(0, 2) = "«”„ «·ﬁÿ⁄…"
    Grid2.TextMatrix(0, 3) = "«·⁄œœ"
    Grid2.TextMatrix(0, 4) = "«·”⁄— «·≈›—«œÌ"
    Grid2.TextMatrix(0, 5) = "«·”⁄— «·≈Ã„«·Ì"
    Grid2.TextMatrix(0, 6) = "«·„œ›Ê⁄"

    Grid.ColWidth(0) = 1200
    Grid.ColWidth(1) = 1500
    Grid.ColWidth(2) = 1500
    Grid.ColWidth(3) = 1000
    Grid.ColWidth(4) = 1000
    Grid.ColWidth(5) = 1000
    Grid.ColWidth(5) = 1000
    
    Grid2.ColWidth(0) = 1200
    Grid2.ColWidth(1) = 1500
    Grid2.ColWidth(2) = 1500
    Grid2.ColWidth(3) = 1000
    Grid2.ColWidth(4) = 1000
    Grid2.ColWidth(5) = 1000
    Grid2.ColWidth(5) = 1000
    
    For Rep = 0 To 6
        Grid.ColAlignment(Rep) = 3
        Grid2.ColAlignment(Rep) = 3
    Next
    
    SelSQL = "select dname from tblkind order by dname"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbKind(0).List(Rep) = Rs("dname")
        cmbKind(1).List(Rep) = Rs("dname")
        cmbKind(2).List(Rep) = Rs("dname")
        cmbKind(3).List(Rep) = Rs("dname")
        cmbKind(4).List(Rep) = Rs("dname")
        cmbKind(5).List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
    
End Sub

Private Sub MSFlexGrid1_Click()

End Sub

Private Sub Grid_DblClick()
   ''On Error Resume Next
    If Grid.TextMatrix(Grid.RowSel, 2) = "" And Grid.TextMatrix(Grid.RowSel, 1) = "" Then Exit Sub
    Dim boxIn As Integer, dNetPrice As Long, dWin As Long, TheLot As Long, dMoney As String
    SelSQL = "select dlot,dprice from tblkind where dname='" & Grid.TextMatrix(Grid.RowSel, 2) & "'"
    Set Rs = ADO.execute(SelSQL)
    TheLot = Rs("dlot")
    dNetPrice = Rs("dprice")
    boxIn = InputBox("Ì—ÃÏ ≈œŒ«· «·ﬂ„Ì… «·„— Ã⁄…", Grid.TextMatrix(Grid.RowSel, 2), 0)
    If boxIn > Grid.TextMatrix(Grid.RowSel, 3) Then
        MsgBox "«·ﬁÌ„… «·„œŒ·… €»— ’ÕÌÕ…", vbOKOnly, "’›Õ… «·„— Ã⁄"
        Exit Sub
    End If
    SelSQL = "update tblkind set dlot=" & TheLot + boxIn & " where dname='" & Grid.TextMatrix(Grid.RowSel, 2) & "'"
    Set Rs = ADO.execute(SelSQL)
    Dim thisValue As String, thisDay As Byte
    thisValue = ""
    thisDay = 0
    For Rep = 1 To 2
        If Mid(Grid.TextMatrix(Grid.RowSel, 0), Rep, 1) = "\" Then Exit For
        thisValue = Left(Grid.TextMatrix(Grid.RowSel, 0), Rep)
    Next Rep
    thisDay = CByte(thisValue)
    
    SelSQL = "delete from tblguest where dname='" & Grid.TextMatrix(Grid.RowSel, 1) & "' and dmat='" & Grid.TextMatrix(Grid.RowSel, 2) & "' and dnum=" & Grid.TextMatrix(Grid.RowSel, 3) & " and dsprice=" & Grid.TextMatrix(Grid.RowSel, 4) & " and dday=" & thisDay
    Set Rs = ADO.execute(SelSQL)
    dWin = CDbl(Grid.TextMatrix(Grid.RowSel, 3) - boxIn) * (Grid.TextMatrix(Grid.RowSel, 4) - dNetPrice)
    SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,dwin,ddes,dday,dmonth,dyear,drest) values ('" & Grid.TextMatrix(Grid.RowSel, 1) & "','" & Grid.TextMatrix(Grid.RowSel, 2) & "'," & CInt(Grid.TextMatrix(Grid.RowSel, 3)) - boxIn & "," & Grid.TextMatrix(Grid.RowSel, 4) & "," & CDbl(Grid.TextMatrix(Grid.RowSel, 4)) * CDbl(Grid.TextMatrix(Grid.RowSel, 3) - boxIn) & "," & dWin & ",' '," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & "," & CDbl(Grid.TextMatrix(Grid.RowSel, 4)) * CDbl(Grid.TextMatrix(Grid.RowSel, 3) - boxIn) & ")"
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "select dmoney from tblmoney where dname='" & Grid.TextMatrix(Grid.RowSel, 1) & "'"
    Set Rs = ADO.execute(SelSQL)
    dMoney = Rs("dmoney")
    SelSQL = "update tblmoney set dmoney=" & CDbl(dMoney) - CDbl(boxIn * Grid.TextMatrix(Grid.RowSel, 4)) & " where dname='" & Grid.TextMatrix(Grid.RowSel, 1) & "'"
    Set Rs = ADO.execute(SelSQL)
    Command1_Click


End Sub

Private Sub Grid2_DblClick()
    If Grid2.TextMatrix(Grid2.RowSel, 2) = "" And Grid2.TextMatrix(Grid2.RowSel, 1) = "" Then Exit Sub
    Dim boxIn As Integer, dNetPrice As Long, dWin As Long, TheLot As Long
    SelSQL = "select dlot,dprice from tblkind where dname='" & Grid2.TextMatrix(Grid2.RowSel, 2) & "'"
    Set Rs = ADO.execute(SelSQL)
    TheLot = Rs("dlot")
    dNetPrice = Rs("dprice")
    boxIn = InputBox("Ì—ÃÏ ≈œŒ«· «·ﬂ„Ì… «·„— Ã⁄…", Grid2.TextMatrix(Grid2.RowSel, 2), 0)
    If boxIn > Grid2.TextMatrix(Grid2.RowSel, 3) Then
        MsgBox "«·ﬁÌ„… «·„œŒ·… €»— ’ÕÌÕ…", vbOKOnly, "’›Õ… «·„— Ã⁄"
        Exit Sub
    End If
    SelSQL = "update tblkind set dlot=" & TheLot + boxIn & " where dname='" & Grid2.TextMatrix(Grid2.RowSel, 2) & "'"
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "delete from tbldata where dname='" & Grid2.TextMatrix(Grid2.RowSel, 1) & "' and dmat='" & Grid2.TextMatrix(Grid2.RowSel, 2) & "' and dnum=" & Grid2.TextMatrix(Grid2.RowSel, 3) & " and dsprice=" & Grid2.TextMatrix(Grid2.RowSel, 4) & ""
    Set Rs = ADO.execute(SelSQL)
    dWin = CDbl(Grid2.TextMatrix(Grid2.RowSel, 3) - boxIn) * (Grid2.TextMatrix(Grid2.RowSel, 4) - dNetPrice)
    SelSQL = "insert into tbldata (dname,dmat,dnum,dsprice,dprice,dwin,ddes,dday,dmonth,dyear) values ('" & Grid2.TextMatrix(Grid2.RowSel, 1) & "','" & Grid2.TextMatrix(Grid2.RowSel, 2) & "'," & CInt(Grid2.TextMatrix(Grid2.RowSel, 3)) - boxIn & "," & Grid2.TextMatrix(Grid2.RowSel, 4) & "," & CDbl(Grid2.TextMatrix(Grid2.RowSel, 4)) * CDbl(Grid2.TextMatrix(Grid2.RowSel, 3) - boxIn) & "," & dWin & ",' '," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
    Set Rs = ADO.execute(SelSQL)
    Command1_Click
End Sub










