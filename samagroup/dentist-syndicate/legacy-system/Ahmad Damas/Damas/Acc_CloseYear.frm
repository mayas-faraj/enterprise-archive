VERSION 5.00
Begin VB.Form Acc_CloseYear 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ"
   ClientHeight    =   2625
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7440
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2625
   ScaleWidth      =   7440
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command5 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ æÊæáíÏ ÇáŞíÏ ÇáÇİÊÊÇÍí ááÓäÉ ÇáãÇáíÉ ÇáÌÏíÏÉ"
      Height          =   375
      Left            =   2145
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1920
      Width           =   5130
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ÇáÊÍŞŞ ãä Ãä ßá ÇáÓäÏÇÊ ãÑÍáÉ"
      Height          =   375
      Left            =   2115
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1350
      Width           =   5115
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "ÎÑæÌ"
      Height          =   375
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   1920
      Width           =   1400
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "íÌÈ Ãä ÊÊÍŞŞ ãä Ãä ßá ÇáÓäÏÇÊ ãÑÍáÉ ŞÈá ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ"
      BeginProperty Font 
         Name            =   "Traditional Arabic"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   720
      Width           =   6855
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "áÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ ÇáÍÇáíÉ¡ íÌÈ ÃæáÇğ ÇáÊÍŞŞ ãä æÖÚ ŞÇÚÏÉ ÇáÈíÇäÇÊ ÇáÍÇáíÉ"
      BeginProperty Font 
         Name            =   "Traditional Arabic"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   360
      Width           =   6855
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   2520
      Width           =   7455
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   2
      Left            =   0
      Top             =   0
      Width           =   7455
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2655
      Index           =   0
      Left            =   0
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2655
      Index           =   1
      Left            =   7320
      Top             =   0
      Width           =   135
   End
End
Attribute VB_Name = "Acc_CloseYear"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Conn As New ADODB.Connection
Dim AllSanadsOK, AllTasdidsOK   As Boolean
' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String
Private Sub Command1_Click()
    Conn.Close
    Unload Me
End Sub

Private Sub Command3_Click()
    AllSanadsOK = False
    Dim sql As String
    Dim cancel As Boolean
    sql = " select * from Acc_SanadTMP" & Acc_DBYear & " where state=0"
    Dim rs As ADODB.Recordset
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÍÏË ÎØÃ ÛíÑ ãÊæŞÚ¡ ÇáÑÌÇÁ ÅÚÇÏÉ ÇáãÍÇæáÉ ãä ÌÏíÏ"
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "ÌãíÚ ÇáÓäÏÇÊ İí åĞå ÇáÓäÉ ÇáãÇáíÉ ãÑÍáÉ. íãßäß ÇáãÊÇÈÚÉ"
    Else
        If rs.RecordCount = 0 Then
            MsgBox "ÌãíÚ ÇáÓäÏÇÊ İí åĞå ÇáÓäÉ ÇáãÇáíÉ ãÑÍáÉ. íãßäß ÇáãÊÇÈÚÉ"
        Else
            MsgBox "ÊæÌÏ ÓäÏÇÊ İí åĞå ÇáÓäÉ ÇáãÇáíÉ ÛíÑ ãÑÍáÉ. ÇáÑÌÇÁ Şã ÈÊÑÍíáåÇ Ãæ ÍĞİåÇ ŞÈá ÇáãÊÇÈÚÉ"
            Exit Sub
        End If
    End If
    AllSanadsOK = True
End Sub



Private Sub Command5_Click()
    Dim sql As String
    Dim cancel As Boolean
        
    If Not (AllSanadsOK And AllTasdidsOK) Then
        MsgBox "íÌÈ Ãä ÊÊÍŞŞ ÃæáÇğ ãä Ãä ßá ÇáÓäÏÇÊ ÇáãÇáíÉ ãÑÍáÉ¡ æãä ÍÇáÉ ßÔæİ ÇáãØÇáÈÉ ŞÈá ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ"
        Exit Sub
    End If
    
    sql = "select distinct(year(cDate)) as y from Acc_Sanad" & Acc_DBYear
    Dim rs As ADODB.Recordset
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        MsgBox "ÍÏË ÎØÃ ÛíÑ ãÊæŞÚ¡ ÇáÑÌÇÁ ÅÚÇÏÉ ÇáãÍÇæáÉ ãä ÌÏíÏ"
        Exit Sub
    End If
    Dim year As String
    If rs.EOF Then
        MsgBox "áÇ ÊæÌÏ ÓäÏÇÊ İí åĞå ÇáÓäÉ!!!"
        Exit Sub
    Else
        If rs.RecordCount = 0 Then
            MsgBox "áÇ ÊæÌÏ ÓäÏÇÊ İí åĞå ÇáÓäÉ!!!"
            Exit Sub
        ElseIf rs.RecordCount > 1 Then
            MsgBox "ÊæÌÏ ÓäÏÇÊ ÈÊÇÑíÎ ÓäæÇÊ áÇÍŞÉ Ãæ ÓÇÈŞÉ ááÓäÉ ÇáÍÇáíÉ!. ÇÓÊÚÑÖ ÇáÓäÏÇÊ İí æÇÌåÉ -ÇÓÊÚÑÇÖ ÏİÊÑ ÇáíæãíÉ- áÊÚÏíá ÊÇÑíÎåÇ Ãæ ÍĞİåÇ (ÈÍË Úä ÊæÇÑíÎ İí ÓäæÇÊ ÓÇÈŞÉ Ãæ áÇÍŞÉ)"
            Exit Sub
        Else
            year = rs!Y
        End If
    End If
    
    If MsgBox("åá ÊÃßÏÊ ãä ØÈÇÚÉ ÇáãíÒÇäíÉ æÊÕÏíŞåÇ ŞÈá ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ¿", vbYesNo, "ÊÃßíÏ ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ") = vbNo Then
        Exit Sub
    End If
    If MsgBox("áä ÊÊãßä ãä ÊÚÏíá Ãí ÔíÁ İí ÇáÓäÉ ÇáãÇáíÉ ÈÚÏ ÅÛáÇŞåÇ. åá ÃäÊ ãÊÃßÏ ãä ãÊÇÈÚÉ ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ¿", vbYesNo, "ÊÃßíÏ ÅÛáÇŞ ÇáÓäÉ ÇáãÇáíÉ") = vbNo Then
        Exit Sub
    End If
    ExecuteCommand Conn, "exec sp_CloseAccYear '" & year & "'", cancel
    If cancel Then
        MsgBox "ÍÕá ÎØÃ ÛíÑ ãÍÏÏ İí ÇáÑÈØ ãÚ ŞÇÚÏÉ ÇáÈíÇäÇÊ"
        Exit Sub
    End If
    MsgBox "Êã ÅŞİÇá ÇáÓäÉ ÇáãÇáíÉ ÈäÌÇÍ¡ íãßäß ÊÕİÍ ÇáŞíÏ ÇáÇİÊÊÇÍí İæÑÇğ İí ÇáÈÑäÇãÌ", vbMsgBoxRight + vbMsgBoxRtlReading + vbInformation, "ÊãÊ ÇáÚãáíÉ ÈäÌÇÍ"
    
   Unload Me
   
End Sub

Private Sub Form_Load()
    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName
    
    AllSanadsOK = False
    AllTasdidsOK = True
    OpenConnection Conn
    SetCaption Me
End Sub


