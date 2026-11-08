VERSION 5.00
Begin VB.Form frmPrint 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Form1"
   ClientHeight    =   11010
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
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   21
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   139
      Top             =   10080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   21
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   138
      Top             =   10080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   21
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   137
      Top             =   10080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   21
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   136
      Top             =   10080
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   21
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   135
      Top             =   10080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   20
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   134
      Top             =   9720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   20
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   133
      Top             =   9720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   20
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   132
      Top             =   9720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   20
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   131
      Top             =   9720
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   20
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   130
      Top             =   9720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   19
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   129
      Top             =   9360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   19
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   128
      Top             =   9360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   19
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   127
      Top             =   9360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   19
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   126
      Top             =   9360
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   19
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   125
      Top             =   9360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   18
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   124
      Top             =   9000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   18
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   123
      Top             =   9000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   18
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   122
      Top             =   9000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   18
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   121
      Top             =   9000
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   18
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   120
      Top             =   9000
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   17
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   119
      Top             =   8640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   17
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   118
      Top             =   8640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   17
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   117
      Top             =   8640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   17
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   116
      Top             =   8640
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   17
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   115
      Top             =   8640
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   16
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   114
      Top             =   8280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   16
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   113
      Top             =   8280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   16
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   112
      Top             =   8280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   16
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   111
      Top             =   8280
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   16
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   110
      Top             =   8280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   15
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   109
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   15
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   108
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   15
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   107
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   15
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   106
      Top             =   7920
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   15
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   105
      Top             =   7920
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   14
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   104
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   14
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   103
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   14
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   102
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   14
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   101
      Top             =   7560
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   14
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   100
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   13
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   99
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   13
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   98
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   13
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   97
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   13
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   96
      Top             =   7200
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   13
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   95
      Top             =   7200
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   12
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   94
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   12
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   93
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   12
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   92
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   12
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   91
      Top             =   6840
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   12
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   90
      Top             =   6840
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   11
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   89
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   11
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   88
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   11
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   87
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   11
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   86
      Top             =   6480
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   11
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   85
      Top             =   6480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   10
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   84
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   10
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   83
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   10
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   82
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   10
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   81
      Top             =   6120
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   10
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   80
      Top             =   6120
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   9
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   79
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   9
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   78
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   9
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   77
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   9
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   76
      Top             =   5760
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   9
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   75
      Top             =   5760
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   8
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   74
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   8
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   73
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   8
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   72
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   8
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   71
      Top             =   5400
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   8
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   70
      Top             =   5400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   7
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   69
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   7
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   68
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   7
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   67
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   7
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   66
      Top             =   5040
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   7
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   65
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   6
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   64
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   6
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   63
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   6
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   62
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   6
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   61
      Top             =   4680
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   6
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   60
      Top             =   4680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   5
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   59
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   5
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   58
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   5
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   57
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   5
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   56
      Top             =   4320
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   5
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   55
      Top             =   4320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   4
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   54
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   4
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   53
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   4
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   52
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   4
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   51
      Top             =   3960
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   4
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   50
      Top             =   3960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   3
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   49
      Top             =   3600
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   3
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   48
      Top             =   3600
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   3
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   47
      Top             =   3600
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   3
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   46
      Top             =   3600
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   3
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   45
      Top             =   3600
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   2
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   44
      Top             =   3240
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   2
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   43
      Top             =   3240
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   2
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   42
      Top             =   3240
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   2
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Top             =   3240
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   2
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Top             =   3240
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   1
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Top             =   2880
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   1
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Top             =   2880
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   1
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Top             =   2880
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   1
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Top             =   2880
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   1
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   2880
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblCommon 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   0
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   2520
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblSPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   0
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   2520
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblLot 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   0
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   2520
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.TextBox lblDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   0
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   2520
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.TextBox lblPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   405
      Index           =   0
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   2520
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Frame fraRes 
      BackColor       =   &H00FFFFFF&
      Height          =   2055
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   10440
      Width           =   10935
      Begin VB.TextBox txtAll 
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
         Height          =   420
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Tag             =   "0"
         Top             =   600
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.TextBox txtLast 
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
         Height          =   420
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Tag             =   "0"
         Top             =   240
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.TextBox txtPrice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   435
         Left            =   9120
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   "0"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtSold 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   9120
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   "0"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtResualt 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   360
         Left            =   9120
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   "0"
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·—’Ìœ «·Õ«·Ì"
         Height          =   375
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Tag             =   "0"
         Top             =   600
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·—’Ìœ «·”«»ﬁ"
         Height          =   375
         Left            =   2640
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Tag             =   "0"
         Top             =   240
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·’«›Ì"
         Height          =   375
         Left            =   7680
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   "0"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·Õ”„"
         Height          =   375
         Left            =   7680
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Tag             =   "0"
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "«·„Ã„Ê⁄"
         Height          =   375
         Left            =   7680
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   "0"
         Top             =   240
         Width           =   1095
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
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   "0"
         Top             =   1560
         Width           =   10215
      End
      Begin VB.Line Line2 
         BorderWidth     =   3
         Tag             =   "0"
         X1              =   10440
         X2              =   120
         Y1              =   1440
         Y2              =   1440
      End
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
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
      Height          =   360
      Left            =   1080
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   960
      Width           =   2175
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "ÿ»«⁄…"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
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
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   885
      ItemData        =   "frmPrintII.frx":0000
      Left            =   3480
      List            =   "frmPrintII.frx":0010
      TabIndex        =   1
      Text            =   " ··œÂ«‰« "
      Top             =   0
      Width           =   2775
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
      TabIndex        =   25
      Top             =   2160
      Width           =   1695
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
      TabIndex        =   16
      Top             =   2160
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
      TabIndex        =   15
      Top             =   2160
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
      TabIndex        =   14
      Top             =   2160
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
      TabIndex        =   13
      Top             =   2160
      Width           =   1695
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
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1860
      TabIndex        =   5
      Top             =   0
      Width           =   4455
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
      Y1              =   2040
      Y2              =   2040
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
      Left            =   3840
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1440
      Width           =   495
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
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   6420
      TabIndex        =   0
      Top             =   0
      Width           =   1455
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
    lblKind.Caption = cmbKind.Text & " "
    txtPrice.Text = txtPrice.Text & " ·.”"
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

    For Rep = 0 To 21
        lblPrice(Rep).Visible = False
        lblDes(Rep).Visible = False
        lblLot(Rep).Visible = False
        lblSPrice(Rep).Visible = False
        lblCommon(Rep).Visible = False
    Next Rep

    idNum = GetSetting("interdiv", "internet", "i393", 0)
    txtNum = idNum
    lblDate.Caption = " " & frmEnterMany.cmbDay.Text & " / " & frmEnterMany.cmbMonth.Text & " / " & frmEnterMany.cmbYear.Text & " "
    txtResualt.Text = frmEnterMany.txtPay.Text
    txtSold.Text = frmEnterMany.txtSold.Text & " " & frmEnterMany.cmbSold.Text
    txtPrice.Text = frmEnterMany.txtResualt.Text
    
'filling : fill the grid
    For Rep = 0 To bytRec - 1
        lblPrice(Rep).Visible = True
        lblDes(Rep).Visible = True
        lblLot(Rep).Visible = True
        lblSPrice(Rep).Visible = True
        lblCommon(Rep).Visible = True
        
        lblPrice(Rep).Text = frmEnterMany.txtPrice(Rep)
        lblDes(Rep).Text = frmEnterMany.txtDes(Rep)
        lblLot(Rep).Text = frmEnterMany.txtNum(Rep)
        lblSPrice(Rep).Text = frmEnterMany.txtSPrice(Rep)
        lblCommon(Rep).Text = frmEnterMany.txtCommon(Rep)
    Next Rep
    txtName.Text = frmEnterMany.txtNamePay.Text & " «·„Õ —„"
    fraRes.Top = lblPrice(Rep).Top + 300
    If frmEnterMany.cmbCost.ListIndex <> 0 And frmEnterMany.cmbCost.ListIndex <> 1 Then
        txtLast.Visible = True
        txtAll.Visible = True
        Label2.Visible = True
        Label5.Visible = True
        txtLast = frmEnterMany.txtMoney.Text
        txtAll = CLng(txtLast.Text) + CLng(txtResualt.Text)
    Else
        txtLast.Visible = False
        txtAll.Visible = False
        Label2.Visible = False
        Label5.Visible = False
    End If
End Sub

