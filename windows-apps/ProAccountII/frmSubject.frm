VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmSubject 
   BackColor       =   &H00F7E3E1&
   Caption         =   "ÌÑÏ ÇáÞØÚ"
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
   Picture         =   "frmSubject.frx":0000
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtSearch 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   2760
      Width           =   2055
   End
   Begin VB.CommandButton cmdShowScope 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ÚÑÖ ÇáãÌÇá"
      Height          =   375
      Left            =   11280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   8760
      Width           =   2895
   End
   Begin VB.ComboBox cmbToDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   1800
      Width           =   735
   End
   Begin VB.ComboBox cmbToMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6840
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   1800
      Width           =   735
   End
   Begin VB.ComboBox cmbToYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmSubject.frx":154A8
      Left            =   5760
      List            =   "frmSubject.frx":154D9
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   1800
      Width           =   975
   End
   Begin VB.TextBox txtAllWin 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   7440
      Width           =   1815
   End
   Begin VB.TextBox txtGWin 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   6840
      Width           =   1815
   End
   Begin VB.TextBox txtWin 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   6240
      Width           =   1815
   End
   Begin VB.TextBox txtBuy 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   4440
      Width           =   1815
   End
   Begin VB.TextBox txtLot 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   5640
      Width           =   1815
   End
   Begin VB.TextBox txtGBuy 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   5040
      Width           =   1815
   End
   Begin VB.ComboBox cmbGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   12960
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   3600
      Width           =   1575
   End
   Begin VB.ComboBox cmbMat 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   10800
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   3600
      Width           =   2055
   End
   Begin VB.CommandButton cmdShow 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ÚÑÖ ÇáãÈíÚÇÊ"
      Height          =   375
      Left            =   11280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   8280
      Width           =   2895
   End
   Begin VB.CommandButton cmdDelete 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ãÓÍ"
      Height          =   375
      Left            =   11280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   9240
      Width           =   2895
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ÚæÏÉ"
      Height          =   375
      Left            =   11280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   9720
      Width           =   2895
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ÎÑæÌ"
      Height          =   375
      Left            =   11280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   10200
      Width           =   2895
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmSubject.frx":15537
      Left            =   5760
      List            =   "frmSubject.frx":15568
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1320
      Width           =   975
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmSubject.frx":155C6
      Left            =   6840
      List            =   "frmSubject.frx":155C8
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1320
      Width           =   735
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   1320
      Width           =   735
   End
   Begin MSFlexGridLib.MSFlexGrid Grid1 
      Height          =   4095
      Left            =   840
      TabIndex        =   8
      Top             =   2760
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   7223
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      BackColor       =   16777215
      BackColorFixed  =   12648384
      ForeColorFixed  =   12582912
      BackColorBkg    =   11588276
      RightToLeft     =   -1  'True
   End
   Begin MSFlexGridLib.MSFlexGrid Grid2 
      Height          =   3615
      Left            =   840
      TabIndex        =   9
      Top             =   6960
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   6376
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      BackColor       =   16777215
      BackColorFixed  =   12648384
      ForeColorFixed  =   12582912
      BackColorBkg    =   11588276
      RightToLeft     =   -1  'True
   End
   Begin VB.Label Label4 
      BackColor       =   &H00F7E3E1&
      BackStyle       =   0  'Transparent
      Caption         =   " ÈÍË Úä ãÌãæÚÉ"
      Height          =   375
      Left            =   13080
      TabIndex        =   31
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      Index           =   1
      X1              =   10920
      X2              =   13800
      Y1              =   4200
      Y2              =   4200
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÑÈÍ ÇáãÈíÚÇÊ ÇáÛíÑ ãÏÝæÚÉ"
      Height          =   375
      Left            =   12600
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   6840
      Width           =   2175
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÑÈÍ ÇáãÈíÚÇÊ ÇáãÏÝæÚÉ"
      Height          =   375
      Left            =   12720
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   6240
      Width           =   1935
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáãÈíÚÇÊ ÇáãÞÈæÖÉ"
      Height          =   495
      Left            =   12720
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   4440
      Width           =   1695
   End
   Begin VB.Label Label14 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáßãíÉ ÇáãÈÇÚÉ"
      Height          =   375
      Left            =   12600
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   5640
      Width           =   2175
   End
   Begin VB.Label Label16 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáãÈíÚÇÊ ÇáÛíÑ ãÞÈæÖÉ"
      Height          =   375
      Left            =   12600
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   5040
      Width           =   2175
   End
   Begin VB.Label Label17 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÑÈÍ ÇáãÈíÚÇÊ ÇáßáíÉ"
      Height          =   375
      Left            =   12720
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   7440
      Width           =   1935
   End
   Begin VB.Label Label3 
      BackColor       =   &H00F7E3E1&
      BackStyle       =   0  'Transparent
      Caption         =   "ãä ÃÌá ÇáãÌãæÚÉ"
      Height          =   375
      Left            =   13080
      TabIndex        =   12
      Top             =   3240
      Width           =   1455
   End
   Begin VB.Label Label2 
      BackColor       =   &H00F7E3E1&
      BackStyle       =   0  'Transparent
      Caption         =   "ãä ÃÌá ÇáãÇÏÉ"
      Height          =   255
      Left            =   11280
      TabIndex        =   11
      Top             =   3240
      Width           =   1215
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      Index           =   0
      X1              =   11280
      X2              =   14160
      Y1              =   8040
      Y2              =   8040
   End
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ÊÇÑíÎ"
      Height          =   375
      Left            =   8520
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1320
      Width           =   615
   End
End
Attribute VB_Name = "frmSubject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub WriteTabel()
    Grid1.Cols = 5
    Grid1.TextMatrix(0, 0) = "ÇáÅÌãÇáí"
    Grid1.TextMatrix(0, 1) = "ÇáÑÈÍ"
    Grid1.TextMatrix(0, 2) = "ÇáÈíÇä"
    Grid1.TextMatrix(0, 3) = "ÇáÚÏÏ"
    Grid1.TextMatrix(0, 4) = "ÇáÅÝÑÇÏí"
    Grid1.ColWidth(0) = 2000
    Grid1.ColWidth(1) = 1000
    Grid1.ColWidth(2) = 2000
    Grid1.ColWidth(3) = 1900
    Grid1.ColWidth(4) = 1900
    For Rep = 0 To 4
        Grid1.ColAlignment(Rep) = 3
    Next Rep

    Grid2.Cols = 6
    Grid2.TextMatrix(0, 0) = "ÇáÅÌãÇáí"
    Grid2.TextMatrix(0, 1) = "ÇáÑÈÍ"
    Grid2.TextMatrix(0, 2) = "ÇáÈíÇä"
    Grid2.TextMatrix(0, 3) = "ÇáãÔÊÑí"
    Grid2.TextMatrix(0, 4) = "ÇáãÏÝæÚ"
    Grid2.TextMatrix(0, 5) = "ÇáÈÇÞí"
    Grid2.ColWidth(0) = 2000
    Grid2.ColWidth(1) = 1000
    Grid2.ColWidth(2) = 2000
    Grid2.ColWidth(3) = 1000
    Grid2.ColWidth(4) = 1400
    Grid2.ColWidth(5) = 1400
    For Rep = 0 To 5
        Grid2.ColAlignment(Rep) = 3
    Next Rep

End Sub

Private Sub cmbGroub_Click()
    SelSQL = "select * from tblkind where dgroub='" & cmbGroub.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    cmbMat.Clear
    Do While Not Rs.EOF
        cmbMat.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
End Sub

Private Sub cmdBack_Click()
    frmSubject.Hide
    frmMain.Show
End Sub

Private Sub cmdDelete_Click()
    txtWin.Text = 0
    txtGWin.Text = 0
    txtAllWin.Text = 0
    txtBuy.Text = 0
    txtGBuy.Text = 0
    txtLot.Text = 0
    Grid1.Clear
    Grid1.Rows = 1
    Grid2.Clear
    Grid2.Rows = 1
    
    WriteTabel
End Sub

Private Sub cmdExit_Click()
     ExitPro
End Sub

Private Sub cmdShow_Click()
'Filling : Fill Tabels with data
    frmWait.Show
    DoEvents
    cmdDelete_Click
    If txtSearch.Text = "" Then
        SelSQL = "select * from tbldata where dmat='" & cmbMat.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tbldata where dmat  like '" & txtSearch.Text & "%' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Rep = 1
    Do While Not Rs.EOF
        Grid1.Rows = Rep + 1
        Grid1.TextMatrix(Rep, 0) = Rs("dprice")
        Grid1.TextMatrix(Rep, 1) = Rs("dwin")
        Grid1.TextMatrix(Rep, 2) = Rs("dmat")
        Grid1.TextMatrix(Rep, 3) = Rs("dnum")
        Grid1.TextMatrix(Rep, 4) = Rs("dsprice")
        
        txtWin.Text = txtWin.Text + CLng(Rs("dwin"))
        txtLot.Text = txtLot.Text + CLng(Rs("dnum"))
        txtBuy.Text = txtBuy.Text + CLng(Rs("dprice"))
        txtAllWin.Text = txtAllWin.Text + CLng(Rs("dwin"))
        
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    If txtSearch.Text = "" Then
        SelSQL = "select * from tblguest  where dmat='" & cmbMat.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tblguest  where dmat like '" & txtSearch.Text & "%' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Rep = 1
    Do While Not Rs.EOF
        Grid2.Rows = Rep + 1
        Grid2.TextMatrix(Rep, 0) = Rs("dprice")
        Grid2.TextMatrix(Rep, 1) = Rs("dwin")
        Grid2.TextMatrix(Rep, 2) = Rs("dmat")
        Grid2.TextMatrix(Rep, 3) = Rs("dname")
        Grid2.TextMatrix(Rep, 4) = Rs("dpay")
        Grid2.TextMatrix(Rep, 4) = Rs("drest")
        
        txtGWin.Text = txtGWin.Text + CLng(Rs("dwin"))
        txtLot.Text = txtLot.Text + CLng(Rs("dnum"))
        txtGBuy.Text = txtGBuy.Text + CLng(Rs("dprice"))
        txtAllWin.Text = txtAllWin.Text + CLng(Rs("dwin"))
        
        Rep = Rep + 1
        Rs.movenext
    Loop
    frmWait.Hide
End Sub

Private Sub cmdShowScope_Click()
    frmWait.Show
    DoEvents
    
    cmdDelete_Click
    If txtSearch.Text = "" Then
        SelSQL = "select * from tbldata where dmat='" & cmbMat.Text & "' and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    Else
        SelSQL = "select * from tbldata where dmat like '%" & txtSearch.Text & "%' and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Rep = 1
    Do While Not Rs.EOF
        Grid1.Rows = Rep + 1
        Grid1.TextMatrix(Rep, 0) = Rs("dprice")
        Grid1.TextMatrix(Rep, 1) = Rs("dwin")
        Grid1.TextMatrix(Rep, 2) = Rs("dmat")
        Grid1.TextMatrix(Rep, 3) = Rs("dnum")
        Grid1.TextMatrix(Rep, 4) = Rs("dsprice")
        
        txtWin.Text = txtWin.Text + CLng(Rs("dwin"))
        txtLot.Text = txtLot.Text + CLng(Rs("dnum"))
        txtBuy.Text = txtBuy.Text + CLng(Rs("dprice"))
        txtAllWin.Text = txtAllWin.Text + CLng(Rs("dwin"))
        
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    If txtSearch.Text = "" Then
        SelSQL = "select * from tblguest where  dmat='" & cmbMat.Text & "' and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    Else
        SelSQL = "select * from tblguest where  dmat like '%" & txtSearch.Text & "%' and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Rep = 1
    Do While Not Rs.EOF
        Grid2.Rows = Rep + 1
        Grid2.TextMatrix(Rep, 0) = Rs("dprice")
        Grid2.TextMatrix(Rep, 1) = Rs("dwin")
        Grid2.TextMatrix(Rep, 2) = Rs("dmat")
        Grid2.TextMatrix(Rep, 3) = Rs("dname")
        Grid2.TextMatrix(Rep, 4) = Rs("dpay")
        Grid2.TextMatrix(Rep, 4) = Rs("drest")
        
        txtGWin.Text = txtGWin.Text + CLng(Rs("dwin"))
        txtLot.Text = txtLot.Text + CLng(Rs("dnum"))
        txtGBuy.Text = txtGBuy.Text + CLng(Rs("dprice"))
        txtAllWin.Text = txtAllWin.Text + CLng(Rs("dwin"))
        
        Rep = Rep + 1
        Rs.movenext
    Loop
    frmWait.Hide
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
    SelSQL = "select dname from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbMat.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    SelSQL = "select dgroub from tblkind group by dgroub"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbGroub.List(Rep) = Rs("dgroub")
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    WriteTabel
    
End Sub

Private Sub txtSearch_Change()
    If cmbMat.Text <> "" Or cmbGroub.Text <> "" Then
        cmbMat.Text = ""
        cmbGroub.Text = ""
    End If
End Sub
