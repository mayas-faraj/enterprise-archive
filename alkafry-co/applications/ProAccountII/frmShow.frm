VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
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
   Picture         =   "frmShow.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txt 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Height          =   315
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Text            =   "0"
      Top             =   1560
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ–›"
      Height          =   375
      Left            =   2280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   1560
      Width           =   1695
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   7793
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   10200
      Width           =   2415
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   4920
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   10200
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid grData 
      Height          =   7095
      Left            =   285
      TabIndex        =   5
      Top             =   2520
      Width           =   14670
      _ExtentX        =   25876
      _ExtentY        =   12515
      _Version        =   393216
      FixedRows       =   0
      BackColor       =   16777215
      BackColorFixed  =   8454016
      ForeColorFixed  =   12582912
      BackColorBkg    =   15654871
      RightToLeft     =   -1  'True
   End
   Begin VB.CommandButton cmdShow 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄—÷"
      Height          =   375
      Left            =   4080
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1560
      Width           =   1575
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmShow.frx":26208
      Left            =   6000
      List            =   "frmShow.frx":26239
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1560
      Width           =   1095
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7200
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1560
      Width           =   855
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   8160
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1560
      Width           =   735
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "⁄—÷ «·»Ì«‰«  » «—ÌŒ"
      Height          =   375
      Left            =   9120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   1560
      Width           =   1815
   End
End
Attribute VB_Name = "frmShow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim bytNum As Integer, intFirst As Integer, intLast As Integer
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
    Dim dNum As Long, dSPrice As Long, dWin As Long, dpay As Long, drest As Long, dwin2 As Long
    dSPrice = 0
    dPrice = 0
    dWin = 0
    dNum = 0
    dpay = 0
    drest = 0
    
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
    grData.Text = "«·”⁄— «·≈Ã„«·Ì"
    grData.Col = 1
    grData.CellBackColor = &H80FF80
    grData.Text = "«·»Ì«‰"
    grData.Col = 2
    grData.CellBackColor = &H80FF80
    grData.Text = "«·ﬂ„Ì…"
    grData.Col = 3
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈›—«œÌ"
    grData.Col = 4
    grData.CellBackColor = &H80FF80
    grData.Text = "«·„‘ —Ì"
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
        grData.Text = Rs("dprice")
        grData.Col = 1
        grData.Text = Rs("dmat")
        grData.Col = 2
        grData.Text = Rs("dnum")
        grData.Col = 3
        grData.Text = Rs("dsprice")
        grData.Col = 4
        grData.Text = Rs("dname")
        grData.Col = 5
        grData.Text = Rs("dwin")
        grData.Col = 6
        grData.Text = Rs("ddes")
        
        dNum = dNum + Rs("dnum")
        dPrice = dPrice + Rs("dprice")
        dSPrice = dSPrice + Rs("dsprice")
        dWin = dWin + Rs("dwin")
        Rep = Rep + 1
        bytNum = bytNum + 1
        Rs.movenext
    Loop
    grData.Rows = Rep + 1
    grData.Row = Rep
    grData.Col = 0
    grData.Text = dPrice
    grData.Col = 2
    grData.Text = dNum
    grData.Col = 3
    grData.Text = dSPrice
    grData.Col = 5
    grData.Text = dWin

' fill second part of table with data (tblguest)
    grData.Rows = Rep + 3
    grData.Row = Rep + 2
    grData.Col = 0
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈Ã„«·Ì"
    grData.Col = 1
    grData.CellBackColor = &H80FF80
    grData.Text = "«·»Ì«‰"
    grData.Col = 2
    grData.CellBackColor = &H80FF80
    grData.Text = "«·ﬂ„Ì…"
    grData.Col = 3
    grData.CellBackColor = &H80FF80
    grData.Text = "«·”⁄— «·≈›—«œÌ"
    grData.Col = 4
    grData.CellBackColor = &H80FF80
    grData.Text = "«·„‘ —Ì"
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
    dpay = 0
    drest = 0
    Do While Not Rs.EOF
        grData.Rows = Rep + 4
        grData.Row = Rep + 3
        grData.Col = 0
        grData.Text = Rs("dprice")
        grData.Col = 1
        grData.Text = Rs("dmat")
        grData.Col = 2
        grData.Text = Rs("dnum")
        grData.Col = 3
        grData.Text = Rs("dsprice")
        grData.Col = 4
        grData.Text = Rs("dname")
        grData.Col = 5
        grData.Text = Rs("dpay")
        grData.Col = 6
        grData.Text = Rs("drest")
        grData.Col = 7
        grData.Text = Rs("dwin")
        
        dNum = dNum + Rs("dnum")
        dPrice = dPrice + Rs("dprice")
        dSPrice = dSPrice + Rs("dsprice")
        dpay = dpay + Rs("dpay")
        drest = drest + Rs("drest")
        dwin2 = dwin2 + Rs("dwin")
        Rep = Rep + 1
        bytNum = bytNum + 1
        Rs.movenext
    Loop
    grData.Rows = Rep + 4
    grData.Row = Rep + 3
    grData.Col = 0
    grData.Text = dPrice
    grData.Col = 2
    grData.Text = dNum
    grData.Col = 3
    grData.Text = dSPrice
    grData.Col = 5
    grData.Text = dpay
    grData.Col = 6
    grData.Text = drest
    grData.Col = 7
    grData.Text = dwin2

    
End Sub

Private Sub Command1_Click()
    Dim Ms As Byte, Copy As String, thisLot As Long
    Ms = MsgBox("√„ √ﬂœ „‰ Õ–› «·”Ã· «·„Õœœ", vbYesNo + vbQuestion, grData.TextMatrix(grData.RowSel, 0))
    If Ms = vbNo Then Exit Sub
    If grData.TextMatrix(grData.RowSel, 7) = "" Then
        SelSQL = "delete from tbldata where dname='" & grData.TextMatrix(grData.RowSel, 4) & "' and dmat='" & grData.TextMatrix(grData.RowSel, 1) & "' and dnum=" & grData.TextMatrix(grData.RowSel, 2) & " and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "delete from tblguest where dname='" & grData.TextMatrix(grData.RowSel, 4) & "' and dmat='" & grData.TextMatrix(grData.RowSel, 1) & "' and dnum=" & grData.TextMatrix(grData.RowSel, 2) & " and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "select dlot from tblkind where dname='" & grData.TextMatrix(grData.RowSel, 1) & "'"
    Set Rs = ADO.execute(SelSQL)
    thisLot = Rs("dlot")
    SelSQL = "update tblkind set dlot=" & thisLot + grData.TextMatrix(grData.RowSel, 2) & " where dname='" & grData.TextMatrix(grData.RowSel, 4) & "'"
    Set Rs = ADO.execute(SelSQL)
    cmdShow_Click
End Sub

Private Sub Txt_Click()
    txt = 0
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
    grData.ColWidth(0) = 1500
    grData.ColWidth(1) = 3000
    grData.ColWidth(2) = 1500
    grData.ColWidth(3) = 1300
    grData.ColWidth(4) = 2300
    grData.ColWidth(5) = 1200
    grData.ColWidth(6) = 1700
    grData.ColWidth(7) = 1800
    For Rep = 0 To 7
        grData.ColAlignment(Rep) = 3
    Next
    cmdShow_Click
End Sub

Private Sub grData_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    intFirst = grData.RowSel
End Sub

Private Sub grData_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim bytStep As Integer
    intLast = grData.RowSel
    txt = 0
    If intLast >= intFirst Then bytStep = 1 Else bytStep = -1
    For Rep = intFirst To intLast Step bytStep
        If IsNumeric(grData.TextMatrix(Rep, grData.ColSel)) = True Then
        txt.Text = txt.Text + Int(grData.TextMatrix(Rep, grData.ColSel))
        End If
    Next Rep
    
End Sub
