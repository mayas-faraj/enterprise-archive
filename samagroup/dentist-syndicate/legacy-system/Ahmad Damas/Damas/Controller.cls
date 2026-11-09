VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Controller"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Public WithEvents rs As ADODB.Recordset
Attribute rs.VB_VarHelpID = -1

Public Event doCancelSave(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doSave(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doSaveComplete(ByRef rs As ADODB.Recordset)
Public Event doAddNew(ByRef rs As ADODB.Recordset)
Public Event DoUpdate(ByRef rs As ADODB.Recordset)
Public Event doPrint(ByRef rs As ADODB.Recordset)
Public Event doBeforeDelete(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event DoDelete(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doDeleteCompleted(ByRef rs As ADODB.Recordset)
Public Event doSearch(ByRef rs As ADODB.Recordset, ByRef S As String, ByRef DefaultType As Integer)
Public Event doMoveFirst(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doMoveLast(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doMoveNext(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doMovePrev(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doMove(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean, ByVal dir As DirectionEnum)
Public Event doMoveComplete(ByRef rs As ADODB.Recordset)
Public Event doBeforeMoveComplete(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event ValidateValue(ByRef ctrl As Control, S As String, ByRef checkType As Boolean, ByRef msg As String)
Public Event doEOFReached(ByRef rs As ADODB.Recordset)
'<AHMAD>
Public Event doBeforeAddNew(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doBeforeUpdate(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doCancelSearch(ByRef rs As ADODB.Recordset)
Public Event doSearchComplete(ByRef rs As ADODB.Recordset)
Public Event doBeginSearch(ByRef rs As ADODB.Recordset)
Public Event doDeleteError(ByRef rs As ADODB.Recordset, ByRef ErrorObeject As ErrObject, cancel As Boolean)
Public Event doSaveError(ByVal state As Controller_State, ByRef rs As ADODB.Recordset, ByRef ErrorObeject As ErrObject, ByRef msg As String, ByRef KeepState As Boolean)
Public Event doBeforeSearchAfterBeginSearch(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event OnViewAllRecords(ByRef rs As ADODB.Recordset, ByRef cancel As Boolean)
Public Event doCancelSaveComplete(ByRef rs As ADODB.Recordset)
Public Event doCancelSearchComplete(ByRef rs As ADODB.Recordset)
Public SaveAfterWhat As Controller_State

'</AHMAD>
Public Form As Form
Public frame As frame
Public ButtonsForm As Form

Public state As Controller_State
Dim pos As Long
Dim lastRsPos As Long

Public TraceChanges As Boolean

Private Sub ShowError(ctrl As Control, msg As String)
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        'Dim fg As VSFlexGrid
        ctrl.ShowCell ctrl.Row, ctrl.Col
        ctrl.Cell(flexcpBackColor, ctrl.Row, ctrl.Col) = &HFF&
        MsgBox msg
        ctrl.Cell(flexcpBackColor, ctrl.Row, ctrl.Col) = &H80000005
    Else
        '<AHMAD>
        'If Not (TypeOf ctrl Is ComCtl2.DTPicker Or TypeOf ctrl Is MSComCtl2.DTPicker) Then
        If Not (TypeOf ctrl Is MSComCtl2.DTPicker) Then
            ctrl.BackColor = &HFF&
            MsgBox msg
            If ctrl.visible Then
                ctrl.SetFocus
            Else
            End If
            ctrl.BackColor = &H80000005
        Else
            Dim wid As Long
            If msg <> "" Then
               wid = ctrl.Width
               ctrl.Font.Bold = True
               ctrl.Font.Size = 14
               ctrl.Width = wid * 1.3 ' 1695
               MsgBox msg
            End If
             ctrl.SetFocus
             ctrl.Font.Size = 8
             ctrl.Font.Bold = False
             ctrl.Width = wid
        End If
        '</AHMAD>
    End If
    
End Sub

Private Function checkValue(ByRef ctrl As Control, S As String) As Boolean
    Dim res As Boolean
    res = True
    If InStr(1, S, "integer") = 1 Or InStr(1, S, "real") = 1 Then
        res = IsValidNumber(GetControlValue(ctrl), S)
        If Not res Then
            ShowError ctrl, "Â–« «·Õﬁ· ÌÕÊÌ ﬁÌ„… €Ì— „ﬁ»Ê·…° «·—Ã«¡ Ê÷⁄ ﬁÌ„… ’ÕÌÕ…"
        End If
    ElseIf S = "required" Then
        If Trim(GetControlValue(ctrl)) = "" Then
            ShowError ctrl, "ÌÃ» ≈œŒ«· ﬁÌ„… ›Ì Â–« «·Õﬁ·"
            res = False
        End If
    ElseIf S = "date" Then
        Dim strDateVal As String
        strDateVal = GetControlValue(ctrl)
        ' Null value is acceptable for Date
        res = (strDateVal = "") Or IsValidDate(strDateVal)
        If Not res Then
            ShowError ctrl, "Â–« «·Õﬁ· ÌÕÊÌ ﬁÌ„… €Ì— „ﬁ»Ê·…° «·—Ã«¡ Ê÷⁄ ﬁÌ„… ’ÕÌÕ…"
        End If
    ElseIf S = "custom" Then
        Dim cancel As Boolean
        Dim msg As String
         RaiseEvent ValidateValue(ctrl, S, cancel, msg)
         If cancel Then
            ShowError ctrl, msg
         End If
         res = Not cancel
    Else
        res = True
    End If
    checkValue = res
End Function

Public Function validate() As Boolean
    Dim S As String
    Dim origTag As String
    Dim ctrl As Control
    Dim subTag As String
    Dim i As Long
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Set ctrl = getGridInFrame
        origTag = ctrl.Tag
        S = GetTagValue(origTag, "check")
        Do While S <> ""
            For i = 0 To ctrl.Cols - 1
                ctrl.Col = i
                subTag = GetTagValue(S, CStr(i), ":", ",")
                If Not checkValue(ctrl, subTag) Then
                    validate = False
                    Exit Function
                End If
            Next
            origTag = RemoveTag(origTag, "check")
            S = GetTagValue(origTag, "check")
        Loop
        validate = True
        Exit Function
    End If

    For Each ctrl In Form.Controls
        If (TypeOf ctrl Is Menu) = False Then
        '<AHMAD>
            If TypeOf ctrl.Container Is frame Then
                If ctrl.Container = frame Then
        '</AHMAD>
                    origTag = ctrl.Tag
                    S = GetTagValue(origTag, "check")
                    Do While S <> ""
                        If Not checkValue(ctrl, S) Then
                            validate = False
                            Exit Function
                        End If
                        origTag = RemoveTag(origTag, "check")
                        S = GetTagValue(origTag, "check")
                    Loop
                End If
            End If
        End If
    Next
    validate = True
End Function

Public Sub CancelSave()
    Dim cancel As Boolean
    RaiseEvent doCancelSave(rs, cancel)
    If cancel Then Exit Sub
    Dim isGrid, isNew As Boolean
    isGrid = GetTagValue(frame.Tag, "repeat") = "true"
    isNew = (state And ST_ADDNEW) <> 0
    RefreshCommands FormSettings And btMaskCancel, ButtonsForm
    '<ahmad>
'        If isNew Then
'            rs.CancelUpdate
'        End If
        If isNew And Not (rs.EOF Or rs.BOF) Then
            rs.CancelUpdate
        End If
    '</ahmad>




'    If isGrid Then
'        Dim ctrl As Control
'        Set ctrl = getGridInFrame()
'        If ctrl Is Nothing Then Exit Sub
'        ctrl.Rows = ctrl.Rows - 1
'        State = 0
'        Exit Sub
'    End If
    state = 0
    If rs.RecordCount > 0 Then
        If isGrid Then
            rs.MoveFirst
        ElseIf Not rs.EOF Then
            rs.CancelUpdate
            If rs.RecordCount > 0 Then rs.MoveFirst
        End If
    Else
        rs.Requery
    End If
    RaiseEvent doCancelSaveComplete(rs)
End Sub

Public Sub Save()
    '<AHMAD>
        If rs.RecordCount = 0 And state = ST_UPDATE Then
           MsgBox "⁄„·Ì… «· ⁄œÌ· €Ì— „„ﬂ‰… ·√‰ ⁄œœ «·”Ã·«  = 0 ", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
           CancelSave
           Exit Sub
        End If
    '</AHMAD>
    Dim cancel As Boolean
    If Not validate Then Exit Sub
    'default behaviour: autosave
    Dim ctrl As Control
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Set ctrl = getGridInFrame()
        If ctrl Is Nothing Then Exit Sub
        MoveRSToSelectedRow ctrl, rs
        RaiseEvent doSave(rs, cancel)
        If cancel Then Exit Sub
        SaveGrid ctrl, rs
    Else
       'HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
        RaiseEvent doSave(rs, cancel)
       'HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
        
        If cancel Then Exit Sub
        For Each ctrl In Form.Controls
            If (TypeOf ctrl Is Menu) = False Then
                If TypeOf ctrl.Container Is frame Then
                    If ctrl.Container = frame Then
                        SetValueToRS ctrl, rs
                    End If
                End If
            End If
        Next
    End If
    Dim origState As Controller_State
    origState = state
    RefreshCommands FormSettings And btMaskSave, ButtonsForm
    If state And ST_ADDNEW Then state = state - ST_ADDNEW
    If state And ST_UPDATE Then state = state - ST_UPDATE
    On Error GoTo ErrorHandler
    Dim step As Integer
    step = 0
    
    rs.Update
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
    step = 1
    RaiseEvent doSaveComplete(rs)
    Exit Sub
ErrorHandler:

    If step <> 0 Then
        Err.Raise Err.Number
        Exit Sub
    End If
    Dim data As String
    data = getFormData
    If GetTagValue(frame.Tag, "repeat") = "true" And ((origState And ST_ADDNEW) <> 0) Then
        Dim fg As VSFlexGrid
        Set fg = getGridInFrame()
        If fg Is Nothing Then Exit Sub
        fg.RemoveItem fg.Row
    End If
    Dim msg As String
    Dim KeepState As Boolean
    msg = ""
    KeepState = True
    RaiseEvent doSaveError(origState, rs, Err, msg, KeepState)
    If msg <> "" Then
        MsgBox msg, vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Œÿ√ Õ›Ÿ"
    Else
       ' MsgBox rs.ActiveConnection.Errors(0).description
        MsgBox "Õ’· Œÿ√ √À‰«¡ ⁄„·Ì… «·Õ›Ÿ° Õ«Ê· „—… √Œ—Ï Ê›Ì Õ«·  ﬂ—«— «·Œÿ√° «·—Ã«¡ «·« ’«· »„Ê“⁄ «·»—‰«„Ã." & vbCrLf & "—ﬁ„ «·Œÿ√ " & Err.Number, vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Œÿ√ Õ›Ÿ"
    End If
    
    Dim S As Controller_State
    S = state
    state = ST_FILLGRID
    rs.CancelUpdate
    state = S
    
    If KeepState Then
        If origState And ST_ADDNEW Then
            addNew
        ElseIf origState And ST_UPDATE Then
            Update
        End If
        setFormData data
    End If
End Sub

Private Sub SaveGrid(fg As Control, rs As ADODB.Recordset)
        Dim datafields As String
        datafields = GetTagValue(fg.Tag, "datafield")
        Dim lookupEllipses As String
        lookupEllipses = GetTagValue(fg.Tag, "ellipse")
        Dim isEllipse As Boolean
        Dim i As Long
        Dim F As String
        For i = 0 To fg.Cols - 1 'walk through all the columns to fill their data
            fg.Col = i
            ' check if this column is bounded to a data field
            F = GetTagValue(datafields, CStr(i), ":", ",")
            If F <> "" Then
                ' check if this field is a lookup field
                isEllipse = (GetTagValue(lookupEllipses, CStr(i), ":", ",") <> "")
                If isEllipse Then
                    If Trim(fg.Cell(flexcpData)) <> "" Then
                        rs.Fields(F).Value = Trim(fg.Cell(flexcpData))
                    End If
                Else
                    If Trim(fg.text) <> "" Then
                        If IsNumeric(Trim(fg.text)) Then
                            rs.Fields(F).Value = val(Trim(fg.text))
                        Else
                            rs.Fields(F).Value = Trim(fg.text)
                        End If
                    Else
                        rs.Fields(F).Value = Null
                    End If
                End If
            End If
        Next
End Sub

Private Sub SetValueToRS(ByRef ctrl As Control, ByRef rs As ADODB.Recordset)
              
On Error GoTo EndIfSTMT
    If ctrl.datafield <> "" Then
        Dim strVal As String
        strVal = Trim(GetControlValue(ctrl))
        If strVal <> "" Then
            rs.Fields(ctrl.datafield).Value = strVal
        Else
            rs.Fields(ctrl.datafield).Value = Null
        End If
    End If
    Exit Sub
EndIfSTMT:
    Err.Clear
    
End Sub

Public Sub addNew()
    
   '<AHMAD>
        Dim cancel As Boolean
        
        RaiseEvent doBeforeAddNew(rs, cancel)
         
        If cancel Then Exit Sub
   '</AHMAD>
    
    
    
    RefreshCommands FormSettings And btMaskNew, ButtonsForm
    state = state + ST_ADDNEW
'    If rs.EOF Then
'        lastRsPos = 0
'    Else
'        lastRsPos = rs.AbsolutePosition - 1
'    End If


    SaveAfterWhat = ST_ADDNEW
    
    rs.addNew
    Dim ctrl As Control
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Set ctrl = getGridInFrame()
        If ctrl Is Nothing Then Exit Sub
        state = state - ST_ADDNEW
        ctrl.SetFocus
        ctrl.Rows = ctrl.Rows + 1
        ctrl.Row = ctrl.Rows - 1
        state = state + ST_ADDNEW
        Dim i As Long
        Dim newTag As String
        newTag = GetTagValue(ctrl.Tag, "new")
        For i = 0 To ctrl.Cols - 1
            ctrl.Cell(flexcpText, ctrl.Rows - 1, i) = GetTagValue(newTag, CStr(i), ":", ",")
        Next
        ' perform lookup
        performLookup ctrl
        RaiseEvent doAddNew(rs)
        '<AHMAD>
            ctrl.ShowCell ctrl.Rows - 1, 0
        '</AHMAD
        Exit Sub
    End If
    On Error Resume Next
    For Each ctrl In Form.Controls
        If (TypeOf ctrl Is Menu) = False Then
            If TypeOf ctrl.Container Is frame Then
                If ctrl.Container = frame Then
                    If ctrl.datafield <> "" Then
                        SetControlValue ctrl, GetTagValue(ctrl.Tag, "new")
                    End If
                End If
            End If
        End If
    Next
    state = state + ST_ADDNEW
    RaiseEvent doAddNew(rs)
End Sub

Public Sub Update()
    Dim cancel As Boolean
    RaiseEvent doBeforeUpdate(rs, cancel)
    If cancel Then Exit Sub
    state = ST_UPDATE
    RefreshCommands FormSettings And btMaskUpdate, ButtonsForm
    RaiseEvent DoUpdate(rs)
     SaveAfterWhat = ST_UPDATE
End Sub

Public Sub Delete(Optional ShowConfirmationMessage As Boolean = True, Optional DontFireDoDeleteEvent As Boolean = False)
    
    Dim cancel As Boolean
    
    '<AHMAD>
        If rs.RecordCount = 0 Then
           MsgBox "⁄„·Ì… «·Õ–› €Ì— „„ﬂ‰… ·√‰ ⁄œœ «·”Ã·«  = 0 ", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
           Exit Sub
        End If
    '</AHMAD>
    
    RaiseEvent doBeforeDelete(rs, cancel)
    If cancel Then Exit Sub
    
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Dim ctrl As Control
        Set ctrl = getGridInFrame()
        If ctrl Is Nothing Then Exit Sub
        ctrl.Col = GetFirstNonHiddenCol(ctrl)
        If ShowConfirmationMessage Then
            If MsgBox("Â· √‰  „ √ﬂœ „‰ ⁄„·Ì… «·Õ–›ø", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading + vbYesNo, " √ﬂÌœ ⁄„·Ì… «·Õ–›") = vbNo Then Exit Sub
        End If
        RefreshCommands FormSettings And btMaskDelete, ButtonsForm
        
        MoveRSToSelectedRow ctrl, rs
        If Not DontFireDoDeleteEvent Then
            RaiseEvent DoDelete(rs, cancel)
        End If
        If cancel Then Exit Sub
        On Error GoTo ErrorHandler
        Dim step As Integer
        step = 0
        rs.Delete
        step = 1
        RaiseEvent doDeleteCompleted(rs)
        If rs.RecordCount > 0 Then
            rs.MoveFirst
        Else
            ctrl.Rows = 1
            addNew
        End If
        Exit Sub
    End If
    If ShowConfirmationMessage Then
        If MsgBox("Â· √‰  „ √ﬂœ „‰ ⁄„·Ì… «·Õ–›ø", vbCritical + vbMsgBoxRight + vbMsgBoxRtlReading + vbYesNo, " √ﬂÌœ ⁄„·Ì… «·Õ–›") = vbNo Then Exit Sub
    End If
    RefreshCommands FormSettings And btMaskDelete, ButtonsForm
    
    If rs.EOF Or rs.BOF Then Exit Sub
    If Not DontFireDoDeleteEvent Then
        RaiseEvent DoDelete(rs, cancel)
    End If
    If cancel Then Exit Sub
    On Error GoTo ErrorHandler
    step = 0
    rs.Delete
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
    step = 1
    RaiseEvent doDeleteCompleted(rs)
    rs.MoveNext
    If rs.RecordCount > 0 Then
        rs.MovePrevious
        If rs.BOF Then
            rs.MoveNext
        End If
    Else
        Call addNew
    End If
    Exit Sub
    
ErrorHandler:
    If step <> 0 Then
        Err.Raise Err.Number
        Exit Sub
    End If
    cancel = False
    rs.CancelUpdate
    RaiseEvent doDeleteError(rs, Err, cancel)
    If Not cancel Then
        MsgBox "Õ’· Œÿ√ √À‰«¡ ⁄„·Ì… «·Õ–›° Õ«Ê· „—… √Œ—Ï Ê›Ì Õ«·  ﬂ—«— «·Œÿ√° «·—Ã«¡ «·« ’«· »„Ê“⁄ «·»—‰«„Ã.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Œÿ√ —ﬁ„ " & Err.Number
    End If
End Sub

Public Sub BeginSearch()
    '<AHMAD>
        If rs Is Nothing Then GoTo 50
        If rs.RecordCount = 0 Then
50:
            MsgBox "·« Ì„ﬂ‰ﬂ ≈Ã—«¡ «·»ÕÀ ·√‰ ⁄œœ «·”Ã·«  = 0", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
            Exit Sub
        End If
    '</AHMAD>

    state = ST_SEARCH
    RefreshCommands FormSettings And btMaskSearch, ButtonsForm
    '<AHMAD>
    RaiseEvent doBeginSearch(rs)
    '</AHMAD>
    Dim ctrl As Control
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Set ctrl = getGridInFrame
        'Dim fg As VSFlexGrid
        'ctrl.Add
        ctrl.AddItem "", 1
        ctrl.Cell(flexcpBackColor, 1, 0, 1, ctrl.Cols - 1) = vbGreen
        '<AHMAD>
            ctrl.ShowCell 1, 0
        '</AHMAD
        Exit Sub
    End If
    On Error Resume Next
        For Each ctrl In Form.Controls
            If (TypeOf ctrl Is Menu) = False Then
                If TypeOf ctrl.Container Is frame Then
                    If ctrl.Container = frame Then
                        If TypeOf ctrl Is ListBox Then
                            ctrl.Tag = SetTagValue(ctrl.Tag, "searchVisible", ctrl.visible)
                            ctrl.visible = False
                        'ElseIf (TypeOf ctrl Is ComCtl2.DTPicker Or TypeOf ctrl Is MSComCtl2.DTPicker) Then
                        ElseIf (TypeOf ctrl Is MSComCtl2.DTPicker) Then
                            'I wrote DTPicker twice becuase we have tow versions of DateTimePicker in our project
                            ctrl.Tag = SetTagValue(ctrl.Tag, "searchCheckBox", ctrl.CheckBox)
                            ctrl.Tag = SetTagValue(ctrl.Tag, "searchNull", IsNull(ctrl.CheckBox))
                            ctrl.CheckBox = True
                            ctrl.Value = Null
                        End If
                        
                        ctrl.datafield = ctrl.datafield
                        If Err.Number <> 0 Then
                            Err.Clear
                        '<AHMAD>
                        'ElseIf ctrl.DataField <> "" Then
                        ElseIf Not TypeOf ctrl Is Label Then
                        '</AHMAD>
                            If ctrl.name <> "chk" & frame.name And GetTagValue(ctrl.Tag, "search") <> "true" Then
                                ctrl.Tag = SetTagValue(ctrl.Tag, "searchVisible", ctrl.visible)
                                ctrl.visible = False
                            Else
                                ctrl.Tag = SetTagValue(ctrl.Tag, "searchEnable", ctrl.Enabled)
                                SetControlValue ctrl, ""
                                ctrl.Enabled = True
                            End If
                        End If
                    End If
                ElseIf TypeOf ctrl Is frame Then
                    If ctrl <> frame Then ctrl.visible = False
                End If
            End If
        Next
        Exit Sub
    
'ErrHndlr:
'    If Err.Number = 438 Then
'       'Ctrl doen't Support DataField Property
'       Resume Next
'    End If
End Sub

Public Sub Search()
    Dim cancel As Boolean
    '<AHMAD>
    RaiseEvent doBeforeSearchAfterBeginSearch(rs, cancel)
    If cancel Then Exit Sub
    '</AHMAD>
        
        
        
    Dim ctrl As Control
    Dim DefaultType As Integer
    Dim S As String
    Dim isGrid As Boolean
    S = ""
    isGrid = False
    DefaultType = 0 'continue the default behaviour
    RaiseEvent doSearch(rs, S, DefaultType)
    If DefaultType <> 2 Then 'override default behaviour
        If DefaultType = 1 Then 'merge with default behaviour
            If S <> "" Then S = S & " and "
        End If
        If GetTagValue(frame.Tag, "repeat") = "true" Then
            Set ctrl = getGridInFrame
            isGrid = True
            Dim i As Long
            Dim query As String
            For i = 0 To ctrl.Cols - 1
                query = getQueryFromGrid(ctrl, rs, i)
                If query <> "" Then
                    S = S & " " & query & " and "
                End If
            Next
        Else
            For Each ctrl In Form.Controls
                If (TypeOf ctrl Is Menu) = False Then
                    If TypeOf ctrl.Container Is frame Then
                        If ctrl.Container = frame Then
                            If GetTagValue(ctrl.Tag, "search") = "true" Then
                                If ctrl.datafield <> "" Then
                                    Dim val As String
                                    val = FormatValue(GetControlValue(ctrl), rs.Fields(ctrl.datafield).Type)
                                    If val <> "" And val <> "''" Then
                                        S = S & " " & ctrl.datafield & val & " and "
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            Next
        End If
    End If
    If S <> "" Then 'trim the last and from the filter
        S = RTrim(S)
        If InStrRev(S, "and") = Len(S) - Len("and") + 1 Then
            S = Mid(S, 1, Len(S) - Len("and"))
        End If
    End If
    On Error GoTo ErrorHandler
    Dim choice As VbMsgBoxResult
    'NoBlankSearchAlert=true;NoBlankSearchCancel=true;
    Dim NoBlankSearchAlert As Boolean
    Dim NoBlankSearchCancel As Boolean
    
    NoBlankSearchAlert = GetTagValue(frame.Tag, "NoBlankSearchAlert") = "true"
    NoBlankSearchCancel = GetTagValue(frame.Tag, "NoBlankSearchCancel") = "true"
    If S <> "" Or NoBlankSearchAlert Then
        choice = vbOK
    Else
        choice = MsgBox("·„  ﬁ„ » ÕœÌœ √Ì „⁄«„·«  »ÕÀ° Â·  —Ìœ ⁄—÷ Ã„Ì⁄ «·”Ã·« ø", vbQuestion Or vbOKCancel, "»ÕÀ")
    End If
  If choice = vbOK Then
        'If S <> "" Or NoBlankSearchAlert Then
            rs.Filter = S
        'End If
        If rs.RecordCount = 0 And Not NoBlankSearchAlert Then
            MsgBox "·„ Ì‰ Ã ⁄‰ «·»ÕÀ √Ì ‰ ÌÃ…", vbInformation Or vbOKOnly, "»ÕÀ"
        End If
        If Not NoBlankSearchCancel And ((Not isGrid And rs.RecordCount > 0) Or S = "") Then
            RefreshCommands FormSettings And btMaskSearchExec, ButtonsForm
            CancelSearch
        End If
    End If
    '<AHMAD>
    RaiseEvent doSearchComplete(rs)
    '</AHMAD>
    
    
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
    
    Exit Sub
ErrorHandler:
    'CancelSearch
    'BeginSearch
    MsgBox "ÌÊÃœ Œÿ√ ›Ì „⁄«„·«  «·»ÕÀ° «·—Ã«¡  ’ÕÌÕ «·Œÿ√"
End Sub

Public Sub CancelSearch()
    
    RefreshCommands FormSettings And btMaskSearchCancel, ButtonsForm
    state = state - ST_SEARCH + ST_CANCELSEARCH
    
    '<AHMAD>
    'Raise the doCancelSearch Evant
    RaiseEvent doCancelSearch(rs)
    '</AHMAD>
    
    
    If rs.RecordCount = 0 Then
        rs.Filter = ""
    End If
    Dim ctrl As Control
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Set ctrl = getGridInFrame
        ctrl.RemoveItem 1
        Exit Sub
    End If
    On Error Resume Next
        For Each ctrl In Form.Controls
            If (TypeOf ctrl Is Menu) = False Then
                If TypeOf ctrl.Container Is frame Then
                    If ctrl.Container = frame Then
                        'If ctrl.DataField <> "" Then
                            If ctrl.name <> "chk" & frame.name And GetTagValue(ctrl.Tag, "search") <> "true" Then
                                ctrl.visible = CBool(GetTagValue(ctrl.Tag, "searchVisible"))
                            Else
                                ctrl.Enabled = CBool(GetTagValue(ctrl.Tag, "searchEnable"))
                            End If
                        'End If
                        
                        '<AHMAD>
                            'If (TypeOf ctrl Is ComCtl2.DTPicker Or TypeOf ctrl Is MSComCtl2.DTPicker) Then
                            If (TypeOf ctrl Is MSComCtl2.DTPicker) Then
                                ctrl.Value = GetTagValue(ctrl.Tag, "searchNull")
                                ctrl.CheckBox = GetTagValue(ctrl.Tag, "searchCheckBox")
                            End If
                        '</AHMAD>
                                
                    End If
                ElseIf TypeOf ctrl Is frame Then
                    If ctrl <> frame Then ctrl.visible = True
                End If
            End If
        Next
        MoveNext
        MovePrev
        state = state - ST_CANCELSEARCH
        
         '<AHMAD>
        Set_RecordCountFromAll rs
        '</AHMAD>
        
        '<AHMAD>
            RaiseEvent doCancelSearchComplete(rs)
        '</AHMAD>
    
End Sub

Public Sub PrintReport()
    RefreshCommands FormSettings And btMaskPrint, ButtonsForm
    RaiseEvent doPrint(rs)
End Sub

'TODO: DO the moving here
Public Sub MoveFirst()
    
'    RefreshCommands FormSettings And btMaskFirst, ButtonsForm :)
    If TraceChanges Then
        If traceChangesOnMove(rs) Then Exit Sub
    End If
    Dim cancel As Boolean
    RaiseEvent doMoveFirst(rs, cancel)
    RaiseEvent doMove(rs, cancel, dirFirst)
    If cancel Then Exit Sub
    Call PopulateNavigator(ButtonsForm, nav, rs, "first")
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
End Sub

Public Sub MoveLast()
    
'    RefreshCommands FormSettings And btMaskLast, ButtonsForm :)
    If TraceChanges Then
        If traceChangesOnMove(rs) Then Exit Sub
    End If
    Dim cancel As Boolean
    RaiseEvent doMoveLast(rs, cancel)
    RaiseEvent doMove(rs, cancel, dirLast)
    If cancel Then Exit Sub
    Call PopulateNavigator(ButtonsForm, nav, rs, "last")
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
End Sub

Public Sub MoveNext()
'    RefreshCommands FormSettings And btMaskNext, ButtonsForm :)
    If TraceChanges Then
        If traceChangesOnMove(rs) Then Exit Sub
    End If
    Dim cancel As Boolean
    RaiseEvent doMoveNext(rs, cancel)
    RaiseEvent doMove(rs, cancel, dirNext)
    If cancel Then Exit Sub
    Call PopulateNavigator(ButtonsForm, nav, rs, "next")
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
End Sub

Public Sub MovePrev()
    
    If TraceChanges Then
        If traceChangesOnMove(rs) Then Exit Sub
    End If
    Dim cancel As Boolean
    RaiseEvent doMovePrev(rs, cancel)
    RaiseEvent doMove(rs, cancel, dirPrev)
    If cancel Then Exit Sub
    Call PopulateNavigator(ButtonsForm, nav, rs, "prev")
    '<AHMAD>
    Set_RecordCountFromAll rs
    '</AHMAD>
End Sub

Private Sub Class_Terminate()
    MDIMain.StB.Panels(8).text = ""
End Sub

Private Sub rs_MoveComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
    Dim cancel As Boolean
    If state And (ST_FILLGRID + ST_ADDNEW) Then Exit Sub
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        If (state And ST_CANCELSEARCH) <> 0 Then Exit Sub
        Dim fg As Control
        Set fg = getGridInFrame()
        If fg Is Nothing Then Exit Sub
        ' perform lookup
        performLookup fg
        If rs.RecordCount = 0 Then
            If (state And ST_SEARCH <> 0) Or (state And ST_CANCELSEARCH <> 0) Then
                 fg.Rows = 2
            Else
                fg.Rows = 1
            End If
            Exit Sub
        End If
        If rs.EOF Or rs.BOF Then Exit Sub
        state = ST_FILLGRID + state
        rs.MoveFirst
        'fg.Clear
        Dim Row As Long
        If state And ST_SEARCH Then
            Row = 2
            fg.Rows = rs.RecordCount + 2
        Else
            fg.Rows = rs.RecordCount + 1
            Row = 1
        End If
        RaiseEvent doBeforeMoveComplete(rs, cancel) 'populate data
        If cancel Then Exit Sub
        Do While Not rs.EOF
            fg.Row = Row
            FillGridData fg, rs
            RaiseEvent doMoveComplete(rs) 'populate data
            Row = Row + 1
            rs.MoveNext
        Loop
        state = state - ST_FILLGRID
        RaiseEvent doEOFReached(rs)
        Exit Sub
    End If
    If rs.BOF Or rs.EOF Then Exit Sub
    RaiseEvent doBeforeMoveComplete(rs, cancel) 'populate data
    If cancel Then Exit Sub
    FillData rs
    RaiseEvent doMoveComplete(rs) 'populate data
End Sub

Public Sub RefreshNav()
    Call PopulateNavigator(ButtonsForm, nav, rs, "refresh")
    '<AHMAD>
        Set_RecordCountFromAll rs
    '</AHMAD>
End Sub

Private Function getGridInFrame() As Control
    Dim ctrl As Control
    For Each ctrl In Form.Controls
        If (TypeOf ctrl Is Menu) = False Then
            If Not TypeOf ctrl Is CommonDialog Then
                If TypeOf ctrl.Container Is frame Then
                    If ctrl.Container = frame Then
                        If GetTagValue(ctrl.Tag, "typeof") = "vsflexgrid" Then
                            Set getGridInFrame = ctrl
                            Exit Function
                        End If
                    End If
                 End If
            End If
        End If
    Next
    Set getGridInFrame = Nothing
End Function

Private Sub FillGridData(fg As Control, ByRef rs As ADODB.Recordset)
    Dim datafields As String
    datafields = GetTagValue(fg.Tag, "datafield")
    Dim lookupFields As String
    lookupFields = GetTagValue(fg.Tag, "lookup")
    Dim parentFields As String
    parentFields = GetTagValue(fg.Tag, "parentFields")
    Dim parentTables As String
    parentTables = GetTagValue(fg.Tag, "parentTables")
    Dim ellipses As String
    ellipses = GetTagValue(fg.Tag, "ellipse")
    Dim lookupField As String
    Dim parentField As String
    Dim parentTable As String
    Dim isEllipse As Boolean
    Dim i As Long
    Dim F As String
    For i = 0 To fg.Cols - 1 'walk through all the columns to fill their data
        fg.Col = i
        ' check if this column is bounded to a data field
        F = GetTagValue(datafields, CStr(i), ":", ",")
        If F <> "" Then
            fg.text = rs.Fields(F).Value & ""
            ' check if this field is a lookup field
            lookupField = GetTagValue(lookupFields, CStr(i), ":", ",")
            parentField = GetTagValue(parentFields, CStr(i), ":", ",")
            parentTable = GetTagValue(parentTables, CStr(i), ":", ",")
            isEllipse = (GetTagValue(ellipses, CStr(i), ":", ",") <> "")
            If isEllipse And (lookupField <> "") And (parentField <> "") And (parentTable <> "") Then
                'fg.ColComboList(i) = "..."
                fg.Cell(flexcpData) = fg.text
                fg.text = GetLookupValue(fg.text, parentField, lookupField, parentTable)
            End If
        Else
            fg.text = ""
        End If
    Next
End Sub

Private Sub FillData(ByRef rs As ADODB.Recordset)
    Dim ctrl As Control
    For Each ctrl In Form.Controls
        If (TypeOf ctrl Is Menu) = False Then
            If TypeOf ctrl.Container Is frame Then
                If ctrl.Container = frame Then
                    SetValueToControl ctrl, rs
                End If
            End If
        End If
    Next
End Sub

Private Sub SetValueToControl(ByRef ctrl As Control, ByRef rs As ADODB.Recordset)

On Error GoTo EndIfSTMT
                If ctrl.datafield <> "" Then
                        SetControlValue ctrl, rs.Fields(ctrl.datafield).Value
                End If
EndIfSTMT:

    Err.Clear
End Sub

Private Sub SetControlValue(ByRef ctrl As Control, Value As Variant)
    If TypeOf ctrl Is Label Then
        ctrl.Caption = GetStringValue(Value)
    ElseIf TypeOf ctrl Is TextBox Then
        ctrl.text = GetStringValue(Value)
    ElseIf TypeOf ctrl Is CheckBox Then
        ctrl.Value = GetIntValue(Value)
    ElseIf TypeOf ctrl Is ComboBox Then
        If IsNull(Value) Or CStr(Value) = "" Then
            ctrl.ListIndex = -1
        Else
            ctrl.ListIndex = GetListIndex(ctrl, GetIntValue(Value))
        End If
    'ElseIf (TypeOf ctrl Is ComCtl2.DTPicker Or TypeOf ctrl Is MSComCtl2.DTPicker) Then
    ElseIf (TypeOf ctrl Is MSComCtl2.DTPicker) Then
        If Value = "" Then
            If ctrl.CheckBox Then
                 ctrl.Value = Value
            End If
        Else
            ctrl.Value = Value
        End If
    End If
End Sub

Private Function GetControlValue(ByRef ctrl As Control) As String
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        GetControlValue = ctrl.text
        Exit Function
    End If
    
    If TypeOf ctrl Is TextBox Then
        GetControlValue = ctrl.text
    ElseIf TypeOf ctrl Is CheckBox Then
        GetControlValue = ctrl.Value
    ElseIf TypeOf ctrl Is ComboBox Then

        If ctrl.ListIndex = -1 Then
            GetControlValue = ""
        Else
            GetControlValue = ctrl.ItemData(ctrl.ListIndex)
        End If
        
    ElseIf TypeOf ctrl Is MSComCtl2.DTPicker Then
        If IsNull(ctrl.Value) Then
            GetControlValue = ""
        Else
            GetControlValue = ctrl.Value
        End If
    ElseIf TypeOf ctrl Is Label Then
        GetControlValue = ctrl.Caption
    Else
        GetControlValue = ""
    End If
End Function

Private Function FormatValue(S As String, Typ As DataTypeEnum) As String
    If S = "" Then
        FormatValue = ""
        Exit Function
    End If
    Select Case Typ
        'Case adLongVarChar, adLongVarWChar,adDate, adVarChar, adChar, adDBDate, adDBTime, adDBTimeStamp, adWChar, adVarWChar:
        Case adLongVarChar, adLongVarWChar, adVarChar, adChar, adDBTime, adWChar, adVarWChar:
            FormatValue = " like '%" & S & "%'"
            '<AHMAD>
        Case adDBTimeStamp Or 135 'DTPicker
            FormatValue = " = '" & Trim(S) & "'"
            '</AHMAD>
        Case Else
            FormatValue = "=" & S
    End Select
End Function

Private Function getQueryFromGrid(ctrl As Control, rs As ADODB.Recordset, Col As Long) As String
    Dim datafield As String
    Dim Field As String
    Dim val As String
    datafield = GetTagValue(ctrl.Tag, "datafield")
    Field = GetTagValue(datafield, CStr(Col), ":", ",")
    If Field = "" Then
        getQueryFromGrid = ""
        Exit Function
    End If
    'Dim fg As VSFlexGrid
    val = FormatValue(ctrl.Cell(flexcpText, 1, Col), rs.Fields(Field).Type)
    If val <> "" And val <> "''" Then
        getQueryFromGrid = Field & val
        Exit Function
    End If
    getQueryFromGrid = ""
End Function

Public Sub MoveRSToSelectedRow(ctrl As Control, rs As ADODB.Recordset, Optional MoveWhileSearching As Boolean)
        If Not (rs.EOF Or rs.BOF) Then
            If rs.EditMode = adEditAdd Then Exit Sub
        End If
        state = state + ST_FILLGRID
        rs.MoveFirst
        If MoveWhileSearching Then
            rs.Move ctrl.Row - 2
        Else
            rs.Move ctrl.Row - 1
        End If
        state = state - ST_FILLGRID
        '<AHMAD>
            Set_RecordCountFromAll rs
        '</AHMAD>
End Sub

Public Function CheckIfIsModified(ByRef rs As ADODB.Recordset) As Boolean
    On Error Resume Next
    Dim ctrl As Control
    For Each ctrl In Form.Controls
        If TypeOf ctrl.Container Is frame Then
            If (TypeOf ctrl Is Menu) = False Then
                If ctrl.Container = frame Then
                    If Trim(ctrl.datafield) <> "" Then
                        If IsNull(rs.Fields(ctrl.datafield)) Then
                            If Trim(GetControlValue(ctrl)) <> "" Then
                                CheckIfIsModified = True
                                Exit Function
                            End If
                        Else
                            If Trim(CStr(rs.Fields(ctrl.datafield))) <> Trim(GetControlValue(ctrl)) Then
                                CheckIfIsModified = True
                                Exit Function
                            End If
                        End If
                    End If
                End If
            End If
        End If
    Next
    CheckIfIsModified = False
End Function

Public Function traceChangesOnMove(ByRef rs As ADODB.Recordset) As Boolean
    Dim cancel As Boolean
    cancel = False
    If state And ST_CANCELSEARCH Then
        cancel = False
    ElseIf CheckIfIsModified(rs) Then
        Dim msg As String
        If rs.RecordCount <> 0 Then
            msg = "·ﬁœ ﬁ„  » ⁄œÌ· »⁄÷ «·ﬁÌ„° Â·  —Ìœ Õﬁ« «·«‰ ﬁ«· „‰ «·”Ã· «·Õ«·Ì œÊ‰ Õ›Ÿ «· ⁄œÌ·« ø"
            cancel = MsgBox(msg, vbCritical Or vbOKCancel) <> vbOK
        End If
    End If
    traceChangesOnMove = cancel
End Function

Public Function BuildSqlForGridRow(ByRef fg As VSFlexGrid, sql As String) As String
    Dim strRes As String
    strRes = sql
    Dim p As Integer, N As Integer, X As Integer
    Dim fId As Integer
    N = Len(strRes)
    p = InStr(1, strRes, "@")
    If p > 0 Then
        fId = 0
        p = p + 1
        X = Asc(Mid(strRes, p, 1))
        While (X <= Asc("9")) And (X >= Asc("0"))
            fId = 10 * fId + X - Asc("0")
            p = p + 1
            If p < N Then
                X = Asc(Mid(strRes, p, 1))
            Else
                X = Asc("0") - 1
            End If
        Wend
        strRes = Replace(strRes, "@" & fId, fg.TextMatrix(fg.Row, fId))
        strRes = BuildSqlForGridRow(fg, strRes)
    End If
    BuildSqlForGridRow = strRes
End Function

Private Function FormSettings() As Long
'    If InStr(1, frame.Name, "master") > 0 Then
'        FormSettings = Form.FormSettings
'    ElseIf InStr(1, frame.Name, "detail") > 0 Then
'        FormSettings = Form.FormDetailSettings
'    End If
    Dim strControllerName As String
    strControllerName = Replace(frame.name, "Frame", "")
    strControllerName = Replace(strControllerName, "master", "")
    FormSettings = CallByName(Form, "Form" & strControllerName & "Settings", VbGet)
End Function

Public Sub FillControlsFromRs(ByRef rs As ADODB.Recordset)
    If rs.RecordCount = 0 Or rs.EOF Or rs.BOF Or rs.AbsolutePosition < 0 Then
        Exit Sub
    End If
    
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Dim fg As Control
        Set fg = getGridInFrame()
        If fg Is Nothing Then Exit Sub
        Dim Row As Long
        fg.Row = fg.Rows - 1
        FillGridData fg, rs
    Else
        FillData rs
    End If
End Sub

Public Function getFormData() As String
    Dim doc As New MSXML2.DOMDocument
    Dim N As MSXML2.IXMLDOMNode
    Dim att As MSXML2.IXMLDOMAttribute
    
    On Error Resume Next
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Dim fg As VSFlexGrid
        Set fg = getGridInFrame()
        If fg Is Nothing Then Exit Function
        doc.loadXML "<grid row=""" & fg.Row & """ />"
        Dim c As Integer
        For c = 0 To fg.Cols - 1
            Set N = doc.createNode(MSXML2.NODE_ELEMENT, "column", "")
            Set att = doc.createAttribute("id")
            att.Value = c
            N.Attributes.setNamedItem att
            N.text = fg.TextMatrix(fg.Row, c)
            doc.documentElement.appendChild N
        Next
    Else
        doc.loadXML "<frame name=""" & Me.frame.name & """ />"
        Dim ctrl As Control
        Dim idx As Integer
        For Each ctrl In Form.Controls
            Set N = doc.createNode(MSXML2.NODE_ELEMENT, ctrl.name, "")
            idx = ctrl.Index
            If Err.Number = 0 Then
                Set att = doc.createAttribute("index")
                att.Value = ctrl.Index
                N.Attributes.setNamedItem att
            End If
            Err.Clear
            N.text = GetControlValue(ctrl)
            doc.documentElement.appendChild N
        Next
    End If
    
    getFormData = doc.documentElement.Xml
    Set doc = Nothing
End Function

Public Sub setFormData(ByVal Xml As String)
    Dim doc As New MSXML2.DOMDocument
    Dim N As MSXML2.IXMLDOMNode
    
    On Error Resume Next
    doc.loadXML (Xml)
    If GetTagValue(frame.Tag, "repeat") = "true" Then
        Dim fg As VSFlexGrid
        Set fg = getGridInFrame()
        If fg Is Nothing Then Exit Sub
        Dim c As Integer
        For c = 0 To fg.Cols - 1
            Set N = doc.selectSingleNode("/grid/column[@id=""" & c & """]")
            If Not N Is Nothing Then
                fg.TextMatrix(fg.Row, c) = N.text
            End If
        Next
    Else
        Dim ctrl As Control
        Dim idx As Integer
        For Each ctrl In Form.Controls
            Dim strPath
            strPath = "/frame/" & ctrl.name
            idx = ctrl.Index
            If Err.Number = 0 Then
                strPath = strPath & "[@index=""" & ctrl.Index & """]"
            End If
            Err.Clear
            Set N = doc.selectSingleNode(strPath)
            If Not N Is Nothing Then
                SetControlValue ctrl, N.text
            End If
        Next
    End If
    
    Set doc = Nothing
End Sub

Private Sub performLookup(ByRef fg As VSFlexGrid)
    Dim lookupFields As String
    lookupFields = GetTagValue(fg.Tag, "lookup")
    Dim parentFields As String
    parentFields = GetTagValue(fg.Tag, "parentFields")
    Dim parentTables As String
    parentTables = GetTagValue(fg.Tag, "parentTables")
    Dim ellipses As String
    ellipses = GetTagValue(fg.Tag, "ellipse")
    Dim lookupField As String
    Dim parentField As String
    Dim parentTable As String
    Dim isEllipse As Boolean
    Dim i As Integer
    For i = 0 To fg.Cols - 1 'walk through all the columns to fill lookup fields
        'check if this field is a lookup field
        lookupField = GetTagValue(lookupFields, CStr(i), ":", ",")
        parentField = GetTagValue(parentFields, CStr(i), ":", ",")
        parentTable = GetTagValue(parentTables, CStr(i), ":", ",")
        isEllipse = (GetTagValue(ellipses, CStr(i), ":", ",") <> "")
        If (lookupField <> "") And (parentField <> "") And (parentTable <> "") Then
            If Not isEllipse Then
                fg.ColComboList(i) = BuildComboListLookupString(fg, parentField, lookupField, parentTable)
            Else
                fg.ColComboList(i) = "..."
            End If
        End If
    Next
End Sub
Private Function GetRSFieldIndex(DataFieldName As String) As Integer
    'DataFieldName : is a data column name in the recordset
    'This function will return the column index in the Rs.Fields Array
    Dim i As Integer
    
    For i = 0 To rs.Fields.count - 1
        If UCase(rs.Fields(i).name) = UCase(DataFieldName) Then
           GetRSFieldIndex = i
           Exit Function
        End If
    Next i
    
    GetRSFieldIndex = -1
    
End Function
