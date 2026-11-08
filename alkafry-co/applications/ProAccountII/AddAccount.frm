VERSION 5.00
Begin VB.Form AddAccount 
   ClientHeight    =   11010
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
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   14
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   118
      Top             =   8760
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   13
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   117
      Top             =   8400
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   12
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   116
      Top             =   8040
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   11
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   115
      Top             =   7680
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   10
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   114
      Top             =   7320
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   9
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   113
      Top             =   6960
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   8
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   112
      Top             =   6600
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   7
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   111
      Top             =   6240
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   6
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   110
      Top             =   5880
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   5
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   109
      Top             =   5520
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   4
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   108
      Top             =   5160
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   3
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   107
      Top             =   4800
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   2
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   106
      Top             =   4440
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   1
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   105
      Top             =   4080
      Width           =   1695
   End
   Begin VB.TextBox TxtPrice 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   345
      Index           =   0
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   104
      Top             =   3720
      Width           =   1695
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "≈œŒ«·"
      Height          =   495
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   103
      Top             =   10320
      Width           =   1935
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "⁄Êœ…"
      Height          =   495
      Left            =   5400
      RightToLeft     =   -1  'True
      TabIndex        =   102
      Top             =   10320
      Width           =   1935
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Œ—ÊÃ"
      Height          =   495
      Left            =   2880
      RightToLeft     =   -1  'True
      TabIndex        =   101
      Top             =   10320
      Width           =   1935
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "„”Õ"
      Height          =   495
      Left            =   7920
      RightToLeft     =   -1  'True
      TabIndex        =   100
      Top             =   10320
      Width           =   1815
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   0
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   21
      Top             =   4200
      Width           =   1695
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   0
      Left            =   5145
      MaxLength       =   50
      TabIndex        =   36
      Top             =   4200
      Width           =   3495
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   0
      Left            =   10200
      MaxLength       =   50
      TabIndex        =   51
      Top             =   4200
      Width           =   1575
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   0
      Left            =   11760
      MaxLength       =   15
      TabIndex        =   69
      Top             =   4200
      Width           =   1215
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   0
      Left            =   12960
      MaxLength       =   25
      TabIndex        =   84
      Top             =   4200
      Width           =   2175
   End
   Begin VB.TextBox txtMoney 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   3600
      Locked          =   -1  'True
      RightToLeft     =   -1  'True
      TabIndex        =   98
      Tag             =   "0"
      Top             =   3000
      Width           =   2775
   End
   Begin VB.TextBox txtPhone 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   840
      MaxLength       =   20
      RightToLeft     =   -1  'True
      TabIndex        =   95
      Tag             =   "0"
      Top             =   1920
      Width           =   2415
   End
   Begin VB.TextBox txtAddress 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   840
      MaxLength       =   150
      RightToLeft     =   -1  'True
      TabIndex        =   94
      Tag             =   "0"
      Top             =   3000
      Width           =   2415
   End
   Begin VB.TextBox txtPay 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   405
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   92
      Tag             =   "0"
      Text            =   "0"
      Top             =   9720
      Width           =   8295
   End
   Begin VB.ComboBox cmbCost 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "AddAccount.frx":0000
      Left            =   10200
      List            =   "AddAccount.frx":000A
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   90
      Top             =   2040
      Width           =   2175
   End
   Begin VB.ListBox lstSeller 
      Height          =   2055
      Left            =   6720
      RightToLeft     =   -1  'True
      TabIndex        =   89
      Top             =   1320
      Width           =   3135
   End
   Begin VB.ComboBox txtGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   12720
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   87
      Top             =   1440
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   1
      Left            =   12960
      TabIndex        =   83
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   375
      Index           =   2
      Left            =   12960
      TabIndex        =   82
      Top             =   4920
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   3
      Left            =   12960
      TabIndex        =   81
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   4
      Left            =   12960
      TabIndex        =   80
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   5
      Left            =   12960
      TabIndex        =   79
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   6
      Left            =   12960
      TabIndex        =   78
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   7
      Left            =   12960
      TabIndex        =   77
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   8
      Left            =   12960
      TabIndex        =   76
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   9
      Left            =   12960
      TabIndex        =   75
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   10
      Left            =   12960
      TabIndex        =   74
      Top             =   7800
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   11
      Left            =   12960
      TabIndex        =   73
      Top             =   8160
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   12
      Left            =   12960
      TabIndex        =   72
      Top             =   8520
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   13
      Left            =   12960
      TabIndex        =   71
      Top             =   8880
      Width           =   2175
   End
   Begin VB.TextBox TxtName 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   14
      Left            =   12960
      TabIndex        =   70
      Top             =   9240
      Width           =   2175
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   1
      Left            =   11760
      TabIndex        =   68
      Top             =   4560
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   2
      Left            =   11760
      TabIndex        =   67
      Top             =   4920
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   3
      Left            =   11760
      TabIndex        =   66
      Top             =   5280
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   4
      Left            =   11760
      TabIndex        =   65
      Top             =   5640
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   5
      Left            =   11760
      TabIndex        =   64
      Top             =   6000
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   6
      Left            =   11760
      TabIndex        =   63
      Top             =   6360
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   7
      Left            =   11760
      TabIndex        =   62
      Top             =   6720
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   8
      Left            =   11760
      TabIndex        =   61
      Top             =   7080
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   9
      Left            =   11760
      TabIndex        =   60
      Top             =   7440
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   10
      Left            =   11760
      TabIndex        =   59
      Top             =   7800
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   11
      Left            =   11760
      TabIndex        =   58
      Top             =   8160
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   12
      Left            =   11760
      TabIndex        =   57
      Top             =   8520
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   13
      Left            =   11760
      TabIndex        =   56
      Top             =   8880
      Width           =   1215
   End
   Begin VB.TextBox TxtImport 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   14
      Left            =   11760
      TabIndex        =   55
      Top             =   9240
      Width           =   1215
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   1
      Left            =   10305
      TabIndex        =   50
      Top             =   4560
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   2
      Left            =   10305
      TabIndex        =   49
      Top             =   4920
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   3
      Left            =   10305
      TabIndex        =   48
      Top             =   5280
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   4
      Left            =   10305
      TabIndex        =   47
      Top             =   5640
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   5
      Left            =   10305
      TabIndex        =   46
      Top             =   6000
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   6
      Left            =   10305
      TabIndex        =   45
      Top             =   6360
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   7
      Left            =   10305
      TabIndex        =   44
      Top             =   6720
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   8
      Left            =   10305
      TabIndex        =   43
      Top             =   7080
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   9
      Left            =   10305
      TabIndex        =   42
      Top             =   7440
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   10
      Left            =   10305
      TabIndex        =   41
      Top             =   7800
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   11
      Left            =   10305
      TabIndex        =   40
      Top             =   8160
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   12
      Left            =   10305
      TabIndex        =   39
      Top             =   8520
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   13
      Left            =   10305
      TabIndex        =   38
      Top             =   8880
      Width           =   1575
   End
   Begin VB.TextBox TxtImportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   14
      Left            =   10305
      TabIndex        =   37
      Top             =   9240
      Width           =   1575
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   1
      Left            =   5145
      TabIndex        =   35
      Top             =   4560
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   2
      Left            =   5145
      TabIndex        =   34
      Top             =   4920
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   3
      Left            =   5145
      TabIndex        =   33
      Top             =   5280
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   4
      Left            =   5145
      TabIndex        =   32
      Top             =   5640
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   5
      Left            =   5145
      TabIndex        =   31
      Top             =   6000
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   6
      Left            =   5145
      TabIndex        =   30
      Top             =   6360
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   7
      Left            =   5145
      TabIndex        =   29
      Top             =   6720
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   8
      Left            =   5145
      TabIndex        =   28
      Top             =   7080
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   9
      Left            =   5145
      TabIndex        =   27
      Top             =   7440
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   10
      Left            =   5145
      TabIndex        =   26
      Top             =   7800
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   11
      Left            =   5145
      TabIndex        =   25
      Top             =   8160
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   12
      Left            =   5145
      TabIndex        =   24
      Top             =   8520
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   13
      Left            =   5145
      TabIndex        =   23
      Top             =   8880
      Width           =   3495
   End
   Begin VB.TextBox TxtExportDes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   14
      Left            =   5145
      TabIndex        =   22
      Top             =   9240
      Width           =   3495
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   1
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   20
      Top             =   4560
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   2
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   19
      Top             =   4920
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   3
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   18
      Top             =   5280
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   4
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   17
      Top             =   5640
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   5
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   16
      Top             =   6000
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   6
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   15
      Top             =   6360
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   7
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   14
      Top             =   6720
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   8
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   13
      Top             =   7080
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   9
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   12
      Top             =   7440
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   10
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   11
      Top             =   7800
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   11
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   10
      Top             =   8160
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   12
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   9
      Top             =   8520
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   13
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   8
      Top             =   8880
      Width           =   1695
   End
   Begin VB.TextBox TxtExDate 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00ADE2A0&
      Height          =   405
      Index           =   14
      Left            =   8625
      MaxLength       =   15
      TabIndex        =   7
      Top             =   9240
      Width           =   1695
   End
   Begin VB.ComboBox cmbYear 
      Height          =   405
      ItemData        =   "AddAccount.frx":0024
      Left            =   10080
      List            =   "AddAccount.frx":0055
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   2880
      Width           =   975
   End
   Begin VB.ComboBox cmbMonth 
      Height          =   405
      ItemData        =   "AddAccount.frx":00B3
      Left            =   11160
      List            =   "AddAccount.frx":00B5
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   2880
      Width           =   735
   End
   Begin VB.ComboBox cmbDay 
      Height          =   405
      Left            =   12000
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   2880
      Width           =   615
   End
   Begin VB.TextBox txtNamePay 
      Alignment       =   1  'Right Justify
      Height          =   405
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1920
      Width           =   3015
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "«·„»·€ «·„œ«‰"
      Height          =   375
      Left            =   4440
      RightToLeft     =   -1  'True
      TabIndex        =   99
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      Caption         =   "«·Â« ›"
      Height          =   375
      Left            =   1200
      RightToLeft     =   -1  'True
      TabIndex        =   97
      Top             =   1440
      Width           =   1455
   End
   Begin VB.Label Label 
      Alignment       =   2  'Center
      Caption         =   "«·⁄‰Ê«‰"
      Height          =   375
      Left            =   1200
      RightToLeft     =   -1  'True
      TabIndex        =   96
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "«·„œ›Ê⁄"
      Height          =   375
      Left            =   11160
      RightToLeft     =   -1  'True
      TabIndex        =   93
      Top             =   9720
      Width           =   1455
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "›« Ê—… »≈”„"
      Height          =   375
      Left            =   3960
      RightToLeft     =   -1  'True
      TabIndex        =   91
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Label lblGroub 
      Alignment       =   2  'Center
      Caption         =   "«·„Ã„Ê⁄…"
      Height          =   375
      Left            =   12960
      RightToLeft     =   -1  'True
      TabIndex        =   88
      Top             =   960
      Width           =   1695
   End
   Begin VB.Label LblName 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«”„ «·„«œ…"
      Height          =   375
      Left            =   13560
      TabIndex        =   86
      Top             =   3840
      Width           =   2175
   End
   Begin VB.Label LblImport 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·⁄œœ"
      Height          =   375
      Left            =   12240
      TabIndex        =   85
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label LblImportDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·”⁄— «·≈›—«œÌ"
      Height          =   375
      Left            =   10545
      TabIndex        =   54
      Top             =   3840
      Width           =   1575
   End
   Begin VB.Label LblExportDes 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "„·«ÕŸ« "
      Height          =   375
      Left            =   5145
      TabIndex        =   53
      Top             =   3840
      Width           =   3495
   End
   Begin VB.Label lblExDate 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·”⁄— «·≈Ã„«·Ì"
      Height          =   375
      Left            =   8745
      TabIndex        =   52
      Top             =   3840
      Width           =   1695
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   10920
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   2520
      Width           =   615
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "≈”‰«œ «·Õ”«» ≈·Ï"
      Height          =   375
      Left            =   10320
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "≈÷«›… ›« Ê—…"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   27.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   4695
   End
End
Attribute VB_Name = "AddAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dID(10000) As Integer, SelGroup As String
Private Sub Reload()
    Rep = 1
    lstKind.Clear
    lstKind.List(0) = "ﬁÿ⁄… ÃœÌœ…"
    Do While Not Rs.EOF
        lstKind.List(Rep) = Rs("dname")
        dID(Rep) = Rs("did")
        Rep = Rep + 1
        Rs.movenext
    Loop
    lstKind.Selected(0) = True
End Sub
Private Sub cmbCost_click()
    If cmbCost.ListIndex = 0 Then
        txtNamePay.Text = "“»Ê‰ ⁄«»—"
        txtPay.Enabled = False
        txtNamePay.Text = "“»Ê‰ ⁄«»—"
    Else
        Rep = 1
        lstSeller.List(0) = "“»Ê‰ ÃœÌœ"
        SelSQL = "select * from tblmoney order by dname"
        Set Rs = ADO.execute(SelSQL)
        Do While Not Rs.EOF
            lstSeller.List(Rep) = Rs("dname")
            Rep = Rep + 1
            Rs.movenext
        Loop
        txtPay.Enabled = True
        lstSeller.Selected(0) = True
    End If
End Sub

Private Sub cmdBack_Click()
    AddAccount.Hide
    frmMain.Show
End Sub

Private Sub cmdClear_Click()
    For Rep = 0 To 14
        TxtName(Rep) = ""
        TxtImport(Rep) = ""
        TxtImportDes(Rep) = ""
        TxtExDate(Rep) = ""
        TxtExportDes(Rep) = ""
        txtPay.Text = 0
    Next Rep
End Sub

Private Sub cmdEnter_Click()
    For Rep = 0 To 14
    If TxtName(Rep) = "" Then Exit For
    Dim strDate As String, lngNPrice As Long, lngWin As Long, objCon As Object, dLot As Long, dCLot As Long, dName As String
    SelSQL = "select * from tblkind where dname='" & lstKind.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    If Not (Rs.EOF = True And Rs.bof = True) Then
        lngNPrice = Val(Rs("dprice")) * Val(TxtImport(Rep).Text)
        dLot = Rs("dlot")
        dCLot = Val(dLot) - Val(TxtExDate(Rep).Text)
        If dCLot <= 0 Then
            MsgBox " „ ‰›«– ﬁÿ⁄ «·„«œ… «·„œŒ·…", vbOKOnly + vbInformation, "≈‰ »«Â"
            dCLot = 0
    End If
        dName = Rs("dname")
        lngWin = TxtImportDes(Rep).Text - lngNPrice
        SelSQL = "update tblkind set dlot=" & dCLot & " where dname='" & dName & "'"
        Set Rs = ADO.execute(SelSQL)
        If cmbCost.ListIndex = 0 Then
        SelSQL = "insert into tbldata (dmat,dnum,dsprice,dprice,dwin,ddes,dday,dmonth,dyear) values ('" & TxtName(Rep).Text & "'," & TxtImport(Rep).Text & "," & TxtImportDes(Rep).Text & "," & TxtExDate(Rep).Text & "," & lngWin & ",'" & TxtExportDes(Rep).Text & "'," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
        Set Rs = ADO.execute(SelSQL)
    Else
        If lstSeller.Selected(0) = True Then
            SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,drest,dwin,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & TxtName(Rep).Text & "'," & TxtImport(Rep).Text & "," & TxtImportDes(Rep).Text & "," & TxtExDate(Rep).Text & "," & TxtExDate(Rep).Text & "," & lngWin & "," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
            Set Rs = ADO.execute(SelSQL)
            SelSQL = "insert into tblmoney (dname,dphone,daddress,dmoney,dfdate) values ('" & txtNamePay.Text & "','" & txtPhone.Text & "','" & txtAddress.Text & "'," & txtPay.Text & ",'" & cmbYear.Text & " \ " & cmbMonth.Text & " \ " & cmbDay.Text & "')"
            Set Rs = ADO.execute(SelSQL)
        Else
            Dim dMoney As Long
            dMoney = Int(TxtExDate(Rep).Text) + Int(txtMoney.Text)
            SelSQL = "insert into tblguest (dname,dmat,dnum,dsprice,dprice,drest,dwin,dday,dmonth,dyear) values ('" & txtNamePay.Text & "','" & TxtName(Rep).Text & "'," & TxtImport(Rep).Text & "," & TxtImportDes(Rep).Text & "," & TxtExDate(Rep).Text & "," & TxtExDate(Rep).Text & "," & lngWin & "," & cmbDay.Text & "," & cmbMonth.Text & "," & cmbYear.Text & ")"
            Set Rs = ADO.execute(SelSQL)
            SelSQL = "update tblmoney set dmoney=" & dMoney & " where dname='" & txtNamePay.Text & "'"
            Set Rs = ADO.execute(SelSQL)
        End If
    End If
    End If
Next Rep
For Rep = 0 To 14
    txtPay.Text = Val(TxtExDate(Rep).Text) + Val(txtPay.Text)
Next Rep
cmdClear_Click
End Sub

Private Sub cmdExit_Click()
    ExitPro
End Sub
Private Sub Form_Load()
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    cmbCost.Text = "“»Ê‰ ⁄«»—"

    Rep = 1
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    SelSQL = "select dgroub from tblkind group by dgroub"
    Set Rs = ADO.execute(SelSQL)
    txtGroub.List(0) = "«·ﬂ·"
    Do While Not Rs.EOF
        txtGroub.List(Rep) = Rs("dgroub")
        txtGroub.List(Rep - 1) = Rs("dgroub")
        Rep = Rep + 1
        Rs.movenext
    Loop
    SelSQL = "select * from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        lstKind.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop

    'txtGroub.Text = "«·ﬂ·"
    SelSQL = "select * from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Reload
End Sub

Private Sub lstKind_DblClick()
    For Rep = 0 To 14
        If TxtName(Rep) = "" Then Exit For
    Next
    SelSQL = "select dname,dprice from tblkind where dname='" & lstKind.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    If Not (Rs.EOF And Rs.bof) And Rep < 15 Then
        TxtName(Rep) = Rs("dname")
        TxtImportDes(Rep) = Rs("dprice")
    End If
End Sub

Private Sub lstSeller_Click()
    txtNamePay = lstSeller.Text
    SelSQL = "select * from tblmoney where dname='" & lstSeller.Text & "'"
    Set Rs = ADO.execute(SelSQL)
    If Not (Rs.EOF And Rs.EOF) Then
    txtMoney.Text = Rs("dmoney")
    txtPhone.Text = Rs("dphone")
    txtAddress.Text = Rs("daddress")
    End If
End Sub

Private Sub Text1_KeyUp(KeyCode As Integer, Shift As Integer)
Text1.Text = KeyCode
End Sub

Private Sub TxtExDate_Click(Index As Integer)
    If IsNumeric(TxtImport(Index)) = True And IsNumeric(TxtImportDes(Index)) = True Then TxtExDate(Index) = TxtImport(Index) * TxtImportDes(Index)
    txtPay.Text = 0
    For Rep = 0 To 14
        txtPay.Text = Val(TxtExDate(Rep).Text) + Val(txtPay.Text)
    Next Rep
End Sub

Private Sub txtGroub_Change()
    If Not txtGroub.Text = "«·ﬂ·" Then
        SelGroup = "select * from tblkind where dgroub='" & txtGroub.Text & "'"
        Set Rs = ADO.execute(SelGroup)
    Else
        SelGroup = "select * from tblkind order by dname"
        Set Rs = ADO.execute(SelGroup)
    End If
    Reload
End Sub
