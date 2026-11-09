VERSION 5.00
Begin VB.Form Acc_KashfTabib 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "«” ⁄—«÷ ﬂ‘› «·√ÿ»«¡"
   ClientHeight    =   3540
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6210
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   3540
   ScaleWidth      =   6210
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command3 
      Caption         =   " ﬁ—Ì— «·≈Õ«·«  «· Ì  Œ÷⁄ ·Õ”„ ≈÷«›Ì"
      Height          =   375
      Left            =   3120
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   2520
      Width           =   2880
   End
   Begin VB.CommandButton btnNewDiscountDetails 
      BackColor       =   &H00E0E0E0&
      Caption         =   "‰”» «·Õ”„ «·≈÷«›Ì"
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   2520
      Width           =   1575
   End
   Begin VB.CommandButton cmdBankReport 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì— «·„’—›"
      Height          =   375
      Left            =   2280
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   2040
      Width           =   1140
   End
   Begin VB.CommandButton btnNewDetails 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ÕœÌœ «·‰”» "
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   2040
      Width           =   1575
   End
   Begin VB.CommandButton cmdZemam 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì— «·–„„ «· ›’Ì·Ì"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   3000
      Visible         =   0   'False
      Width           =   2400
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì— «·ÿ»Ì»"
      Height          =   375
      Left            =   3645
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2040
      Width           =   1140
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ⁄œÌ· ﬁÌ„… «· Ã«Ê“"
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1560
      Width           =   1575
   End
   Begin VB.ComboBox cmboRiba 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "Acc_KashfTabib.frx":0000
      Left            =   1320
      List            =   "Acc_KashfTabib.frx":0013
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   600
      Width           =   2295
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì— «·„Õ«”»"
      Height          =   375
      Left            =   4920
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2040
      Width           =   1140
   End
   Begin VB.CommandButton CCancel 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   3000
      Width           =   1575
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁÌ„… «· Ã«Ê“ «·„⁄ „œ…"
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
      TabIndex        =   5
      Top             =   1320
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
      TabIndex        =   4
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ﬂ‘› ≈Õ«·«  «·√ÿ»«¡ Œ·«· «·—»⁄"
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
      Left            =   3000
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   600
      Width           =   2895
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   3480
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
      Height          =   3540
      Index           =   0
      Left            =   6120
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   3540
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   135
   End
End
Attribute VB_Name = "Acc_KashfTabib"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public From_Date As String
Public To_Date As String
Function chk_browse_report_availability() As Boolean
    
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    
    sql = "Select isNull(count(*),0) from acc_sanad" & Acc_DBYear & " Where type = 4"
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
        chk_browse_report_availability = False
        Exit Function
    End If
    
    If rs.Fields(0).Value = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ «” ⁄—«÷ Â–« «· ﬁ—Ì— ﬁ»·  —ÕÌ· ﬂ‘› „ÿ«·»… „ƒ””… Ê«Õœ ⁄·Ï «·√ﬁ·", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        chk_browse_report_availability = False
        Exit Function
    End If
    
    chk_browse_report_availability = True
    
End Function

Private Sub btnNewDetails_Click()
    Dim sql As String
    Dim result  As ADODB.Recordset
    Dim res As ADODB.Recordset
    Dim cancel As Boolean
    Dim yearID As Integer
   If Acc_DBYear = "" Then
        'sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
        '<Ashraf>        -- previous line commented by me.
        sqlcommGetID = "select max(DATEPART(year,cdate)) from acc_Sanad"
        '</Ashraf>
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
    
   sql = "Select * from Acc_ConstKashef where id=" & yearID
   ' desert_percent, tax_percent, imports_percent ,retirment ,SecondSolidarity ,CenteralSolidarity , importsSystem ,ID
   'severance , isPersent
    Set result = ExecuteSelect(Conn, sql, cancel)
    If result.RecordCount = 0 Then
   '    UpLoadOldPercents()
       MsgBox "«·‰”» «·Œ«’… »Â–Â «·”‰… €Ì— „ÊÃÊœ… "
     Exit Sub
    Else
      Acc_NewDetails.Show 1
   End If
 
  
End Sub

Private Sub btnNewDiscountDetails_Click()
    Dim sql As String
    Dim result  As ADODB.Recordset
    Dim res As ADODB.Recordset
    Dim cancel As Boolean
    Dim yearID As Integer
   If Acc_DBYear = "" Then
        'sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
        '<Ashraf>        -- previous line commented by me.
        sqlcommGetID = "select max(DATEPART(year,cdate)) from acc_Sanad"
        '</Ashraf>
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
    
   sql = "Select * from Acc_ConstDiscountKashef where id=" & yearID
   ' desert_percent, tax_percent, imports_percent ,retirment ,SecondSolidarity ,CenteralSolidarity , importsSystem ,ID
   'severance , isPersent
    Set result = ExecuteSelect(Conn, sql, cancel)
    If result.RecordCount = 0 Then
   '    UpLoadOldPercents()
       MsgBox "«·‰”» «·Œ«’… »Â–Â «·”‰… €Ì— „ÊÃÊœ… "
     Exit Sub
    Else
      Acc_NewDiscountDetails.Show 1
   End If
 
  

End Sub

'Dim conn As New ADODB.Connection
Private Sub CCancel_Click()
 ' conn.Close
    Unload Me
End Sub


Private Sub cmdBankReport_Click()
MousePointer = vbHourglass

On Error GoTo Err
    Dim rs, rsYear As Recordset
    Dim sqlCmd As String
    Dim startDate, endDate As String
    Dim year As String
    If Acc_DBYear = "" Then
        'Set rsYear = ExecuteSelect(Conn, "select top 1 cast(substring(name,13, len(name)-12) as int) + 1  from dbo.sysobjects where name like 'Acc_Accounts%' and type='U' order by name desc", cancel)
        Set rsYear = ExecuteSelect(Conn, "select max(DATEPART(year,cdate)) from acc_Sanad", cancel)
        'rsYear.MoveFirst
        year = rsYear.Fields(0).Value
    Else
        year = Acc_DBYear
    End If
    
    Select Case (cmboRiba.ListIndex + 1)
        Case 1
            startDate = "01/01/" + year
            endDate = "03/31/" + year
        Case 2
            startDate = "04/01/" + year
            endDate = "06/30/" + year
        Case 3
            startDate = "07/01/" + year
            endDate = "09/30/" + year
        Case 4
            startDate = "10/01/" + year
            endDate = "12/31/" + year
        Case 5
            startDate = "01/01/" + year
            endDate = "12/31/" + year
    End Select
    sqlCmd = "select * from fn_GetBankReport('" + startDate + "', '" + endDate + "', " + lblTajaoz.Caption + ")"
    Set rs = ExecuteSelect(Conn, sqlCmd, cancel)
    '
    Dim result As String
    result = "·„   „ ⁄„·Ì… «· ’œÌ— »‰Ã«Õ"
    Dim exported As Boolean
    Dim FileName As String
    FileName = "C:\ ﬁ—Ì— «·„’—› ··—»⁄ " + str(cmboRiba.ListIndex + 1) + " „‰ «·”‰… " + year + ".txt"
    Dim rsObj As Object
    Set rsObj = rs
    exported = RecordsetToText(rsObj, FileName, " ")
    If exported Then result = " „  ⁄„·Ì… «· ’œÌ— »‰Ã«Õ"
    MousePointer = vbDefault
    
    MsgBox (result)

Err:
'MsgBox "Error!"
End Sub

Private Sub cmdZemam_Click()
    
    Dim sql As String
    
    Select Case cmboRiba.ListIndex + 1
        Case 1: From_Date = "'01/01/" & Acc_DBYear & "'": To_Date = "'31/03/" & Acc_DBYear & "'"
        Case 2: From_Date = "'01/04/" & Acc_DBYear & "'": To_Date = "'30/06/" & Acc_DBYear & "'"
        Case 3: From_Date = "'01/07/" & YeaAcc_DBYearr & "'": To_Date = "'30/09/" & Acc_DBYear & "'"
        Case 4: From_Date = "'01/10/" & Acc_DBYear & "'": To_Date = "'31/12/" & Acc_DBYear & "'"
    End Select
    
    pForm = "Zemam"
    Acc_MasterRep.Show 1
    
End Sub

Private Sub COk_Click()
    If chk_browse_report_availability = False Then Exit Sub
    Acc_RibaNumber = cmboRiba.ItemData(cmboRiba.ListIndex)
    pForm = "KashfTabib"
    Acc_MasterRep.Show 1
End Sub

Private Sub Command1_Click()
    Acc_ChangeTajaoz.Show 1
End Sub

Private Sub Command2_Click()
    If chk_browse_report_availability = False Then Exit Sub
    Acc_RibaNumber = cmboRiba.ItemData(cmboRiba.ListIndex)
    pForm = "KashfTabibTabib"
    Acc_MasterRep.Show 1
End Sub

Private Sub Command3_Click()
    Dim sql As String
    Dim rsDisc As ADODB.Recordset
    Dim cc As Boolean
    MousePointer = vbHourglass
    sql = "Select Central_Exam_ID,isnull(Examiner_Doctor_Name,' '),isnull(Curer_Doctor_Name,' '),isnull(Patient_Name,' '),isnull(Organization_Name,' '),isnull(Treatment_Total,0),isnull(Whole_Total,0) from vCentral_Exam Where Has_More_Discount = 1 "
    Set rsDisc = ExecuteSelect(Conn, sql, cc)
    Dim result As String
    result = "·„   „ ⁄„·Ì… «· ’œÌ— »‰Ã«Õ"
    Dim exported As Boolean
    Dim FileName As String
    FileName = "C:\ ﬁ—Ì— «·≈Õ«·«  «· Ì  Œ÷⁄ ·Õ”„ ≈÷«›Ì  " + Acc_DBYear + ".txt"
    Dim rsObj As Object
    Set rsObj = rsDisc
    exported = RecordsetToText(rsObj, FileName, vbTab, False)
    If exported Then result = " „  ⁄„·Ì… «· ’œÌ— »‰Ã«Õ"
    MousePointer = vbDefault
    If exported Then result = result & " Ê«·„·› «·‰« Ã ÂÊ " & vbNewLine & FileName
    MsgBox (result)
End Sub

Private Sub Form_Load()
    '  OpenConnection conn
    cmboRiba.ListIndex = 0
    Dim rs As New ADODB.Recordset
    Dim res As ADODB.Recordset
    Dim cancel As Boolean
    Dim yearID As Integer
    Dim maxYearID As Integer
    Dim sqlcommGetID As String
    
    '</Mohammad >
        sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        If res.Fields(0).Value = Null Then
           maxYearID = res.Fields(0).Value
        End If
       If Acc_DBYear = "" Then
          sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
          Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
          yearID = res.Fields(0).Value
       Else
          yearID = Acc_DBYear
       End If
       If yearID < maxYearID Then
         btnNewDetails.visible = False
       End If
     '</Mohammad >
    
    Set rs = ExecuteSelect(Conn, "select top 1 Tajaoz from Acc_Const" & Acc_DBYear, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
    Dim t As String
    If rs.EOF Then
        MsgBox "·„  ﬁ„ » ÕœÌœ ﬁÌ„… «· Ã«Ê“ ··”‰… «·„«·Ì… «·„ÿ·Ê»…° ”Ê› Ì „ › Õ ‘«‘…  ⁄ÌÌ‰ ﬁÌ„… «· Ã«Ê“ «·¬‰", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Command1_Click
        Exit Sub
    Else
        t = rs!Tajaoz
    End If
    lblTajaoz.Caption = t
    
    Dim Index As Integer
    Index = 0
    
    Set rs = ExecuteSelect(Conn, "select isnull(max(ribano),0) as riba from Acc_Riba" & Acc_DBYear, cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
    If rs.EOF Then
        Exit Sub
    End If
    Index = rs!Riba
    If Index > 3 Then
        Index = 3
    End If
    cmboRiba.ListIndex = Index
End Sub

Public Function RecordsetToText(rs As Object, Optional FullPath _
  As String, Optional ValueDelimiter As String = " ", Optional formated As Boolean = True) As Boolean

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
            If formated Then
                Print #iFileNum, ValueFormatted(oField.Value, lCtr) & sDelimiter;
            Else
                Print #iFileNum, oField.Value & sDelimiter;
            End If
        Else
            If formated Then
                Print #iFileNum, ValueFormatted(oField.Value, lCtr)
            Else
                Print #iFileNum, oField.Value
            End If
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
