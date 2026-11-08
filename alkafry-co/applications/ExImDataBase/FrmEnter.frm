VERSION 5.00
Begin VB.Form FrmEnter 
   BackColor       =   &H00FFFFC0&
   BorderStyle     =   0  'None
   Caption         =   "≈œŒ«· «·»Ì«‰« "
   ClientHeight    =   11520
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15360
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FrmEnter.frx":0000
   ScaleHeight     =   11520
   ScaleWidth      =   15360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.ComboBox CmbMoveYear 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "FrmEnter.frx":10735
      Left            =   2625
      List            =   "FrmEnter.frx":10745
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Text            =   "2006"
      Top             =   10350
      Width           =   1095
   End
   Begin VB.ComboBox CmbMoveMonth 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "FrmEnter.frx":10761
      Left            =   3960
      List            =   "FrmEnter.frx":10763
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Text            =   "1"
      Top             =   10365
      Width           =   735
   End
   Begin VB.ComboBox CmbYear 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "FrmEnter.frx":10765
      Left            =   5730
      List            =   "FrmEnter.frx":10784
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Text            =   "2006"
      Top             =   3090
      Width           =   1095
   End
   Begin VB.TextBox txtExport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2460
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Text            =   "0"
      Top             =   8025
      Width           =   2895
   End
   Begin VB.ComboBox txtOrderSt 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "FrmEnter.frx":107BE
      Left            =   8625
      List            =   "FrmEnter.frx":107E6
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Text            =   "œ„‘ﬁ"
      Top             =   6225
      Width           =   1095
   End
   Begin VB.ComboBox txtPay 
      BackColor       =   &H0025BABA&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "FrmEnter.frx":10841
      Left            =   2460
      List            =   "FrmEnter.frx":1085A
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Text            =   "›Ê« Ì— «·œ·Ì·"
      Top             =   6225
      Width           =   2895
   End
   Begin VB.ComboBox CmbMonth 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "FrmEnter.frx":108BC
      Left            =   6930
      List            =   "FrmEnter.frx":108BE
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Text            =   "1"
      Top             =   3090
      Width           =   735
   End
   Begin VB.ComboBox CmbDay 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "FrmEnter.frx":108C0
      Left            =   7770
      List            =   "FrmEnter.frx":108C2
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Text            =   "1"
      Top             =   3090
      Width           =   615
   End
   Begin VB.ComboBox cmbMath 
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      ItemData        =   "FrmEnter.frx":108C4
      Left            =   5715
      List            =   "FrmEnter.frx":108CE
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Text            =   "Ê«—œ"
      Top             =   2385
      Width           =   2655
   End
   Begin VB.TextBox TxtImOther 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   8625
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Text            =   "***"
      Top             =   6825
      Width           =   3015
   End
   Begin VB.ComboBox txtOrder 
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   405
      ItemData        =   "FrmEnter.frx":108DE
      Left            =   10425
      List            =   "FrmEnter.frx":108F7
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Text            =   "‘ﬁ…"
      Top             =   6225
      Width           =   1215
   End
   Begin VB.TextBox txtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   405
      Left            =   8700
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Text            =   "0"
      Top             =   8025
      Width           =   2895
   End
   Begin VB.TextBox txtExOther 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   405
      Left            =   2415
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Text            =   "***"
      Top             =   6825
      Width           =   2895
   End
   Begin VB.TextBox txtRegNum 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   405
      Left            =   2415
      MaxLength       =   30
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Text            =   "000000"
      Top             =   7425
      Width           =   2895
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0025BABA&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   405
      Left            =   8700
      MaxLength       =   30
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   7425
      Width           =   2895
   End
   Begin VB.Image CmdExit 
      Height          =   435
      Left            =   8715
      Top             =   10350
      Width           =   1935
   End
   Begin VB.Image CmdBack 
      Height          =   510
      Left            =   11325
      Top             =   10305
      Width           =   1965
   End
   Begin VB.Image CmdShow 
      Height          =   405
      Left            =   4980
      Top             =   10365
      Width           =   1980
   End
   Begin VB.Image CmdEnterEx 
      Height          =   450
      Left            =   3045
      Top             =   8970
      Width           =   2055
   End
   Begin VB.Image CmdEnterIm 
      Height          =   435
      Left            =   9900
      Top             =   8985
      Width           =   1995
   End
   Begin VB.Image CmdDefDate 
      Height          =   945
      Left            =   4200
      Top             =   2490
      Width           =   810
   End
   Begin VB.Label lblexcap 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "«·’«œ—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   495
      Left            =   5475
      TabIndex        =   22
      Top             =   5190
      Width           =   1515
   End
   Begin VB.Label lblimcap 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "«·Ê«—œ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8445
      TabIndex        =   21
      Top             =   5175
      Width           =   1290
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁÌ„… «·’«œ—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5355
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   8070
      Width           =   1530
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "›Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   9945
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   6255
      Width           =   375
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "‰Ê⁄ «·’«œ—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5355
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   6270
      Width           =   1530
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "€Ì— –·ﬂ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   11655
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   6885
      Width           =   1530
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "—ﬁ„ «·≈‘⁄«—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5355
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   7470
      Width           =   1530
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁÌ„… «·Ê«—œ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   11655
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   8085
      Width           =   1530
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "€Ì— –·ﬂ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5355
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   6870
      Width           =   1530
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "„Â„…  ’ÊÌ—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   11655
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   6285
      Width           =   1530
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈”„"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   11655
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   7485
      Width           =   1530
   End
End
Attribute VB_Name = "FrmEnter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ADO, RS, selectSQL

Private Sub cmbMath_Click()
    If cmbMath.Text = "Ê«—œ" Then
        txtOrder.Enabled = True
        txtName.Enabled = True
        txtImport.Enabled = True
        txtOrderSt.Enabled = True
        txtExport.Enabled = False
        txtPay.Enabled = False
        txtExOther.Enabled = False
        txtRegNum.Enabled = False
        txtOrder.Text = txtOrder.List(0)
        txtOrderSt.Text = txtOrderSt.List(0)
        lblimcap.ForeColor = black
        lblexcap.ForeColor = &H808080
        CmdEnterIm.Enabled = True
        CmdEnterEx.Enabled = False
    Else
        txtOrder.Enabled = False
        txtName.Enabled = False
        txtImport.Enabled = False
        txtOrderSt.Enabled = False
        TxtImOther.Enabled = False
        txtExport.Enabled = True
        txtPay.Enabled = True
        txtRegNum.Enabled = True
        txtPay.Text = txtPay.List(0)
        lblimcap.ForeColor = &H808080
        lblexcap.ForeColor = black
        CmdEnterIm.Enabled = False
        CmdEnterEx.Enabled = True

    End If
End Sub

Private Sub CmdBack_Click()
    FrmMain.Show
    FrmEnter.Hide
End Sub

Private Sub CmdDefDate_Click()
    SaveSetting "Database", "Values", "defday", CmbDay.Text
    SaveSetting "Database", "Values", "defmonth", CmbMonth.Text
    SaveSetting "Database", "Values", "defyear", CmbYear.Text
End Sub

Private Sub CmdEnterEx_Click()
    dDate = CmbDay.Text
    If txtExOther.Enabled = False Then dExportDes = txtPay.Text Else dExportDes = txtExOther.Text
    If txtRegNum.Enabled = True Then dRegNum = txtRegNum.Text Else dRegNum = ""
    selectSQL = "insert into tblexport (ddate,dmonth,dyear,dexport,dexportdes,dregnum) values ('" & dDate & "','" & CmbMonth.Text & "','" & CmbYear.Text & "','" & txtExport.Text & "','" & dExportDes & "','" & dRegNum & "')"
    ADO.Execute (selectSQL)
    txtExport.Text = ""
    txtExOther.Text = ""
    txtRegNum.Text = ""
    txtPay.Text = txtPay.List(0)
End Sub

Private Sub CmdEnterIm_Click()
    dDate = CmbDay.Text
    If txtOrderSt.Enabled = True Then
        dimportDes = txtOrder.Text & " ›Ì " & txtOrderSt.Text
        dName = txtName.Text
    Else
        dimportDes = TxtImOther.Text
        dName = ""
    End If
    selectSQL = "insert into tblimport (ddate,dmonth,dyear,dname,dimport,dimportdes) values ('" & dDate & "','" & CmbMonth.Text & "','" & CmbYear.Text & "','" & dName & "','" & txtImport.Text & "','" & dimportDes & "')"
    ADO.Execute (selectSQL)
    txtImport.Text = ""
    TxtImOther.Text = ""
    txtName.Text = ""
    txtOrder.Text = txtOrder.List(0)
    txtOrderSt.Text = txtOrderSt.List(0)
    txtOrderSt.Enabled = True
End Sub

Private Sub CmdExit_Click()
    ExitPro
End Sub

Private Sub CmdShow_Click()
    MonthNum = CmbMoveMonth.Text
    YearNum = CmbMoveYear.Text
    FrmEnter.Hide
    FrmShow.Show
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
    Dim Appl
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\"
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "file.mdb"
    ADO.Open
    For Rep = 0 To 8
        CmbDay.List(Rep) = "0" & (Rep + 1)
    Next Rep
    For Rep = 9 To 30
        CmbDay.List(Rep) = Rep + 1
    Next Rep
    For Rep = 0 To 8
        CmbMonth.List(Rep) = "0" & (Rep + 1)
        CmbMoveMonth.List(Rep) = "0" & (Rep + 1)
    Next Rep
    For Rep = 9 To 11
        CmbMonth.List(Rep) = (Rep + 1)
        CmbMoveMonth.List(Rep) = (Rep + 1)
    Next Rep
    
    CmbMoveMonth.Text = "01"
    CmbDay.Text = GetSetting("Database", "Values", "defday", "01")
    CmbMonth.Text = GetSetting("Database", "Values", "defmonth", "01")
    CmbYear.Text = GetSetting("Database", "Values", "defyear", "2006")

End Sub

Private Sub txtOrder_Click()
    If txtOrder.Text = "€Ì— –·ﬂ" Then
        TxtImOther.Enabled = True
        txtOrderSt.Enabled = False
    Else
        TxtImOther.Enabled = False
        txtOrderSt.Enabled = True
    End If
End Sub

Private Sub txtPay_Click()
    If txtPay.Text = "€Ì— –·ﬂ" Then txtExOther.Enabled = True Else txtExOther.Enabled = False
    If Left(txtPay.Text, 6) = "›Ê« Ì—" Then txtRegNum.Enabled = True Else txtRegNum.Enabled = False
    
End Sub
