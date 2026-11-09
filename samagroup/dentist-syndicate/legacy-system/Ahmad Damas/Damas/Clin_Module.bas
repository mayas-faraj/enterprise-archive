Attribute VB_Name = "Clin_Module"
Public GLOBAL_TAG As String
Public Type point
    pointX As Single
    pointY As Single
End Type
Public Enum DirectionEnum
    dirFirst = 1
    dirPrev = 2
    dirNext = 3
    dirLast = 4
End Enum
Public Enum ProgButton
    btClose = 0
    btPrint = 1
    btLast = 2
    btNext = 4
    btPrev = 8
    btFirst = 16
    btSearchExec = 32
    btSearchCancel = 64
    btSearch = 128
    btCancel = 256
    btsave = 512
    btDelete = 1024
    btUpdate = 2048
    btnew = 4096
    btall = 8191
End Enum

Public Enum ButtonMask
    'btMaskClose = btAll
    btMaskPrint = btall - btSearchCancel - btSearchExec - btCancel - btsave
    btMaskLast = btall
    btMaskNext = btall
    btMaskPrev = btall
    btMaskFirst = btall
    btMaskSearchExec = btall - btSearchCancel - btSearchExec - btCancel - btsave
    btMaskSearchCancel = btall - btSearchCancel - btSearchExec - btCancel - btsave
    btMaskSearch = btSearchCancel + btSearchExec
    btMaskCancel = btall - btCancel - btsave - btSearchCancel - btSearchExec
    btMaskSave = btall - btCancel - btsave - btSearchCancel - btSearchExec
    btMaskDelete = btall - btCancel - btsave - btSearchCancel - btSearchExec
    btMaskUpdate = btsave + btCancel
    btMaskNew = btsave + btCancel
    btMaskAll = btall
End Enum

Public Enum Controller_State
    ST_ADDNEW = 1
    ST_UPDATE = 2
    ST_SEARCH = 4
    ST_FILLGRID = 8
    ST_CANCELSEARCH = 16
End Enum

Global ActiveDatabaseName As String
Global connDefault As New ADODB.Connection
Global connStock As New ADODB.Connection
Global connTadamonFari As New ADODB.Connection
Global connFari As New ADODB.Connection
Global connTawar2 As New ADODB.Connection

Global nav(3) As CommandButton

Public Function Conn() As ADODB.Connection
    Select Case LCase(ActiveDatabaseName)
        Case "default"
            Set Conn = connDefault
            Acc_DBYear = Acc_DBYearSysTem
        Case "stock"
            Set Conn = connStock
            Acc_DBYear = Acc_DBYearS
        Case "fari"
            Set Conn = connFari
            Acc_DBYear = Acc_DBYearM
        Case "tadamonfari"
            Set Conn = connTadamonFari
            Acc_DBYear = Acc_DBYearT
        Case "tawar2"
            Set Conn = connTawar2
            Acc_DBYear = Acc_DBYearK
        Case Else
            Set Conn = connDefault
            Acc_DBYear = Acc_DBYearSysTem
    End Select
End Function


Public Function GetConnectionString(type1 As Integer) As String

Dim initialCatalog As String
Select Case LCase(ActiveDatabaseName)
    Case "default"
        initialCatalog = "NewDocDb"
    Case "stock"
        initialCatalog = "NewDocDbAccS"
    Case "fari"
        initialCatalog = "DocDbAccM"
    Case "tadamonfari"
        initialCatalog = "DocDbAccT"
    Case "tawar2"
        initialCatalog = "DocDbAccK"
    Case Else
        initialCatalog = "NewDocDb"
End Select

'If Acc_DBYear = "" Then
    If type1 = 1 Then '1 Local
            GetConnectionString = "Provider=SQLOLEDB.1;Password=217;Persist Security Info=True;User ID=sa;Initial Catalog=" & initialCatalog & ";Data Source=" & ggConect.ggServer(1)
        ElseIf type1 = 2 Then '2 Remote
            GetConnectionString = "Provider=SQLOLEDB.1;Password=217;Persist Security Info=True;User ID=Tabib;Initial Catalog=" & initialCatalog & ";Data Source=(local)"
    End If
'Else
'    GetConnectionString = "Provider=SQLOLEDB.1;Password=dbreader;Persist Security Info=True;User ID=dbreader;Initial Catalog=" & initialCatalog & ";Data Source=" & ggConect.ggServer(1)
'End If
End Function
Public Sub OpenConnection(ByRef cnn As ADODB.Connection)
    'If (cnn.state = 0) Then
       cnn.CommandTimeout = 0
       cnn.ConnectionTimeout = 0
   ' End If
   cnn.Open GetConnectionString(1)
End Sub
Public Sub PopulateNavigator(ByRef ButtonsForm, ByRef nav() As CommandButton, ByRef rs As ADODB.Recordset, ByVal dir As String)
    '<Mahfoud>
    ' When ButtonsForm is nothing, the nav values are the MDIMain navigator buttons
    ' Otherwise the navigation buttons should be the buttonsForm's
    If (ButtonsForm Is Nothing) Then
        actualPopulateNavigator nav, rs, dir
    Else
        Dim nvBtn(3) As CommandButton
        Set nvBtn(0) = ButtonsForm.cmdFirst
        Set nvBtn(1) = ButtonsForm.cmdPrev
        Set nvBtn(2) = ButtonsForm.cmdNext
        Set nvBtn(3) = ButtonsForm.cmdLast
        actualPopulateNavigator nvBtn, rs, dir
    End If
    '</Mahfoud

End Sub

Private Sub actualPopulateNavigator(ByRef nav() As CommandButton, ByRef rs As ADODB.Recordset, ByVal dir As String)
    'enable/disable nav according to the rs state
    'this sub considers a 4 buttons navigator: 0: first, 1: prev, 2: next, 3:last
    If Not IsObject(rs) Or rs Is Nothing Then
            nav(0).Enabled = False
            nav(1).Enabled = False
            nav(2).Enabled = False
            nav(3).Enabled = False
            Exit Sub
    End If
    If rs.state <> 0 Then
        If rs.RecordCount = 0 Then
                nav(0).Enabled = False
                nav(1).Enabled = False
                nav(2).Enabled = False
                nav(3).Enabled = False
                Exit Sub
        End If
    End If
    If dir = "all" Then
        rs.MoveFirst
        nav(0).Enabled = False
        nav(1).Enabled = False
        nav(2).Enabled = True
        nav(3).Enabled = True
        Exit Sub
    End If
    Select Case dir
    Case "next", "last":
        If rs.EOF Then
            rs.MovePrevious
            nav(2).Enabled = False
            nav(3).Enabled = False
            nav(0).Enabled = True
            nav(1).Enabled = True
        Else
            If dir = "next" Then
                rs.MoveNext
            Else
                rs.MoveLast
            End If
            If rs.EOF Then
                nav(2).Enabled = False
                nav(3).Enabled = False
                nav(0).Enabled = True
                nav(1).Enabled = True
                rs.MovePrevious
            Else
                nav(0).Enabled = True
                nav(1).Enabled = True
            End If
        End If
    Case "prev", "first":
        If rs.BOF Then
            rs.MoveNext
            nav(0).Enabled = False
            nav(1).Enabled = False
            nav(2).Enabled = True
            nav(3).Enabled = True
        Else
            If dir = "prev" Then
                rs.MovePrevious
            Else
                rs.MoveFirst
            End If
            If rs.BOF Then
                nav(0).Enabled = False
                nav(1).Enabled = False
                nav(2).Enabled = True
                nav(3).Enabled = True
                rs.MoveNext
            Else
                nav(2).Enabled = True
                nav(3).Enabled = True
            End If
        End If
        Case "refresh":
                If rs.EOF Or rs.BOF Then Exit Sub
                If rs.EditMode = adEditAdd Then
                    nav(0).Enabled = False
                    nav(1).Enabled = False
                    nav(2).Enabled = False
                    nav(3).Enabled = False
                    Exit Sub
                End If
                nav(0).Enabled = True
                nav(1).Enabled = True
                nav(2).Enabled = True
                nav(3).Enabled = True
                If rs.EOF Then
                    nav(2).Enabled = False
                    nav(3).Enabled = False
                End If
                If rs.BOF Then
                    nav(0).Enabled = False
                    nav(1).Enabled = False
                End If
    End Select
End Sub

Public Sub ExecuteCommand(ByRef Conn As ADODB.Connection, ByVal query As String, ByRef Error As Boolean)
    Error = False
    On Error GoTo errHandler
    Dim command As ADODB.command
    Set command = New ADODB.command
    command.ActiveConnection = Conn
    command.CommandText = query
    command.Execute
    Exit Sub
errHandler:
    Error = True
    Debug.Print query
    Debug.Print Err.description
End Sub
Public Function Get_Permission(ByVal permissionName As String) As Boolean
    Dim rsPermission As New ADODB.Recordset
    Dim cancel As Boolean
    Set rsPermission = ExecuteSelect(connDefault, "Select " & permissionName & "  from Users where Id = " & Current_AppUser.id, cancel)
    If cancel Then
        permissionIhalaFixed = False
    Else
        If rsPermission.Fields(0).Value = 1 Then
            permissionIhalaFixed = True
        Else
            permissionIhalaFixed = False
        End If
    End If
    Set rsPermission = Nothing
    Get_Permission = permissionIhalaFixed
End Function

Public Function ExecuteSelect(ByRef Conn As ADODB.Connection, ByVal query As String, ByRef Error As Boolean) As ADODB.Recordset
    Error = False
    On Error GoTo errHandler
    Dim rs As ADODB.Recordset
    Set rs = New ADODB.Recordset
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic
    rs.LockType = adLockOptimistic
    'Debug.Print query
    rs.Open query, Conn, , , adCmdText
    Set ExecuteSelect = rs
    Exit Function
errHandler:
    Error = True
    Debug.Print query
    Debug.Print Err.description
End Function

Public Function getController() As Controller
    On Error Resume Next
    Set getController = getDefinedController(MDIMain.ActiveForm.ActiveControl.Container)
    MDIMain.ActiveForm.SetFocus
End Function
Public Function getDefinedController(frame As frame) As Controller
    Dim ControllerName As String
    ControllerName = frame.name
    Dim cont As Controller
    Dim controllers As Collection
    Set controllers = frame.Container.controllers
    Set getDefinedController = controllers.Item(ControllerName)
End Function

Public Sub SelectFrame(ByRef currForm As Form, ByRef F As frame)
    On Error Resume Next
    For Each frme In currForm.Controls
        If TypeOf frme Is frame Then
            Dim curFrame As frame
            Set curFrame = frme
            LockFrame currForm, curFrame, True
            For Each chk In currForm.Controls
                If TypeOf chk.Container Is frame Then
                    If chk.Container = frme Then
                        If (TypeOf chk Is CheckBox) And (chk.Container = frme) And (chk.name = "chk" & frme.name) Then
                                'chk.Value = 0
                                chk.BackColor = &HE1FEFF
                        End If
                        If TypeOf chk Is CheckBox And chk.Container = F And chk.name = "chk" & F.name Then
                                 LockFrame currForm, F, False
                                'chk.Value = 1
                                chk.BackColor = &HFFFF&
                               ' chk.SetFocus
                        End If
                    End If
                End If 'element in frame
            Next 'next element
        End If
    Next ' next frame
    RefreshNavigators F
End Sub

Public Sub LockFrame(ByRef currForm As Form, ByRef F As frame, Optional LockType As Boolean = True)
    If LockType And IsFrameLocked(currForm, F) Then
        Exit Sub
    End If
    On Error Resume Next
    For Each ctrl In currForm.Controls
        If (TypeOf ctrl Is Menu) = False Then
            If TypeOf ctrl.Container Is frame Then
                If ctrl.Container = F Then
                    If LockType Then 'we are locking the frame, save the previouse state of each control
                        ctrl.Tag = SetTagValue(ctrl.Tag, "enabled", CStr(ctrl.Enabled))
                        ctrl.Enabled = False
                        If GetTagValue(ctrl.Tag, "AlwaysEnabled") = "true" Then
                            ctrl.Enabled = True
                        End If
                    Else
                       ' Debug.Print ctrl.Name & ctrl.tag
                        ctrl.Enabled = CBool(GetTagValue(ctrl.Tag, "enabled"))
                        If GetTagValue(ctrl.Tag, "AlwaysEnabled") = "true" Then
                            ctrl.Enabled = True
                        End If
                    End If
                End If
            End If
        End If
    Next
End Sub

Public Function IsFrameLocked(ByRef Form As Form, ByRef frame As frame) As Boolean
    For Each ctrl In Form.Controls
        If (TypeOf ctrl Is Menu) = False Then
            If TypeOf ctrl.Container Is frame Then
                If ctrl.Container = frame Then
                    If ctrl.name = "chk" & frame.name Then
                        IsFrameLocked = Not ctrl.Enabled
                        Exit Function
                    End If
                End If
            End If
        End If
    Next
End Function
Public Sub RefreshNavigators(ByRef F As frame)
    Dim cont As Controller
    Set cont = getDefinedController(F)
    cont.RefreshNav
End Sub
Public Function SetTagValue(Tag As String, name As String, Value As String, Optional sep As String = "=", Optional coma As String = ";") As String
   If IsNull(Tag) Or Tag = "" Then
        SetTagValue = coma & name & sep & Value & coma
        Exit Function
    End If
   If IsNull(name) Or IsNull(Value) Or name = "" Then
        SetTagValue = Tag
        Exit Function
    End If
   Dim namePos As Integer
   namePos = InStr(1, Tag, coma & name & sep)
    
  If namePos = 0 Then
        SetTagValue = Tag & name & sep & Value & coma
        Exit Function
  End If
  Dim endNameValue As Integer
  endNameValue = InStr(namePos + 1, Tag, coma)
  SetTagValue = Mid(Tag, 1, namePos - 1) & coma & name & sep & Value & coma & Mid(Tag, endNameValue + 1)
'  Debug.Print Mid(tag, 1, namePos - 1) & Name & sep & Value & sep & Mid(tag, endNameValue + 1)
End Function

Public Function GetTagValue(Tag As String, name As String, Optional sep As String = "=", Optional coma As String = ";") As String
   If IsNull(Tag) Or Tag = "" Then
        GetTagValue = ""
        Exit Function
    End If
   If IsNull(name) Or name = "" Then
        GetTagValue = ""
        Exit Function
    End If
   Dim namePos As Integer
   namePos = InStr(1, Tag, coma & name & sep)
    
  If namePos = 0 Then
        GetTagValue = ""
        Exit Function
  End If
  Dim endNameValue As Integer
  endNameValue = InStr(namePos + 1, Tag, coma)
 ' Debug.Print tag
  'Debug.Print Mid(tag, namePos + Len(name) + 2, endNameValue - Len(name) - namePos - 2)
  GetTagValue = Mid(Tag, namePos + Len(name) + 2, endNameValue - Len(name) - namePos - 2)
  'Debug.Print Mid(tag, namePos + Len(name) + 2, endNameValue - Len(name) - namePos - 2)
End Function

Public Function GetIntValue(val As Variant) As Long
    If IsNull(val) Or val = "" Then
        GetIntValue = 0
    Else
        GetIntValue = val
    End If
End Function
Public Function GetStringValue(val As Variant) As String
    If IsNull(val) Then
        GetStringValue = ""
    Else
        GetStringValue = val
    End If
End Function

Public Sub RefreshCommands(btns As Long, Optional ButtonsForm As Form)
    If ButtonsForm Is Nothing Then
        Set ButtonsForm = MDIMain
    End If
    With ButtonsForm
        If btns And btCancel Then .cmdCancel.Enabled = True Else .cmdCancel.Enabled = False
'        If btns And btClose Then .cmdClose.Enabled = True Else .cmdClose.Enabled = False
        If btns And btDelete Then .cmdDel.Enabled = True Else .cmdDel.Enabled = False
        If btns And btFirst Then .cmdFirst.Enabled = True Else .cmdFirst.Enabled = False
        If btns And btLast Then .cmdLast.Enabled = True Else .cmdLast.Enabled = False
        If btns And btnew Then .cmdNew.Enabled = True Else .cmdNew.Enabled = False
        If btns And btNext Then .cmdNext.Enabled = True Else .cmdNext.Enabled = False
        If btns And btPrev Then .cmdPrev.Enabled = True Else .cmdPrev.Enabled = False
        If btns And btPrint Then .cmdPrint.Enabled = True Else .cmdPrint.Enabled = False
        If btns And btsave Then .cmdSave.Enabled = True Else .cmdSave.Enabled = False
        If btns And btSearch Then .cmdSearch.Enabled = True Else .cmdSearch.Enabled = False
        If btns And btSearchCancel Then .cmdCancelSearch.Enabled = True Else .cmdCancelSearch.Enabled = False
        If btns And btSearchExec Then .cmdExecSearch.Enabled = True Else .cmdExecSearch.Enabled = False
        If btns And btUpdate Then .cmdUpdate.Enabled = True Else .cmdUpdate.Enabled = False
    End With
End Sub

Public Function GetBtnSettings(Optional ButtonsForm As Form) As Long
    Dim setting As Long
    setting = 0
    If ButtonsForm Is Nothing Then
        Set ButtonsForm = MDIMain
    End If
    With ButtonsForm
        If .cmdCancel.Enabled Then setting = setting + btCancel
        If .cmdClose.Enabled Then setting = setting + btClose '.cmdClose.Enabled = lockType
        If .cmdDel.Enabled Then setting = setting + btDelete   '.cmdDel.Enabled = lockType
        If .cmdFirst.Enabled Then setting = setting + btFirst  '.cmdFirst.Enabled = lockType
        If .cmdLast.Enabled Then setting = setting + btLast   '.cmdLast.Enabled = lockType
        If .cmdNew.Enabled Then setting = setting + btnew  '.cmdNew.Enabled = lockType
        If .cmdNext.Enabled Then setting = setting + btNext  '.cmdNext.Enabled = lockType
        If .cmdPrev.Enabled Then setting = setting + btPrev  '.cmdPrev.Enabled = lockType
        If .cmdPrint.Enabled Then setting = setting + btPrint   '.cmdPrint.Enabled = lockType
        If .cmdSave.Enabled Then setting = setting + btsave  '.cmdSave.Enabled = lockType
        If .cmdSearch.Enabled Then setting = setting + btSearch  '.cmdSearch.Enabled = lockType
        If .cmdCancelSearch.Enabled Then setting = setting + btSearchCancel   '.cmdCancelSearch.Enabled = lockType
        If .cmdExecSearch.Enabled Then setting = setting + btSearchExec  '.cmdExecSearch.Enabled = lockType
        If .cmdUpdate.Enabled Then setting = setting + btUpdate '.cmdUpdate.Enabled = lockType
    End With
    GetBtnSettings = setting
End Function

Public Sub FormatForm(ByRef F As Form)
    F.BackColor = &HE1FEFF
End Sub

Public Function IsUniqValue(q As String) As Integer
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    Set rs = ExecuteSelect(Conn, q, cancel)
    IsUniqValue = 0
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        IsUniqValue = -1
        Exit Function
    End If
    'If rs.EOF Then
    If rs.RecordCount = 0 Or rs.MaxRecords = 0 Then
        IsUniqValue = 1
        Exit Function
    End If
    
End Function

Public Function GetListIndex(ctrl As ComboBox, Value As Variant) As Long
    Dim i As Long
    
    For i = 0 To ctrl.ListCount - 1
       ' Debug.Print ctrl.Name
        If ctrl.ItemData(i) = Value Then
            GetListIndex = i
            Exit Function
        End If
    Next
    GetListIndex = -1
End Function

Public Function GetListIndex_ListBox(ctrl As ListBox, Value As Variant) As Long
    Dim i As Long
    
    For i = 0 To ctrl.ListCount - 1
       ' Debug.Print ctrl.Name
        If ctrl.ItemData(i) = Value Then
            GetListIndex_ListBox = i
            Exit Function
        End If
    Next
    GetListIndex_ListBox = -1
End Function

Public Function IsValidNumber(id As String, Typ As String) As Boolean
On Error GoTo errHandler
    If id = "" Then
        IsValidNumber = True
        Exit Function
    End If
    If Not IsNumeric(id) Then
        IsValidNumber = False
        Exit Function
    End If
    Dim pos As Long
    pos = InStr(1, Typ, "integer")
    Dim op As String
    If pos = 1 Then 'integer
        op = Mid(Typ, 8)
        If CLng(id) <> CDbl(id) Then
            IsValidNumber = False
            Exit Function
        End If
    End If
    pos = InStr(1, Typ, "real")
    If pos = 1 Then 'real
        op = Mid(Typ, 5)
    End If
    If op = "" Then
            IsValidNumber = True
            Exit Function
    End If
    Select Case op
        Case ">0": IsValidNumber = CDbl(id) > 0
        Case "<0": IsValidNumber = CDbl(id) < 0
        Case ">=0": IsValidNumber = CDbl(id) >= 0
        Case "<=0": IsValidNumber = CDbl(id) <= 0
        Case "<>0": IsValidNumber = CDbl(id) <> 0
        '<AHMAD>
        Case "=Year": IsValidNumber = (Len(Trim(id)) = 4)
        '</AHMAD>
        Case Else
            IsValidNumber = False
    End Select
    Exit Function
errHandler:
            IsValidNumber = False
End Function
Public Function IsValidDate(val As String, Optional format As String = "dmy") As Boolean
    If Not IsDate(val) Then
        IsValidDate = False
        Exit Function
    End If
    Dim D As Date
    D = CDate(val)
    val = FormatDateTime(val, vbShortDate)
    IsValidDate = True
End Function
Public Function RemoveTag(Tag As String, name As String, Optional sep As String = "=", Optional coma As String = ";") As String
    Dim newTag As String
    newTag = SetTagValue(Tag, name, "", sep, coma)
    newTag = Replace(newTag, name & sep & coma, "")
    RemoveTag = newTag
End Function


Public Sub ResizeGrid(ByRef fg As VSFlexGrid)
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
    For i = 0 To fg.Cols - 1
        If Not fg.ColHidden(i) Then
            totWidth = totWidth + fg.ColWidth(i)
        End If
    Next
    For i = 0 To fg.Cols - 1
        If Not fg.ColHidden(i) Then
            fg.ColWidth(i) = (fg.Width - 400) * fg.ColWidth(i) / totWidth
        End If
    Next
End Sub

Public Function GetFirstNonHiddenCol(ctrl As Variant) As Long
    Dim i As Long
    For i = 0 To ctrl.Cols - 1
        If Not ctrl.ColHidden(i) Then
            GetFirstNonHiddenCol = i
            Exit Function
        End If
    Next
    GetFirstNonHiddenCol = 0
End Function

Public Function BuildComboListLookupString(ByRef fg As VSFlexGrid, ValueField As String, DisplayFields As String, TableName As String) As String
    'Returns a string to be used by ColComboList property of VsFlexGrid
    
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    
    sql = "SELECT " & ValueField & ", " & Replace(Replace(DisplayFields, "*", ""), "&", ",") & " FROM " & TableName & " Order by 2 "
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    DisplayFields = Replace(DisplayFields, "&", ",")
    DisplayFields = Replace(DisplayFields, "[", "")
    DisplayFields = Replace(DisplayFields, "]", "")
    BuildComboListLookupString = fg.BuildComboList(rs, DisplayFields, ValueField, &HFFFFFF)
    Set rs = Nothing
    
End Function

Public Function GetLookupValue(Value As Integer, ValueField As String, lookupDisplayFields As String, lookupTableName As String) As String
    ' Returns the display value corresponds to the key value according to a lookup relation
    
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    
    sql = "SELECT " & ValueField & ", " & Replace(Replace(lookupDisplayFields, "*", ""), "&", ",") & " FROM " & lookupTableName
    sql = sql & vbCrLf & "WHERE " & ValueField & " = " & Value & " Order by 2 "
    Set rs = ExecuteSelect(Conn, sql, cancel)
        
    GetLookupValue = rs.Fields(1).Value
    
    Set rs = Nothing
End Function
Public Sub Export2Exel(res As ADODB.Recordset)
    Dim sFileLocation As String
    Dim file As Application
    Dim oXL, oBook As Object
    
    Dim xlApp As Object
    Dim xlWb As Object
    Dim xlWs As Object
    
    Dim recArray As Variant
    
    Dim strDB As String
    Dim fldCount As Integer
    Dim recCount As Long
    Dim iCol As Integer
    Dim iRow As Integer

    ' Create an instance of Excel and add a workbook
    Set xlApp = CreateObject("Excel.Application")
    Set xlWb = xlApp.Workbooks.Add
    Set xlWs = xlWb.Worksheets("Ê—ﬁ…1")
  
    ' Display Excel and give user control of Excel's lifetime
    xlApp.visible = True
    xlApp.UserControl = True
    
    ' Copy field names to the first row of the worksheet
    fldCount = res.Fields.count
    For iCol = 1 To fldCount
        xlWs.Cells(1, iCol).Value = res.Fields(iCol - 1).name
    Next
        
    ' Check version of Excel
    If val(Mid(xlApp.Version, 1, InStr(1, xlApp.Version, ".") - 1)) > 8 Then
        'EXCEL 2000,2002,2003, or 2007: Use CopyFromRecordset
         
        ' Copy the recordset to the worksheet, starting in cell A2
        If (res.state = 0) Then
            res.Open Get_Sql_Statment, Conn, , , adCmdText
        End If
            xlWs.Cells(2, 1).CopyFromRecordset res
       
        'Note: CopyFromRecordset will fail if the recordset
        'contains an OLE object field or array data such
        'as hierarchical recordsets
        
    End If
    ' Close ADO objects
    'res.Close
   ' Set res = Nothing
    ' Release Excel references
    Set xlWs = Nothing
    Set xlWb = Nothing

    Set xlApp = Nothing


End Sub
