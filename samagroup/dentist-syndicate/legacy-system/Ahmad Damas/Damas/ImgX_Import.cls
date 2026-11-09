VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_Import"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Event GetImgX(ImgX As ImgX)

Private Sub ReadImage(hSrc As Long, Page As Long, ImageType As ImgX_ImageTypes, WMFPath As String, UndoText As String)
    
    'Dim TranspColor&
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim P           As Long
    Dim I           As Long
    Dim TextCount   As Long
    
    Dim TextPointer As Long
    Dim Text        As String
    Dim pText       As Long
    Dim Key         As String
    Dim pKey        As Long
    Dim W&, H&
    Dim DPIX        As Long
    Dim DPIY        As Long
    Dim DPIUnits    As Long
    
    RaiseEvent GetImgX(ImgX)
    
    If ImageType = ixtJPG Then ISClearJPGInputText
    If ImageType = ixtPNG Then ISClearPNGInputText
    
    ImgX.f_StartProgress "ImgX.Import.FromFile"
    
    Set Buffer = New ImgX_Buffer
    
    Select Case ImageType
        Case ixtJPG: P = ISReadJPGToRGB(hSrc, W, H)
        Case ixtBMP: P = ISReadBMPToRGB(hSrc, W, H)
        Case ixtPNG: P = ISReadPNGToRGB(hSrc, W, H)
        Case ixtTIF: P = ISReadTIFFPageToRGBDirect(hSrc, W, H, Page - 1)
        Case ixtPCX: P = ISReadPCXToRGB(hSrc, W, H)
        Case ixtTGA: P = ISReadTGAToRGB(hSrc, W, H)
        Case ixtWMF: P = ISReadMetafileToRGB(WMFPath, W, H, ImgX.Attrib(ixaWMFDefWidth), ImgX.Attrib(ixaWMFDefHeight), ImgX.Attrib(ixaWMFBackColor))
    End Select
    
    If ImageType <> ixtWMF Then ISCloseSource hSrc
    
    ImgX.f_StopProgress
    
    If P = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromFile", pGetErrorDesc(pGetLastError)
    
        
    Select Case ImageType
        Case ixtJPG: ISGetLastJPGInputDPI DPIX, DPIY, DPIUnits
        Case ixtPNG: ISGetLastPNGInputDPI DPIX, DPIY, DPIUnits
        Case ixtTIF: ISGetLastJPGInputDPI DPIX, DPIY, DPIUnits
    End Select
    
    If DPIUnits = 0 Then DPIX = 0: DPIY = 0                         'No Units  (reset the DPI)
    If DPIUnits = 2 Then DPIX = DPIX * 2.54:  DPIY = DPIY * 2.54:   'Centimeters (Convert to Inches)
    
    'Take screen DPI if file didn't supply it!
    If DPIX <= 0 Then DPIX = (1# / (Screen.TwipsPerPixelX / 1440#))
    If DPIY <= 0 Then DPIY = (1# / (Screen.TwipsPerPixelY / 1440#))
    
    ImgX.Attrib(ixaDotsPerInchX) = DPIX
    ImgX.Attrib(ixaDotsPerInchY) = DPIY
    
    Buffer.SetBuffer P, W, H, 24
    
    ImgX.TextBlocks.Clear
    
    If ImageType = ixtPNG Then
        On Error Resume Next
        '
        'Read the text blocks.  They come in as Global Memory Handles.  We need to create a VB string buffer
        'with String(), The functions return a GlobalAlloc buffer.  We use CopyMemory to copy the contents
        'of the buffer into our string that is full of NULLs.  We can't forget to clean up either!
        '
        TextCount = ISGetPNGInputTextCount
        For I = 0 To TextCount - 1
            Key = String(80, 0)
            Text = String(4096, 0)
            ISGetPNGInputText I, pKey, pText, (0&)
            CopyMemoryLPtoStr Key, pKey, 79
            CopyMemoryLPtoStr Text, pText, 4095
            Key = Left(Key, InStr(Key, Chr$(0)) - 1)
            Text = Left(Text, InStr(Text, Chr$(0)) - 1)
            
            ImgX.TextBlocks.Add Key, Text
        Next I
    End If
    
    If ImageType = ixtJPG Then
        On Error Resume Next
        
        TextCount = ISGetJPGInputTextCount
        For I = 0 To TextCount - 1
            TextPointer = ISGetJPGInputText(I)
            Text = String(4096, 0)                    'Allocate a VB String Buffer
            CopyMemoryLPtoStr Text, TextPointer, 4096 'Allow up to 4k
            'Text = StrConv(Text, vbUnicode)          'Convert From ASCII to UNICODE  (Not Needed, CopyMemory was set up for VB to explicitly do the conversion)
            Text = Left(Text, InStr(1, Text, Chr$(0)) - 1)  'Trim off the crap
            GlobalFree TextPointer
        
            ImgX.TextBlocks.Add Key, Text
        Next I
    End If

    
    ImgX.f_SetBuffer Buffer, UndoText
    ImgX.IsChanged = False    'Reset the Changed flag when we open a new image

End Sub
Public Sub FromMemoryFile(Buffer() As Byte, ByVal ImageType As ImgX_ImageMemoryTypes, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim hSrc        As Long
    Dim LB&, UB&
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then Err.Raise ixeNotInitialized, "ImgX.Import.FromMemoryFile", pGetErrorDesc(ixeNotInitialized)
    
    If ImageType < ixmtJPG Or ImageType > ixmtBMP Then ImgX.f_RaiseError 5, "ImgX.Import.FromMemoryFile", "Invalid ImageType Parameter"
    
    '
    'Check for more than one dimension
    '
    LB = -1: UB = -2
    On Error Resume Next
    LB = LBound(Buffer, 2)
    UB = UBound(Buffer, 2)
    On Error GoTo 0
    If LB <> -1 Or UB <> -2 Then ImgX.f_RaiseError 5, "ImgX.Import.FromMemoryFile", "Invalid Buffer.  Must be a zero-based one dimensional array containing an in-memory image file."
   
    '
    'Check for valid first dimension
    '
    LB = -1: UB = -2
    On Error Resume Next
    LB = LBound(Buffer)
    UB = UBound(Buffer)
    On Error GoTo 0
    If LB <> 0 Or UB < 1 Then ImgX.f_RaiseError 5, "ImgX.Import.FromMemoryFile", "Invalid Buffer.  Must be a zero-based one dimensional array containing an in-memory image file."
   

    hSrc = ISOpenMemorySource(Buffer(0), UB + 1)
    If hSrc = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromMemoryFile", pGetErrorDesc(pGetLastError)

    If Len(UndoText) = 0 Then UndoText = "Import Memory File"
    
    ReadImage hSrc, 1, ImageType, "", UndoText  'This function closes the hSrc when done
    
End Sub

Public Sub FromFile(ByVal ImagePath As String, Optional ByVal Page As Long = 1, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim ImageType   As ImgX_ImageTypes
    Dim hSrc        As Long
    Dim Pages       As Long
    Dim W&, H&, C&
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then Err.Raise ixeNotInitialized, "ImgX.Import.FromFile", pGetErrorDesc(ixeNotInitialized)
    
    If Page < 1 Then ImgX.f_RaiseError 5, "ImgX.Import.FromFile", "Invalid Page Parameter"
   
    ImagePath = Trim$(ImagePath)
    
    ImageType = ImgX.Support.GetImageInfo(ImagePath, W, H, C, Pages)
    
    If ImageType = ixtUnknown Then ImgX.f_RaiseError ixeUnknownImage, "ImgX.Import.FromFile", pGetErrorDesc(ixeUnknownImage)
    
    If Page > Pages Then Page = Pages
    
    If ImageType <> ixtWMF Then
        hSrc = ISOpenFileSource(ImagePath)
        If hSrc = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromFile", pGetErrorDesc(pGetLastError)
    End If
    
    If Len(UndoText) = 0 Then UndoText = "Open " & Mid(ImagePath, InStrRev(ImagePath, "\") + 1)
    ReadImage hSrc, Page, ImageType, ImagePath, UndoText  'This function closes the hSrc when done
    
    '
    'These attributes are usually read only.  We could set up a Friend function to pass them
    'in but it's easier just to make a large negative number that will accept them.  That's
    'why we are subtracting 652.
    '
    ImgX.Attrib(ixaLastFilePath - 652) = ImagePath
    ImgX.Attrib(ixaLastFileName - 652) = Mid(ImagePath, InStrRev(ImagePath, "\") + 1)
    ImgX.Attrib(ixaLastFileType - 652) = ImageType
    
End Sub

Public Sub FromPicture(ByVal NewPicture As IPicture, Optional ByVal UndoText As String)
    '
    'This sub takes a regular Picture object.  The picture object may be encapsulating
    'a bitmap or an icon.  Metafiles are not supported in this release.
    '
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim ICONINFO    As ICONINFO
    Dim BITMAP      As BITMAP
    Dim MemDC       As Long
    Dim HBrush      As Long
    Dim RECT        As RECT
    Dim IconAsBitmap As Long
    Dim OldBitmap   As Long
    Dim ColorBits   As Long
    Dim W&, H&, P&
    
    RaiseEvent GetImgX(ImgX)
        
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromPicture", pGetErrorDesc(ixeNotInitialized)
    
    If NewPicture Is Nothing Then Exit Sub
    
    If NewPicture.Type = PICTYPE_METAFILE Or NewPicture.Type = PICTYPE_ENHMETAFILE Then ImgX.f_RaiseError 5, "ImgX.Import.FromPicture", "ImgX does not support Picture objects encapsulating metafile data."
    If NewPicture.Type = PICTYPE_UNINITIALIZED Or NewPicture.Type = PICTYPE_NONE Then ImgX.f_RaiseError 5, "ImgX.Import.FromPicture", "The Picture object contains no image data."
    If NewPicture.Type <> PICTYPE_BITMAP And NewPicture.Type <> PICTYPE_ICON Then ImgX.f_RaiseError 5, "ImgX.Import.FromPicture", "The Picture object contains unknown image data. (" & NewPicture.Type & ")"
    
    If NewPicture.Type = PICTYPE_ICON Then
        If GetIconInfo(NewPicture.handle, ICONINFO) = 0 Then ImgX.f_RaiseError 5, "ImgX.Import.FromPicture", "Picture Object Contains an Invalid Icon"
        GetObject ICONINFO.hbmColor, Len(BITMAP), BITMAP
        If BITMAP.bmWidth = 0 Or BITMAP.bmHeight = 0 Then ImgX.f_RaiseError 5, "ImgX.Import.FromPicture", "Picture Object Contains an Invalid Icon"
        MemDC = CreateCompatibleDC(0)
        If MemDC = 0 Then ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Import.FromPicture.CreateCompatibleDC", pGetErrorDesc(ixeDeviceContextErr)
        
        'IconAsBitmap = CreateCompatibleBitmap(MemDC, BITMAP.bmWidth, BITMAP.bmHeight)
        ColorBits = GetDeviceCaps(MemDC, BITSPIXEL) * GetDeviceCaps(MemDC, PLANES)
        IconAsBitmap = CreateBitmap(BITMAP.bmWidth, BITMAP.bmHeight, GetDeviceCaps(MemDC, PLANES), ColorBits, 0)
        
        If IconAsBitmap = 0 Then
            DeleteDC MemDC
            ImgX.f_RaiseError ixeOutOfMemory, "ImgX..Import.FromPicture.CreateBitmap", pGetErrorDesc(ixeOutOfMemory)
        End If
        
        HBrush = CreateSolidBrush(ImgX.Attrib(ixaIconBackColor))
        If HBrush = 0 Then
            DeleteObject IconAsBitmap
            DeleteDC MemDC
            ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Import.FromPicture.CreateSolidBrush", pGetErrorDesc(ixeDeviceContextErr)
        End If
        
        OldBitmap = SelectObject(MemDC, IconAsBitmap)
        
        RECT.Left = 0
        RECT.Top = 0
        RECT.Right = BITMAP.bmWidth
        RECT.Bottom = BITMAP.bmHeight
        FillRect MemDC, RECT, HBrush
        DeleteObject HBrush
        
        DrawIcon MemDC, 0, 0, NewPicture.handle
        
        SelectObject MemDC, OldBitmap
        DeleteDC MemDC
    End If
    
    
    'Convert from HiMetric to Pixels
    Set Buffer = New ImgX_Buffer
    H = Round((NewPicture.Height * 0.5669292) / Screen.TwipsPerPixelY)
    W = Round((NewPicture.Width * 0.5669292) / Screen.TwipsPerPixelX)
    
    If NewPicture.Type = PICTYPE_ICON Then
        P = ISHBITMAPToRGB(IconAsBitmap, W, H, ImgX.Support.ScreenDC, 0)
        DeleteObject IconAsBitmap
    Else
        P = ISHBITMAPToRGB(NewPicture.handle, W, H, ImgX.Support.ScreenDC, 0)
    End If

    If P = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromPicture.ISHBITMAPToRGB", pGetErrorDesc(pGetLastError)

    Buffer.SetBuffer P, W, H, 24
    
    If Len(UndoText) = 0 Then UndoText = "Import Picture Object"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub FromClipBoard(Optional ByVal UndoText As String)
    
    Dim ImgX As ImgX
    RaiseEvent GetImgX(ImgX)
        
    On Error Resume Next
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromClipboard", pGetErrorDesc(ixeNotInitialized)
    
    If Clipboard.GetFormat(vbCFBitmap) Then
        If Len(UndoText) = 0 Then UndoText = "Paste from ClipBoard"
        FromPicture Clipboard.GetData(vbCFBitmap), UndoText
    Else
        ImgX.f_RaiseError ixeNoClipBoardBitmap, "ImgX.Import.FromClipBoard", pGetErrorDesc(ixeNoClipBoardBitmap)
    End If
End Sub

Public Sub FromDeviceContext(ByVal hDC As Long, ByVal L As Long, ByVal T As Long, ByVal W As Long, ByVal H As Long, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim hBitmap     As Long
    Dim DCCaps      As Long
    Dim DCSize      As Size
    Dim RECT        As RECT
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromDeviceContext", pGetErrorDesc(ixeNotInitialized)
    
    '
    'Confirm that the DC is valid and capable
    '
    If hDC = 0 Then ImgX.f_RaiseError 5, "ImgX.Import.FromDeviceContext", "Invalid hDC Parameter"
    
    DCCaps = GetDeviceCaps(hDC, RASTERCAPS)
    
    If DCCaps And RC_BITBLT = False Then ImgX.f_RaiseError 5, "ImgX.Import.FromDeviceContext", "hDC doesn't support RC_BITBLT"
    If DCCaps And RC_BITMAP64 = False Then ImgX.f_RaiseError 5, "ImgX.Import.FromDeviceContext", "hDC doesn't support RC_BITMAP64"
    If DCCaps And RC_DI_BITMAP = False Then ImgX.f_RaiseError 5, "ImgX.Import.FromDeviceContext", "hDC doesn't support RC_DI_BITMAP"
    
    'If L < 0 Or T < 0 Or H < 1 Or W < 1 Then ImgX.f_RaiseError 5, "ImgX.Import.FromDeviceContext", "Invalid Size Parameters"
    
    If L < 0 Then L = 0
    If T < 0 Then T = 0
    If W < 1 Then W = GetDeviceCaps(hDC, HORZRES) - L
    If H < 1 Then H = GetDeviceCaps(hDC, VERTRES) - T
    
    Set Buffer = New ImgX_Buffer
    Buffer.SetBuffer ISDCToRGB(hDC, L, T, W, H), W, H, 24

    If Buffer.IsEmpty Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromDeviceContext.ISDCToRGB", pGetErrorDesc(pGetLastError)

    If Len(UndoText) = 0 Then UndoText = "Import From Device Context"
    
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub FromPackedDIB(ByVal pDIB As Long, Optional ByVal UndoText As String)
    
    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    Dim W&, H&, P&
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromPackedDIB", pGetErrorDesc(ixeNotInitialized)
    If pDIB = 0 Then ImgX.f_RaiseError 5, "ImgX.Import.FromPackedDIB", "Invalid pDIB Parameter"
    
    '
    'Perform the action.
    '
    Set Buffer = New ImgX_Buffer
    P = ISDIBToRGB(pDIB, W, H)
    Buffer.SetBuffer P, W, H, 24
    
    If Buffer.IsEmpty Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromPackedDIB.ISDIBToRGB", pGetErrorDesc(pGetLastError)

    If Len(UndoText) = 0 Then UndoText = "Import From Packed DIB"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub FromDIB(ByVal pDIBData As Long, ByVal pBitmapInfoHeader As Long, ByVal pPalette As Long, Optional ByVal UndoText As String)
    
    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    Dim W&, H&, P&
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromDIB", pGetErrorDesc(ixeNotInitialized)
    
    If pDIBData = 0 Then ImgX.f_RaiseError 5, "ImgX.Import.FromDIB", "Invalid pDIBData Parameter"
    If pBitmapInfoHeader = 0 Then ImgX.f_RaiseError 5, "ImgX.Import.FromDIB", "Invalid pBitmapInfoHeader Parameter"
    
    '
    'Perform the action.
    '
    Set Buffer = New ImgX_Buffer
    P = ISDIBPartsToRGB(pDIBData, pBitmapInfoHeader, pPalette, W, H)
    Buffer.SetBuffer P, W, H, 24
    If Buffer.IsEmpty Then ImgX.f_RaiseError pGetLastError, "ImgX.Import.FromDIB.ISDIBPartsToRGB", pGetErrorDesc(pGetLastError)

    If Len(UndoText) = 0 Then UndoText = "Import From Unpacked DIB"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub FromImgX(ByVal OtherImgX As ImgX, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromImgX", pGetErrorDesc(ixeNotInitialized)
    
    If OtherImgX Is Nothing Then ImgX.f_RaiseError 5, "ImgX.Import.FromImgX", "ImgX parameter cannot be Nothing."
    If OtherImgX Is Me Then ImgX.f_RaiseError 5, "ImgX.Import.FromImgX", "ImgX passed in cannot be the same ImgX object."
    
    If OtherImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Import.FromImgX", "ImgX passed in does not contain a valid image."
    
    Set Buffer = OtherImgX.f_Buffer.Copy(True)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Import.FromImgX.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    If Len(UndoText) = 0 Then UndoText = "Copy of Another ImgX object"

    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub FromNew(ByVal Width As Long, ByVal Height As Long, ByVal BackColor As OLE_COLOR, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromNew", pGetErrorDesc(ixeNotInitialized)
    
    If Width < 1 Or Height < 1 Then ImgX.f_RaiseError 5, "ImgX.Import.FromNew", "Invalid Width and Height Parameters."
    
    Set Buffer = New ImgX_Buffer
    If Not Buffer.Allocate(Width, Height) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Import.FromNew.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    Buffer.Fill BackColor
    
    If Len(UndoText) = 0 Then UndoText = "New " & Width & "x" & Height & " Image"

    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub FromScreen(Optional ByVal UndoText As String)
    
    Dim ImgX    As ImgX
    
    RaiseEvent GetImgX(ImgX)
    
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromScreen", pGetErrorDesc(ixeNotInitialized)
    
    If Len(UndoText) = 0 Then UndoText = "Screen Capture"
    FromDeviceContext ImgX.Support.ScreenDC, 0, 0, GetDeviceCaps(ImgX.Support.ScreenDC, HORZRES), GetDeviceCaps(ImgX.Support.ScreenDC, VERTRES), UndoText
End Sub


Public Sub FromByteArray(Bytes() As Byte, Optional ByVal UndoText As String)
    
    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    Dim LB1&, LB2&, LB3&, LB4&
    Dim UB1&, UB2&, UB3&, UB4&
    Dim BadArray    As Boolean
    
    RaiseEvent GetImgX(ImgX)
    If Not ImgX.Initialized Then ImgX.f_RaiseError ixeNotInitialized, "ImgX.Import.FromByteArray", pGetErrorDesc(ixeNotInitialized)
        
    LB1 = -1: LB2 = -1: LB4 = -1: LB4 = -1
    UB1 = -2: UB2 = -2: UB4 = -2: UB4 = -2
    
    On Error Resume Next
    
    LB1 = LBound(Bytes, 1)
    LB2 = LBound(Bytes, 2)
    LB3 = LBound(Bytes, 3)
    LB4 = LBound(Bytes, 4)
    UB1 = UBound(Bytes, 1)
    UB2 = UBound(Bytes, 2)
    UB3 = UBound(Bytes, 3)
    UB4 = UBound(Bytes, 4)
    
    On Error GoTo 0
    
    If LB1 <> 0 Or UB1 <> 2 Or LB2 <> 0 Or UB2 < 0 Or LB3 <> 0 Or UB3 < 0 Or LB4 <> -1 Or UB4 <> -2 Then
        ImgX.f_RaiseError 5, "ImgX.Import.FromByteArray", "The byte array must contain exactly three dimensions where the first has bounds 0 to 2, the second has bounds 0 to Width -1 and the third has bounds 0 to Height -1."
    End If
    
    Set Buffer = New ImgX_Buffer
    If Not Buffer.Allocate(UB2 + 1, UB3 + 1, 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ApplyPalette.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    CopyMemoryBytesToPtr Buffer.Pointer, Bytes(0, 0, 0), Buffer.Width * Buffer.Height * 3
    
    If Len(UndoText) = 0 Then UndoText = "Import From Byte Array"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub



