VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_TextBlock"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private pKey    As String
Private pText   As String
Private pParent As ImgX_TextBlocks

Friend Property Set Parent(NewParent As ImgX_TextBlocks)
'So we can iterate through the parent collection and search for duplicate keys.
'
'This generates a circular reference!  Be sure to call The Clear method
'of ImgX_TextBlocks when you want to release a whole collection or they
'will stay pointing to each other even though you let go of your reference
'to the ImgX_TextBlocks collection.  Since they still have a reference to
'each other, they will NEVER go away.  The Clear method will explicitly
'break the circular reference.

    Set pParent = NewParent
End Property

Public Property Let Key(ByVal NewKey As String)
    
    Dim I           As Long
    Dim TooLong     As Boolean
    Dim KeyLen      As String
    Dim CurChar     As Byte
    Dim TextBlock   As ImgX_TextBlock
    
    If LCase(pKey) = LCase(NewKey) Then Exit Property
    
    KeyLen = Len(NewKey)
    
    If KeyLen < 0 Then Err.Raise 5, "ImgX_TextBlock.Key", "Key must be between 1 and 79 characters in length."
    
    If KeyLen > 79 Then
        KeyLen = 79
        NewKey = Left$(NewKey, 79)
        TooLong = True
    End If
    
    For I = 1 To KeyLen
        CurChar = Asc(Mid(NewKey, I, 1))
        If (CurChar < 32 And (CurChar <> 13 And CurChar <> 10)) _
           Or CurChar > 126 Then Err.Raise 5, "ImgX_TextBlock.Key", "Invalid Characters.  Only plain printable ASCII characters are valid."
    Next I
    
    If NewKey <> "" Then
        For Each TextBlock In pParent
            If LCase(TextBlock.Key) = LCase(NewKey) Then Err.Raise 5, "ImgX_TextBlock.Key", "There is already a textblock with a key of " & NewKey
        Next TextBlock
    End If
    pKey = NewKey
    
    If TooLong Then Err.Raise 5, "ImgX_TextBlock.Key", "Key must be between 1 and 79 characters in length.  Key was truncated to fit."
End Property

Public Property Get Key() As String
    Key = pKey
End Property

Public Property Let Text(ByVal NewText As String)
    Dim I       As Long
    Dim TextLen As Long
    Dim CurChar As Byte
    
    TextLen = Len(NewText)
    
    For I = 1 To TextLen
        CurChar = Asc(Mid(NewText, I, 1))
        If (CurChar < 32 And (CurChar <> 13 And CurChar <> 10)) _
           Or CurChar > 126 Then Mid(NewText, I, 1) = Chr$(32)  'Err.Raise 5, "ImgX_TextBlock.Text", "Invalid Characters.  Only plain printable ASCII characters are valid."
    Next I

    pText = NewText
    
End Property

Public Property Get Text() As String
    Text = pText
End Property




