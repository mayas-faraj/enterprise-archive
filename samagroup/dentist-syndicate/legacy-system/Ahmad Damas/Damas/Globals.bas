Attribute VB_Name = "Globals"
Option Explicit

Global Tawar2_Report_Year As Integer

Public Type RGBBuffer
    Pointer As Long
    ColorBits   As Long     '8 or 24 determines if Pointer points to an 8bit or RGB buffer
    Colors      As Long     'The total number of colors in the image data
    Palette()   As Long     'Array of up to 256 RGBQUADs. Only valid when ColorBits = 8
    Width       As Long     'Width in Pixels
    Height      As Long     'Height in Pixels
    DIBPointer  As Long     'Pointer To Device Independent Bitmap (Created By first call to Render)
End Type

Public Type BITMAP
    bmType          As Long
    bmWidth         As Long
    bmHeight        As Long
    bmWidthBytes    As Long
    bmPlanes        As Integer
    bmBitsPixel     As Integer
    bmBits          As Long
End Type

Public Type PICTDESC
    cbSizeOfStruct  As Long
    PicType         As Long
    hBitmap         As Long
    hPal            As Long
End Type

Public Type GUID
    Data1           As Long
    Data2           As Integer
    Data3           As Integer
    Data4(0 To 7)   As Byte
End Type


Public Type FILETIME
    dwLowDateTime   As Long
    dwHighDateTime  As Long
End Type

Public Type Size
    CX              As Long
    CY              As Long
End Type

Public Type SAFEARRAYBOUND
    cElements       As Long
    lLbound         As Long
End Type

Public Type SAFEARRAY2D
    cDims           As Integer
    fFeatures       As Integer
    cbElements      As Long
    cLocks          As Long
    pvData          As Long
    Bounds(0 To 1)  As SAFEARRAYBOUND
End Type

Public Type SAFEARRAY3D
    cDims           As Integer
    fFeatures       As Integer
    cbElements      As Long
    cLocks          As Long
    pvData          As Long
    Bounds(0 To 2)  As SAFEARRAYBOUND
End Type

Public Type BitmapInfoHeader
    biSize          As Long
    biWidth         As Long
    biHeight        As Long
    biPlanes        As Integer
    biBitCount      As Integer
    biCompression   As Long
    biSizeImage     As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed       As Long
    biClrImportant  As Long
End Type

Public Const GMEM_FIXED = &H0

' The RGBBuffer datatype holds the basic information for an image that is
'currently in memory.  ImgSource allocates memory of type GMEM_FIXED.  This
'returns back a pointer to the memory block.  When we are done with the
'memory block, we must call GlobalFree(Pointer) to free the memory
'

Public Const LF_FACESIZE = 32
Public Type LOGFONT
    lfHeight            As Long
    lfWidth             As Long
    lfEscapement        As Long
    lfOrientation       As Long
    lfWeight            As Long
    lfItalic            As Byte
    lfUnderline         As Byte
    lfStrikeOut         As Byte
    lfCharSet           As Byte
    lfOutPrecision      As Byte
    lfClipPrecision     As Byte
    lfQuality           As Byte
    lfPitchAndFamily    As Byte
    lfFaceName(1 To LF_FACESIZE) As Byte
End Type

Public Type DRAWTEXTPARAMS
    cbSize              As Long
    iTabLength          As Long
    iLeftMargin         As Long
    iRightMargin        As Long
    uiLengthDrawn       As Long
End Type

Public Type RECT
    Left                As Long
    Top                 As Long
    Right               As Long
    Bottom              As Long
End Type

Public Type ICONINFO
    fIcon               As Long
    xHotspot            As Long
    yHotspot            As Long
    hbmMask             As Long
    hbmColor            As Long
End Type

Public Type PALETTEENTRY
    peRed               As Byte
    peGreen             As Byte
    peBlue              As Byte
    peFlags             As Byte
End Type

Public Type MEMSTATUS
    dwLength            As Long
    dwMemoryLoad        As Long
    dwTotalPhys         As Long
    dwAvailPhys         As Long
    dwTotalPageFile     As Long
    dwAvailPageFile     As Long
    dwTotalVirtual      As Long
    dwAvailVirtual      As Long
End Type

Public Declare Function ISOpenFileSource Lib "_ISource.dll" Alias "_ISOpenFileSource" (ByVal pFileName As String) As Long
Public Declare Function ISOpenMemorySource Lib "_ISource.dll" Alias "_ISOpenMemorySource" (ByRef pInBuf As Byte, ByVal uBufLen As Long) As Long
Public Declare Function ISCloseSource Lib "_ISource.dll" Alias "_ISCloseSource" (ByVal hSource As Long) As Long
Public Declare Function ISOpenFileDest Lib "_ISource.dll" Alias "_ISOpenFileDest" (ByVal pFileName As String) As Long
Public Declare Function ISOpenMemoryDest Lib "_ISource.dll" Alias "_ISOpenMemoryDest" (ByVal pOutBuf As Long, ByVal uBufLen As Long) As Long
Public Declare Function ISCloseDest Lib "_ISource.dll" Alias "_ISCloseDest" (ByVal hDest As Long) As Long
Public Declare Function ISSeek Lib "_ISource.dll" Alias "_ISSeek" (ByVal hMgr&, ByVal Offset&, ByVal Origin&) As Boolean
Public Declare Function ISGetSize Lib "_ISource.dll" Alias "_ISGetSize" (ByVal hMgr As Long) As Long

'Get Bitmap File Dimensions
Public Declare Function ISGetJPGDims Lib "_ISource.dll" Alias "_ISGetJPGDims" (ByVal hSource As Long, W As Long, H As Long, ColorBits As Long) As Boolean
Public Declare Function ISGetBMPDims Lib "_ISource.dll" Alias "_ISGetBMPDims" (ByVal hSource As Long, puWidth As Long, puHeight As Long, ColorBits As Long) As Boolean
Public Declare Function ISGetPNGDims Lib "_ISource.dll" Alias "_ISGetPNGDims" (ByVal hSource As Long, puWidth As Long, puHeight As Long, ColorBits As Long) As Boolean
Public Declare Function ISGetPCXDims Lib "_ISource.dll" Alias "_ISGetPCXDims" (ByVal hSource As Long, puWidth As Long, puHeight As Long, ColorBits As Long) As Boolean
Public Declare Function ISGetTGADims Lib "_ISource.dll" Alias "_ISGetTGADims" (ByVal hSource As Long, puWidth As Long, puHeight As Long, ColorBits As Long) As Boolean
Public Declare Function ISGetTIFFDims Lib "_ISource.dll" Alias "_ISGetTIFFDims" (ByVal hSource As Long, puWidth As Long, puHeight As Long, ColorBits As Long) As Boolean
Public Declare Function ISGetTIFFPageCountDirect Lib "_ISource.dll" Alias "_ISGetTIFFPageCountDirect" (ByVal hSource As Long) As Long
Public Declare Function ISGuessFileType Lib "_ISource.dll" Alias "_ISGuessFileType" (ByVal hSource As Long) As Long


'DDB
Public Declare Function ISHBITMAPToRGB Lib "_ISource.dll" Alias "_ISHBITMAPToRGB" (ByVal BITMAP As Long, Width As Long, Height As Long, ByVal hDC As Long, ByVal hPal As Long) As Long
Public Declare Function ISRGBToHBITMAP Lib "_ISource.dll" Alias "_ISRGBToHBITMAP" (ByVal pRGB As Long, ByVal Width As Long, ByVal Height As Long, ByVal hPal As Long, ByVal hDC As Long) As Long
Public Declare Sub ISSetHBITMAPCreateMethod Lib "_ISource.dll" Alias "_ISSetHBITMAPCreateMethod" (ByVal uMethod As Long)

'RGB Read
Public Declare Function ISDCToRGB Lib "_ISource.dll" Alias "_ISDCToRGB" (ByVal hDC&, ByVal x&, ByVal Y&, ByVal W&, ByVal H&) As Long
Public Declare Function ISReadJPGToRGB Lib "_ISource.dll" Alias "_ISReadJPGToRGB" (ByVal hSource As Long, puWidth As Long, puHeight As Long) As Long
Public Declare Function ISReadBMPToRGB Lib "_ISource.dll" Alias "_ISReadBMPToRGB" (ByVal hSource As Long, puWidth As Long, puHeight As Long) As Long
Public Declare Function ISReadPNGToRGB Lib "_ISource.dll" Alias "_ISReadPNGToRGB" (ByVal hSource As Long, puWidth As Long, puHeight As Long) As Long
Public Declare Function ISReadTIFFToRGB Lib "_ISource.dll" Alias "_ISReadTIFFToRGB" (ByVal hSource As Long, puWidth As Long, puHeight As Long) As Long
Public Declare Function ISReadPCXToRGB Lib "_ISource.dll" Alias "_ISReadPCXToRGB" (ByVal hSource As Long, puWidth As Long, puHeight As Long) As Long
Public Declare Function ISReadTGAToRGB Lib "_ISource.dll" Alias "_ISReadTGAToRGB" (ByVal hSource As Long, puWidth As Long, puHeight As Long) As Long
Public Declare Function ISReadMetafileToRGB Lib "_ISource.dll" Alias "_ISReadMetafileToRGB" (ByVal pFileName As String, puWidth As Long, puHeight As Long, ByVal uDefWidth As Long, ByVal uDefHeight As Long, ByVal clrBackground As Long) As Long
Public Declare Function ISReadTIFFPageToRGBDirect Lib "_ISource.dll" Alias "_ISReadTIFFPageToRGBDirect" (ByVal hSource As Long, puWidth As Long, puHeight As Long, ByVal uFrameIdx As Long) As Long

'RGB Write (24-bit)
Public Declare Function ISWriteRGBToJPG Lib "_ISource.dll" Alias "_ISWriteRGBToJPG" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal Compression As Long, ByVal Progressive As Boolean) As Long
Public Declare Function ISWriteRGBToBMP Lib "_ISource.dll" Alias "_ISWriteRGBToBMP" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Long
Public Declare Function ISWriteRGBToTIFF Lib "_ISource.dll" Alias "_ISWriteRGBToTIFF" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Long
Public Declare Function ISWriteRGBToPCX Lib "_ISource.dll" Alias "_ISWriteRGBToPCX" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Long
Public Declare Function ISWriteRGBToTGA Lib "_ISource.dll" Alias "_ISWriteRGBToTGA" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Long
Public Declare Function ISWriteRGBToWMF Lib "_ISource.dll" Alias "_ISWriteRGBToWMF" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal Placeable As Long) As Long
Public Declare Function ISWriteRGBToEMF Lib "_ISource.dll" Alias "_ISWriteRGBToEMF" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Long
Public Declare Function ISWriteRGBToPNG Lib "_ISource.dll" Alias "_ISWriteRGBToPNG" (ByVal hDest As Long, ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal Gamma As Double) As Long


'RGB Write (8-bit)
Public Declare Function ISWrite8BitGrayscaleToJPG Lib "_ISource.dll" Alias "_ISWrite8BitGrayscaleToJPG" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal uQuality As Long, ByVal uProgressive As Boolean) As Long
Public Declare Function ISWrite8BitToBMP Lib "_ISource.dll" Alias "_ISWrite8BitToBMP" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, pPal As Long) As Long
Public Declare Function ISWrite8BitRLEToBMP Lib "_ISource.dll" Alias "_ISWrite8BitRLEToBMP" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, pPal As Long, ByVal uColors As Long) As Long
Public Declare Function ISWrite8BitToTGA Lib "_ISource.dll" Alias "_ISWrite8BitToTGA" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, pPal As Long) As Long
Public Declare Function ISWrite8BitToTIFF Lib "_ISource.dll" Alias "_ISWrite8BitToTIFF" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, pPal As Long) As Long
Public Declare Function ISWrite8BitToPCX Lib "_ISource.dll" Alias "_ISWrite8BitToPCX" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, pPal As Long) As Long
Public Declare Function ISWrite8BitToPNG Lib "_ISource.dll" Alias "_ISWrite8BitToPNG" (ByVal hDest As Long, ByVal pMap As Long, ByVal uWidth As Long, ByVal uHeight As Long, pPal As Long, ByVal fGammaVal As Double) As Long

'PNG Text/Notes Functions
Public Declare Function ISGetPNGInputTextCount Lib "_ISource.dll" Alias "_ISGetPNGInputTextCount" () As Long
Public Declare Function ISGetPNGInputText Lib "_ISource.dll" Alias "_ISGetPNGInputText" (ByVal uIndex As Long, pKey As Long, pText As Long, puCompression As Long) As Boolean
Public Declare Function ISClearPNGInputText Lib "_ISource.dll" Alias "_ISClearPNGInputText" () As Boolean
Public Declare Function ISGetPNGOutputTextCount Lib "_ISource.dll" Alias "_ISGetPNGOutputTextCount" () As Long
Public Declare Function ISGetPNGOutputText Lib "_ISource.dll" Alias "_ISGetPNGOutputText" (ByVal uIndex As String, pKey As String, pText As String, puCompression As Long) As Boolean
Public Declare Function ISClearPNGOutputText Lib "_ISource.dll" Alias "_ISClearPNGOutputText" () As Boolean
Public Declare Function ISAddPNGOutputText Lib "_ISource.dll" Alias "_ISAddPNGOutputText" (ByVal pText As String, ByVal pKey As String, ByVal bCompress As Long) As Boolean

'JPG Text/Notes Functions
Public Declare Function ISGetJPGInputTextCount Lib "_ISource.dll" Alias "_ISGetJPGInputTextCount" () As Long
Public Declare Function ISGetJPGInputText Lib "_ISource.dll" Alias "_ISGetJPGInputText" (ByVal uIndex As Long) As Long
Public Declare Function ISClearJPGInputText Lib "_ISource.dll" Alias "_ISClearJPGInputText" () As Boolean
Public Declare Function ISGetJPGOutputTextCount Lib "_ISource.dll" Alias "_ISGetJPGOutputTextCount" () As Long
Public Declare Function ISGetJPGOutputText Lib "_ISource.dll" Alias "_ISGetJPGOutputText" (ByVal uIndex As Long) As Long
Public Declare Function ISClearJPGOutputText Lib "_ISource.dll" Alias "_ISClearJPGOutputText" () As Boolean
Public Declare Function ISAddJPGOutputText Lib "_ISource.dll" Alias "_ISAddJPGOutputText" (ByVal text As String) As Boolean

'DPI Functions

Public Declare Function ISGetLastPNGInputDPI Lib "_ISource.dll" Alias "_ISGetLastPNGInputDPI" (DPIX As Long, DPIY As Long, Units As Long) As Boolean
Public Declare Function ISGetLastJPGInputDPI Lib "_ISource.dll" Alias "_ISGetLastJPGInputDPI" (DPIX As Long, DPIY As Long, Units As Long) As Boolean
Public Declare Function ISGetLastTIFFInputDPI Lib "_ISource.dll" Alias "_ISGetLastTIFFInputDPI" (DPIX As Long, DPIY As Long, Units As Long) As Boolean
Public Declare Sub ISSetPNGOutputDPI Lib "_ISource.dll" Alias "_ISSetPNGOutputDPI" (ByVal DPIX As Long, ByVal DPIY As Long, ByVal Units As Long)
Public Declare Sub ISSetJPGOutputDPI Lib "_ISource.dll" Alias "_ISSetJPGOutputDPI" (ByVal DPIX As Long, ByVal DPIY As Long, ByVal Units As Long)
Public Declare Sub ISSetTIFFOutputDPI Lib "_ISource.dll" Alias "_ISSetTIFFOutputDPI" (ByVal DPIX As Long, ByVal DPIY As Long, ByVal Units As Long)






'Text Drawing functions
Public Declare Function ISDrawTextOnRGB2 Lib "_ISource.dll" Alias "_ISDrawTextOnRGB2" (ByVal pRGB As Long, ByVal W As Long, ByVal H As Long, ByVal pText As String, pLogFont As LOGFONT, ByVal x As Long, ByVal Y As Long, ByVal Color As Long) As Boolean

'RGB manipulations
Public Declare Function ISCountRGBColors Lib "_ISource.dll" Alias "_ISCountRGBColors" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal bFast As Long) As Long
Public Declare Function ISVertFlipBuf Lib "_ISource.dll" Alias "_ISVertFlipBuf" (ByVal pBuffer As Long, ByVal uWidthBytes As Long, ByVal uHeight As Long) As Boolean
Public Declare Function ISFlipHorizontalRGB Lib "_ISource.dll" Alias "_ISFlipHorizontalRGB" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Boolean
Public Declare Function ISRGBToGrayScale24 Lib "_ISource.dll" Alias "_ISRGBToGrayScale24" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Boolean
Public Declare Function ISRGBToGrayScale8Bit Lib "_ISource.dll" Alias "_ISRGBToGrayScale8Bit" (ByVal RGB&, ByVal W&, ByVal H&, ByVal Gray&) As Boolean
Public Declare Function ISQuickRotateRGB Lib "_ISource.dll" Alias "_ISQuickRotateRGB" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal uRotate As Long) As Boolean
Public Declare Function ISRotateRGB Lib "_ISource.dll" Alias "_ISRotateRGB" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal fRadians As Double, ByVal clrBack As Long, puOutWidth As Long, puOutHeight As Long) As Long
Public Declare Function ISRGBToBGR Lib "_ISource.dll" Alias "_ISRGBToBGR" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long) As Boolean
Public Declare Function ISSharpenRGB Lib "_ISource.dll" Alias "_ISSharpenRGB" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal pRGBOut As Long, ByVal SharpLevel As Long) As Boolean
Public Declare Function ISBlurRGB Lib "_ISource.dll" Alias "_ISBlurRGB" (ByVal RGB As Long, ByVal Width As Long, ByVal Height As Long, ByVal RGBOut As Long, ByVal BlurLevel As Long) As Boolean
Public Declare Function ISColorReplaceRGB Lib "_ISource.dll" Alias "_ISColorReplaceRGB" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal clrOld As Long, ByVal clrNew As Long) As Boolean
Public Declare Function ISCropRGB Lib "_ISource.dll" Alias "_ISCropRGB" (ByVal pRGB As Long, ByVal uWidth As Long, ByVal uHeight As Long, ByVal pRGBOut As Long, ByVal uLeft As Long, ByVal uTop As Long, ByVal uRight As Long, ByVal uBottom As Long) As Boolean
Public Declare Function ISOverlayRGB Lib "_ISource.dll" Alias "_ISOverlayRGB" (ByVal RGBBot&, ByVal WBot&, ByVal HBot&, ByVal RGBTop&, ByVal WTop&, ByVal HTop&, ByVal x&, ByVal Y&, ByVal Opacity As Double) As Boolean
Public Declare Function ISOverlayRGBTrans Lib "_ISource.dll" Alias "_ISOverlayRGBTrans" (ByVal RGBBot As Long, ByVal WBot As Long, ByVal HBot As Long, ByVal RGBTop As Long, ByVal WTop As Long, ByVal HTop As Long, ByVal x As Long, ByVal Y As Long, ByVal Opacity As Double, ByVal TranspColor As Long) As Boolean
Public Declare Function ISResizeRGB Lib "_ISource.dll" Alias "_ISResizeRGB" (ByVal RGB&, ByVal W&, ByVal H&, ByVal RGBOut&, ByVal Wout&, ByVal Hout&) As Boolean
Public Declare Function ISResizeRGBMasked Lib "_ISource.dll" Alias "_ISResizeRGBMasked" (ByVal RGB&, ByVal W&, ByVal H&, ByVal RGBOut&, ByVal Wout&, ByVal Hout&, ByVal MaskColor&) As Boolean
Public Declare Function ISDecimateRGB Lib "_ISource.dll" Alias "_ISDecimateRGB" (ByVal RGB&, ByVal W&, ByVal H&, ByVal RGBOut&, ByVal Wout&, ByVal Hout&) As Boolean
Public Declare Function ISDrawRGB Lib "_ISource.dll" Alias "_ISDrawRGB" (ByVal hDC&, ByVal RGB&, ByVal W&, ByVal H&, ByVal x&, ByVal Y&, ByVal Width&, ByVal Height&, hPal&) As Boolean
Public Declare Function ISDIBToRGB Lib "_ISource.dll" Alias "_ISDIBToRGB" (ByVal pDIB&, W&, H&) As Long
Public Declare Function ISDIBPartsToRGB Lib "_ISource.dll" Alias "_ISDIBPartsToRGB" (ByVal pDIBBits&, ByVal Hdr&, ByVal Pal&, W&, H&) As Long
Public Declare Function ISRGBToDIB Lib "_ISource.dll" Alias "_ISRGBToDIB" (ByVal RGB&, ByVal W&, ByVal H&) As Long
Public Declare Function ISApplyBrightnessContrastToRGB Lib "_ISource.dll" Alias "_ISApplyBrightnessContrastToRGB" (ByVal pRGB&, ByVal W&, ByVal H&, ByVal Brightness#, ByVal Contrast#) As Boolean
Public Declare Function ISApplyLUTToRGB Lib "_ISource.dll" Alias "_ISApplyLUTToRGB" (ByVal RGB&, ByVal W&, ByVal H&, ByVal Channel&, pLUT As Byte) As Boolean
Public Declare Function ISRGBTo8BitBestFit Lib "_ISource.dll" Alias "_ISRGBTo8BitBestFit" (ByVal RGB&, ByVal W&, ByVal H&, ByVal MAP&, ByVal Colors&, Pal As Long) As Boolean
Public Declare Function ISQuantizeRGBTo8Bit Lib "_ISource.dll" Alias "_ISQuantizeRGBTo8Bit" (ByVal RGB As Long, ByVal Width As Long, ByVal Height As Long, ByVal MAP As Long, ByVal Colors As Long, Pal As Long) As Boolean
Public Declare Function IS8BitToRGB Lib "_ISource.dll" Alias "_IS8BitToRGB" (ByVal p8Bit As Long, ByVal pRGB As Long, ByVal W As Long, ByVal H As Long, ByVal Colors As Long, pPal As Long) As Boolean
Public Declare Function IS8BitToDIB Lib "_ISource.dll" Alias "_IS8BitToDIB" (ByVal p8Bit As Long, ByVal W As Long, ByVal H As Long, pPal As Long) As Long
Public Declare Function IS8BitToDIB2 Lib "_ISource.dll" Alias "_IS8BitToDIB2" (ByVal p8Bit As Long, ByVal W As Long, ByVal H As Long, ByVal c As Long, ByVal BPP As Long, pPal As Long) As Long
Public Declare Function ISDIBToHBITMAP Lib "_ISource.dll" Alias "_ISDIBToHBITMAP" (ByVal pDIB As Long, ByVal hPal As Long, ByVal hDC As Long) As Long
Public Declare Function ISGet8BitPaletteFromRGB Lib "_ISource.dll" Alias "_ISGet8BitPaletteFromRGB" (ByVal pRGB As Long, ByVal W As Long, ByVal H As Long, ByVal Colors As Long, pPal As Long) As Boolean
Public Declare Function ISRGBQUADToHPALETTE Lib "_ISource.dll" Alias "_ISRGBQUADToHPALETTE" (pPal As Long, ByVal Colors As Long) As Long
Public Declare Function ISApplyConvolutionFilterToRGB Lib "_ISource" Alias "_ISApplyConvolutionFilterToRGB" (ByVal pRGB As Long, ByVal W As Long, ByVal H As Long, ByVal pRGBOut As Long, ByVal Cols As Long, ByVal Rows As Long, ByRef pFilter As Double, ByVal K As Double) As Boolean
Public Declare Function ISApplyMatrixToRGB Lib "_ISource.dll" Alias "_ISApplyMatrixToRGB" (ByVal pRGB As Long, ByVal W As Long, ByVal H As Long, ByVal pRGBOut As Long, ByVal ChannelMask As Long, ByVal uZeroMasked As Long, ByVal uDoFeedback As Long, ByVal K As Double, ByRef pMatrix As Double) As Boolean
Public Declare Function ISShearRGBX Lib "_ISource.dll" Alias "_ISShearRGBX" (ByVal RGB As Long, ByVal W As Long, ByVal H As Long, ByVal RGBOut As Long, ByVal XOffset As Long, ByVal clrBack As OLE_COLOR) As Boolean
Public Declare Function ISShearRGBY Lib "_ISource.dll" Alias "_ISShearRGBY" (ByVal RGB As Long, ByVal W As Long, ByVal H As Long, ByVal RGBOut As Long, ByVal XOffset As Long, ByVal clrBack As OLE_COLOR) As Boolean

'Other ImgSource Functions
Public Declare Sub ISInitialize Lib "_ISource.dll" Alias "_ISInitialize" (ByVal Key As String)
Public Declare Sub ISGetDLLVersion Lib "_ISource.dll" Alias "_ISGetDLLVersion" (ByVal Buffer As String)
Public Declare Function ISGetLastError Lib "_ISource.dll" Alias "_ISGetLastError" () As Long
Public Declare Sub ISSetCallback Lib "_ISource.dll" Alias "_ISSetCallback" (ByVal pCallback As Long)

Public Declare Sub ISSetJPGDCT Lib "_ISource.dll" Alias "_ISSetJPGDCT" (ByVal uDCT As Long)

'ImgSource Constants
Public Const PNG_COLOR_MASK_PALETTE = 1
Public Const PNG_COLOR_MASK_COLOR = 2
Public Const PNG_COLOR_MASK_ALPHA = 4

Public Const PNG_COLOR_TYPE_GRAY = 0
Public Const PNG_COLOR_TYPE_PALETTE = PNG_COLOR_MASK_COLOR Or PNG_COLOR_MASK_PALETTE
Public Const PNG_COLOR_TYPE_RGB = PNG_COLOR_MASK_COLOR
Public Const PNG_COLOR_TYPE_RGB_ALPHA = PNG_COLOR_MASK_COLOR Or PNG_COLOR_MASK_ALPHA
Public Const PNG_COLOR_TYPE_GRAY_ALPHA = PNG_COLOR_MASK_ALPHA

Public Const ixJDCT_DEFLT As Long = 0
Public Const ixJDCT_ISLOW As Long = 1
Public Const ixJDCT_IFAST As Long = 2
Public Const ixJDCT_FLOAT As Long = 3

'Memory functions
Public Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Public Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Public Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Public Declare Function GlobalSize Lib "kernel32" (ByVal hMem As Long) As Long
Public Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Public Declare Function GlobalReAlloc Lib "kernel32" (ByVal hMem As Long, ByVal dwBytes As Long, ByVal wFlags As Long) As Long
Public Declare Function GlobalHandle Lib "kernel32" (wMem As Any) As Long
Public Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMSTATUS)

'Various WinAPI functions
Public Declare Function GetDeviceCaps Lib "gdi32" (ByVal hDC As Long, ByVal nIndex As Long) As Long
Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Public Declare Function SetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
Public Declare Function GetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Public Declare Function RegQueryValueExByte Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Byte, lpcbData As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal CX As Long, ByVal CY As Long, ByVal wFlags As Long) As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function WindowFromDC Lib "user32" (ByVal hDC As Long) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function RedrawWindow Lib "user32" (ByVal hwnd As Long, ByVal lprcUpdate As Long, ByVal hrgnUpdate As Long, ByVal fuRedraw As Long) As Long
Public Declare Function GetWindowExtEx Lib "gdi32" (ByVal hDC As Long, lpSize As Size) As Long
Public Declare Function GetViewportExtEx Lib "gdi32" (ByVal hDC As Long, lpSize As Size) As Long
Public Declare Function CreateDCByNum Lib "gdi32" Alias "CreateDCA" (ByVal Driver$, ByVal Device$, ByVal lOutput$, Init&) As Long
Public Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Public Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hDC As Long) As Long
Public Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hDC As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Public Declare Function CreateIconIndirect Lib "user32" (piconinfo As ICONINFO) As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchBlt Lib "gdi32" (ByVal hDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchDIBits Lib "gdi32" (ByVal hDC As Long, ByVal x As Long, ByVal Y As Long, ByVal dx As Long, ByVal dy As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal wSrcWidth As Long, ByVal wSrcHeight As Long, ByVal lpBits As Long, ByVal lpBitsInfo As Long, ByVal wUsage As Long, ByVal dwRop As Long) As Long
Public Declare Function SetStretchBltMode Lib "gdi32" (ByVal hDC As Long, ByVal nStretchMode As Long) As Long
Public Declare Function GetStretchBltMode Lib "gdi32" (ByVal hDC As Long) As Long
Public Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal Colr As OLE_COLOR, ByVal hPal As Long, lpColorRef As Long) As Long
Public Declare Sub OleCreatePictureIndirect Lib "olepro32.dll" (lpPictDesc As PICTDESC, riid As GUID, ByVal fPictureOwnsHandle As Long, IPic As IPicture)
Public Declare Function CoCreateGuid Lib "OLE32.DLL" (pGUID As GUID) As Long
Public Declare Function StringFromGUID2 Lib "OLE32.DLL" (pGUID As GUID, ByVal PointerToString As Long, ByVal MaxLength As Long) As Long
Public Declare Function GetSystemPaletteEntries Lib "gdi32" (ByVal hDC As Long, ByVal wStartIndex As Long, ByVal wNumEntries As Long, lpPaletteEntries As PALETTEENTRY) As Long

'Public Declare Function VarPtrArray Lib "msvbvm50.dll" Alias "VarPtr" (Ptr() As Any) As Long
Public Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Public Declare Sub CopyMemoryLPtoStr Lib "kernel32" Alias "RtlMoveMemory" (ByVal lpvDest As String, ByVal lpvSource As Long, ByVal cbCopy As Long)
Public Declare Sub CopyMemoryPtr Lib "kernel32" Alias "RtlMoveMemory" (ByVal lpvDest As Long, ByVal lpvSource As Long, ByVal cbCopy As Long)
Public Declare Sub CopyMemoryPtrToBytes Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Byte, ByVal lpvSource As Long, ByVal cbCopy As Long)
Public Declare Sub CopyMemoryBytesToPtr Lib "kernel32" Alias "RtlMoveMemory" (ByVal lpvDest As Long, lpvSource As Byte, ByVal cbCopy As Long)
Public Declare Sub CopyMemoryPtrToBIH Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As BitmapInfoHeader, ByVal lpvSource As Long, ByVal cbCopy As Long)

Public Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Public Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As BITMAP) As Long
Public Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Public Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
'Public Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hdc As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As DRAWTEXTPARAMS) As Long
Public Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hDC As Long, ByVal x As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Public Declare Function ExtTextOut Lib "gdi32" Alias "ExtTextOutA" (ByVal hDC As Long, ByVal x As Long, ByVal Y As Long, ByVal wOptions As Long, lpRect As RECT, ByVal lpString As String, ByVal nCount As Long, ByVal lpDx As Long) As Long
Public Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hDC As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, ByVal lpDrawTextParam As Long) As Long
Public Declare Function DrawIcon Lib "user32" (ByVal hDC As Long, ByVal x As Long, ByVal Y As Long, ByVal hIcon As Long) As Long
Public Declare Function SetMapMode Lib "gdi32" (ByVal hDC As Long, ByVal nMapMode As Long) As Long
Public Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Public Declare Function SetTextColor Lib "gdi32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Public Declare Function FillRect Lib "user32" (ByVal hDC As Long, lpRect As RECT, ByVal HBrush As Long) As Long
Public Declare Function SetBkColor Lib "gdi32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Public Declare Function SetBkMode Lib "gdi32" (ByVal hDC As Long, ByVal nBkMode As Long) As Long
Public Declare Function GetIconInfo Lib "user32" (ByVal hIcon As Long, piconinfo As ICONINFO) As Long
Public Declare Function GetTextExtentPoint32 Lib "gdi32" Alias "GetTextExtentPoint32A" (ByVal hDC As Long, ByVal lpsz As String, ByVal cbString As Long, lpSize As Size) As Long
Public Declare Function SetTextJustification Lib "gdi32" (ByVal hDC As Long, ByVal nBreakExtra As Long, ByVal nBreakCount As Long) As Long
Public Declare Function CreateBitmap Lib "gdi32" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, ByVal lpBits As Long) As Long
Public Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Public Declare Function CopyImage Lib "user32" (ByVal handle As Long, ByVal un1 As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal un2 As Long) As Long
Public Declare Function GetClipBox Lib "gdi32" (ByVal hDC As Long, lpRect As RECT) As Long
Public Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Public Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Public Const PI As Double = 3.14159265358979
Public Const ixErr   As Long = vbObjectError + 652

Public Const RASTERCAPS = 38
Public Const BITSPIXEL = 12
Public Const COLORRES = 108
Public Const HORZRES = 8
Public Const VERTRES = 10
Public Const PLANES = 14

Public Const IMAGE_BITMAP = 0
Public Const LR_MONOCHROME = 1
Public Const LR_COPYDELETEORG = 8

Public Const TRANSPARENT = 1

Public Const RC_BITBLT = 1
Public Const RC_BANDING = 2
Public Const RC_BITMAP64 = 8
Public Const RC_DI_BITMAP = &H80
Public Const RC_PALETTE = &H100
Public Const RC_DIBTODEV = &H200
Public Const RC_BIGFONT = &H400
Public Const RC_STRETCHBLT = &H800
Public Const RC_FLOODFILL = &H1000
Public Const RC_STRETCHDIB = &H2000
Public Const RC_DEVBITS = &H8000

Public Const SM_CXICON = 11
Public Const SM_CYICON = 12
Public Const SM_CXCURSOR = 13
Public Const SM_CYCURSOR = 14
Public Const SM_CXSMICON = 49
Public Const SM_CYSMICON = 50

Public Const MM_TEXT = 1
Public Const LOGPIXELSX = 88
Public Const LOGPIXELSY = 90

Public Const PICTYPE_UNINITIALIZED = -1
Public Const PICTYPE_NONE = 0
Public Const PICTYPE_BITMAP = 1
Public Const PICTYPE_METAFILE = 2
Public Const PICTYPE_ICON = 3
Public Const PICTYPE_ENHMETAFILE = 4

Public Const DT_LEFT = &H0
Public Const DT_CENTER = &H1
Public Const DT_RIGHT = &H2
Public Const DT_WORDBREAK = &H10
Public Const DT_SINGLELINE = &H20
Public Const DT_NOCLIP = &H100
Public Const DT_CALCRECT = &H400

Public Const GENERIC_READ = &H80000000
Public Const GENERIC_WRITE = &H40000000
Public Const OPEN_EXISTING = 3
Public Const FILE_FLAG_SEQUENTIAL_SCAN = &H8000000
Public Const FILE_ATTRIBUTE_HIDDEN = &H2
Public Const HKEY_CURRENT_USER = &H80000001
Public Const REG_BINARY = 3
Public Const HWND_TOPMOST = -1
Public Const SWP_NOACTIVATE = &H10
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const SW_SHOWMAXIMIZED = 3
Public Const WM_PAINT = &HF
Public Const WM_PRINT = &H317
Public Const PRF_CHECKVISIBLE As Long = &H1
Public Const PRF_NONCLIENT As Long = &H2
Public Const PRF_CLIENT = &H4&
Public Const PRF_ERASEBKGND As Long = &H8
Public Const PRF_CHILDREN = &H10&
Public Const PRF_OWNED = &H20&

Public Const RDW_UPDATENOW = &H100
Public Const ETO_CLIPPED = 4

Public Const SYNCHRONIZE = &H100000
Public Const READ_CONTROL = &H20000
Public Const STANDARD_RIGHTS_ALL = &H1F0000
Public Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)
Public Const STANDARD_RIGHTS_REQUIRED = &HF0000
Public Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Public Const STANDARD_RIGHTS_EXECUTE = (READ_CONTROL)
Public Const KEY_CREATE_LINK = &H20
Public Const KEY_CREATE_SUB_KEY = &H4
Public Const KEY_ENUMERATE_SUB_KEYS = &H8
Public Const KEY_EVENT = &H1
Public Const KEY_NOTIFY = &H10
Public Const KEY_QUERY_VALUE = &H1
Public Const KEY_SET_VALUE = &H2
Public Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Public Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Public Const KEY_EXECUTE = ((KEY_READ) And (Not SYNCHRONIZE))
Public Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))

Public Const STRETCH_ANDSCANS = 1
Public Const STRETCH_DELETESCANS = 3
Public Const STRETCH_HALFTONE = 4
Public Const STRETCH_ORSCANS = 2

Public CurrentImgX          As ImgX         'For callback/progress purposes
Public LastProgressValue    As Long         'So we don't call the same percent multiple times
Public gInitialized         As Boolean      'Set when IMGX_Initiailze is called successfully
Public gRegInfo             As String       'Hold the decoded registration Information
Public gSupport             As ImgX_Support 'Holds a reference to the Global Support object.


Function pExpandGUID(G As String) As String
    'This function takes a string that may or may not be a GUID.  If it is determined
    'to no be a GUID, then the string passed is is passed out untouched.  However, If
    'it is a GUID, then it is converted from textual hexidecimal to byte values.  The
    'byte values are returned out as characters in the string.
    '
    'The GUID should be in this format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}" where
    'the Xs are hexidecimal characters.
    
    Dim I   As Long
    Dim G2  As String
    Dim c   As Byte
    Dim C2  As Byte
    
    '
    'Format checks
    '
    If Len(G) <> 38 Then pExpandGUID = G: Exit Function
    If Left(G, 1) <> "{" Then pExpandGUID = G: Exit Function
    If Right(G, 1) <> "}" Then pExpandGUID = G: Exit Function
    If Mid(G, 10, 1) <> "-" Then pExpandGUID = G: Exit Function
    If Mid(G, 15, 1) <> "-" Then pExpandGUID = G: Exit Function
    If Mid(G, 20, 1) <> "-" Then pExpandGUID = G: Exit Function
    If Mid(G, 25, 1) <> "-" Then pExpandGUID = G: Exit Function
    
    '
    'Lose the formats
    '
    G2 = Mid(G, 2, 8) & Mid(G, 11, 4) & Mid(G, 16, 4) & Mid(G, 21, 4) & Mid(G, 26, 12)
    
    '
    'Check if each char is Hex
    '
    For I = 1 To 32 Step 2
        c = Asc(Mid(G2, I, 1))
        
        Select Case c
            Case Asc("0") To Asc("9")
                c = c - Asc("0")
            Case Asc("A") To Asc("F")
                c = c - Asc("A") + 10
            Case Asc("a") To Asc("f")
                c = c - Asc("a") + 10
            Case Else
                pExpandGUID = G: Exit Function
        End Select
    
        C2 = Asc(Mid(G2, I + 1, 1))
        
        Select Case C2
            Case Asc("0") To Asc("9")
                C2 = C2 - Asc("0")
            Case Asc("A") To Asc("F")
                C2 = C2 - Asc("A") + 10
            Case Asc("a") To Asc("f")
                C2 = C2 - Asc("a") + 10
            Case Else
                pExpandGUID = G: Exit Function
        End Select
    
        pExpandGUID = pExpandGUID & Chr(c * 16 + C2)
    Next I
    
End Function

Function pRunningInIDE(Optional IDEWnd& = 0) As Boolean
'This function will do a smart check to see if the DLL is running
'within the VB IDE.  It gets the process ID of the DLL and then
'iterates the top level windows for any that have a window class of
'"IDEOwner"  For each that it finds, it gets that window's process ID
'and sees if it is the same as the DLL's  If so, then we are in the IDE!
'
'This was another of those really *fun* ones.  it was hashed out online
'and this is the result of the cumulative effort.  I would specifically
'like to thank Eduardo Morcillo and Jim Giles for there insight and input.
'

Dim PID As Long
Dim IDE_PID As Long
Static IDEhWnd          As Long
Static AlreadyChecked  As Boolean
Static InIDE           As Boolean
    On Error GoTo Hell
    
    If AlreadyChecked Then
        pRunningInIDE = InIDE
        IDEWnd = IDEhWnd
        Exit Function
    End If
    
    AlreadyChecked = True           'Only need to check this once
    PID = GetCurrentProcessId()     'ProcessID of the DLL
    
    IDEhWnd = FindWindow("IDEOwner", vbNullString)  'IDEOwner is the Window Class for (at least) VB5 and VB6
    
    If IDEhWnd Then                 'IDE is running
        Do Until IDEhWnd = 0
            Call GetWindowThreadProcessId(IDEhWnd, IDE_PID)
            
            If IDE_PID = PID Then
                InIDE = True
                pRunningInIDE = True
                IDEWnd = IDEhWnd
                Exit Function
            End If
            
            IDEhWnd = FindWindowEx(0&, IDEhWnd, "IDEOwner", vbNullString)   'get Next
        Loop
    End If
Exit Function
Hell:
    'MsgBox Err.Number & " - " & Err.Description, , "RunningInIDE_Check"
End Function

Public Function Callback(ByVal CurrentRow As Long, ByVal LastRow As Long) As Integer
    On Error Resume Next
    Dim Cancel          As Boolean
    Dim NewValue        As Long
    
    NewValue = CurrentRow * 100 / LastRow
    
    If NewValue < 0 Then NewValue = 0
    If NewValue > 100 Then NewValue = 100
    
    If NewValue <> LastProgressValue Then
        LastProgressValue = NewValue
        CurrentImgX.f_RaiseProgress NewValue, Cancel
    End If
    
    Callback = IIf(Cancel, 0, 1)
End Function


Function pGetLastError() As ImgX_Errors
    pGetLastError = ixErr + ISGetLastError
End Function



Public Sub pHSLtoRGB(Hue As Single, Sat As Single, Lum As Single, R As Byte, G As Byte, B As Byte)

    Dim Red     As Single
    Dim Green   As Single
    Dim Blue    As Single
    
    Dim min     As Single
    Dim max     As Single


    If Sat = 0 Then   'Achromatic (Grayscale)
        Red = Lum
        Green = Lum
        Blue = Lum
    Else              'Chromatic case:
     
        If Lum > 0.5 Then
            min = Lum - Sat * (1 - Lum)
        Else
            min = Lum * (1 - Sat)
        End If
      
        max = 2 * Lum - min
      
        Select Case Hue
            Case Is < 0:  Red = max:    Green = min:   Blue = Green - Hue * (max - min)        'Magenta -> Red
            Case Is < 1:  Red = max:    Blue = min:    Green = Hue * (max - min) + Blue        'Red -> Yellow
            Case Is < 2:  Green = max:  Blue = min:    Red = Blue - (Hue - 2) * (max - min)    'Yellow -> Green
            Case Is < 3:  Green = max:  Red = min:     Blue = (Hue - 2) * (max - min) + Red    'Green -> Cyan
            Case Is < 4:  Blue = max:   Red = min:     Green = Red - (Hue - 4) * (max - min)   'Cyan -> Blue
            Case Else::   Blue = max:   Green = min:   Red = (Hue - 4) * (max - min) + Green   'Blue -> Magenta

        End Select
            
   End If
   R = Red * 255: G = Green * 255: B = Blue * 255
End Sub
Public Sub pRGBtoHSL(R As Byte, G As Byte, B As Byte, Hue As Single, Sat As Single, Lum As Single)

    Dim Red     As Single
    Dim Green   As Single
    Dim Blue    As Single
    
    Dim max     As Single
    Dim min     As Single
    Dim Delta   As Single


    Red = R / 255
    Green = G / 255
    Blue = B / 255

    min = IIf(Green < Blue, Green, Blue)
    min = IIf(Red < min, Red, min)
    
    max = IIf(Green > Blue, Green, Blue)
    max = IIf(Red > max, Red, max)
    
    
    '
    'Calculate the Lightness
    '
    Lum = (max + min) / 2
    
    If max <> min Then  'Chromatic
        '
        'Calculate the Saturation
        '
        If Lum > 0.5 Then
            Sat = (max - min) / (2 - max - min)
        Else
            Sat = (max - min) / (max + min)
        End If
        
        '
        'Calculate the Hue
        '
        Delta = max - min
        
        Select Case max
            Case Red:     Hue = (Green - Blue) / Delta       'Between Yellow & Magenta
            Case Green:   Hue = (Blue - Red) / Delta + 2     'Between Cyan & Yellow
            Case Else:    Hue = (Red - Green) / Delta + 4    'Between Magenta & Cyan
        End Select
        
    End If

End Sub






Function pBitmapToPicture(ByVal hBmp As Long, Optional ByVal hPal As Long = 0, Optional PicType = PICTYPE_BITMAP) As IPicture
'
'This routine will take a device dependant bitmap and encapsulate it into
'an OLE Picture object.  Much thanks to Bruce McKinney for personally helping
'with this.
'
    Dim Picture     As IPicture
    Dim PICTDESC    As PICTDESC
    Dim IID         As GUID
    
    PICTDESC.cbSizeOfStruct = Len(PICTDESC)     '16 Bytes
    PICTDESC.PicType = PicType
    PICTDESC.hBitmap = hBmp
    PICTDESC.hPal = hPal
    
    
    'IPicture GUID {7BF80980-BF32-101A-8BBB-00AA00300CAB}
    IID.Data1 = &H7BF80980
    IID.Data2 = &HBF32
    IID.Data3 = &H101A
    IID.Data4(0) = &H8B
    IID.Data4(1) = &HBB
    IID.Data4(2) = &H0
    IID.Data4(3) = &HAA
    IID.Data4(4) = &H0
    IID.Data4(5) = &H30
    IID.Data4(6) = &HC
    IID.Data4(7) = &HAB
    
    ' Create picture from bitmap handle
    OleCreatePictureIndirect PICTDESC, IID, True, Picture
    
    ' Result will be valid Picture or Nothing--either way set it
    Set pBitmapToPicture = Picture
End Function

Function pGetErrorDesc(ErrNum As Long) As String
    
    Select Case ErrNum
        Case ixeNotInitialized:     pGetErrorDesc = "ImgX Not Initialized with the ImgX.Initialize method"
        Case ixeNoError:            pGetErrorDesc = "OK"
        Case ixeOutOfMemory:        pGetErrorDesc = "Out Of Memory"
        Case ixeFileOpenError:      pGetErrorDesc = "File Open Error"
        Case ixeFileReadError:      pGetErrorDesc = "File Read Error"
        Case ixeFileWriteError:     pGetErrorDesc = "File Write Error"
        Case ixeBadParameter:       pGetErrorDesc = "Bad Parameter"
        Case ixeInvalidBMP:         pGetErrorDesc = "Invalid or Corrupt BMP"
        Case ixeCompressedBMP:      pGetErrorDesc = "No Compressed BMP Support"
        Case ixeInvalidGIF:         pGetErrorDesc = "Invalid or Corrupt GIF"
        Case ixeInvalidJPG:         pGetErrorDesc = "Invalid or Corrupt JPG"
        Case ixeDeviceContextErr:   pGetErrorDesc = "Error With A Device Context"
        Case ixeGetDIBitsErr:       pGetErrorDesc = "Win32API: GetDIBits() Failed"
        Case ixeDisabledGIF:        pGetErrorDesc = "GIF Support Disabled"
        Case ixeResourceNotFound:   pGetErrorDesc = "Resource Not Found"
        Case ixeOperationAborted:   pGetErrorDesc = "Operation Aborted"
        Case ixeInvalidPNG:         pGetErrorDesc = "Invalid or Corrupt PNG"
        Case ixePNGCreateError:     pGetErrorDesc = "Internal PNG Error"
        Case ixeInternalError:      pGetErrorDesc = "Unexpected Internal Error"
        Case ixeFontError:          pGetErrorDesc = "Error Creating Font"
        Case ixeTIFError:           pGetErrorDesc = "Internal TIF Error"
        Case ixeInvalidTIF:         pGetErrorDesc = "Invalid or Corrupt TIF"
        Case ixeNoTIFLZW:           pGetErrorDesc = "Not TIF-LZW Support"
        Case ixeInvalidPCX:         pGetErrorDesc = "Invalid or Corrupt PCX"
        Case ixeCrtCmpBmpFail:      pGetErrorDesc = "Win32API: CreateCompatibleBitmap() Failed"
        Case ixeNoLines:            pGetErrorDesc = "End of Image"
        Case ixeGetDIBitsErr2:      pGetErrorDesc = "Win32API: GetDIBits() Failed"
        Case ixeOperationNotSupported:  pGetErrorDesc = "Device Does Not Support Operation"
        Case ixeInvalidWMF:         pGetErrorDesc = "Invalid or Corrupt WMF"
        Case ixeBitDepthMismatch:   pGetErrorDesc = "File not of Requested Bit-Depth"
        Case ixeBITBLTFailed:       pGetErrorDesc = "Win32API: BitBlt() Failed"
        Case ixeBufferTooSmall:     pGetErrorDesc = "Output Buffer Too Small"
        Case ixeTooManyColors:      pGetErrorDesc = "Too Many Colors for Given Palette"
        Case ixeInvalidTGA:         pGetErrorDesc = "Invalid or Corrupt TGA"
        Case ixeNoTGAThumbnail:     pGetErrorDesc = "No TGA Thumbnail in File"
        'Case ixeInvalidWMF2:         pGetErrorDesc = "Invalid or Corrupt WMF"
        Case ixeInvalidGIFVersion:  pGetErrorDesc = "Invalid GIF Version"
        Case ixeCreateDIBitmapFailed:   pGetErrorDesc = "Win32API: CreateDIBitmap() Failed"
        Case ixeLZWNotActivated:    pGetErrorDesc = "LZW Not Activated"
        
        Case ixeUnknownImage:       pGetErrorDesc = "Unknown Image Format"
        Case ixeNoClipBoardBitmap:  pGetErrorDesc = "No Bitmap On ClipBoard"
        
        Case Else:  pGetErrorDesc = "ImgSource Error " & ErrNum - ixErr
    End Select
End Function




