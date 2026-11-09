VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form dlgPriceApplay 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " ÿ»Ìﬁ √”⁄«— «·„⁄«·Ã« "
   ClientHeight    =   1470
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7380
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   1470
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MSComCtl2.DTPicker dpIhalaOrFixDate 
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   360
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   450
      _Version        =   393216
      CustomFormat    =   "dd/MM/yyyy"
      Format          =   58982403
      CurrentDate     =   41602
   End
   Begin VB.ComboBox cmbIhalaOrFix 
      Height          =   315
      Index           =   1
      ItemData        =   "dlgPriceApplay.frx":0000
      Left            =   3000
      List            =   "dlgPriceApplay.frx":000A
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   360
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "„Ê«›ﬁ"
      Height          =   375
      Left            =   1560
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "√ﬂ»— „‰"
      Height          =   255
      Left            =   2160
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   360
      Width           =   615
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   " ÿ»ﬁ «· ”⁄Ì—… 2 ⁄·Ï «·≈Õ«·«  «· Ì  «—ÌŒ"
      Height          =   255
      Left            =   4320
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   360
      Width           =   2895
   End
End
Attribute VB_Name = "dlgPriceApplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Command2_Click()
Dim sql As String
sql = "set dateformat dmy update [FixExam] set IhalaOrFix = " & cmbIhalaOrFix.Item(1).ListIndex + 1 & ",IhalaOrFixDate = '" & dpIhalaOrFixDate.Value & "'"
Dim c As Boolean
ExecuteCommand Conn, sql, c
Unload Me
End Sub

Private Sub Form_Load()
Dim ihalaOrFix As Integer
Dim sql As String
'ActiveDatabaseName = "Default"
sql = "select IhalaOrFix from [FixExam]"
Dim rs2 As ADODB.Recordset
Dim cancel As Boolean
Set rs2 = ExecuteSelect(Conn, sql, cancel)
cmbIhalaOrFix.Item(1).ListIndex = rs2!ihalaOrFix - 1
sql = "select IhalaOrFixDate from [FixExam]"
Set rs2 = ExecuteSelect(Conn, sql, cancel)
dpIhalaOrFixDate.Value = rs2!IhalaOrFixDate
End Sub
