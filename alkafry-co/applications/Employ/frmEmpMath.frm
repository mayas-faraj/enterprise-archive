VERSION 5.00
Begin VB.Form frmEmpMath 
   Caption         =   "Form1"
   ClientHeight    =   11010
   ClientLeft      =   285
   ClientTop       =   660
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
   Picture         =   "frmEmpMath.frx":0000
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   0
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   61
      Tag             =   "1"
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   0
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   60
      Tag             =   "1"
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   0
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   59
      Tag             =   "1"
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   0
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   58
      Tag             =   "1"
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   0
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   57
      Tag             =   "1"
      Text            =   "0"
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   1
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   56
      Tag             =   "1"
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   2
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   55
      Tag             =   "1"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   3
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   54
      Tag             =   "1"
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   4
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   53
      Tag             =   "1"
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   5
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   52
      Tag             =   "1"
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   6
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   51
      Tag             =   "1"
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   7
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   50
      Tag             =   "1"
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   8
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   49
      Tag             =   "1"
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   9
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   48
      Tag             =   "1"
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   10
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   47
      Tag             =   "1"
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   11
      Left            =   10553
      RightToLeft     =   -1  'True
      TabIndex        =   46
      Tag             =   "1"
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   1
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   45
      Tag             =   "1"
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   2
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   44
      Tag             =   "1"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   3
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   43
      Tag             =   "1"
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   4
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   42
      Tag             =   "1"
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   5
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Tag             =   "1"
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   6
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Tag             =   "1"
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   7
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Tag             =   "1"
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   8
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Tag             =   "1"
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   9
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Tag             =   "1"
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   10
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Tag             =   "1"
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   11
      Left            =   8753
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Tag             =   "1"
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   1
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Tag             =   "1"
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   2
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Tag             =   "1"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   3
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Tag             =   "1"
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   4
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Tag             =   "1"
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   5
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Tag             =   "1"
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   6
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Tag             =   "1"
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   7
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Tag             =   "1"
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   8
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Tag             =   "1"
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   9
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Tag             =   "1"
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   10
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Tag             =   "1"
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   11
      Left            =   6833
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Tag             =   "1"
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   1
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Tag             =   "1"
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   2
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Tag             =   "1"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   3
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Tag             =   "1"
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   4
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Tag             =   "1"
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   5
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Tag             =   "1"
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   6
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Tag             =   "1"
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   7
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Tag             =   "1"
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   8
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Tag             =   "1"
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   9
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Tag             =   "1"
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   10
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Tag             =   "1"
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   11
      Left            =   4913
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Tag             =   "1"
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   1
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Tag             =   "1"
      Text            =   "0"
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   2
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Tag             =   "1"
      Text            =   "0"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   3
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Tag             =   "1"
      Text            =   "0"
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   4
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Tag             =   "1"
      Text            =   "0"
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   5
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   "1"
      Text            =   "0"
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   6
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Tag             =   "1"
      Text            =   "0"
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   7
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Tag             =   "1"
      Text            =   "0"
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   8
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Tag             =   "1"
      Text            =   "0"
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   9
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Tag             =   "1"
      Text            =   "0"
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   10
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   "1"
      Text            =   "0"
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E9FEEC&
      ForeColor       =   &H00000040&
      Height          =   375
      Index           =   11
      Left            =   2993
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   "1"
      Text            =   "0"
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.ComboBox lstYear 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      ItemData        =   "frmEmpMath.frx":15EE4
      Left            =   6360
      List            =   "frmEmpMath.frx":15F09
      TabIndex        =   1
      Text            =   "Combo2"
      Top             =   2280
      Width           =   1455
   End
   Begin VB.ComboBox lstMonth 
      BackColor       =   &H00E9FEEC&
      Height          =   375
      Left            =   8160
      TabIndex        =   0
      Text            =   "Combo1"
      Top             =   2280
      Width           =   855
   End
   Begin VB.Image cmdExit 
      Height          =   615
      Left            =   5280
      MouseIcon       =   "frmEmpMath.frx":15F4F
      MousePointer    =   99  'Custom
      Top             =   10080
      Width           =   2295
   End
   Begin VB.Image cmdBack 
      Height          =   615
      Left            =   8160
      MouseIcon       =   "frmEmpMath.frx":16391
      MousePointer    =   99  'Custom
      Top             =   10080
      Width           =   2175
   End
   Begin VB.Image command1 
      Height          =   615
      Left            =   4560
      MouseIcon       =   "frmEmpMath.frx":167D3
      MousePointer    =   99  'Custom
      Top             =   2160
      Width           =   1455
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáÅÓã"
      Height          =   255
      Left            =   10793
      RightToLeft     =   -1  'True
      TabIndex        =   66
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáÛíÇÈ"
      Height          =   255
      Left            =   8873
      RightToLeft     =   -1  'True
      TabIndex        =   65
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáÓáÝ"
      Height          =   255
      Left            =   6953
      RightToLeft     =   -1  'True
      TabIndex        =   64
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáÕÇÝí"
      Height          =   255
      Left            =   5033
      RightToLeft     =   -1  'True
      TabIndex        =   63
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "ÇáãÞØæÚ"
      Height          =   255
      Left            =   3233
      RightToLeft     =   -1  'True
      TabIndex        =   62
      Top             =   3480
      Width           =   1335
   End
End
Attribute VB_Name = "frmEmpMath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    frmEmpMath.Hide
    frmLogIn.Show
End Sub

Private Sub cmdExit_Click()
    ExitProg
End Sub

Private Sub Command1_Click()
    Rep = 0
    Dim objTexts As Object
    For Each objTexts In frmEmpMath
        If objTexts.Tag = "1" Then objTexts.Visible = False
    Next
    FindTarget
    Set ADO = CreateObject("ADODB.connection")
    ADO.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl & "employ.mdb"
    ADO.Open
    selSQL = "select * from tblsave where dmonth=" & lstMonth.Text & " and dyear=" & lstYear.Text
    Set RS = ADO.Execute(selSQL)
    Do While Not RS.EOF
        txtName(Rep).Visible = True
        txtName(Rep).Text = RS("dname")
        txtFire(Rep).Visible = True
        txtFire(Rep).Text = RS("dfire")
        txtSolfa(Rep).Visible = True
        txtSolfa(Rep).Text = RS("dsolaf")
        txtPurePay(Rep).Visible = True
        txtPurePay(Rep).Text = RS("dpurepay")
        txtPay(Rep).Visible = True
        txtPay(Rep).Text = RS("dpay")
        If Rep > 10 Then Exit Sub
        RS.MoveNext
        Rep = Rep + 1
    Loop
    ADO.Close
    Set ADO = Nothing
End Sub

Private Sub Form_Load()
    frmEmpMath.Width = Screen.Width
    frmEmpMath.Height = Screen.Height
    For Rep = 0 To 11
        lstMonth.List(Rep) = Rep + 1
    Next Rep
    lstMonth.Text = 1
    lstYear.Text = "2006"
    

End Sub

