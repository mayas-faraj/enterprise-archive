VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_Support"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private pScreenDC       As Long                 'Handle to a Screen Device Context

Public Enum ImgX_ImageTypes
    ixtUnknown = 0
    ixtJPG = 1
    ixtPNG = 2
    ixtTIF = 3
    ixtPCX = 4
    ixtTGA = 5
    ixtBMP = 6
    ixtWMF = 7
'    ixstEMF = 8
End Enum

Public Enum ImgX_ImageSaveTypes
'    ixstUnknown = 0
    ixstJPG = 1
    ixstPNG = 2
    ixstTIF = 3
    ixstPCX = 4
    ixstTGA = 5
    ixstBMP = 6
    ixstWMF = 7
    ixstEMF = 8
End Enum

Public Enum ImgX_ImageMemoryTypes
    ixmtJPG = 1
    ixmtPNG = 2
    ixmtTIF = 3
    ixmtPCX = 4
    ixmtTGA = 5
    ixmtBMP = 6
End Enum

Public Enum ImgX_RasterOps
    ixroBlackness = &H42
    ixroDstInvert = &H550009
    ixroMergeCopy = &HC000CA
    ixroMergePaint = &HBB0226
    ixroNotSrcCopy = &H330008
    ixroNotSrcErase = &H1100A6
    ixroPatCopy = &HF00021
    ixroPatInvert = &H5A0049
    ixroPatPaint = &HFB0A09
    ixroSrcAnd = &H8800C6
    ixroSrcCopy = &HCC0020
    ixroSrcErase = &H440328
    ixroSrcInvert = &H660046
    ixroSrcPaint = &HEE0086
    ixroWhiteness = &HFF0062
End Enum


Const ixErr   As Long = vbObjectError + 652

Public Enum ImgX_Errors
    ixeNotInitialized = ixErr + -1
    ixeNoError = ixErr + 0
    ixeOutOfMemory = ixErr + 1
    ixeFileOpenError = ixErr + 2
    ixeFileReadError = ixErr + 3
    ixeFileWriteError = ixErr + 4
    ixeBadParameter = ixErr + 5
    ixeInvalidBMP = ixErr + 6
    ixeCompressedBMP = ixErr + 7
    ixeInvalidGIF = ixErr + 8
    ixeInvalidJPG = ixErr + 9
    ixeDeviceContextErr = ixErr + 10
    ixeGetDIBitsErr = ixErr + 11
    ixeDisabledGIF = ixErr + 12
    ixeResourceNotFound = ixErr + 13
    ixeOperationAborted = ixErr + 14
    ixeInvalidPNG = ixErr + 15
    ixePNGCreateError = ixErr + 16
    ixeInternalError = ixErr + 17
    ixeFontError = ixErr + 18
    ixeTIFError = ixErr + 19
    ixeInvalidTIF = ixErr + 20
    ixeNoTIFLZW = ixErr + 21
    ixeInvalidPCX = ixErr + 22
    ixeCrtCmpBmpFail = ixErr + 23
    ixeNoLines = ixErr + 24
    ixeGetDIBitsErr2 = ixErr + 25
    ixeOperationNotSupported = ixErr + 26
    ixeInvalidWMF = ixErr + 27
    ixeBitDepthMismatch = ixErr + 28
    ixeBITBLTFailed = ixErr + 29
    ixeBufferTooSmall = ixErr + 30
    ixeTooManyColors = ixErr + 31
    ixeInvalidTGA = ixErr + 32
    ixeNoTGAThumbnail = ixErr + 33
    ixeInvalidGIFVersion = ixErr + 34
    ixeCreateDIBitmapFailed = ixErr + 35
    ixeLZWNotActivated = ixErr + 36
    
    ixeUnknownImage = ixErr + 256
    ixeNoClipBoardBitmap = ixErr + 257
End Enum

Public Enum ImgX_Attributes
    ixaBitsPerPixel = 1
    ixaBMPUseRLE
    ixaDotsPerInchX
    ixaDotsPerInchY
    ixaFireChangedEvent
    ixaFireProgressEvent
    ixaFireMemoryStatusEvent
    ixaHBITMAPType
    ixaIconBackColor
    ixaJPGConcatKey
    ixaJPGDCT
    ixaJPGInterlaced
    ixaJPGQuality
    ixaLastFileName
    ixaLastFilePath
    ixaLastFileType
    ixaPNGGamma
    ixaWMFBackColor
    ixaWMFDefHeight
    ixaWMFDefWidth
    ixaWMFPlaceable
End Enum

Public Enum ImgX_ColorChannels
    ixcBlack = 0
    ixcRED = 1
    ixcGREEN = 2
    ixcYellow = 3
    ixcBLUE = 4
    ixcMagenta = 5
    ixcCyan = 6
    ixcAll = 7
    ixcWhite = 7
End Enum

Public Enum ImgX_PaletteTypes
    ixptCustomPalette
    ixptSystemPalette
    ixptWebPalette
End Enum

'Public Type ImgX_FadeStep
'    LeftPos     As Long
'    TopPos      As Long
'    Opacity     As Long
'    UseOrigRGB  As Boolean
'End Type

Public Enum ImgX_Orientation
    ixoHorizontal
    ixoVertical
End Enum


Public Function TranslateColor(ByVal Color As OLE_COLOR, Optional ByVal Palette As Long = 0) As OLE_COLOR
    If OleTranslateColor(Color, Palette, TranslateColor) Then TranslateColor = -1
End Function

Public Function GetImageInfo(ByVal FileName As String, W As Long, H As Long, BitDepth As Long, Pages As Long) As ImgX_ImageTypes
    '
    'ISGuessFileType tries to guess the image format of the file.  It will return
    '0-Unknown, 1-BMP, 2-GIF, 3-JPG, 4-PNG, 5-PCX, 6-TIFF, 7-WMF or 8-EMF  It can't determine
    'Targa files, so we rely strictly on the extension.
    
    Dim hSrc            As Long
    Dim DetectedType    As Long

    On Error Resume Next
    
    Pages = 1
    
    hSrc = ISOpenFileSource(FileName)
    If hSrc = 0 Then Err.Raise pGetLastError, "GetImageInfo()", pGetErrorDesc(pGetLastError)
    
    DetectedType = ISGuessFileType(hSrc)
    If DetectedType = 0 Then
        Select Case UCase(Right(FileName, 4))
            Case ".BMP":    DetectedType = 1
            Case ".GIF":    DetectedType = 2
            Case ".JPG":    DetectedType = 3
            Case ".PNG":    DetectedType = 4
            Case ".PCX":    DetectedType = 5
            Case ".TIF":    DetectedType = 6
            Case ".WMF":    DetectedType = 7
            Case ".EMF":    DetectedType = 8
            Case ".TGA":    DetectedType = 9
        End Select
    End If
    
    ISSeek hSrc, 0, 0   'Seek to BOF
    
    Select Case DetectedType
        Case 1:     If ISGetBMPDims(hSrc, W, H, BitDepth) Then GetImageInfo = ixtBMP
        Case 2:     GetImageInfo = ixtUnknown
                    'If ISGetGIFDims(hSrc, W, H, BitDepth) Then GetImageInfo = ixtGIF
        Case 3:     If ISGetJPGDims(hSrc, W, H, BitDepth) Then GetImageInfo = ixtJPG
        Case 4:     If ISGetPNGDims(hSrc, W, H, BitDepth) Then GetImageInfo = ixtPNG
        Case 5:     If ISGetPCXDims(hSrc, W, H, BitDepth) Then GetImageInfo = ixtPCX
        Case 6:
                    If ISGetTIFFDims(hSrc, W, H, BitDepth) Then
                        ISSeek hSrc, 0, 0
                        Pages = ISGetTIFFPageCountDirect(hSrc)
                        GetImageInfo = ixtTIF
                    End If
                    
        Case 7, 8:  GetImageInfo = ixtWMF
        Case 9:     If ISGetTGADims(FileName, W, H, BitDepth) Then GetImageInfo = ixtTGA
    End Select
    
    ISCloseSource hSrc
    If GetImageInfo = ixtUnknown Then
        W = 0
        H = 0
        BitDepth = 0
        Pages = 0
    End If
    
End Function

Public Property Get ScreenDC() As Long
    ScreenDC = pScreenDC
End Property

Private Sub Class_Initialize()
    pScreenDC = CreateDCByNum("DISPLAY", vbNullString, vbNullString, 0)
End Sub


Private Sub Class_Terminate()
    DeleteDC pScreenDC
End Sub


Public Function CreateGUID() As String

    Dim GUID    As GUID
    Dim sGUID   As String

    If CoCreateGuid(GUID) Then
        sGUID = ""
    Else
        sGUID = String$(38, 0)
        StringFromGUID2 GUID, StrPtr(sGUID), 39
    End If

    CreateGUID = sGUID

End Function

Public Sub ExtractRGB(ByVal Color As OLE_COLOR, Optional R As Byte, Optional G As Byte, Optional B As Byte)
    
    Color = TranslateColor(Color)   'Convert system colors to RGB
    If Color = -1 Then Err.Raise 5, "ImgX_ExtractRGB", "Bad Color Parameter"

    R = Color Mod 256
    G = Color \ 256 Mod 256
    B = Color \ 65536 Mod 256
End Sub

Public Sub ExtractHSL(ByVal Color As OLE_COLOR, Optional H As Byte, Optional S As Byte, Optional L As Byte)
    
    Dim R As Byte
    Dim G As Byte
    Dim B As Byte
    
    Color = TranslateColor(Color)   'Convert system colors to RGB
    If Color = -1 Then Err.Raise 5, "ImgX_ExtractHSL", "Bad Color Parameter"

    R = Color Mod 256
    G = Color \ 256 Mod 256
    B = Color \ 65536 Mod 256
    
    RGBtoHSL R, G, B, H, S, L
End Sub

Public Sub HSLtoRGB(ByVal H As Byte, ByVal S As Byte, ByVal L As Byte, R As Byte, G As Byte, B As Byte)

    Dim Hue    As Single
    Dim Sat    As Single
    Dim Lum    As Single

    Hue = H / (256 / 6)
    If Hue >= 5 Then Hue = Hue - 6
    Sat = S / 256
    Lum = L / 256

    pHSLtoRGB Hue, Sat, Lum, R, G, B

End Sub
Public Sub RGBtoHSL(ByVal R As Byte, ByVal G As Byte, ByVal B As Byte, H As Byte, S As Byte, L As Byte)

    Dim lHue    As Long
    Dim lSat    As Long
    Dim lLum    As Long
    
    Dim Hue    As Single
    Dim Sat    As Single
    Dim Lum    As Single
    
    pRGBtoHSL R, G, B, Hue, Sat, Lum


    lHue = Hue * (255 / 6)
    If lHue < 0 Then lHue = lHue + 256
    H = lHue
    
    lSat = Sat * 256
    S = IIf(lSat > 255, 255, lSat)
    
    lLum = Lum * 256
    L = IIf(lLum > 255, 255, lLum)
End Sub

Public Property Get ImgSourceVersion() As String
    Dim S$
    Static Ver$
    On Error Resume Next
    
    If Ver <> "" Then ImgSourceVersion = Ver: Exit Property
    S = String(255, 0)
    ISGetDLLVersion S
    Ver = Left$(S, InStr(S, Chr$(0)) - 1)
    ImgSourceVersion = Ver
End Property

Public Property Get ImgXVersion() As String
    ImgXVersion = App.Major & "." & App.Minor & "." & App.Revision
End Property

Public Sub ShowAbout(Optional ByVal FadeInOut As Boolean = True)
        
   ' frmSplash.lblImgSource = "ImgX: " & ImgXVersion() & "  ImgSource: " & ImgSourceVersion()
   ' frmSplash.Initialize FadeInOut
   ' frmSplash.Show vbModal
End Sub



