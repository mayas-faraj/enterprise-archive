Attribute VB_Name = "mdlPermissions"
Global ggClientName As String
Global State_ID As Integer

Public Type state
    ' ⁄—Ì›«  «·„Õ«›Ÿ« 
    id As Integer
    name As String
    FullName As String
    Boss As String
    Accountant As String
    Secritary As String
    Account_Number As String
    Phone As String
    Settings As String
    Show_Per_Company As Boolean
    Email As String
    webSite  As String
    TFax  As String
    PostBox  As String
    Address As String
End Type

Public Type App_User
    id As Integer
    name As String
    IsAdmin As Boolean
End Type

Public Enum Mail_Type
    Sent = 0
    Recived = 1
End Enum

Global Current_State As state
Global Current_AppUser As App_User

Public frmCentral_Exam_Without_Doctor As frmCentral_Exam
Public frmCentral_Exam_With_Doctor As frmCentral_Exam
Public dlgAcc_Master_Object As dlgAcc_Master


Public Function Get_Organization_Limit(Organization_Id As Long, Central_Exam_Date As Date) As Double
    
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    
    sql = "SET DATEFORMAT DMY Select dbo.sf_Get_Organization_Limit(" & Organization_Id & ",'" & _
           format(Central_Exam_Date, "dd/mm/yyyy") & "')"
           
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì Õ”«» ”ﬁ› ≈Õ«·«  Â–Â «·‘—ﬂ…", vbCritical + vbOKOnly
        Get_Organization_Limit = 0
    Else
        Get_Organization_Limit = rs.Fields(0).Value
    End If
    
End Function

Public Sub Set_State_Settings()
    
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    
    Set rs = ExecuteSelect(Conn, "select * from Active_State", cancel)
    
    State_ID = rs.Fields(0).Value
    
    Set rs = ExecuteSelect(Conn, "select * from State_Settings  where State_ID = " & State_ID, cancel)
    
    
    If rs.RecordCount = 0 Then Exit Sub
    
    With Current_State
        .id = rs!State_ID
        .Account_Number = rs!Account_Number
        .Accountant = rs!Accountant
        .Boss = rs!Boss
        .Secritary = rs!Secritary
        .name = rs!name
        .Phone = rs!Phone & ""
        .Account_Number = rs!Account_Number
        .FullName = rs!FullName & ""
        .Settings = rs!Settings & ""
        .Show_Per_Company = GetTagValue(.Settings, "SHOW_PER_COM") = "true"
        .Email = rs!Email
        .webSite = rs!webSite
        .TFax = rs!TFax
        .PostBox = rs!PostBox
        .Address = rs!Address
    End With
    
    FARI_NAME = rs!FullName
    FARI_TEL = rs!Phone
    
    Set rs = Nothing
End Sub

Public Sub Clear_Grid(Grd As VSFlexGrid)
    Dim strFormat As String
    strFormat = Grd.FormatString
    Grd.Clear
    Grd.FormatString = strFormat
End Sub

Public Function chk_Access_Permission(form_Caption As String) As Boolean
    Dim rs As New ADODB.Recordset
    Dim res As Boolean
    Dim cancel As Boolean
    On Error GoTo 20
    res = False
    
    Set rs = ExecuteSelect(Conn, "select grant_access from user_forms u , forms f where userId = " & _
        Current_AppUser.id & " and form_caption = '" & Trim(form_Caption) & "' and u.form_id = f.form_id", cancel)
        
    With rs
        If Not (.EOF Or .BOF) Then
            If .Fields(0).Value = 1 Then
                res = True
            Else
                res = False
            End If
        End If
    End With
    
    If res = False Then MsgBox "¬”› ·Ì” ·œÌﬂ ≈–‰ œŒÊ· Â–Â «·‘«‘…", vbCritical, "„„‰Ê⁄"
    
    chk_Access_Permission = res
    
    Set rs = Nothing
    Exit Function
20:
    chk_Access_Permission = True

End Function

Sub Main()
    
     ggTypeConect = 1
    On Error GoTo 10
    O = True
'    ggLenFile = Len(ggConect)
'    ggFreeFile = FreeFile
'    Open "C:\Enter217.HA" For Random As ggFreeFile Len = ggLenFile
'    Get #ggFreeFile, 1, ggConect
    LoafFile
    If ggConect.ggServer(1) = "" Then
        Write_New_HA "Alphabatical", ".", "MicrosoftTabib", "Anahon"
        LoafFile
    End If
    Set nav(0) = MDIMain.cmdFirst
    Set nav(1) = MDIMain.cmdPrev
    Set nav(2) = MDIMain.cmdNext
    Set nav(3) = MDIMain.cmdLast
    ActiveDatabaseName = "Stock"
    OpenConnection connStock
    ActiveDatabaseName = "fari"
    OpenConnection connFari
    ActiveDatabaseName = "tadamonfari"
    OpenConnection connTadamonFari
    ActiveDatabaseName = "tawar2"
    OpenConnection connTawar2
    ActiveDatabaseName = ""
    OpenConnection connDefault
    Set_State_Settings
    FrmAppLogin.Show 1
    Exit Sub
10:
    Dim serverName As String
    serverName = InputBox("√œŒ· «”„ «·„Œœ„ «·–Ì ÌÕÊÌ ﬁ«⁄œ… «·»Ì«‰« ")
    If serverName = "" Then
        End
    End If
    Write_New_HA "Alphabatical", serverName, "MicrosoftTabib", "Anahon"
    LoafFile
    Resume
End Sub


Public Sub Write_New_HA(UserName As String, serverName As String, Pwd As String, DatabaseName As String)

    ggConect.ggDb(1) = DatabaseName
    
    ggConect.ggUser(1) = UserName
    
    ggConect.ggServer(1) = serverName
    
    ggConect.ggPas(1) = Pwd
    ggLenFile = Len(ggConect)
    ggFreeFile = FreeFile
    Open App.Path & "\Enter217.HA" For Random As ggFreeFile Len = ggLenFile
    Put #ggFreeFile, 1, ggConect
    Close #ggFreeFile
End Sub

Public Sub fillCmb(ByRef cmb As ComboBox, query As String)
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    
    cmb.Clear

    Set rs = ExecuteSelect(Conn, query, cancel)
    If cancel = True Then
        MsgBox "ÕœÀ Œÿ√ ≈À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKCancel, "Œÿ√"
    End If
    Do While Not rs.EOF
        cmb.AddItem rs.Fields("Name").Value
        cmb.ItemData(cmb.NewIndex) = rs.Fields("ID").Value
        rs.MoveNext
    Loop
    
    If cmb.ListCount > 0 Then
        cmb.ListIndex = 0
    End If
    rs.Close
   
End Sub

Function Prevent_char(KeyAscii As Integer) As Integer
    ' This Function is to prevent typing chars in text field
    If Chr(KeyAscii) Like "[!0-9]" And KeyAscii <> 8 And KeyAscii <> 13 Then
        KeyAscii = 0
    Else
        Prevent_char = KeyAscii
    End If
End Function

Function Get_DataReport_Label_byName(Dr As DataReport, Section As Integer, Label_Name As String) As Variant
    Dim ctrl
    For Each ctrl In Dr.Sections(Section).Controls
        If UCase(ctrl.name) = UCase(Label_Name) Then
            Set Get_DataReport_Label_byName = ctrl
            Exit Function
        End If
    Next ctrl
End Function
Public Sub Set_RecordCountFromAll(rs As ADODB.Recordset)
    Dim strResult As String
    On Error GoTo errHandler
    If rs Is Nothing Then GoTo errHandler
    If rs.RecordCount = 0 Then GoTo errHandler
    If rs.EOF Or rs.BOF Then GoTo errHandler
      
    strResult = " «·”Ã· «·Õ«·Ì " & rs.AbsolutePosition & " „‰ √’· " & rs.RecordCount
    MDIMain.StB.Panels(8).text = strResult
    Exit Sub
errHandler:
    MDIMain.StB.Panels(8).text = ""
End Sub

