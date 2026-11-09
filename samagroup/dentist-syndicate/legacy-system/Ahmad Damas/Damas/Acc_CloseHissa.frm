VERSION 5.00
Begin VB.Form Acc_CloseHissa 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2625
   ClientLeft      =   15
   ClientTop       =   -90
   ClientWidth     =   6210
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2625
   ScaleWidth      =   6210
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdBankReport 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì— «·„’—›"
      Height          =   375
      Left            =   4440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   1560
      Width           =   1455
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   " ⁄œÌ· ‘—«∆Õ «·√ÿ»«¡"
      Height          =   495
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   360
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "≈ﬁ›«· «·Õ’… «·”‰ÊÌ…"
      Height          =   375
      Left            =   2400
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   2055
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ⁄œÌ· ﬁÌ„… «·Õ’… «·”«»ﬁ…"
      Height          =   495
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì— «·„Õ«”»"
      Height          =   375
      Left            =   4440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2055
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
      Top             =   2055
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
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
      Height          =   375
      Left            =   4200
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   720
      Width           =   1695
   End
   Begin VB.Label lblTajaoz 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
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
      Left            =   1920
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   600
      Width           =   1695
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   2550
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
      Height          =   2580
      Index           =   0
      Left            =   6120
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2610
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   135
   End
End
Attribute VB_Name = "Acc_CloseHissa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Function chk_entries() As Boolean
    If fra.visible = True And txtFirst_Check_No.text = "" Then
        Beep
        MsgBox "ÌÃ» ≈œŒ«· —ﬁ„ √Ê· ‘Ìﬂ ﬁ»· «·»œ¡ »⁄„·Ì… ≈ﬁ›«· Â–« «·—»⁄", vbCritical + vbOKOnly, "Œÿ√ ≈œŒ«·"
        chk_entries = False
        Exit Function
    End If
    chk_entries = True
End Function
Private Sub CCancel_Click()
    Unload Me
End Sub

Private Sub Combo1_Change()

End Sub
'<Ashraf>
Private Sub cmdBankReport_Click()

MousePointer = vbHourglass

On Error GoTo Err
    Dim rs As Recordset
    Dim sqlCmd As String
    sqlCmd = "SELECT cv.Doctor_ID as DID,isnull(cv.bankAccountNo,' ') as AccNo, isnull(cv.fullNameEnglish,' ') as FullNameEng, (isnull(sf.Hissa,0)- isnull(sf.Madin,0)+ isnull(sf.Daen,0)-isnull(sf.Discount,0)) as desert FROM [dbo].sf_GetHissaSanawia(" + str(Get_Riba_Count) + ") as sf left outer join doctor_CV cv on sf.Doctor_ID = cv.Doctor_ID where ((isnull(sf.Hissa,0)- isnull(sf.Madin,0)+ isnull(sf.Daen,0)-isnull(sf.Discount,0)) > 0)"
    Set rs = ExecuteSelect(Conn, sqlCmd, cancel)
    '
    Dim result As String
    result = "·„   „ ⁄„·Ì… «· ’œÌ— »‰Ã«Õ"
    Dim exported As Boolean
    Dim FileName As String
    FileName = "C:\ ﬁ—Ì— «·„’—› ··Õ’… «·”‰ÊÌ…  " + Acc_DBYear + ".txt"
    Dim rsObj As Object
    Set rsObj = rs
    exported = RecordsetToText(rsObj, FileName, " ")
    If exported Then result = " „  ⁄„·Ì… «· ’œÌ— »‰Ã«Õ"
    MousePointer = vbDefault
    MsgBox (result)
Err:
'MsgBox "Error!"

End Sub
'</Ashraf>

Private Sub COk_Click()
    pForm = "HissaSanawia"
    Acc_MasterRep.Show 1
End Sub

Private Sub Command1_Click()
    Acc_ChangeHissa.Show 1
End Sub

Private Sub Command2_Click()
    Dim sql As String
    Dim rsReba As ADODB.Recordset
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    '<MohMas>
     sql = " select sanad as id," & _
          " case ribano when 1 then '«·√Ê·' when 10 then '«·À«‰Ì' when 100 then '«·À«·À' when 1000 then '«·—«»⁄' end" & _
          " as name from acc_riba order by ribano"
    Set rsReba = ExecuteSelect(Conn, sql, cancel)
    If rsReba.RecordCount < 4 Then
       MsgBox ("ÌÃ» ⁄·Ìﬂ ≈ﬁ›«· «·√—»«⁄ Ã„Ì⁄Â« ﬁ»· ≈ﬁ›«· «·Õ’… «·”‰ÊÌ…")
       Exit Sub
    End If
    
     '</MohMas>
    If MsgBox("Â·  —Ìœ ≈ﬁ›«· «·Õ’… «·”‰ÊÌ…° Ê ÕÊÌ· «·√—’œ… ≈·Ï Õ”«»«  «·√ÿ»«¡ «·¬‰ø", vbYesNo + vbMsgBoxRight, "≈ﬁ›«· «·Õ’… «·”‰ÊÌ…") = vbNo Then
        Exit Sub
    End If
    If MsgBox("≈ﬁ›«· «·Õ’… ÌÃ» √‰ Ì „ ›Ì ¬Œ— «·⁄«„° Ê»⁄œ ≈€·«ﬁÂ«° ·‰   „ﬂ‰ „‰ ⁄—÷  ﬁ—Ì— «·Õ’… „‰ ÃœÌœ° Â· √‰  „ √ﬂœ „‰ √‰ﬂ ÿ»⁄   ﬁ—Ì— «·Õ’… Ê —Ìœ «·„ «»⁄… ›Ì «·≈ﬁ›«·ø", vbYesNo + vbMsgBoxRight, "≈ﬁ›«· «·Õ’… «·”‰ÊÌ…") = vbNo Then
        Exit Sub
    End If
   ' If MsgBox("≈ﬁ›«· «·Õ’… «·”‰ÊÌ… ”ÌƒœÌ ≈·Ï  ’›Ì— Ãœ«Ê· «· ÊﬁÌ⁄ ··√ÿ»«¡°  —Ìœ «·„ «»⁄… ›Ì «·≈ﬁ›«·ø", vbYesNo, "≈ﬁ›«· «·Õ’… «·”‰ÊÌ…") = vbNo Then
   '     Exit Sub
   ' End If
    ExecuteCommand Conn, "exec sp_closeHissa " & Get_Riba_Count, cancel
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
        Exit Sub
    End If
            '<Ashraf>
        Dim RsSettings As ADODB.Recordset
        Set RsSettings = ExecuteSelect(Conn, "select settings from State_Settings", cancel)
        If cancel Then
              MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
            Exit Sub
        End If
        Dim sett As String
        sett = RsSettings.Fields(0).Value
        Dim NewSett As String
        NewSett = Left(sett, InStr(sett, "IsHissaSanawiaClosed=") - 1) & "IsHissaSanawiaClosed=" & "1" & Mid(sett, InStr(sett, "IsHissaSanawiaClosed=") + 22)
        
        ExecuteCommand Conn, "update state_settings set settings='" & NewSett & "' where state_id=(select top 1 id from Active_State)", cancel ': the HissaSanawia is Closed
        If cancel Then
             MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
             Exit Sub
        End If
      '</Ashraf>

    MsgBox " „ ≈ﬁ›«· «·Õ’… »‰Ã«Õ"
    Me.Command2.Enabled = False
End Sub

Private Sub Command3_Click()
    Acc_ChangeSlices.Show 1
End Sub

Private Sub Form_Load()
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim myRs As ADODB.Recordset
    Dim NoRiba As Boolean
    Dim Mycancel As Boolean
    Set myRs = ExecuteSelect(Conn, "select * from Config where settings like '%NoRiba,%'", Mycancel)
    
    If Acc_DBYearSysTem <> "" Then
        Command1.Enabled = False
        Command2.Enabled = False
    End If
    
    Caption = "≈ﬁ›«· «·Õ’… «·”‰ÊÌ… " & Acc_DBYear
    
    If Mycancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Exit Sub
    End If
    NoRiba = myRs.RecordCount > 0
    If NoRiba Then
        lblTajaoz.visible = False
        Command1.visible = False
        Label3.visible = False
        Command3.visible = True
    Else
        Set rs = ExecuteSelect(Conn, "select top 1 oldHissa from Acc_Const" & Acc_DBYear, cancel)
        If cancel Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
            Exit Sub
        End If
        Dim t As String
        If rs.EOF Then
            t = ""
        Else
            If IsNull(rs!OldHissa) = False Then t = rs!OldHissa
        End If
        lblTajaoz.Caption = t
    End If
    '<Ashraf> This is to enable/disable the command2 button
    Dim RsSettings As ADODB.Recordset
    Set RsSettings = ExecuteSelect(Conn, "select settings from State_Settings", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
        Exit Sub
    End If
    Dim sett As String
    sett = RsSettings.Fields(0).Value
    Debug.Print sett
    If InStr(sett, "IsHissaSanawiaClosed=") <= 0 Then 'IsHissaSanawiaClosed: is a new parameter added to know whether the HissaSanawia is closed or not
        Dim NewSett As String
        NewSett = sett & "IsHissaSanawiaClosed=0;"
        ExecuteCommand Conn, "update State_Settings set settings='" & NewSett & "' where State_Id=1", cancel
        If cancel Then
            MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
            Exit Sub
        End If
    Else
        Dim bool As String
        bool = Mid(sett, InStr(sett, "IsHissaSanawiaClosed=") + 21, 1) ' get the value of the IsHissaSanawiaClosed parameter
        If bool = "1" Then
            Command2.Enabled = False
        Else
          If bool = "0" Then
             Command2.Enabled = True
          End If
        End If
            
        
    End If
    '</Ashraf>

End Sub

'<Ashraf>


Public Function RecordsetToText(rs As Object, Optional FullPath _
  As String, Optional ValueDelimiter As String = " ") As Boolean

'PURPOSE: EXPORTS DATA FROM AN ADO RECORDSET TO A TEXT FILE

'PARAMETERS:

'RS: Recordset to Export. Open the recordset before
'passing it to this function

'FullPath (Optional): FullPath of text file.
'if not specified, the function uses app.path +
'rs.txt

'ValueDelmiter (Optional): String to delimiter
'values within a row.  If not specified, an empty space
'is used

'RETURNS: True if successful, false if an error occurs

'COMMENTS: Rows are delimited by a carriage return
Dim sFullPath As String
Dim sDelimiter As String
Dim iFileNum As Integer
Dim lFieldCount As Long
Dim lCtr As Integer
Dim oField As ADODB.Field

On Error GoTo ErrorHandler:


If RecordSetReady(rs) = False Then Exit Function
 
sDelimiter = ValueDelimiter

If FullPath = "" Then
    sFullPath = App.Path
    If Right(sFullPath, 1) <> "\" Then sFullPath = _
       sFullPath & "\"

    sFullPath = sFullPath & "rs.txt"
Else
    sFullPath = FullPath
End If

iFileNum = FreeFile

Open sFullPath For Output As #iFileNum

With rs
lFieldCount = .Fields.count - 1

On Error Resume Next
.MoveFirst
On Error GoTo ErrorHandler

Do While Not .EOF

For lCtr = 0 To lFieldCount

Set oField = .Fields(lCtr)
    If FieldCanBeString(oField) Then
        If lCtr < lFieldCount Then
            Print #iFileNum, ValueFormatted(oField.Value, lCtr) & sDelimiter;

        Else
            Print #iFileNum, ValueFormatted(oField.Value, lCtr)
        End If
        
    
    End If
Next

.MoveNext
Loop

End With

RecordsetToText = True
On Error Resume Next
    Close #iFileNum
ErrorHandler:
 On Error Resume Next
     Close #iFileNum

End Function

Private Function RecordSetReady(rs As Object) As Boolean
'Recordset must be opened and connected

On Error Resume Next

If rs Is Nothing Then Exit Function
If Not TypeOf rs Is ADODB.Recordset Then Exit Function
    
If rs.state = 0 Then
    'attempt to open, requires source has populated and either
    'source or recordset has an active connection
    On Error Resume Next
    rs.Open
    If Err.Number <> 0 Then Exit Function
End If

RecordSetReady = True

End Function

Private Function FieldCanBeString(FieldObj As ADODB.Field) _
   As Boolean
 
 If IsObject(FieldObj.Value) Then
     FieldCanBeString = False
 Else
     'Assumes adEmpty will be converted to ""
     
     'Doesn't check for null value because
     'Assumes null will be converted to ""
     Select Case FieldObj.Type
         Case adBinary, adIDispatch, adIUnknown, adUserDefined
             FieldCanBeString = False
         Case Else
             FieldCanBeString = True
     End Select
 End If

End Function

Private Function ValueFormatted(DBVal As String, fieldIndex As Integer) As String

    Dim TotalLength As Integer 'originalLength
    Dim NewVal As String
    If DBVal = Null Then DBVal = ""
    NewVal = DBVal
    'originalLength = Len(DBVal)
    If fieldIndex = 0 Then
        TotalLength = 7
        For i = Len(NewVal) To TotalLength - 1
            NewVal = "0" + NewVal
        Next i
    End If
    If fieldIndex = 1 Then TotalLength = 15
    If fieldIndex = 2 Then TotalLength = 30
    If fieldIndex = 3 Then
        TotalLength = 10
        If Len(NewVal) > TotalLength - 3 Then
            NewVal = Mid(NewVal, 1, TotalLength - 3)
            NewVal = NewVal + "000"
            ValueFormatted = NewVal
        End If
        NewVal = NewVal + "000"
        '
        For i = Len(NewVal) To TotalLength - 1
            NewVal = "0" + NewVal
        Next i
    End If
    
    For i = Len(NewVal) To TotalLength - 1
        NewVal = NewVal + " "
    Next i
    
    ValueFormatted = NewVal

End Function

'</Ashraf>

