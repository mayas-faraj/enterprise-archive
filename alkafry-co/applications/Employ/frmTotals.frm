VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmTotals 
   Caption         =   "Form1"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   11.25
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   Picture         =   "frmTotals.frx":0000
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   Begin MSFlexGridLib.MSFlexGrid tb 
      Height          =   3735
      Left            =   3840
      TabIndex        =   2
      Top             =   3480
      Width           =   7575
      _ExtentX        =   13361
      _ExtentY        =   6588
      _Version        =   393216
      Rows            =   4
      Cols            =   3
      FixedCols       =   0
      BackColor       =   15335148
      ForeColor       =   128
      BackColorSel    =   16761024
      ForeColorSel    =   16711680
      BackColorBkg    =   14737632
      GridColor       =   4210752
      RightToLeft     =   -1  'True
      TextStyle       =   1
      TextStyleFixed  =   1
      GridLines       =   2
      ScrollBars      =   2
      FormatString    =   ""
   End
   Begin VB.TextBox txtResualt 
      Alignment       =   2  'Center
      BackColor       =   &H00E9FEEC&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   585
      Left            =   5640
      TabIndex        =   1
      Text            =   "0"
      Top             =   7800
      Width           =   5055
   End
   Begin VB.ComboBox txtYear 
      BackColor       =   &H00E9FEEC&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00004000&
      Height          =   450
      ItemData        =   "frmTotals.frx":13A25
      Left            =   6600
      List            =   "frmTotals.frx":13A4D
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Text            =   "«·ﬂ·"
      Top             =   2280
      Width           =   1455
   End
   Begin VB.Image Image2 
      Height          =   495
      Left            =   5880
      MouseIcon       =   "frmTotals.frx":13A99
      MousePointer    =   99  'Custom
      Top             =   9840
      Width           =   2055
   End
   Begin VB.Image Image1 
      Height          =   495
      Left            =   8520
      MouseIcon       =   "frmTotals.frx":13EDB
      MousePointer    =   99  'Custom
      Top             =   9840
      Width           =   2175
   End
   Begin VB.Image Command1 
      Height          =   2055
      Left            =   12120
      MouseIcon       =   "frmTotals.frx":1431D
      MousePointer    =   99  'Custom
      Top             =   3600
      Width           =   2175
   End
End
Attribute VB_Name = "frmTotals"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Beep
    FindTarget
    tb.Clear
    tb.Row = 0
    tb.Col = 0
    tb.Text = "«· «—ÌŒ"
    tb.Col = 1
    tb.Text = "√”„«¡ «·„ÊŸ›Ì‰"
    tb.Col = 2
    tb.Text = "„Ã„Ê⁄ «·„— »« "
    txtResualt.Text = 0
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    For Rep = 1 To 12
        If txtYear.Text = "«·ﬂ·" Then
            selSQL = "select * from tblsave where dmonth=" & Rep
        Else
            selSQL = "select * from tblsave where dyear=" & txtYear.Text & " and dmonth=" & Rep
        End If
        Set RS = ADO.Execute(selSQL)
        tb.Rows = Rep + 1
        tb.Row = Rep
        Do While Not RS.EOF
            '''''
            tb.Col = 0
            tb.Text = RS("dmonth") & " \ " & RS("dyear")
            '''''
            tb.Col = 1
            If tb.Text <> "" Then
                tb.Text = tb.Text & " , " & RS("dname")
            Else
                tb.Text = RS("dname")
            End If
            '''''
            tb.Col = 2
            If tb.Text <> "" Then
                tb.Text = CInt(tb.Text) + RS("dpay")
            Else
                tb.Text = RS("dpay")
            End If
            
            txtResualt.Text = txtResualt.Text + RS("dpay")
            RS.MoveNext
        Loop
    Next Rep
End Sub

Private Sub Form_Load()
    frmTotals.Width = Screen.Width
    frmTotals.Height = Screen.Height
    tb.Cols = 3
    tb.Rows = 1
    tb.ColAlignment(0) = 3
    tb.ColAlignment(1) = 3
    tb.ColAlignment(2) = 3
    tb.Row = 0
    tb.Col = 0
    tb.Text = "«· «—ÌŒ"
    tb.Col = 1
    tb.Text = "√”„«¡ «·„ÊŸ›Ì‰"
    tb.Col = 2
    tb.Text = "„Ã„Ê⁄ «·„— »« "
    tb.ColWidth(0) = 1500
    tb.ColWidth(1) = 4000
    tb.ColWidth(2) = 2000
End Sub

Private Sub Image1_Click()
    frmTotals.Hide
    frmLogIn.Show
End Sub

Private Sub Image2_Click()
    ExitProg
End Sub

Private Sub MSFlexGrid1_Click()

End Sub

