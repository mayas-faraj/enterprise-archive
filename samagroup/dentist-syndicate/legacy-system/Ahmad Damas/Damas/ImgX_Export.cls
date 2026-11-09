VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_Export"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Event GetImgX(ImgX As ImgX)
Public Function ToPicture() As IPicture
    '
    'If there is not an RGB buffer loaded, then return Nothing
    'If there is, then return the picture object.  If there
    'is no picture object created yet, then create one.  This is
    'known as lazy instantiation.
    '
   
    Dim ImgX    As ImgX
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Export.ToPicture", "No Image Data"
    
    Set ToPicture = ImgX.f_Buffer.Picture

End Function


Public Sub ToByteArray(Buffer() As Byte)
   
    Dim ImgX    As ImgX
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Export.ToByteArray", "No Image Data"
    
    On Error Resume Next
    Err.Clear
    ReDim Buffer(0 To 2, 0 To ImgX.f_Buffer.Width - 1, 0 To ImgX.f_Buffer.Height - 1)
    On Error GoTo 0
    If Err Then Err.Raise Err.Number, "ImgX.Export.ToByteArray", Err.Description
    
    ImgX.f_Buffer.ChangeColorDepth 24
    CopyMemoryPtrToBytes Buffer(0, 0, 0), ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width * ImgX.f_Buffer.Height * 3
End Sub


Public Sub ToFile(ByVal ImagePath As String, ByVal ImageType As ImgX_ImageSaveTypes, Optional ByVal BitsPerPixel As Long = 0)

    Dim ImgX                As ImgX
    Dim hDest               As Long
    
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Export.ToFile", "No Image Data"
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Export.ToFile", pGetErrorDesc(ixeNotInitialized)
    
    If BitsPerPixel <> 24 And BitsPerPixel <> 8 And BitsPerPixel <> 0 Then ImgX.f_RaiseError 5, "ImgX.Export.ToFile", "Invalid BitsPerPixel Property"
    
    
    ImagePath = Trim$(ImagePath)
    
    hDest = ISOpenFileDest(ImagePath)
    If hDest = 0 Then Err.Raise pGetLastError, "ImgX.Export.ToFile", pGetErrorDesc(pGetLastError)

    WriteImage hDest, ImageType, BitsPerPixel
    
    '
    'These attributes are usually read only.  We could set up a Friend function to pass them
    'in but it's easier just to make a large negative number that will accept them.  That's
    'why we are subtracting 652.
    '
    ImgX.Attrib(ixaLastFilePath - 652) = ImagePath
    ImgX.Attrib(ixaLastFileName - 652) = Mid(ImagePath, InStrRev(ImagePath, "\") + 1)
    ImgX.Attrib(ixaLastFileType - 652) = ImageType
    ImgX.IsChanged = False
End Sub
Public Sub ToMemoryFile(Buffer() As Byte, ByVal ImageType As ImgX_ImageMemoryTypes, Optional ByVal BitsPerPixel As Long = 0)

    Dim ImgX                As ImgX
    Dim hDest               As Long
    
    Dim BufferX             As ImgX_Buffer
    Dim BufferSize          As Long
    
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Export.ToMemoryFile", "No Image Data"
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Export.ToMemoryFile", pGetErrorDesc(ixeNotInitialized)
    
    If BitsPerPixel <> 24 And BitsPerPixel <> 8 And BitsPerPixel <> 0 Then ImgX.f_RaiseError 5, "ImgX.Export.ToMemoryFile", "Invalid BitsPerPixel Property"
    
    Set BufferX = ImgX.f_Buffer.Copy(False, 24)
    If BufferX Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Export.ToMemoryFile", pGetErrorDesc(ixeOutOfMemory)
    
    BufferSize = BufferX.Width * BufferX.Height * 3 * 2
    hDest = ISOpenMemoryDest(BufferX.Pointer, BufferSize)
    If hDest = 0 Then Err.Raise pGetLastError, "ImgX.Export.ToMemoryFile", pGetErrorDesc(pGetLastError)

    WriteImage hDest, ImageType, BitsPerPixel
    
    BufferSize = ISGetSize(hDest)
    
    GlobalReAlloc BufferX.Pointer, BufferSize, GMEM_FIXED
    
    ReDim Buffer(0 To BufferSize - 1) As Byte
    CopyMemoryPtrToBytes Buffer(0), BufferX.Pointer, BufferSize
    Set BufferX = Nothing
    
End Sub

Private Sub WriteImage(ByVal hDest As Long, ByVal ImageType As ImgX_ImageSaveTypes, BitsPerPixel As Long)

    Dim ImgX                As ImgX
    Dim GrayScale           As ImgX_Buffer
    Dim Success             As Boolean
    Dim Palette()           As Long
    Dim TextBlock           As ImgX_TextBlock
    Dim I                   As Long
    Dim Key                 As String
    
    
    RaiseEvent GetImgX(ImgX)
    
    If ImageType = ixstPNG Then
        '
        'Setup Text Fields (Use Compression when Text field is larger than 1000 chars)
        '
        I = 0
        ISClearPNGOutputText
        For Each TextBlock In ImgX.TextBlocks
            I = I + 1
            Key = IIf(Len(TextBlock.Key), TextBlock.Key, I)
            ISAddPNGOutputText TextBlock.Text, Key, Len(TextBlock.Text) > 1000
        Next TextBlock
    End If
    
    
    If ImageType = ixstJPG Then
        '
        'Setup Text Fields.  Concat the key to the front of the text if
        'there is a key AND they user has ImgX.Option(ixoJPGConcatKey) = True
        '
        ISClearJPGOutputText
        For Each TextBlock In ImgX.TextBlocks
            If ImgX.Attrib(ixaJPGConcatKey) And Len(TextBlock.Key) Then
                ISAddJPGOutputText TextBlock.Key & ": " & TextBlock.Text
            Else
                ISAddJPGOutputText TextBlock.Text
            End If
        Next TextBlock
        
        ISSetJPGDCT ImgX.Attrib(ixaJPGDCT)                 'Set the compression type
        
        '
        '8 JPG are GrayScale.  The user must specifically pass 8 to make it grayscale
        '
        If BitsPerPixel = 0 Then BitsPerPixel = 24
    End If
    
    ImgX.f_StartProgress "ImgX.Export.ToFile"
    
    If BitsPerPixel = 0 Then BitsPerPixel = ImgX.f_Buffer.ColorDepth
    
    '
    'Set the DPI values
    '
    Select Case ImageType
        Case ixstPNG:   ISSetPNGOutputDPI ImgX.Attrib(ixaDotsPerInchX), ImgX.Attrib(ixaDotsPerInchY), 1
        Case ixstJPG:   ISSetJPGOutputDPI ImgX.Attrib(ixaDotsPerInchX), ImgX.Attrib(ixaDotsPerInchY), 1
        Case ixstTIF:   ISSetTIFFOutputDPI ImgX.Attrib(ixaDotsPerInchX), ImgX.Attrib(ixaDotsPerInchY), 1
    End Select
    
    '
    'Perform the action.
    '
    If BitsPerPixel = 8 And ImageType <> ixstWMF And ImageType <> ixstEMF Then '8-bit
        
        If ImageType = ixstJPG Then
            Set GrayScale = New ImgX_Buffer
            If Not GrayScale.Allocate(ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, 8) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ApplyPalette.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
            ImgX.f_Buffer.ChangeColorDepth 24
            ISRGBToGrayScale8Bit ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, GrayScale.Pointer
        End If
        
        ImgX.f_Buffer.ChangeColorDepth 8
        Palette = ImgX.f_Buffer.Palette
        
        Select Case ImageType
            Case ixstJPG:  Success = ISWrite8BitGrayscaleToJPG(hDest, GrayScale.Pointer, GrayScale.Width, GrayScale.Height, ImgX.Attrib(ixaJPGQuality), -ImgX.Attrib(ixaJPGInterlaced))
            Case ixstPCX:  Success = ISWrite8BitToPCX(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Palette(0))
            Case ixstTGA:  Success = ISWrite8BitToTGA(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Palette(0))
            Case ixstTIF:  Success = ISWrite8BitToTIFF(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Palette(0))
            Case ixstPNG:  Success = ISWrite8BitToPNG(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Palette(0), ImgX.Attrib(ixaPNGGamma))
            Case ixstBMP
                If ImgX.Attrib(ixaBMPUseRLE) Then
                    Success = ISWrite8BitRLEToBMP(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Palette(0), ImgX.f_Buffer.Colors)
                Else
                    Success = ISWrite8BitToBMP(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Palette(0))
                End If
            
        End Select
        
        'GlobalFree ColorMap
    
    Else    '24-bit
        
        ImgX.f_Buffer.ChangeColorDepth 24
        
        Select Case ImageType
            Case ixstJPG:    Success = ISWriteRGBToJPG(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, ImgX.Attrib(ixaJPGQuality), -ImgX.Attrib(ixaJPGInterlaced)) <> False
            Case ixstBMP:    Success = ISWriteRGBToBMP(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height) <> False
            Case ixstPCX:    Success = ISWriteRGBToPCX(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height) <> False
            Case ixstTGA:    Success = ISWriteRGBToTGA(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height) <> False
            Case ixstTIF:    Success = ISWriteRGBToTIFF(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height) <> False
            Case ixstWMF:    Success = ISWriteRGBToWMF(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Abs(ImgX.Attrib(ixaWMFPlaceable))) <> False
            Case ixstEMF:    Success = ISWriteRGBToEMF(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height) <> False
            Case ixstPNG:    Success = ISWriteRGBToPNG(hDest, ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, ImgX.Attrib(ixaPNGGamma))
        End Select
    
    End If
    
    ISCloseDest hDest
    ImgX.f_StopProgress
    
    If Not Success Then ImgX.f_RaiseError pGetLastError, "ImgX.Export.ToFile", pGetErrorDesc(pGetLastError)

End Sub

Public Function ToIcon(Optional ByVal Width As Long, Optional ByVal Height As Long, Optional ByVal GrayScale As Boolean) As IPicture
    
    Dim ImgX As ImgX
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Export.ToIcon", "No Image Data"
    
    Set ToIcon = ImgX.f_Buffer.CreateIcon(Width, Height, False, 0, 0, GrayScale)
End Function
Public Function ToCursor(Optional ByVal Width As Long, Optional ByVal Height As Long, Optional ByVal HotSpotX As Long, Optional ByVal HotSpotY As Long, Optional ByVal GrayScale As Boolean) As IPicture
       
    Dim ImgX As ImgX
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Export.ToCursor", "No Image Data"
    
    Set ToCursor = ImgX.f_Buffer.CreateIcon(Width, Height, True, HotSpotX, HotSpotY, GrayScale)
End Function



