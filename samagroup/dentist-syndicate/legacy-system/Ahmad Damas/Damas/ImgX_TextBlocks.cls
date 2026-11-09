VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_TextBlocks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private pTextBlocks As Collection

Public Function Add(ByVal Key As String, ByVal Text As String) As ImgX_TextBlock
    Dim TextBlock As ImgX_TextBlock
    Set TextBlock = New ImgX_TextBlock
    
    'Handle this error but the rest will be handled by ImgX_TextBlock
    If Len(Key) > 79 Then Err.Raise 5, "ImgX_TextBlock.Add", "Key must be between 1 and 79 characters in length."
    
    Set TextBlock.Parent = Me
     
    TextBlock.Key = Key    'If there are any invalid characters then the raised
    TextBlock.Text = Text  'error is ignored and will fall up to the caller
    
   
    
    'Delegate the storage to the collection object
    pTextBlocks.Add TextBlock
    
    Set Add = TextBlock
End Function

Public Property Get Count() As Long
    'Delegate to the Collection Object
    Count = pTextBlocks.Count
End Property

Public Property Get Item(ByVal IndexKey As Variant) As ImgX_TextBlock
    'If a key (string) is passed in, then loop through all the TextBlock objects and
    'try to find an object with that key.  If it is not found then raise an error.
    'We could have stored the object in the collection object with the key as the
    'collection's key but then it would have been more difficult to allow the user
    'to change the key with TextBlock.key property.
    '
    Dim TextBlock As ImgX_TextBlock
    On Error Resume Next
    
    If VarType(IndexKey) = vbString Then
        For Each TextBlock In pTextBlocks
            If LCase(TextBlock.Key) = LCase(IndexKey) Then Set Item = TextBlock: Exit For
        Next
    Else
        Set Item = pTextBlocks(IndexKey)
    End If
    
End Property

Public Sub Remove(ByVal IndexKey As Variant)
    On Error Resume Next    'Don't care if it doesn't already exist
    
    Dim TextBlock   As ImgX_TextBlock
    Dim I           As Long
    
    If VarType(IndexKey) = vbString Then
        For Each TextBlock In pTextBlocks
            If LCase(TextBlock.Key) = LCase(IndexKey) Then pTextBlocks.Remove I: Exit For
            I = I + 1
        Next
    Else
        pTextBlocks.Remove IndexKey
    End If
End Sub

Public Function Clear()
    'This function releases the reference to the old collection, creates and
    'starts referncing a new Collection object all in one statment.  This breaks
    'the circular reference and must be called before trying to release an
    'ImgX_TextBlocks object.  Otherwise, you will have a memory leak.
    '
    Set pTextBlocks = New Collection
End Function
Private Sub Class_Initialize()
    Set pTextBlocks = New Collection
End Sub

Private Sub Class_Terminate()
    Set pTextBlocks = Nothing
End Sub

Public Property Get NewEnum() As IUnknown
    Set NewEnum = pTextBlocks.[_NewEnum]
End Property



