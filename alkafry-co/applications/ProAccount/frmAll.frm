VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmAll 
   Caption         =   "ÌÑÏ ÇáÍÓÇÈÇÊ"
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
   Picture         =   "frmAll.frx":0000
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txt 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   840
      TabIndex        =   12
      Text            =   "0"
      Top             =   1560
      Width           =   1455
   End
   Begin VB.ComboBox cmbToDay 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   6540
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1560
      Width           =   735
   End
   Begin VB.ComboBox cmbToMonth 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   5580
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1560
      Width           =   855
   End
   Begin VB.ComboBox cmbToYear 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      ItemData        =   "frmAll.frx":17096
      Left            =   4380
      List            =   "frmAll.frx":170C7
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   1560
      Width           =   1095
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   9885
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   1560
      Width           =   735
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      Left            =   8925
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1560
      Width           =   855
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00FFFFC0&
      Height          =   405
      ItemData        =   "frmAll.frx":17125
      Left            =   7725
      List            =   "frmAll.frx":17156
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton cmdShow 
      Caption         =   "ÚÑÖ"
      Height          =   375
      Left            =   2580
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1560
      Width           =   1575
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFFF80&
      Caption         =   "ÎÑæÌ"
      Height          =   495
      Left            =   4815
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   9960
      Width           =   2415
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFFF80&
      Caption         =   "ÚæÏÉ"
      Height          =   495
      Left            =   7980
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   9960
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid grData 
      Height          =   7095
      Left            =   825
      TabIndex        =   2
      Top             =   2520
      Width           =   13590
      _ExtentX        =   23971
      _ExtentY        =   12515
      _Version        =   393216
      FixedRows       =   0
      FixedCols       =   0
      BackColorFixed  =   16761024
      ForeColorFixed  =   12582912
      BackColorBkg    =   16777152
      RightToLeft     =   -1  'True
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Åáì"
      Height          =   375
      Left            =   7260
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1560
      Width           =   375
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ÚÑÖ ÇáÈíÇäÇÊ ãä"
      Height          =   375
      Left            =   10845
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1560
      Width           =   1815
   End
End
Attribute VB_Name = "frmAll"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim thisCol As Integer, intFirst As Integer, intLast As Integer

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

Private Sub cmdShow_Click()
'dementions
    Dim dNum As Long, dSPrice As Long, dWin As Long, dpay As Long, drest As Long, dPrice As Long, bytCol As Byte
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
    grData.Text = "ÇáÓÚÑ ÇáÅÌãÇáí"
    grData.Col = 1
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÈíÇä"
    grData.Col = 2
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÚÏÏ"
    grData.Col = 3
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÓÚÑ ÇáÅÝÑÇÏí"
    grData.Col = 4
    grData.CellBackColor = &H80FF80
    grData.Text = "ÅÓã ÇáãÔÊÑí"
    grData.Col = 5
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÑÈÌ"
    grData.Col = 6
    grData.CellBackColor = &H80FF80
    grData.Text = "ãáÇÍÙÇÊ"
    Rep = 1
    SelSQL = "select * from tbldata where dday>=" & cmbDay.Text & " and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dday<=" & cmbToDay.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
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
        Rs.movenext
    Loop
    grData.Rows = Rep + 1
    grData.Row = Rep
    For bytCol = 0 To 5
        grData.Col = bytCol
        grData.CellBackColor = vbBlack
    Next bytCol
    
    grData.Rows = Rep + 2
    grData.Row = Rep + 1
    grData.Col = 0
    grData.Text = dPrice
    grData.Col = 2
    grData.Text = dNum
    grData.Col = 3
    grData.Text = dSPrice
    grData.Col = 5
    grData.Text = dWin

' fill second part of table with data (tblguest)
    grData.Rows = Rep + 4
    grData.Row = Rep + 3
    grData.Col = 0
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÓÚÑ ÇáÅÌãÇáí"
    grData.Col = 1
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÈíÇä"
    grData.Col = 2
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÚÏÏ"
    grData.Col = 3
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÓÚÑ ÇáÅÝÑÇÏí"
    grData.Col = 4
    grData.CellBackColor = &H80FF80
    grData.Text = "ÅÓã ÇáãÔÊÑí"
    grData.Col = 5
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáãÏÝæÚ"
    grData.Col = 6
    grData.CellBackColor = &H80FF80
    grData.Text = "ÇáÈÇÞí"
    SelSQL = "select * from tblguest where dday>=" & cmbDay.Text & " and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dday<=" & cmbToDay.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
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
        dNum = dNum + Rs("dnum")
        dPrice = dPrice + Rs("dprice")
        dSPrice = dSPrice + Rs("dsprice")
        dpay = dpay + Rs("dpay")
        drest = drest + Rs("drest")
        Rep = Rep + 1
        Rs.movenext
    Loop
    grData.Rows = Rep + 4
    grData.Row = Rep + 3
    For bytCol = 0 To 5
        grData.Col = bytCol
        grData.CellBackColor = vbBlack
    Next bytCol
    
    grData.Rows = Rep + 5
    grData.Row = Rep + 4
    grData.Col = 0
    grData.Text = "ÇáãÌãæÚ"
    grData.Col = 2
    grData.Text = dNum
    grData.Col = 3
    grData.Text = dSPrice
    grData.Col = 4
    grData.Text = dPrice
    grData.Col = 5
    grData.Text = dpay
    grData.Col = 6
    grData.Text = drest

End Sub

Private Sub Txt_Click()
    txt = 0
End Sub

Private Sub Form_Load()
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        cmbToDay.List(Rep - 1) = Rep
        If Rep <= 12 Then
        cmbMonth.List(Rep - 1) = Rep
        cmbToMonth.List(Rep - 1) = Rep
        End If
    Next Rep
    cmbToDay.Text = Day(Now)
    cmbToMonth.Text = Month(Now)
    cmbToYear.Text = Year(Now)
    cmbDay.Text = "1"
    cmbMonth.Text = "1"
    cmbYear.Text = "2000"
    grData.Cols = 7
    grData.ColWidth(0) = 1500
    grData.ColWidth(1) = 2500
    grData.ColWidth(2) = 1500
    grData.ColWidth(3) = 1500
    grData.ColWidth(4) = 2000
    grData.ColWidth(5) = 1500
    grData.ColWidth(6) = 2800
    For Rep = 0 To 6
        grData.ColAlignment(Rep) = 3
    Next
    cmdShow_Click
End Sub

Private Sub cmdBack_Click()
    frmShow.Hide
    frmMain.Show
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

