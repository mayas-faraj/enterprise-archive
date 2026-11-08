VERSION 5.00
Begin VB.Form frmEnter 
   Caption         =   "≈œŒ«· «·»Ì«‰« "
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
   Picture         =   "frmEnter.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdSub 
      BackColor       =   &H00FFC0C0&
      Caption         =   "”œ«œ «·œÌÊ‰"
      Enabled         =   0   'False
      Height          =   495
      Left            =   5400
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   10200
      Width           =   1815
   End
   Begin VB.CommandButton cmdLast 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ”«» ”«»ﬁ"
      Enabled         =   0   'False
      Height          =   495
      Left            =   7440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   10200
      Width           =   1935
   End
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H00FFC0C0&
      Caption         =   "„”Õ"
      Height          =   495
      Left            =   5400
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   9600
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   1080
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   9600
      Width           =   1935
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄Êœ…"
      Height          =   495
      Left            =   3240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   9600
      Width           =   1935
   End
   Begin VB.CommandButton cmdDelete 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ–›"
      Enabled         =   0   'False
      Height          =   495
      Left            =   7440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   9600
      Width           =   1935
   End
   Begin VB.CommandButton cmdEnter 
      BackColor       =   &H00FFC0C0&
      Caption         =   "≈œŒ«·"
      Enabled         =   0   'False
      Height          =   495
      Left            =   9600
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   9600
      Width           =   1935
   End
   Begin VB.TextBox txtDescription 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1080
      MaxLength       =   150
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Tag             =   "1"
      Top             =   6600
      Width           =   2415
   End
   Begin VB.TextBox txtMoney 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   1080
      Locked          =   -1  'True
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   "0"
      Top             =   3000
      Width           =   2415
   End
   Begin VB.TextBox txtRest 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   1080
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Tag             =   "0"
      Top             =   4440
      Width           =   2415
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   1080
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Tag             =   "0"
      Top             =   3720
      Width           =   2415
   End
   Begin VB.TextBox txtAddress 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   1080
      MaxLength       =   150
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Tag             =   "0"
      Top             =   5880
      Width           =   2415
   End
   Begin VB.TextBox txtPhone 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   1080
      MaxLength       =   20
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Tag             =   "0"
      Top             =   5160
      Width           =   2415
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   "1"
      Text            =   "Combo1"
      Top             =   3720
      Width           =   2415
   End
   Begin VB.TextBox txtPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Tag             =   "1"
      Top             =   6600
      Width           =   2415
   End
   Begin VB.TextBox txtSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Tag             =   "1"
      Top             =   5880
      Width           =   2415
   End
   Begin VB.TextBox txtNum 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Tag             =   "1"
      Top             =   5160
      Width           =   2415
   End
   Begin VB.TextBox txtShort 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Tag             =   "1"
      Top             =   4440
      Width           =   2415
   End
   Begin VB.TextBox txtCost 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6600
      MaxLength       =   50
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   "1"
      Top             =   3000
      Width           =   2415
   End
   Begin VB.ListBox lstSeller 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   7470
      Left            =   12000
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   3000
      Width           =   2655
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "frmEnter.frx":1A602
      Left            =   4560
      List            =   "frmEnter.frx":1A633
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   2040
      Width           =   1095
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   2040
      Width           =   735
   End
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   2040
      Width           =   735
   End
   Begin VB.ComboBox cmbCost 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmEnter.frx":1A691
      Left            =   12000
      List            =   "frmEnter.frx":1A69B
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   2520
      Width           =   1575
   End
   Begin VB.Label Label 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·⁄‰Ê«‰"
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   5880
      Width           =   1455
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·Â« ›"
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   5160
      Width           =   1455
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈”„ «·„Œ ’—"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   4440
      Width           =   1455
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·»«ﬁÌ"
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   4440
      Width           =   1455
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„œ›Ê⁄"
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   3720
      Width           =   1455
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„»·€ «·„œ«‰"
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   3000
      Width           =   1455
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "„·«ÕŸ« "
      Height          =   375
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   6600
      Width           =   1455
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·”⁄— «·≈Ã„«·Ì"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   6600
      Width           =   1455
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·”⁄— «·≈›—«œÌ"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   5880
      Width           =   1455
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·⁄œœ"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   5160
      Width           =   1455
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "≈”„ «·„«œ…"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   3720
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "≈”„ «·„‘ —Ì"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   3000
      Width           =   1455
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   2040
      Width           =   1335
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "≈”‰«œ «·Õ”«»"
      Height          =   375
      Left            =   13680
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   2520
      Width           =   1095
   End
End
Attribute VB_Name = "frmEnter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dID(10000) As Integer, Ms As Byte
Private Sub cmbCost_click()
    Dim objCon As Object
    If cmbCost.ListIndex = 0 Then
        For Each objCon In frmEnter
            If objCon.Tag = "0" Then
                objCon.Enabled = False
                objCon.BackColor = &HE0E0E0
            End If
        Next objCon
        lstSeller.Enabled = False
        lstSeller.BackColor = &HE0E0E0
        cmdLast.Enabled = False
        cmdSub.Enabled = False
        cmdDelete.Enabled = False
    Else
        For Each objCon In frmEnter
            If objCon.Tag = "0" Then
                objCon.Enabled = True
                objCon.BackColor = &HC0FFFF
            End If
        Next objCon
        lstSeller.Enabled = True
        lstSeller.BackColor = &HC0FFFF
        txtMoney.Text = "0"
        Rep = 1
        lstSeller.List(0) = "“»Ê‰ ÃœÌœ"
        SelSQL = "select * from tblmoney order by dname"
        Set Rs = ADO.execute(SelSQL)
        Do While Not Rs.EOF
            lstSeller.List(Rep) = Rs("dname")
            Rep = Rep + 1
            Rs.movenext
        Loop
        lstSeller.Selected(0) = True
    End If
End Sub

Private Sub cmdBack_Click()
    frmMain.Show
    frmEnter.Hide
End Sub

Private Sub cmdClear_Click()
    Dim objCon As Object
    If cmbCost.ListIndex = 0 Then
        For Each objCon In frmEnter
            If objCon.Tag = "1" Then objCon.Text = ""
        Next objCon
    Else
        For Each objCon In frmEnter
            If objCon.Tag = "0" Or objCon.Tag = "1" Then objCon.Text = ""
        Next objCon
    End If
End Sub

Private Sub cmdDelete_Click()
    Ms = MsgBox("”Ê›  ﬁÊ„ »Ã–› «·Õ”«» «·„Õœœ ﬂ«„·« , Â·  —Ìœ «·„ «»⁄…", vbYesNo, "Ã–› Õ”«»")
    If Ms = vbYes Then
        SelSQL = "delete from tblmoney where dname='" & lstSeller.Text & "'"
        Set Rs = ADO.execute(SelSQL)
        cmbCost_click
        lstSeller.Selected(0) = True
    End If
End Sub

Private Sub cmdEnter_Click()
    Dim strDate As String, lngNPrice As Long, lngWin As Long, objCon As Object, dLot As Long, dCLot As Long, dName As String
    SelSQL = "select * from tblkind where dname='" & cmbKind.Text & "' or dshort='" & txtShort.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    If Not (Rs.EOF = True And Rs.bof = True) Then
        lngNPrice = Rs("dprice") * txtNum.Text
        dLot = Rs("dlot")
        dCLot = Int(dLot) - Int(txtNum.Text)
        If dCLot <= 0 Then
            MsgBox " „ ‰›«– ﬁÿ⁄ «·„«œ… «·„œŒ·…", vbOKOnly + vbInformation, "≈‰ »«Â"
            dCLot = 0
        End If
        dName = Rs("dname")
        lngWin = txtPrice - lngNPrice
        SelSQL = "update tblkind set dlot=" & dCLot & " where dname='" & dName & "'"
        Set Rs = ADO.execute(SelSQL)
    Else
        Ms = MsgBox("«·„«œ… «·„œŒ·… €Ì— „ÊÃÊœ… Õ«·Ì« ›Ì ﬁ«⁄œ… «·»Ì«‰«  , Â·  —Ìœ ≈œŒ«· «·”⁄— «·„ﬁÿÊ⁄ ·Â«", vbYesNoCancel, "⁄œ„  ÿ«»ﬁ ›Ì «·⁄‰«’—")
        If Ms = vbYes Then
            Dim boxPrice As Long
            boxPrice = InputBox("Ì—ÃÏ ≈œŒ«· «·”⁄— «·„ﬁÿÊ⁄ · ·ﬂ «·„«œ…", "⁄œ„  ÿ«»ﬁ ›Ì «·⁄‰«’—", "0")
            lngWin = txtPrice.Text - Val(boxPrice)
        ElseIf Ms = vbNo Then lngWin = 0
        Else
            Exit Sub
        End If
    End If
    If cmbCost.ListIndex = 0 Then
        SelSQL = "insert into tbldata (dname,dmat,dnum,dsprice,dprice,dwin,ddes,dday,dmonth,dyear) values ('" & txtCost.Text & "','" & cmbKind.Text & "'," & txtNum.Text & "," & txtSPrice.Text & "," & txtPrice.Text & "," & lngWin & ",'" & txtDescription.Text & "'," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
        Set Rs = ADO.execute(SelSQL)
    Else
        If lstSeller.Selected(0) = True Then
            SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,dpay,drest,dwin,ddes,dday,dmonth,dyear) values ('" & txtCost.Text & "','" & cmbKind.Text & "'," & txtNum.Text & "," & txtSPrice.Text & "," & txtPrice.Text & "," & txtPay.Text & "," & txtRest.Text & "," & lngWin & ",'" & txtDescription.Text & "'," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
            Set Rs = ADO.execute(SelSQL)
            SelSQL = "insert into tblmoney (dname,dphone,daddress,dmoney,dfdate) values ('" & txtCost.Text & "','" & txtPhone.Text & "','" & txtAddress.Text & "'," & txtRest.Text & ",'" & cmbYear.Text & " \ " & cmbMonth.Text & " \ " & cmbDay.Text & "')"
            Set Rs = ADO.execute(SelSQL)
        Else
            Dim dMoney As Long
            dMoney = Int(txtRest.Text) + Int(txtMoney.Text)
            SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,dpay,drest,dwin,ddes,dday,dmonth,dyear) values ('" & txtCost.Text & "','" & cmbKind.Text & "'," & txtNum.Text & "," & txtSPrice.Text & "," & txtPrice.Text & "," & txtPay.Text & "," & txtRest.Text & "," & lngWin & ",'" & txtDescription.Text & "'," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
            Set Rs = ADO.execute(SelSQL)
            SelSQL = "update tblmoney set dmoney=" & dMoney & " where dname='" & txtCost.Text & "'"
            Set Rs = ADO.execute(SelSQL)
        End If
    End If
    
    'shyounamic
    For Each objCon In frmEnter
        If objCon.Tag = 0 Or objCon.Tag = 1 Then objCon.Text = ""
    Next
    If cmbCost.ListIndex = 1 Then cmbCost_click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub cmdLast_Click()
    Dim boxNum As Long, boxStr1 As String, boxStr2 As String, boxStr3 As String, varLast As String
    varLast = "Õ”«» „”»ﬁ"
    boxStr1 = InputBox("Ì—ÃÌ ≈œŒ«· ≈”„ «·„‘ —Ì", "«·≈”„", "")
    boxStr2 = InputBox("Ì—ÃÌ ≈œŒ«· —ﬁ„ Â« › «·„‘ —Ì", "«·Â« ›", "")
    boxStr3 = InputBox("Ì—ÃÌ ≈œŒ«· ⁄‰Ê«‰ «·„‘ —Ì", "«·⁄‰Ê«‰", "")
    boxNum = InputBox("Ì—ÃÌ ≈œŒ«· «·„»·€ «·„œ«‰", "«·„»·€ «·„œ«‰", "0")
    SelSQL = "insert into tblmoney (dname,dphone,daddress,dmoney) values ('" & boxStr1 & "','" & boxStr2 & "','" & boxStr3 & "'," & boxNum & ")"
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "insert into tblguest (dname,dmat,drest,dday,dmonth,dyear) values ('" & boxStr1 & "','" & varLast & "'," & boxNum & "," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
    Set Rs = ADO.execute(SelSQL)
    cmbCost_click
End Sub

Private Sub cmdSub_Click()
    Dim boxNum As Long, dMoney As Long
    boxNum = InputBox("Ì—ÃÌ ≈œŒ«· ﬁÌ„… «·„»·€ «·„”œœ „‰ ﬁ»· «·”Ìœ " & lstSeller.Text, "ﬁÌ„… «·„»·€", 0)
    dMoney = Int(txtMoney.Text) - Int(boxNum)
    SelSQL = "insert into tblguest (dname,dmat,dpay,drest,dday,dmonth,dyear) values ('" & txtCost.Text & "','" & "œ›⁄… ⁄·Ï «·Õ”«»" & "'," & boxNum & ",0," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
    Set Rs = ADO.execute(SelSQL)
    SelSQL = "update tblmoney set dmoney=" & dMoney & " where dname='" & lstSeller.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    lstSeller_Click
End Sub

Private Sub Form_Load()
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    cmbCost.Text = "“»Ê‰ ⁄«»—"
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    SelSQL = "select * from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbKind.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
    
End Sub

Private Sub lstSeller_Click()
    If lstSeller.Selected(0) = True Then
        Dim objCon, lngMoney As Long
        For Each objCon In frmEnter
            If objCon.Tag = "0" Then objCon.Text = ""
        Next
        cmdLast.Enabled = True
        cmdSub.Enabled = False
        cmdDelete.Enabled = False
    Else
        SelSQL = "select dname,dmoney,dphone,daddress from tblmoney where dname='" & lstSeller.Text & "'"
        Set Rs = ADO.execute(SelSQL)
        txtCost = Rs("dname")
        txtMoney = Rs("dmoney")
        txtPhone = Rs("dphone")
        txtAddress = Rs("daddress")
        cmdLast.Enabled = False
        cmdSub.Enabled = True
        cmdDelete.Enabled = True
    End If
End Sub

Private Sub txtNum_Change()
    If IsNumeric(txtSPrice.Text) = True And IsNumeric(txtPrice.Text) = True And IsNumeric(txtNum.Text) = True Then cmdEnter.Enabled = True Else cmdEnter.Enabled = False
End Sub

Private Sub txtPay_Click()
    If IsNumeric(txtRest.Text) = True Then txtPay = txtPrice.Text - txtRest.Text
End Sub

Private Sub txtPrice_Change()
    If IsNumeric(txtSPrice.Text) = True And IsNumeric(txtPrice.Text) = True And IsNumeric(txtNum.Text) = True Then cmdEnter.Enabled = True Else cmdEnter.Enabled = False
End Sub

Private Sub txtPrice_Click()
    If IsNumeric(txtSPrice.Text) = True And IsNumeric(txtNum.Text) = True Then txtPrice.Text = txtNum.Text * txtSPrice.Text
End Sub

Private Sub txtRest_Click()
    If IsNumeric(txtPay.Text) = True Then txtRest = txtPrice.Text - txtPay.Text
End Sub

Private Sub txtShort_LostFocus()
    If txtShort = "" Then Exit Sub
    SelSQL = "select * from tblkind where dshort='" & txtShort.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    If Rs.EOF = True And Rs.bof = True Then
        MsgBox "«·≈Œ ’«— «·–Ì  „ ≈œŒ«·Â €Ì— „ÿ«»ﬁ ·√Ì „«œ… ›Ì ﬁ«⁄œ… «·»Ì«‰« ", vbOKOnly + vbCritical, " ‰»ÌÂ"
    Else
        cmbKind.Text = Rs("dname")
    End If
End Sub

Private Sub txtSPrice_Change()
    If IsNumeric(txtSPrice.Text) = True And IsNumeric(txtPrice.Text) = True And IsNumeric(txtNum.Text) = True Then cmdEnter.Enabled = True Else cmdEnter.Enabled = False
End Sub
