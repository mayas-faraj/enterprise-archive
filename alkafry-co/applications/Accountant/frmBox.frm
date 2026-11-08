VERSION 5.00
Begin VB.Form frmBox 
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
   Picture         =   "frmBox.frx":0000
   RightToLeft     =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15240
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.TextBox Text14 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   43
      Top             =   6840
      Width           =   2655
   End
   Begin VB.TextBox Text13 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   41
      Top             =   8640
      Width           =   2655
   End
   Begin VB.TextBox Text12 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   39
      Top             =   5640
      Width           =   2655
   End
   Begin VB.TextBox txtSolfa 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   37
      Top             =   3600
      Width           =   2655
   End
   Begin VB.ComboBox cmbGroub 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   35
      Top             =   4320
      Width           =   2655
   End
   Begin VB.TextBox Text11 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   33
      Top             =   6240
      Width           =   2655
   End
   Begin VB.ComboBox cmbKind 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   32
      Top             =   4320
      Width           =   2655
   End
   Begin VB.TextBox Text10 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   29
      Top             =   3600
      Width           =   2655
   End
   Begin VB.TextBox Text8 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   28
      Top             =   5040
      Width           =   2655
   End
   Begin VB.ComboBox cmbToYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmBox.frx":1726A
      Left            =   3840
      List            =   "frmBox.frx":1729B
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   1800
      Width           =   975
   End
   Begin VB.ComboBox cmbToMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   4920
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   1800
      Width           =   735
   End
   Begin VB.ComboBox cmbToDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   1800
      Width           =   735
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00FFFFC0&
      Caption         =   "⁄—÷ «·„Ã«·"
      Height          =   495
      Left            =   7680
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   1800
      Width           =   3735
   End
   Begin VB.TextBox Text9 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   8640
      Width           =   2655
   End
   Begin VB.TextBox Text7 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   6240
      Width           =   2655
   End
   Begin VB.TextBox Text6 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   5640
      Width           =   2655
   End
   Begin VB.TextBox Text5 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   6840
      Width           =   2655
   End
   Begin VB.TextBox Text4 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   7440
      Width           =   2655
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFFFC0&
      Caption         =   "⁄—÷ «·„⁄·Ê„« "
      Height          =   495
      Left            =   7680
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   1200
      Width           =   3735
   End
   Begin VB.ComboBox cmbYear 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmBox.frx":172F9
      Left            =   3885
      List            =   "frmBox.frx":1732A
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1200
      Width           =   975
   End
   Begin VB.ComboBox cmbMonth 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      ItemData        =   "frmBox.frx":17388
      Left            =   4965
      List            =   "frmBox.frx":1738A
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1200
      Width           =   735
   End
   Begin VB.ComboBox cmbDay 
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   5805
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   1200
      Width           =   615
   End
   Begin VB.CommandButton Command4 
      BackColor       =   &H00FFFFC0&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   8003
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   10200
      Width           =   1815
   End
   Begin VB.CommandButton Command5 
      BackColor       =   &H00FFFFC0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   5213
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   10200
      Width           =   1815
   End
   Begin VB.TextBox Text3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2633
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   9600
      Width           =   7455
   End
   Begin VB.TextBox Text2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   5040
      Width           =   2655
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      Height          =   405
      Left            =   7680
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   8040
      Width           =   2655
   End
   Begin VB.Label Label18 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·œÌÊ‰ «·„ﬁ»Ê÷…"
      Height          =   375
      Left            =   5580
      RightToLeft     =   -1  'True
      TabIndex        =   44
      Top             =   6840
      Width           =   1935
   End
   Begin VB.Line Line22 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      X1              =   13080
      X2              =   12840
      Y1              =   8640
      Y2              =   8880
   End
   Begin VB.Line Line21 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      X1              =   12840
      X2              =   13080
      Y1              =   8880
      Y2              =   9120
   End
   Begin VB.Line Line20 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      X1              =   13080
      X2              =   12840
      Y1              =   8040
      Y2              =   8280
   End
   Begin VB.Line Line19 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      X1              =   12840
      X2              =   13080
      Y1              =   8280
      Y2              =   8520
   End
   Begin VB.Line Line18 
      BorderWidth     =   3
      X1              =   2520
      X2              =   2640
      Y1              =   9120
      Y2              =   8880
   End
   Begin VB.Line Line17 
      BorderWidth     =   3
      X1              =   2520
      X2              =   2640
      Y1              =   8640
      Y2              =   8880
   End
   Begin VB.Line Line16 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   2040
      X2              =   2640
      Y1              =   8880
      Y2              =   8880
   End
   Begin VB.Line Line15 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   2040
      X2              =   2040
      Y1              =   5280
      Y2              =   8880
   End
   Begin VB.Line Line14 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   2520
      X2              =   2040
      Y1              =   6480
      Y2              =   6480
   End
   Begin VB.Line Line13 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   2520
      X2              =   2040
      Y1              =   5880
      Y2              =   5880
   End
   Begin VB.Line Line12 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   2520
      X2              =   2040
      Y1              =   5280
      Y2              =   5280
   End
   Begin VB.Line Line11 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   13920
      X2              =   12840
      Y1              =   8880
      Y2              =   8880
   End
   Begin VB.Line Line10 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   13920
      X2              =   13920
      Y1              =   5160
      Y2              =   8880
   End
   Begin VB.Line Line9 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   12600
      X2              =   13920
      Y1              =   5160
      Y2              =   5160
   End
   Begin VB.Line Line8 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   13440
      X2              =   12840
      Y1              =   8280
      Y2              =   8280
   End
   Begin VB.Line Line7 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   13440
      X2              =   13440
      Y1              =   7080
      Y2              =   8280
   End
   Begin VB.Line Line6 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   12840
      X2              =   13440
      Y1              =   7080
      Y2              =   7080
   End
   Begin VB.Line Line5 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      X1              =   12840
      X2              =   13440
      Y1              =   7680
      Y2              =   7680
   End
   Begin VB.Label Label17 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "—»Õ «·„»Ì⁄«  «·ﬂ·Ì…"
      Height          =   375
      Left            =   10680
      RightToLeft     =   -1  'True
      TabIndex        =   42
      Top             =   8040
      Width           =   1935
   End
   Begin VB.Label Label16 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„»Ì⁄«  «·€Ì— „ﬁ»Ê÷…"
      Height          =   375
      Left            =   10560
      RightToLeft     =   -1  'True
      TabIndex        =   40
      Top             =   5640
      Width           =   2175
   End
   Begin VB.Label Label15 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "„Ã„Ê⁄ «·œÌÊ‰"
      Height          =   375
      Left            =   5640
      RightToLeft     =   -1  'True
      TabIndex        =   38
      Top             =   3600
      Width           =   1935
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "„‰ √Ã· «·„Ã„Ê⁄…"
      Height          =   375
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   36
      Top             =   4320
      Width           =   1575
   End
   Begin VB.Line Line4 
      BorderWidth     =   3
      DrawMode        =   5  'Not Copy Pen
      X1              =   2760
      X2              =   12720
      Y1              =   4800
      Y2              =   4800
   End
   Begin VB.Label Label14 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·ﬂ„Ì… «·„»«⁄…"
      Height          =   375
      Left            =   10560
      RightToLeft     =   -1  'True
      TabIndex        =   34
      Top             =   6240
      Width           =   2175
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "„‰ √Ã· «·„«œ…"
      Height          =   375
      Left            =   10680
      RightToLeft     =   -1  'True
      TabIndex        =   31
      Top             =   4320
      Width           =   1575
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   " ﬂ·›… «·ﬁÿ⁄ «·„ Ê›—…"
      Height          =   375
      Left            =   10560
      RightToLeft     =   -1  'True
      TabIndex        =   30
      Top             =   3600
      Width           =   1935
   End
   Begin VB.Line Line3 
      BorderWidth     =   3
      DrawMode        =   5  'Not Copy Pen
      X1              =   2760
      X2              =   12720
      Y1              =   4080
      Y2              =   4080
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      DrawMode        =   5  'Not Copy Pen
      X1              =   2760
      X2              =   12720
      Y1              =   9240
      Y2              =   9240
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   2760
      X2              =   12720
      Y1              =   8520
      Y2              =   8520
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«·„»Ì⁄«  «·„ﬁ»Ê÷…"
      Height          =   495
      Left            =   10680
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   5040
      Width           =   1695
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„œ›Ê⁄«  «·’«›Ì…"
      Height          =   375
      Left            =   5580
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   8640
      Width           =   1935
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·Õ”Ê„« "
      Height          =   375
      Left            =   5580
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   6240
      Width           =   1935
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·’«œ— ⁄‰ «·‘—ﬂ« "
      Height          =   375
      Left            =   5580
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   5640
      Width           =   1935
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "—»Õ «·„»Ì⁄«  «·„œ›Ê⁄…"
      Height          =   375
      Left            =   10680
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   6840
      Width           =   1935
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "—»Õ «·„»Ì⁄«  «·€Ì— „œ›Ê⁄…"
      Height          =   375
      Left            =   10560
      RightToLeft     =   -1  'True
      TabIndex        =   15
      Top             =   7440
      Width           =   2175
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ"
      Height          =   375
      Left            =   6645
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1200
      Width           =   615
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·»«ﬁÌ «·’«›Ì"
      Height          =   375
      Left            =   10200
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   9600
      Width           =   1935
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·„‘ —Ì«  «·ÌÊ„Ì…"
      Height          =   375
      Left            =   5580
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   5040
      Width           =   1935
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "«·œ«Œ· «·ﬂ·Ì"
      Height          =   375
      Left            =   10500
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   8640
      Width           =   1935
   End
End
Attribute VB_Name = "frmBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbGroub_Change()
    cmbGroub_Click
End Sub

Private Sub cmbGroub_Click()
    cmbKind.Text = ""
End Sub

Private Sub cmbKind_Change()
    cmbKind_Click
End Sub

Private Sub cmbKind_Click()
    cmbGroub.Text = ""
End Sub

Private Sub Command1_Click()
    Text1.Text = 0
    Text2.Text = 0
    Text3.Text = 0
    Text4.Text = 0
    Text5.Text = 0
    Text6.Text = 0
    Text7.Text = 0
    Text8.Text = 0
    Text9.Text = 0
    Text11.Text = 0
    Text12.Text = 0
    Text14.Text = 0
    
    If cmbKind.Text <> "" Then
        SelSQL = "select * from tbldata where dmat='" & cmbKind.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    ElseIf cmbGroub.Text <> "" Then
        SelSQL = "select * from tbldata where dmat like '" & cmbGroub.Text & "%' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tbldata where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text5.Text = Text5.Text + CInt(Rs("dwin"))
        Text8.Text = Text8.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    
    If cmbKind.Text <> "" Then
        SelSQL = "select * from tblguest where dmat='" & cmbKind.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    ElseIf cmbGroub.Text <> "" Then
        SelSQL = "select * from tblguest where dmat like '" & cmbGroub.Text & "%' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tblguest where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text4.Text = Text4.Text + CInt(Rs("dwin"))
        Text12.Text = Text12.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    
    If cmbKind.Text = "" And cmbGroub.Text = "" Then
    SelSQL = "select * from tblguest where dmat='" & "œ›⁄… ⁄·Ï «·Õ”«»" & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text8.Text = Text8.Text + CInt(Rs("dpay"))
        Text14.Text = Text14.Text + CInt(Rs("dpay"))
        Rs.movenext
    Loop
    End If
    
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text2.Text = Text2.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    SelSQL = "select dmoney from tblcoout where ddate1=" & cmbDay.Text & " / " & cmbMonth.Text & " / " & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text6.Text = Text6.Text + CInt(Rs("dmoney"))
        Text9.Text = Text9.Text + CInt(Rs("dmoney"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblout where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text & " and ddes like '" & "Õ”„ ›« Ê—…" & "%'"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text7.Text = Text7.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    
    SelSQL = "select * from tblguest where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text & " and ddes='" & "œ›⁄… ⁄·Ï «·Õ”«»" & "'"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text14.Text = Text14.Text + CInt(Rs("dpay"))
        Rs.movenext
    Loop
    
    Text13.Text = Text8.Text
    Text3 = Text8 - Text9
End Sub

Private Sub Command2_Click()
    Dim dCopy As String
    
    Text1.Text = 0
    Text2.Text = 0
    Text3.Text = 0
    Text4.Text = 0
    Text5.Text = 0
    Text6.Text = 0
    Text7.Text = 0
    Text8.Text = 0
    Text9.Text = 0
    Text11.Text = 0
    Text12.Text = 0
    Text14.Text = 0
    
    dCopy = " dday>=" & cmbDay.Text & " and dmonth>=" & cmbMonth.Text & " and dyear>=" & cmbYear.Text & " and dday<=" & cmbToDay.Text & " and dmonth<=" & cmbToMonth.Text & " and dyear<=" & cmbToYear.Text
    If cmbKind.Text <> "" Then
        SelSQL = "select * from tbldata where dmat='" & cmbKind.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    ElseIf cmbGroub.Text <> "" Then
        SelSQL = "select * from tbldata where dmat='" & cmbGroub.Text & "' and dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    Else
        SelSQL = "select * from tbldata where dday=" & cmbDay.Text & " and dmonth=" & cmbMonth.Text & " and dyear=" & cmbYear.Text
    End If
    
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text5.Text = Text5.Text + CInt(Rs("dwin"))
        Text8.Text = Text8.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    
    If cmbKind.Text = "" Then
        SelSQL = "select * from tblguest where" & dCopy
    Else
        SelSQL = "select * from tblguest where dmat='" & cmbKind.Text & "' and" & dCopy
    End If
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text1.Text = Text1.Text + CInt(Rs("dwin"))
        Text4.Text = Text4.Text + CInt(Rs("dwin"))
        Text12.Text = Text12.Text + CInt(Rs("dprice"))
        Text11.Text = Text11.Text + CInt(Rs("dnum"))
        Rs.movenext
    Loop
    
    SelSQL = "select * from tblguest where dmat='" & "œ›⁄… ⁄·Ï «·Õ”«»" & "' and " & dCopy
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
       Text8.Text = Text8.Text + CInt(Rs("dpay"))
       Text14.Text = Text14.Text + CInt(Rs("dpay"))
        Rs.movenext
    Loop
    
    SelSQL = "select * from tblout where" & dCopy
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text2.Text = Text2.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    SelSQL = "select dmoney from tblcoout where ddate1=" & cmbDay.Text & " / " & cmbMonth.Text & " / " & cmbYear.Text
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text6.Text = Text6.Text + CInt(Rs("dmoney"))
        Text9.Text = Text9.Text + CInt(Rs("dmoney"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblout where ddes like '" & "Õ”„ ›« Ê—…" & "%'  and" & dCopy
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text6.Text = Text6.Text + CInt(Rs("dprice"))
        Text9.Text = Text9.Text + CInt(Rs("dprice"))
        Rs.movenext
    Loop
    
    Text13.Text = Text8.Text
    Text3 = Text8 - Text9
End Sub

Private Sub Command4_Click()
    frmMain.Show
    frmBox.Hide
End Sub

Private Sub Command5_Click()
    ExitPro
End Sub

Private Sub Form_Load()
    On Error Resume Next
    Text10.Text = 0
    txtSolfa.Text = 0
    For Rep = 1 To 31
        cmbDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbMonth.List(Rep - 1) = Rep
    Next Rep
    cmbDay.Text = Day(Now)
    cmbMonth.Text = Month(Now)
    cmbYear.Text = Year(Now)
    
    For Rep = 1 To 31
        cmbToDay.List(Rep - 1) = Rep
        If Rep <= 12 Then cmbToMonth.List(Rep - 1) = Rep
    Next Rep
    
    cmbToDay.Text = Day(Now)
    cmbToMonth.Text = Month(Now)
    cmbToYear.Text = Year(Now)
    
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\accountdata.mdb"
    Set ADO = CreateObject("ADODB.connection")
    ADO.connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & Appl
    ADO.open
    SelSQL = "select dname from tblkind"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbKind.List(Rep) = Rs("dname")
        Rep = Rep + 1
        Rs.movenext
    Loop
    
    SelSQL = "select dgroub from tblkind group by dgroub"
    Set Rs = ADO.execute(SelSQL)
    Rep = 0
    Do While Not Rs.EOF
        cmbGroub.List(Rep) = Rs("dgroub")
        Rep = Rep + 1
        Rs.movenext
    Loop
    SelSQL = "select * from tblkind order by dname"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        Text10.Text = Text10.Text + (Rs("dprice") * Rs("dlot"))
        Rs.movenext
    Loop
    SelSQL = "select * from tblguest"
    Set Rs = ADO.execute(SelSQL)
    Do While Not Rs.EOF
        txtSolfa.Text = txtSolfa.Text + CDbl(Rs("drest")) - CDbl(Rs("dpay"))
        Rs.movenext
    Loop
    
    Command1_Click
End Sub
