VERSION 5.00
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
      Left            =   7320
      RightToLeft     =   -1  'True
      TabIndex        =   180
      Top             =   10560
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.TextBox txtName 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   6960
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   960
      Width           =   2415
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
      Left            =   4440
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   960
      Width           =   1095
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
      TabIndex        =   182
      Top             =   10560
      Visible         =   0   'False
      Width           =   1575
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
      Left            =   7200
      RightToLeft     =   -1  'True
      TabIndex        =   181
      Top             =   10560
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label LblName1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·”⁄— «·≈›—«œÌ"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   4560
      TabIndex        =   15
      Top             =   1800
      Width           =   1425
   End
   Begin VB.Label LblName1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·⁄œœ"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   5880
      TabIndex        =   14
      Top             =   1800
      Width           =   1005
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   4560
      TabIndex        =   22
      Top             =   2160
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   5880
      TabIndex        =   21
      Top             =   2160
      Width           =   1005
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   360
      TabIndex        =   179
      Top             =   10080
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   1920
      TabIndex        =   178
      Top             =   10080
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   3120
      TabIndex        =   177
      Top             =   10080
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   4560
      TabIndex        =   176
      Top             =   10080
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   5880
      TabIndex        =   175
      Top             =   10080
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   6840
      TabIndex        =   174
      Top             =   10080
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   22
      Left            =   9240
      TabIndex        =   173
      Top             =   10080
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   360
      TabIndex        =   172
      Top             =   9720
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   1920
      TabIndex        =   171
      Top             =   9720
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   3120
      TabIndex        =   170
      Top             =   9720
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   4560
      TabIndex        =   169
      Top             =   9720
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   5880
      TabIndex        =   168
      Top             =   9720
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   6840
      TabIndex        =   167
      Top             =   9720
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   21
      Left            =   9240
      TabIndex        =   166
      Top             =   9720
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   360
      TabIndex        =   165
      Top             =   9360
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   1920
      TabIndex        =   164
      Top             =   9360
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   3120
      TabIndex        =   163
      Top             =   9360
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   4560
      TabIndex        =   162
      Top             =   9360
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   5880
      TabIndex        =   161
      Top             =   9360
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   6840
      TabIndex        =   160
      Top             =   9360
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   20
      Left            =   9240
      TabIndex        =   159
      Top             =   9360
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   360
      TabIndex        =   158
      Top             =   9000
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   1920
      TabIndex        =   157
      Top             =   9000
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   3120
      TabIndex        =   156
      Top             =   9000
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   4560
      TabIndex        =   155
      Top             =   9000
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   5880
      TabIndex        =   154
      Top             =   9000
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   6840
      TabIndex        =   153
      Top             =   9000
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   19
      Left            =   9240
      TabIndex        =   152
      Top             =   9000
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   360
      TabIndex        =   151
      Top             =   8640
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   1920
      TabIndex        =   150
      Top             =   8640
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   3120
      TabIndex        =   149
      Top             =   8640
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   4560
      TabIndex        =   148
      Top             =   8640
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   5880
      TabIndex        =   147
      Top             =   8640
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   6840
      TabIndex        =   146
      Top             =   8640
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   18
      Left            =   9240
      TabIndex        =   145
      Top             =   8640
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   360
      TabIndex        =   144
      Top             =   8280
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   1920
      TabIndex        =   143
      Top             =   8280
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   3120
      TabIndex        =   142
      Top             =   8280
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   4560
      TabIndex        =   141
      Top             =   8280
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   5880
      TabIndex        =   140
      Top             =   8280
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   6840
      TabIndex        =   139
      Top             =   8280
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   17
      Left            =   9240
      TabIndex        =   138
      Top             =   8280
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   360
      TabIndex        =   137
      Top             =   7920
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   1920
      TabIndex        =   136
      Top             =   7920
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   3120
      TabIndex        =   135
      Top             =   7920
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   4560
      TabIndex        =   134
      Top             =   7920
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   5880
      TabIndex        =   133
      Top             =   7920
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   6840
      TabIndex        =   132
      Top             =   7920
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   16
      Left            =   9240
      TabIndex        =   131
      Top             =   7920
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   360
      TabIndex        =   130
      Top             =   7560
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   1920
      TabIndex        =   129
      Top             =   7560
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   3120
      TabIndex        =   128
      Top             =   7560
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   4560
      TabIndex        =   127
      Top             =   7560
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   5880
      TabIndex        =   126
      Top             =   7560
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   6840
      TabIndex        =   125
      Top             =   7560
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   15
      Left            =   9240
      TabIndex        =   124
      Top             =   7560
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   360
      TabIndex        =   123
      Top             =   7200
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   1920
      TabIndex        =   122
      Top             =   7200
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   3120
      TabIndex        =   121
      Top             =   7200
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   4560
      TabIndex        =   120
      Top             =   7200
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   5880
      TabIndex        =   119
      Top             =   7200
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   6840
      TabIndex        =   118
      Top             =   7200
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   14
      Left            =   9240
      TabIndex        =   117
      Top             =   7200
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   360
      TabIndex        =   116
      Top             =   6840
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   1920
      TabIndex        =   115
      Top             =   6840
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   3120
      TabIndex        =   114
      Top             =   6840
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   4560
      TabIndex        =   113
      Top             =   6840
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   5880
      TabIndex        =   112
      Top             =   6840
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   6840
      TabIndex        =   111
      Top             =   6840
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   13
      Left            =   9240
      TabIndex        =   110
      Top             =   6840
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   360
      TabIndex        =   109
      Top             =   6480
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   1920
      TabIndex        =   108
      Top             =   6480
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   3120
      TabIndex        =   107
      Top             =   6480
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   4560
      TabIndex        =   106
      Top             =   6480
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   5880
      TabIndex        =   105
      Top             =   6480
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   6840
      TabIndex        =   104
      Top             =   6480
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   9240
      TabIndex        =   103
      Top             =   6480
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   360
      TabIndex        =   102
      Top             =   6120
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   1920
      TabIndex        =   101
      Top             =   6120
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   3120
      TabIndex        =   100
      Top             =   6120
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   4560
      TabIndex        =   99
      Top             =   6120
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   5880
      TabIndex        =   98
      Top             =   6120
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   6840
      TabIndex        =   97
      Top             =   6120
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   9240
      TabIndex        =   96
      Top             =   6120
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   360
      TabIndex        =   95
      Top             =   5760
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   1920
      TabIndex        =   94
      Top             =   5760
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   3120
      TabIndex        =   93
      Top             =   5760
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   4560
      TabIndex        =   92
      Top             =   5760
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   5880
      TabIndex        =   91
      Top             =   5760
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   6840
      TabIndex        =   90
      Top             =   5760
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   9240
      TabIndex        =   89
      Top             =   5760
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   360
      TabIndex        =   88
      Top             =   5400
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   1920
      TabIndex        =   87
      Top             =   5400
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   3120
      TabIndex        =   86
      Top             =   5400
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   4560
      TabIndex        =   85
      Top             =   5400
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   5880
      TabIndex        =   84
      Top             =   5400
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   6840
      TabIndex        =   83
      Top             =   5400
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   9240
      TabIndex        =   82
      Top             =   5400
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   360
      TabIndex        =   81
      Top             =   5040
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   1920
      TabIndex        =   80
      Top             =   5040
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   3120
      TabIndex        =   79
      Top             =   5040
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   4560
      TabIndex        =   78
      Top             =   5040
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   5880
      TabIndex        =   77
      Top             =   5040
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   6840
      TabIndex        =   76
      Top             =   5040
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   9240
      TabIndex        =   75
      Top             =   5040
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   360
      TabIndex        =   74
      Top             =   4680
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   1920
      TabIndex        =   73
      Top             =   4680
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   3120
      TabIndex        =   72
      Top             =   4680
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   4560
      TabIndex        =   71
      Top             =   4680
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   5880
      TabIndex        =   70
      Top             =   4680
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   6840
      TabIndex        =   69
      Top             =   4680
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   9240
      TabIndex        =   68
      Top             =   4680
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   360
      TabIndex        =   67
      Top             =   4320
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   1920
      TabIndex        =   66
      Top             =   4320
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   3120
      TabIndex        =   65
      Top             =   4320
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   4560
      TabIndex        =   64
      Top             =   4320
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   5880
      TabIndex        =   63
      Top             =   4320
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   6840
      TabIndex        =   62
      Top             =   4320
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   9240
      TabIndex        =   61
      Top             =   4320
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   360
      TabIndex        =   60
      Top             =   3960
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   1920
      TabIndex        =   59
      Top             =   3960
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   3120
      TabIndex        =   58
      Top             =   3960
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   4560
      TabIndex        =   57
      Top             =   3960
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   5880
      TabIndex        =   56
      Top             =   3960
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   6840
      TabIndex        =   55
      Top             =   3960
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   9240
      TabIndex        =   54
      Top             =   3960
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   360
      TabIndex        =   53
      Top             =   3600
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   1920
      TabIndex        =   52
      Top             =   3600
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   3120
      TabIndex        =   51
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   4560
      TabIndex        =   50
      Top             =   3600
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   5880
      TabIndex        =   49
      Top             =   3600
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   6840
      TabIndex        =   48
      Top             =   3600
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   9240
      TabIndex        =   47
      Top             =   3600
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   360
      TabIndex        =   46
      Top             =   3240
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   1920
      TabIndex        =   45
      Top             =   3240
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   3120
      TabIndex        =   44
      Top             =   3240
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   4560
      TabIndex        =   43
      Top             =   3240
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   5880
      TabIndex        =   42
      Top             =   3240
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   6840
      TabIndex        =   41
      Top             =   3240
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   9240
      TabIndex        =   40
      Top             =   3240
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   360
      TabIndex        =   39
      Top             =   2880
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   1920
      TabIndex        =   38
      Top             =   2880
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   3120
      TabIndex        =   37
      Top             =   2880
      Width           =   1455
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   4560
      TabIndex        =   36
      Top             =   2880
      Width           =   1425
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   5880
      TabIndex        =   35
      Top             =   2880
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   6840
      TabIndex        =   34
      Top             =   2880
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   9240
      TabIndex        =   33
      Top             =   2880
      Width           =   1740
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   360
      TabIndex        =   32
      Top             =   2520
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   1920
      TabIndex        =   31
      Top             =   2520
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   3120
      TabIndex        =   30
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Label txtDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   360
      TabIndex        =   25
      Top             =   2160
      Width           =   1605
   End
   Begin VB.Label txtRest 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   1920
      TabIndex        =   24
      Top             =   2160
      Width           =   1245
   End
   Begin VB.Label txtPay 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   3120
      TabIndex        =   23
      Top             =   2160
      Width           =   1455
   End
   Begin VB.Label LblName1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«· «—ÌŒ"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   360
      TabIndex        =   18
      Top             =   1800
      Width           =   1605
   End
   Begin VB.Label LblName1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·»«ﬁÌ"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   1920
      TabIndex        =   17
      Top             =   1800
      Width           =   1245
   End
   Begin VB.Label LblName1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·„œ›Ê⁄"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   3120
      TabIndex        =   16
      Top             =   1800
      Width           =   1455
   End
   Begin VB.Label LblName1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·»Ì«‰"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   6840
      TabIndex        =   13
      Top             =   1800
      Width           =   2505
   End
   Begin VB.Label txtPrice1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·”⁄— «·≈Ã„«·Ì"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   9240
      TabIndex        =   12
      Top             =   1800
      Width           =   1740
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
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
      Left            =   600
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   480
      Width           =   9855
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
      TabIndex        =   8
      Top             =   0
      Width           =   4095
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   10920
      X2              =   360
      Y1              =   1560
      Y2              =   1560
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
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   960
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
      Left            =   6600
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   960
      Width           =   2775
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
      Left            =   4440
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   960
      Width           =   975
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
      Left            =   5640
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   960
      Width           =   975
   End
   Begin VB.Label txtSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   4560
      TabIndex        =   29
      Top             =   2520
      Width           =   1425
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
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
      TabIndex        =   10
      Top             =   120
      Width           =   1455
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
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
      TabIndex        =   11
      Top             =   120
      Width           =   1455
   End
   Begin VB.Label TxtLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   5880
      TabIndex        =   28
      Top             =   2520
      Width           =   1005
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   6840
      TabIndex        =   27
      Top             =   2520
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   9240
      TabIndex        =   26
      Top             =   2520
      Width           =   1740
   End
   Begin VB.Label txtDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   6840
      TabIndex        =   20
      Top             =   2160
      Width           =   2505
   End
   Begin VB.Label txtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   9240
      TabIndex        =   19
      Top             =   2160
      Width           =   1740
   End
End
Attribute VB_Name = "frmGPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim PageNo As Integer
Private Sub cmdBack_Click()
    frmGPrint.Hide
    frmGuest.Show
End Sub

Private Sub cmdPrint_Click()
    Dim Last As Integer, RepII As Integer, RepIII As Integer
    cmdPrint.Visible = False
    cmdBack.Visible = False
    cmbName.Caption = txtName.Text
    lblNum.Caption = txtNum.Text
    lblPure.Caption = txtPure.Text
    txtName.Visible = False
    txtNum.Visible = False
    blnPrint = True
    SaveSetting "interdiv", "internet", "i394", idNum + 1
    '
    PageNo = CInt(PrintNum \ 23)
    txtPure.Text = frmGuest.txtEnd.Text & " ·.”"
    
    For RepII = 0 To PageNo
    If RepII = PageNo Then
        Last = PrintNum - (PageNo * 23)
        Label6.Visible = True
        lblPure.Visible = True
        txtPure.Visible = True
        Label6.Top = txtRest(PrintNum - (PageNo * 23)).Top + 600
        lblPure.Top = txtRest(PrintNum - (PageNo * 23)).Top + 600
        txtPure.Top = txtRest(PrintNum - (PageNo * 23)).Top + 600
    Else
        Last = 22
    End If
    For Rep = 0 To Last
        txtDate(Rep).Visible = True
        txtDes(Rep).Visible = True
        txtPrice(Rep).Visible = True
        txtLot(Rep).Visible = True
        txtSPrice(Rep).Visible = True
        txtPay(Rep).Visible = True
        txtRest(Rep).Visible = True
        txtDate(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 0)
        txtDes(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 2)
        txtPrice(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 1)
        txtLot(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 3)
        txtSPrice(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 4)
        txtPay(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 5)
        txtRest(Rep).Caption = frmGuest.grData.TextMatrix(Rep + (RepII * 23) + 1, 6)
    Next Rep
    
    frmGPrint.PrintForm
    For Rep = 0 To 22
        txtDate(Rep).Visible = False
        txtDes(Rep).Visible = False
        txtPrice(Rep).Visible = False
        txtLot(Rep).Visible = False
        txtSPrice(Rep).Visible = False
        txtPay(Rep).Visible = False
        txtRest(Rep).Visible = False
    Next Rep
    Next RepII
    '
    cmdPrint.Visible = True
    cmdBack.Visible = True
    txtName.Visible = True
    txtNum.Visible = True
    cmbName.Caption = ""
    lblNum.Caption = ""
    Label6.Visible = False
    lblPure.Visible = False
    txtPure.Visible = False
    For Rep = 0 To 22
        txtDate(Rep).Visible = False
        txtDes(Rep).Visible = False
        txtPrice(Rep).Visible = False
        txtLot(Rep).Visible = False
        txtSPrice(Rep).Visible = False
        txtPay(Rep).Visible = False
        txtRest(Rep).Visible = False
    Next Rep
    cmdBack_Click
End Sub

Private Sub Form_Activate()
    Form_Load
End Sub

Private Sub Form_Load()
'put control default value
    Dim LastValue As Integer
    For Rep = 0 To 22
        txtDate(Rep).Visible = False
        txtDes(Rep).Visible = False
        txtPrice(Rep).Visible = False
        txtLot(Rep).Visible = False
        txtSPrice(Rep).Visible = False
        txtPay(Rep).Visible = False
        txtRest(Rep).Visible = False
    Next Rep
    idNum = GetSetting("interdiv", "internet", "i394", 0)
    txtNum = idNum
    
    LastValue = PrintNum
    If PrintNum > 22 Then LastValue = 22
    For Rep = 0 To LastValue
        txtDate(Rep).Visible = True
        txtDes(Rep).Visible = True
        txtPrice(Rep).Visible = True
        txtLot(Rep).Visible = True
        txtSPrice(Rep).Visible = True
        txtPay(Rep).Visible = True
        txtRest(Rep).Visible = True
        txtDate(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 0)
        txtDes(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 2)
        txtPrice(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 1)
        txtLot(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 3)
        txtSPrice(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 4)
        txtPay(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 5)
        txtRest(Rep).Caption = frmGuest.grData.TextMatrix(Rep + 1, 6)
    Next Rep

    txtName.Text = frmGuest.lstSeller.Text & " «·„Õ —„"
    
End Sub

Private Sub LblName_Click(Index As Integer)

End Sub
