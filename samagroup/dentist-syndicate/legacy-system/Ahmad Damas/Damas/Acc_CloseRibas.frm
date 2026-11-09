VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_CloseRibas 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ÇáãÍÇÓÈÉ "
   ClientHeight    =   4770
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2865
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   4770
   ScaleWidth      =   2865
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Height          =   1575
      Left            =   0
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   2520
      Visible         =   0   'False
      Width           =   2895
      Begin VB.TextBox txtFirst_Check_No 
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   240
         Width           =   1575
      End
      Begin MSComCtl2.DTPicker dtCheck_No 
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40038
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "ÑÞã Ãæá Ôíß"
         Height          =   255
         Left            =   1800
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   300
         Width           =   975
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "ÊÇÑíÎ ÇáÔíß"
         Height          =   255
         Left            =   1800
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   1020
         Width           =   975
      End
   End
   Begin VB.CommandButton Command16 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÅÞÝÇá ÇáÑÈÚ ÇáËÇäí"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   720
      Width           =   2655
   End
   Begin VB.CommandButton Command15 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÅÞÝÇá ÇáÑÈÚ ÇáËÇáË"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1320
      Width           =   2655
   End
   Begin VB.CommandButton Command14 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÅÞÝÇá ÇáÑÈÚ ÇáÑÇÈÚ"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1920
      Width           =   2655
   End
   Begin VB.CommandButton Command13 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÅÞÝÇá ÇáÑÈÚ ÇáÃæá"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   120
      Width           =   2655
   End
   Begin VB.CommandButton CEnd 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÚæÏÉ"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   4200
      Width           =   2655
   End
End
Attribute VB_Name = "Acc_CloseRibas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Integer
Function chk_entries() As Boolean
    If fra.visible = True And txtFirst_Check_No.text = "" Then
        Beep
        MsgBox "íÌÈ ÅÏÎÇá ÑÞã Ãæá Ôíß ÞÈá ÇáÈÏÁ ÈÚãáíÉ ÅÞÝÇá åÐÇ ÇáÑÈÚ", vbCritical + vbOKOnly, "ÎØÃ ÅÏÎÇá"
        chk_entries = False
        Exit Function
    End If
    chk_entries = True
End Function

Private Sub CEnd_Click()
    Unload Me
End Sub

Private Sub Command13_Click()
    If Not chk_entries Then Exit Sub
    CloseRiba 1, fra.visible
    PopulateRiba
End Sub

Private Sub Command14_Click()
    If Not chk_entries Then Exit Sub
    CloseRiba 4, fra.visible
    PopulateRiba
End Sub

Private Sub Command15_Click()
    If Not chk_entries Then Exit Sub
    CloseRiba 3, fra.visible
    PopulateRiba
End Sub

Private Sub Command16_Click()
    If Not chk_entries Then Exit Sub
    CloseRiba 2, fra.visible
    PopulateRiba
End Sub

Private Sub Form_Load()
    PopulateRiba
    fra.visible = (Command13.Enabled Or Command14.Enabled Or Command15.Enabled Or Command16.Enabled) And GetTagValue(Current_State.Settings, "RIBA_CHECKS") = "true"
    SetCaption Me
End Sub
Private Sub PopulateRiba()
    Command13.Enabled = False
    Command16.Enabled = False
    Command15.Enabled = False
    Command14.Enabled = False
    fra.Enabled = False
    Dim sql As String
    sql = "select isnull(sum(ribano),0) n from Acc_Riba"
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÍÏË ÎØÃ Ýí ÇáÑÈØ ãÚ ÞÇÚÏÉ ÇáÈíÇäÇÊ"
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "ÍÏË ÎØÃ Ýí ÇáÑÈØ ãÚ ÞÇÚÏÉ ÇáÈíÇäÇÊ"
        Exit Sub
    End If
    Dim N As Integer
    N = rs!N
    Dim X As Integer
    Debug.Print N
    Debug.Print GetBit(N, 1)
    If GetBit(N, 1) = 0 Then
        Command13.Enabled = True
        fra.Enabled = True
    ElseIf GetBit(N, 2) = 0 Then
        Command16.Enabled = True
        fra.Enabled = True
    ElseIf GetBit(N, 3) = 0 Then
        Command15.Enabled = True
        fra.Enabled = True
    ElseIf GetBit(N, 4) = 0 Then
        Command14.Enabled = True
        fra.Enabled = True
    Else
        fra.Enabled = False
    End If
End Sub
Private Function GetBit(N As Integer, bit As Integer) As Integer
    Dim B, nn As Integer
    'If bit > 1 Then
        Dim i As Integer
            nn = N
        For i = 1 To bit - 1
            nn = nn / 10
        Next i
        'nn = n / (10 * (bit - 1))
    'Else
    '    nn = n
    'End If
     Dim X As Integer
    X = nn / 10
'Debug.Print X
       
    GetBit = nn - X * 10
End Function

Private Sub txtFirst_Check_No_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
