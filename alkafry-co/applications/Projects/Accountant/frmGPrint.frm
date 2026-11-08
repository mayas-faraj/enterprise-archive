VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmGPrint 
   BackColor       =   &H00FFFFFF&
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
   Begin VB.TextBox txtPure 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   8400
      Width           =   3015
   End
   Begin VB.TextBox txtName 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   1440
      Width           =   3015
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "ÿ»«⁄…"
      Height          =   1005
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   2760
      Width           =   2415
   End
   Begin VB.TextBox txtNum 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   1080
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1440
      Width           =   2175
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   975
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   3960
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid Grid 
      Height          =   5655
      Left            =   480
      TabIndex        =   3
      Top             =   2520
      Width           =   10500
      _ExtentX        =   18521
      _ExtentY        =   9975
      _Version        =   393216
      Rows            =   1
      Cols            =   5
      FixedRows       =   0
      FixedCols       =   0
      ForeColor       =   0
      BackColorFixed  =   -2147483628
      ForeColorFixed  =   0
      BackColorSel    =   16777215
      BackColorBkg    =   16777215
      GridColor       =   0
      RightToLeft     =   -1  'True
      TextStyleFixed  =   1
      GridLines       =   2
      Appearance      =   0
      FormatString    =   ""
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Traditional Arabic"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblPure 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4920
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   8400
      Width           =   4455
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·„»·€ «·’«›Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   8400
      Width           =   1575
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000009&
      Caption         =   "ﬂÂ—»«¡ „‰“·Ì…"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   840
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000009&
      Caption         =   "œÂ«‰« "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8640
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "·Ê«“„ œÂ«‰Ì‰ -  Œ—œÊ«  - ’ÕÌ… - „Ê«œ »‰«¡ - ”Ì—«„Ìﬂ - »Ì«÷«  - ÿÌ‰… Ì«»«‰Ì… ( „Ê—«· )"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   960
      Width           =   9855
   End
   Begin VB.Label fraRes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·⁄‰Ê«‰ : ”»Ì‰… - „Êﬁ› «·„ŒÌ„ - ‘„«· «·‰Â—  - Â« › : 8213277 - 985798 098"
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
      Left            =   2520
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Tag             =   "0"
      Top             =   9120
      Width           =   8415
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "‘‹‹‹‹‹‹‹‹—ﬂ‹‹‹… «·‹‹ ‹Ê›Ì‹‹‹‹‹‹ﬁ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   21.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   240
      Width           =   4095
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   10920
      X2              =   360
      Y1              =   2280
      Y2              =   2280
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "›« Ê—… «·”Ìœ :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9240
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   1440
      Width           =   1575
   End
   Begin VB.Label cmbName 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4800
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1440
      Width           =   4455
   End
   Begin VB.Label lblNum 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
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
      Left            =   720
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   1560
      Width           =   2175
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
      Caption         =   "›« Ê—… —ﬁ„"
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
      Left            =   3240
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1560
      Width           =   975
   End
End
Attribute VB_Name = "frmGPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    frmGPrint.Hide
    frmGuest.Show
End Sub

Private Sub cmdPrint_Click()
    cmdPrint.Visible = False
    cmdBack.Visible = False
    cmbName.Caption = txtName.Text
    lblNum.Caption = txtNum.Text
    lblPure.Caption = txtPure.Text
    txtName.Visible = False
    txtNum.Visible = False
    Grid.Height = ((PrintNum + 2) * Grid.CellHeight) + 400
    fraRes.Top = 900 + Grid.Top + Grid.Height
    Label6.Top = 200 + Grid.Top + Grid.Height
    lblPure.Top = 200 + Grid.Top + Grid.Height
    blnPrint = True
    SaveSetting "interdiv", "internet", "i394", idNum + 1
    Printer.PrintQuality = vbPRPQHigh
    frmGPrint.PrintForm
    cmdPrint.Visible = True
    cmdBack.Visible = True
    txtName.Visible = True
    txtNum.Visible = True
    cmbName.Caption = ""
    lblNum.Caption = ""
    cmdBack_Click
End Sub

Private Sub Form_Activate()
    Form_Load
End Sub

Private Sub Form_Load()
'put control default value

    idNum = GetSetting("interdiv", "internet", "i394", 0)
    txtNum = idNum
    Grid.Cols = 7
    Grid.Rows = 1
    Grid.ColWidth(0) = 1500
    Grid.ColWidth(1) = 2500
    Grid.ColWidth(2) = 1000
    Grid.ColWidth(3) = 1500
    Grid.ColWidth(4) = 1700
    Grid.ColWidth(5) = 1000
    Grid.ColWidth(6) = 1000
    
    Grid.ColAlignment(0) = 3
    Grid.ColAlignment(1) = 3
    Grid.ColAlignment(2) = 3
    Grid.ColAlignment(3) = 3
    Grid.ColAlignment(4) = 3
    Grid.ColAlignment(5) = 3
    Grid.ColAlignment(6) = 3
    
    Grid.TextMatrix(0, 0) = "«· «—ÌŒ"
    Grid.TextMatrix(0, 1) = "«·‹‹»Ì‹«‰"
    Grid.TextMatrix(0, 2) = "«·⁄œœ"
    Grid.TextMatrix(0, 3) = "«·”⁄— «·≈›—«œÌ"
    Grid.TextMatrix(0, 4) = "«·”⁄— «·≈Ã„«·Ì"
    Grid.TextMatrix(0, 5) = "«·„œ›Ê⁄"
    Grid.TextMatrix(0, 6) = "«·»«ﬁÌ"
    
    
    For Rep = 0 To PrintNum
        Grid.Rows = Grid.Rows + 1
        Grid.TextMatrix(Rep + 1, 0) = frmGuest.grData.TextMatrix(Rep + 1, 0)
        Grid.TextMatrix(Rep + 1, 1) = frmGuest.grData.TextMatrix(Rep + 1, 1)
        Grid.TextMatrix(Rep + 1, 2) = frmGuest.grData.TextMatrix(Rep + 1, 2)
        Grid.TextMatrix(Rep + 1, 3) = frmGuest.grData.TextMatrix(Rep + 1, 3)
        Grid.TextMatrix(Rep + 1, 4) = frmGuest.grData.TextMatrix(Rep + 1, 4)
        Grid.TextMatrix(Rep + 1, 5) = frmGuest.grData.TextMatrix(Rep + 1, 5)
        Grid.TextMatrix(Rep + 1, 6) = frmGuest.grData.TextMatrix(Rep + 1, 6)
    Next Rep
    txtName.Text = frmGuest.lstSeller.Text & " «·„Õ —„"
    txtPure.Text = frmGuest.txtEnd.Text & " ·.”"
    
End Sub

