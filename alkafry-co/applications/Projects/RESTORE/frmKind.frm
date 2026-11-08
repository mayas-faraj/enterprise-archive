VERSION 5.00
Begin VB.Form frmKind 
   Caption         =   "«·ﬁÿ⁄ «·„ Ê›—…"
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
   Begin VB.ComboBox txtOrder 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmKind.frx":0000
      Left            =   1920
      List            =   "frmKind.frx":0010
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   720
      Width           =   2655
   End
   Begin VB.ComboBox txtSetGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Text            =   "Combo1"
      Top             =   4560
      Width           =   2655
   End
   Begin VB.ComboBox txtGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   16
      Top             =   720
      Width           =   2655
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "≈œŒ«·"
      Height          =   495
      Left            =   9480
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   9840
      Width           =   2175
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Õ–›"
      Height          =   495
      Left            =   6760
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   9840
      Width           =   2175
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   495
      Left            =   4040
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   9840
      Width           =   2175
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   9840
      Width           =   2175
   End
   Begin VB.ComboBox txtUnit 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmKind.frx":003E
      Left            =   1920
      List            =   "frmKind.frx":004B
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   3240
      Width           =   2775
   End
   Begin VB.TextBox txtNetPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   4560
      Width           =   2655
   End
   Begin VB.TextBox txtLot 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   3240
      Width           =   2655
   End
   Begin VB.TextBox txtShort 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   2040
      Width           =   2655
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   2040
      Width           =   2655
   End
   Begin VB.ListBox lstKind 
      Height          =   9750
      Left            =   12720
      TabIndex        =   0
      Top             =   720
      Width           =   2055
   End
   Begin VB.Label lblOrder 
      Alignment       =   2  'Center
      Caption         =   "«· — Ì»"
      Height          =   375
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   720
      Width           =   1575
   End
   Begin VB.Label lblSetGroub 
      Alignment       =   2  'Center
      Caption         =   "«”„ «·„Ã„Ê⁄…"
      Height          =   375
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   4560
      Width           =   1575
   End
   Begin VB.Label lblGroub 
      Alignment       =   2  'Center
      Caption         =   "«·„Ã„Ê⁄…"
      Height          =   375
      Left            =   10080
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   720
      Width           =   1695
   End
   Begin VB.Label lblNetPrice 
      Alignment       =   2  'Center
      Caption         =   "«·”⁄— «·„ﬁÿÊ⁄"
      Height          =   375
      Left            =   9960
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   4560
      Width           =   1695
   End
   Begin VB.Label lblUnit 
      Alignment       =   2  'Center
      Caption         =   "«·Ê«Õœ…"
      Height          =   375
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   3360
      Width           =   1575
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      Caption         =   "«·ﬂ„Ì… «·„ Ê›—…"
      Height          =   375
      Left            =   9960
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   3240
      Width           =   1695
   End
   Begin VB.Label lblShort 
      Alignment       =   2  'Center
      Caption         =   "«·≈Œ ’«—"
      Height          =   375
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   2040
      Width           =   1575
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Caption         =   "≈”„ «·ﬁÿ⁄…"
      Height          =   375
      Left            =   9960
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   2040
      Width           =   1695
   End
End
Attribute VB_Name = "frmKind"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dID(10000) As Integer, SelGroup As String
Private Sub Reload()
    Rep = 1
    lstKind.Clear
    lstKind.List(0) = "ﬁÿ⁄… ÃœÌœ…"
    Do While Not Rs.EOF
        lstKind.List(Rep) = Rs("dname")
        dID(Rep) = Rs("did")
        Rep = Rep + 1
        Rs.movenext
    Loop
    lstKind.Selected(0) = True
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
            SelSQL = "insert into tblkind (dname,dshort,dlot,dunit,dprice,dgroub) values ('" & txtName.Text & "','" & txtShort.Text & "'," & txtLot.Text & ",'" & txtUnit.Text & "'," & txtNetPrice.Text & ",'" & txtSetGroub.Text & "')"
            Set Rs = ADO.execute(SelSQL)
            txtName.Text = ""
            txtShort.Text = ""
            txtLot.Text = ""
            txtUnit.Text = ""
            txtNetPrice.Text = ""
        Case False
            Set Rs = ADO.execute("update tblkind set dname='" & txtName.Text & "' where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dshort='" & txtShort.Text & "' where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dlot=" & txtLot.Text & " where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dunit='" & txtUnit.Text & "' where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dprice=" & txtNetPrice.Text & " where did=" & dID(lstKind.ListIndex))
            Set Rs = ADO.execute("update tblkind set dgroub='" & txtSetGroub.Text & "' where did=" & dID(lstKind.ListIndex))
        End Select
        SelSQL = "select dgroub from tblkind group by dgroub"
        Set Rs = ADO.execute(SelSQL)
        txtGroub.Clear
        txtSetGroub.Clear
        txtGroub.List(0) = "«·ﬂ·"
        Rep = 1
        Do While Not Rs.EOF
           txtGroub.List(Rep) = Rs("dgroub")
           txtSetGroub.List(Rep - 1) = Rs("dgroub")
           Rep = Rep + 1
           Rs.movenext
        Loop
        txtGroub.Text = "«·ﬂ·"
        txtGroub_Click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub
Private Sub Form_Load()
    Rep = 1
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.Open
    SelSQL = "select dgroub from tblkind group by dgroub"
    Set Rs = ADO.execute(SelSQL)
    txtGroub.List(0) = "«·ﬂ·"
    Do While Not Rs.EOF
        txtGroub.List(Rep) = Rs("dgroub")
        txtSetGroub.List(Rep - 1) = Rs("dgroub")
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
        txtSetGroub.Text = ""
    Else
        cmdEnter.Caption = " €ÌÌ—"
        SelSQL = "select * from tblkind where did=" & dID(lstKind.ListIndex)
        Rs = ADO.execute(SelSQL)
        txtName.Text = Rs("dname")
        txtShort.Text = Rs("dshort")
        txtLot.Text = Rs("dlot")
        txtUnit.Text = Rs("dunit")
        txtNetPrice.Text = Rs("dprice")
        txtSetGroub.Text = Rs("dgroub")
    End If
    
End Sub

Private Sub txtGroub_Click()
    If Not txtGroub.Text = "«·ﬂ·" Then
        SelGroup = "select * from tblkind where dgroub='" & txtGroub.Text & "'"
        Set Rs = ADO.execute(SelGroup)
    Else
        SelGroup = "select * from tblkind"
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
