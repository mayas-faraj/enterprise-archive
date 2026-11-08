VERSION 5.00
Begin VB.Form frmPrint 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Form1"
   ClientHeight    =   11115
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   13680
   LinkTopic       =   "Form1"
   ScaleHeight     =   11115
   ScaleWidth      =   13680
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   1680
      Top             =   1440
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   11
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   84
      Top             =   8160
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   10
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   83
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   9
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   82
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   8
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   81
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   7
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   80
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   6
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   79
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   5
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   78
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   4
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   77
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   3
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   76
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   2
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   75
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   1
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   74
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtWrite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   0
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   73
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtTotal 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   68
      Text            =   "0"
      Top             =   9000
      Width           =   1695
   End
   Begin VB.TextBox txtSolaf 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   6480
      RightToLeft     =   -1  'True
      TabIndex        =   67
      Text            =   "0"
      Top             =   9000
      Width           =   1695
   End
   Begin VB.ComboBox txtMonth 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   315
      ItemData        =   "frmPrint.frx":0000
      Left            =   5400
      List            =   "frmPrint.frx":0002
      RightToLeft     =   -1  'True
      TabIndex        =   66
      Top             =   3120
      Width           =   1095
   End
   Begin VB.ComboBox txtYear 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   315
      ItemData        =   "frmPrint.frx":0004
      Left            =   4080
      List            =   "frmPrint.frx":0023
      RightToLeft     =   -1  'True
      TabIndex        =   65
      Text            =   "2006"
      Top             =   3120
      Width           =   975
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   0
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   59
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   0
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   58
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   0
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   57
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   0
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   56
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   0
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   55
      Text            =   "0"
      Top             =   4200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   1
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   54
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   2
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   53
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   3
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   52
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   4
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   51
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   5
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   50
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   6
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   49
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   7
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   48
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   8
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   47
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   9
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   46
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   10
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   45
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   11
      Left            =   9720
      RightToLeft     =   -1  'True
      TabIndex        =   44
      Top             =   8160
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   1
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   43
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   2
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   42
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   3
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   4
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   5
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   6
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   7
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   8
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   9
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   10
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtFire 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   11
      Left            =   8040
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   8160
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   1
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   2
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   3
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   4
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   5
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   6
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   7
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   8
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   9
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   10
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   11
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   8160
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   1
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   2
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   3
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   4
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   5
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   6
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   7
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   8
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   9
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   10
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPurePay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   11
      Left            =   4680
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   8160
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   1
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Text            =   "0"
      Top             =   4560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   2
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Text            =   "0"
      Top             =   4920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   3
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Text            =   "0"
      Top             =   5280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   4
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Text            =   "0"
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   5
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Text            =   "0"
      Top             =   6000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   6
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Text            =   "0"
      Top             =   6360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   7
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Text            =   "0"
      Top             =   6720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   8
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Text            =   "0"
      Top             =   7080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   9
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Text            =   "0"
      Top             =   7440
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   10
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Text            =   "0"
      Top             =   7800
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00FF0000&
      Height          =   375
      Index           =   11
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Text            =   "0"
      Top             =   8160
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "„ / Õ”Ì‰ «·ﬂ›—Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   1320
      TabIndex        =   87
      Top             =   9600
      Width           =   3135
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "„‹‹— »‹«  «·„ÊŸ›Ê‰"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   2400
      TabIndex        =   86
      Top             =   2280
      Width           =   6975
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FF0000&
      BorderWidth     =   5
      X1              =   1320
      X2              =   11400
      Y1              =   8640
      Y2              =   8640
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "«·„Ã„Ê⁄ «·ﬂ·Ì"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   8760
      TabIndex        =   85
      Top             =   9000
      Width           =   3135
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«· ÊﬁÌ⁄"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   1560
      RightToLeft     =   -1  'True
      TabIndex        =   72
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label Label8 
      BackColor       =   &H80000009&
      Caption         =   " «—ÌŒ"
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   6960
      TabIndex        =   71
      Top             =   3120
      Width           =   615
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "·· ”ÊÌﬁ «·⁄ﬁ«—Ì ⁄»— «·√‰ —‰ "
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   3000
      TabIndex        =   70
      Top             =   1320
      Width           =   5535
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "‘‹‹—ﬂ‹… «·ﬂ›‹‹—Ì"
      BeginProperty Font 
         Name            =   "Traditional Arabic"
         Size            =   36
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   975
      Left            =   2880
      TabIndex        =   69
      Top             =   360
      Width           =   5895
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈”„"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   9960
      RightToLeft     =   -1  'True
      TabIndex        =   64
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·€Ì«»"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   8160
      RightToLeft     =   -1  'True
      TabIndex        =   63
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·”·›"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   6480
      RightToLeft     =   -1  'True
      TabIndex        =   62
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·’«›Ì"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   4800
      RightToLeft     =   -1  'True
      TabIndex        =   61
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„ﬁÿÊ⁄"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   3240
      RightToLeft     =   -1  'True
      TabIndex        =   60
      Top             =   3840
      Width           =   1335
   End
End
Attribute VB_Name = "frmPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    For Rep = 0 To Bytid - 1
        txtName(Rep).Visible = True
        txtName(Rep).Text = frmMath.txtName(Rep).Text
        txtSolfa(Rep).Visible = True
        txtSolfa(Rep).Text = frmMath.txtSolfa(Rep).Text
        txtFire(Rep).Visible = True
        txtFire(Rep).Text = frmMath.txtFire(Rep).Text
        txtPay(Rep).Visible = True
        txtPay(Rep).Text = frmMath.txtPay(Rep).Text
        txtPurePay(Rep).Visible = True
        txtPurePay(Rep).Text = frmMath.txtPurePay(Rep).Text
        txtWrite(Rep).Visible = True
    Next Rep
    txtSolaf.Text = frmMath.txtSolaf.Text
    txtTotal.Text = frmMath.txtTotal.Text
    txtMonth.Text = frmMath.txtMonth.Text
    txtYear.Text = frmMath.txtYear.Text
    Printer.Copies = 1
    frmPrint.PrintForm
End Sub

Private Sub Timer1_Timer()
    frmPrint.Hide
    frmMath.Show
End Sub
