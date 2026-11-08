VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmShow 
   Caption         =   "⁄—÷ «·„‘ —Ì« "
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
   Begin VB.CommandButton Command1 
      Caption         =   "Õ–›"
      Height          =   375
      Left            =   2160
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1560
      Width           =   1695
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   495
      Left            =   9675
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   9960
      Width           =   2415
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   6510
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   9960
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid grData 
      Height          =   7095
      Left            =   285
      TabIndex        =   6
      Top             =   2520
      Width           =   14670
      _ExtentX        =   25876
      _ExtentY        =   12515
      _Version        =   393216
      FixedRows       =   0
      BackColor       =   16777215
      BackColorFixed  =   8454016
      RightToLeft     =   -1  'True
   End
   Begin VB.CommandButton cmdShow 
      Caption         =   "⁄—÷"
      Height          =   375
      Left            =   4200
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1560
      Width           =   1575
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "frmShow.frx":0000
      Left            =   6000
      List            =   "frmShow.frx":0031
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   1560
      Width           =   1095
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      Left            =   7200
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1560
      Width           =   855
   End
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   8160
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1560
      Width           =   735
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "⁄—÷ «·»Ì«‰«  » «—ÌŒ"
      Height          =   375
      Left            =   9120
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1560
      Width           =   1815
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "⁄—÷ «·„‘ —Ì« "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   26.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4260
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   360
      Width           =   6735
   End
End
Attribute VB_Name = "frmShow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    frmShow.Hide
    frmMain.Show
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub cmdShow_Click()
'dementions
    On Error Resume Next
    Dim dNum As Long, dSPrice As Long, dWin As Long, dPay As Long, dRest As Long, dwin2 As Long
    dSPrice = 0
    dPrice = 0
    dWin = 0
    dNum = 0
    dPay = 0
    dRest = 0
    
'find targer
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"

'data base connection
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    grData.Clear
    
'fill first part of table with data ( tblData)
    grData.Row = 0
    grData.Col = 0
    grData.CellBackColor = &H80FF80
    grData.Text = "≈”„ «·„«œ…"
    grData.Col = 1
    grData.CellBackColor = &H80FF80
    grData.Text = "«·„‘ —Ì"
    grData.Col = 2
    grData.CellBackColor = &H80FF80
    grData.Text = "«·ﬂ„Ì…"
    grData.Col = 3
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈›—«œÌ"
    grData.Col = 4
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈Ã„«·Ì"
    grData.Col = 5
    grData.CellBackColor = &H80FF80
    grData.Text = "«·—»Ã"
    grData.Col = 6
    grData.CellBackColor = &H80FF80
    grData.Text = "„·«ÕŸ« "
    Rep = 1
    SelSQL = "select * from tbldata where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    On Error Resume Next
    Do While Not Rs.EOF
        grData.Rows = Rep + 1
        grData.Row = Rep
        grData.Col = 0
        grData.Text = Rs("dmat")
        grData.Col = 1
        grData.Text = Rs("dname")
        grData.Col = 2
        grData.Text = Rs("dnum")
        grData.Col = 3
        grData.Text = Rs("dsprice")
        grData.Col = 4
        grData.Text = Rs("dprice")
        grData.Col = 5
        grData.Text = Rs("dwin")
        grData.Col = 6
        grData.Text = Rs("ddes")
        dNum = dNum + Rs("dnum")
        dPrice = dPrice + Rs("dprice")
        dSPrice = dSPrice + Rs("dsprice")
        dWin = dWin + Rs("dwin")
        Rep = Rep + 1
        Rs.movenext
    Loop
    grData.Rows = Rep + 1
    grData.Row = Rep
    grData.Col = 0
    grData.Text = "«·„Ã„Ê⁄"
    grData.Col = 2
    grData.Text = dNum
    grData.Col = 3
    grData.Text = dSPrice
    grData.Col = 4
    grData.Text = dPrice
    grData.Col = 5
    grData.Text = dWin

' fill second part of table with data (tblguest)
    grData.Rows = Rep + 3
    grData.Row = Rep + 2
    grData.Col = 0
    grData.CellBackColor = &H80FF80
    grData.Text = "≈”„ «·„«œ…"
    grData.Col = 1
    grData.CellBackColor = &H80FF80
    grData.Text = "«·„‘ —Ì"
    grData.Col = 2
    grData.CellBackColor = &H80FF80
    grData.Text = "«·ﬂ„Ì…"
    grData.Col = 3
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈›—«œÌ"
    grData.Col = 4
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈Ã„«·Ì"
    grData.Col = 5
    grData.CellBackColor = &H80FF80
    grData.Text = "«·„œ›Ê⁄"
    grData.Col = 6
    grData.CellBackColor = &H80FF80
    grData.Text = "«·»«ﬁÌ"
    grData.Col = 7
    grData.CellBackColor = &H80FF80
    grData.Text = "«·√—»«Õ"
    SelSQL = "select * from tblguest where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    dSPrice = 0
    dPrice = 0
    dWin = 0
    dNum = 0
    dPay = 0
    dRest = 0
    Do While Not Rs.EOF
        grData.Rows = Rep + 4
        grData.Row = Rep + 3
        grData.Col = 0
        grData.Text = Rs("dmat")
        grData.Col = 1
        grData.Text = Rs("dname")
        grData.Col = 2
        grData.Text = Rs("dnum")
        grData.Col = 3
        grData.Text = Rs("dsprice")
        grData.Col = 4
        grData.Text = Rs("dprice")
        grData.Col = 5
        grData.Text = Rs("dpay")
        grData.Col = 6
        grData.Text = Rs("drest")
        grData.Col = 7
        grData.Text = Rs("dwin")
        dNum = dNum + Rs("dnum")
        dPrice = dPrice + Rs("dprice")
        dSPrice = dSPrice + Rs("dsprice")
        dPay = dPay + Rs("dpay")
        dRest = dRest + Rs("drest")
        dwin2 = dwin2 + Rs("dwin")
        Rep = Rep + 1
        Rs.movenext
    Loop
    grData.Rows = Rep + 4
    grData.Row = Rep + 3
    grData.Col = 0
    grData.Text = "«·„Ã„Ê⁄"
    grData.Col = 2
    grData.Text = dNum
    grData.Col = 3
    grData.Text = dSPrice
    grData.Col = 4
    grData.Text = dPrice
    grData.Col = 5
    grData.Text = dPay
    grData.Col = 6
    grData.Text = dRest
    grData.Col = 7
    grData.Text = dwin2
End Sub

Private Sub Command1_Click()
    Dim Ms As Byte, Copy As String, thisLot As Long
    Ms = MsgBox("√„ √ﬂœ „‰ Õ–› «·”Ã· «·„Õœœ", vbYesNo + vbQuestion, grData.TextMatrix(grData.RowSel, 0))
    If Ms = vbNo Then Exit Sub
    SelSQL = "delete from tbldata where dname='" & grData.TextMatrix(grData.RowSel, 1) & "' and dmat='" & grData.TextMatrix(grData.RowSel, 0) & "' and dnum=" & grData.TextMatrix(grData.RowSel, 2) & " and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "select dlot from tblkind where dname='" & grData.TextMatrix(grData.RowSel, 0) & "'"
    Set Rs = ADO.execute(SelSQL)
    thisLot = Rs("dlot")
    SelSQL = "update tblkind set dlot=" & thisLot + grData.TextMatrix(grData.RowSel, 2) & " where dname='" & grData.TextMatrix(grData.RowSel, 0) & "'"
    Set Rs = ADO.execute(SelSQL)
    cmdShow_Click
End Sub

Private Sub Form_Activate()
    cmdShow_Click
End Sub

Private Sub Form_Load()
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    grData.Cols = 8
    grData.ColWidth(0) = 3000
    grData.ColWidth(1) = 3000
    grData.ColWidth(2) = 1800
    grData.ColWidth(3) = 1200
    grData.ColWidth(4) = 1200
    grData.ColWidth(5) = 1200
    grData.ColWidth(6) = 2000
    grData.ColWidth(7) = 2000
    For Rep = 0 To 7
        grData.ColAlignment(Rep) = 3
    Next
    cmdShow_Click
End Sub
