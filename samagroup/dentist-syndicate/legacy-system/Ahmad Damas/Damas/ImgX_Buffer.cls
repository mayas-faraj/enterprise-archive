VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_Buffer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Public Event GetImgX(ImgX As ImgX)

Private pPointer     As Long     'Pointer to a buffer holding an 24bit copy of the image
Private pColorDepth  As Long     'Number of color bits used for the buffer that pPointer points to.
Private pColors      As Long     'The total number of colors in the image data
Private pPicture     As IPicture

Private pPalette()   As Long     'Array of up to 256 RGBQUADs. Only valid when ColorBits = 8
Private pWidth       As Long     'Width in Pixels
Private pHeight      As Long     'Height in Pixels
Private pDIBPointer  As Long     'Pointer To Device Independent Bitmap (Created By first call to Render)

Private Function RaiseError(ErrNum As Long, ErrSrc As String, ErrDesc As String)
    Dim ImgX As ImgX
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX Is Nothing Then
        Err.Raise ErrNum, ErrSrc, ErrDesc
    Else
        ImgX.f_RaiseError ErrNum, ErrSrc, ErrDesc
    End If
End Function

Private Sub RaiseMemoryStatus()
    Dim ImgX As ImgX
    
    RaiseEvent GetImgX(ImgX)
    If Not ImgX Is Nothing Then ImgX.f_RaiseMemoryStatus
End Sub

Public Property Get Width() As Long
    Width = pWidth
End Property
Public Property Get Height() As Long
    Height = pHeight
End Property
Public Property Get IsEmpty() As Boolean
    IsEmpty = pPointer = 0
End Property
Public Property Get ColorDepth() As Long
    ColorDepth = pColorDepth
End Property
Public Property Get Palette() As Long()
    Palette = pPalette
End Property
Public Property Let Palette(P() As Long)
    Debug.Assert LBound(P) = 0
    If UBound(P) <> 255 Then ReDim Preserve P(0 To 255) As Long
    pPalette = P
End Property
Public Property Get Pointer() As Long
    Pointer = pPointer
End Property
Public Property Get DIBPointer() As Long
    
    If pDIBPointer = 0 Then
        If Colors <= 256 Then
            ChangeColorDepth 8
            pDIBPointer = IS8BitToDIB2(pPointer, pWidth, pHeight, 256, 8, pPalette(0))
        Else
            pDIBPointer = ISRGBToDIB(pPointer, pWidth, pHeight)
        End If
        
        RaiseMemoryStatus
    End If
    DIBPointer = pDIBPointer
End Property

Public Sub ConserveMemory(Optional Demote As Boolean = True)
    '
    'This sub will free up any memory that may have been allocated for a DIBPointer or
    'picture object.  It will also attempt to place the image in an 8bit buffer if it
    'will fit in one and the Demote flag is true.
    '
    
    If pDIBPointer = 0 And pPicture Is Nothing And (Demote = False Or pColorDepth = 8) Then Exit Sub
    If pDIBPointer Then GlobalFree pDIBPointer: pDIBPointer = 0
    Set pPicture = Nothing
    If Demote And Colors <= 256 Then ChangeColorDepth 8
    
    RaiseMemoryStatus
End Sub

Public Property Get Colors() As Long
    If IsEmpty Then Exit Property
    If pColors Then Colors = pColors: Exit Property
    
    ChangeColorDepth 24
    pColors = ISCountRGBColors(Pointer, pWidth, pHeight, False)
    
    Colors = pColors
End Property

Public Sub ChangeColorDepth(Depth As Long)
    
    Dim NewPointer  As Long
    
    If Depth = ColorDepth Then Exit Sub
    
    Set pPicture = Nothing
    If pDIBPointer Then GlobalFree pDIBPointer: pDIBPointer = 0

    Select Case Depth
        
    Case 24
        If pColorDepth = 8 Then
        
            NewPointer = GlobalAlloc(GMEM_FIXED, pWidth * pHeight * 3)
            If NewPointer = 0 Then RaiseError ixeOutOfMemory, "ImgX.Buffer.ChangeColorDepth(24).GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
            If IS8BitToRGB(pPointer, NewPointer, pWidth, pHeight, 256, pPalette(0)) = False Then
                GlobalFree NewPointer
                RaiseError pGetLastError(), "ImgX.Buffer.ChangeColorDepth(24).IS8BitToRGB", pGetErrorDesc(pGetLastError())
            End If
            pColors = 0
            GlobalFree pPointer
            pPointer = NewPointer
            pColorDepth = Depth
        End If
        
    Case 8
        If pColorDepth = 24 Then
            pColors = 256
            
            NewPointer = GlobalAlloc(GMEM_FIXED, pWidth * pHeight)
            If NewPointer = 0 Then RaiseError ixeOutOfMemory, "ImgX.Buffer.ChangeColorDepth(8).GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
            
            If ISQuantizeRGBTo8Bit(pPointer, pWidth, pHeight, NewPointer, 256, pPalette(0)) = False Then
                GlobalFree NewPointer
                RaiseError pGetLastError(), "ImgX.ChangeColorDepth(8).ISQuantizeRGBTo8Bit", pGetErrorDesc(pGetLastError())
            End If
            GlobalFree pPointer
            pPointer = NewPointer
            pColorDepth = Depth
        End If
    
    End Select
    
    RaiseMemoryStatus
End Sub


Public Property Get Picture() As IPicture
    '
    'If there is not an image buffer then return Nothing
    'If there is, then create and return a picture object.
    
    Dim ImgX        As ImgX
    Dim hBitmap     As Long
    Dim hPal        As Long
    Dim DIB         As Long
    Dim DisplayBits As Long
    Dim Pal(255)    As Long
    Dim Colors      As Long
    
    If IsEmpty Then Exit Property    'returns Picture=Nothing
        
    If Not pPicture Is Nothing Then Set Picture = pPicture: Exit Property
    
    RaiseEvent GetImgX(ImgX)

    Select Case pColorDepth
    Case 24
        '
        'Determine the if display is 256 colors or less.  If so, we want to use a palette
        '
        DisplayBits = GetDeviceCaps(ImgX.Support.ScreenDC, BITSPIXEL) * GetDeviceCaps(ImgX.Support.ScreenDC, PLANES)
        If DisplayBits = 8 Or DisplayBits = 4 Then
            '
            'Calc the ideal palette
            '
            If ISGet8BitPaletteFromRGB(pPointer, Width, Height, 2 ^ DisplayBits, Pal(0)) = False Then
                RaiseError pGetLastError, "ImgX.Buffer.Picture.ISGet8BitPaletteFromRGB", pGetErrorDesc(pGetLastError)
            End If
            
            hPal = ISRGBQUADToHPALETTE(Pal(0), 2 ^ DisplayBits)
            If hPal = 0 Then RaiseError pGetLastError, "ImgX.Buffer.Picture.ISRGBQUADToHPALETTE", pGetErrorDesc(pGetLastError)
        End If
        
        ISSetHBITMAPCreateMethod ImgX.Attrib(ixaHBITMAPType)
        hBitmap = ISRGBToHBITMAP(pPointer, Width, Height, hPal, ImgX.Support.ScreenDC)
        
        If hBitmap = 0 Then
            If hPal Then DeleteObject hPal
            RaiseError pGetLastError, "ImgX.Buffer.Picture.ISRGBToHBITMAP", pGetErrorDesc(pGetLastError)
        End If
        
    Case 8
        DIB = IS8BitToDIB2(pPointer, pWidth, pHeight, 256, 8, pPalette(0))
        If DIB = 0 Then RaiseError pGetLastError, "ImgX.Buffer.Picture.IS8BitToDIB", pGetErrorDesc(pGetLastError)
        
        hPal = ISRGBQUADToHPALETTE(pPalette(0), 256)
        If hPal = 0 Then
            GlobalFree DIB
            RaiseError pGetLastError, "ImgX.Buffer.Picture.ISRGBQUADToHPALETTE", pGetErrorDesc(pGetLastError)
        End If
        
        ISSetHBITMAPCreateMethod ImgX.Attrib(0)
        hBitmap = ISDIBToHBITMAP(DIB, hPal, ImgX.Support.ScreenDC)
        If hBitmap = 0 Then
            DeleteObject hPal
            GlobalFree DIB
            RaiseError pGetLastError, "ImgX.Buffer.Picture.ISDIBToHBITMAP", pGetErrorDesc(pGetLastError)
        End If
    End Select
        
    '
    'Create an OLE Picture Object
    '
    Set pPicture = pBitmapToPicture(hBitmap, hPal)
    Set Picture = pPicture

End Function


Public Function CreateIcon(Optional ByVal IconWidth As Long = 0, Optional ByVal IconHeight As Long = 0, Optional MakeCursor As Boolean = False, Optional ByVal HotSpotX As Long = 0, Optional ByVal HotSpotY As Long = 0, Optional GrayScale As Boolean) As IPicture
    '
    'If there is not an image buffer, then return Nothing
    'If there is, then create and return a picture object
    'that encapsulates an icon (or cursor)
    '
    
    Dim ImgX        As ImgX
    Dim ICONINFO    As ICONINFO
    Dim W           As Long
    Dim H           As Long
    Dim I           As Long
    Dim IconBuffer  As ImgX_Buffer
    Dim SmallBuffer As ImgX_Buffer
    Dim MaskBuffer  As ImgX_Buffer
    Dim XOffset     As Long
    Dim YOffset     As Long
    Dim hIcon       As Long
    Dim hPal        As Long
    Dim Pal(0 To 255)   As Long
    
    RaiseEvent GetImgX(ImgX)

    If pPointer = 0 Then Exit Function    'returns Picture=Nothing

    If MakeCursor Then
        If IconWidth <= 0 Then IconWidth = GetSystemMetrics(SM_CXCURSOR)
        If IconHeight <= 0 Then IconHeight = GetSystemMetrics(SM_CYCURSOR)
    Else
        If IconWidth <= 0 Then IconWidth = GetSystemMetrics(SM_CXICON)
        If IconHeight <= 0 Then IconHeight = GetSystemMetrics(SM_CYICON)
    End If

    If Width > Height Then
        W = IconWidth
        H = IconHeight * (Height / Width)
    Else
        W = IconWidth * (Width / Height)
        H = IconHeight
    End If

    If W <= 0 Then W = 1
    If H <= 0 Then H = 1

    XOffset = (IconWidth - W) / 2
    YOffset = (IconHeight - H) / 2

    If MakeCursor Then
        ICONINFO.xHotspot = HotSpotX + XOffset
        ICONINFO.yHotspot = HotSpotY + YOffset
        If ICONINFO.xHotspot < 0 Then ICONINFO.xHotspot = 0
        If ICONINFO.xHotspot >= IconWidth Then ICONINFO.xHotspot = IconWidth - 1
        If ICONINFO.yHotspot < 0 Then ICONINFO.yHotspot = 0
        If ICONINFO.yHotspot >= IconHeight Then ICONINFO.yHotspot = IconHeight - 1
    Else
        ICONINFO.fIcon = True
    End If


    Set SmallBuffer = New ImgX_Buffer
    Set MaskBuffer = New ImgX_Buffer
    Set IconBuffer = New ImgX_Buffer
    
    If Not SmallBuffer.Allocate(W, H, 24) Then RaiseError ixeOutOfMemory, "ImgX.Buffer.CreateIcon.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    ISDecimateRGB pPointer, Width, Height, SmallBuffer.Pointer, W, H
    
    If GrayScale Then ISRGBToGrayScale24 SmallBuffer.Pointer, W, H

    If Not IconBuffer.Allocate(IconWidth, IconHeight, 24) Then RaiseError ixeOutOfMemory, "ImgX.Buffer.CreateIcon.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    IconBuffer.Fill vbBlack
    
    ISOverlayRGB IconBuffer.Pointer, IconWidth, IconHeight, SmallBuffer.Pointer, W, H, XOffset, YOffset, 100

    If ISGet8BitPaletteFromRGB(IconBuffer.Pointer, IconWidth, IconHeight, 256, Pal(0)) = False Then
        RaiseError pGetLastError, "ImgX.Buffer.CreateIcon.ISGet8BitPaletteFromRGB", pGetErrorDesc(pGetLastError)
    End If
    
    hPal = ISRGBQUADToHPALETTE(Pal(0), 256)
    If hPal = 0 Then RaiseError pGetLastError, "ImgX.CreateIcon.Picture.ISRGBQUADToHPALETTE", pGetErrorDesc(pGetLastError)

    ISSetHBITMAPCreateMethod ImgX.Attrib(ixaHBITMAPType)
    ICONINFO.hbmColor = ISRGBToHBITMAP(IconBuffer.Pointer, IconWidth, IconHeight, hPal, ImgX.Support.ScreenDC)  'Creates a picture object with palette if 256 color display

    SmallBuffer.Fill vbBlack
    
    MaskBuffer.Allocate IconWidth, IconHeight, 24
    MaskBuffer.Fill vbWhite
    
    ISOverlayRGB MaskBuffer.Pointer, IconWidth, IconHeight, SmallBuffer.Pointer, W, H, XOffset, YOffset, 100
    ICONINFO.hbmMask = ISRGBToHBITMAP(MaskBuffer.Pointer, IconWidth, IconHeight, hPal, ImgX.Support.ScreenDC)
    ICONINFO.hbmMask = CopyImage(ICONINFO.hbmMask, IMAGE_BITMAP, IconWidth, IconHeight, LR_COPYDELETEORG Or LR_MONOCHROME)

    hIcon = CreateIconIndirect(ICONINFO)


    '
    'Create an OLE Picture Object encapsulating the Icon
    '
    Set CreateIcon = pBitmapToPicture(hIcon, hPal, PICTYPE_ICON)
    RaiseMemoryStatus
End Function

Public Sub Fill(ByVal Color As OLE_COLOR)
    '
    '  This sub is an example of pushing VB to the extreme.  We will define an empty byte array
    'and overwrite the SafeArray structure pointing it to the GlobalAlloced buffer.  VB will
    'think it created it. We must free it up before we leave or there will be problems under
    'Windows NT.
    '
    
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim R               As Byte
    Dim G               As Byte
    Dim B               As Byte
    Dim X               As Long
    Dim Y               As Long
    
    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = pPointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = Height
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = Width
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = IIf(pColorDepth = 8, 1, 3)
    
    R = Color Mod 256
    G = Color \ 256 Mod 256
    B = Color \ 65536 Mod 256

    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4     'Overwite the variable
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
        
    For Y = 0 To Height - 1
        For X = 0 To Width - 1
            If pColorDepth = 24 Then
                bRGB(0, X, Y) = R
                bRGB(1, X, Y) = G
                bRGB(2, X, Y) = B
            Else
                bRGB(0, X, Y) = 0   'Index into the palette
            End If
        Next X
    Next Y
    
    If pColorDepth = 8 Then pPalette(0) = Color
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!

End Sub

Public Sub SetBuffer(NewPointer As Long, NewWidth As Long, NewHeight As Long, NewColorDepth As Long)
    Debug.Assert NewWidth > 1
    Debug.Assert NewHeight > 1
    Debug.Assert NewColorDepth = 8 Or NewColorDepth = 24
    
    If NewPointer = 0 Then Exit Sub
    
    Set pPicture = Nothing
    If pDIBPointer Then GlobalFree pDIBPointer: pDIBPointer = 0
    If pPointer Then GlobalFree pPointer
    
    pPointer = NewPointer
    pWidth = NewWidth
    pHeight = NewHeight
    pColorDepth = NewColorDepth
    
    RaiseMemoryStatus
End Sub

Private Sub Class_Initialize()
    ReDim pPalette(0 To 255) As Long
End Sub

Private Sub Class_Terminate()
    Set pPicture = Nothing
    If pDIBPointer Then GlobalFree pDIBPointer
    If pPointer Then GlobalFree pPointer
End Sub

Public Function Copy(Optional DuplicateImageData As Boolean = True, Optional lColorBits As Long) As ImgX_Buffer
    '
    'This function will create and return a new image buffer with the same
    'dimensions and bit depth as the original.  If the DuplicateImageData
    'parameter is set then the new buffer will contain a copy of the image
    'in the original buffer.  If the memory cannot be allocated, then Nothing
    'is returned.
    'If lColorBits = 0 then a copy with the same BPP as the original is made.
    'Otherwise, a copy of the requested size is made.  If DiplicateImageData
    'is True and the image data doesn't fit in a buffer of lColorBits then an
    'error will be raised.
    
    Dim BufferSize  As Long
    Dim CopyPointer As Long
    Dim Pal()       As Long
    
    Debug.Assert pPointer
    Debug.Assert lColorBits = 0 Or lColorBits = 8 Or lColorBits = 24
    
    If lColorBits = 0 Then lColorBits = pColorDepth
    
    If DuplicateImageData And pColorDepth = 24 And lColorBits < 24 Then
        If Colors > 2 ^ lColorBits Then RaiseError 5, "ImgX.Buffer.Copy", "Image does not fit in an " & lColorBits & " bit buffer."
    End If
    
    If DuplicateImageData Then
        
        BufferSize = Width * Height
        If lColorBits = 24 Then BufferSize = BufferSize * 3
            
        CopyPointer = GlobalAlloc(GMEM_FIXED, BufferSize)
        If CopyPointer = 0 Then RaiseError ixeOutOfMemory, "ImgX.Buffer.Copy.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
        
        If lColorBits = pColorDepth Then
            CopyMemoryPtr CopyPointer, pPointer, BufferSize
            Pal = pPalette
        Else
            If pColorDepth = 24 Then
                ReDim Pal(0 To 255) As Long
                ISQuantizeRGBTo8Bit pPointer, pWidth, pHeight, CopyPointer, 256, Pal(0)
            Else    '8 bits
                IS8BitToRGB pPointer, CopyPointer, pWidth, pHeight, 256, pPalette(0)
            End If
        End If
        
        Set Copy = New ImgX_Buffer
        Copy.SetBuffer CopyPointer, pWidth, pHeight, lColorBits
        If lColorBits < 24 Then Copy.Palette = Pal
    Else
    
        Set Copy = New ImgX_Buffer
        If Not Copy.Allocate(Width, Height, lColorBits) Then
            Set Copy = Nothing
            Exit Function
        End If

    End If
    
    RaiseMemoryStatus
End Function

Public Function Allocate(W As Long, H As Long, Optional lColorBits As Long = 24) As Boolean
    '
    'This function will create a buffer of the specified width, height and bit depth. If
    'it cannot allocate the memory, then it returns false
    '
    Debug.Assert lColorBits = 8 Or lColorBits = 24
    Debug.Assert W > 0 And H > 0
    
    If pPointer Then GlobalFree pPointer
    
    If lColorBits = 8 Then
        pPointer = GlobalAlloc(GMEM_FIXED, W * H)
    Else
        pPointer = GlobalAlloc(GMEM_FIXED, W * H * 3)
    End If
    
    Allocate = pPointer
    pColorDepth = lColorBits
    pWidth = W
    pHeight = H
    
    RaiseMemoryStatus
End Function


