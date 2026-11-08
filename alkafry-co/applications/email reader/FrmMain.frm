VERSION 5.00
Begin VB.Form FrmMain 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   11490
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   15330
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   11.25
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FrmMain.frx":0000
   ScaleHeight     =   11490
   ScaleWidth      =   15330
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   2865
      Index           =   6
      Left            =   8340
      MultiLine       =   -1  'True
      TabIndex        =   7
      Top             =   8010
      Width           =   3915
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   375
      Index           =   5
      Left            =   8325
      TabIndex        =   6
      Top             =   7290
      Width           =   3930
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   375
      Index           =   4
      Left            =   8325
      TabIndex        =   5
      Top             =   6645
      Width           =   3930
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   375
      Index           =   3
      Left            =   8325
      TabIndex        =   4
      Top             =   6015
      Width           =   3930
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   375
      Index           =   2
      Left            =   8325
      TabIndex        =   3
      Top             =   5385
      Width           =   3930
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   375
      Index           =   1
      Left            =   8325
      TabIndex        =   2
      Top             =   4740
      Width           =   3930
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F5C183&
      Height          =   375
      Index           =   0
      Left            =   8340
      TabIndex        =   1
      Top             =   4140
      Width           =   3930
   End
   Begin VB.ListBox DataList 
      BackColor       =   &H00F5C183&
      DataSource      =   "Data"
      Height          =   9240
      Left            =   480
      TabIndex        =   0
      Top             =   1815
      Width           =   1695
   End
   Begin VB.Image Image1 
      Height          =   1140
      Left            =   3720
      ToolTipText     =   "⁄Êœ…"
      Top             =   9870
      Width           =   1230
   End
   Begin VB.Image imgExit 
      Height          =   1140
      Left            =   5655
      ToolTipText     =   "Œ—ÊÃ"
      Top             =   9855
      Width           =   1065
   End
   Begin VB.Label lblDate 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   5340
      TabIndex        =   9
      Top             =   2475
      Width           =   5505
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   26.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   4650
      TabIndex        =   8
      Top             =   1290
      Width           =   6795
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub DataList_Click()
Set ado = CreateObject("ADODB.connection")
ado.connectionstring = "provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\database\email.mdb"
ado.open
Set rs = ado.Execute("select * from email where rcity='" & sqlCity & "' and rkind='" & sqlKind & "' and rbuild='" & sqlBuild & "' and rname='" & DataList.Text & "'")
txtID(0).Text = rs("rname")
txtID(1).Text = rs("rphone")
txtID(2).Text = rs("remail")
txtID(3).Text = rs("raddress")
txtID(4).Text = rs("rspace")
txtID(5).Text = rs("rprice")
txtID(6).Text = rs("rdescription")
lblDate.Caption = rs("rdate")

End Sub

Private Sub Form_Activate()
If bytKind = 0 Then
    strKind = "»Ì⁄"
    sqlKind = "sell"
Else
    strKind = "‘—«¡"
    sqlKind = "buy"
End If

Select Case bytBuild
    Case 0
        strBuild = "‘ﬁﬁ"
        sqlBuild = "flat"
    Case 1
        strBuild = "„Õ·« "
        sqlBuild = "store"
    Case 2
        strBuild = "√—«÷Ì"
        sqlBuild = "ground"
    Case 3
        strBuild = "⁄ﬁ«—« "
        sqlBuild = "build"
    Case 4
        strBuild = "›Ì·« "
        sqlBuild = "vela"
    Case 5
        strBuild = "„‘«—Ì⁄"
        sqlBuild = "tour"
End Select

Select Case BytCity
    Case 0
        strCity = "œ„‘ﬁ"
        sqlCity = "damas"
    Case 1
        strCity = "«·”ÊÌœ«¡"
        sqlCity = "swida"
    Case 2
        strCity = "œ—⁄«"
        sqlCity = "daraa"
    Case 3
        strCity = "«··«–ﬁÌ…"
        sqlCity = "latakia"
    Case 4
        strCity = "ÿ—ÿÊ”"
        sqlCity = "tartous"
    Case 5
        strCity = "Õ„’"
        sqlCity = "homs"
    Case 6
        strCity = "Õ·»"
        sqlCity = "aleppo"
    Case 7
        strCity = "Õ„«…"
        sqlCity = "hama"
    Case 8
        strCity = "≈œ·»"
        sqlCity = "idleb"
    Case 9
        strCity = "«·—ﬁ…"
        sqlCity = "raqa"
    Case 10
        strCity = "œÌ— «·“Ê—"
        sqlCity = "zor"
    Case 11
        strCity = "«·Õ”ﬂ…"
        sqlCity = "hasaka"
End Select
DataList.Clear
lblDate.Caption = ""
For Rep = 0 To 6
    txtID(Rep).Text = ""
Next Rep
Set ado = CreateObject("ADODB.connection")
ado.connectionstring = "provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\database\email.mdb"
ado.open
Set rs = ado.Execute("select * from email where rcity='" & sqlCity & "' and rkind='" & sqlKind & "' and rbuild='" & sqlBuild & "'")
On Error Resume Next
Do While Not rs.EOF
    DataList.AddItem rs("rname")
    rs.MoveNext
Loop
ado.colse
lblCaption.Caption = strKind & " " & strBuild & " ›Ì „Õ«›Ÿ… " & strCity
End Sub

Private Sub Image1_Click()
    FrmChoose.Show
    FrmMain.Hide
End Sub

Private Sub imgExit_Click()
    End
End Sub
