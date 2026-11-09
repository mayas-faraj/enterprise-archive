VERSION 5.00
Begin VB.Form frmKind 
   Caption         =   "«·ﬁÿ⁄ «·„ Ê›—…"
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
   Picture         =   "frmKind.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtAllPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1200
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Text            =   "0"
      Top             =   7200
      Width           =   2655
   End
   Begin VB.TextBox txtGPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Text            =   "0"
      Top             =   7200
      Width           =   2655
   End
   Begin VB.TextBox txtPriceAll 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1200
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Text            =   "0"
      Top             =   6000
      Width           =   2655
   End
   Begin VB.CommandButton botAdd 
      BackColor       =   &H00FFC0C0&
      Caption         =   "≈‰“«·"
      Height          =   375
      Left            =   8040
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   4680
      Width           =   855
   End
   Begin VB.ComboBox txtOrder 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmKind.frx":1897E
      Left            =   1200
      List            =   "frmKind.frx":1898E
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   2160
      Width           =   2655
   End
   Begin VB.ComboBox txtSetGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Text            =   "Combo1"
      Top             =   8280
      Width           =   2655
   End
   Begin VB.ComboBox txtGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Text            =   "txtGroub"
      Top             =   2160
      Width           =   2655
   End
   Begin VB.CommandButton cmdEnter 
      BackColor       =   &H00FFC0C0&
      Caption         =   "≈œŒ«·"
      Height          =   375
      Left            =   8400
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   10200
      Width           =   2175
   End
   Begin VB.CommandButton cmdDelete 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ–›"
      Height          =   375
      Left            =   5880
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   10200
      Width           =   2175
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   3240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   10200
      Width           =   2175
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   600
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   10200
      Width           =   2175
   End
   Begin VB.ComboBox txtUnit 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmKind.frx":189BC
      Left            =   1200
      List            =   "frmKind.frx":189CF
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   4680
      Width           =   2775
   End
   Begin VB.TextBox txtNetPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Text            =   "0"
      Top             =   6000
      Width           =   2655
   End
   Begin VB.TextBox txtLot 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Text            =   "0"
      Top             =   4680
      Width           =   1695
   End
   Begin VB.TextBox txtShort 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1200
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   3480
      Width           =   2655
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   3480
      Width           =   2655
   End
   Begin VB.ListBox lstKind 
      Height          =   8325
      Left            =   11400
      TabIndex        =   0
      Top             =   2160
      Width           =   3375
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·ﬂ·›… «·ﬂ·Ì…"
      Height          =   375
      Left            =   4200
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   7200
      Width           =   1695
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ﬂ·›… «·„Ã„Ê⁄…"
      Height          =   375
      Left            =   9240
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   7200
      Width           =   1695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "”⁄— «·„»Ì⁄"
      Height          =   375
      Left            =   4200
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   6000
      Width           =   1695
   End
   Begin VB.Label lblOrder 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«· — Ì»"
      Height          =   375
      Left            =   4320
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   2160
      Width           =   1575
   End
   Begin VB.Label lblSetGroub 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«”„ «·„Ã„Ê⁄…"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   8280
      Width           =   1575
   End
   Begin VB.Label lblGroub 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„Ã„Ê⁄…"
      Height          =   375
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   2160
      Width           =   1695
   End
   Begin VB.Label lblNetPrice 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·”⁄— «·„ﬁÿÊ⁄"
      Height          =   375
      Left            =   9240
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   6000
      Width           =   1695
   End
   Begin VB.Label lblUnit 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·Ê«Õœ…"
      Height          =   375
      Left            =   4320
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   4800
      Width           =   1575
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·ﬂ„Ì… «·„ Ê›—…"
      Height          =   375
      Left            =   9240
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   4680
      Width           =   1695
   End
   Begin VB.Label lblShort 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈Œ ’«—"
      Height          =   375
      Left            =   4320
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   3480
      Width           =   1575
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "≈”„ «·ﬁÿ⁄…"
      Height          =   375
      Left            =   9240
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   3480
      Width           =   1695
   End
End
Attribute VB_Name = "frmKind"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dID(10000) As Integer, SelGroup As String, lngAllPrice As Long, lngGPrice As Long
Private Sub Reload()

    Dim SetPrice As Long
    On Error Resume Next
    Rep = 1
    lstKind.Clear
    txtAllPrice = 0
    txtGPrice = 0
    lstKind.List(0) = "- ﬁÿ⁄… ÃœÌœ… -"
    Do While Not Rs.EOF
        SetPrice = Rs("dprice") * Rs("dlot")
        lstKind.List(Rep) = Rs("dname")
        dID(Rep) = Rs("did")
        txtGPrice = txtGPrice + SetPrice
        Rep = Rep + 1
        Rs.movenext
    Loop
    Set Rs = ADO.execute("select dprice,dlot from tblkind")
    Do While Not Rs.EOF
    SetPrice = Rs("dprice") * Rs("dlot")
    txtAllPrice = txtAllPrice + SetPrice
    Rs.movenext
    Loop
    lstKind.Selected(0) = True

End Sub

Private Sub botAdd_Click()
    Dim boxIn As Integer
    On Error Resume Next
    boxIn = InputBox("Ì—ÃÏ ≈œŒ«· «·⁄œœ «·≈Ã„«·Ì ··ﬁÿ⁄ «·„—«œ ≈‰“«·Â«", " ‰“Ì· œ›⁄…", 0)
    txtLot.Text = Val(txtLot.Text) + Val(boxIn)
    
End Sub

Private Sub cmdBack_Click()
    frmMain.Show
    frmKind.Hide
End Sub

Private Sub cmdDelete_Click()
    Dim Ms As Byte
    Ms = MsgBox("”Ê›  ﬁÊ„ »Ã–› «·ﬁÿ⁄… «·„Õœœ… , Â·  —Ìœ «·„ «»⁄…", vbYesNo, "«·ﬁÿ⁄ «·„ Ê›—…")
    If Ms = vbYes Then
        SelSQL = "delete from tblkind where did=" & dID(lstKind.ListIndex)
        Set Rs = ADO.execute(SelSQL)
        SelSQL = "select * from tblkind"
        Set Rs = ADO.execute(SelSQL)
        Reload
    End If
End Sub

Private Sub cmdEnter_Click()
    Select Case lstKind.Selected(0)
        Case True
            SelSQL = "insert into tblkind (dname,dshort,dlot,dunit,dprice,dpriceall,dgroub) values ('" & txtName.Text & "','" & txtShort.Text & "'," & txtLot.Text & ",'" & txtUnit.Text & "'," & txtNetPrice.Text & "," & txtPriceAll.Text & ",'" & txtSetGroub.Text & "')"
            Set Rs = ADO.execute(SelSQL)
            txtName.Text = ""
            txtShort.Text = ""
            txtLot.Text = ""
            txtUnit.Text = ""
            txtNetPrice.Text = ""
            txtPriceAll.Text = ""
        Case False
            Set Rs = ADO.execute("update tblkind set dname='" & txtName.Text & "' where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dshort='" & txtShort.Text & "' where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dlot=" & txtLot.Text & " where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dunit='" & txtUnit.Text & "' where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dprice=" & txtNetPrice.Text & " where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dpriceall=" & txtPriceAll.Text & " where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dgroub='" & txtSetGroub.Text & "' where did=" & dID(lstKind.ListIndex))
        
        End Select
        SelSQL = "select dgroub from tblkind group by dgroub"
        Set Rs = ADO.execute(SelSQL)
        txtGroub.Clear
        txtSetGroub.Clear
        txtGroub.List(0) = "«·ﬂ·"
        txtGroub.List(1) = "«·ﬁÿ⁄ «·‰«›–…"
        Rep = 2
        Do While Not Rs.EOF
           txtGroub.List(Rep) = Rs("dgroub")
           txtSetGroub.List(Rep - 2) = Rs("dgroub")
           Rep = Rep + 1
           Rs.movenext
        Loop
        txtGroub.Text = "«·ﬂ·"
        txtGroub_Click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub Form_Activate()
    Form_Load
End Sub

Private Sub Form_Load()
    
    DoEvents
    Rep = 2
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    SelSQL = "select dgroub from tblkind group by dgroub"
    Set Rs = ADO.execute(SelSQL)
    txtGroub.List(0) = "«·ﬂ·"
    txtGroub.List(1) = "«·ﬁÿ⁄ «·‰«›–…"
    txtAllPrice = 0
    txtGPrice = 0
    Do While Not Rs.EOF
        txtGroub.List(Rep) = Rs("dgroub")
        txtSetGroub.List(Rep - 2) = Rs("dgroub")
        Rep = Rep + 1
        Rs.movenext
    Loop
    txtGroub.Text = "«·ﬂ·"
    SelSQL = "select * from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Reload
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ExitPro
End Sub

Private Sub lstKind_Click()
    If lstKind.Selected(0) = True Then
        cmdEnter.Caption = "≈œŒ«·"
        txtName.Text = ""
        txtShort.Text = ""
        txtLot.Text = ""
        txtUnit.Text = ""
        txtNetPrice.Text = ""
        txtPriceAll.Text = ""
        txtSetGroub.Text = ""
    Else
        On Error Resume Next
        cmdEnter.Caption = " €ÌÌ—"
        SelSQL = "select * from tblkind where did=" & dID(lstKind.ListIndex)
        Rs = ADO.execute(SelSQL)
        txtName.Text = Rs("dname")
        txtShort.Text = Rs("dshort")
        txtLot.Text = Rs("dlot")
        txtUnit.Text = Rs("dunit")
        txtNetPrice.Text = Rs("dprice")
        txtPriceAll.Text = Rs("dpriceall")
        txtSetGroub.Text = Rs("dgroub")
    End If
    
End Sub

Private Sub txtGroub_Click()
    If txtGroub.Text = "«·ﬂ·" Then
        SelGroup = "select * from tblkind"
        Set Rs = ADO.execute(SelGroup)
    ElseIf txtGroub.Text = "«·ﬁÿ⁄ «·‰«›–…" Then
        SelGroup = "select * from tblkind where dlot=0"
        Set Rs = ADO.execute(SelGroup)
    Else
        SelGroup = "select * from tblkind where dgroub='" & txtGroub.Text & "'"
        Set Rs = ADO.execute(SelGroup)
    End If
    Reload
End Sub

Private Sub txtOrder_Click()
    Dim SelSqlA As String
    Select Case txtOrder.ListIndex
    Case 0
        SelSqlA = SelGroup
    Case 1
        SelSqlA = SelGroup & " order by dname"
    Case 2
        SelSqlA = SelGroup & " order by dlot"
    Case 3
        SelSqlA = SelGroup & " order by dprice"
    End Select
    Set Rs = ADO.execute(SelSqlA)
    Reload
End Sub
