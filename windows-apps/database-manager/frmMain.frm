VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Data Base Recorder"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
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
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtImage 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   6
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Text            =   "0"
      Top             =   4560
      Width           =   3615
   End
   Begin VB.CommandButton CmdSave 
      BackColor       =   &H00FFFF80&
      Caption         =   "≈œŒ«· «·»Ì«‰« "
      Height          =   495
      Left            =   9240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   5040
      Width           =   5175
   End
   Begin VB.TextBox details 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FFFF80&
      Height          =   8535
      Left            =   480
      MultiLine       =   -1  'True
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   1680
      Width           =   8415
   End
   Begin VB.TextBox txtdescription 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   100
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   4080
      Width           =   3615
   End
   Begin VB.TextBox txtprice 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   30
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   3600
      Width           =   3615
   End
   Begin VB.TextBox txtspace 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   20
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   3120
      Width           =   3615
   End
   Begin VB.TextBox txtfulladdress 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   100
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   2640
      Width           =   3615
   End
   Begin VB.TextBox txtaddress 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   20
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   2160
      Width           =   3615
   End
   Begin VB.TextBox txtnameid 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Height          =   375
      Left            =   9240
      MaxLength       =   10
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1680
      Width           =   3615
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·’Ê—"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   17
      Top             =   4560
      Width           =   1215
   End
   Begin VB.Image Image1 
      Height          =   6000
      Left            =   7920
      Picture         =   "frmMain.frx":1762
      Top             =   5640
      Width           =   9000
   End
   Begin VB.Label lblcap 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "≈œ«—… ﬁÊ«⁄œ «·»Ì«‰« "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   3833
      TabIndex        =   14
      Top             =   240
      Width           =   7575
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«· ›«’Ì·"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   4560
      TabIndex        =   6
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "„·«ÕŸ« "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   5
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·”⁄—"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   4
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·„”«Õ…"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   3
      Top             =   3120
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·⁄‰Ê«‰"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   2
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·„‰ÿﬁ…"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "«·≈”„"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   13080
      TabIndex        =   0
      Top             =   1680
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub CmdSave_Click()
Dim ADO, AddData, RS
Set ADO = CreateObject("ADODB.Connection")
ADO.connectionstring = "provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\primary.mdb"
ADO.open
AddData = "insert into details (nameid,address,fulladdress,espace,price,details,description,images) values ('" & txtnameid.Text & "','" & txtaddress.Text & "','" & txtfulladdress.Text & "','" & txtspace.Text & "','" & txtprice.Text & "','" & details.Text & "','" & txtdescription.Text & "','" & txtImage.Text & "')"
Set RS = ADO.execute(AddData)
ADO.Close
Set ADO = Nothing
txtnameid.Text = ""
txtaddress.Text = ""
txtfulladdress.Text = ""
txtspace.Text = ""
txtprice.Text = ""
details.Text = ""
txtdescription.Text = ""
txtImage.Text = ""
'AddData = "insert into details (nameid,address,fulladdress,space,price,details,description,images) values ('" & txtnameid.Text & "','" & txtaddress.Text & "','" & txtfulladdress.Text & "','" & txtspace.Text & "','" & txtprice.Text & "','" & details.Text & "','" & txtdescription.Text & "','" & txtImage.Text & "')"
'Set RS = ADO.execute(AddData)
End Sub

