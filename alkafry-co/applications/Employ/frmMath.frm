VERSION 5.00
Begin VB.Form frmMath 
   Caption         =   "Form"
   ClientHeight    =   11010
   ClientLeft      =   1245
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
   Picture         =   "frmMath.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSolaf 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   6840
      RightToLeft     =   -1  'True
      TabIndex        =   68
      Text            =   "0"
      Top             =   9000
      Width           =   1695
   End
   Begin VB.TextBox txtTotal 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   67
      Text            =   "0"
      Top             =   9000
      Width           =   1695
   End
   Begin VB.ComboBox txtYear 
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000080&
      Height          =   375
      ItemData        =   "frmMath.frx":17FDC
      Left            =   7080
      List            =   "frmMath.frx":17FFB
      RightToLeft     =   -1  'True
      TabIndex        =   66
      Text            =   "2006"
      Top             =   2280
      Width           =   975
   End
   Begin VB.ComboBox txtMonth 
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000080&
      Height          =   375
      ItemData        =   "frmMath.frx":18035
      Left            =   8400
      List            =   "frmMath.frx":18037
      RightToLeft     =   -1  'True
      TabIndex        =   65
      Top             =   2280
      Width           =   1095
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   11
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   64
      Text            =   "0"
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   10
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   63
      Text            =   "0"
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   9
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   62
      Text            =   "0"
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   8
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   61
      Text            =   "0"
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   7
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   60
      Text            =   "0"
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   6
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   59
      Text            =   "0"
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   5
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   58
      Text            =   "0"
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   4
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   57
      Text            =   "0"
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   3
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   56
      Text            =   "0"
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   2
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   55
      Text            =   "0"
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   1
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   54
      Text            =   "0"
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   11
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   53
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   10
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   52
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   9
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   51
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   8
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   50
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   7
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   49
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   6
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   48
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   5
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   47
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   4
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   46
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   3
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   45
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   2
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   44
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   1
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   43
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   11
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   42
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   10
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   9
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   8
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   7
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   6
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   5
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   4
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   3
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   2
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   1
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   11
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   10
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   9
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   8
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   7
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   6
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   5
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   4
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   3
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   2
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   1
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   11
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   10
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   9
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   8
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   7
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   6
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   5
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   4
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   3
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   2
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   1
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   0
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Text            =   "0"
      Top             =   3840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   0
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   3840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   0
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   3840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   0
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   3840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H000000C0&
      Height          =   375
      Index           =   0
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   3840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Image command6 
      Height          =   615
      Left            =   5520
      MouseIcon       =   "frmMath.frx":18039
      MousePointer    =   99  'Custom
      Top             =   9960
      Width           =   1935
   End
   Begin VB.Image Command5 
      Height          =   615
      Left            =   600
      MouseIcon       =   "frmMath.frx":1847B
      MousePointer    =   99  'Custom
      Top             =   9960
      Width           =   2055
   End
   Begin VB.Image Command4 
      Height          =   615
      Left            =   3120
      MouseIcon       =   "frmMath.frx":188BD
      MousePointer    =   99  'Custom
      Top             =   9960
      Width           =   1935
   End
   Begin VB.Image Command3 
      Height          =   615
      Left            =   7920
      MouseIcon       =   "frmMath.frx":18CFF
      MousePointer    =   99  'Custom
      Top             =   9960
      Width           =   1935
   End
   Begin VB.Image Command2 
      Height          =   615
      Left            =   10200
      MouseIcon       =   "frmMath.frx":19141
      MousePointer    =   99  'Custom
      Top             =   9960
      Width           =   2055
   End
   Begin VB.Image Command1 
      Height          =   615
      Left            =   12600
      MouseIcon       =   "frmMath.frx":19583
      MousePointer    =   99  'Custom
      Top             =   9960
      Width           =   1935
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„ﬁÿÊ⁄"
      ForeColor       =   &H00004000&
      Height          =   255
      Left            =   3233
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·’«›Ì"
      ForeColor       =   &H00004000&
      Height          =   255
      Left            =   5033
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·”·›"
      ForeColor       =   &H00004000&
      Height          =   255
      Left            =   6953
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·€Ì«»"
      ForeColor       =   &H00004000&
      Height          =   255
      Left            =   8873
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈”„"
      ForeColor       =   &H00004000&
      Height          =   255
      Left            =   10793
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   3480
      Width           =   1335
   End
End
Attribute VB_Name = "frmMath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ADO, RS, selSQL As String

Private Sub Command1_Click()
txtSolaf.Text = 0
txtTotal.Text = 0
For Rep = 0 To 11
    If txtName(Rep).Visible = True Then
        txtPay(Rep) = txtPurePay(Rep).Text - (txtSolfa(Rep).Text + (txtFire(Rep).Text * (txtPurePay(Rep).Text / 30)))
    End If
Next
For Rep = 0 To 11
    If txtName(Rep).Visible = True Then
        txtSolaf.Text = txtSolaf.Text + CLng(txtSolfa(Rep))
        txtTotal.Text = txtTotal.Text + CLng(txtPay(Rep))
    End If
Next
End Sub

Private Sub Command2_Click()
    For Rep = 0 To 11
        txtFire(Rep).Text = 0
        txtSolfa(Rep).Text = 0
    Next Rep
End Sub

Private Sub Command3_Click()
    For Rep = 0 To 11
        If txtName(Rep).Visible = True Then
            selSQL = "insert into tblsave (dname,dfire,dsolaf,dpurepay,dpay,dmonth,dyear) values ('" & txtName(Rep).Text & "'," & txtFire(Rep).Text & "," & txtSolfa(Rep).Text & "," & txtPurePay(Rep).Text & "," & txtPay(Rep).Text & "," & txtMonth.Text & "," & txtYear.Text & ")"
            Set RS = ADO.Execute(selSQL)
        End If
    Next Rep
     
End Sub

Private Sub Command4_Click()
    frmMath.Hide
    frmLogIn.Show
End Sub

Private Sub Command5_Click()
    ExitProg
End Sub

Private Sub command6_Click()
    frmMath.Hide
    frmPrint.Show
End Sub

Private Sub Form_Activate()
    Form_Load
End Sub

Private Sub Form_Load()
    Rep = 0
    Bytid = 0
    frmMath.Width = Screen.Width
    frmMath.Height = Screen.Height
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "select * from tblemploy where dwork<>1"
    Set RS = ADO.Execute(selSQL)
    Do While Not RS.EOF
        Bytid = Bytid + 1
        txtName(Rep).Visible = True
        txtName(Rep).Text = RS("dname")
        txtFire(Rep).Visible = True
        txtFire(Rep).Text = RS("dfire")
        txtSolfa(Rep).Visible = True
        txtSolfa(Rep).Text = RS("dsolaf")
        txtPurePay(Rep).Visible = True
        txtPurePay(Rep).Text = RS("dpay")
        txtPay(Rep).Visible = True
        If Rep > 10 Then Exit Sub
        RS.MoveNext
        Rep = Rep + 1
    Loop
    For Rep = 0 To 11
        txtMonth.List(Rep) = Rep + 1
    Next Rep
    txtYear = Year(Now)
    txtMonth = Month(Now)
End Sub

Private Sub txtFire_Change(Index As Integer)
    If IsNumeric(txtFire(Index).Text) = False Then
        MsgBox "Ì—ÃÏ ≈œŒ«· ﬁÌ„… ’ÕÌÕ…", vbOKOnly, "Õ”«»«  «·„ÊŸ›Ê‰"
        txtFire(Index).Text = "0"
    End If
End Sub

Private Sub txtPurePay_Change(Index As Integer)
    If IsNumeric(txtPurePay(Index).Text) = False Then
        MsgBox "Ì—ÃÏ ≈œŒ«· ﬁÌ„… ’ÕÌÕ…", vbOKOnly, "Õ”«»«  «·„ÊŸ›Ê‰"
        txtPurePay(Index).Text = "0"
    End If
End Sub

Private Sub txtSolfa_Change(Index As Integer)
    If IsNumeric(txtSolfa(Index).Text) = False Then
        MsgBox "Ì—ÃÏ ≈œŒ«· ﬁÌ„… ’ÕÌÕ…", vbOKOnly, "Õ”«»«  «·„ÊŸ›Ê‰"
        txtSolfa(Index).Text = "0"
    End If

End Sub
