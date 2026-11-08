VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Begin VB.Form frmGuest 
   Caption         =   "Õ”«»«  «·“»«∆‰"
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
   Picture         =   "frmGuest.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdErase 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ–›"
      Enabled         =   0   'False
      Height          =   405
      Left            =   10080
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   10320
      Width           =   1215
   End
   Begin VB.TextBox Txt 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Text            =   "0"
      Top             =   1440
      Width           =   2655
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   5640
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1440
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmGuest.frx":26512
      Left            =   4800
      List            =   "frmGuest.frx":26514
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1440
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmGuest.frx":26516
      Left            =   3720
      List            =   "frmGuest.frx":26547
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1440
      Width           =   975
   End
   Begin VB.TextBox txtEnd 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Text            =   "0"
      Top             =   1440
      Width           =   3975
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ÿ»«⁄…"
      Height          =   405
      Left            =   11640
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   10320
      Width           =   1215
   End
   Begin VB.ComboBox cmdSeller 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   12120
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   2040
      Width           =   2895
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Œ—ÊÃ"
      Height          =   405
      Left            =   5400
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   10320
      Width           =   1215
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄Êœ…"
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   10320
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ–› «·Õ”«»"
      Height          =   405
      Left            =   8520
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   10320
      Width           =   1215
   End
   Begin VB.CommandButton cmdCash 
      BackColor       =   &H00FFC0C0&
      Caption         =   " ”œÌœ œ›⁄…"
      Height          =   405
      Left            =   13200
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   10320
      Width           =   1215
   End
   Begin MSFlexGridLib.MSFlexGrid grData 
      Height          =   7815
      Left            =   240
      TabIndex        =   1
      Top             =   2040
      Width           =   11715
      _ExtentX        =   20664
      _ExtentY        =   13785
      _Version        =   393216
      Cols            =   7
      ForeColor       =   0
      BackColorFixed  =   12648384
      ForeColorFixed  =   12582912
      BackColorBkg    =   15654871
      RightToLeft     =   -1  'True
   End
   Begin VB.ListBox lstSeller 
      BackColor       =   &H00C0FFFF&
      Height          =   7185
      Left            =   12120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   2640
      Width           =   2895
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008080&
      Height          =   615
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   360
      Width           =   4575
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   6480
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   1440
      Width           =   615
   End
End
Attribute VB_Name = "frmGuest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dPrice As Long, Ordring As String, thisCol As Integer, intFirst As Integer, intLast As Integer, arrDay(5000) As Byte, arrMonth(5000) As Byte, arrYear(5000) As Integer
Private Sub cmdBack_Click()
    frmMain.Show
    frmGuest.Hide
End Sub

Private Sub cmdCash_Click()
    Dim boxNum As Long, dMoney As Long
    boxNum = InputBox("Ì—ÃÌ ≈œŒ«· ﬁÌ„… «·„»·€ «·„”œœ „‰ ﬁ»· «·”Ìœ " & lstSeller.Text, "ﬁÌ„… «·„»·€", 0)
    dMoney = Int(dPrice) - Int(boxNum)
    SelSQL = "update tblmoney set dmoney=" & dMoney & " where dname='" & lstSeller.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "insert into tblguest (dname,dmat,dpay,drest,dday,dmonth,dyear) values ('" & lstSeller.Text & "','" & "œ›⁄… ⁄·Ï «·Õ”«»" & "'," & boxNum & ",0," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
    Set Rs = ADO.execute(SelSQL)
    lstSeller_Click
End Sub

Private Sub cmdDelete_Click()
    Ms = MsgBox("”Ê›  ﬁÊ„ »Õ–› «·Õ”«» «·„Õœœ ﬂ«„·« , Â·  —Ìœ «·„ «»⁄…", vbYesNo, "Ã–› Õ”«»")
    If Ms = vbYes Then
        SelSQL = "delete from tblmoney where dname='" & lstSeller.Text & "'"
        Set Rs = ADO.execute(SelSQL)
        DoEvents
        Dim DOThis As Long
        Do Until DOThis = 10000000
            DOThis = DOThis + 1
        Loop
        grData.Clear
        lstSeller.Clear
        Form_Load
    End If
End Sub

Private Sub cmdErase_Click()
    Dim Ms As Byte
    Ms = MsgBox("√„ √ﬂœ „‰ Õ–› «·”Ã· / «·”Ã·«  «·„Õœœ…", vbYesNo, "„⁄«·Ã Õ–› «·»Ì«‰« ")
    If Ms = vbNo Then Exit Sub
    For Rep = intFirst To intLast
        SelSQL = "delete from tblguest where dname='" & lstSeller.Text & "' and dmat='" & grData.TextMatrix(Rep, 2) & "' and dnum=" & grData.TextMatrix(Rep, 3) & " and dsprice=" & grData.TextMatrix(Rep, 4) & " and dday=" & arrDay(Rep) & " and dmonth=" & arrMonth(Rep) & " and dyear=" & arrYear(Rep)
        Set Rs = ADO.execute(SelSQL)
    Next
    cmdErase.Enabled = False
    lstSeller_Click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub cmdSeller_Click()
    lstSeller.Text = cmdSeller.Text
    lstSeller_Click
End Sub

Private Sub Command1_Click()
    frmGPrint.Show
    frmGuest.Hide
End Sub

Private Sub Form_Activate()

    If thisAccount = "" Then Exit Sub
    Form_Load
    lstSeller.Text = thisAccount
    lstSeller_Click
    thisAccount = ""

End Sub

Private Sub Form_Load()
'making table
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    
    grData.Cols = 7
    grData.Row = 0
    grData.Col = 0
    grData.Text = "«· «—ÌŒ"
    grData.Col = 1
    grData.Text = "«·”⁄— «·≈Ã„«·Ì"
    grData.Col = 2
    grData.Text = "«·»Ì«‰"
    grData.Col = 3
    grData.Text = "«·⁄œœ"
    grData.Col = 4
    grData.Text = "«·”⁄— «·≈›—«œÌ"
    grData.Col = 5
    grData.Text = "«·„œ›Ê⁄"
    grData.Col = 6
    grData.Text = "«·»«ﬁÌ"
    grData.ColWidth(0) = 1500
    grData.ColWidth(1) = 2000
    grData.ColWidth(2) = 3000
    grData.ColWidth(3) = 1400
    grData.ColWidth(4) = 1400
    grData.ColWidth(5) = 1400
    grData.ColWidth(6) = 1400
    For Rep = 0 To 6
        grData.ColAlignment(Rep) = 3
    Next
    
'find targer
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"

'data base connection
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    
'fill the list with data
    Set Rs = ADO.execute("select * from tblmoney order by dname")
    Rep = 0
    Do While Not Rs.EOF
        lstSeller.List(Rep) = Rs("dname")
        cmdSeller.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
End Sub

Private Sub grData_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    intFirst = grData.RowSel
End Sub

Private Sub grData_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim bytStep As Integer
    intLast = grData.RowSel
    Txt = 0
    If intLast >= intFirst Then bytStep = 1 Else bytStep = -1
    For Rep = intFirst To intLast Step bytStep
        If IsNumeric(grData.TextMatrix(Rep, grData.ColSel)) = True Then
        Txt.Text = Txt.Text + Int(grData.TextMatrix(Rep, grData.ColSel))
        End If
    Next Rep
    cmdErase.Enabled = True
End Sub

Private Sub lstSeller_Click()
'establish grid
    Dim dNum As Long, dSPrice As Long, dpay As Long, drest As Long, bytRep As Byte
    dPrice = 0
    Label1.Caption = "’›Õ… «·”Ìœ " & lstSeller.Text
'fill grid with data
    Rep = 1
    For bytRep = 1 To 12
        SelSQL = "select * from tblguest where dname='" & lstSeller.Text & "' and dmonth=" & bytRep & " order by dday"
        Set Rs = ADO.execute(SelSQL)
        Do While Not Rs.EOF
            PrintNum = Rep - 1
            arrDay(Rep) = Rs("dday")
            arrMonth(Rep) = Rs("dmonth")
            arrYear(Rep) = Rs("dyear")
            grData.Rows = Rep + 1
            grData.Row = Rep
            grData.Col = 0
            grData.Text = Rs("dday") & "/" & Rs("dmonth") & "/" & Rs("dyear")
            grData.Col = 1
            grData.Text = Rs("dprice")
            grData.Col = 2
            grData.Text = Rs("dmat")
            grData.Col = 3
            grData.Text = Rs("dnum")
            grData.Col = 4
            grData.Text = Rs("dsprice")
            grData.Col = 5
            grData.Text = Rs("dpay")
            grData.Col = 6
            grData.Text = Rs("drest")
            dNum = dNum + Rs("dnum")
            dPrice = dPrice + Rs("dprice")
            dSPrice = dSPrice + Rs("dsprice")
            drest = drest + Rs("drest")
            dpay = dpay + Rs("dpay")
            dWin = dWin + Rs("dwin")
            Rep = Rep + 1
            Rs.movenext
        Loop
    Next bytRep
    grData.Rows = Rep + 1
    grData.Row = Rep
        grData.Col = 0
        grData.Text = "«·„Ã„Ê⁄"
        grData.Col = 1
        grData.Text = dPrice
        grData.Col = 3
        grData.Text = dNum
        grData.Col = 4
        grData.Text = dSPrice
        grData.Col = 5
        grData.Text = dpay
        grData.Col = 6
        grData.Text = drest
    txtEnd.Text = drest - dpay
End Sub

Private Sub Option2_Click()
    SelSQL = "select * from tblguest where dname='" & lstSeller.Text & "' order by dmat"
    Set Rs = ADO.execute(SelSQL)
    
End Sub

Private Sub Txt_Click()
    Txt.Text = 0
End Sub
