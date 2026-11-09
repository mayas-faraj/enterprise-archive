VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Event Progress(Percent As Long, Cancel As Boolean)
Public Event Changed()
Public Event MemoryStatus(ByVal PercentUsed As Long, ByVal Physical As Double, ByVal PhysicalUsed As Double, ByVal SwapFile As Double, ByVal SwapFileUsed As Double, ByVal Virtual As Double, ByVal VirtualUsed As Double)

Private WithEvents pBuffer         As ImgX_Buffer          'Stores the actual data for the current image
Attribute pBuffer.VB_VarHelpID = -1
Private WithEvents pEffects        As ImgX_Effects         'All the effect functions
Attribute pEffects.VB_VarHelpID = -1
Private WithEvents pText           As ImgX_Text            'All the Font Attributes and functions
Attribute pText.VB_VarHelpID = -1
Private WithEvents pImport         As ImgX_Import          'All the Importing functions
Attribute pImport.VB_VarHelpID = -1
Private WithEvents pExport         As ImgX_Export          'All the Exporting functions
Attribute pExport.VB_VarHelpID = -1
Private pSupport        As ImgX_Support         'Houses all the various supporting functions and properties
Private pTextBlocks     As ImgX_TextBlocks      'Stores any text associated with an Image (JPG & PNG)

Private pPicture        As IPicture             'Points to the picture object if there is one
Private pChanged        As Boolean              'Set when image data changes.  Reset during save
Private pDoingProgress  As Boolean              'True while Progress is active

Private pUndoBuffers()  As ImgX_Buffer          'Dynamic Array of Pics in RGB format
Private pUndoText()     As String               'Dynamic Array of Undo strings
Private pMaxUndos       As Long                 'Set in the UndoCount Property Let
Private pUndos          As Long                 'Number of available Undos
Private pRedos          As Long                 'Number of available Redos

Private pInitialized    As Boolean              'Initialized flag on each ImgX object

Private pAttrBMPUseRLE          As Boolean      'Should 8bit BMPs be saved with Run Length Encoding? Defaults to False
Private pAttrJPGInterlaced      As Boolean      'Save JPG and PNG interlaced/progressive Defaults to False
Private pAttrJPGQuality         As Long         'Quality to save JPGs 1..100  (100 is best)
Private pAttrWMFPlaceable       As Boolean      'Should saved WMFs be placeable?  See ImgSource for an explanation
Private pAttrJPGConcatKey       As Boolean      'JPG does not support Keys for textfield.  If one is given, should it be concatenated to the from of the text?
Private pAttrJPGDCT             As Long         'Compression Type.  0=Default, 1=Slow/Accurate, 2=Slow/NotAccurate and 3=FloatingPoint/SuperSlow/SuperAccurate
Private pAttrFireChanged        As Boolean      'Should the Change Event be fired when the picture changes? Defaults to True
Private pAttrFireProgress       As Boolean      'Should the progress event be fired?  Defaults to False
Private pAttrFireMemoryStatus   As Boolean      'Should the MemoryStatus Event be fired?  Defaults To False
Private pAttrWMFBackColor       As OLE_COLOR    'BackColor to be used when loading metafiles. Defaults to White
Private pAttrWMFDefWidth        As Long         'Default Width for WMF. Defaults to 640
Private pAttrWMFDefHeight       As Long         'Default Height for WMF. Defaults to 480
Private pAttrPNGGamma           As Double       'Gamma value saved with PNG files. Defaults to 0
Private pAttrIconBackColor      As OLE_COLOR    'BackColor to use when conveting icons to bitmaps.  Defaults to White
Private pAttrHBITMAPType        As Long         '0=CreateDIBitmap, 1=CreateDIBSection.  Defaults to 1
Private pAttrImageType          As ImgX_ImageTypes  'Type of image file
Private pAttrImagePath          As String       'Name of image file with path
Private pAttrImageFile          As String       'Name of Image File without path
Private pAttrDotsPerInchX       As Long         'Read from and saved to TIF, PNG and JPG files
Private pAttrDotsPerInchY       As Long         'Read from and saved to TIF, PNG and JPG files



Friend Property Get f_Picture() As IPicture
    Set f_Picture = pBuffer.Picture
End Property


Friend Sub f_RaiseMemoryStatus()
    Dim M   As MEMSTATUS
    Dim Meg#, TPM#, APM#, TPF#, APF#, TVM#, AVM#
    
    If pAttrFireMemoryStatus Then
        
        GlobalMemoryStatus M
        Meg = (2 ^ 20) / 100   '1 Megabyte diveded by 100
        
        TPM = CLng(M.dwTotalPhys / Meg) / 100
        APM = CLng(M.dwAvailPhys / Meg) / 100
        TPF = CLng(M.dwTotalPageFile / Meg) / 100
        APF = CLng(M.dwAvailPageFile / Meg) / 100
        TVM = CLng(M.dwTotalVirtual / Meg) / 100
        AVM = CLng(M.dwAvailVirtual / Meg) / 100
        
        RaiseEvent MemoryStatus(M.dwMemoryLoad, TPM, APM, TPF, APF, TVM, AVM)
    
    End If
End Sub

Friend Property Get Initialized() As Boolean
    Initialized = gInitialized
End Property

Public Property Get IsEmpty() As Boolean
    IsEmpty = pBuffer.IsEmpty
End Property

Public Sub UndoAddLevel(ByVal UndoText As String)
    If pBuffer.IsEmpty Then Exit Sub
    
    Dim Buffer As ImgX_Buffer
    
    Set Buffer = pBuffer.Copy
    If Buffer Is Nothing Then Err.Raise ixeOutOfMemory, "ImgX.UndoAddLevel.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    f_SetBuffer Buffer, UndoText
End Sub


Public Property Let IsChanged(ByVal NewVal As Boolean)
    pChanged = NewVal
End Property

Public Property Get Effects() As ImgX_Effects
    Set Effects = pEffects
End Property
Public Property Get Export() As ImgX_Export
    Set Export = pExport
End Property

Public Property Get Import() As ImgX_Import
    Set Import = pImport
End Property

Public Property Get Support() As ImgX_Support
    Set Support = pSupport
End Property

Public Property Get Text() As ImgX_Text
    Set Text = pText
End Property

Public Property Get Info() As String
    If Width = 0 Then
        Info = "No Image"
    Else
        Info = IIf(Len(pAttrImageFile), UCase(pAttrImageFile) & "  -  ", "") & Width & "x" & Height & " Pixels  -  " & Format(Colors, "#,###") & " Colors"
    End If
End Property


Public Property Let Pixel(ByVal X As Long, ByVal Y As Long, ByVal Color As OLE_COLOR)
    
    If pBuffer.IsEmpty Then Err.Raise 5, "ImgX.Pixel", "The ImgX object does not contain any image data."
    
    pBuffer.ConserveMemory Demote:=False    'Make the Picture and DIBPointer be built again
    
    If OleTranslateColor((Color), 0, Color) Then Color = -1
    
    If Color = -1 Then Err.Raise 5, "ImgX.Pixel", "Invalid Color Parameter"
    
    If X < 0 Or X >= pBuffer.Width Then Err.Raise 5, "ImgX.Pixel", "Invalid value for X."
    If Y < 0 Or Y >= pBuffer.Height Then Err.Raise 5, "ImgX.Pixel", "Invalid value for Y."
    
    pChanged = True
    pBuffer.ChangeColorDepth 24
    
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = pBuffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = pBuffer.Height
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = pBuffer.Width
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
        
    bRGB(0, X, Y) = Color Mod 256
    bRGB(1, X, Y) = Color \ 256 Mod 256
    bRGB(2, X, Y) = Color \ 65536 Mod 256

    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4
        
End Property

Public Property Get Pixel(ByVal X As Long, ByVal Y As Long) As OLE_COLOR
        
    If pBuffer.IsEmpty Then Err.Raise 5, "ImgX.Pixel", "The ImgX object does not contain any image data."
    
    If X < 0 Or X >= pBuffer.Width Then Err.Raise 5, "ImgX.Pixel", "Invalid value for X."
    If Y < 0 Or Y >= pBuffer.Height Then Err.Raise 5, "ImgX.Pixel", "Invalid value for Y."
    
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim Pal()           As Long
    
    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = pBuffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = pBuffer.Height
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = pBuffer.Width
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = IIf(pBuffer.ColorDepth = 8, 1, 3)
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
        
    If pBuffer.ColorDepth = 24 Then
        Pixel = RGB(bRGB(0, X, Y), bRGB(1, X, Y), bRGB(2, X, Y))
    Else
        Pal = pBuffer.Palette
        Pixel = RGB(Pal(bRGB(0, X, Y)) / 65536 Mod 256, Pal(bRGB(0, X, Y)) / 256 Mod 256, Pal(bRGB(0, X, Y)) Mod 256)
    End If
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4
        
End Property

Friend Property Get f_Buffer() As ImgX_Buffer
    Set f_Buffer = pBuffer
End Property





Friend Sub f_StopProgress()
    '
    'Shutdown Progress if needed and always end with a 100%
    '
    If pDoingProgress Then
        ISSetCallback 0
        If LastProgressValue < 100 Then RaiseEvent Progress(100, False)
        LastProgressValue = -1
        Set CurrentImgX = Nothing
        pDoingProgress = False
    End If

End Sub

Friend Sub f_StartProgress(Source As String)
    '
    'If Progress is wanted then set callback and always start off with a 0.
    '
    
    Dim Cancel      As Boolean
    
    If CurrentImgX Is Nothing And pAttrFireProgress Then
        Set CurrentImgX = Me
        pDoingProgress = True
        ISSetCallback AddressOf Callback
        RaiseEvent Progress(0, Cancel)
        LastProgressValue = 0
        If Cancel Then f_RaiseError ixeOperationAborted, Source & ".f_StartProgress", pGetErrorDesc(ixeOperationAborted)
    End If

End Sub



Friend Sub f_RaiseError(Number&, Source$, Optional Description$)
    If pDoingProgress Then f_StopProgress
    Err.Raise Number, Source, Description
End Sub






Friend Sub f_SetBuffer(Buffer As ImgX_Buffer, UndoText As String)
    'This helper function is called by all the functions that alter the image.
    'It takes an image buffer and also some text explaining what was done so that
    'the user can display it in an undo menu.  If for some reason, the change is
    'not wished to be recored as an undo level, then the UndoText parameter can
    'contain the text "No Undo"
    
    Dim I           As Long
    
    'On Error GoTo Hell:    'Testing purposes only! / Don't leave this uncommented!
    
    pChanged = True
    
    Debug.Assert Not Buffer.IsEmpty
    
    If StrComp(UndoText, "No Undo", vbTextCompare) Then
    
        If pMaxUndos = 0 Or pBuffer.IsEmpty Then
            Set pBuffer = Buffer                                 'UndoText is ignored for first pic
            f_RaiseMemoryStatus
            If pAttrFireChanged Then RaiseEvent Changed
            Exit Sub
        End If
        
        'Once we do something that creates an Undo, all Redos are invalid.
        For I = pUndos To pUndos + pRedos - 1
            pUndoText(I) = ""
        Next I
        pRedos = 0
        
        'If we've already used all of the undos then we need to push all the
        'Undo values down one, losing the oldest one.  this leaves a new one
        If pUndos = pMaxUndos Then
            For I = 0 To pUndos - 2
                Set pUndoBuffers(I) = pUndoBuffers(I + 1)
                pUndoText(I) = pUndoText(I + 1)
            Next I
            pUndos = pUndos - 1
        End If
        
        pBuffer.ConserveMemory
        Set pUndoBuffers(pUndos) = pBuffer
        pUndoText(pUndos) = Trim$(UndoText)
        pUndos = pUndos + 1
    
    End If
    
    Set pBuffer = Buffer
    f_RaiseMemoryStatus
    If pAttrFireChanged Then RaiseEvent Changed
Exit Sub

Hell:
    MsgBox Err.Number & " - " & Err.Description, , "f_SetBuffer"
    Resume Next
End Sub

Public Property Get TextBlocks() As ImgX_TextBlocks
    Set TextBlocks = pTextBlocks
End Property

Public Property Let UndoCount(ByVal Count As Long)
    'When the user chooses an UndoCount (ImgX.UndoCount = n) the array
    'of UndoPics is dynamically redimensioned to be able to hold to up to
    'that number of ImgX_Buffer objects.  If they increase the number of
    'undos (Count > pMaxUndos) then the array is simply redimed larger
    'preserving the original pointers in the lower elements.  If however,
    'they decrease the number of undos (Count < pMaxUndos) then before
    'preserving, we need to move the most recent undos down to the lower
    'elements. so that we retain the most recent undos and throw away the
    'older ones.
    
    Dim I&
    
    If Count <= 0 Then
        pMaxUndos = 0
        pUndos = 0
        pRedos = 0
'        ReDim pUndoBuffers(0) As ImgX_Buffer
'        ReDim pUndoText(0) As String
        Erase pUndoText
        
        Exit Property
    End If
    
    If Count < pMaxUndos Then
        ReDim pUndoBuffers(0 To Count - 1) As ImgX_Buffer
        ReDim pUndoText(0 To Count - 1) As String
        pMaxUndos = Count
        pUndos = 0
        pRedos = 0
    Else
        ReDim Preserve pUndoBuffers(0 To Count - 1) As ImgX_Buffer
        ReDim Preserve pUndoText(0 To Count - 1) As String
        pMaxUndos = Count
    End If
End Property
Public Property Get UndoCount() As Long
    UndoCount = pUndos
End Property
Public Property Get RedoCount() As Long
    RedoCount = pRedos
End Property
Public Property Get UndoText(Optional UndoItem As Long = 0) As String
    If UndoItem < 0 Or UndoItem >= pUndos Then Exit Property 'Return Nothing if invalid UndoItem
    UndoText = pUndoText(pUndos - 1 - UndoItem)
End Property
Public Property Get RedoText(Optional ByVal RedoItem As Long = 0) As String
    If RedoItem < 0 Or RedoItem >= pRedos Then Exit Property 'Return nothing if invalid RedoItem
    RedoText = pUndoText(pUndos + RedoItem)
End Property
Public Sub Undo()
    If pUndos = 0 Then Exit Sub
    
    Dim TempBuffer As ImgX_Buffer
    
    '
    'Force the Picture object to be rebuilt when the Picture Property is accessed.
    '
    
    pBuffer.ConserveMemory
    
    Set TempBuffer = pBuffer
    Set pBuffer = pUndoBuffers(pUndos - 1)
    Set pUndoBuffers(pUndos - 1) = TempBuffer
    
    pUndos = pUndos - 1
    pRedos = pRedos + 1
    
    If pAttrFireChanged Then RaiseEvent Changed
    
End Sub
Public Sub Redo()
    If pRedos = 0 Then Exit Sub      'Err.Raise 5, "ImgX.Redo"
    
    Dim TempBuffer  As ImgX_Buffer
    
    '
    'Force the Picture object to be rebuilt when the Picture Property is accessed.
    '
    pBuffer.ConserveMemory
    
    Set TempBuffer = pBuffer
    Set pBuffer = pUndoBuffers(pUndos)
    Set pUndoBuffers(pUndos) = TempBuffer
    
    pUndos = pUndos + 1
    pRedos = pRedos - 1
    
    If pAttrFireChanged Then RaiseEvent Changed
End Sub


Friend Sub f_RaiseProgress(Percent As Long, Cancel As Boolean)
    RaiseEvent Progress(Percent, Cancel)
End Sub

Friend Sub f_OverlayBuffer(TopBuffer As ImgX_Buffer, BottomBuffer As ImgX_Buffer, ByVal L As Long, ByVal T As Long, ByVal Opacity As Long, ByVal TranspColor As OLE_COLOR)

    '
    'This is a helper function to actually do the overlaying.  This is called from
    'Overlay(), pDrawText() and ResizeCanvas()
    'If needed, f_OverlayBuffer allocates a cropped copy of the top image.  Then the top
    'image is overlayed onto the bottom.  The bottom buffer is altered with the overlay/
    'If an error occurs then the calling function better catch it because the RGB buffers
    'passed in probably need to be cleaned up.  They can reraise it if need be.
    '
    'All parameters are expected to be valid since this is only called internally
    
    Dim TempBuffer  As ImgX_Buffer
    
    Dim RC          As Boolean
    Dim CropL&, CropT&, CropW&, CropH&

    TopBuffer.ChangeColorDepth 24
    BottomBuffer.ChangeColorDepth 24
    
    '
    'Do we need to crop?
    '
    If L < 0 Or T < 0 Or L + TopBuffer.Width > BottomBuffer.Width Or T + TopBuffer.Height > BottomBuffer.Height Then
        If L < 0 Then CropL = -L:   L = 0
        If T < 0 Then CropT = -T:   T = 0
        CropW = TopBuffer.Width - CropL
        CropH = TopBuffer.Height - CropT
        CropW = IIf(CropW < BottomBuffer.Width, CropW, BottomBuffer.Width)
        CropH = IIf(CropH < BottomBuffer.Height, CropH, BottomBuffer.Height)
        
        Set TempBuffer = New ImgX_Buffer
        If Not TempBuffer.Allocate(CropW, CropH, 24) Then Err.Raise ixeOutOfMemory, ".GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)

        If ISCropRGB(TopBuffer.Pointer, TopBuffer.Width, TopBuffer.Height, TempBuffer.Pointer, CropL, CropT, CropL + CropW, CropT + CropH) = False Then
            Err.Raise pGetLastError, ".ISCropRGB", pGetErrorDesc(pGetLastError)
        End If
    
        Set TopBuffer = TempBuffer
    End If
    
    '
    'Perform the action.
    '
    If TranspColor = -1 Then
        RC = ISOverlayRGB(BottomBuffer.Pointer, BottomBuffer.Width, BottomBuffer.Height, _
                TopBuffer.Pointer, TopBuffer.Width, TopBuffer.Height, L, T, Opacity / 100)
        
   
    Else
        RC = ISOverlayRGBTrans(BottomBuffer.Pointer, BottomBuffer.Width, BottomBuffer.Height, _
                TopBuffer.Pointer, TopBuffer.Width, TopBuffer.Height, L, T, Opacity / 100, TranspColor)
    End If
    
    
    If RC = False Then f_RaiseError pGetLastError, ".ISOverlayRGB", pGetErrorDesc(pGetLastError)
End Sub


Public Property Get Colors() As Long
    Colors = pBuffer.Colors
End Property


Public Property Get Height() As Long
    Height = pBuffer.Height
End Property





Public Sub Render(ByVal hDC As Long, Optional ByVal FromX As Long, Optional ByVal FromY As Long, Optional ByVal FromW As Long, Optional ByVal FromH As Long, Optional ByVal ToX As Long = 0, Optional ByVal ToY As Long, Optional ByVal ToW As Long, Optional ByVal ToH As Long, Optional ByVal RasterOp As ImgX_RasterOps = ixroSrcCopy)
    If pBuffer.IsEmpty Then Exit Sub
    
    Dim RC              As Long
    Dim OldStretchMode  As Long
    Dim CAPS            As Long
    Dim bmInfo          As BitmapInfoHeader
    Dim Palette         As Long
    
    CAPS = GetDeviceCaps(hDC, RASTERCAPS)
    
    If pBuffer.IsEmpty Then f_RaiseError 5, "ImgX.Render", "No Image Data"

    If CAPS And RC_STRETCHDIB = 0 Then f_RaiseError 5, "ImgX.Render", "Device does not support raster operations"
    If CAPS And RC_BITMAP64 = 0 And pBuffer.Width * pBuffer.Height > 65535 Then f_RaiseError 5, "ImgX.Render", "Device does not support images greater than 64k"
    
    If FromW < 0 Then f_RaiseError 5, "ImgX.Render", "Invalid FromW Parameter"
    If FromH < 0 Then f_RaiseError 5, "ImgX.Render", "Invalid FromH Parameter"
    If ToW < 0 Then f_RaiseError 5, "ImgX.Render", "Invalid ToW Parameter"
    If ToH < 0 Then f_RaiseError 5, "ImgX.Render", "Invalid ToH Parameter"
    
    If FromW = 0 Then FromW = pBuffer.Width
    If FromH = 0 Then FromH = pBuffer.Height
    If ToW = 0 Then ToW = FromW
    If ToH = 0 Then ToH = FromH
    
    Select Case RasterOp
        Case ixroBlackness, ixroDstInvert, ixroMergeCopy, ixroMergePaint, ixroNotSrcCopy, _
            ixroNotSrcErase, ixroPatCopy, ixroPatInvert, ixroPatPaint, ixroSrcAnd, ixroSrcCopy, _
            ixroSrcErase, ixroSrcInvert, ixroSrcPaint, ixroWhiteness
        
        Case Else
            f_RaiseError 5, "ImgX.Render", "Invalid RasterOp Parameter"
    End Select
    
    CopyMemoryPtrToBIH bmInfo, pBuffer.DIBPointer, Len(bmInfo)
    
    Palette = bmInfo.biClrUsed   'Number of colors
    If Palette = 0 Then Palette = 2 ^ (bmInfo.biBitCount - 1)
    If bmInfo.biBitCount = 24 Then Palette = 0
    
    Palette = pBuffer.DIBPointer + bmInfo.biSize + Palette * 4 '4 bytes per RGBQUAD
    
    OldStretchMode = SetStretchBltMode(hDC, STRETCH_DELETESCANS)
    
    RC = StretchDIBits(hDC, ToX, ToY, ToW, ToH, FromX, pBuffer.Height - (FromY + FromH), FromW, FromH, Palette, pBuffer.DIBPointer, 0, RasterOp)
    
    SetStretchBltMode hDC, OldStretchMode
End Sub




Public Property Get IsChanged() As Boolean
    IsChanged = pChanged
End Property

Public Property Get Width() As Long
    Width = pBuffer.Width
End Property

Private Sub Class_Initialize()
    Set pTextBlocks = New ImgX_TextBlocks
    Set pText = New ImgX_Text
    Set pEffects = New ImgX_Effects
    Set pImport = New ImgX_Import
    Set pExport = New ImgX_Export
    Set pBuffer = New ImgX_Buffer
    
    If gSupport Is Nothing Then     'Keep one instance of the support object
        Set pSupport = New ImgX_Support
        Set gSupport = pSupport
    Else
        Set pSupport = gSupport
    End If
    
    pAttrBMPUseRLE = False
    pAttrJPGInterlaced = False
    pAttrJPGQuality = 100
    pAttrJPGConcatKey = True
    pAttrFireChanged = True
    pAttrFireProgress = False
    pAttrFireMemoryStatus = False
    pAttrWMFBackColor = vbWhite
    pAttrWMFDefWidth = 640
    pAttrWMFDefHeight = 480
    pAttrWMFPlaceable = True
    pAttrIconBackColor = vbWhite
    pAttrHBITMAPType = 1  '0 = CreateDIBitmap,  1 = CreateDIBSection
    ISSetHBITMAPCreateMethod pAttrHBITMAPType
    
    pAttrDotsPerInchX = (1# / (Screen.TwipsPerPixelX / 1440#))
    pAttrDotsPerInchY = (1# / (Screen.TwipsPerPixelY / 1440#))

End Sub

Private Sub Class_Terminate()
    '
    'Free up all the allocated memory.  Don't want to see Mr Watson, do we?
    '
    Dim I As Long
    
    pTextBlocks.Clear           'Break the circular reference  (See ImgX_TextBlocks and ImgX_TextBlock)
    
    Set pTextBlocks = Nothing   'Not really needed since the variable goes out of scope but what the hell..
    Set pText = Nothing         'Ditto
    Set pEffects = Nothing      'Ditto
    Set pImport = Nothing       'Ditto
    Set pExport = Nothing       'Ditto
    Set pSupport = Nothing      'Ditto
End Sub


Public Sub Initialize(Optional ByVal ImgX_Registration_Code As String)
    On Error Resume Next
    
    If gInitialized Then Exit Sub
    
    
    ISInitialize ""   'Pass your ImgSource code here!
                 

    
    gInitialized = True
    pInitialized = True
    
    
End Sub
Public Property Let Attrib(ByVal Attr As ImgX_Attributes, ByVal NewValue As Variant)
    Select Case Attr
        Case ixaBitsPerPixel
            Err.Raise 5, "ImgX.Attrib(ixaBitsPerPixel)", "ixaBitsPerPixel is read only."
        Case ixaJPGQuality:
            NewValue = CLng(NewValue)
            If NewValue < 1 Or NewValue > 100 Then Err.Raise 5, "ImgX.Attrib(ixaJPGQuality)", "Invalid Value.  Must be within 1 and 100."
            pAttrJPGQuality = NewValue
            
        Case ixaJPGDCT:
            NewValue = CLng(NewValue)
            If NewValue < 0 Or NewValue > 3 Then Err.Raise 5, "ImgX.Attrib(ixaJPGDCT)", "Invalid Value.  Must be 0=Default, 1=Accurate, 2=Fast or 3=FloatingPoint."
            pAttrJPGDCT = NewValue
        
        Case ixaWMFBackColor:
            NewValue = CLng(NewValue)
            NewValue = pSupport.TranslateColor(NewValue)
            If NewValue = -1 Then Err.Raise 5, "ImgX.Attrib(ixaWMFBackColor)", "Invalid Color Value"
            pAttrWMFBackColor = NewValue
        
        Case ixaWMFDefWidth:
            NewValue = CLng(NewValue)
            If NewValue < 1 Then Err.Raise 5, "ImgX.Attrib(ixaWMFDefWidth)", "Invalid Value.  Must be greater than 0."
            pAttrWMFDefWidth = NewValue
        
        Case ixaWMFDefHeight:
            NewValue = CLng(NewValue)
            If NewValue < 1 Then Err.Raise 5, "ImgX.Attrib(ixaWMFDefHeight)", "Invalid Value.  Must be greater than 0."
            pAttrWMFDefHeight = NewValue
        
        Case ixaIconBackColor:
            NewValue = CLng(NewValue)
            NewValue = pSupport.TranslateColor(NewValue)
            If NewValue = -1 Then Err.Raise 5, "ImgX.Attrib(ixaIconBackColor)", "Invalid Color Value"
            pAttrIconBackColor = NewValue
         
        Case ixaHBITMAPType:
            NewValue = CLng(NewValue)
            If NewValue < 0 Or NewValue > 1 Then Err.Raise 5, "ImgX.Attrib(ixaHBITMAPType)", "Invalid Value.  Must be 0=CreateDIBitmap or 1=CreateDIBSection."
            pAttrHBITMAPType = NewValue
            ISSetHBITMAPCreateMethod NewValue
        
        Case ixaDotsPerInchX:
            NewValue = CLng(NewValue)
            If NewValue < 1 Then Err.Raise 5, "ImgX.Attrib(ixaDotsPerInchX)", "Invalid DPI Value."
            pAttrDotsPerInchX = NewValue
            
        Case ixaDotsPerInchY:
            NewValue = CLng(NewValue)
            If NewValue < 1 Then Err.Raise 5, "ImgX.Attrib(ixaDotsPerInchY)", "Invalid DPI Value."
            pAttrDotsPerInchY = NewValue
        
        Case ixaBMPUseRLE:              pAttrBMPUseRLE = CBool(NewValue)
        Case ixaJPGInterlaced:          pAttrJPGInterlaced = CBool(NewValue)
        Case ixaWMFPlaceable:           pAttrWMFPlaceable = CBool(NewValue)
        Case ixaFireChangedEvent:       pAttrFireChanged = CBool(NewValue)
        Case ixaFireProgressEvent:      pAttrFireProgress = CBool(NewValue)
        Case ixaFireMemoryStatusEvent:  pAttrFireMemoryStatus = CBool(NewValue)
        Case ixaJPGConcatKey:           pAttrJPGConcatKey = CBool(NewValue)
        Case ixaPNGGamma:               pAttrPNGGamma = CDbl(NewValue)
        
        Case ixaLastFileName:  Err.Raise 5, "ImgX.Attrib(ixaLastFileName)", "ImgX.Attrib(ixaLastFileName) is Read Only."
        Case ixaLastFilePath:  Err.Raise 5, "ImgX.Attrib(ixaLastFilePath)", "ImgX.Attrib(ixaLastFilePath) is Read Only."
        Case ixaLastFileType:  Err.Raise 5, "ImgX.Attrib(ixaLastFileType)", "ImgX.Attrib(ixaLastFileType) is Read Only."
        
        Case ixaLastFileName - 652:  pAttrImageFile = CStr(NewValue)
        Case ixaLastFilePath - 652:  pAttrImagePath = CStr(NewValue)
        Case ixaLastFileType - 652:  pAttrImageType = CStr(NewValue)
        
        Case Else:             Err.Raise 5, "ImgX.Attrib(ixaLastFileType)", "Invalid Attribute Parameter."
    End Select
End Property
Public Property Get Attrib(ByVal Attr As ImgX_Attributes) As Variant
    Select Case Attr
        Case ixaBitsPerPixel:           Attrib = pBuffer.ColorDepth
        Case ixaBMPUseRLE:              Attrib = pAttrBMPUseRLE
        Case ixaDotsPerInchX:           Attrib = pAttrDotsPerInchX
        Case ixaDotsPerInchY:           Attrib = pAttrDotsPerInchY
        Case ixaJPGInterlaced:          Attrib = pAttrJPGInterlaced
        Case ixaJPGQuality:             Attrib = pAttrJPGQuality
        Case ixaWMFPlaceable:           Attrib = pAttrWMFPlaceable
        Case ixaFireChangedEvent:       Attrib = pAttrFireChanged
        Case ixaFireProgressEvent:      Attrib = pAttrFireProgress
        Case ixaFireMemoryStatusEvent:  Attrib = pAttrFireMemoryStatus
        Case ixaJPGConcatKey:           Attrib = pAttrJPGConcatKey
        Case ixaJPGDCT:                 Attrib = pAttrJPGDCT
        Case ixaWMFBackColor:           Attrib = pAttrWMFBackColor
        Case ixaWMFDefWidth:            Attrib = pAttrWMFDefWidth
        Case ixaWMFDefHeight:           Attrib = pAttrWMFDefHeight
        Case ixaIconBackColor:          Attrib = pAttrIconBackColor
        Case ixaHBITMAPType:            Attrib = pAttrHBITMAPType
        Case ixaLastFileName:           Attrib = pAttrImageFile
        Case ixaLastFilePath:           Attrib = pAttrImagePath
        Case ixaLastFileType:           Attrib = pAttrImageType
        Case ixaPNGGamma:               Attrib = pAttrPNGGamma
    End Select
End Property

Private Sub pBuffer_GetImgX(ImgX As ImgX)
    Set ImgX = Me
End Sub

Private Sub pEffects_GetImgX(ImgX As ImgX)
    Set ImgX = Me
End Sub


Private Sub pExport_GetImgX(ImgX As ImgX)
    Set ImgX = Me
End Sub

Private Sub pImport_GetImgX(ImgX As ImgX)
    Set ImgX = Me
End Sub

Private Sub pText_GetImgX(ImgX As ImgX)
    Set ImgX = Me
End Sub






