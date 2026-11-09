VERSION 5.00
Begin VB.Form Acc_ChangeTajaoz 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " €ÌÌ— ﬁÌ„… «· Ã«Ê“"
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
      Left            =   2640
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
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁÌ„… «· Ã«Ê“"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4800
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label lblTajaoz 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   $"Acc_ChangeTajaoz.frx":0000
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
      Left            =   2160
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   840
      Width           =   3735
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
Attribute VB_Name = "Acc_ChangeTajaoz"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Dim conn As New ADODB.Connection

Private Sub CCancel_Click()
'    conn.Close
    Unload Me
End Sub

Private Sub Combo1_Change()

End Sub

Private Sub Command1_Click()
    Acc_ChangeTajaoz.Show 1
End Sub

Private Sub COk_Click()
    Dim Cancel As Boolean
    On Error Resume Next
    If MsgBox(lblTajaoz.Caption & vbCrLf & "Â· √‰  „ √ﬂœ „‰ „ «»⁄… «·⁄„·Ì…ø", vbYesNo, " √ﬂÌœ  ⁄œÌ· ﬁÌ„… «· Ã«Ê“") = vbYes Then
        
        Dim rs As New ADODB.Recordset
             
        With rs
            .LockType = adLockOptimistic
            .CursorType = adOpenKeyset
            .ActiveConnection = Conn
            .Open "Acc_Const" & Acc_DBYear
            If .EOF Or .BOF Then
                .addNew
            End If
            !Tajaoz = val(txtTajaoz.text)
            .Update
            .Close
        End With
        Set rs = Nothing
        If Err.Number <> 0 Then
            MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
        Else
            MsgBox " „  €ÌÌ— ﬁÌ„… «· Ã«Ê“ »‰Ã«Õ", vbInformation + vbOKOnly
            Acc_KashfTabib.lblTajaoz.Caption = txtTajaoz.text
            Unload Me
        End If
    End If
End Sub

Private Sub Form_Load()
'    OpenConnection conn
    Dim rs As New ADODB.Recordset
    Dim Cancel As Boolean
    Set rs = ExecuteSelect(Conn, "select top 1 Tajaoz from Acc_Const" & Acc_DBYear, Cancel)
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
    If rs.EOF Then
        Exit Sub
    End If
    txtTajaoz.text = rs!Tajaoz
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

