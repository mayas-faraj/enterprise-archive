VERSION 5.00
Begin VB.Form frmEnterMany 
   Caption         =   " "
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
   Picture         =   "frmEnterMany.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtDain 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      Height          =   345
      Left            =   1200
      MaxLength       =   15
      TabIndex        =   188
      Text            =   "0"
      Top             =   1200
      Width           =   2535
   End
   Begin VB.CommandButton cmdDelRec 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ–› ”Ã·"
      Height          =   375
      Left            =   8760
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   186
      Top             =   10200
      Width           =   1455
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmEnterMany.frx":1751B
      Left            =   12360
      List            =   "frmEnterMany.frx":1751D
      RightToLeft     =   -1  'True
      TabIndex        =   185
      Top             =   2640
      Width           =   2415
   End
   Begin VB.TextBox txtLotRest 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Height          =   405
      Left            =   1080
      Locked          =   -1  'True
      MaxLength       =   150
      RightToLeft     =   -1  'True
      TabIndex        =   182
      Tag             =   "0"
      Top             =   2880
      Width           =   1575
   End
   Begin VB.CommandButton cmdSold 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Õ”„"
      Height          =   375
      Left            =   3780
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   180
      Top             =   10200
      Width           =   1455
   End
   Begin VB.ComboBox cmbSold 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmEnterMany.frx":1751F
      Left            =   840
      List            =   "frmEnterMany.frx":17529
      RightToLeft     =   -1  'True
      TabIndex        =   179
      Text            =   "·.”"
      Top             =   8880
      Width           =   855
   End
   Begin VB.TextBox txtSold 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   1800
      RightToLeft     =   -1  'True
      TabIndex        =   177
      Tag             =   "0"
      Text            =   "0"
      Top             =   8880
      Width           =   1335
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7920
      Locked          =   -1  'True
      RightToLeft     =   -1  'True
      TabIndex        =   175
      Tag             =   "0"
      Text            =   "0"
      Top             =   9360
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFC0C0&
      Caption         =   "ÿ»«⁄…"
      Height          =   375
      Left            =   7095
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   174
      Top             =   10200
      Width           =   1455
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   840
      RightToLeft     =   -1  'True
      TabIndex        =   172
      Tag             =   "0"
      Text            =   "0"
      Top             =   9360
      Width           =   2295
   End
   Begin VB.TextBox txtResualt 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7920
      Locked          =   -1  'True
      RightToLeft     =   -1  'True
      TabIndex        =   169
      Tag             =   "0"
      Text            =   "0"
      Top             =   8880
      Width           =   2295
   End
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H00FFC0C0&
      Caption         =   "„”Õ"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5445
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   168
      Top             =   10200
      Width           =   1455
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   465
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   167
      Top             =   10200
      Width           =   1455
   End
   Begin VB.CommandButton cmdBack 
      BackColor       =   &H00FFC0C0&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   2115
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   166
      Top             =   10200
      Width           =   1455
   End
   Begin VB.CommandButton cmdEnter 
      BackColor       =   &H00FFC0C0&
      Caption         =   "≈œŒ«·"
      Enabled         =   0   'False
      Height          =   375
      Left            =   10440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   165
      Top             =   10200
      Width           =   1455
   End
   Begin VB.Frame fraTable 
      BackColor       =   &H00F8E6DE&
      Height          =   4815
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   3960
      Width           =   11775
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   27
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   164
         Top             =   10200
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   27
         Left            =   5880
         TabIndex        =   163
         Top             =   10200
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   27
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   162
         Top             =   10200
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   27
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   161
         Top             =   10200
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   27
         Left            =   840
         MaxLength       =   15
         TabIndex        =   160
         Top             =   10200
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   26
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   159
         Top             =   9840
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   26
         Left            =   5880
         TabIndex        =   158
         Top             =   9840
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   26
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   157
         Top             =   9840
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   26
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   156
         Top             =   9840
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   26
         Left            =   840
         MaxLength       =   15
         TabIndex        =   155
         Top             =   9840
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   25
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   154
         Top             =   9480
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   25
         Left            =   5880
         TabIndex        =   153
         Top             =   9480
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   25
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   152
         Top             =   9480
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   25
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   151
         Top             =   9480
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   25
         Left            =   840
         MaxLength       =   15
         TabIndex        =   150
         Top             =   9480
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   24
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   149
         Top             =   9120
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   24
         Left            =   5880
         TabIndex        =   148
         Top             =   9120
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   24
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   147
         Top             =   9120
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   24
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   146
         Top             =   9120
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   24
         Left            =   840
         MaxLength       =   15
         TabIndex        =   145
         Top             =   9120
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   23
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   144
         Top             =   8760
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   23
         Left            =   5880
         TabIndex        =   143
         Top             =   8760
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   23
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   142
         Top             =   8760
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   23
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   141
         Top             =   8760
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   23
         Left            =   840
         MaxLength       =   15
         TabIndex        =   140
         Top             =   8760
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   22
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   139
         Top             =   8400
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   22
         Left            =   5880
         TabIndex        =   138
         Top             =   8400
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   22
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   137
         Top             =   8400
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   22
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   136
         Top             =   8400
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   22
         Left            =   840
         MaxLength       =   15
         TabIndex        =   135
         Top             =   8400
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   21
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   134
         Top             =   8040
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   21
         Left            =   5880
         TabIndex        =   133
         Top             =   8040
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   21
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   132
         Top             =   8040
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   21
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   131
         Top             =   8040
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   21
         Left            =   840
         MaxLength       =   15
         TabIndex        =   130
         Top             =   8040
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   20
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   129
         Top             =   7680
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   20
         Left            =   5880
         TabIndex        =   128
         Top             =   7680
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   20
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   127
         Top             =   7680
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   20
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   126
         Top             =   7680
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   20
         Left            =   840
         MaxLength       =   15
         TabIndex        =   125
         Top             =   7680
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   19
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   124
         Top             =   7320
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   19
         Left            =   5880
         TabIndex        =   123
         Top             =   7320
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   19
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   122
         Top             =   7320
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   19
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   121
         Top             =   7320
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   19
         Left            =   840
         MaxLength       =   15
         TabIndex        =   120
         Top             =   7320
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   18
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   119
         Top             =   6960
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   18
         Left            =   5880
         TabIndex        =   118
         Top             =   6960
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   18
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   117
         Top             =   6960
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   18
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   116
         Top             =   6960
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   18
         Left            =   840
         MaxLength       =   15
         TabIndex        =   115
         Top             =   6960
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   17
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   114
         Top             =   6600
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   17
         Left            =   5880
         TabIndex        =   113
         Top             =   6600
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   17
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   112
         Top             =   6600
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   17
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   111
         Top             =   6600
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   17
         Left            =   840
         MaxLength       =   15
         TabIndex        =   110
         Top             =   6600
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   16
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   109
         Top             =   6240
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   16
         Left            =   5880
         TabIndex        =   108
         Top             =   6240
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   16
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   107
         Top             =   6240
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   16
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   106
         Top             =   6240
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   16
         Left            =   840
         MaxLength       =   15
         TabIndex        =   105
         Top             =   6240
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   15
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   104
         Top             =   5880
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   15
         Left            =   5880
         TabIndex        =   103
         Top             =   5880
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   15
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   102
         Top             =   5880
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   15
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   101
         Top             =   5880
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   15
         Left            =   840
         MaxLength       =   15
         TabIndex        =   100
         Top             =   5880
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   14
         Left            =   840
         MaxLength       =   15
         TabIndex        =   99
         Top             =   5520
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   13
         Left            =   840
         MaxLength       =   15
         TabIndex        =   98
         Top             =   5160
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   12
         Left            =   840
         MaxLength       =   15
         TabIndex        =   97
         Top             =   4800
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   14
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   85
         Top             =   5520
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   13
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   84
         Top             =   5160
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   12
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   83
         Top             =   4800
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   14
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   71
         Top             =   5520
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   13
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   70
         Top             =   5160
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   12
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   69
         Top             =   4800
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   14
         Left            =   5880
         TabIndex        =   57
         Top             =   5520
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   13
         Left            =   5880
         TabIndex        =   56
         Top             =   5160
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   12
         Left            =   5880
         TabIndex        =   55
         Top             =   4800
         Width           =   4095
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   14
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   34
         Top             =   5520
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   13
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   33
         Top             =   5160
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   12
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   32
         Top             =   4800
         Width           =   1695
      End
      Begin VB.VScrollBar VScroll 
         Height          =   4335
         Left            =   480
         Max             =   1
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   480
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   0
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   21
         Top             =   480
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   2
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   22
         Top             =   1200
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   3
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   23
         Top             =   1560
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   4
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   24
         Top             =   1920
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   5
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   25
         Top             =   2280
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   6
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   26
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   7
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   27
         Top             =   3000
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   8
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   28
         Top             =   3360
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   9
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   29
         Top             =   3720
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   10
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   30
         Top             =   4080
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   11
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   31
         Top             =   4440
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   0
         Left            =   5880
         TabIndex        =   39
         Top             =   480
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   0
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   40
         Top             =   480
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   0
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   41
         Top             =   480
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   0
         Left            =   840
         MaxLength       =   15
         TabIndex        =   42
         Top             =   480
         Width           =   1695
      End
      Begin VB.TextBox TxtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   1
         Left            =   9960
         MaxLength       =   15
         TabIndex        =   43
         Top             =   840
         Width           =   1695
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   1
         Left            =   5880
         TabIndex        =   44
         Top             =   840
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   2
         Left            =   5880
         TabIndex        =   45
         Top             =   1200
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   3
         Left            =   5880
         TabIndex        =   46
         Top             =   1560
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   4
         Left            =   5880
         TabIndex        =   47
         Top             =   1920
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   5
         Left            =   5880
         TabIndex        =   48
         Top             =   2280
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   6
         Left            =   5880
         TabIndex        =   49
         Top             =   2640
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   7
         Left            =   5880
         TabIndex        =   50
         Top             =   3000
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   8
         Left            =   5880
         TabIndex        =   51
         Top             =   3360
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   9
         Left            =   5880
         TabIndex        =   52
         Top             =   3720
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   10
         Left            =   5880
         TabIndex        =   53
         Top             =   4080
         Width           =   4095
      End
      Begin VB.TextBox txtDes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   11
         Left            =   5880
         TabIndex        =   54
         Top             =   4440
         Width           =   4095
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   1
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   58
         Top             =   840
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   2
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   59
         Top             =   1200
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   3
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   60
         Top             =   1560
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   4
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   61
         Top             =   1920
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   5
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   62
         Top             =   2280
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   6
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   63
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   7
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   64
         Top             =   3000
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   8
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   65
         Top             =   3360
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   9
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   66
         Top             =   3720
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   10
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   67
         Top             =   4080
         Width           =   1695
      End
      Begin VB.TextBox txtNum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   11
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   68
         Top             =   4440
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   1
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   72
         Top             =   840
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   2
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   73
         Top             =   1200
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   3
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   74
         Top             =   1560
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   4
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   75
         Top             =   1920
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   5
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   76
         Top             =   2280
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   6
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   77
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   7
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   78
         Top             =   3000
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   8
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   79
         Top             =   3360
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   9
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   80
         Top             =   3720
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   10
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   81
         Top             =   4080
         Width           =   1695
      End
      Begin VB.TextBox txtSPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   11
         Left            =   2520
         MaxLength       =   15
         TabIndex        =   82
         Top             =   4440
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   1
         Left            =   840
         MaxLength       =   15
         TabIndex        =   86
         Top             =   840
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   2
         Left            =   840
         MaxLength       =   15
         TabIndex        =   87
         Top             =   1200
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   3
         Left            =   840
         MaxLength       =   15
         TabIndex        =   88
         Top             =   1560
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   4
         Left            =   840
         MaxLength       =   15
         TabIndex        =   89
         Top             =   1920
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   5
         Left            =   840
         MaxLength       =   15
         TabIndex        =   90
         Top             =   2280
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   6
         Left            =   840
         MaxLength       =   15
         TabIndex        =   91
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   7
         Left            =   840
         MaxLength       =   15
         TabIndex        =   92
         Top             =   3000
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   8
         Left            =   840
         MaxLength       =   15
         TabIndex        =   93
         Top             =   3360
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   9
         Left            =   840
         MaxLength       =   15
         TabIndex        =   94
         Top             =   3720
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   10
         Left            =   840
         MaxLength       =   15
         TabIndex        =   95
         Top             =   4080
         Width           =   1695
      End
      Begin VB.TextBox txtCommon 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00ADE2A0&
         Height          =   345
         Index           =   11
         Left            =   840
         MaxLength       =   15
         TabIndex        =   96
         Top             =   4440
         Width           =   1695
      End
      Begin VB.Label LblName 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "„·«ÕŸ« "
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   4
         Left            =   840
         TabIndex        =   38
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label LblName 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "«·”⁄— «·≈›—«œÌ"
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   3
         Left            =   2520
         TabIndex        =   37
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label LblName 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "«·⁄œœ"
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   2
         Left            =   4200
         TabIndex        =   36
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label LblName 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "«·»‹Ì‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹«‰"
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   1
         Left            =   5880
         TabIndex        =   35
         Top             =   120
         Width           =   4095
      End
      Begin VB.Label LblName 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "«·”⁄— «·≈Ã„«·Ì"
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   0
         Left            =   9960
         TabIndex        =   20
         Top             =   120
         Width           =   1695
      End
   End
   Begin VB.Frame fraGuest 
      BackColor       =   &H00F8E6DE&
      Caption         =   "«·Õ”«»"
      Height          =   2415
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1800
      Width           =   11775
      Begin VB.TextBox txtSNPrice 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         Height          =   405
         Left            =   840
         Locked          =   -1  'True
         MaxLength       =   150
         RightToLeft     =   -1  'True
         TabIndex        =   183
         Tag             =   "0"
         Top             =   480
         Width           =   1575
      End
      Begin VB.CommandButton cmdShowAccount 
         Caption         =   "⁄—÷ «·Õ”«»"
         Height          =   375
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   171
         Top             =   480
         Width           =   2775
      End
      Begin VB.TextBox txtNamePay 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   405
         Left            =   7320
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   1080
         Width           =   2655
      End
      Begin VB.TextBox txtAddress 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         Height          =   405
         Left            =   840
         Locked          =   -1  'True
         MaxLength       =   150
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   "0"
         Top             =   1680
         Width           =   5415
      End
      Begin VB.TextBox txtPhone 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         Height          =   405
         Left            =   4200
         Locked          =   -1  'True
         MaxLength       =   20
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   "0"
         Top             =   1080
         Width           =   2055
      End
      Begin VB.TextBox txtMoney 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         Height          =   405
         Left            =   7320
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   "0"
         Top             =   1680
         Width           =   2655
      End
      Begin VB.ComboBox cmbCost 
         BackColor       =   &H00C0FFFF&
         Height          =   405
         ItemData        =   "frmEnterMany.frx":17535
         Left            =   7320
         List            =   "frmEnterMany.frx":1753F
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Text            =   "“»Ê‰ ⁄«»—"
         Top             =   480
         Width           =   2655
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00F8E6DE&
         Caption         =   "„ ”·”·"
         Height          =   375
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   184
         Top             =   480
         Width           =   855
      End
      Begin VB.Label lblRest 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00F8E6DE&
         Caption         =   "«·ﬂ„Ì… «·„ Ê›—…"
         Height          =   375
         Left            =   2520
         RightToLeft     =   -1  'True
         TabIndex        =   181
         Top             =   1080
         Width           =   1215
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackColor       =   &H00F8E6DE&
         Caption         =   "›« Ê—… »≈”„"
         Height          =   375
         Left            =   10080
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BackColor       =   &H00F8E6DE&
         Caption         =   "«·⁄‰Ê«‰"
         Height          =   375
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   1680
         Width           =   855
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         BackColor       =   &H00F8E6DE&
         Caption         =   "«·Â« ›"
         Height          =   375
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackColor       =   &H00F8E6DE&
         Caption         =   "«·„»·€ «·„œ«‰"
         Height          =   375
         Left            =   10320
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   1680
         Width           =   1215
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00F8E6DE&
         Caption         =   "≈”‰«œ «·Õ”«» ≈·Ï"
         Height          =   375
         Left            =   10080
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   480
         Width           =   1455
      End
   End
   Begin VB.ComboBox txtGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmEnterMany.frx":17559
      Left            =   12360
      List            =   "frmEnterMany.frx":1755B
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   2160
      Width           =   2415
   End
   Begin VB.ListBox lstKind 
      BackColor       =   &H00C0FFFF&
      Height          =   7470
      Left            =   12360
      TabIndex        =   4
      Top             =   3120
      Width           =   2415
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7620
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1200
      Width           =   615
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmEnterMany.frx":1755D
      Left            =   6780
      List            =   "frmEnterMany.frx":1755F
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1200
      Width           =   735
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmEnterMany.frx":17561
      Left            =   5700
      List            =   "frmEnterMany.frx":17592
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "„Ã„Ê⁄ «·œÌÊ‰"
      Height          =   375
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   187
      Top             =   840
      Width           =   2295
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·Õ”„"
      Height          =   375
      Left            =   3360
      RightToLeft     =   -1  'True
      TabIndex        =   178
      Top             =   8880
      Width           =   1455
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·’«›Ì"
      Height          =   375
      Left            =   10440
      RightToLeft     =   -1  'True
      TabIndex        =   176
      Top             =   9360
      Width           =   1455
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„œ›Ê⁄"
      Height          =   375
      Left            =   3360
      RightToLeft     =   -1  'True
      TabIndex        =   173
      Top             =   9360
      Width           =   1455
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„Ã„Ê⁄"
      Height          =   375
      Left            =   10440
      RightToLeft     =   -1  'True
      TabIndex        =   170
      Top             =   8880
      Width           =   1455
   End
   Begin VB.Label lblGroub 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„Ã„Ê⁄…"
      Height          =   255
      Left            =   12960
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   1560
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   8460
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1200
      Width           =   615
   End
End
Attribute VB_Name = "frmEnterMany"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim arrKLot(10000) As Long, arrKSP(10000) As Long, arrKSPall(10000) As Long, darrKLot(27), darrKSP(27), arrNetPrice(10000)
Dim Pos1(27) As Long, Pos2(27) As Long, Pos3(27) As Long, Pos4(27) As Long, Pos5(27) As Long
Private Sub PlusValues()
    Dim NewRep As Byte
    txtPay.Text = 0
    For NewRep = 0 To bytRec - 1
        txtPay.Text = CInt(txtPay.Text) + CInt(TxtPrice(NewRep).Text)
    Next NewRep
End Sub
Private Sub cmbCost_click()
' refresh : fill me with guests from tblmoney
    Dim intThis As Integer
    intThis = cmbCost.ListIndex
    Rep = 2
    cmbCost.List(0) = "“»Ê‰ ⁄«»—"
    cmbCost.List(1) = "“»Ê‰ ÃœÌœ"
    SelSQL = "select * from tblmoney order by dname"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        cmbCost.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
    cmbCost.ListIndex = intThis
        
' filling : fill guest's text box with them value
    If cmbCost.ListIndex >= 2 Then
        SelSQL = "select * from tblmoney where dname='" & cmbCost.Text & "'"
        Set Rs = ADO.execute(SelSQL)
        txtNamePay.Text = Rs("dname")
        txtPhone.Text = Rs("dphone")
        txtAddress.Text = Rs("daddress")
        txtMoney.Text = Rs("dmoney")
    End If
    
'controlling : make cmbcost control with frame1 objects
    If cmbCost.ListIndex = 0 Then
        cmdShowAccount.Enabled = False
        txtNamePay.Text = ""
        txtPhone.Text = ""
        txtAddress.Text = ""
        txtMoney.Text = ""
        txtSolfa.Enabled = False
    ElseIf cmbCost.ListIndex = 1 Then
        cmdShowAccount.Enabled = False
        txtPhone.Locked = False
        txtAddress.Locked = False
        txtMoney.Locked = False
        txtNamePay.Text = ""
        txtPhone.Text = ""
        txtAddress.Text = ""
        txtMoney.Text = ""
        txtSolfa.Enabled = True
    Else
        cmdShowAccount.Enabled = True
        txtPhone.Locked = True
        txtAddress.Locked = True
        txtMoney.Locked = True
        txtSolfa.Enabled = True
    End If
End Sub

Private Sub cmbKind_Click()
    lstKind.Text = cmbKind.Text
End Sub

Private Sub cmdBack_Click()
    frmMain.Show
    frmEnterMany.Hide
End Sub

Private Sub cmdClear_Click()
'istablishing : istablish form dimention
    Dim clrRep As Byte
    
'clear : clear all variable objects
    cmbCost.ListIndex = 0
    txtGroub.ListIndex = 0
    lstKind.ListIndex = 0
    txtNamePay.Text = ""
    txtPhone.Text = ""
    txtAddress.Text = ""
    txtPay.Text = 0
    txtMoney.Text = ""
    txtResualt.Text = 0
    txtSold.Text = 0
    txtSolfa.Text = 0
    cmbSold.Text = "·.”"
    
    For clrRep = 0 To 26
        TxtPrice(clrRep).Text = ""
        txtSPrice(clrRep).Text = ""
        txtNum(clrRep).Text = ""
        txtCommon(clrRep).Text = ""
        txtDes(clrRep).Text = ""
    Next clrRep
    
'hideing : hide te table
    For clrRep = 0 To 27
        TxtPrice(clrRep).Visible = False
        txtSPrice(clrRep).Visible = False
        txtNum(clrRep).Visible = False
        txtCommon(clrRep).Visible = False
        txtDes(clrRep).Visible = False
    Next clrRep
    VScroll.Max = 1
    VScroll.Value = 0
    VScroll.Visible = False
    bytRec = 0

'controlling : change other controls property
    cmdEnter.Enabled = False
    cmdClear.Enabled = False
    cmdSold.Enabled = False
End Sub

Private Sub cmdDelRec_Click()
    If bytRec = 0 Then
        cmdClear_Click
        Exit Sub
    End If
    bytRec = bytRec - 1
    txtNum(bytRec).Text = 0
    txtDes(bytRec).Text = ""
    TxtPrice(bytRec).Text = ""
    txtSPrice(bytRec).Text = ""
    txtCommon(bytRec).Text = ""
    
    txtDes(bytRec).Visible = False
    TxtPrice(bytRec).Visible = False
    txtSPrice(bytRec).Visible = False
    txtNum(bytRec).Visible = False
    txtCommon(bytRec).Visible = False
    If bytRec > 11 And bytRec < 28 Then
        VScroll.Max = VScroll.Max - 1
        VScroll.Value = VScroll.Value - 1
    End If
End Sub

Private Sub cmdEnter_Click()
Dim EntRep As Byte, dWin As Long, dMoney As Long, dDo As Byte, Ms As Byte
If blnPrint = False Then
    Ms = MsgBox("·„ Ì „ ÿ»«⁄… «·›« Ê—… »⁄œ , ⁄„·Ì… «·≈œŒ«· ” ƒœÌ ≈·Ï „”Õ «·»Ì«‰«  , Â·  —Ìœ «·„ «»⁄… ⁄·Ï √Ì… Õ«· ø", vbYesNo, "ÿ»«⁄… «·›« Ê—…")
    If Ms = vbNo Then Exit Sub
End If
blnPrint = False
For EntRep = 0 To bytRec - 1
If txtDes(EntRep) <> "" Then
dWin = Int(TxtPrice(EntRep).Text) - Int(darrKSP(EntRep) * txtNum(EntRep))
    If cmbCost.ListIndex = 0 Then
    'first case : regular costomer .
        SelSQL = "insert into tbldata (dname,dmat,dnum,dsprice,dprice,dwin,ddes,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & txtDes(EntRep).Text & "'," & txtNum(EntRep).Text & "," & txtSPrice(EntRep).Text & "," & TxtPrice(EntRep).Text & "," & dWin & ",'" & txtCommon(EntRep).Text & "'," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
        Set Rs = ADO.execute(SelSQL)
        SelSQL = "update tblkind set dlot=" & Int(darrKLot(EntRep) - txtNum(EntRep)) & " where dname='" & txtDes(EntRep).Text & "'"
        darrKLot(EntRep) = darrKLot(EntRep) - txtNum(EntRep)
        Set Rs = ADO.execute(SelSQL)
    ElseIf cmbCost.ListIndex = 1 Then
    'second case : new costomer .
        dDo = 1
        SelSQL = "update tblkind set dlot=" & Int(darrKLot(EntRep) - txtNum(EntRep)) & " where dname='" & txtDes(EntRep).Text & "'"
        Set Rs = ADO.execute(SelSQL)
        darrKLot(EntRep) = darrKLot(EntRep) - txtNum(EntRep)
        SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,dwin,ddes,dpay,drest,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & txtDes(EntRep).Text & "'," & txtNum(EntRep).Text & "," & txtSPrice(EntRep).Text & "," & TxtPrice(EntRep).Text & "," & dWin & ",'" & txtCommon(EntRep).Text & "',0," & TxtPrice(EntRep).Text & "," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
        Set Rs = ADO.execute(SelSQL)
    Else
    'third case : old costomer .
        dDo = 2
        SelSQL = "update tblkind set dlot=" & Int(darrKLot(EntRep) - txtNum(EntRep)) & " where dname='" & txtDes(EntRep).Text & "'"
        Set Rs = ADO.execute(SelSQL)
        darrKLot(EntRep) = darrKLot(EntRep) - txtNum(EntRep)
        SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,dwin,ddes,dpay,drest,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & txtDes(EntRep).Text & "'," & txtNum(EntRep).Text & "," & txtSPrice(EntRep).Text & "," & TxtPrice(EntRep).Text & "," & dWin & ",'" & txtCommon(EntRep).Text & "',0," & TxtPrice(EntRep).Text & "," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
        Set Rs = ADO.execute(SelSQL)
    End If
    ' ensureing : compare the table's value with the tblkind data base value
    Set Rs = ADO.execute("select * from tblkind where dname='" & txtDes(EntRep).Text & "'")
    If Rs.EOF = True And Rs.bof = True Then
        Ms = 0
        Ms = MsgBox(txtDes(EntRep) & " , Â·  —Ìœ ≈œŒ«·Â« ≈·Ï ﬁ«⁄œ… «·»Ì«‰« ", vbYesNo, "ﬁ«⁄œ… »Ì«‰«  «·ﬁÿ⁄ «·„ Ê›—…")
        If Ms = vbYes Then
            Dim boxIn As Long
            boxIn = InputBox("Ì—ÃÏ ≈œŒ«· «·”⁄— «·„ﬁÿÊ⁄ ··ﬁÿ⁄… «·„œŒ·…", "«·”⁄— «·„ﬁÿÊ⁄", 0)
            SelSQL = "insert into tblkind (dname,dprice,dpriceall,dlot,dgroub) values ('" & txtDes(EntRep).Text & "'," & boxIn & "," & txtSPrice(EntRep).Text & ",10,'" & "„Ã„Ê⁄… ÃœÌœ…" & "')"
            Set Rs = ADO.execute(SelSQL)
        End If
    Else
        SelSQL = "select * from tblkind where dname='" & txtDes(EntRep).Text & "'"
        Set Rs = ADO.execute(SelSQL)
        If Rs("dlot") <= 0 Then
            MsgBox " „ ‰›«– ﬂ„Ì… «·ﬁÿ⁄… :" & txtDes(EntRep).Text, vbOKOnly + vbInformation, "ﬁ«⁄œ… »Ì«‰«  «·ﬁÿ⁄ «·„ Ê›—…"
        End If
    End If
End If
Next EntRep
If dDo = 1 Then
        SelSQL = "insert into tblmoney (dname,dphone,daddress,dmoney,dfdate) values ('" & txtNamePay.Text & "','" & txtPhone.Text & "','" & txtAddress.Text & "'," & Int(txtPay.Text - txtSolfa.Text) & ",'" & cmbYear.Text & " \ " & cmbMonth.Text & " \ " & cmbDay.Text & "')"
        Set Rs = ADO.execute(SelSQL)
        If Not txtSolfa.Text = 0 Then
            SelSQL = "insert into tblguest (dname,dmat,dpay,drest,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & "œ›⁄… ⁄·Ï «·Õ”«»" & "'," & txtSolfa.Text & ",0," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
            Set Rs = ADO.execute(SelSQL)
        End If
ElseIf dDo = 2 Then
        dMoney = CDbl(txtMoney.Text) + CDbl(txtPay.Text) - CDbl(txtSolfa.Text)
        SelSQL = "update tblmoney set dmoney=" & dMoney & " where dname='" & txtNamePay.Text & "'"
        Set Rs = ADO.execute(SelSQL)
        If Not txtSolfa.Text = 0 Then
            SelSQL = "insert into tblguest (dname,dmat,dpay,drest,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & "œ›⁄… ⁄·Ï «·Õ”«»" & "'," & txtSolfa.Text & ",0," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
            Set Rs = ADO.execute(SelSQL)
        End If

End If
If txtResualt.Text <> 0 Then Set Rs = ADO.execute("insert into tblout (dname,dprice,ddes,dday,dmonth,dyear) values ('" & txtNamePay.Text & "'," & CDbl(txtResualt.Text) - CDbl(txtPay.Text) & ",'" & "Õ”„ ›« Ê—… ··”Ìœ " & txtNamePay.Text & "'," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")")
cmdClear_Click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub

Private Sub cmdShowAccount_Click()
    thisAccount = cmbCost.Text
    frmGuest.Show
    frmEnterMany.Hide
End Sub

Private Sub cmdSold_Click()
    PlusValues
    If txtPay.Text = 1 Then Exit Sub
    If cmbSold.ListIndex = 0 Then
        txtPay.Text = Int(txtResualt.Text) - Int((txtResualt.Text) * Int(txtSold)) / 100
    Else
        txtPay.Text = txtResualt.Text - txtSold
    End If
    If txtPay.Text <= 0 Then txtPay = 0
End Sub

Private Sub Command1_Click()
    frmEnterMany.Hide
    frmPrint.Show
End Sub

Private Sub Form_Load()
On Error Resume Next
'connecting : for database
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    
    
'istablishing : default value for this form
   For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    
    For Rep = 0 To 27
    TxtPrice(Rep).Visible = False
    txtSPrice(Rep).Visible = False
    txtNum(Rep).Visible = False
    txtCommon(Rep).Visible = False
    txtDes(Rep).Visible = False
    Next Rep
    cmbCost.ListIndex = 0
    
'filling : fill combo & list from database with tblkind
    Rep = 1
    SelSQL = "select dgroub from tblkind group by dgroub"
    Set Rs = ADO.execute(SelSQL)
    txtGroub.List(0) = "«·ﬂ·"
    Do While Not Rs.EOF
        txtGroub.List(Rep) = Rs("dgroub")
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    SelSQL = "select * from tblkind order by dname"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    On Error Resume Next
    Do While Not Rs.EOF
        arrKLot(Rep) = Rs("dlot")
        arrKSP(Rep) = Rs("dprice")
        arrKSPall(Rep) = Rs("dpriceall")
        lstKind.List(Rep) = Rs("dname")
        cmbKind.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop

'filling : fill combo from database with tblmoney
         Dim intThis As Integer
        intThis = cmbCost.ListIndex
        Rep = 2
        cmbCost.List(0) = "“»Ê‰ ⁄«»—"
        cmbCost.List(1) = "“»Ê‰ ÃœÌœ"
        SelSQL = "select * from tblmoney order by dname"
        Set Rs = ADO.execute(SelSQL)
        Do While Not Rs.EOF
            cmbCost.List(Rep) = Rs("dname")
            Rep = Rep + 1
            Rs.movenext
        Loop
        cmbCost.ListIndex = intThis
        
'Collect Values : take texts ( tabel ) position value
    For Rep = 0 To 27
        Pos1(Rep) = txtDes(Rep).Top
        Pos2(Rep) = TxtPrice(Rep).Top
        Pos3(Rep) = txtSPrice(Rep).Top
        Pos4(Rep) = txtNum(Rep).Top
        Pos5(Rep) = txtCommon(Rep).Top
    Next Rep
    
'Plus of Pay down
    SelSQL = "select * from tblguest"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        txtDain.Text = txtDain.Text + CDbl(Rs("drest")) - CDbl(Rs("dpay"))
        Rs.movenext
    Loop
End Sub

Private Sub lstKind_Click()
    txtLotRest.Text = arrKLot(lstKind.ListIndex)
    txtSNPrice.Text = arrKSP(lstKind.ListIndex)
End Sub

Private Sub lstKind_DblClick()
    If bytRec >= 27 Then
        MsgBox " „ ‰›«– «·ÕﬁÊ· «·„ÊÃÊœ… , «·—Ã«¡ ≈œŒ«· «·›« Ê—… , À„ ﬁ„ »≈œŒ«· »ﬁÌ… «·»Ì«‰« ", vbOKOnly + vbInformation, "„⁄«·Ã ≈œŒ«· «·»Ì«‰« "
        Exit Sub
    End If
    txtDes(bytRec).Text = lstKind.Text
    txtSPrice(bytRec).Text = arrKSPall(lstKind.ListIndex)
    darrKSP(bytRec) = arrKSP(lstKind.ListIndex)
    darrKLot(bytRec) = arrKLot(lstKind.ListIndex)
    txtLotRest.Text = arrKLot(lstKind.ListIndex)
    txtNum(bytRec).Text = 1
    txtDes(bytRec).Visible = True
    TxtPrice(bytRec).Visible = True
    txtSPrice(bytRec).Visible = True
    txtNum(bytRec).Visible = True
    txtCommon(bytRec).Visible = True
    bytRec = bytRec + 1
    If bytRec > 11 And bytRec < 28 Then
        VScroll.Visible = True
        VScroll.Max = VScroll.Max + 1
        VScroll.Value = VScroll.Value + 1
    End If
    
    'controlling : change other controls property
        cmdEnter.Enabled = True
        cmdClear.Enabled = True
        cmdSold.Enabled = True
End Sub

Private Sub lstKind_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then lstKind_DblClick
End Sub

Private Sub txtGroub_Click()
    On Error Resume Next
    If txtGroub.ListIndex = 0 Then
        Set Rs = ADO.execute("select * from tblkind order by dname")
        For Rep = 0 To 10000
            arrKLot(Rep) = 0
            arrKSP(Rep) = 0
        Next Rep
        Rep = 0
        lstKind.Clear
        cmbKind.Clear
        Do While Not Rs.EOF
            lstKind.List(Rep) = Rs("dname")
            cmbKind.List(Rep) = Rs("dname")
            arrKLot(Rep) = Rs("dlot")
            arrKSP(Rep) = Rs("dprice")
            Rep = Rep + 1
            Rs.movenext
        Loop
    Else
        Set Rs = ADO.execute("select * from tblkind where dgroub='" & txtGroub.Text & "' order by dname")
            For Rep = 0 To 10000
                arrKLot(Rep) = 0
                arrKSP(Rep) = 0
            Next Rep
            Rep = 0
            lstKind.Clear
            cmbKind.Clear
            Do While Not Rs.EOF
            arrKLot(Rep) = Rs("dlot")
            arrKSP(Rep) = Rs("dprice")
            arrKSPall(Rep) = Rs("dpriceall")
            lstKind.List(Rep) = Rs("dname")
            cmbKind.List(Rep) = Rs("dname")
            Rep = Rep + 1
            Rs.movenext
        Loop
    End If
End Sub

Private Sub txtNum_Change(Index As Integer)
    If IsNumeric(txtSPrice(Index).Text) = True And IsNumeric(txtNum(Index).Text) = True Then TxtPrice(Index).Text = CDbl(txtSPrice(Index).Text * txtNum(Index).Text)
    txtPay.Text = 0
    For Rep = 0 To bytRec
        txtPay.Text = txtPay.Text + Val(TxtPrice(Rep).Text)
        txtResualt.Text = txtPay.Text
    Next Rep
End Sub

Private Sub txtSPrice_Change(Index As Integer)
    If IsNumeric(txtSPrice(Index).Text) = True And IsNumeric(txtNum(Index).Text) = True Then TxtPrice(Index).Text = CDbl(txtSPrice(Index).Text * txtNum(Index).Text)
    txtPay.Text = 0
    For Rep = 0 To bytRec
        txtPay.Text = txtPay.Text + Val(TxtPrice(Rep).Text)
        txtResualt.Text = txtPay.Text
    Next Rep
End Sub

Private Sub VScroll_Change()
    For Rep = 0 To bytRec
        txtDes(Rep).Top = Pos1(Rep) - 360 * VScroll.Value
        TxtPrice(Rep).Top = Pos2(Rep) - 360 * VScroll.Value
        txtSPrice(Rep).Top = Pos3(Rep) - 360 * VScroll.Value
        txtNum(Rep).Top = Pos4(Rep) - 360 * VScroll.Value
        txtCommon(Rep).Top = Pos5(Rep) - 360 * VScroll.Value
    Next Rep
End Sub

Private Sub VScroll_Scroll()
    VScroll_Change
End Sub
