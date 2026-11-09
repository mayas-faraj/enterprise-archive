VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_Effects"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Event GetImgX(ImgX As ImgX)

Public Sub Blur(ByVal Percent As Long, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX         'Temporary reference to the ImgX object
    Dim Buffer      As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Blur", "No Image Data"
    
    If Percent < 1 Then Exit Sub
    If Percent > 100 Then Percent = 100
    
    ImgX.f_StartProgress "ImgX.Effects.Blur"
   
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Blur", pGetErrorDesc(ixeOutOfMemory)
    
    'Perform the action.
    '
    ImgX.f_Buffer.ChangeColorDepth 24
    If ISBlurRGB(ImgX.f_Buffer.Pointer, Buffer.Width, Buffer.Height, Buffer.Pointer, Percent) = False Then
        ImgX.f_RaiseError pGetLastError(), "ImgX.Effects.Blur", pGetErrorDesc(pGetLastError())
    End If
    
    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Blur " & Percent & "%"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub ApplyFilter(Filter() As Double, Optional ByVal K As Double = 1, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim ElementsX   As Long
    Dim ElementsY   As Long
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyFilter", "No Image Data"
    
    On Error Resume Next
    ElementsX = -1
    ElementsX = UBound(Filter, 1) - LBound(Filter, 1) + 1
    On Error GoTo 0
    
    If ElementsY = -1 Then Err.Raise 5, "ImgX.Effects.ApplyFilter", "Filter must contain a 2 dimensional array of Doubles where each dimension has an odd number of elements."
    
    On Error Resume Next
    ElementsY = -1
    ElementsY = UBound(Filter, 2) - LBound(Filter, 2) + 1
    On Error GoTo 0
    
    If ElementsY = -1 Then Err.Raise 5, "ImgX.Effects.ApplyFilter", "Filter must contain a 2 dimensional array of Doubles where each dimension has an odd number of elements."
    
    If (ElementsX Mod 2) = 0 Or (ElementsY Mod 2) = 0 Then Err.Raise 5, "ImgX.Effects.ApplyFilter", "Filter must contain a 2 dimensional array of Doubles where each dimension has an odd number of elements."
    
    
    ImgX.f_StartProgress "ImgX.Effects.ApplyFilter"
   
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ApplyFilter", pGetErrorDesc(ixeOutOfMemory)
    
    'Perform the action.
    '
    ImgX.f_Buffer.ChangeColorDepth 24
    
    If ISApplyConvolutionFilterToRGB(ImgX.f_Buffer.Pointer, Buffer.Width, Buffer.Height, Buffer.Pointer, ElementsX, ElementsY, Filter(0, 0), K) = False Then
        ImgX.f_RaiseError pGetLastError(), "ImgX.Effects.ApplyFilter", pGetErrorDesc(pGetLastError())
    End If
    
    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Apply Filter"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub ApplyMatrix(Matrix() As Double, Optional ByVal K As Double = 1, Optional ByVal Channels As ImgX_ColorChannels = ixcAll, Optional ByVal ZeroOtherChannels As Boolean, Optional ByVal Feedback As Boolean, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim ElementsX   As Long
    Dim ElementsY   As Long

    
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyMatrix", "No Image Data"
    
    If Channels > ixcAll Or Channels < 1 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyMatrix", "Invalid Value for Channels Parameter."
    
'    ImgX.f_ConvertTo24Bit ImgX.f_RGB
    
    On Error Resume Next
    
    ElementsX = -1
    ElementsX = UBound(Matrix, 1) - LBound(Matrix, 1) + 1
    On Error GoTo 0
    
    If ElementsY = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyMatrix", "Matrix must contain a 3 by 3 array of Doubles."
    
    On Error Resume Next
    ElementsY = -1
    ElementsY = UBound(Matrix, 2) - LBound(Matrix, 2) + 1
    On Error GoTo 0
    
    If ElementsY = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyMatrix", "Matrix must contain a 3 by 3 array of Doubles."
    
    If ElementsX <> 3 Or ElementsY <> 3 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyMatrix", "Matrix must contain a 3 by 3 array of Doubles."
    
    ImgX.f_StartProgress "ImgX.Effects.ApplyMatrix"
   
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ApplyMatrix", pGetErrorDesc(ixeOutOfMemory)
        
    'Perform the action.
    '
    ImgX.f_Buffer.ChangeColorDepth 24
    
    If ISApplyMatrixToRGB(ImgX.f_Buffer.Pointer, Buffer.Width, Buffer.Height, Buffer.Pointer, Channels, -ZeroOtherChannels, -Feedback, K, Matrix(LBound(Matrix, 1), LBound(Matrix, 2))) = False Then
        ImgX.f_RaiseError pGetLastError(), "ImgX.Effects.ApplyMatrix", pGetErrorDesc(pGetLastError())
    End If
    
    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Apply Matrix"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub


Public Sub ApplyPalette(ByVal PaletteType As ImgX_PaletteTypes, Optional Palette As Variant, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim RGBBytes()  As Byte
    Dim MapBytes()  As Byte
    Dim Pal()       As Long
    Dim PalEntries() As PALETTEENTRY
    Dim PalSize     As Long
    Dim I           As Long
    Dim R           As Byte
    Dim G           As Byte
    Dim B           As Byte
    Dim NumPixels   As Long
    Dim NumBytes    As Long
    Dim IdealPalette(0 To 255)   As Long
        
        
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyPalette", "No Image Data"
    
    If PaletteType <> ixptCustomPalette And _
       PaletteType <> ixptWebPalette And _
       PaletteType <> ixptSystemPalette Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyPalette", "Invalid value for PaletteType parameter."
        
    Select Case PaletteType
    
    Case ixptCustomPalette
        If VarType(Palette) <> vbArray + vbLong Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyPalette", "Palette parameter is not valid.  It must be an array of long integers."
        On Error Resume Next
        PalSize = UBound(Palette) - LBound(Palette) + 1
        On Error GoTo 0
        If PalSize <= 0 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyPalette", "Palette array contains no data."
        If PalSize > 256 Then PalSize = 256     'Trim off the extra, palettes cannot be larger than 256 colors
        
        ReDim Pal(0 To PalSize - 1) As Long
        For I = 0 To PalSize - 1
            Pal(I) = ImgX.Support.TranslateColor(CLng(Palette(I)))
            ImgX.Support.ExtractRGB Pal(I), R, G, B
            Pal(I) = RGB(B, G, R)
        Next I
    
    Case ixptWebPalette
        '
        'Build the Web Palette - Each of the primaries contain the values
        'h00, h33, h66, h99, hCC, hFF.  There are six possible values per primary
        'There are 3 primaries (RGB) so the palette size is 216 (6x6x6)
        '
        '
        PalSize = 216
        ReDim Pal(0 To PalSize - 1) As Long
        For B = 0 To 5
            For G = 0 To 5
                For R = 0 To 5
                    Pal(R + G * 6 + B * 36) = VBA.RGB(R * 51, G * 51, B * 51)
                Next R
            Next G
        Next B
    
    Case ixptSystemPalette
    
        ReDim Pal(0 To 255)
        ReDim PalEntries(0 To 255)
        If GetDeviceCaps(ImgX.Support.ScreenDC, RASTERCAPS) And RC_PALETTE = 0 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyPalette", "Device does not support palettes."
        
        PalSize = GetSystemPaletteEntries(ImgX.Support.ScreenDC, 0, 256, PalEntries(0))
        If PalSize <= 0 Then ImgX.f_RaiseError 5, "ImgX.Effects.ApplyPalette", "Cannot retrieve the system palette.  GetSystemPaletteEntries() returns 0."

        For I = 0 To PalSize - 1
            Pal(I) = RGB(PalEntries(I).peRed, PalEntries(I).peGreen, PalEntries(I).peBlue)
        Next I
    End Select
    
    NumPixels = ImgX.f_Buffer.Height * ImgX.f_Buffer.Width
    NumBytes = NumPixels * 3
    
    ImgX.f_StartProgress "ImgX.Effects.ApplyPalette"
   
    'Allocate memory for an 8-bit (one byte per pixel) bitmap
    Set Buffer = New ImgX_Buffer
    If Not Buffer.Allocate(ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, 8) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ApplyPalette.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    'Perform the action.
    '
    ImgX.f_Buffer.ChangeColorDepth 24
    
    If ISRGBTo8BitBestFit(ImgX.f_Buffer.Pointer, Buffer.Width, Buffer.Height, Buffer.Pointer, PalSize, Pal(0)) = False Then
        ImgX.f_RaiseError pGetLastError(), "ImgX.Effects.ApplyPalette", pGetErrorDesc(pGetLastError())
    End If
    
    Buffer.Palette = Pal
    
    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Apply Palette"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub
Public Sub Brightness(ByVal Brightness As Long, Optional ByVal Contrast As Long = 0, Optional ByVal UndoText As String)

    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Brightness", "No Image Data"
    
    If Brightness < -100 Or Brightness > 100 Then ImgX.f_RaiseError 5, "ImgX.Effects.Brightness", "Brightness must be in the range of -100 to 100"
    If Contrast < -100 Or Contrast > 100 Then ImgX.f_RaiseError 5, "ImgX.Effects.Brightness", "Contrast must be in the range of -100 to 100"
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Brightness.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    ImgX.f_StartProgress "ImgX.Effects.Brightness"
   
    '
    'Perform the action.
    '
    If ISApplyBrightnessContrastToRGB(Buffer.Pointer, Buffer.Width, Buffer.Height, Brightness / 100, Contrast / 100) = False Then
        ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Brightness.ISApplyBrightnessAndContrast", pGetErrorDesc(pGetLastError)
    End If

    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Brightness: " & Brightness & IIf(Contrast, "  Contrast: " & Contrast, "")
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub Contrast(ByVal Contrast As Long, Optional ByVal Brightness As Long = 0, Optional ByVal UndoText As String)

    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Contrast", "No Image Data"
    
    If Brightness < -100 Or Brightness > 100 Then ImgX.f_RaiseError 5, "ImgX.Effects.Contrast", "Brightness must be in the range of -100 to 100"
    If Contrast < -100 Or Contrast > 100 Then ImgX.f_RaiseError 5, "ImgX.Effects.Contrast", "Contrast must be in the range of -100 to 100"
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Contrast.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    ImgX.f_StartProgress "ImgX.Effects.Contrast"
   
    '
    'Perform the action.
    '
    If ISApplyBrightnessContrastToRGB(Buffer.Pointer, Buffer.Width, Buffer.Height, Brightness / 100, Contrast / 100) = False Then
        ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Contrast.ISApplyBrightnessAndContrast", pGetErrorDesc(pGetLastError)
    End If

    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Contrast: " & Contrast & IIf(Brightness, "  Brightness: " & Brightness, "")
    ImgX.f_SetBuffer Buffer, UndoText
End Sub


Public Sub Colorize(ByVal Color As OLE_COLOR, Optional ByVal ApplyHue As Boolean = True, Optional ByVal ApplySaturation As Boolean, Optional ByVal ApplyLuminance As Boolean, Optional ByVal UndoText As String)

    Dim ImgX            As ImgX
    Dim Buffer          As ImgX_Buffer
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim X               As Long
    Dim Y               As Long
    
    Dim Hue             As Single
    Dim Sat             As Single
    Dim Lum             As Single
    
    Dim NewHue          As Single
    Dim NewSat          As Single
    Dim NewLum          As Single
    
    Dim Red             As Single
    Dim Green           As Single
    Dim Blue            As Single
    
    Dim Max             As Single
    Dim Min             As Single
    Dim Delta           As Single
    
    Dim R               As Byte
    Dim G               As Byte
    Dim B               As Byte
    
    Dim Cancelled       As Boolean
    Dim OldPercent      As Long
    Dim NewPercent      As Long
    
    Dim FireProgress    As Boolean
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Colorize", "No Image Data"
    
    '
    'They can't all be false  (Doh!)
    '
    If (ApplyHue Or ApplySaturation Or ApplyLuminance) = False Then Exit Sub

    
    '
    'Make sure the color is valid.  Translate system colors
    '
    Color = ImgX.Support.TranslateColor(Color)
    If Color = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.Colorize", "Bad Color Parameter"

    
    '
    'Get the New Hue, Saturation and Luminance
    '
    ImgX.Support.ExtractRGB Color, R, G, B
    pRGBtoHSL R, G, B, NewHue, NewSat, NewLum
    
    '
    'Copy the current Buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Colorize", pGetErrorDesc(ixeOutOfMemory)
        
    '
    'Point the Byte array to the buffer
    '
    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = Buffer.Height
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = Buffer.Width
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4      'Overwite the variable
        
    
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
        
    For Y = 0 To Buffer.Height - 1
    
        If FireProgress Then
            NewPercent = Y / Buffer.Height * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    If OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
                    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.Colorize", pGetErrorDesc(ixeOperationAborted)   'No Global Memory to clean up
                End If
            End If
        End If

    
        For X = 0 To Buffer.Width - 1
           
            'Read the RGB bytes for this pixel
            Red = bRGB(0, X, Y) / 255
            Green = bRGB(1, X, Y) / 255
            Blue = bRGB(2, X, Y) / 255
            
            'Calculate the Minimum and Maximum values
            Min = IIf(Green < Blue, Green, Blue)
            Min = IIf(Red < Min, Red, Min)
            
            Max = IIf(Green > Blue, Green, Blue)
            Max = IIf(Red > Max, Red, Max)
                
                
            'Calculate the Lightness
            Lum = (Max + Min) / 2
                
            If Max <> Min Then  'Chromatic
                    
                'Calculate the Saturation
                If ApplySaturation Then
                    Sat = NewSat
                Else
                    If Lum > 0.5 Then
                        Sat = (Max - Min) / (2 - Max - Min)
                    Else
                        Sat = (Max - Min) / (Max + Min)
                    End If
                End If
                
                'Calculate the Hue
                If ApplyHue Then
                    Hue = NewHue
                Else
                    
                    Delta = Max - Min
                        
                    Select Case Max
                        Case Red:   Hue = (Green - Blue) / Delta         'Between Yellow & Magenta
                        Case Green: Hue = (Blue - Red) / Delta + 2     'Between Cyan & Yellow
                        Case Else:  Hue = (Red - Green) / Delta + 4     'Between Magenta & Cyan
                    End Select
                End If
            End If
            
            
            Lum = IIf(ApplyLuminance, NewLum, Lum)
        
        
            If Sat = 0 Then  'Achromatic (Grayscale)
                Red = Lum
                Green = Lum
                Blue = Lum
            Else              'Chromatic case:
             
                If Lum > 0.5 Then
                    Min = Lum - Sat * (1 - Lum)
                Else
                    Min = Lum * (1 - Sat)
                End If
              
                Max = 2 * Lum - Min
              
                Select Case Hue
                    Case Is < 0:  Red = Max:    Green = Min:  Blue = Green - Hue * (Max - Min)         'Magenta -> Red
                    Case Is < 1:  Red = Max:    Blue = Min:   Green = Hue * (Max - Min) + Blue         'Red -> Yellow
                    Case Is < 2:  Green = Max:  Blue = Min:   Red = Blue - (Hue - 2) * (Max - Min)     'Yellow -> Green
                    Case Is < 3:  Green = Max:  Red = Min:    Blue = (Hue - 2) * (Max - Min) + Red     'Green -> Cyan
                    Case Is < 4:  Blue = Max:   Red = Min:    Green = Red - (Hue - 4) * (Max - Min)    'Cyan -> Blue
                    Case Else::   Blue = Max:   Green = Min:  Red = (Hue - 4) * (Max - Min) + Green    'Blue -> Magenta
        
                End Select
            End If
            
            bRGB(0, X, Y) = Red * 255
            bRGB(1, X, Y) = Green * 255
            bRGB(2, X, Y) = Blue * 255
            
        Next X
    Next Y
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
    
    If Len(UndoText) = 0 Then UndoText = "Colorize"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub


Public Sub Crop(ByVal CropL As Long, ByVal CropT As Long, ByVal CropW As Long, ByVal CropH As Long, Optional ByVal UndoText As String)
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim W&, H&, P&
    Dim CropB&, CropR&
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Crop", "No Image Data"
    
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
    
    '
    'Keep the crop window within the boundary of the original image
    '
    If CropL < 0 Then CropW = CropW + CropL: CropL = 0
    If CropT < 0 Then CropH = CropH + CropT: CropT = 0
    CropR = CropL + CropW
    If CropR > W Then CropR = W
    CropB = CropT + CropH
    If CropB > H Then CropB = H
    
    '
    'Error on illegal values
    '
    If CropW <= 0 Or CropH <= 0 Or CropL > W Or CropT > H Then ImgX.f_RaiseError 5, "ImgX.Effects.Crop", "Invalid Crop Dimensions."
    
    ImgX.f_StartProgress "ImgX.Effects.Crop"
    
    '
    'Perform the action.
    '
    Set Buffer = New ImgX_Buffer
    If Not Buffer.Allocate(CropW, CropH, 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Crop.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)

    ImgX.f_Buffer.ChangeColorDepth 24
    
    If ISCropRGB(ImgX.f_Buffer.Pointer, W, H, Buffer.Pointer, CropL, CropT, CropR, CropB) = False Then
        ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Crop.ISCropRGB", pGetErrorDesc(pGetLastError)
    End If
    
    ImgX.f_StopProgress
    
    Buffer.SetBuffer P, CropW, CropH, 24
        
    If Len(UndoText) = 0 Then UndoText = "Crop " & CropL & "," & CropT & " - " & CropW & "," & CropH
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub Decrypt(ByVal Key As String, Optional ByVal UndoText As String)
    
    Dim ImgX            As ImgX
    Dim Buffer          As ImgX_Buffer
    Dim bKey()          As Byte
    Dim KeySize         As Long
    Dim KeyCode         As Long
    
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim R               As Byte
    Dim G               As Byte
    Dim B               As Byte
    Dim X               As Long
    Dim W               As Long
    Dim Y               As Long
    Dim H               As Long
    Dim P               As Long
    Dim OldPercent      As Long
    Dim NewPercent      As Long
    Dim Cancelled       As Boolean
    Dim FireProgress    As Boolean
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Decrypt", "No Image Data"
    
    Key = pExpandGUID(Trim(Key))  'If it's a GUID, then extract the hex values
    
    KeySize = Len(Key)
    If KeySize < 6 Then ImgX.f_RaiseError 5, "ImgX.Effects.Decrypt", "Key must be at least 6 bytes long"
    
'    ImgX.f_ConvertTo24Bit ImgX.f_RGB
    
    ReDim bKey(0 To KeySize - 1) As Byte
    
    '
    'Convert to Bytes
    '
    For Y = 1 To KeySize
        bKey(Y - 1) = Asc(Mid(Key, Y, 1))
        P = P + bKey(Y - 1)
    Next Y
    
    '
    'Scramble a little more (Just in case it's plain text)
    '
    For Y = 1 To KeySize - 1
        bKey(Y) = (CLng(bKey(Y)) + CLng(bKey(Y - 1)) + P) Mod 256
    Next Y
    
    '
    'Copy the current Buffer
    '
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
    
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Decrypt", pGetErrorDesc(ixeOutOfMemory)

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = H
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = W
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4     'Overwite the variable
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    
    For Y = 0 To H - 1
    
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    If OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
                    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.Decrypt", pGetErrorDesc(ixeOperationAborted)   'No Global Memory to clean up
                End If
            End If
        End If
        
        For X = W - 1 To 1 Step -1
            KeyCode = bKey(X Mod KeySize)
            For P = 0 To 2
                            
                bRGB(P, X, Y) = bRGB(P, X, Y) Xor ((bRGB(P, X - 1, Y) + KeyCode) Mod 256)

            Next P
        Next X
        
        For X = 0 To W - 2
            KeyCode = bKey(X Mod KeySize)
            For P = 0 To 2
                            
                bRGB(P, X, Y) = bRGB(P, X, Y) Xor ((bRGB(P, X + 1, Y) + KeyCode) Mod 256)

            Next P
        Next X
        
        
    Next Y
   
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
    

    If Len(UndoText) = 0 Then UndoText = "Decrypt"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub



Public Sub Dither(ByVal Colors As Long, Optional ByVal UndoText As String)

    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim RGBBytes()  As Byte
    Dim MapBytes()  As Byte
    Dim Pal()       As Long
    Dim PalSize     As Long
'    Dim I           As Long
'    Dim R           As Long
'    Dim G           As Long
'    Dim B           As Long
    Dim IdealPalette(0 To 255)   As Long
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Dither", "No Image Data"

    If Colors < 2 Or Colors > 256 Then ImgX.f_RaiseError 5, "ImgX.Effects.Dither", "Invalid value for Colors parameter. Valid values range from 2 to 256."
    
    ImgX.f_StartProgress "ImgX.Effects.Dither"
   
    'Allocate memory for an 8-bit (one byte per pixel) bitmap
    Set Buffer = ImgX.f_Buffer.Copy(False, 8)

    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Dither.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    'Perform the action.
    '
    ReDim Pal(0 To Colors - 1) As Long
    
    ImgX.f_Buffer.ChangeColorDepth 24
    
    If ISQuantizeRGBTo8Bit(ImgX.f_Buffer.Pointer, Buffer.Width, Buffer.Height, Buffer.Pointer, Colors, Pal(0)) = False Then
        ImgX.f_RaiseError pGetLastError(), "ImgX.Effects.Dither.ISQuantizeRGBTo8Bit", pGetErrorDesc(pGetLastError())
    End If
    
    Buffer.Palette = Pal
    
    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Dither to " & Colors & " Colors"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub


Public Sub Emboss(ByVal OffsetX As Long, ByVal OffsetY As Long, ByVal BaseColor As OLE_COLOR, Optional ByVal Channels As ImgX_ColorChannels = ixcAll, Optional ByVal OtherChannelsValue As Long = -1, Optional ByVal UndoText As String)


    Dim ImgX            As ImgX
    Dim OrgBytes()      As Byte
    Dim OrgSafeArray    As SAFEARRAY3D
    Dim Buffer          As ImgX_Buffer
    Dim BufferBytes()   As Byte
    Dim BufferSafeArray As SAFEARRAY3D
    Dim GrayBuffer      As ImgX_Buffer
    Dim GrayBytes()     As Byte
    Dim GraySafeArray   As SAFEARRAY2D
    Dim W&, H&, Z&
    Dim X&, XStart&, XStop&
    Dim Y&, YStart&, YStop&
    Dim R As Byte, G As Byte, B As Byte
    Dim BasePrimaries(0 To 2) As Long
    Dim DoRed As Boolean, DoGreen As Boolean, DoBlue As Boolean
    Dim Delta   As Long, NewVal As Long
    Dim OldPercent      As Long
    Dim NewPercent      As Long
    Dim Cancelled       As Boolean
    Dim FireProgress    As Boolean
    
    RaiseEvent GetImgX(ImgX)

    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Emboss", "No Image Data"

    DoRed = Channels And ixcRED
    DoGreen = Channels And ixcGREEN
    DoBlue = Channels And ixcBLUE
    If DoRed = False And DoGreen = False And DoBlue = False Then Exit Sub       'ImgX.f_RaiseError 5, "ImgX.Effects.Emboss", "No Channels Selected"

    BaseColor = ImgX.Support.TranslateColor(BaseColor)
    If BaseColor = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.Emboss", "Bad BaseColor Parameter"

    ImgX.Support.ExtractRGB BaseColor, R, G, B
    BasePrimaries(0) = R
    BasePrimaries(1) = G
    BasePrimaries(2) = B

    If OffsetX < -1 Or OffsetX > 1 Or OffsetY < -1 Or OffsetY > 1 Then ImgX.f_RaiseError 5, "ImgX.Effects.Emboss", "Valid Offsets are -1, 0, and +1"
    If OffsetX = 0 And OffsetY = 0 Then Exit Sub        'Duh!
    
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
    
    XStart = 0: XStop = W - 1
    YStart = 0: YStop = H - 1
    
    XStart = 0 - CLng(OffsetX = -1)         'When OffsetX = -1, XStart = 1
    XStop = (W - 1) + CLng(OffsetX = 1)     'When OffsetX = 1,  XStop = W - 2
    
    YStart = 0 - CLng(OffsetY = -1)         'When OffsetY = -1, YStart = 1
    YStop = (H - 1) + CLng(OffsetY = 1)     'When OffsetY = 1,  TStop = H - 2
    
    If OtherChannelsValue < 0 Or OtherChannelsValue > 255 Then OtherChannelsValue = -1
    
    ImgX.f_Buffer.ChangeColorDepth 24
    
    '
    'Allocate a 24 bit buffer the same size as the original
    '
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Emboss", pGetErrorDesc(ixeOutOfMemory)
    
    '
    'Allocate an 8 bit buffer the same size as the original and make a grayscale copy of the image data
    '
    Set GrayBuffer = ImgX.f_Buffer.Copy(False, 8)
    If GrayBuffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Emboss", pGetErrorDesc(ixeOutOfMemory)
    ISRGBToGrayScale8Bit ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, GrayBuffer.Pointer
    
    '
    'Point OrgBytes to the original Image
    '
    OrgSafeArray.cbElements = 1
    OrgSafeArray.cDims = 3                          'Width X Height X 3 (RGB)
    OrgSafeArray.pvData = ImgX.f_Buffer.Pointer
    
    OrgSafeArray.Bounds(0).lLbound = 0
    OrgSafeArray.Bounds(0).cElements = H
    OrgSafeArray.Bounds(1).lLbound = 0
    OrgSafeArray.Bounds(1).cElements = W
    OrgSafeArray.Bounds(2).lLbound = 0
    OrgSafeArray.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(OrgBytes), VarPtr(OrgSafeArray), 4     'Overwite the variable
    
    '
    'Point BufferBytes to the new Image where we will be writing the Embossed version
    '
    BufferSafeArray.cbElements = 1
    BufferSafeArray.cDims = 3                          'Width X Height X 3 (RGB)
    BufferSafeArray.pvData = Buffer.Pointer
    
    BufferSafeArray.Bounds(0).lLbound = 0
    BufferSafeArray.Bounds(0).cElements = H
    BufferSafeArray.Bounds(1).lLbound = 0
    BufferSafeArray.Bounds(1).cElements = W
    BufferSafeArray.Bounds(2).lLbound = 0
    BufferSafeArray.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(BufferBytes), VarPtr(BufferSafeArray), 4     'Overwite the variable
    
    '
    'Point GrayBytes to the grayscale Image
    '
    GraySafeArray.cbElements = 1
    GraySafeArray.cDims = 2                          'Width X Height
    GraySafeArray.pvData = GrayBuffer.Pointer
    
    GraySafeArray.Bounds(0).lLbound = 0
    GraySafeArray.Bounds(0).cElements = H
    GraySafeArray.Bounds(1).lLbound = 0
    GraySafeArray.Bounds(1).cElements = W
    
    CopyMemory ByVal VarPtrArray(GrayBytes), VarPtr(GraySafeArray), 4     'Overwite the variable
    
    
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    For Y = YStart To YStop
    
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    If OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
                    CopyMemory ByVal VarPtrArray(OrgBytes), 0&, 4       'Clean up!
                    CopyMemory ByVal VarPtrArray(BufferBytes), 0&, 4    'Clean up!
                    CopyMemory ByVal VarPtrArray(GrayBytes), 0&, 4      'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.Emboss", pGetErrorDesc(ixeOperationAborted)   'No Global Memory to clean up
                End If
            End If
        End If
    
        For X = XStart To XStop
            Delta = CLng(GrayBytes(X, Y)) - GrayBytes(X + OffsetX, Y + OffsetY) 'How much has the image changes?
            
            For Z = 0 To 2
                If (Z = 0 And DoRed) Or (Z = 1 And DoGreen) Or (Z = 2 And DoBlue) Then
                    NewVal = BasePrimaries(Z) + Delta
                    If NewVal < 0 Then NewVal = 0
                    If NewVal > 255 Then NewVal = 255
                    BufferBytes(Z, X, Y) = NewVal
                Else
                    If OtherChannelsValue = -1 Then
                        BufferBytes(Z, X, Y) = OrgBytes(Z, X, Y)
                    Else
                        BufferBytes(Z, X, Y) = OtherChannelsValue
                    End If
                End If
            Next Z
        Next X
    Next Y
    
    '
    'Clean up the extra Horizontal line
    '
    If OffsetY Then
        If YStart = 0 Then YStart = H
        YStart = YStart - 1
        For X = 0 To W - 1
            For Z = 0 To 2
                If (Z = 0 And DoRed) Or (Z = 1 And DoGreen) Or (Z = 2 And DoBlue) Then
                    NewVal = BasePrimaries(Z) + 64
                    If NewVal < 0 Then NewVal = 0
                    If NewVal > 255 Then NewVal = 255
                    BufferBytes(Z, X, YStart) = NewVal
                Else
                    If OtherChannelsValue = -1 Then
                        BufferBytes(Z, X, YStart) = OrgBytes(Z, X, YStart)
                    Else
                        BufferBytes(Z, X, YStart) = OtherChannelsValue
                    End If
                End If
            Next Z
        Next X
    End If
    
    '
    'Clean up the extra Vertical line
    '
    If OffsetX Then
        If XStart = 0 Then XStart = W
        XStart = XStart - 1
        For Y = 0 To H - 1
            For Z = 0 To 2
                If (Z = 0 And DoRed) Or (Z = 1 And DoGreen) Or (Z = 2 And DoBlue) Then
                    NewVal = BasePrimaries(Z) + 64
                    If NewVal < 0 Then NewVal = 0
                    If NewVal > 255 Then NewVal = 255
                    BufferBytes(Z, XStart, Y) = NewVal
                Else
                    If OtherChannelsValue = -1 Then
                        BufferBytes(Z, XStart, Y) = OrgBytes(Z, XStart, Y)
                    Else
                        BufferBytes(Z, XStart, Y) = OtherChannelsValue
                    End If
                End If
            Next Z
        Next Y
    End If
    
    
    CopyMemory ByVal VarPtrArray(OrgBytes), 0&, 4       'Clean up!
    CopyMemory ByVal VarPtrArray(BufferBytes), 0&, 4    'Clean up!
    CopyMemory ByVal VarPtrArray(GrayBytes), 0&, 4      'Clean up!
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False

    If Len(UndoText) = 0 Then UndoText = "Emboss"
    ImgX.f_SetBuffer Buffer, UndoText
        
    
End Sub
Public Sub Encrypt(ByVal Key As String, Optional ByVal UndoText As String)
    
    Dim ImgX            As ImgX
    Dim Buffer          As ImgX_Buffer
    Dim bKey()          As Byte
    Dim KeySize         As Long
    Dim KeyCode         As Long
    
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim R               As Byte
    Dim G               As Byte
    Dim B               As Byte
    Dim X               As Long
    Dim Y               As Long
    Dim W               As Long
    Dim H               As Long
    Dim P               As Long
    Dim OldPercent      As Long
    Dim NewPercent      As Long
    Dim Cancelled       As Boolean
    Dim FireProgress    As Boolean
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Encrypt", "No Image Data"
    
    Key = pExpandGUID(Trim(Key))  'If it's a GUID, then extract the hex values
    
    KeySize = Len(Key)
    If KeySize < 6 Then ImgX.f_RaiseError 5, "ImgX.Effects.Encrypt", "Key must be at least 6 bytes long"
    
    ReDim bKey(0 To KeySize - 1) As Byte
    
    '
    'Convert to Bytes
    '
    For Y = 1 To KeySize
        bKey(Y - 1) = Asc(Mid(Key, Y, 1))
        P = P + bKey(Y - 1)
    Next Y
    
    '
    'Scramble a little more (Just in case it's plain text)
    '
    For Y = 1 To KeySize - 1
        bKey(Y) = (CLng(bKey(Y)) + CLng(bKey(Y - 1)) + P) Mod 256
    Next Y
    
    '
    'Copy the current Buffer
    '
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
    
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Encrypt", pGetErrorDesc(ixeOutOfMemory)

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = H
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = W
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4     'Overwite the variable
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    For Y = 0 To H - 1
    
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    If OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
                    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.Encrypt", pGetErrorDesc(ixeOperationAborted)   'No Global Memory to clean up
                End If
            End If
        End If
        
        For X = W - 2 To 0 Step -1
            KeyCode = bKey(X Mod KeySize)
            For P = 0 To 2
                            
                bRGB(P, X, Y) = bRGB(P, X, Y) Xor ((bRGB(P, X + 1, Y) + KeyCode) Mod 256)

            Next P
        Next X
    
        For X = 1 To W - 1
            KeyCode = bKey(X Mod KeySize)
            For P = 0 To 2
                            
                bRGB(P, X, Y) = bRGB(P, X, Y) Xor ((bRGB(P, X - 1, Y) + KeyCode) Mod 256)

            Next P
        Next X
    
    Next Y
    

    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
    
    If Len(UndoText) = 0 Then UndoText = "Encrypt"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub Flip(ByVal Direction As ImgX_Orientation, Optional ByVal UndoText As String)
    
    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Flip", "No Image Data"
    
    If Direction <> ixoHorizontal And Direction <> ixoVertical Then ImgX.f_RaiseError 5, "ImgX.Effects.Flip", "Invalid Direction Parameter"
        
    ImgX.f_StartProgress "ImgX.Effects.Flip"
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Flip.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    '
    'Perform the action.
    '
    If Direction = ixoHorizontal Then
    
        If ISFlipHorizontalRGB(Buffer.Pointer, Buffer.Width, Buffer.Height) = False Then
            ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Flip.ISFlipHorizontalRGB", pGetErrorDesc(pGetLastError)
        End If
        
        If Len(UndoText) = 0 Then UndoText = "Flip Horizontal"
    
    Else    'Direction = ixoVertical
        
        If ISVertFlipBuf(Buffer.Pointer, Buffer.Width * 3, Buffer.Height) = False Then   'RGB is 3 bytes per pixel
            ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Flip.ISVertFlipBuf", pGetErrorDesc(pGetLastError)
        End If
    
        If Len(UndoText) = 0 Then UndoText = "Flip Vertical"
        
    End If
    ImgX.f_StopProgress
    
    ImgX.f_SetBuffer Buffer, UndoText
End Sub
Public Sub Skew(ByVal Direction As ImgX_Orientation, ByVal Offset As Long, ByVal BackColor As OLE_COLOR, Optional ByVal UndoText As String)
    
    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
    
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Skew", "No Image Data"
    
    If Direction <> ixoHorizontal And Direction <> ixoVertical Then ImgX.f_RaiseError 5, "ImgX.Effects.Skew", "Invalid Direction Parameter"
    
    If Offset = 0 Then Exit Sub

    ImgX.f_StartProgress "ImgX.Effects.Skew"
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = New ImgX_Buffer
    If Direction = ixoHorizontal Then
        If Not Buffer.Allocate(ImgX.f_Buffer.Width + Abs(Offset), ImgX.f_Buffer.Height, 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Skew.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    Else
        If Not Buffer.Allocate(ImgX.f_Buffer.Width, ImgX.f_Buffer.Height + Abs(Offset), 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Skew.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    End If
    
    ImgX.f_Buffer.ChangeColorDepth 24
    
    '
    'Perform the action.
    '
    If Direction = ixoHorizontal Then
    
        If ISShearRGBX(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Buffer.Pointer, Offset, BackColor) = False Then
            ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Skew.ISShearRGBX", pGetErrorDesc(pGetLastError)
        End If
        
        If Len(UndoText) = 0 Then UndoText = "Skew Horizontal " & Offset
    
    Else    'Direction = ixoVertical
        
        If ISShearRGBY(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Buffer.Pointer, Offset, BackColor) = False Then
            ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Skew.ISShearRGBY", pGetErrorDesc(pGetLastError)
        End If
    
        If Len(UndoText) = 0 Then UndoText = "Skew Vertical " & Offset
        
    End If
    ImgX.f_StopProgress
    
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub GrayScale(Optional ByVal UndoText As String)

    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.GrayScale", "No Image Data"
    
    ImgX.f_StartProgress "ImgX.Effects.GrayScale"
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.GrayScale.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    '
    'Perform the action.
    '
    If ISRGBToGrayScale24(Buffer.Pointer, Buffer.Width, Buffer.Height) = False Then
        ImgX.f_RaiseError pGetLastError, "ImgX.Effects.GrayScale.ISRGBToGrayScale24", pGetErrorDesc(pGetLastError)
    End If

    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Gray Scale"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub Mosaic(ByVal BlockSizeX As Long, ByVal BlockSizeY As Long, Optional ByVal Channels As ImgX_ColorChannels = ixcAll, Optional ByVal UndoText As String)
    'This function will Average an X by Y block of pixels to create a mosaic effect.
    'It does not use ImgSource.


    Dim ImgX            As ImgX
    Dim Buffer          As ImgX_Buffer
    Dim Bytes()         As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim DoRed           As Boolean
    Dim DoGreen         As Boolean
    Dim DoBlue          As Boolean
    Dim W&, H&, P&
    Dim X&, Y&, X2&, Y2&
    Dim FireProgress    As Boolean
    Dim NewPercent&, OldPercent&
    Dim Cancelled       As Boolean
    Dim LineTotalR&, LineTotalG&, LineTotalB&
    Dim BlockTotalR&, BlockTotalG&, BlockTotalB&
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Mosaic", "No Image Data"
    
    If BlockSizeX = 1 And BlockSizeY = 1 Then Exit Sub          'Would have no affect
    If BlockSizeX > ImgX.f_Buffer.Width Or BlockSizeY > ImgX.f_Buffer.Height Then ImgX.f_RaiseError 5, "ImgX.Effects.Mosaic", "Mosaic block size cannot be larger than the image."
    If BlockSizeX < 1 Or BlockSizeY < 1 Then ImgX.f_RaiseError 5, "ImgX.Effects.Mosaic", "Invalid Mosaic block size."

    If Channels < 0 Or Channels > ixcAll Then ImgX.f_RaiseError 5, "ImgX.Effects.Moasic", "Invalid Channels Parameter"
    DoRed = Channels And ixcRED
    DoGreen = Channels And ixcGREEN
    DoBlue = Channels And ixcBLUE
    

    '
    'Crop to shave off overlap of the blocksize
    '
    W = ImgX.f_Buffer.Width - ImgX.f_Buffer.Width Mod BlockSizeX
    H = ImgX.f_Buffer.Height - ImgX.f_Buffer.Height Mod BlockSizeY
    
    
    If W <> ImgX.f_Buffer.Width Or H <> ImgX.f_Buffer.Height Then
        '
        'Allocate a buffer to hold the cropped image
        '
        Set Buffer = New ImgX_Buffer
        If Not Buffer.Allocate(W, H, 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Mosaic", pGetErrorDesc(ixeOutOfMemory)
        
        If ISCropRGB(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Buffer.Pointer, 0, 0, W, H) = False Then
            ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Mosaic.ISCropRGB", pGetErrorDesc(pGetLastError)
        End If
    Else
        '
        'Copy the current Buffer
        '
        Set Buffer = ImgX.f_Buffer.Copy(True, 24)
        If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Mosaic", pGetErrorDesc(ixeOutOfMemory)
    End If
    

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = Buffer.Height
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = Buffer.Width
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(Bytes), VarPtr(SafeArrayRGB), 4     'Overwite the variable

    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False

    For Y = 0 To H - 1 Step BlockSizeY
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.Mosaic", pGetErrorDesc(ixeOperationAborted)
            End If
        End If

        For X = 0 To W - 1 Step BlockSizeX
            BlockTotalR = 0:  BlockTotalG = 0:  BlockTotalB = 0
            '
            'Calculate the block color
            '
            For Y2 = 0 To BlockSizeY - 1
                LineTotalR = 0: LineTotalG = 0: LineTotalB = 0
                
                For X2 = 0 To BlockSizeX - 1
                    If DoRed Then LineTotalR = LineTotalR + Bytes(0, X + X2, Y + Y2)
                    If DoGreen Then LineTotalG = LineTotalG + Bytes(1, X + X2, Y + Y2)
                    If DoBlue Then LineTotalB = LineTotalB + Bytes(2, X + X2, Y + Y2)
                Next X2
                
                If DoRed Then BlockTotalR = BlockTotalR + LineTotalR / BlockSizeX
                If DoGreen Then BlockTotalG = BlockTotalG + LineTotalG / BlockSizeX
                If DoBlue Then BlockTotalB = BlockTotalB + LineTotalB / BlockSizeX
            Next Y2

            If DoRed Then BlockTotalR = BlockTotalR / BlockSizeY
            If DoGreen Then BlockTotalG = BlockTotalG / BlockSizeY
            If DoBlue Then BlockTotalB = BlockTotalB / BlockSizeY

            '
            'Write the block color
            '
            For Y2 = 0 To BlockSizeY - 1
                For X2 = 0 To BlockSizeX - 1
                    If DoRed Then Bytes(0, X + X2, Y + Y2) = BlockTotalR
                    If DoGreen Then Bytes(1, X + X2, Y + Y2) = BlockTotalG
                    If DoBlue Then Bytes(2, X + X2, Y + Y2) = BlockTotalB
                Next X2
            Next Y2
        Next X
    Next Y

    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(Bytes), 0&, 4       'Clean up!

    If Len(UndoText) = 0 Then UndoText = "Mosaic " & BlockSizeX & " x " & BlockSizeY
    ImgX.f_SetBuffer Buffer, UndoText
End Sub


Public Sub Negative(Optional ByVal Color As OLE_COLOR = vbWhite, Optional ByVal UndoText As String)
    Dim ImgX            As ImgX
    Dim Buffer          As ImgX_Buffer
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim R               As Byte
    Dim G               As Byte
    Dim B               As Byte
    Dim X               As Long
    Dim Y               As Long
    Dim OldPercent      As Long
    Dim NewPercent      As Long
    Dim Cancelled       As Boolean
    Dim FireProgress    As Boolean
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Negative", "No Image Data"
    
    '
    'Make sure the color is valid.  Translate system colors
    '
    Color = ImgX.Support.TranslateColor(Color)
    If Color = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.Negative", "Bad Color Parameter"
    
    '
    'Break out the primaries
    '
    ImgX.Support.ExtractRGB Color, R, G, B
    
    '
    'Copy the current Buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Negative", pGetErrorDesc(ixeOutOfMemory)

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = Buffer.Height
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = Buffer.Width
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4     'Overwite the variable
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
        
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    For Y = 0 To Buffer.Height - 1
    
        If FireProgress Then
            NewPercent = Y / Buffer.Height * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    If OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
                    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.Negative", pGetErrorDesc(ixeOperationAborted)   'No Global Memory to clean up
                End If
            End If
        End If
        
        For X = 0 To Buffer.Width - 1
            bRGB(0, X, Y) = bRGB(0, X, Y) Xor R
            bRGB(1, X, Y) = bRGB(1, X, Y) Xor G
            bRGB(2, X, Y) = bRGB(2, X, Y) Xor B
        Next X
    Next Y
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
    
    If Len(UndoText) = 0 Then UndoText = "Negative (" & R & "," & G & "," & B & ")"
    ImgX.f_SetBuffer Buffer, UndoText

End Sub
Public Sub Overlay(ByVal TopImage As Object, Optional ByVal L As Long, Optional ByVal T As Long, Optional ByVal Opacity As Long = 100, Optional ByVal TranspColor As OLE_COLOR = -1, Optional ByVal UndoText As String)

    '
    'This method wil overlay an image on top of the current image.  The image may be passed in either
    'encapsulated in a picture object or an ImgX object.  The image is passed into ImgX.f_OverlayBuffer
    'as the bottom image, bot the top as you might expect.  This is because f_OverlayBuffer actually
    'alters the bottom image.  We don't want it altering our original image.  This is why we reciprocate
    'the opacity when we call f_OverlayBuffer.
    

    Dim ImgX        As ImgX
    Dim TopImgX     As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim TopBuffer   As ImgX_Buffer
    Dim RC          As Boolean
    Dim W&, H&, P&
    
    RaiseEvent GetImgX(ImgX)

    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Overlay", "No Image Data"

    If Not TypeOf TopImage Is IPicture And Not TypeOf TopImage Is ImgX Then
        ImgX.f_RaiseError 5, "ImgX.Effects.Overlay", "TopImage parameter must be an ImgX object or a Picture object."
    End If

    '
    'Ensure parms are valid
    '
    If Opacity < 1 Then Opacity = 1
    If Opacity > 100 Then Opacity = 100
    If TranspColor <> -1 Then TranspColor = ImgX.Support.TranslateColor(TranspColor) 'If it is a system color, make it an RGB color

    '
    'Determine the Width & Height
    '
    If TypeOf TopImage Is IPicture Then
        '
        'Convert HiMetric to Pixels
        '
        W = Round((TopImage.Width * 0.5669292) / Screen.TwipsPerPixelX)
        H = Round((TopImage.Height * 0.5669292) / Screen.TwipsPerPixelY)
    
    Else    'TypeOf TopImage Is ImgX
        Set TopImgX = TopImage
        If TopImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Overlay", "Overlay ImgX contains no image data."
        W = TopImgX.Width    'Early Binding
        H = TopImgX.Height
    End If

    '
    'Make sure it fits in the window
    '
    If L > ImgX.f_Buffer.Width Or T > ImgX.f_Buffer.Height Or L + W <= 0 Or T + H <= 0 Then Exit Sub


    ImgX.f_StartProgress "ImgX.Effects.Overlay"
    
    
    '
    'Convert TopImage into an ImgX_Buffer object
    '
    If TypeOf TopImage Is IPicture Then   'Don't need to do this from ImgX object
        '
        'Convert the Overlay image into a RGB buffer
        '
        P = ISHBITMAPToRGB(TopImage.handle, W, H, ImgX.Support.ScreenDC, TopImage.hPal)
        If P = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Overlay.ISHBITMAPToRGB", pGetErrorDesc(pGetLastError)
        
        Set TopBuffer = New ImgX_Buffer
        TopBuffer.SetBuffer P, W, H, 24

    Else    'TypeOf TopImage Is ImgX
        
        Set TopBuffer = TopImgX.f_Buffer.Copy(True, 24)
        If TopBuffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Overlay", pGetErrorDesc(ixeOutOfMemory)
    
    End If



    On Error Resume Next       'Catch any error from f_OverlayBuffer
    
    '
    'Copy the current Image Data
    '
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Overlay", pGetErrorDesc(ixeOutOfMemory)
    
    'Perform the overlay
    '
    ImgX.f_OverlayBuffer TopBuffer, Buffer, L, T, Opacity, TranspColor

    'If there was an error, clean up and re-raise it
    If Err Then
        On Error GoTo 0
        ImgX.f_RaiseError Err.Number, "ImgX.Effects.Overlay" & Err.Source, Err.Description
    End If
    On Error GoTo 0
    
    ImgX.f_StopProgress

    If Len(UndoText) = 0 Then UndoText = "Overlay " & Opacity & "%"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub ReplaceColor(ByVal OldColor As OLE_COLOR, ByVal NewColor As OLE_COLOR, Optional ByVal Tolerance As Long = 0, Optional ByVal UndoText As String)
    
    Dim ImgX            As ImgX
    Dim Buffer          As ImgX_Buffer
    Dim bRGB()          As Byte
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim R               As Byte
    Dim G               As Byte
    Dim B               As Byte
    Dim X               As Long
    Dim Y               As Long
    Dim W               As Long
    Dim H               As Long
    Dim OldPercent      As Long
    Dim NewPercent      As Long
    Dim Cancelled       As Boolean
    Dim FireProgress    As Boolean
    
    Dim oRed As Long, oGreen As Long, oBlue As Long
    Dim nRed As Long, nGreen As Long, nBlue As Long
    
    If Tolerance < 0 Then Tolerance = 0
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.ReplaceColor", "No Image Data"
    
    '
    'Make sure the colors are valid.  Translate system colors
    '
    OldColor = ImgX.Support.TranslateColor(OldColor)
    NewColor = ImgX.Support.TranslateColor(NewColor)
    If OldColor = -1 Or NewColor = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.ReplaceColor", "Bad Color Parameter"
    
    '
    'Break out the primaries
    '
    ImgX.Support.ExtractRGB OldColor, R, G, B
    oRed = R:     oGreen = G:     oBlue = B
    
    ImgX.Support.ExtractRGB NewColor, R, G, B
    nRed = R:     nGreen = G:     nBlue = B
    
    '
    'Copy the image data
    '
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
        
    Set Buffer = ImgX.f_Buffer.Copy(True, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Negative", pGetErrorDesc(ixeOutOfMemory)
    
    '
    'Make a safearray and point our byte array to the image data
    '
    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = H
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = W
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(bRGB), VarPtr(SafeArrayRGB), 4     'Overwite the variable
        
    'Access the pixel data in this format hRGB( RGB|0,1,2| , X, Y)
        
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    For Y = 0 To H - 1
    
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    If OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
                    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.ReplaceColor", pGetErrorDesc(ixeOperationAborted)   'No Global Memory to clean up
                End If
            End If
        End If
        
        For X = 0 To W - 1
            If Abs(CLng(bRGB(0, X, Y)) - oRed) _
             + Abs(CLng(bRGB(1, X, Y)) - oGreen) _
             + Abs(CLng(bRGB(2, X, Y)) - oBlue) <= Tolerance Then
             
                bRGB(0, X, Y) = nRed
                bRGB(1, X, Y) = nGreen
                bRGB(2, X, Y) = nBlue
             
            End If
        Next X
    Next Y
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(bRGB), 0&, 4       'Clean up!
    
    If Len(UndoText) = 0 Then UndoText = "Replace RGB(" & oRed & "," & oGreen & "," & oBlue & ") with RGB(" & nRed & "," & nGreen & "," & nBlue & ")"
    ImgX.f_SetBuffer Buffer, UndoText
    
End Sub


Public Sub Resize(ByVal NewWidth As Long, Optional ByVal NewHeight As Long = 0, Optional ByVal Decimate As Boolean = True, Optional ByVal MaskColor As OLE_COLOR = -1, Optional ByVal UndoText As String)

    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    
    RaiseEvent GetImgX(ImgX)
        
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Resize", "No Image Data"
    
    If NewWidth < 1 Then ImgX.f_RaiseError 5, "ImgX.Effects.Resize", "Invalid Width Parameter"
    
    '
    'Get proportions and apply new max width/height
    '
    If NewHeight < 1 Then
        If ImgX.f_Buffer.Width > ImgX.f_Buffer.Height Then
            NewHeight = ImgX.f_Buffer.Height * NewWidth / ImgX.f_Buffer.Width
        Else
            NewHeight = NewWidth
            NewWidth = ImgX.f_Buffer.Width * NewWidth / ImgX.f_Buffer.Height
        End If
    End If
    
    ImgX.f_StartProgress "ImgX.Effects.Resize"
    
    If MaskColor <> -1 Then MaskColor = ImgX.Support.TranslateColor(MaskColor)   'Returns -1 on error
    
    '
    'Perform the action.
    '
    Set Buffer = New ImgX_Buffer
    If Not Buffer.Allocate(NewWidth, NewHeight, 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Resize.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)

    ImgX.f_Buffer.ChangeColorDepth 24
    
    If MaskColor = -1 Then
        If NewWidth < ImgX.f_Buffer.Width And NewHeight < ImgX.f_Buffer.Height And Decimate Then
            If ISDecimateRGB(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Buffer.Pointer, Buffer.Width, Buffer.Height) = False Then
                ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Resize.ISDecimateRGB", pGetErrorDesc(pGetLastError)
            End If
        Else
            If ISResizeRGB(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Buffer.Pointer, Buffer.Width, Buffer.Height) = False Then
                ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Resize.ISResizeRGB", pGetErrorDesc(pGetLastError)
            End If
        End If
    
    Else
        If ISResizeRGBMasked(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Buffer.Pointer, Buffer.Width, Buffer.Height, MaskColor) = False Then
            ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Resize.ISResizeRGBMasked", pGetErrorDesc(pGetLastError)
        End If
    End If

    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Resize " & NewWidth & " x " & NewHeight
    ImgX.f_SetBuffer Buffer, UndoText
End Sub
Public Sub ResizeCanvas(ByVal NewWidth As Long, ByVal NewHeight As Long, ByVal BackColor As OLE_COLOR, Optional ByVal XOffset As Long = 0, Optional ByVal YOffset As Long = 0, Optional ByVal UndoText As String)
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim EC&, ES$, ED$
    
    RaiseEvent GetImgX(ImgX)
        
    If NewWidth = 0 And NewHeight = 0 And XOffset = 0 And YOffset = 0 Then Exit Sub     'Nothing to do.
        
    If NewWidth <= 0 Or NewHeight <= 0 Then ImgX.f_RaiseError 5, "ImgX.Effects.ResizeCanvas", "Invalid Width or Height Parameter"
    BackColor = ImgX.Support.TranslateColor(BackColor)
    If BackColor = -1 Then ImgX.f_RaiseError 5, "ImgX.Effects.ResizeCanvas", "Invalid BackColor Parameter"
    
    Set Buffer = New ImgX_Buffer
    If Not Buffer.Allocate(NewWidth, NewHeight, 24) Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ResizeCanvas.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    Buffer.Fill BackColor

    If Not ImgX.f_Buffer.IsEmpty Then 'Do we have a current image to overlay?
    
        ImgX.f_StartProgress "ImgX.Effects.ResizeCanvas"
        
        ImgX.f_Buffer.ChangeColorDepth 24
        
        On Error Resume Next
        ImgX.f_OverlayBuffer ImgX.f_Buffer, Buffer, XOffset, YOffset, 100, -1
        If Err Then
            EC = Err.Number: ES = Err.Source: ED = Err.Description
            On Error GoTo 0
            ImgX.f_RaiseError EC, "ImgX.Effects.ResizeCanvas" & ES, ED
        End If
        On Error GoTo 0

        ImgX.f_StopProgress
    End If

    
    If Len(UndoText) = 0 Then UndoText = "Resize Canvas " & NewWidth & "x" & NewHeight
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub Rotate(ByVal Degrees As Single, Optional ByVal BackColor As OLE_COLOR, Optional ByVal UndoText As String)
    '
    'Degrees = Radians * 180 / PI
    '
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim Remainder   As Double
    Dim Radians     As Double
    Dim DegreeTenths As Long
    Dim W&, H&, P&
    
    DegreeTenths = Degrees * 10
    
    RaiseEvent GetImgX(ImgX)
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Rotate", "No Image Data"
    
    BackColor = ImgX.Support.TranslateColor(BackColor)
    If BackColor = -1 Then BackColor = vbBlack
    
    '
    'Tweak to 0 to 359.9  range
    '
    DegreeTenths = DegreeTenths Mod 3600
    If DegreeTenths < 0 Then DegreeTenths = DegreeTenths + 3600
    Radians = CDbl(DegreeTenths) * 1.74532925199433E-03

    ImgX.f_StartProgress "ImgX.Effects.Rotate"
        
    Set Buffer = New ImgX_Buffer
    '
    'Perform the action.
    '
    ImgX.f_Buffer.ChangeColorDepth 24
    
    P = ISRotateRGB(ImgX.f_Buffer.Pointer, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, Radians, BackColor, W, H)
    
    Buffer.SetBuffer P, W, H, 24
    
    If Buffer.IsEmpty Then ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Rotate.ISRotateRGB", pGetErrorDesc(pGetLastError)
    
    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Rotate " & Format(DegreeTenths / 10, "0.0") & " Degrees"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub


Public Sub Sharpen(ByVal Percent As Long, Optional ByVal UndoText As String)
   
    Dim ImgX    As ImgX
    Dim Buffer  As ImgX_Buffer
    
    If Percent < 1 Then Exit Sub
    If Percent > 100 Then Percent = 100
    
    RaiseEvent GetImgX(ImgX)
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.Sharpen", "No Image Data"
    
    ImgX.f_StartProgress "ImgX.Effects.Sharpen"
    
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.Sharpen.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)
    
    '
    'Perform the action.
    '
    ImgX.f_Buffer.ChangeColorDepth 24
    
    If ISSharpenRGB(ImgX.f_Buffer.Pointer, Buffer.Width, Buffer.Height, Buffer.Pointer, Percent) = False Then
        ImgX.f_RaiseError pGetLastError, "ImgX.Effects.Sharpen.ISSharpenRGB", pGetErrorDesc(pGetLastError)
    End If

    ImgX.f_StopProgress
    
    If Len(UndoText) = 0 Then UndoText = "Sharpen " & Percent & "%"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub ShiftChannels(ByVal Channels As ImgX_ColorChannels, ByVal OffsetX As Long, ByVal OffsetY As Long, Optional ByVal UndoText As String)
    'This function will displace a channel within an image by a defined offset.  It is written in VB.
    'It does not use ImgSource.
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim Bytes()     As Byte             'To allow VB to manipulate the image
    Dim OrgBytes()  As Byte             'Points to the original Image
    Dim NumBytes    As Long             'Total bytes needed for the image
    Dim NewPercent  As Long             'How far along are we?
    Dim OldPercent  As Long             'Keeps track of the last percent so we only fire Progress() once per percent.
    Dim DoRed       As Boolean
    Dim DoGreen     As Boolean
    Dim DoBlue      As Boolean
    Dim Cancelled   As Boolean
    Dim FireProgress    As Boolean
    Dim X&, Y&, W&, H&, X2&, Y2&
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim SafeArrayRGB2   As SAFEARRAY3D
    Dim ValidOffset     As Boolean
    
    'Debug.Print OffsetX & "," & OffsetY
    
    If OffsetX = 0 And OffsetY = 0 Then Exit Sub
    OffsetX = -OffsetX
    OffsetY = -OffsetY
    
    RaiseEvent GetImgX(ImgX)
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.ShiftChannels", "No Image Data"
    
    DoRed = Channels And ixcRED
    DoGreen = Channels And ixcGREEN
    DoBlue = Channels And ixcBLUE
    
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.ShiftChannels.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = H
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = W
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(Bytes), VarPtr(SafeArrayRGB), 4     'Overwite the variable

    ImgX.f_Buffer.ChangeColorDepth 24
    
    SafeArrayRGB2 = SafeArrayRGB                 'Copy the other one
    SafeArrayRGB2.pvData = ImgX.f_Buffer.Pointer 'Except use a different pointer
    
    CopyMemory ByVal VarPtrArray(OrgBytes), VarPtr(SafeArrayRGB2), 4     'Overwite the variable
    
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    'On Error Resume Next
    For Y = 0 To H - 1
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    CopyMemory ByVal VarPtrArray(Bytes), 0&, 4       'Clean up!
                    CopyMemory ByVal VarPtrArray(OrgBytes), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.ShiftChannels", pGetErrorDesc(ixeOperationAborted)
                End If
            End If
        End If
        
        For X = 0 To W - 1
            X2 = X + OffsetX
            Y2 = Y + OffsetY
            ValidOffset = X2 >= 0 And X2 < W And Y2 >= 0 And Y2 < H
            
            
            If DoRed Then
                If ValidOffset Then
                    Bytes(0, X, Y) = OrgBytes(0, X2, Y2)
                Else
                    Bytes(0, X, Y) = 0
                End If
            Else
                Bytes(0, X, Y) = OrgBytes(0, X, Y)
            End If

            If DoGreen Then
                If ValidOffset Then
                    Bytes(1, X, Y) = OrgBytes(1, X2, Y2)
                Else
                    Bytes(1, X, Y) = 0
                End If
            Else
                Bytes(1, X, Y) = OrgBytes(1, X, Y)
            End If

            If DoBlue Then
                If ValidOffset Then
                    Bytes(2, X, Y) = OrgBytes(2, X2, Y2)
                Else
                    Bytes(2, X, Y) = 0
                End If
            Else
                Bytes(2, X, Y) = OrgBytes(2, X, Y)
            End If
        
        Next X
    Next Y
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(Bytes), 0&, 4       'Clean up!
    CopyMemory ByVal VarPtrArray(OrgBytes), 0&, 4       'Clean up!
    
    
    If Len(UndoText) = 0 Then UndoText = "Shift Channels"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub

Public Sub SwapChannels(Optional ByVal Red As ImgX_ColorChannels = ixcRED, Optional ByVal Green As ImgX_ColorChannels = ixcGREEN, Optional ByVal Blue As ImgX_ColorChannels = ixcBLUE, Optional ByVal BlackValue As Byte = vbBlack, Optional ByVal UndoText As String)
    'This function will swap any two channels.  It is written in VB.  It does not use ImgSource.  ImgSource's
    'ISSwapRedAndBlue is limited to only those two channels and does not return progress info.  This
    'function does return progress info.
    
    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim Bytes()     As Byte             'To allow VB to manipulate the image
    Dim OrgBytes()  As Byte             'Points to the original Image
    Dim NumBytes    As Long             'Total bytes needed for the image
    Dim NewPercent  As Long             'How far along are we?
    Dim OldPercent  As Long             'Keeps track of the last percent so we only fire Progress() once per percent.
    Dim Cancelled   As Boolean
    Dim FireProgress    As Boolean
    Dim X&, Y&, W&, H&
    Dim SafeArrayRGB    As SAFEARRAY3D
    Dim SafeArrayRGB2   As SAFEARRAY3D
    Dim ValidOffset     As Boolean
    
    Dim R&, G&, B&, RG&, GB&, BR&, All&
    Dim DoRG    As Boolean
    Dim DoGB    As Boolean
    Dim DoBR    As Boolean
    Dim DoAll   As Boolean
    
    RaiseEvent GetImgX(ImgX)
    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Effects.SwapChannels", "No Image Data"
    
    If Red < 0 Or Red > ixcAll Then ImgX.f_RaiseError 5, "ImgX.Effects.SwapChannels", "Invalid Red Parameter"
    If Green < 0 Or Green > ixcAll Then ImgX.f_RaiseError 5, "ImgX.Effects.SwapChannels", "Invalid Green Parameter"
    If Blue < 0 Or Blue > ixcAll Then ImgX.f_RaiseError 5, "ImgX.Effects.SwapChannels", "Invalid Blue Parameter"
    
    W = ImgX.f_Buffer.Width
    H = ImgX.f_Buffer.Height
    
    '
    'Allocate a duplicate RGB buffer
    '
    Set Buffer = ImgX.f_Buffer.Copy(False, 24)
    If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Effects.SwapChannels.GlobalAlloc", pGetErrorDesc(ixeOutOfMemory)

    SafeArrayRGB.cbElements = 1
    SafeArrayRGB.cDims = 3                          'Width X Height X 3 (RGB)
    SafeArrayRGB.pvData = Buffer.Pointer
    
    SafeArrayRGB.Bounds(0).lLbound = 0
    SafeArrayRGB.Bounds(0).cElements = H
    SafeArrayRGB.Bounds(1).lLbound = 0
    SafeArrayRGB.Bounds(1).cElements = W
    SafeArrayRGB.Bounds(2).lLbound = 0
    SafeArrayRGB.Bounds(2).cElements = 3
    
    CopyMemory ByVal VarPtrArray(Bytes), VarPtr(SafeArrayRGB), 4     'Overwite the variable

    ImgX.f_Buffer.ChangeColorDepth 24
    
    SafeArrayRGB2 = SafeArrayRGB                'Copy the other one
    SafeArrayRGB2.pvData = ImgX.f_Buffer.Pointer 'Except use a different pointer
    
    CopyMemory ByVal VarPtrArray(OrgBytes), VarPtr(SafeArrayRGB2), 4     'Overwite the variable
    
    FireProgress = ImgX.Attrib(ixaFireProgressEvent)
    If FireProgress Then ImgX.f_RaiseProgress 0, False
    
    'On Error Resume Next
    
    DoRG = Red = ixcYellow Or Green = ixcYellow Or Blue = ixcYellow
    DoBR = Red = ixcMagenta Or Green = ixcMagenta Or Blue = ixcMagenta
    DoGB = Red = ixcCyan Or Green = ixcCyan Or Blue = ixcCyan
    DoAll = Red = ixcAll Or Green = ixcAll Or Blue = ixcAll
    
    For Y = 0 To H - 1
        If FireProgress Then
            NewPercent = Y / H * 100
            If NewPercent <> OldPercent Then
                OldPercent = NewPercent
                ImgX.f_RaiseProgress NewPercent, Cancelled
                If Cancelled Then
                    CopyMemory ByVal VarPtrArray(Bytes), 0&, 4       'Clean up!
                    CopyMemory ByVal VarPtrArray(OrgBytes), 0&, 4       'Clean up!
                    ImgX.f_RaiseError ixeOperationAborted, "ImgX.Effects.SwapChannels", pGetErrorDesc(ixeOperationAborted)
                End If
            End If
        End If
        
        For X = 0 To W - 1
            R = OrgBytes(0, X, Y)
            G = OrgBytes(1, X, Y)
            B = OrgBytes(2, X, Y)
            'Only do the multiply if need be
            If DoRG Then RG = (R + G) / 2
            If DoBR Then BR = (B + R) / 2
            If DoGB Then GB = (G + B) / 2
            If DoAll Then All = (R + G + B) / 3
            
            Select Case Red
                Case 0: Bytes(0, X, Y) = BlackValue
                Case 1: Bytes(0, X, Y) = R
                Case 2: Bytes(0, X, Y) = G
                Case 3: Bytes(0, X, Y) = RG
                Case 4: Bytes(0, X, Y) = B
                Case 5: Bytes(0, X, Y) = BR
                Case 6: Bytes(0, X, Y) = GB
                Case 7: Bytes(0, X, Y) = All
            End Select
            Select Case Green
                Case 0: Bytes(1, X, Y) = BlackValue
                Case 1: Bytes(1, X, Y) = R
                Case 2: Bytes(1, X, Y) = G
                Case 3: Bytes(1, X, Y) = RG
                Case 4: Bytes(1, X, Y) = B
                Case 5: Bytes(1, X, Y) = BR
                Case 6: Bytes(1, X, Y) = GB
                Case 7: Bytes(1, X, Y) = All
            End Select
            Select Case Blue
                Case 0: Bytes(2, X, Y) = BlackValue
                Case 1: Bytes(2, X, Y) = R
                Case 2: Bytes(2, X, Y) = G
                Case 3: Bytes(2, X, Y) = RG
                Case 4: Bytes(2, X, Y) = B
                Case 5: Bytes(2, X, Y) = BR
                Case 6: Bytes(2, X, Y) = GB
                Case 7: Bytes(2, X, Y) = All
            End Select
        Next X
    Next Y
    
    If FireProgress And OldPercent < 100 Then ImgX.f_RaiseProgress 100, False
    
    CopyMemory ByVal VarPtrArray(Bytes), 0&, 4       'Clean up!
    CopyMemory ByVal VarPtrArray(OrgBytes), 0&, 4       'Clean up!
    
    
    If Len(UndoText) = 0 Then UndoText = "Swap Channels"
    ImgX.f_SetBuffer Buffer, UndoText
End Sub





