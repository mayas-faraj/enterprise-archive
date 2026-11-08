VERSION 5.00
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
      Height          =   2055
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   9600
      Width           =   10935
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
         TabIndex        =   15
         Tag             =   "0"
         Top             =   600
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
         TabIndex        =   14
         Tag             =   "0"
         Top             =   960
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
         Height          =   555
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   "0"
         Top             =   240
         Width           =   2175
      End
      Begin VB.Line Line2 
         BorderWidth     =   3
         Tag             =   "0"
         X1              =   10440
         X2              =   120
         Y1              =   1440
         Y2              =   1440
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
         TabIndex        =   20
         Tag             =   "0"
         Top             =   1560
         Width           =   12135
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   "0"
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·Õ”„"
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   "0"
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·’«›Ì"
         Height          =   375
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   "0"
         Top             =   960
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   975
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   3960
      Width           =   2415
   End
   Begin VB.TextBox txtNum 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   1080
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   840
      Width           =   2175
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "ÿ»«⁄…"
      Height          =   1005
      Left            =   12240
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   2760
      Width           =   2415
   End
   Begin VB.TextBox txtName 
      Alignment       =   1  'Right Justify
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
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1440
      Width           =   3015
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      ItemData        =   "frmPrint.frx":0000
      Left            =   3600
      List            =   "frmPrint.frx":0010
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Text            =   "··œÂ«‰« "
      Top             =   240
      Width           =   2775
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   27
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   165
      Top             =   9240
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   27
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   164
      Top             =   9240
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   27
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   163
      Top             =   9240
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   27
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   162
      Top             =   9240
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   27
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   161
      Top             =   9240
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   26
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   160
      Top             =   9000
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   26
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   159
      Top             =   9000
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   26
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   158
      Top             =   9000
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   26
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   157
      Top             =   9000
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   26
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   156
      Top             =   9000
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   25
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   155
      Top             =   8760
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   25
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   154
      Top             =   8760
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   25
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   153
      Top             =   8760
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   25
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   152
      Top             =   8760
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   25
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   151
      Top             =   8760
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   24
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   150
      Top             =   8520
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   24
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   149
      Top             =   8520
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   24
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   148
      Top             =   8520
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   24
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   147
      Top             =   8520
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   24
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   146
      Top             =   8520
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   23
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   145
      Top             =   8280
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   23
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   144
      Top             =   8280
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   23
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   143
      Top             =   8280
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   23
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   142
      Top             =   8280
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   23
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   141
      Top             =   8280
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   22
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   140
      Top             =   8040
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   22
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   139
      Top             =   8040
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   22
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   138
      Top             =   8040
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   22
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   137
      Top             =   8040
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   22
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   136
      Top             =   8040
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   21
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   135
      Top             =   7800
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   21
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   134
      Top             =   7800
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   21
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   133
      Top             =   7800
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   21
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   132
      Top             =   7800
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   21
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   131
      Top             =   7800
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   20
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   130
      Top             =   7560
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   20
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   129
      Top             =   7560
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   20
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   128
      Top             =   7560
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   20
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   127
      Top             =   7560
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   20
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   126
      Top             =   7560
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   19
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   125
      Top             =   7320
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   19
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   124
      Top             =   7320
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   19
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   123
      Top             =   7320
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   19
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   122
      Top             =   7320
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   19
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   121
      Top             =   7320
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   18
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   120
      Top             =   7080
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   18
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   119
      Top             =   7080
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   18
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   118
      Top             =   7080
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   18
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   117
      Top             =   7080
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   18
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   116
      Top             =   7080
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   17
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   115
      Top             =   6840
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   17
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   114
      Top             =   6840
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   17
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   113
      Top             =   6840
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   17
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   112
      Top             =   6840
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   17
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   111
      Top             =   6840
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   16
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   110
      Top             =   6600
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   16
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   109
      Top             =   6600
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   16
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   108
      Top             =   6600
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   16
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   107
      Top             =   6600
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   16
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   106
      Top             =   6600
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   15
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   105
      Top             =   6360
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   15
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   104
      Top             =   6360
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   15
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   103
      Top             =   6360
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   15
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   102
      Top             =   6360
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   15
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   101
      Top             =   6360
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   14
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   100
      Top             =   6120
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   14
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   99
      Top             =   6120
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   14
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   98
      Top             =   6120
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   14
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   97
      Top             =   6120
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   14
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   96
      Top             =   6120
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   13
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   95
      Top             =   5880
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   13
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   94
      Top             =   5880
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   13
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   93
      Top             =   5880
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   13
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   92
      Top             =   5880
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   13
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   91
      Top             =   5880
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   12
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   90
      Top             =   5640
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   12
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   89
      Top             =   5640
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   12
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   88
      Top             =   5640
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   12
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   87
      Top             =   5640
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   12
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   86
      Top             =   5640
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   11
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   85
      Top             =   5400
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   11
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   84
      Top             =   5400
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   11
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   83
      Top             =   5400
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   11
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   82
      Top             =   5400
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   11
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   81
      Top             =   5400
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   10
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   80
      Top             =   5160
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   10
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   79
      Top             =   5160
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   10
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   78
      Top             =   5160
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   10
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   77
      Top             =   5160
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   10
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   76
      Top             =   5160
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   9
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   75
      Top             =   4920
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   9
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   74
      Top             =   4920
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   9
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   73
      Top             =   4920
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   9
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   72
      Top             =   4920
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   9
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   71
      Top             =   4920
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   8
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   70
      Top             =   4680
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   8
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   69
      Top             =   4680
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   8
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   68
      Top             =   4680
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   8
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   67
      Top             =   4680
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   8
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   66
      Top             =   4680
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   7
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   65
      Top             =   4440
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   7
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   64
      Top             =   4440
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   7
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   63
      Top             =   4440
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   7
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   62
      Top             =   4440
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   7
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   61
      Top             =   4440
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   60
      Top             =   4200
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   59
      Top             =   4200
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   58
      Top             =   4200
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   57
      Top             =   4200
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   56
      Top             =   4200
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   55
      Top             =   3960
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   54
      Top             =   3960
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   53
      Top             =   3960
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   52
      Top             =   3960
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   51
      Top             =   3960
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   50
      Top             =   3720
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   49
      Top             =   3720
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   48
      Top             =   3720
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   47
      Top             =   3720
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   46
      Top             =   3720
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   45
      Top             =   3480
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   44
      Top             =   3480
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   43
      Top             =   3480
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   42
      Top             =   3480
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Top             =   3480
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Top             =   3240
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Top             =   3240
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Top             =   3240
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Top             =   3240
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Top             =   3240
      Width           =   1665
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   3000
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   3000
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   3000
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   3000
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   3000
      Width           =   1665
   End
   Begin VB.Label LblName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·”⁄— «·≈Ã„«·Ì"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   9360
      TabIndex        =   30
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Label LblName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·»‹Ì‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹«‰"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   5280
      TabIndex        =   29
      Top             =   2280
      Width           =   4095
   End
   Begin VB.Label LblName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·⁄œœ"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   3600
      TabIndex        =   28
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Label LblName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·”⁄— «·≈›—«œÌ"
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   1920
      TabIndex        =   27
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Label LblName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "„·«ÕŸ« "
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   240
      TabIndex        =   26
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Label lblCommon 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   2760
      Width           =   1665
   End
   Begin VB.Label lblSPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   2760
      Width           =   1665
   End
   Begin VB.Label lblLot 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   3615
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   2760
      Width           =   1650
   End
   Begin VB.Label lblDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   2760
      Width           =   4065
   End
   Begin VB.Label lblPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   9390
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   2760
      Width           =   1665
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
      TabIndex        =   10
      Top             =   960
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
      TabIndex        =   9
      Top             =   960
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
      Top             =   1440
      Width           =   4455
   End
   Begin VB.Label lblKind 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
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
      Top             =   1440
      Width           =   1575
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   10920
      X2              =   360
      Y1              =   2160
      Y2              =   2160
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
      Top             =   1440
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
      Top             =   1440
      Width           =   2655
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«· Ê›Ìﬁ"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
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
    TxtPrice.Text = TxtPrice.Text & " ·.”"
    txtSold.Text = txtSold.Text & " ·.”"
    txtResualt.Text = txtResualt.Text & " ·.”"
    cmbKind.Visible = False
    txtName.Visible = False
    txtNum.Visible = False
    If frmEnterMany.txtSold.Text = 0 Then
        txtSold.Visible = False
        txtResualt.Visible = False
        Label11.Visible = False
        Label12.Visible = False
    End If
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
    lblDate.Caption = " " & frmEnterMany.cmbDay.Text & " / " & frmEnterMany.cmbMonth.Text & " / " & frmEnterMany.cmbYear.Text & " "
    txtResualt.Text = frmEnterMany.txtPay.Text
    txtSold.Text = frmEnterMany.txtSold.Text & " " & frmEnterMany.cmbSold.Text
    TxtPrice.Text = frmEnterMany.txtResualt.Text
    
'filling : fill the grid
    For Rep = 0 To bytRec - 1
        lblPrice(Rep).Visible = True
        lblDes(Rep).Visible = True
        lblLot(Rep).Visible = True
        lblSPrice(Rep).Visible = True
        lblCommon(Rep).Visible = True
        
        lblPrice(Rep).Caption = frmEnterMany.TxtPrice(Rep)
        lblDes(Rep).Caption = frmEnterMany.txtDes(Rep)
        lblLot(Rep).Caption = frmEnterMany.txtSPrice(Rep)
        lblSPrice(Rep).Caption = frmEnterMany.txtNum(Rep)
        lblCommon(Rep).Caption = frmEnterMany.txtCommon(Rep)
    Next Rep
    txtName.Text = frmEnterMany.txtNamePay.Text & " «·„Õ —„"
    fraRes.Top = lblPrice(Rep).Top + 300
End Sub
