VERSION 5.00
Begin VB.Form Pic_CopyTreats 
   Caption         =   "Form1"
   ClientHeight    =   4785
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7830
   LinkTopic       =   "Form1"
   ScaleHeight     =   4785
   ScaleWidth      =   7830
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkReverse 
      Caption         =   "ﬁ·» «·’Ê—"
      Height          =   255
      Left            =   3960
      TabIndex        =   9
      Top             =   1440
      Width           =   2895
   End
   Begin VB.TextBox toTreat 
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   720
      Width           =   1815
   End
   Begin VB.TextBox fromTreat 
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   720
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "‰”Œ"
      Height          =   420
      Left            =   720
      TabIndex        =   4
      Top             =   1440
      Width           =   1185
   End
   Begin VB.TextBox txtToTooth 
      Height          =   420
      Left            =   405
      TabIndex        =   3
      Text            =   "8"
      Top             =   225
      Width           =   1815
   End
   Begin VB.TextBox txtFromTooth 
      Height          =   375
      Left            =   3645
      TabIndex        =   2
      Text            =   "1"
      Top             =   270
      Width           =   1905
   End
   Begin VB.Label Label4 
      Caption         =   "≈·Ï «·„⁄«·Ã…"
      Height          =   285
      Left            =   2400
      TabIndex        =   8
      Top             =   840
      Width           =   1065
   End
   Begin VB.Label Label3 
      Caption         =   "„‰ «·„⁄«·Ã…"
      Height          =   285
      Left            =   5760
      TabIndex        =   7
      Top             =   840
      Width           =   1380
   End
   Begin VB.Label Label2 
      Caption         =   "≈·Ï «·”‰"
      Height          =   285
      Left            =   2385
      TabIndex        =   1
      Top             =   240
      Width           =   825
   End
   Begin VB.Label Label1 
      Caption         =   "‰”Œ «·„⁄«·Ã«  „‰ «·”‰"
      Height          =   285
      Left            =   5715
      TabIndex        =   0
      Top             =   315
      Width           =   1860
   End
End
Attribute VB_Name = "Pic_CopyTreats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Points As New Collection
Private Type COORD
    X As Long
    Y As Long
End Type
Dim p(0 To 1000) As COORD
Private Sub Command1_Click()
    Dim Cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim sql As String
    If fromTreat.text = "" Then
        sql = "select * from Pic_Pics where tooth between " & txtFromTooth.text & " and " & txtToTooth.text & " order by id "
    Else
        sql = "select * from Pic_Pics where tooth between " & txtFromTooth.text & " and " & txtToTooth.text & "  and treat between " & fromTreat.text & " and " & toTreat.text & " order by id "
    End If
    Set rs = ExecuteSelect(Conn, sql, Cancel)
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    Do While Not rs.EOF
        Dim S As String
        Dim imgName As String
        imgName = ""
        S = ""
        If rs!Shape = "I" And rs!data <> "" Then
            S = Mid(rs!data, InStr(1, rs!data, ";") + 1)
            imgName = Mid(rs!data, 1, InStr(1, rs!data, ";") - 1)
        Else
            S = rs!data
            imgName = ""
        End If

        nbPoints = ToArrayWithAdd(S, 0, 0)
        Dim i As Long
        S = ""
        If Not chkReverse.Value Then
                For i = 0 To nbPoints - 1
                    S = S & p(i).X & "," & p(i).Y & ","
                    'Debug.Print "(" & p(i).x & "," & p(i).y & "),(" & p(i + 1).x & "," & p(i + 1).y & ")"
                Next
                If imgName <> "" Then
                    S = imgName & ";" & S
                End If
        Else
                S = rs!data
        End If
        'Dim sql As String
        Dim Tooth As Integer
        Tooth = 1 + CInt(txtToTooth.text) * 2 - rs!Tooth
        sql = "insert into Pic_Pics(tooth,treat,shape,color,otherColor,data) " & _
                       " values(" & Tooth & "," & rs!treat & ",'" & rs!Shape & "','" & rs!Color & "','" & rs!otherColor & "','" & S & "')"
        Debug.Print sql
        ExecuteCommand Conn, sql, Cancel
        If Cancel Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «· ⁄·Ì„…: " & sql
            Exit Sub
        End If
        rs.MoveNext
    Loop
    MsgBox "«‰ Â  ⁄„·Ì… «·‰”Œ"
End Sub

Private Function ToArrayWithAdd(S As String, offsetX As Long, offsetY As Long) As Long
    Dim pos As Long, posComa As Long, posLast As Long
    Dim i As Long
    Dim arr() As String
    arr = Split(S, ",")
    i = LBound(arr)
    Do While i < UBound(arr)
        p(i / 2).X = 47 - CLng(arr(i)) + offsetX
        p(i / 2).Y = CLng(arr(i + 1)) + offsetY
        i = i + 2
    Loop
    ToArrayWithAdd = UBound(arr) / 2 'i - 1
End Function


