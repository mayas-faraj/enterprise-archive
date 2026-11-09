VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VSFlexGridDSUnbound"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IVSFlexDataSource
    Dim count As Long
    Dim InsertStmt, UpdateStmt, DeleteStmt, GetStmt As String
    Public Conn As New ADODB.Connection
    Public rs As New ADODB.Recordset
    Dim changedRow() As String
'    Dim m_lRecord As Long
'    Dim GridState As String
    Dim VisibleWindow As Integer
    'Dim CurrentRow As Long
    Public ErrorFound As Boolean
    Dim data() As String
    Dim Inserted As New Collection
    Dim Updated As New Collection
    Dim Deleted As New Collection
    Dim TransactionStarted As Boolean
    Public RegisteredSums As String
Public Event Error(ByVal Number As Long, changedRow As Variant, GridState As String)
Public Event SumsChanged(ByVal Record As Long, ByVal Field As Integer, ByVal oldValue As Double, ByVal newValue As Double)
Public Event ValidateRow(ByVal Record As Long, data As Variant, Cancel As Boolean)
Public Event AfterDelete(ByRef Conn As ADODB.Connection, data As Variant, ByRef Cancel As Boolean)
Public Event AfterUpdate(ByRef Conn As ADODB.Connection, data As Variant, ByRef Cancel As Boolean)
Public Event AfterInsert(ByRef Conn As ADODB.Connection, data As Variant, ByRef Cancel As Boolean)

Public Sub ClearError()
    ErrorFound = False
End Sub
Public Sub Class_Initialize()
    'count = 2
    OpenConnection Conn
    rs.CursorLocation = adUseClient
'    rs.Open GetStmt, conn, adOpenDynamic
'    ReDim changedRow(rs.Fields.count)
'    m_lRecord = -1
    VisibleWindow = -1
    ErrorFound = False
End Sub
Public Property Let InsertStatement(stmt As String)
    'has the form: INSERT INTO table_name VALUES({0},'{1}',{2},'name',3)
    ' The {i} will be replaced by the value in grid filed i in the current row. More precisly: in the temporary row created when AddNewInsert is called
    ' The i without {} will be inserted directly into the new row
    ' TODO: use the syntax: {field_name} instead of {field_num} to remove grid position dependancy
    InsertStmt = stmt
End Property
Public Property Let UpdateStatement(stmt As String)
    'has the form: UPDATE table_name SET [field_name='?{0}'? ,?]* WHERE field='?{i}'?|i|'str_value'
    ' The {i} will be replaced by the value in grid filed i in the current row. More precisly: in the temporary row created when AddNewInsert is called
    ' The i without {} will be inserted directly into the new row
    ' TODO: use the syntax: {field_name} instead of {field_num} to remove grid position dependancy
    '        Optimise the update statement to update just the modified fields only
    UpdateStmt = stmt
End Property
Public Property Let DeleteStatement(stmt As String)
    'has the form: DELETE FROM table_name WHERE [field_name='?{i}'? and? ]*
    ' The {i} will be replaced by the value in grid filed i in the current row. More precisly: in the temporary row created when AddNewInsert is called
    ' The i without {} will be inserted directly into the new row
    ' TODO: use the syntax: {field_name} instead of {field_num} to remove grid position dependancy
    DeleteStmt = stmt
End Property
Public Sub SetSelectStatement(stmt As String, vsbleWidow As Integer)
    'stmt: has the form: A normal select stamement. Use Arabic column names to be refreshed directly into the grid
    'hiddenFields: '0,3,2': don't show columns of these numbers in the grid
    If rs.State <> 0 Then
        rs.Close
    End If
    GetStmt = stmt
    rs.Open GetStmt, Conn, adOpenStatic, adLockOptimistic
    ReDim changedRow(rs.Fields.count)
    'm_lRecord = -1
    count = rs.RecordCount
    VisibleWindow = vsbleWidow
    ReDim data(rs.Fields.count, rs.RecordCount) As String
    FillData rs
    StartNewTransaction
    'rs.Close
End Sub

Private Sub FillData(ByRef rs As ADODB.Recordset)
    If rs.EOF Then
        Exit Sub
    End If
    'rs.MoveLast
    rs.MoveFirst
    'MaxRow = rs.RecordCount
    
    Dim i, j As Long

    For i = 0 To rs.RecordCount - 1
        For j = 0 To rs.Fields.count - 1
            If Not IsNull(rs.Fields(j).Value) Then
                data(j, i) = CStr(rs.Fields(j).Value & "")
                If InStr(RegisteredSums, "," & CStr(j) & ",") > 0 Then
                    RaiseEvent SumsChanged(i, j, 0, rs.Fields(j).Value)
                End If
            End If
        Next j
        rs.MoveNext
    Next i
    Dim S As String
    
'    For i = 0 To rs.RecordCount - 1
'        s = ""
'        For j = 0 To rs.Fields.count - 1
'            'If Not IsNull(rs.Fields(j).Value) Then
'             Debug.Print j & "|" & data(j, i) & "|"
'            'End If
'        Next j
'    Next i
End Sub

Public Sub AddNewRow()
'    If GridState = "Update" Then
        'We are updating the last row, and now we move by a tab/Down arrow to add a new row. commit update first, then add the row
'        DoUpdate
'        If ErrorFound Then
'            Exit Sub
'        End If
'    End If
'    If GridState = "New" Then
'        DoInsert
'        If ErrorFound Then
'            Exit Sub
'        End If
'    End If
'    GridState = "New"
'    count = count + 1
'    ReDim changedRow(rs.RecordCount)
'    Debug.Print "new row started"
'    Exit Sub
    
    Inserted.Add count, CStr(count)
    count = count + 1
    ReDim Preserve data(rs.Fields.count, count) As String
  End Sub
  Private Function IVSFlexDataSource_GetFieldCount() As Long
        If VisibleWindow < 0 Then
            IVSFlexDataSource_GetFieldCount = rs.Fields.count
            VisibleWindow = rs.Fields.count
        Else
            IVSFlexDataSource_GetFieldCount = VisibleWindow
        End If
    End Function
    
    Private Function IVSFlexDataSource_GetRecordCount() As Long
        IVSFlexDataSource_GetRecordCount = count ' rs.RecordCount
    End Function
    
    Private Function IVSFlexDataSource_GetFieldName(ByVal Field As Long) As String
        IVSFlexDataSource_GetFieldName = rs.Fields(Field).name
        'MsgBox rs.Fields(Field).Name
    End Function


    Private Function IVSFlexDataSource_GetData(ByVal Field As Long, ByVal Record As Long) As String
        'Debug.Print "GetData" & GridState & "|" & Record & "|" & rs.RecordCount & "|" & Field
        'If GridState = "New" And Record = rs.RecordCount Then 'We are in insert mode, and now reading the new data
        '    IVSFlexDataSource_GetData = changedRow(Field)
        '    Exit Function
        'End If
        'If Record >= rs.RecordCount Then
        '    Exit Function
        'End If
        'If m_lRecord <> Record Then
            'm_lRecord = Record
            'rs.AbsolutePosition = Record + 1
        'End If
        'If Record = CurrentRow Then
        '    IVSFlexDataSource_GetData = changedRow(Field)
        'End If
        If count > 0 Then
            IVSFlexDataSource_GetData = data(Field, Record)
        End If
    End Function

    Private Sub IVSFlexDataSource_SetData(ByVal Field As Long, ByVal Record As Long, ByVal newData As String)
        'Debug.Print "Set Data check for update field: " & Field & "|" & Record & "|" & newData
        Update Record
        If InStr(RegisteredSums, "," & CStr(Field) & ",") > 0 Then
            RaiseEvent SumsChanged(Record, Field, val(data(Field, Record)), val(newData))
        End If
        data(Field, Record) = newData
        'Debug.Print "Set data in row " & Record
    End Sub

Private Function CopyRecordToTemporary(row)
    Dim i As Integer
    'If m_lRecord <> row Then
    '    m_lRecord = row
    '    rs.AbsolutePosition = row + 1
    'End If
    For i = 0 To UBound(changedRow) - 1
        'If Not IsNull(rs.Fields(i).Value) Then
            changedRow(i) = data(i, row)
        'End If
    Next i
    If IsEmptyRow(changedRow) Then
        CopyRecordToTemporary = True
        Exit Function
    End If
    Dim Cancel As Boolean
    RaiseEvent ValidateRow(row + 1, changedRow, Cancel)
    CopyRecordToTemporary = Not Cancel
End Function
Public Sub Delete(row As Long)
    On Error GoTo CheckUpdated
        Inserted.Remove (CStr(row)) ' if found in the Inserted, remove it and exit
        Exit Sub
CheckUpdated:
Err.Clear
    TryInsertToDeleted row
End Sub
Private Sub TryInsertToDeleted(row As Long)
    On Error Resume Next
    Updated.Remove (CStr(row)) ' if found in the Inserted, remove from updated, and add to deleted
    Deleted.Add row, CStr(row) 'Add to deleted if in updated or not
    'Debug.Print "Delete finished " & row
End Sub

Public Function DoDelete() As Boolean
    'MsgBox SubstitueValues(DeleteStmt)
    ExecuteCommand (SubstitueValues(DeleteStmt))
    Dim Cancel As Boolean
    RaiseEvent AfterDelete(Conn, changedRow, Cancel)
    ErrorFound = Cancel
    DoDelete = Not Cancel
End Function

Private Sub Update(row As Long)
    On Error GoTo AddToUpdated
        Inserted.Item (CStr(row))
        Exit Sub
AddToUpdated:
    TryUpdate row
    'Debug.Print "Update finished " & row
End Sub

Private Function DoUpdate() As Boolean
    'MsgBox SubstitueValues(UpdateStmt)
    If IsEmptyRow(changedRow) Then
        DoUpdate = False
        Exit Function
    End If
    ExecuteCommand (SubstitueValues(UpdateStmt))
    
    Dim Cancel As Boolean
    RaiseEvent AfterUpdate(Conn, changedRow, Cancel)
    ErrorFound = Cancel
    
    DoUpdate = Not Cancel
    'If ErrorFound Then
    '    Exit Sub
    'End If
    'GridState = ""
    'rs.Requery
    'count = rs.RecordCount
    'Exit Sub
End Function

Private Sub TryUpdate(row As Long)
    On Error Resume Next
    Updated.Add row, CStr(row) ' if found in the Inserted, remove from updated, and add to deleted
End Sub

Private Function IsEmptyRow(changedRow) As Boolean
    Dim i As Integer
    For i = 0 To UBound(changedRow) - 1
        If Not (IsNull(changedRow(i)) Or changedRow(i) = "") Then
            IsEmptyRow = False
            Exit Function
        End If
    Next i
    IsEmptyRow = True
End Function
Private Function DoInsert() As Boolean
    'MsgBox SubstitueValues(InsertStmt)
    If IsEmptyRow(changedRow) Then
        DoInsert = False
        Exit Function
    End If
    ExecuteCommand (SubstitueValues(InsertStmt))
    
    Dim Cancel As Boolean
    RaiseEvent AfterInsert(Conn, changedRow, Cancel)
    ErrorFound = Cancel
    
    DoInsert = Not Cancel
    'rs.Requery
    'count = rs.RecordCount
    'Exit Sub
    
    'Inserted.Add currRow, CStr(row)
    'Debug.Print "Insert finished " & row
End Function

Private Function SubstitueValues(ByVal stmt As String)
    Dim i As Integer
    Dim res As String
    res = stmt
    For i = 0 To UBound(changedRow) - 1
        If IsNull(changedRow(i)) Or changedRow(i) = "" Then
            res = Replace(res, "{" & CStr(i) & "}", "NULL")
            res = Replace(res, "'NULL'", "NULL")
        Else
            res = Replace(res, "{" & CStr(i) & "}", changedRow(i))
        End If
    Next i
    SubstitueValues = res
    'Debug.Print res
End Function
Private Sub ExecuteCommand(ByVal query As String)
    On Error GoTo ErrHandler
    Dim command As ADODB.command
    Set command = New ADODB.command
    command.ActiveConnection = Conn
    command.CommandText = query
    command.Execute
    Exit Sub
ErrHandler:
    ErrorFound = True
    RaiseEvent Error(Err.Number, changedRow, "")
    'cnn1.Close
End Sub

Private Function ExecuteSelect(ByVal query As String) As ADODB.Recordset
    On Error GoTo ErrHandler
    Dim rs As ADODB.Recordset
    Set rs = New ADODB.Recordset
    rs.CursorType = adOpenStatic
    rs.LockType = adLockReadOnly
    rs.Open query, Conn, , , adCmdText
    Set ExecuteSelect = rs
ErrHandler:
    ErrorFound = True
    RaiseEvent Error(Err.Number, changedRow, "")
End Function



Public Function Save() As Long
    Dim i, j, nbChangedRows As Long
    
    nbChangedRows = 0
    If TransactionStarted Then
        Exit Function
    End If

    TransactionStarted = True
    'conn.BeginTrans
    'Debug.Print "Inserted:"
    For i = 1 To Inserted.count
        'Debug.Print "Insert" & Inserted.Item(i)
        If Not CopyRecordToTemporary(Inserted.Item(i)) Then
            'conn.RollbackTrans
            TransactionStarted = False
            ErrorFound = True
            Exit Function
        End If
        If DoInsert Then
            nbChangedRows = nbChangedRows + 1
        End If
        If ErrorFound Then
            'ErrorFound = False
    '        conn.RollbackTrans
            TransactionStarted = False
            Exit Function
        End If
        'Debug.Print Inserted.Item(i)
    Next i
    'Debug.Print "Updated:"
    For i = 1 To Updated.count
        If Not CopyRecordToTemporary(Updated.Item(i)) Then
    '        conn.RollbackTrans
            TransactionStarted = False
            ErrorFound = True
            Exit Function
        End If
        
        If DoUpdate Then
            nbChangedRows = nbChangedRows + 1
        End If
        If ErrorFound Then
            'ErrorFound = False
    '        conn.RollbackTrans
            TransactionStarted = False
'            ErrorFound = True
            Exit Function
        End If
        'Debug.Print Updated.Item(i)
        nbChangedRows = nbChangedRows + 1
    Next i
    'Debug.Print "Deleted:"
    For i = 1 To Deleted.count
        If Not CopyRecordToTemporary(Deleted.Item(i)) Then
    '        conn.RollbackTrans
            TransactionStarted = False
            ErrorFound = True
            Exit Function
        End If
        
        If DoDelete Then
            nbChangedRows = nbChangedRows + 1
        End If
        If ErrorFound Then
            'ErrorFound = False
    '        conn.RollbackTrans
            TransactionStarted = False
            Exit Function
        End If
        nbChangedRows = nbChangedRows + 1
        'Debug.Print Deleted.Item(i)
    Next i
    'conn.CommitTrans
    TransactionStarted = False
    rs.Requery
    Save = nbChangedRows
End Function

Public Sub StartNewTransaction()
    Set Inserted = New Collection
    Set Deleted = New Collection
    Set Updated = New Collection
End Sub
