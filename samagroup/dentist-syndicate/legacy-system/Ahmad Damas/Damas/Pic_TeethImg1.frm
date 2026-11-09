VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{9E08D644-9B07-11D0-8C35-00A0247E3B35}#2.0#0"; "LLU2.ocx"
Begin VB.Form Pic_TeethImg 
   BackColor       =   &H00E1FEFF&
   Caption         =   "·ÊÕ… «·√”‰«‰"
   ClientHeight    =   10860
   ClientLeft      =   3030
   ClientTop       =   1710
   ClientWidth     =   11400
   Icon            =   "Pic_TeethImg1.frx":0000
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   10860
   ScaleWidth      =   11400
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdRemoveTreatments 
      Caption         =   "≈·€«¡ „⁄«·Ã«  «·≈Õ«·…"
      Height          =   375
      Left            =   8220
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   10200
      Width           =   3375
   End
   Begin VB.CommandButton cmdOldTreats 
      Caption         =   "„⁄«·Ã«  ﬁœÌ„…"
      Height          =   375
      Left            =   8220
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   9690
      Width           =   3375
   End
   Begin VB.CommandButton cmdCanceledTreatments 
      Caption         =   " ﬁ—Ì— «·„⁄«·Ã«  «·„Õ”Ê„… ·Â–« «·„—Ì÷"
      Height          =   375
      Left            =   11760
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   9690
      Width           =   3375
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   6
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Text            =   "0"
      Top             =   9360
      Width           =   1095
   End
   Begin VB.CheckBox ChkKind 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "„‰ ﬁ»· €Ì—Ì"
      Height          =   255
      Left            =   8640
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   8640
      Width           =   2175
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   11760
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   10200
      Width           =   3375
   End
   Begin VB.CommandButton cmdPrint_Report 
      Caption         =   "ÿ»«⁄…"
      Height          =   375
      Left            =   8220
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   9195
      Width           =   3375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "⁄—÷ ﬂ«„· „⁄«·Ã«  «·≈Õ«·…"
      Height          =   375
      Left            =   11760
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   9195
      Width           =   3375
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   5
      Left            =   4320
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Text            =   "0"
      Top             =   8880
      Width           =   1095
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   4
      Left            =   4320
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Text            =   "0"
      Top             =   8400
      Width           =   1095
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   3
      Left            =   2160
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Text            =   "0"
      Top             =   8880
      Width           =   1095
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   2
      Left            =   2160
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Text            =   "0"
      Top             =   8400
      Width           =   1095
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   1
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Text            =   "0"
      Top             =   8880
      Width           =   1095
   End
   Begin VB.TextBox txtBuffer 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   0
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Text            =   "0"
      Top             =   8400
      Width           =   1095
   End
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ã· «·„⁄«·Ã« "
      Height          =   8175
      Left            =   11760
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   3375
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   240
         Width           =   3375
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   7695
         Left            =   0
         TabIndex        =   4
         Tag             =   $"Pic_TeethImg1.frx":1CFA
         Top             =   480
         Width           =   3375
         _cx             =   5953
         _cy             =   13573
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   0
         BackColor       =   16777215
         ForeColor       =   -2147483640
         BackColorFixed  =   -2147483633
         ForeColorFixed  =   -2147483630
         BackColorSel    =   16744703
         ForeColorSel    =   16777215
         BackColorBkg    =   14810879
         BackColorAlternate=   14810879
         GridColor       =   -2147483633
         GridColorFixed  =   -2147483632
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   7
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Pic_TeethImg1.frx":1D9A
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   0
         AutoSearchDelay =   2
         MultiTotals     =   -1  'True
         SubtotalPosition=   1
         OutlineBar      =   0
         OutlineCol      =   0
         Ellipsis        =   0
         ExplorerBar     =   0
         PicturesOver    =   0   'False
         FillStyle       =   0
         RightToLeft     =   -1  'True
         PictureType     =   0
         TabBehavior     =   1
         OwnerDraw       =   0
         Editable        =   2
         ShowComboButton =   -1  'True
         WordWrap        =   0   'False
         TextStyle       =   0
         TextStyleFixed  =   0
         OleDragMode     =   0
         OleDropMode     =   0
         DataMode        =   0
         VirtualData     =   -1  'True
         DataMember      =   ""
         ComboSearch     =   3
         AutoSizeMouse   =   -1  'True
         FrozenRows      =   0
         FrozenCols      =   0
         AllowUserFreezing=   0
         BackColorFrozen =   0
         ForeColorFrozen =   0
         WallPaperAlignment=   9
      End
   End
   Begin LLU2Ctl.llu2MagicMenusControl llu2MagicMenusControl1 
      Left            =   2640
      Top             =   9840
      _Version        =   131072
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   0
      DataAccess      =   1
      FirstCall       =   0   'False
      ExtendBlob      =   "Pic_TeethImg1.frx":1E71
   End
   Begin MSComctlLib.ImageList ImageList2 
      Left            =   1320
      Top             =   9840
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
            Picture         =   "Pic_TeethImg1.frx":2C89
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":6074
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":936D
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":C571
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":F5DF
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":12587
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":15610
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":18538
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1B3BB
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1E215
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":210F4
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":24141
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":27093
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":2A09E
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":2D252
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":304F3
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":33880
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":36AD3
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":39FDB
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":3D28F
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":40488
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":434A5
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":4643A
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":49513
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":4C3CB
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":4F2C8
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":523EB
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":553B7
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":58427
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":5B675
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":5E972
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":61EC5
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":6516F
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":672D0
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":69431
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":6B592
            Key             =   ""
            Object.Tag             =   "15"
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":6E5F4
            Key             =   ""
            Object.Tag             =   "14"
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":716F1
            Key             =   ""
            Object.Tag             =   "13"
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":745E7
            Key             =   ""
            Object.Tag             =   "12"
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":76FF7
            Key             =   ""
            Object.Tag             =   "11"
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":79BBA
            Key             =   ""
            Object.Tag             =   "21"
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":7C77F
            Key             =   ""
            Object.Tag             =   "22"
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":7F190
            Key             =   ""
            Object.Tag             =   "23"
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":82089
            Key             =   ""
            Object.Tag             =   "24"
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":8518E
            Key             =   ""
            Object.Tag             =   "25"
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":881F5
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":8A356
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":8C4B7
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":8E618
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":90779
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":928DA
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":94A3B
            Key             =   ""
            Object.Tag             =   "35"
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":97AF0
            Key             =   ""
            Object.Tag             =   "34"
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":9A895
            Key             =   ""
            Object.Tag             =   "33"
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":9D625
            Key             =   ""
            Object.Tag             =   "32"
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":A0263
            Key             =   ""
            Object.Tag             =   "31"
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":A305F
            Key             =   ""
            Object.Tag             =   "41"
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":A5E5D
            Key             =   ""
            Object.Tag             =   "42"
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":A8A99
            Key             =   ""
            Object.Tag             =   "43"
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":AB827
            Key             =   ""
            Object.Tag             =   "44"
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":AE5D2
            Key             =   ""
            Object.Tag             =   "45"
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":B167F
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   360
      Top             =   9840
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
            Picture         =   "Pic_TeethImg1.frx":B1CCF
            Key             =   ""
            Object.Tag             =   "18"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":B60DC
            Key             =   ""
            Object.Tag             =   "17"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":B9F46
            Key             =   ""
            Object.Tag             =   "16"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":BDE99
            Key             =   ""
            Object.Tag             =   "15"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":C1E04
            Key             =   ""
            Object.Tag             =   "14"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":C5B5A
            Key             =   ""
            Object.Tag             =   "13"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":C9713
            Key             =   ""
            Object.Tag             =   "12"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":CD30D
            Key             =   ""
            Object.Tag             =   "11"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":D13FD
            Key             =   ""
            Object.Tag             =   "21"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":D5552
            Key             =   ""
            Object.Tag             =   "22"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":D914B
            Key             =   ""
            Object.Tag             =   "23"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":DCD76
            Key             =   ""
            Object.Tag             =   "24"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":E0B19
            Key             =   ""
            Object.Tag             =   "25"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":E4A87
            Key             =   ""
            Object.Tag             =   "26"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":E89F8
            Key             =   ""
            Object.Tag             =   "27"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":EC866
            Key             =   ""
            Object.Tag             =   "28"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":F0BF0
            Key             =   ""
            Object.Tag             =   "38"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":F4E50
            Key             =   ""
            Object.Tag             =   "37"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":F90CA
            Key             =   ""
            Object.Tag             =   "36"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":FD06F
            Key             =   ""
            Object.Tag             =   "35"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":100CD6
            Key             =   ""
            Object.Tag             =   "34"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":104903
            Key             =   ""
            Object.Tag             =   "33"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1086F9
            Key             =   ""
            Object.Tag             =   "32"
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":10C599
            Key             =   ""
            Object.Tag             =   "31"
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":110615
            Key             =   ""
            Object.Tag             =   "41"
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":114660
            Key             =   ""
            Object.Tag             =   "42"
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1184C0
            Key             =   ""
            Object.Tag             =   "43"
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":11C2F1
            Key             =   ""
            Object.Tag             =   "44"
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":11FEE7
            Key             =   ""
            Object.Tag             =   "45"
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":123B1E
            Key             =   ""
            Object.Tag             =   "46"
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":127A77
            Key             =   ""
            Object.Tag             =   "47"
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":12BCB3
            Key             =   ""
            Object.Tag             =   "48"
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":12FF0F
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":13218A
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":134405
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":136680
            Key             =   ""
            Object.Tag             =   "15"
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":13AA67
            Key             =   ""
            Object.Tag             =   "14"
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":13ED35
            Key             =   ""
            Object.Tag             =   "13"
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":142670
            Key             =   ""
            Object.Tag             =   "12"
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":145BE0
            Key             =   ""
            Object.Tag             =   "11"
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":14954F
            Key             =   ""
            Object.Tag             =   "21"
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":14CF1D
            Key             =   ""
            Object.Tag             =   "22"
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":150468
            Key             =   ""
            Object.Tag             =   "23"
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":153D4A
            Key             =   ""
            Object.Tag             =   "24"
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":158040
            Key             =   ""
            Object.Tag             =   "25"
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":15C40D
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":15E688
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":160903
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":162B7E
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":164DF9
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":167074
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1692EF
            Key             =   ""
            Object.Tag             =   "35"
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":16D255
            Key             =   ""
            Object.Tag             =   "34"
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":171008
            Key             =   ""
            Object.Tag             =   "33"
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":174815
            Key             =   ""
            Object.Tag             =   "32"
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":177B0A
            Key             =   ""
            Object.Tag             =   "31"
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1785F7
            Key             =   ""
            Object.Tag             =   "41"
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":17B9D2
            Key             =   ""
            Object.Tag             =   "42"
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":17ED1F
            Key             =   ""
            Object.Tag             =   "43"
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1824EA
            Key             =   ""
            Object.Tag             =   "44"
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":1862A9
            Key             =   ""
            Object.Tag             =   "45"
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Pic_TeethImg1.frx":18A213
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… „—Ì÷"
      Height          =   8175
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   11655
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   7635
         Left            =   0
         RightToLeft     =   -1  'True
         ScaleHeight     =   507
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   768
         TabIndex        =   2
         Top             =   480
         Width           =   11550
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   11415
      End
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "”ﬁ› «·‘—ﬂ…"
      Height          =   375
      Left            =   13800
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   8640
      Width           =   1335
   End
   Begin VB.Label lblMaxTreats 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      Height          =   375
      Left            =   11760
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   8640
      Width           =   2415
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "› Õ Ê Ã—Ì› ·À… ›Ì «·›ﬂÌ‰"
      Height          =   255
      Index           =   6
      Left            =   1335
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   9420
      Width           =   1905
   End
   Begin VB.Label lblSumCost 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      Height          =   375
      Left            =   11760
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   8400
      Width           =   2415
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«·ﬁÌ„… "
      Height          =   375
      Left            =   13800
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   8400
      Width           =   1335
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "’Ê—… √‘⁄… »«‰Ê—«„Ì…"
      Height          =   255
      Index           =   5
      Left            =   5520
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   8940
      Width           =   1455
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "’Ê—… ≈÷«›Ì… Ê«Õœ…"
      Height          =   255
      Index           =   4
      Left            =   5520
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   8460
      Width           =   1455
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "·À… »”Ìÿ…"
      Height          =   255
      Index           =   3
      Left            =   3360
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   8940
      Width           =   735
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "·À… „ ﬁœ„…"
      Height          =   255
      Index           =   2
      Left            =   3360
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   8460
      Width           =   735
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«· ‰ŸÌ›"
      Height          =   255
      Index           =   1
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   8940
      Width           =   615
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«· ﬁ·ÌÕ"
      Height          =   255
      Index           =   0
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   8460
      Width           =   495
   End
   Begin VB.Image tmpImg 
      Height          =   615
      Left            =   3600
      Top             =   9840
      Visible         =   0   'False
      Width           =   735
   End
End
Attribute VB_Name = "Pic_TeethImg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public WithEvents detail As Controller
Attribute detail.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Long
Dim teeth(32) As Tooth
Dim Tooth As Integer
Public IhalaID As Long
Dim treatDate As String
Dim buff(9) As Integer
Dim p As lluPopupMenuClass
Public Client_ID As Long
Public Organization_Id As Long
Public Editable As Integer
Public teethTreatsRS As ADODB.Recordset
Public totCost As Long
Public TotalIhala As Long
'<MAJD>
 Dim CurrentTooth As Integer
'</MAJD>
Private NoWarning As Boolean
Public MaxIhalaPrice As Double
Const MAX_BUFF = 6
Private TransactionStarted As Boolean
Private MenuIsShowing As Boolean
Private needsrequery As Boolean
Public CentralPrice As Long
'<AHMAD>
Public Central_Exam_Date As String
Public Patient_Name As String
Private WithEvents frmOldTreats As dlgSqlSelect
Attribute frmOldTreats.VB_VarHelpID = -1
Private maxRedValue As Double
'</AHMAD>
Const Mouth = -100

Sub OnSqlSelected(frm As dlgSqlSelect)

End Sub
Private Sub DrawPermanatTooth()
    Dim i As Integer
    For i = 1 To 32
        teeth(i).Draw
    Next
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCanceledTreatments_Click()
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As Recordset
    
'    sql = " Select Central_Exam_ID,Exam_Date,Curer_Doctor_ID,Curer_Doctor_Name,Cost,NumTeeth,Name,Patient_Name,notes " & vbCrLf & _
'          " From vCentral_Exam v inner join " & _
'          " ( select Pic_ClientTreats.*, Pic_Treats.note TreatOp,Name " & _
'          "   from Pic_ClientTreats inner join Pic_Treats on (Pic_ClientTreats.treatid=Pic_Treats.id) " & _
'          "   where Pic_Treats.note not like '%;virtu=true;%' and Pic_ClientTreats.Kind = 0 and " & vbCrLf & _
'          "   Pic_ClientTreats.isCanceled = 1 " & vbCrLf & _
'          "   and Pic_ClientTreats.parent<=0 " & vbCrLf & _
'          " ) p " & vbCrLf & _
'          " on p.IhalaID = v.Central_Exam_ID " & vbCrLf & _
'          " and v.Patient_id = " & Client_ID

    sql = "select *,exam_date from vCanceledTreats v " & _
            " inner join central_exam e on v.central_exam_id = e.central_exam_id " & _
            " Where v.patient_id = " & Client_ID
    Set rs = ExecuteSelect(Conn, sql & " Order by 1", cancel)
    
    If cancel Then
        MsgBox "Œÿ√ √∆‰«¡ ⁄—÷ «· ﬁ—Ì—", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
    
    Get_DataReport_Label_byName(DrCanceledTrearments, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrCanceledTrearments, 1, "lblHeader").Caption = " ﬁ—Ì— «·„⁄«·Ã«  «·„Õ”Ê„…"
    Get_DataReport_Label_byName(DrCanceledTrearments, 1, "lblPatient_ID").Caption = Client_ID
    Get_DataReport_Label_byName(DrCanceledTrearments, 1, "lblPatient_Name").Caption = Patient_Name & ""
    Set DrCanceledTrearments.DataSource = rs
    DrCanceledTrearments.Show 1
    Set rs = Nothing
    
End Sub

Private Sub cmdOldTreats_Click()
    Set frmOldTreats = New dlgSqlSelect
    
    With frmOldTreats
        .sql = " select Pcs.IhalaID,pt.Name,ce.central_exam_date as cdate,numteeth,Pcs.Cost,curer_doctor_name,Ihala_ID_in_Company " & _
                " from Pic_ClientTreats Pcs " & _
                " inner join Pic_Treats Pt on (Pcs.treatid=Pt.id) " & _
                " inner join vcentral_exam Ce on (Ce.Central_exam_id = Pcs.IhalaID) " & _
                " where Pt.note not like '%;virtu=true;%' " & _
                " and Pcs.parent=0 and IhalaID<" & IhalaID & " and Ce.Patient_id =  " & Client_ID & _
                " Or (IhalaID<" & IhalaID & " and Pcs.parent < 0 " & _
                " And DisableIhala IS Null and Ce.Patient_id = " & Client_ID & ")" & _
                " order by cdate"
        .ColumnsNames = "—ﬁ„ «·≈Õ«·…,«”„ «·„⁄«·Ã…, «—ÌŒ «·„⁄«·Ã…,√—ﬁ«„ «·√”‰«‰,”⁄— «·„⁄«·Ã…,«·ÿ»Ì» «·„⁄«·Ã,"
        .FrameCaption = "„⁄«·Ã«  ﬁœÌ„…"
        .AlwaysPerformOnSelectEvent = False
        .DontReturnOnDblClick = 1
        If Current_State.Show_Per_Company Then
            .GridTag = ";typeof=vsflexgrid;datafield=,0:Ihala_ID_in_Company,1:name,2:Cdate,3:numteeth,4:Cost,5:curer_doctor_name,;"
        Else
            .GridTag = ";typeof=vsflexgrid;datafield=,0:IhalaID,1:name,2:Cdate,3:numteeth,4:Cost,5:curer_doctor_name,;"
        End If
        .fg.Cols = 6
        .fg.ColWidth(0) = 100
        .fg.ColWidth(1) = 250
        .fg.ColWidth(2) = 100
        .fg.ColWidth(3) = 100
        .fg.ColWidth(4) = 100
        .fg.ColWidth(5) = 200
        .fg.ColDataType(2) = flexDTDate
        Load frmOldTreats
        Set .Opener = Me
        .cmdCancelDialog.visible = True
        .cmdOK.Caption = "⁄Êœ…"
        .cmdOK.cancel = True
        .cmdCustomButton(0).visible = True
        .cmdCustomButton(0).Caption = "ÿ»«⁄…"
        .Width = 13100
        .cmdOK.Left = .masterFrame.Left + .masterFrame.Width - .cmdOK.Width
        .cmdCustomButton(0).Left = .fg.Left
        .FormSettings = btall - btNew - btsave - btDelete - btUpdate - btCancel
        .btnSettings = btall - btSearchExec - btSearchCancel
        RefreshCommands btnSettings, frmOldTreats
        .Show 1
    End With
    
End Sub

Private Sub cmdPrint_Report_Click()
    Dim rsReport_Source As ADODB.Recordset
    Dim rsCentral_Exam As ADODB.Recordset
    Dim rsPatientInfo As ADODB.Recordset
    Dim rsDiscountsInfo As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    Dim fathername As String
    
    sql = "select Pic_ClientTreats.*, Pic_Treats.note TreatOp,Name " & _
            "from Pic_ClientTreats inner join Pic_Treats on (Pic_ClientTreats.treatid=Pic_Treats.id) " & _
            "where Pic_Treats.note not like '%;virtu=true;%' and Pic_ClientTreats.Kind = 0 " & _
            "and Pic_ClientTreats.parent<=0 and IhalaID=" & IhalaID
            
    Set rsReport_Source = ExecuteSelect(Conn, sql, cancel)
    
    sql = "Select * from vCentral_Exam where Central_Exam_ID = " & IhalaID
    Set rsCentral_Exam = ExecuteSelect(Conn, sql, cancel)
        
    sql = "select Father_Name from  dbo.Patient  where  Patient_ID =" & rsCentral_Exam!Patient_Id
    Set rsPatientInfo = ExecuteSelect(Conn, sql, cancel)
    
    sql = "select * from Acc_ConstKashef Where ID = (select max(ID) from Acc_ConstKashef)"
    Set rsDiscountsInfo = ExecuteSelect(Conn, sql, cancel)
    With DRTotalExam
        .Sections(1).Controls(1).Caption = Current_State.FullName
      '  .Sections(1).Controls(19).Caption = "«·‰”Œ… «·√Ê·Ï"
        If Current_State.Show_Per_Company = False Then
            .Sections(1).Controls(7).Caption = rsCentral_Exam!Central_Exam_ID
        Else
            .Sections(1).Controls(7).Caption = rsCentral_Exam!Ihala_ID_in_Company
        End If
        
        .Sections(1).Controls(23).Caption = rsCentral_Exam!SerialNo_In_Company
        .Sections(1).Controls(21).Caption = rsCentral_Exam!Patient_Id
        If IsNull(rsPatientInfo!Father_Name) = False Then
            .Sections(1).Controls(11).Caption = rsCentral_Exam!Patient_Name & "  »‰  " & rsPatientInfo!Father_Name
        Else
            .Sections(1).Controls(11).Caption = rsCentral_Exam!Patient_Name
        End If
        If Not IsNull(rsCentral_Exam!Exam_Date) Then
            .Sections(1).Controls(8).Caption = rsCentral_Exam!Exam_Date
        Else
            .Sections(1).Controls(8).Caption = "·« ÌÊÃœ"
        End If
            
        .Sections(1).Controls(14).Caption = rsCentral_Exam!Organization_Name
       
        Get_DataReport_Label_byName(DRTotalExam, 5, "lblprice").Caption = rsCentral_Exam!price
        
        .Sections(5).Controls(8).Caption = rsCentral_Exam!Whole_Total
        
        Get_DataReport_Label_byName(DRTotalExam, 1, "lblExaminer_Doctor_Name").Caption = _
                        rsCentral_Exam!Examiner_Doctor_Name
                        
        'If Current_State.id = 5 Or Current_State.FullName Like "%Õ„’%" Then
            
            'Dim lblTabibLabel As RptLabel
            'Dim lblTabibTotal As RptLabel
            
            'Set lblTabibLabel = Get_DataReport_Label_byName(DRTotalExam, 5, "lblTabibLabel")
            'Set lblTabibTotal = Get_DataReport_Label_byName(DRTotalExam, 5, "lblTabibTotal")
            
            'lblTabibTotal.visible = True
            'lblTabibTotal.Caption = ((rsCentral_Exam!Whole_Total - rsCentral_Exam!price) * rsDiscountsInfo!desert_percent) \ 100
            'lblTabibLabel.visible = True
            
        'End If
        
        Set .DataSource = rsReport_Source
         .Show 1
'        .Sections(1).Controls(19).Caption = "«·‰”Œ… «·À«‰Ì…"
'        .Show 1
    End With
    
End Sub
'<Ashraf>
Private Sub cmdRemoveTreatments_Click()
    Dim rsCanRemove As New Recordset
    Dim cancelState  As Boolean
    cancelState = False
    Set rsCanRemove = ExecuteSelect(Conn, "select count(*) as Count from vcentral_exam where fixed=0 and moved=0 and central_Exam_ID = " + str(IhalaID), cancelState)
    If cancelState Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
    Else
        If rsCanRemove!count = 0 Then
            MsgBox "·« Ì„ﬂ‰ ≈·€«¡ «·„⁄«·Ã« °  √ﬂœ „‰ √‰ «·≈Õ«·… ·Ì”  „—Õ·… √Ê „À» …"
        Else
            'Remove all treatments...!
            Dim sqlStr As String
            sqlStr = "delete pic_clientTreats where ihalaID = " + str(IhalaID)
            ExecuteCommand Conn, sqlStr, cancelState
            Dim sqlStr2 As String
            sqlStr2 = "exec sp_UpdateWholeTotal " + str(IhalaID) + ", '" + Central_Exam_Date + "'"
            ExecuteCommand Conn, sqlStr2, cancelState
            If cancelState Then
                MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
            Else
                MsgBox " „ ≈·€«¡ „⁄«·Ã«  Â–Â «·≈Õ«·… , ÌÃ» ⁄·Ìﬂ ≈⁄«œ… › Õ «·‘«‘… «·”‰Ì… ·Â–Â «·≈Õ«·…"
                Dim ob As Object
                Set ob = Me
                Unload Me
             '   Load (ob)
            End If
        End If
    End If
End Sub
'</Ashraf>

Private Sub Command1_Click()
    detail.rs.Filter = ""
    detailFrame.Caption = "”Ã· «·„⁄«·Ã« "
End Sub

Private Sub detail_doEOFReached(rs As ADODB.Recordset)
    Dim i As Integer
    Dim cancel As Boolean
    
  '<MAJD>
   Dim rs1 As ADODB.Recordset
    Set rs1 = ExecuteSelect(Conn, "select dbo.sf_Get_Treatment_Total (" & str(IhalaID) & ") as Cost", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        If TransactionStarted Then
            Conn.RollbackTrans
        End If
        TransactionStarted = False
        Exit Sub
    Else
       If rs1.EOF = False Then
            TotalIhala = rs1!cost
       Else
            TotalIhala = 0
       End If
    End If
    rs1.Close
    '</MAJD>

   For i = 0 To MAX_BUFF
        txtBuffer(i).text = buff(i)
        buff(i) = 0
   Next
   lblSumCost.Caption = totCost
   If TotalIhala >= maxRedValue And NoWarning Then
        MsgBox "≈‰ ﬁÌ„… «·≈Õ«·… ﬁœ  Ã«Ê“  " & maxRedValue & " ·Ì—… ”Ê—Ì…° «·—Ã«¡ Ê÷⁄ «·Œ „ «·√Õ„—", vbCritical
        NoWarning = False
   End If
   If Not NoWarning And TotalIhala < maxRedValue Then
        NoWarning = True
   End If
   If TotalIhala + CentralPrice > MaxIhalaPrice And MaxIhalaPrice <> 0 Then
        Dim msg As String
        Dim buttons As Long
        If GetTagValue(Current_State.Settings, "FORCE_LIMIT") = "true" Then
            msg = " Ã«Ê“  «·≈Õ«·… «·Õœ «·√⁄·Ï ··‘—ﬂ… (" & MaxIhalaPrice & "° ”Ì „ Õ–› «·„⁄«·Ã… «·√ŒÌ—…"
            buttons = vbCritical + vbYes
        Else
            msg = " Ã«Ê“  «·≈Õ«·… «·Õœ «·√⁄·Ï ··‘—ﬂ… (" & MaxIhalaPrice & "° Â·  —Ìœ Õ–› «·„⁄«·Ã… «·√ŒÌ—…"
            buttons = vbCritical + vbYesNo
        End If
        'MsgBox " Ã«Ê“  «·≈Õ«·… «·Õœ «·√⁄·Ï ··‘—ﬂ… (" & MaxIhalaPrice & ")° ÌÃ» ⁄·Ìﬂ Õ–› «·„⁄«·Ã… «·√ŒÌ—…", vbCritical, " Ã«Ê“ «·Õœ «·√⁄·Ï ··‘—ﬂ….  √ﬂÌœ √Ê·"
        If MsgBox(msg, buttons, " Ã«Ê“ «·Õœ «·√⁄·Ï ··‘—ﬂ….") = vbYes Then
            If TransactionStarted Then
                 Conn.RollbackTrans
                 totCost = 0
                 TransactionStarted = False
                 needsrequery = True
            End If
            Exit Sub
        End If
   End If
   If TransactionStarted Then
        Conn.CommitTrans
        TransactionStarted = False
   End If
   totCost = 0
End Sub

Private Sub detail_doMoveComplete(rs As ADODB.Recordset)
            Dim Buffer As String
            Buffer = GetTagValue(rs!TreatOp, "buffer")
            If Buffer <> "" Then
                  buff(CInt(Buffer)) = buff(CInt(Buffer)) + 1
            End If

            totCost = totCost + rs!cost
           
            
                  
End Sub

Private Sub detailFrame_Click()
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    
    If (Col <> 3 And Col <> 5) Or fg.Rows = 1 Then Exit Sub
    
    Dim msg As VbMsgBoxResult
    Dim cancel As Boolean
    Dim sql As String
    Dim CancelStatus As String
    
    If fg.Cell(flexcpText, Row, 3) = 0 Then
        CancelStatus = " ·« "
    Else
        CancelStatus = " ‰⁄„ "
    End If
    msg = MsgBox("·ﬁœ ﬁ„  » €ÌÌ— Õ«·… Õ”„ Â–Â «·„⁄«·Ã…  ≈·Ï «·ﬁÌ„…" & CancelStatus & " √Ê ﬁ„  » €ÌÌ— Õﬁ· «·„·«ÕŸ« ° Â· √‰  „ √ﬂœ „‰ Õ›Ÿ ⁄„·Ì… «· €ÌÌ— Â–Âø", vbQuestion + vbYesNo, " √ﬂÌœ")
    If msg <> vbYes Then Exit Sub
    sql = " Update Pic_ClientTreats Set isCanceled = " & fg.Cell(flexcpText, Row, 3) & _
          " , notes = '" & fg.Cell(flexcpText, Row, 5) & "' " & _
          " Where id = " & fg.Cell(flexcpText, Row, 6)
    ExecuteCommand Conn, sql, cancel
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡  ⁄œÌ· Ê÷⁄ «·Õ”„ ·Â–Â «·„⁄«·Ã… ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbCritical + vbOKOnly, "Œÿ√"
    Else
        MsgBox " „  ⁄„·Ì… «· ⁄œÌ· »‰Ã«Õ", vbInformation + vbOKOnly, "⁄„·Ì… ‰«ÃÕ…"
    End If
    
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Col <> 3 And Col <> 5 Then cancel = True
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
End Sub

Private Sub Form_Load()
    '<MHD>
    Dim maxRS As ADODB.Recordset
    Dim cansell As Boolean
    maxRedValue = 12000
    Set maxRS = ExecuteSelect(Conn, "SELECT TOP 1 Rem FROM Version", cansell)
    If Not cansell Then
        If IsNull(maxRS!Rem) Then
            ExecuteCommand Conn, "UPDATE Version SET Rem = '" & maxRedValue & "'", cansell
        Else
            maxRedValue = CDbl(maxRS!Rem)
        End If
    End If
    '</MHD>
    totCost = 0
    '<MAJD>

    CurrentTooth = 0
    '</MAJD>
    TransactionStarted = False
    NoWarning = True
    oldScaleWidth = Me.Width
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Set detail = New Controller
    Set detail.Form = Me
    Set detail.frame = detailFrame
    controllers.Add detail, detailFrame.name
    
    fg.ColComboList(3) = "#0;‰⁄„|#1;·«"
    fg.ColComboList(4) = "#0;‰⁄„|#1;·«"
    fg.ColHidden(4) = True
    
    If Pic_TeethImg.Editable = 0 Then
       cmdRemoveTreatments.Enabled = False
     Else
        cmdRemoveTreatments.Enabled = True
    End If
   
    Dim cancel As Boolean
    'Iyad Sql:
    'Set detail.rs = ExecuteSelect(Conn, "select Pic_ClientTreats.*, Pic_Treats.note TreatOp from Pic_ClientTreats inner join Pic_Treats on (Pic_ClientTreats.treatid=Pic_Treats.id) where Pic_Treats.note not like '%;virtu=true;%' and Pic_ClientTreats.parent<=0 and IhalaID=" & IhalaID, cancel)
  ' Majd Sql:
    Set detail.rs = ExecuteSelect(Conn, "select Pic_ClientTreats.*, Pic_Treats.note TreatOp from Pic_ClientTreats inner join Pic_Treats on (Pic_ClientTreats.treatid=Pic_Treats.id) where Pic_Treats.note not like '%;virtu=true;%'" & _
      " and Pic_ClientTreats.parent<=0 and IhalaID=" & IhalaID & _
      " and (disable=0 or (disable=1 and disableihala>=" & IhalaID & ")) ", cancel)
     ' " Or (IhalaID=" & IhalaID & " and pic_ClientTreats.parent < 0 And DisableIhala IS Null)", Cancel)
  
    If Not detail.rs.EOF Then
        detail.rs.MoveFirst
    End If
    Set ActiveFrame = masterFrame
    
    Set p = llu2MagicMenusControl1.PopupMenu
    p.SaveAs "temp.mnu"
    treatDate = "1/10/2004"
    Dim i As Integer
    Dim sql2 As String
    'Majd : t.id as treat_id was added by me
    sql2 = "select  pct.id pctId,t.id as treat_id,  pct.disableIhala, pct.IhalaId, pct.state,pct.disable, t.name, t.note TreatOpt, pp.*, pct.kind, pct.tooth from Pic_Pics pp inner join Pic_ClientTreats pct on (pp.tooth=pct.tooth) inner join Pic_Treats t on (pct.treatid=t.id) " & _
              "where pp.treat=pct.treatid  and pct.IhalaId in (select Central_Exam_ID from Central_Exam where Patient_ID=" & Client_ID & " and Central_Exam_ID<=" & IhalaID & ") order by pct.ihalaId, pct.id, pp.id "
    '   Debug.Print sql2
    Set teethTreatsRS = ExecuteSelect(Conn, sql2, cancel)
    Dim rs As ADODB.Recordset
    Set rs = ExecuteSelect(Conn, "select * from Pic_TeethShot where clientId=" & Client_ID & " order by id", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    rs.MoveFirst
    For i = 1 To 32
        Set teeth(i) = New Tooth
        teeth(i).Init Picture1, rs!Tooth, ImageList1, ImageList2, tmpImg, rs!visible
        rs.MoveNext
    Next
    rs.Close
'    Set rs = ExecuteSelect(Conn, "select * from Central_Exam where Patient_ID=" & Client_ID & " and Central_Exam_ID>" & IhalaID, cancel)
'    If cancel Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight
'    Else
'        If Not rs.EOF Then
'            Editable = 0
'        End If
'    End If
    If CDbl(lblSumCost.Caption) >= maxRedValue Then
        NoWarning = False
    Else
        NoWarning = True
    End If
'    Set rs = ExecuteSelect(Conn, "select [Limit] as LimitPrice from Organization where Organization_ID=" & Organization_ID, Cancel)
'    If Cancel Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight
'    Else
'        If Not rs.EOF Then
'            MaxIhalaPrice = rs!LimitPrice
'        Else
'            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« . «·—Ã«¡ ≈€·«ﬁ «··ÊÕ… «·”‰Ì… Ê› ÕÂ« „‰ ÃœÌœ", vbMsgBoxRight
'        End If
'    End If
    If MaxIhalaPrice = 0 Then
        lblMaxTreats.Caption = "€Ì— „Õœœ"
    Else
        lblMaxTreats.Caption = MaxIhalaPrice
    End If
     '<AHMAD>
        MenuIsShowing = False
        
        '''„⁄«·Ã«  „Õ”Ê„…
        fg.ColComboList(3) = "#0;·«|#1;‰⁄„"
    '</AHMAD>
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    RefreshCommands frmCentral_Exam.btnSettings
End Sub

Private Sub frmOldTreats_OnCustomeButtonClick(ByVal Index As Integer)
    Select Case Index
    Case 0
        Set DrOldTreats.DataSource = frmOldTreats.master.rs
        DrOldTreats.Show 1
    End Select
End Sub

Private Sub llu2MagicMenusControl1_MenuItemClick(ByVal MenuItem As LLU2Ctl.IlluMenuItemClass)
    Dim minTooth As Integer
    Dim maxTooth As Integer
    
      Dim cancel As Boolean
        AddTreatToTooth MenuItem.SymbolicID, 100, ChkKind.Value, teeth(Tooth).state, "", minTooth, maxTooth
  '<MAJD>
   Dim rs1 As ADODB.Recordset
    Set rs1 = ExecuteSelect(Conn, "select dbo.sf_Get_Treatment_Total (" & str(IhalaID) & ") as Cost", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        If TransactionStarted Then
            Conn.RollbackTrans
        End If
        TransactionStarted = False
        Exit Sub
    Else
       If rs1.EOF = False Then
            TotalIhala = rs1!cost
       Else
            TotalIhala = 0
       End If
    End If
    rs1.Close
    If detail.rs.Filter <> 0 And CurrentTooth <> Tooth Then
        detail.rs.Filter = " numTeeth like '%" & ImageList1.ListImages(Tooth).Tag & "%'"
    End If
 
   If TotalIhala >= maxRedValue And NoWarning Then
        MsgBox "≈‰ ﬁÌ„… «·≈Õ«·… ﬁœ  Ã«Ê“  " & maxRedValue & " ·Ì—… ”Ê—Ì…° «·—Ã«¡ Ê÷⁄ «·Œ „ «·√Õ„—", vbCritical
        NoWarning = False
   End If
   '<MAJD>
    detail.rs.Requery
    If needsrequery Then
        needsrequery = False
        detail.rs.Requery
    End If
    If detail.rs.RecordCount = 0 Then
        Dim i As Integer
        For i = 0 To MAX_BUFF
            buff(i) = 0
        Next
        detail_doEOFReached detail.rs
    End If
    Dim rs As ADODB.Recordset
  
    Set rs = ExecuteSelect(Conn, "select * from Pic_TeethShot where  clientId=" & Client_ID & "   and tooth between " & minTooth & " and " & maxTooth & " order by id", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    teethTreatsRS.Requery
    Do While Not rs.EOF
        teeth(rs!id).Init2 rs!Tooth, rs!visible
        teeth(rs!id).Draw
        rs.MoveNext
    Loop
    rs.Close
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  '<MAJD>
  Dim temp As Long
  Dim ToothTag As String
  Dim ToothNum As String
  Dim TableCaption As String
  '</MAJD>
    If MenuIsShowing Then Exit Sub
      '<AHMAD>
        If Editable = 0 Then Exit Sub
    '</AHMAD>
    Tooth = GetClickedTooth(X, Y)
    '<Majd>
    If teeth(Tooth).ToothNum <> Tooth Then
        ToothNum = teeth(Tooth).ToothNum
        ToothTag = ToothNum
        TableCaption = "”Ã· „⁄«·Ã«  «·”‰ «··»‰Ì —ﬁ„ " & ToothNum & " (" & ImageList1.ListImages(Tooth).Tag & ")"
    Else
        ToothTag = ImageList1.ListImages(Tooth).Tag
        ToothNum = Tooth
        TableCaption = "”Ã· „⁄«·Ã«  «·”‰ —ﬁ„ " & ImageList1.ListImages(Tooth).Tag
    End If
    If Button = vbRightButton Then
        MenuIsShowing = True
        Create_Menu Tooth, teeth(Tooth).state
        p.Popup
    Else
    '<MAJD>
        If CurrentTooth <> Tooth Then
            CurrentTooth = Tooth
            detail.rs.Filter = " numTeeth like '%" & ToothTag & "%'"
            '<AHMAD>
            detailFrame.Caption = TableCaption
            '/<AHMAD>
        End If
    End If
    '</MAJD>
End Sub

Private Function GetClickedTooth(X As Single, Y As Single) As Integer
    Dim A As Integer
    Dim B As Integer
    Dim c As Integer
    
    A = (X / ImageList1.ImageWidth) - 0.5
    A = A + 1
    B = (2 * Y / (Picture1.Height / 15)) - 0.5
    If B = 0 Then
        GetClickedTooth = A + B * (16 - A + 1)
    Else
        GetClickedTooth = 16 + B * (16 - A + 1)
    End If
End Function
Private Sub AddTreatToTooth(treatId As String, cost As Double, KIND As Integer, state As String, notes As String, ByRef minTooth As Integer, ByRef maxTooth As Integer)
    Dim cancel As Boolean
    Dim ext1 As String 'the string holing teeth nums involved in this treat
    Dim sql
    Dim Sqlstate As String
    Dim sql1 As String
    Dim sure As VbMsgBoxResult
    
    'Majd:
If treatId = "-1" Then
    sure = MsgBox("·‰ Ì„ﬂ‰ﬂ «· —«Ã⁄ ⁄‰ √Ì ≈“«·… Ã”— ⁄·Ï Â–« «·”‰ ≈‰ ÊÃœ,Â· √‰  „ √ﬂœ √‰ﬂ  —Ìœ «· —«Ã⁄ ⁄‰ ﬁ·⁄ Â–« «·”‰ø", vbYesNo)
    If sure = vbNo Then
        Exit Sub
    End If
End If
If CheckIfTreatExist(IhalaID, treatId, Client_ID, teeth(Tooth).ToothNum, CDate(Central_Exam_Date)) = True Then
    MsgBox "·« Ì„ﬂ‰ ≈÷«›… «·„⁄«·Ã… ‰›”Â« „— Ì‰ ⁄·Ï «·”‰ ›Ì ‰›” «·≈Õ«·…"
    Exit Sub
End If
 If treatId <> "-2" Then 'It's not a mouth treat
       sql = "SET DATEFORMAT DMY exec sp_InsertClientTreat " & IhalaID & "," & treatId & "," & KIND & ",'" & CDate(treatDate) & "','" & state & "'," & teeth(Tooth).ToothNum & "," & Client_ID & ",'" & CDate(Central_Exam_Date) & "'"
 Else
    If treatId = "-2" Then  'A mouth Treat
        sql = "SET DATEFORMAT DMY exec sp_InsertClientTreat " & IhalaID & "," & treatId & "," & KIND & ",'" & CDate(treatDate) & "','" & state & "',-100," & Client_ID & ",'" & CDate(Central_Exam_Date) & "'"
     End If
 End If
 If treatId = "0" Or treatId = "-1" Then  'we are going to undo the last treatment for the tooth
       Dim rsstate As ADODB.Recordset  'Majd
       Dim rs1 As ADODB.Recordset
       '<Majd>:
       sql1 = "select max(id) pctId from Pic_ClientTreats pct where tooth= " & teeth(Tooth).ToothNum & _
        " or tooth=" & teeth(Tooth).ToothNum - 32 & " and disable=0 and IhalaID <= " & IhalaID
        '</MAJD>
        '<IYAD>
        ' sql1 = "select max(id) pctId from Pic_ClientTreats pct where tooth= "  & teeth(Tooth).ToothNum & _
         '" and IhalaID <= " & IhalaID
        ' </IYAD>
       Set rs1 = ExecuteSelect(Conn, sql1, cancel)
       If Not rs1.EOF Then
                Sqlstate = "select dbo.sf_Get_Tooth_State(" & teeth(Tooth).ToothNum & "," & Client_ID & "," & IhalaID & "," & rs1.Fields(0).Value & ")"
                rs1.Close
                Conn.BeginTrans
                TransactionStarted = True
                
                Set rsstate = ExecuteSelect(Conn, Sqlstate, cancel)
                If cancel Then
                    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« ° «·—Ã«¡ «·„Õ«Ê·… ·«Õﬁ«"
                    minTooth = teeth(Tooth).ToothNum
                    maxTooth = teeth(Tooth).ToothNum
                    Conn.RollbackTrans
                    TransactionStarted = False
                    Exit Sub
                End If
                If rsstate.EOF Then
                    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« ° ·„ Ì „ﬂ‰ «·‰Ÿ«„ „‰  ÕœÌœ «·”‰ «·„⁄œ·"
                    minTooth = teeth(Tooth).ToothNum
                    maxTooth = teeth(Tooth).ToothNum
                    Conn.RollbackTrans
                    TransactionStarted = False
                    Exit Sub
                End If
               state = str(rsstate.Fields(0).Value)  'we are going to return back the tooth to its old state
                sql = "SET DATEFORMAT DMY exec sp_InsertClientTreat " & IhalaID & "," & treatId & "," & KIND & ",'" & CDate(treatDate) & "','" & state & "'," & teeth(Tooth).ToothNum & "," & Client_ID & ",'" & CDate(Central_Exam_Date) & "'"
               rsstate.Close
               Conn.CommitTrans

       End If
End If

     Debug.Print sql
    Dim rs As ADODB.Recordset
    Conn.BeginTrans
    TransactionStarted = True

    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
       ' MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« ° «·—Ã«¡ «·„Õ«Ê·… ·«Õﬁ«" & vbNewLine & "ÌÃ»  ÕœÌœ ”⁄— «·„⁄«·Ã… , «·—Ã«¡ ≈œŒ«· ”⁄— «·„⁄«·Ã… „‰ ÀÊ«»  «·»—‰«„Ã"
        MsgBox "ÌÃ»  ÕœÌœ ”⁄— «·„⁄«·Ã… , «·—Ã«¡ ≈œŒ«· ”⁄— «·„⁄«·Ã… „‰ ÀÊ«»  «·»—‰«„Ã"
        minTooth = teeth(Tooth).ToothNum
        maxTooth = teeth(Tooth).ToothNum
        Conn.RollbackTrans
        TransactionStarted = False
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« ° ·„ Ì „ﬂ‰ «·‰Ÿ«„ „‰  ÕœÌœ «·”‰ «·„⁄œ·"
        minTooth = teeth(Tooth).ToothNum
        maxTooth = teeth(Tooth).ToothNum
        Conn.RollbackTrans
        TransactionStarted = False
        Exit Sub
    End If
    If treatId <> "-2" Then 'A tooth treat
        minTooth = rs!minTooth
        maxTooth = rs!maxTooth
    End If
    rs.Close
    If (minTooth = -1 And maxTooth = -1) Then ' this is the case of ≈“«·… ÷„… that cannot be applied
        MsgBox "·« Ì„ﬂ‰ ≈“«·… Â–Â «·÷„… ·√‰ «· ⁄ÊÌ÷ «·„— »ÿ ·« Ì„·ﬂ √Ì ÷„… √Œ—Ï"
        Exit Sub
    End If
    
   If (minTooth = -3 And maxTooth = -3) Then ' this is the case of ﬁ·⁄ where DAMMAH exists
        MsgBox "·« Ì„ﬂ‰ ﬁ·⁄ Â–« «·”‰ ≈·« »⁄œ ≈“«·… «·÷„… "
        Exit Sub
    End If
    
    If (minTooth = -4 And maxTooth = -4) Then ' this is the case of ﬁ·⁄ where DAMMAH exists
        MsgBox "·« Ì„ﬂ‰ «· —«Ã⁄ ⁄‰ ≈“«·… Â–« «·Ã”— ≈·« »⁄œ «· —«Ã⁄ ⁄‰ »⁄÷ «·√⁄„«· «·„Ã—«… ⁄·Ï »⁄÷ „ﬂÊ‰« Â "
        Exit Sub
    End If
 If (minTooth = -5 And maxTooth = -5) Then ' this is the case of ﬁ·⁄ where DAMMAH exists
        MsgBox "·« Ì„ﬂ‰ «· —«Ã⁄ ⁄‰ Â–Â «·„⁄«·Ã… ·√‰Â« √“Ì·  ›Ì ≈Õ«·… ·«Õﬁ…  "
        Exit Sub
 End If
 If (minTooth = -6 And maxTooth = -6) Then ' this is the case of ﬁ·⁄ where DAMMAH exists
        MsgBox "·« Ì„ﬂ‰ ≈“«·… Â–« «· «Ã ·√‰Â Ã“¡ „‰ Ã”— "
        Exit Sub
 End If
   If (minTooth = -10 And maxTooth = -10) Then ' this is the case of ﬁ·⁄ where DAMMAH exists
        MsgBox "·« Ì„ﬂ‰ ≈÷«›… «· «Ã Ê ≈“«· Â ›Ì ‰›” «·≈Õ«·…  "
        Exit Sub
 End If
End Sub
Private Function CheckIfTreatExist(ByRef IhalaID As Long, treatId As String, Client_ID As Long, ToothNum As Integer, Central_Exam_Date As Date)
    Dim sql As String
    Dim cancel As Boolean
    Dim rsFixToothTreat As ADODB.Recordset
    
     sql = " select Patient.full_name ,Patient.Patient_ID   ,Pic_ClientTreats.* " & _
        " From Pic_ClientTreats  inner join Pic_Treats on (Pic_ClientTreats.treatid=Pic_Treats.id) " & _
        " inner join Central_Exam on Central_Exam.Central_Exam_ID = Pic_ClientTreats.IhalaID  " & _
        " inner join Patient on Patient.Patient_ID = Central_Exam.Patient_ID  " & _
        " where Pic_Treats.note not like '%;virtu=true;%'  " & _
        "  and Pic_ClientTreats.parent<= 0 and IhalaID= " & IhalaID & _
        " and (disable=0 or (disable=1 and disableihala>= " & IhalaID & " ))  " & _
        " and IhalaID = " & IhalaID & "  and treatId =  " & treatId & "  and  Patient.Patient_ID= " & Client_ID & _
        " and   Pic_ClientTreats.Tooth =" & ToothNum
    Set rsFixToothTreat = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÌÊÃœ Œÿ√ ›Ì «Œ Ì«— —ﬁ„ «·„⁄«·Ã… ··≈÷«›… " & vbNewLine & " ﬂ—— «·⁄„·Ì… „‰ ›÷·ﬂ "
    End If
    If rsFixToothTreat.RecordCount <> 0 Then
        CheckIfTreatExist = True
    Else
         CheckIfTreatExist = False
    End If
    

End Function

Private Function GetParent(ByRef MenuArr As Variant, Top As Integer, parent As String) As Long
    Dim i As Integer
    GetParent = 0
    i = Top
    Do While i > 0
       If MenuArr(i).SymbolicID = parent Then
            GetParent = i
            Exit Function
       End If
       i = i - 1
    Loop
End Function

Private Sub Create_Menu(Tooth As Integer, state As String)
    If Editable = 0 Then Exit Sub
    
    Dim i As Integer
    p.Open "temp.mnu"
    Dim sql As String
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    '<MAJD>
   
    Dim MouthLastTreat As String
    Dim rs1 As ADODB.Recordset

    
      sql = " Select  dbo.sf_Get_Mouth_lastTreat(" & Tooth & "," & IhalaID & ")"
    Set rs1 = ExecuteSelect(Conn, sql, cancel)
     Debug.Print sql
    If Not cancel Then
       If rs1.EOF = False Then
          MouthLastTreat = rs1.Fields(0).Value
          rs1.Close
        End If
    End If
    
    teeth(Tooth).lastWorkName = ""
    teeth(Tooth).PrevIhalaWorkName = ""
   ' If Pic_TeethImg.teethTreatsRS.EOF = False Then
        sql = " exec sp_Get_LastWorksNames " & Tooth & "," & IhalaID & "," & Client_ID
        'teeth(Tooth).ToothNum

        Set rs = ExecuteSelect(Conn, sql, cancel)
      Debug.Print sql
        If Not cancel Then
            If rs.EOF = False Then
                If Not IsNull(rs!lastWorkName) Then
                    teeth(Tooth).lastWorkName = rs!lastWorkName
                    teeth(Tooth).PrevIhalaWorkName = rs!PrevIhalaWorkName
                 End If
                 rs.Close
             End If
        End If
   
   '</MAJD>
    
    sql = "select distinct p.* from Pic_Treats p, " & _
                    "(select pt.[left], pt.[right], pt.id from Pic_Treats pt inner join" & _
                    "      Pic_CommTeethTreat ptt on ptt.treatid = pt.id and ptt.organization_id=" & Organization_Id & " and ptt.available=1 " & _
                    " Where ptt.id =" & teeth(Tooth).ToothNum & _
                    ") pp, Pic_State s " & _
                " where (pp.[left] between p.[left] and p.[right])" & _
                "      and (pp.[right] between p.[left] and p.[right])" & _
                "      and s.treat=pp.id and s.state='" & state & "'and Treat_Availability=1" & _
                "       and p.id not in( select id from Pic_Treats  where parent = 266) " & _
                " order by num"
  'Debug.Print sql
 '  MsgBox "«·”‰ —ﬁ„ :   " & Tooth & "  «·Õ«·…: " & state & " —ﬁ„ " & teeth(Tooth).ToothNum
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    
    Dim Top As Integer
    Dim MenuArr(10) As lluMenuItemClass
    Top = 0
    Set MenuArr(0) = p.RootItem
    Dim check As String
    Dim AddToMenu As Boolean
    Do While Not rs.EOF
        AddToMenu = True
        
        check = GetTagValue(rs!note, "check")
        If check <> "" Then
            AddToMenu = ValidateCheck(check)
        End If
        If rs!id = 189 Then
            Debug.Print "dsfsdfds"
        End If
        
        If AddToMenu Then
            If IsNull(rs!parent) Then
                Top = 0
            Else
                Top = GetParent(MenuArr, Top, CStr(rs!parent))
            End If
            Set MenuArr(Top + 1) = MenuArr(Top).InsertLast
            Top = Top + 1
            MenuArr(Top).SymbolicID = CStr(rs!id)
            MenuArr(Top).Caption = rs!name
        End If
        rs.MoveNext
    Loop
    Dim MenuDel As lluMenuItemClass
    If teeth(Tooth).lastWorkName <> "" Then
       
        Set MenuDel = p.RootItem.InsertLast
        MenuDel.Caption = " —«Ã⁄ ⁄‰ " & teeth(Tooth).lastWorkName
        MenuDel.SymbolicID = "0"
        p.RootItem.InsertSeparator 0
       
       
    End If
       ' <MAJD>
    If teeth(Tooth).PrevIhalaWorkName <> "" Then
        
        Set MenuDel = p.RootItem.InsertLast
        MenuDel.Caption = " —«Ã⁄ ⁄‰ " & teeth(Tooth).PrevIhalaWorkName
        MenuDel.SymbolicID = "-1"
         
       
    End If
    If MouthLastTreat <> "" Then
        Set MenuDel = p.RootItem.InsertLast
        MenuDel.Caption = " —«Ã⁄ ⁄‰ " & MouthLastTreat
        MenuDel.SymbolicID = "-2"
        p.RootItem.InsertSeparator -2
    End If

   
    Dim mnu As lluMenuItemClass
    Set mnu = New lluMenuItemClass
    Set mnu = p.RootItem.GetChild("125")  ' ⁄ÊÌ÷
      If (mnu Is Nothing) = False Then
         If mnu.ItemCount = 0 Then
            p.RootItem.RemoveItem ("125")
         End If
      End If
 '</MAJD>
    rs.Close
    MenuIsShowing = False
End Sub

Private Sub Picture1_Paint()
    DrawPermanatTooth
End Sub
Private Function ValidateCheck(check As String) As Boolean
    Dim low As Integer
    Dim high As Integer
    Dim Top As Integer
    Select Case check
        Case "nearwithtaj":
            low = GetPrevEmpty
            high = GetNextEmpty
            Dim B As Boolean
            ValidateCheck = (CheckForTaj(low - 1) Or CheckForTaj(high + 1)) And ((high - low) >= 0)
            Exit Function
        Case "near":
            Dim valid As Boolean
            low = GetPrevEmpty
            high = GetNextEmpty
            If Tooth <= 16 Then
                valid = ((high - low) >= 0) And Not ValidateCheck("top") ' And Not IsLabaniFound(0)
                Top = 0 'top
                If valid Then
                    If UnremovedPermanentCount_InFak(Top) = 0 Then
                        valid = False
                    End If
                End If
            Else
                valid = ((high - low) >= 0) And Not ValidateCheck("bottom") 'And Not IsLabaniFound(1)
                Top = 1 'down
                If valid Then
                    If UnremovedPermanentCount_InFak(Top) = 0 Then
                        valid = False
                    End If
                End If
            End If
            If valid Then
                ValidateCheck = IsTaweedNotFoud(Top)
            Else
                ValidateCheck = valid
            End If
            Exit Function
        Case "nearmin":
            If Tooth <= 16 Then
                Top = 0 'top
            Else
                Top = 1 'down
            End If
            low = GetPrevEmpty
            high = GetNextEmpty
            ValidateCheck = ((high - low) >= 0) And IsTaweedNotFoud(Top) 'And Not IsLabaniFound(Top)
            Exit Function
        Case "top":
            If Tooth > 16 Then
                ValidateCheck = False
                Exit Function
            End If
            low = GetPrevEmpty
            high = GetNextEmpty
            ValidateCheck = (low = 1) And (high = 16) And Not IsLabaniFound(0)
            Exit Function
        Case "bottom":
            If Tooth <= 16 Then
                ValidateCheck = False
                Exit Function
            End If
            low = GetPrevEmpty
            high = GetNextEmpty
            ValidateCheck = (low = 17) And (high = 32) And Not IsLabaniFound(1)
            Exit Function
        Case "all":
            Dim low2 As Integer
            Dim high2 As Integer
            Dim auxTooth As Integer
            auxTooth = Tooth
            Tooth = 8
            low = GetPrevEmpty
            high = GetNextEmpty
            Tooth = 20
            low2 = GetPrevEmpty
            high2 = GetNextEmpty
            Tooth = auxTooth
            ValidateCheck = (low = 1) And (high = 16) And (low2 = 17) And (high2 = 32) And Not IsLabaniFound(0) And Not IsLabaniFound(1)
            Exit Function
        Case "taweedtop":
            ValidateCheck = Not IsTaweedNotFoud(0)
            Exit Function
        Case "taweeddown":
            ValidateCheck = Not IsTaweedNotFoud(1)
            Exit Function
        Case "taweedfound":
            If Tooth <= 16 Then
                    ValidateCheck = Not IsTaweedNotFoud(0)
            Else
                    ValidateCheck = Not IsTaweedNotFoud(1)
            End If
            Exit Function
    End Select
    ValidateCheck = False
End Function
Private Function LabaniCount_InFak(FakId As Integer) As Integer
'<MAJD>


    Dim i, cnt As Integer
    cnt = 0
    For i = (1 + FakId * 16) To (16 + FakId * 16)
        If teeth(i).ToothNum <> i Then
            cnt = cnt + 1
        End If
    Next
    LabaniCount_InFak = cnt
End Function
Private Function UnremovedPermanentCount_InFak(FakId As Integer) As Integer
'<MAJD>


    Dim i, cnt As Integer
    cnt = 0
    For i = (1 + FakId * 16) To (16 + FakId * 16)
        If teeth(i).state <> "6" And teeth(i).visible = 1 Then
           If teeth(i).ToothNum = i Then  'Permenant
              cnt = cnt + 1
           End If
        End If
    Next
    UnremovedPermanentCount_InFak = cnt
End Function

Private Function IsLabaniFound(FakId As Integer) As Boolean
'<MAJD>
'This function is necessary bcz I won't let any Taeweed if a labani exists

    Dim i As Integer
    For i = (1 + FakId * 16) To (16 + FakId * 16)
        If teeth(i).ToothNum <> i Then
            IsLabaniFound = True
            Exit Function
        End If
    Next
    IsLabaniFound = False
End Function


Private Function CanAddTaeweed(FakId As Integer) As Boolean
'<MAJD>
'This function is necessary bcz I can add a partial taeweed if a labani exists
' and but it's not between the removed teeth

    Dim i As Integer
    For i = (1 + FakId * 16) To (16 + FakId * 16)
        If teeth(i).ToothNum <> i Then
            CanAddTaeweed = True
            Exit Function
        End If
    Next
    CanAddTaeweed = False
End Function
Private Function IsTaweedNotFoud(Top As Integer) As Boolean
    Dim i As Integer
    For i = Top * 16 + 1 To Top * 16 + 16
        If teeth(i).state = 9 Then
            IsTaweedNotFoud = False
            Exit Function
        End If
    Next
    IsTaweedNotFoud = True
End Function

Private Function GetPrevEmpty() As Integer
Dim i As Integer
i = Tooth
If Tooth <= 16 Then
    Do While i >= 1
        If teeth(i).state <> "6" Then
            GetPrevEmpty = i + 1
            Exit Function
        End If
        i = i - 1
    Loop
    GetPrevEmpty = 1
Else
    Do While i >= 17
        If teeth(i).state <> "6" Then
            GetPrevEmpty = i + 1
            Exit Function
        End If
        i = i - 1
    Loop
    GetPrevEmpty = 17
End If
End Function
Private Function GetNextEmpty() As Integer
Dim i As Integer
i = Tooth
If Tooth <= 16 Then
    Do While i <= 16
        If teeth(i).state <> "6" Then
            GetNextEmpty = i - 1
            Exit Function
        End If
        i = i + 1
    Loop
    GetNextEmpty = 16
Else
    Do While i <= 32
        If teeth(i).state <> "6" Then
            GetNextEmpty = i - 1
            Exit Function
        End If
        i = i + 1
    Loop
    GetNextEmpty = 32
End If
End Function

Private Function CheckForTaj(N As Integer) As Boolean
    If (Tooth <= 16) Then
        If Not (N <= 16 And N >= 1) Then
            CheckForTaj = False
            Exit Function
        End If
    Else
        If Not (N <= 32 And N >= 17) Then
            CheckForTaj = False
            Exit Function
        End If
    End If
    CheckForTaj = teeth(N).state = "0" Or teeth(N).state = "-1" _
                  Or teeth(N).state = "2" Or teeth(N).state = "14" Or teeth(N).state = "3" _
                  Or teeth(N).state = "4" Or teeth(N).state = "5" Or teeth(N).state = "11" _
                  Or teeth(N).state = "15" Or teeth(N).state = "16" Or teeth(N).state = "17"
End Function



