VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmPrint 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Form1"
   ClientHeight    =   10950
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   FillColor       =   &H00FFFFFF&
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
   Begin VB.Frame fraRes 
      BackColor       =   &H00FFFFFF&
      Height          =   2295
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   8520
      Width           =   10575
      Begin VB.TextBox txtSold 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   "0"
         Top             =   720
         Width           =   2175
      End
      Begin VB.TextBox txtResualt 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   "0"
         Top             =   1080
         Width           =   2175
      End
      Begin VB.TextBox txtPrice 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   "0"
         Top             =   360
         Width           =   2175
      End
      Begin VB.Line Line2 
         BorderWidth     =   3
         Tag             =   "0"
         X1              =   10440
         X2              =   120
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Label Label9 
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
         Left            =   -960
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   "0"
         Top             =   1800
         Width           =   12135
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   "0"
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·Õ”„"
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   "0"
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·’«›Ì"
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   "0"
         Top             =   1080
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   975
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   3960
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
      TabIndex        =   12
      Top             =   960
      Width           =   2175
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "ÿ»«⁄…"
      Height          =   1005
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   2760
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid Grid 
      Height          =   5655
      Left            =   480
      TabIndex        =   8
      Top             =   2760
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
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox txtName 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1680
      Width           =   3015
   End
   Begin VB.ComboBox cmbKind 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   21.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   600
      ItemData        =   "frmPrint.frx":0000
      Left            =   3600
      List            =   "frmPrint.frx":0010
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Text            =   "··œÂ«‰« "
      Top             =   240
      Width           =   2775
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
      Left            =   3360
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1080
      Width           =   975
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
      Left            =   840
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1080
      Width           =   2175
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
      TabIndex        =   6
      Top             =   1680
      Width           =   4455
   End
   Begin VB.Label lblKind 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
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
      Left            =   2400
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   240
      Width           =   3855
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
      TabIndex        =   4
      Top             =   1680
      Width           =   1575
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   10920
      X2              =   360
      Y1              =   2280
      Y2              =   2280
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
      Caption         =   " «—ÌŒ"
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
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label lblDate 
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
      Left            =   960
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1680
      Width           =   2655
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«· Ê›Ìﬁ"
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
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim idNum As Long
Private Sub cmdBack_Click()
    frmPrint.Hide
    frmEnterMany.Show
End Sub

Private Sub cmdPrint_Click()
    cmdPrint.Visible = False
    cmdBack.Visible = False
    cmbName.Caption = txtName.Text
    lblNum.Caption = txtNum.Text
    lblKind.Caption = cmbKind.Text
    txtPrice.Text = txtPrice.Text & " ·.”"
    txtSold.Text = txtSold.Text & " ·.”"
    cmbKind.Visible = False
    txtName.Visible = False
    txtNum.Visible = False
    If frmEnterMany.txtSold.Text = 0 Then
        txtSold.Visible = False
        txtResualt.Visible = False
        Label11.Visible = False
        Label12.Visible = False
    End If
    Grid.Height = ((bytRec + 1) * 430) + 200
    fraRes.Top = 200 + Grid.Top + Grid.Height
    blnPrint = True
    SaveSetting "interdiv", "internet", "i393", idNum + 1
    frmPrint.PrintForm
    cmdPrint.Visible = True
    cmdBack.Visible = True
    cmbKind.Visible = True
    txtName.Visible = True
    txtNum.Visible = True
    cmbName.Caption = ""
    lblNum.Caption = ""
    lblKind.Caption = ""
    txtSold.Visible = True
    txtResualt.Visible = True
    Label11.Visible = True
    Label12.Visible = True
    cmdBack_Click
End Sub

Private Sub Form_Activate()
    Form_Load
End Sub

Private Sub Form_Load()
'put control default value

    idNum = GetSetting("interdiv", "internet", "i393", 0)
    txtNum = idNum
    Grid.Rows = 1
    Grid.ColWidth(0) = 1500
    Grid.ColWidth(1) = 4000
    Grid.ColWidth(2) = 2000
    Grid.ColWidth(3) = 1000
    Grid.ColWidth(4) = 1600
    Grid.ColAlignment(0) = 3
    Grid.ColAlignment(1) = 3
    Grid.ColAlignment(2) = 3
    Grid.ColAlignment(3) = 3
    Grid.ColAlignment(4) = 3
    Grid.TextMatrix(0, 0) = "«·≈Ã„«·Ì"
    Grid.TextMatrix(0, 1) = "«·‹‹»Ì‹«‰"
    Grid.TextMatrix(0, 2) = "««·”⁄— «·≈›—«œÌ"
    Grid.TextMatrix(0, 3) = "«·⁄œœ"
    Grid.TextMatrix(0, 4) = "„·«ÕŸ« "
    lblDate.Caption = " " & frmEnterMany.cmbDay.Text & " / " & frmEnterMany.cmbMonth.Text & " / " & frmEnterMany.cmbYear.Text & " "
    txtPrice.Text = frmEnterMany.txtPay.Text
    txtSold.Text = frmEnterMany.txtSold.Text & " " & frmEnterMany.cmbSold.Text
    txtResualt.Text = frmEnterMany.txtResualt.Text
    
'filling : fill the grid
    For Rep = 0 To bytRec - 1
        Grid.Rows = Grid.Rows + 1
        Grid.TextMatrix(Rep + 1, 0) = frmEnterMany.txtPrice(Rep)
        Grid.TextMatrix(Rep + 1, 1) = frmEnterMany.txtDes(Rep)
        Grid.TextMatrix(Rep + 1, 2) = frmEnterMany.txtSPrice(Rep)
        Grid.TextMatrix(Rep + 1, 3) = frmEnterMany.txtNum(Rep)
        Grid.TextMatrix(Rep + 1, 4) = frmEnterMany.txtCommon(Rep)
    Next Rep
    txtName.Text = frmEnterMany.txtNamePay.Text & " «·„Õ —„"
End Sub


