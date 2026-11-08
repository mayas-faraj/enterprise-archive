VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
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
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   5520
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   1440
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      ItemData        =   "frmGuest.frx":0000
      Left            =   4680
      List            =   "frmGuest.frx":0002
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1440
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "frmGuest.frx":0004
      Left            =   3600
      List            =   "frmGuest.frx":0035
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1440
      Width           =   975
   End
   Begin VB.TextBox txtEnd 
      Alignment       =   2  'Center
      Height          =   405
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Text            =   "0"
      Top             =   1440
      Width           =   3975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ÿ»«⁄…"
      Height          =   405
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   10080
      Width           =   2415
   End
   Begin VB.ComboBox cmdSeller 
      Height          =   405
      Left            =   11640
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   2040
      Width           =   3135
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   405
      Left            =   1080
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   10080
      Width           =   2415
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   405
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   10080
      Width           =   2415
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Õ–› «·Õ”«»"
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   10080
      Width           =   2415
   End
   Begin VB.CommandButton cmdCash 
      Caption         =   " ”œÌœ œ›⁄…"
      Height          =   405
      Left            =   12120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   10080
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid grData 
      Height          =   7815
      Left            =   480
      TabIndex        =   2
      Top             =   2040
      Width           =   10995
      _ExtentX        =   19394
      _ExtentY        =   13785
      _Version        =   393216
      Cols            =   7
      RightToLeft     =   -1  'True
   End
   Begin VB.ListBox lstSeller 
      Height          =   7185
      Left            =   11640
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   2640
      Width           =   3135
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   1440
      Width           =   615
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Õ”«»«  «·“»«∆‰"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4193
      TabIndex        =   0
      Top             =   600
      Width           =   6855
   End
End
Attribute VB_Name = "frmGuest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dPrice As Long
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
    Ms = MsgBox("”Ê›  ﬁÊ„ »Ã–› «·Õ”«» «·„Õœœ ﬂ«„·« , Â·  —Ìœ «·„ «»⁄…", vbYesNo, "Ã–› Õ”«»")
    If Ms = vbYes Then
        SelSQL = "delete from tblmoney where dname='" & lstSeller.Text & "'"
        Set Rs = ADO.execute(SelSQL)
        Form_Load
        lstSeller.Selected(0) = True
    End If
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
    grData.Text = "≈”„ «·ﬁÿ⁄…"
    grData.Col = 2
    grData.Text = "«·⁄œœ"
    grData.Col = 3
    grData.Text = "«·”⁄— «·≈›—«œÌ"
    grData.Col = 4
    grData.Text = "«·”⁄— «·≈Ã„«·Ì"
    grData.Col = 5
    grData.Text = "«·„œ›Ê⁄"
    grData.Col = 6
    grData.Text = "«·»«ﬁÌ"
    grData.ColWidth(0) = 1500
    grData.ColWidth(1) = 3000
    grData.ColWidth(2) = 1000
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

Private Sub lstSeller_Click()
'establish grid
Dim dNum As Long, dSPrice As Long, dPay As Long, dRest As Long
dPrice = 0
Label1.Caption = "’›Õ… «·”Ìœ " & lstSeller.Text
'fill grid with data
    SelSQL = "select * from tblguest where dname='" & lstSeller.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    Rep = 1
    Do While Not Rs.EOF
        PrintNum = Rep
        grData.Rows = Rep + 1
        grData.Row = Rep
        grData.Col = 0
        grData.Text = Rs("dday") & "/" & Rs("dmonth") & "/" & Rs("dyear")
        grData.Col = 1
        grData.Text = Rs("dmat")
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
        dNum = dNum + Rs("dnum")
        dPrice = dPrice + Rs("dprice")
        dSPrice = dSPrice + Rs("dsprice")
        dRest = dRest + Rs("drest")
        dPay = dPay + Rs("dpay")
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
        grData.Text = dPay
        grData.Col = 6
        grData.Text = dRest
    txtEnd.Text = dRest - dPay
End Sub
