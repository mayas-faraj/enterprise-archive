VERSION 5.00
Begin VB.Form FrmMath 
   BackColor       =   &H00FFC0C0&
   BorderStyle     =   0  'None
   Caption         =   "Õ”«» «·—’Ìœ"
   ClientHeight    =   11520
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15360
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
   Picture         =   "FrmMath.frx":0000
   ScaleHeight     =   11520
   ScaleWidth      =   15360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.ComboBox CmbYear 
      BackColor       =   &H0025BABA&
      Height          =   405
      ItemData        =   "FrmMath.frx":E46E
      Left            =   6030
      List            =   "FrmMath.frx":E490
      TabIndex        =   9
      Text            =   "«·ﬂ·"
      Top             =   2490
      Width           =   2640
   End
   Begin VB.TextBox TxtLosMon 
      BackColor       =   &H0099F4F4&
      Height          =   405
      Left            =   5085
      TabIndex        =   8
      Top             =   8340
      Width           =   2655
   End
   Begin VB.TextBox TxtWinMon 
      BackColor       =   &H0099F4F4&
      Height          =   405
      Left            =   5085
      TabIndex        =   7
      Top             =   7575
      Width           =   2655
   End
   Begin VB.TextBox TxtTotIm 
      BackColor       =   &H0099F4F4&
      Height          =   405
      Left            =   5085
      TabIndex        =   6
      Top             =   6810
      Width           =   2655
   End
   Begin VB.TextBox TxtTotEx 
      BackColor       =   &H0099F4F4&
      Height          =   405
      Left            =   5085
      TabIndex        =   5
      Top             =   6030
      Width           =   2655
   End
   Begin VB.TextBox txtMoney 
      BackColor       =   &H0025BABA&
      Height          =   405
      Left            =   6000
      TabIndex        =   0
      Top             =   3090
      Width           =   2655
   End
   Begin VB.Image CmdBack 
      Height          =   465
      Left            =   8655
      Top             =   10245
      Width           =   1935
   End
   Begin VB.Image CmdExit 
      Height          =   450
      Left            =   4710
      Top             =   10275
      Width           =   1920
   End
   Begin VB.Image CmdChange 
      Height          =   465
      Left            =   3450
      Top             =   3105
      Width           =   1965
   End
   Begin VB.Image CmdMath 
      Height          =   480
      Left            =   3450
      Top             =   2445
      Width           =   1980
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "ﬂ„Ì… «·Œ”«∆—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8415
      TabIndex        =   4
      Top             =   8355
      Width           =   1335
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "ﬂ„Ì… «·√—»«Õ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8415
      TabIndex        =   3
      Top             =   7635
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "«·Ê«—œ «·ﬂ·Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8415
      TabIndex        =   2
      Top             =   6795
      Width           =   1335
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "«·’«œ— «·ﬂ·Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8400
      TabIndex        =   1
      Top             =   6075
      Width           =   1335
   End
End
Attribute VB_Name = "FrmMath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdBack_Click()
    FrmMath.Hide
    FrmMain.Show
End Sub

Private Sub CmdChange_Click()
SaveSetting "Database", "values", "money", txtMoney.Text
End Sub

Private Sub CmdExit_Click()
    ExitPro
End Sub

Private Sub cmdMath_Click()
Form_Load
End Sub

Private Sub Form_Load()
    Dim IntImport As Long, IntExport As Long, Beet As Long, Appl As String
    txtMoney.Text = GetSetting("Database", "values", "money", "1000000")
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\"
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "file.mdb"
    ADO.Open
    If CmbYear.Text = "«·ﬂ·" Then
        selSQL = "select * from tblexport"
    Else
        selSQL = "select * from tblexport where dyear='" & CmbYear.Text & "'"
    End If
    Set RS = ADO.Execute(selSQL)
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Do While Not RS.EOF
        IntExport = IntExport + RS("dexport")
        RS.MoveNext
    Loop
    
    If CmbYear.Text = "«·ﬂ·" Then
        selSQL = "select * from tblimport"
    Else
        selSQL = "select * from tblimport where dyear='" & CmbYear.Text & "'"
    End If
    Set RS = ADO.Execute(selSQL)
    
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Do While Not RS.EOF
        IntImport = IntImport + RS("dimport")
        RS.MoveNext
    Loop
    
    Beet = IntImport - IntExport
    If Beet > 0 Then
        TxtWinMon.Text = Beet
        TxtLosMon.Text = "X"
    Else
        TxtWinMon.Text = "X"
        TxtLosMon.Text = 0 - Beet
    End If
    
    TxtTotIm.Text = IntImport
    TxtTotEx.Text = IntExport
    
    
End Sub
