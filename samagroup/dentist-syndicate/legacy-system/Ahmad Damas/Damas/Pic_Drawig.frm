VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Pic_Drawig 
   Caption         =   "—”„ «·„⁄«·Ã« "
   ClientHeight    =   5370
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10305
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   5370
   ScaleWidth      =   10305
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtShiftY 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   6840
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Text            =   "0"
      Top             =   4560
      Width           =   615
   End
   Begin VB.TextBox txtShiftX 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   6840
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Text            =   "0"
      Top             =   4200
      Width           =   615
   End
   Begin VB.TextBox ShapeNum 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   6840
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   3720
      Width           =   615
   End
   Begin VB.CommandButton Command9 
      Caption         =   "≈“«Õ…"
      Height          =   375
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   4320
      Width           =   495
   End
   Begin VB.TextBox txtOColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   3
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   3240
      Width           =   1335
   End
   Begin VB.TextBox txtOColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   2
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   2400
      Width           =   1335
   End
   Begin VB.TextBox txtOColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   1
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   1560
      Width           =   1335
   End
   Begin VB.TextBox txtOColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   0
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   720
      Width           =   1335
   End
   Begin VB.TextBox txtType 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   3
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   2880
      Width           =   735
   End
   Begin VB.TextBox txtType 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   2
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   2040
      Width           =   735
   End
   Begin VB.TextBox txtType 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   1
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox txtColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   3
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   2880
      Width           =   1335
   End
   Begin VB.TextBox txtColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   2
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   2040
      Width           =   1335
   End
   Begin VB.TextBox txtColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   1
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   1200
      Width           =   1335
   End
   Begin VB.TextBox txtColor 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   0
      Left            =   5280
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   360
      Width           =   1335
   End
   Begin VB.TextBox txtType 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   0
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   360
      Width           =   735
   End
   Begin MSComDlg.CommonDialog CommColorPalet 
      Left            =   120
      Top             =   3600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txtShape 
      Alignment       =   1  'Right Justify
      Height          =   735
      Index           =   3
      Left            =   840
      MultiLine       =   -1  'True
      TabIndex        =   19
      Top             =   2880
      Width           =   4455
   End
   Begin VB.TextBox txtShape 
      Alignment       =   1  'Right Justify
      Height          =   735
      Index           =   2
      Left            =   840
      MultiLine       =   -1  'True
      TabIndex        =   18
      Top             =   2040
      Width           =   4455
   End
   Begin VB.TextBox txtShape 
      Alignment       =   1  'Right Justify
      Height          =   735
      Index           =   1
      Left            =   840
      MultiLine       =   -1  'True
      TabIndex        =   17
      Top             =   1200
      Width           =   4455
   End
   Begin VB.CommandButton Command5 
      Caption         =   "≈€·«ﬁ"
      Height          =   375
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   4200
      Width           =   855
   End
   Begin VB.TextBox txtShape 
      Alignment       =   1  'Right Justify
      Height          =   735
      Index           =   0
      Left            =   840
      MultiLine       =   -1  'True
      TabIndex        =   14
      Top             =   360
      Width           =   4455
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Õ–›"
      Height          =   375
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   4200
      Width           =   855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Õ›Ÿ"
      Height          =   375
      Left            =   2400
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   4200
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   " ÕœÌÀ"
      Height          =   375
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   4200
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Caption         =   "‘—Ìÿ «·√œÊ« "
      Height          =   4335
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   240
      Width           =   2655
      Begin VB.CommandButton Command7 
         Caption         =   "..."
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   2760
         Width           =   375
      End
      Begin VB.CommandButton Command6 
         Caption         =   "..."
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   1800
         Width           =   375
      End
      Begin VB.CommandButton Command1 
         Caption         =   "..."
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   3720
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   480
         TabIndex        =   8
         Top             =   3720
         Width           =   2055
      End
      Begin VB.TextBox txtOtherColor 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   480
         TabIndex        =   6
         Text            =   "4491343"
         Top             =   2760
         Width           =   2055
      End
      Begin VB.TextBox txtFillColor 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   480
         TabIndex        =   4
         Text            =   "&H00000099"
         Top             =   1800
         Width           =   2055
      End
      Begin VB.CheckBox chkShape 
         Alignment       =   1  'Right Justify
         Caption         =   "‘ﬂ·"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   840
         Width           =   2415
      End
      Begin VB.CheckBox chkLine 
         Alignment       =   1  'Right Justify
         Caption         =   "”ÿ—"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Caption         =   "’Ê—…"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   3360
         Width           =   2415
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "·Ê‰ ¬Œ—Ê‰"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   2400
         Width           =   2415
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "·Ê‰ «· ⁄»∆…"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1440
         Width           =   2415
      End
   End
   Begin VB.PictureBox imgTooth 
      Height          =   3135
      Left            =   6720
      RightToLeft     =   -1  'True
      ScaleHeight     =   205
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   48
      TabIndex        =   0
      Top             =   360
      Width           =   785
   End
   Begin MSComctlLib.ImageList surfList 
      Left            =   960
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   48
      ImageHeight     =   65
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   62
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":33EB
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":66E4
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":98E8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":C956
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":F8FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":12987
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":158AF
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":18732
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1B58C
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1E46B
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":214B8
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":2440A
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":27415
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":2A5C9
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":2D86A
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":30BF7
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":33E4A
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":37352
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":3A606
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":3D7FF
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":4081C
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":437B1
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":4688A
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":49742
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":4C63F
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":4F762
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":5272E
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":5579E
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":589EC
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":5BCE9
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":5F23C
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":624E6
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":64647
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":667A8
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":68909
            Key             =   ""
            Object.Tag             =   "15"
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":6B96B
            Key             =   ""
            Object.Tag             =   "14"
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":6EA68
            Key             =   ""
            Object.Tag             =   "13"
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":7195E
            Key             =   ""
            Object.Tag             =   "12"
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":7436E
            Key             =   ""
            Object.Tag             =   "11"
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":76F31
            Key             =   ""
            Object.Tag             =   "21"
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":79AF6
            Key             =   ""
            Object.Tag             =   "22"
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":7C507
            Key             =   ""
            Object.Tag             =   "23"
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":7F400
            Key             =   ""
            Object.Tag             =   "24"
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":82505
            Key             =   ""
            Object.Tag             =   "25"
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":8556C
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":876CD
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":8982E
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":8B98F
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":8DAF0
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":8FC51
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":91DB2
            Key             =   ""
            Object.Tag             =   "35"
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":94E67
            Key             =   ""
            Object.Tag             =   "34"
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":97C0C
            Key             =   ""
            Object.Tag             =   "33"
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":9A99C
            Key             =   ""
            Object.Tag             =   "32"
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":9D5DA
            Key             =   ""
            Object.Tag             =   "31"
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":A03D6
            Key             =   ""
            Object.Tag             =   "41"
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":A31D4
            Key             =   ""
            Object.Tag             =   "42"
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":A5E10
            Key             =   ""
            Object.Tag             =   "43"
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":A8B9E
            Key             =   ""
            Object.Tag             =   "44"
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":AB949
            Key             =   ""
            Object.Tag             =   "45"
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":AE9F6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImgList 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   48
      ImageHeight     =   140
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   62
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":AF046
            Key             =   ""
            Object.Tag             =   "18"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":B3453
            Key             =   ""
            Object.Tag             =   "17"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":B72BD
            Key             =   ""
            Object.Tag             =   "16"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":BB210
            Key             =   ""
            Object.Tag             =   "15"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":BF17B
            Key             =   ""
            Object.Tag             =   "14"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":C2ED1
            Key             =   ""
            Object.Tag             =   "13"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":C6A8A
            Key             =   ""
            Object.Tag             =   "12"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":CA684
            Key             =   ""
            Object.Tag             =   "11"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":CE774
            Key             =   ""
            Object.Tag             =   "21"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":D28C9
            Key             =   ""
            Object.Tag             =   "22"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":D64C2
            Key             =   ""
            Object.Tag             =   "23"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":DA0ED
            Key             =   ""
            Object.Tag             =   "24"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":DDE90
            Key             =   ""
            Object.Tag             =   "25"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":E1DFE
            Key             =   ""
            Object.Tag             =   "26"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":E5D6F
            Key             =   ""
            Object.Tag             =   "27"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":E9BDD
            Key             =   ""
            Object.Tag             =   "28"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":EDF67
            Key             =   ""
            Object.Tag             =   "38"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":F21C7
            Key             =   ""
            Object.Tag             =   "37"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":F6441
            Key             =   ""
            Object.Tag             =   "36"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":FA3E6
            Key             =   ""
            Object.Tag             =   "35"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":FE04D
            Key             =   ""
            Object.Tag             =   "34"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":101C7A
            Key             =   ""
            Object.Tag             =   "33"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":105A70
            Key             =   ""
            Object.Tag             =   "32"
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":109910
            Key             =   ""
            Object.Tag             =   "31"
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":10D98C
            Key             =   ""
            Object.Tag             =   "41"
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1119D7
            Key             =   ""
            Object.Tag             =   "42"
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":115837
            Key             =   ""
            Object.Tag             =   "43"
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":119668
            Key             =   ""
            Object.Tag             =   "44"
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":11D25E
            Key             =   ""
            Object.Tag             =   "45"
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":120E95
            Key             =   ""
            Object.Tag             =   "46"
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":124DEE
            Key             =   ""
            Object.Tag             =   "47"
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":12902A
            Key             =   ""
            Object.Tag             =   "48"
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":12D286
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":12F501
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":13177C
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1339F7
            Key             =   ""
            Object.Tag             =   "15"
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":137DDE
            Key             =   ""
            Object.Tag             =   "14"
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":13C0AC
            Key             =   ""
            Object.Tag             =   "13"
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":13F9E7
            Key             =   ""
            Object.Tag             =   "12"
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":142F57
            Key             =   ""
            Object.Tag             =   "11"
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1468C6
            Key             =   ""
            Object.Tag             =   "21"
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":14A294
            Key             =   ""
            Object.Tag             =   "22"
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":14D7DF
            Key             =   ""
            Object.Tag             =   "23"
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1510C1
            Key             =   ""
            Object.Tag             =   "24"
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1553B7
            Key             =   ""
            Object.Tag             =   "25"
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":159784
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":15B9FF
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":15DC7A
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":15FEF5
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":162170
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":1643EB
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":166666
            Key             =   ""
            Object.Tag             =   "35"
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":16A5CC
            Key             =   ""
            Object.Tag             =   "34"
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":16E37F
            Key             =   ""
            Object.Tag             =   "33"
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":171B8C
            Key             =   ""
            Object.Tag             =   "32"
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":174E81
            Key             =   ""
            Object.Tag             =   "31"
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":17596E
            Key             =   ""
            Object.Tag             =   "41"
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":178D49
            Key             =   ""
            Object.Tag             =   "42"
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":17C096
            Key             =   ""
            Object.Tag             =   "43"
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":17F861
            Key             =   ""
            Object.Tag             =   "44"
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":183620
            Key             =   ""
            Object.Tag             =   "45"
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_Drawig.frx":18758A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      Caption         =   "Y"
      Height          =   255
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Top             =   4680
      Width           =   375
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      Caption         =   "X"
      Height          =   255
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Top             =   0
      Width           =   375
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Caption         =   "X"
      Height          =   255
      Left            =   6360
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Top             =   4320
      Width           =   375
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Caption         =   "—ﬁ„ «·—”„…"
      Height          =   255
      Left            =   6000
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Top             =   3720
      Width           =   735
   End
   Begin VB.Image img 
      Height          =   495
      Left            =   600
      Top             =   3720
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Caption         =   "„⁄·Ê„«  «·‘ﬂ· «·Õ«·Ì"
      Height          =   255
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   120
      Width           =   1575
   End
End
Attribute VB_Name = "Pic_Drawig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rec As Boolean
Dim Points As New Collection
Private Type COORD
    x As Long
    Y As Long
End Type
Private Type POINTAPI
    x As Long
    Y As Long
End Type
Private Type LOGPEN
    lopnStyle As Long
    lopnWidth As POINTAPI
    lopnColor As Long
End Type

Private Type point
    pointX As Single
    pointY As Single
End Type

Const ALTERNATE = 1 ' ALTERNATE and WINDING are
Const WINDING = 2 ' constants for FillMode.
Const BLACKBRUSH = 4 ' Constant for brush type.

Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function CreatePenIndirect Lib "gdi32" (lpLogPen As LOGPEN) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Private Declare Function CreatePolygonRgn Lib "gdi32" (lpPoint As Any, ByVal nCount As Long, ByVal nPolyFillMode As Long) As Long
Private Declare Function Polygon Lib "gdi32" (ByVal hDC As Long, lpPoint As Any, ByVal nCount As Long) As Long
Private Declare Function FillRgn Lib "gdi32" (ByVal hDC As Long, ByVal hRgn As Long, ByVal HBrush As Long) As Long
Private Declare Function GetStockObject Lib "gdi32" (ByVal nIndex As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function GetSysColorBrush Lib "us  er32" (ByVal nIndex As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long

Dim p(0 To 1000) As COORD
Dim LP As LOGPEN, hRPen As Long
Dim S As String
Dim CurrShape As Integer
Dim rs As ADODB.Recordset

Private Sub chkLine_Click()
    If chkLine.Value = 0 Then
        rec = False
        Exit Sub
    End If
    
    chkShape.Value = 0
    rec = True
    txtType(CurrShape).text = "L"
    SetColors
End Sub

Private Sub chkShape_Click()
    If chkShape.Value = 0 Then
        rec = False
        Exit Sub
    End If
    chkLine.Value = 0
    rec = True
    txtType(CurrShape).text = "S"
    SetColors
End Sub

Private Sub Command1_Click()
    Clin_BrowseFile.Show 1
End Sub

Private Sub Command2_Click()
'    Draw CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 2)) 'tooth id
    Draw CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 2))
    Dim i As Integer
    For i = 0 To CurrShape
        If Trim(txtColor(i).text) <> "" Then
            newPic_Paint txtType(i).text, txtShape(i).text, CLng(txtColor(i).text), CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 2))
        End If
    Next
End Sub

Private Sub Command3_Click()
    rec = False
    resetCommands
    If Trim(txtShape(CurrShape).text) = "" Then CurrShape = CurrShape - 1
'    SetColors
    SaveToDB
    CurrShape = CurrShape + 1
End Sub

Private Sub Command4_Click()
    ' Mahfoud :)
    If rec Then
        MsgBox "⁄·Ìﬂ Õ›Ÿ «·„⁄«·Ã… «·Õ«·Ì… ﬁ»· Õ–›Â«"
        Exit Sub
    End If
    If rs.RecordCount = 0 Then
        Exit Sub
    End If
    rs.MoveLast
    rs.Delete
    CurrShape = CurrShape - 1
    txtColor(CurrShape).text = ""
    txtColor(CurrShape).BackColor = &HFFFFFF
    txtOColor(CurrShape).text = ""
    txtOColor(CurrShape).BackColor = &HFFFFFF
    txtType(CurrShape).text = ""
    txtShape(CurrShape).text = ""
    Command2_Click
End Sub

Private Sub Command5_Click()
     Unload Me
End Sub

Private Sub Command6_Click()
    CommColorPalet.ShowColor
    txtFillColor.BackColor = CommColorPalet.Color
    txtFillColor.text = CommColorPalet.Color
End Sub

Private Sub Command7_Click()
    CommColorPalet.ShowColor
    txtOtherColor.BackColor = CommColorPalet.Color
    txtOtherColor.text = CommColorPalet.Color
End Sub

Private Function ToArrayWithAdd(S As String, offsetX As Long, offsetY As Long) As Long
    Dim pos As Long, posComa As Long, posLast As Long
    Dim i As Long
    Dim arr() As String
    arr = Split(S, ",")
    i = LBound(arr)
    Do While i < UBound(arr)
        p(i / 2).x = CLng(arr(i)) + offsetX
        p(i / 2).Y = CLng(arr(i + 1)) + offsetY
        i = i + 2
    Loop
    ToArrayWithAdd = UBound(arr) / 2 'i - 1
End Function

Private Sub Command9_Click()
    nbPoints = ToArrayWithAdd(txtShape(CInt(ShapeNum.text)).text, CLng(txtShiftX.text), CLng(txtShiftY.text))
    txtShape(CInt(ShapeNum.text)).text = ""
    Dim i As Long
    For i = 0 To nbPoints - 1
        txtShape(CInt(ShapeNum.text)).text = txtShape(CInt(ShapeNum.text)).text & p(i).x & "," & p(i).Y & ","
        'Debug.Print "(" & p(i).x & "," & p(i).y & "),(" & p(i + 1).x & "," & p(i + 1).y & ")"
    Next
'    txtShape(CInt(ShapeNum.text)).text = txtShape(CInt(ShapeNum.text)).text & ","
End Sub

Private Sub Form_Load()
    'Draw CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 2)) 'tooth id
    'fg.Cell(flexcpText, fg.Row, 3)'treat id
    CurrShape = 0
    Dim Cancel As Boolean
    Set rs = ExecuteSelect(Conn, "select * from Pic_Pics where tooth=" & CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 2)) & " and treat=" & CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 3)) & " order by id ", Cancel)
    FillDataFromRS
    If rs.RecordCount >= 4 Then
        CurrShape = 3
    Else
        CurrShape = rs.RecordCount
    End If
    'txtShape(CurrShape).Text = ";"
End Sub

Public Sub Draw(Tooth As Integer)
    If Tooth <= 16 Or (Tooth > 32 And Tooth < 52) Then
        imgTooth.PaintPicture ImgList.ListImages(Tooth).Picture, 0, 0
        imgTooth.PaintPicture surfList.ListImages(Tooth).Picture, 0, ImgList.ImageHeight
    Else
        imgTooth.PaintPicture surfList.ListImages(Tooth).Picture, 0, 0
        imgTooth.PaintPicture ImgList.ListImages(Tooth).Picture, 0, surfList.ImageHeight
    End If
End Sub

Private Sub imgTooth_Paint()
    Command2_Click
End Sub

Private Sub drawLine(pic As PictureBox, x1 As Long, y1 As Long, X2 As Long, Y2 As Long)
    'Pic.ForeColor = QBColor(2)
    pic.Line (x1, y1)-(X2, Y2)
End Sub

Private Sub imgTooth_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
    If Not rec Then Exit Sub
    If txtType(CurrShape).text = "I" Then txtShape(CurrShape).text = Text3.text & ";"
    txtShape(CurrShape).text = txtShape(CurrShape).text & x & "," & Y & ","
    Command2_Click
End Sub

'Drawing

'Dim p(1 To 100) As COORD
Private Function ToArray(S As String) As Long
    Dim pos As Long, posComa As Long, posLast As Long
    Dim i As Long
    Dim arr() As String
    arr = Split(S, ",")
    i = LBound(arr)
    Do While i < UBound(arr)
        p(i / 2).x = CLng(arr(i))
        p(i / 2).Y = CLng(arr(i + 1))
        i = i + 2
    Loop
    ToArray = UBound(arr) / 2 'i - 1
End Function

Private Sub newPic_Paint(Typ As String, ByVal ss As String, Color As Long, Tooth As Integer)
    Dim hRgn As Long, HBrush As Long
    Dim nbPoints As Long
    
   'VERY VERY IMPORTANT
    imgTooth.ScaleMode = vbPixels
   
    LP.lopnStyle = 1

    LP.lopnColor = Color 'vbGreen
'    'Create a new pen

    hRPen = CreatePenIndirect(LP)

    SelectObject imgTooth.hDC, hRPen
    Dim imgName As String
    Dim S As String
    If Typ = "I" And ss <> "" Then
        S = Mid(ss, InStr(1, ss, ";") + 1)
        imgName = Mid(ss, 1, InStr(1, ss, ";") - 1)
    Else
        S = ss
    End If
    nbPoints = ToArray(S) 'Mid(txtShape(CurrShape).Text, 1, Len(txtShape(CurrShape).Text) - 1)) 's
'    Debug.Print nbPoints
    Select Case Typ
        Case "L":
            For i = 0 To nbPoints - 2
                imgTooth.Line (p(i).x, p(i).Y)-(p(i + 1).x, p(i + 1).Y)
                'Debug.Print "(" & p(i).x & "," & p(i).y & "),(" & p(i + 1).x & "," & p(i + 1).y & ")"
            Next
        Case "S":
            Polygon imgTooth.hDC, p(0), nbPoints
            ' Gets stock black brush.
            HBrush = CreateSolidBrush(Color) 'GetStockObject(CLng(txtFillColor.Text)) 'BLACKBRUSH)
            ' Creates region to fill with color.
            hRgn = CreatePolygonRgn(p(0), nbPoints, ALTERNATE)
            ' If the creation of the region was successful then color.
            If hRgn Then
                FillRgn imgTooth.hDC, hRgn, HBrush
            End If
            DeleteObject hRgn
        Case "I":
            If imgName <> "" And Text3.text = "" Then
                img.Picture = LoadPicture(App.Path & "\treats\" & imgName)
            ElseIf imgName = "" And Text3.text <> "" Then
                img.Picture = LoadPicture(App.Path & "\treats\" & Text3.text)
            End If
            imgTooth.PaintPicture img.Picture, p(0).x, p(0).Y, , , , , , , vbSrcAnd
    End Select
End Sub

Private Sub Text3_Change()
    chkShape.Value = 0
    chkLine.Value = 0
    rec = True
    txtType(CurrShape).text = "I"
    SetColors
End Sub

Private Sub txtFillColor_Change()
    txtColor(CurrShape).text = txtFillColor.text
    txtColor(CurrShape).BackColor = txtFillColor.text
End Sub

Private Sub txtOtherColor_Change()
    txtOColor(CurrShape).text = txtOtherColor.text
    txtOColor(CurrShape).BackColor = txtOtherColor.text
End Sub

Private Sub resetCommands()
    chkLine.Value = 0
    chkShape.Value = 0
End Sub
Private Sub SetColors()
    txtColor(CurrShape).text = txtFillColor.text
    txtColor(CurrShape).BackColor = txtFillColor.text
    txtOColor(CurrShape).text = txtOtherColor.text
    txtOColor(CurrShape).BackColor = txtOtherColor.text
End Sub
Private Sub SaveToDB()
    Dim i As Integer
    If rs.RecordCount <> 0 Then
        rs.MoveFirst
    End If
    For i = 0 To CurrShape
        If rs.EOF Or rs.RecordCount = 0 Then
            rs.addNew
        End If
        rs!Tooth = CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 2))
        rs!treat = CInt(Pic_TeethTreats.fg.Cell(flexcpText, Pic_TeethTreats.fg.Row, 3))
        rs!data = txtShape(i).text
        rs!Shape = txtType(i).text
        rs!Color = txtColor(i).text
        rs!OtherColor = txtOColor(i).text
        rs.Update
        rs.MoveNext
    Next
End Sub
Private Sub FillDataFromRS()
    Dim i As Integer
    i = 0
    Do While Not rs.EOF
        txtShape(i).text = rs!data
        txtType(i).text = rs!Shape
        txtColor(i).text = rs!Color
        txtOColor(i).text = rs!OtherColor
        txtColor(i).BackColor = rs!Color
        txtOColor(i).BackColor = rs!OtherColor
        i = i + 1
        rs.MoveNext
    Loop
End Sub

