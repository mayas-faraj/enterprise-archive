VERSION 5.00
Begin VB.Form Acc_ChangeHissa 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " €ÌÌ— ﬁÌ„… «·Õ’… «·”«»ﬁ…"
   ClientHeight    =   2730
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6210
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2730
   ScaleWidth      =   6210
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtTajaoz 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   360
      Width           =   2175
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Õ›Ÿ"
      Default         =   -1  'True
      Height          =   375
      Left            =   4440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton CCancel 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2040
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁÌ„… «·Õ’… «·”«»ﬁ…"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4080
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   427
      Width           =   1350
   End
   Begin VB.Label lblTajaoz 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   $"Acc_ChangeHissa.frx":0000
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1095
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   840
      Width           =   5415
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   2610
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   2
      Left            =   0
      Top             =   0
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2805
      Index           =   0
      Left            =   6120
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2800
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   135
   End
End
Attribute VB_Name = "Acc_ChangeHissa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Dim conn As New adodb.Connection

Private Sub CCancel_Click()
'    conn.Close
    Unload Me
End Sub

Private Sub Command1_Click()
    Acc_ChangeTajaoz.Show 1
End Sub

Private Sub COk_Click()
'<AHMAD>
'    Dim cancel As Boolean
'    If MsgBox(lblTajaoz.Caption & vbCrLf & "Â· √‰  „ √ﬂœ „‰ „ «»⁄… «·⁄„·Ì…ø", vbYesNo, " √ﬂÌœ  ⁄œÌ· ﬁÌ„… «· Ã«Ê“") = vbYes Then
'        ExecuteCommand Conn, "update Acc_Const" & Acc_DBYear & " set oldHissa=" & txtTajaoz.text, cancel
'        If cancel Then
'            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
'            Exit Sub
'        End If
'        MsgBox " „  €ÌÌ— ﬁÌ„… «· ⁄œÌ· »‰Ã«Õ"
''        conn.Close
'        Acc_CloseHissa.lblTajaoz.Caption = txtTajaoz.text
'        Unload Me
'    End If
    Dim Cancel As Boolean
    On Error GoTo ErrHandler
    Dim addNew  As Boolean
    If MsgBox(lblTajaoz.Caption & vbCrLf & "Â· √‰  „ √ﬂœ „‰ „ «»⁄… «·⁄„·Ì…ø", vbYesNo, " √ﬂÌœ  ⁄œÌ· ﬁÌ„… «·Õ’… «·”«»ﬁ…") = vbYes Then
        
        Dim rs As New ADODB.Recordset
        addNew = False
        With rs
            .LockType = adLockOptimistic
            .CursorType = adOpenKeyset
            .ActiveConnection = Conn
            .Open "Acc_Const" & Acc_DBYear
            If .EOF Or .BOF Then
                .addNew
                addNew = True
            End If
            !OldHissa = val(txtTajaoz.text)
            If addNew Then !Tajaoz = 50000
            .Update
            .Close
        End With
        Set rs = Nothing
        
        '<Fayez>
        Dim sql As String
        sql = "UPDATE Acc_Const" & Acc_DBYear & " SET oldHissa = " & val(txtTajaoz.text)
        ExecuteCommand Conn, sql, False
        '</Fayez>
        
        MsgBox " „  €ÌÌ— ﬁÌ„… «·Õ’… «·”«»ﬁ… »‰Ã«Õ", vbInformation + vbOKOnly
        Acc_CloseHissa.lblTajaoz.Caption = txtTajaoz.text
        Unload Me
    End If
    Exit Sub
ErrHandler:
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
'</AHMAD>
End Sub

Private Sub Form_Load()
'    OpenConnection conn
    Dim rs As New ADODB.Recordset
    Dim Cancel As Boolean
    Set rs = ExecuteSelect(Conn, "select top 1 oldHissa from Acc_Const" & Acc_DBYear, Cancel)
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
    If rs.EOF Then
        Exit Sub
    End If
    If IsNull(rs!OldHissa) = False Then txtTajaoz.text = rs!OldHissa
End Sub

Private Sub txtTajaoz_Validate(Cancel As Boolean)
    If txtTajaoz.text = "" Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈·€«¡ ﬁÌ„… «· Ã«Ê“"
        Cancel = True
        Exit Sub
    End If
    If Not IsNumeric(txtTajaoz.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· «· Ã«Ê“"
        Cancel = True
        Exit Sub
    End If
    Cancel = False
End Sub

