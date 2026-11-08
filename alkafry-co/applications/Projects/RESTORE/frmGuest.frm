VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmGuest 
   Caption         =   "Õ”«»«  «·“»«∆‰"
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
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   600
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   8640
      Width           =   2415
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   495
      Left            =   3760
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   8640
      Width           =   2415
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Õ–› «·Õ”«»"
      Height          =   495
      Left            =   6920
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   8640
      Width           =   2415
   End
   Begin VB.CommandButton cmdCash 
      Caption         =   " ”œÌœ œ›⁄…"
      Height          =   495
      Left            =   10080
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   8640
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid grData 
      Height          =   6735
      Left            =   660
      TabIndex        =   2
      Top             =   1680
      Width           =   11805
      _ExtentX        =   20823
      _ExtentY        =   11880
      _Version        =   393216
      Cols            =   7
      RightToLeft     =   -1  'True
   End
   Begin VB.ListBox lstSeller 
      Height          =   7470
      Left            =   12900
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1680
      Width           =   1695
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

Private Sub Form_Load()
'making table
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
    grData.ColWidth(0) = 1700
    grData.ColWidth(1) = 3000
    grData.ColWidth(2) = 1000
    grData.ColWidth(3) = 1500
    grData.ColWidth(4) = 1500
    grData.ColWidth(5) = 1500
    grData.ColWidth(6) = 1500
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
    Set Rs = ADO.execute("select * from tblmoney")
    Rep = 0
    Do While Not Rs.EOF
        lstSeller.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
End Sub

Private Sub lstSeller_Click()
'establish grid
Dim dNum As Long, dSPrice As Long, dPay As Long, dRest As Long
dPrice = 0
'fill grid with data
    SelSQL = "select * from tblguest where dname='" & lstSeller.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    Rep = 1
    Do While Not Rs.EOF
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
        dPay = dPay + Rs("dpay")
        dRest = dRest + Rs("drest")
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
End Sub
