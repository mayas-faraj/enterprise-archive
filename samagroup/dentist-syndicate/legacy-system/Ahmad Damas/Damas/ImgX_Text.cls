VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ImgX_Text"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private Const OUT_DEFAULT_PRECIS = 0
Private Const DEFAULT_QUALITY = 0
Private Const DEFAULT_CHARSET = 1
Private Const DEFAULT_PITCH = 0
Private Const FF_DONTCARE = 0


Public Enum ImgX_FontWeights
    ixfwDontCare = 0
    ixfwThin = 1
    ixfwExtraLight = 2
    ixfwLight = 3
    ixfwNormal = 4
    ixfwMedium = 5
    ixfwSemiBold = 6
    ixfwBold = 7
    ixfwExtraBold = 8
    ixfwHeavy = 9
End Enum

Public Enum ImgX_TextAlignments
    ixtaLeft = 0
    ixtaCenter = 1
    ixtaRight = 2
    ixtaJustified = 3
End Enum

Private pLogFont    As LOGFONT


Public Event GetImgX(ImgX As ImgX)
Private Sub pDrawJustifiedText(ByVal hDC As Long, Text As String, RECT As RECT)

    Dim Paragraphs()    As String
    Dim Words()         As String
    Dim ParaCount       As Long
    Dim WordCount       As Long
    Dim LastUsedWord    As Long
    Dim WordsInLine     As Long
    Dim LineOfText      As String
    Dim I               As Long
    Dim J               As Long
    Dim C               As String
    Dim Space           As Long
    Dim Size            As Size
    Dim X               As Long
    Dim Y               As Long
    Dim W               As Long

    X = RECT.Left
    Y = RECT.Top
    W = RECT.Right - RECT.Left
    
    
    
    ParaCount = 1
    ReDim Paragraphs(ParaCount - 1) As String
    
    For I = 1 To Len(Text)
        C = Mid(Text, I, 1)
        Select Case Asc(C)
            Case 13                     'Start a new paragraph.
                ParaCount = ParaCount + 1
                ReDim Preserve Paragraphs(ParaCount - 1) As String
                
            Case 9                      'Replace Tabs with two spaces
                Paragraphs(ParaCount - 1) = Paragraphs(ParaCount - 1) & "  "
                
            Case Is < 32, Is >= 127     'non printable characters ignored
            
            Case Else                   'Printable characters
                Paragraphs(ParaCount - 1) = Paragraphs(ParaCount - 1) & C
        End Select
    Next I
    
    For I = 0 To ParaCount - 1
        
        'Debug.Print "Paragraph: " & I + 1
        
        Erase Words
        WordCount = 0
        LastUsedWord = 0
        
        If Len(Paragraphs(I)) = 0 Then  'Just in case there is a paragraph with no words!  (Enter twice in a row)
            ReDim Words(0) As String
            Words(0) = " "
            WordCount = 1
        Else
            Do While Len(Paragraphs(I))
                ReDim Preserve Words(WordCount) As String
                
                Space = InStr(1, Paragraphs(I), " ")
                If Space Then
                    Words(WordCount) = Left(Paragraphs(I), Space - 1)
                    Paragraphs(I) = Mid(Paragraphs(I), Space + 1)
                Else
                    Words(WordCount) = Paragraphs(I)
                    Paragraphs(I) = ""
                End If
                
                'Debug.Print "Word: " & WordCount + 1 & " = '" & Words(WordCount) & "'"
                
                WordCount = WordCount + 1
            Loop
        End If
        
        Do
            WordsInLine = 1
            LineOfText = Words(LastUsedWord)
            
            For J = LastUsedWord + 1 To WordCount - 1
                
                GetTextExtentPoint32 hDC, LineOfText & " " & Words(J), Len(LineOfText & " " & Words(J)), Size
                If Size.CX <= W Then
                    LineOfText = LineOfText & " " & Words(J)
                    WordsInLine = WordsInLine + 1
                Else
                    Exit For
                End If
            Next J
            
            LastUsedWord = LastUsedWord + WordsInLine
            GetTextExtentPoint32 hDC, LineOfText, Len(LineOfText), Size
            If LastUsedWord < WordCount And WordsInLine > 1 Then SetTextJustification hDC, IIf(W - Size.CX < 0, 0, W - Size.CX), WordsInLine - 1
            ExtTextOut hDC, X, Y, ETO_CLIPPED, RECT, LineOfText, Len(LineOfText), 0
            'TextOut hdc, X, Y, LineOfText, Len(LineOfText)
            Y = Y + Size.CY
            SetTextJustification hDC, 0, WordsInLine    'Clear it.
            If Y > RECT.Bottom Then Exit For
            If LastUsedWord >= WordCount Then Exit Do
        Loop
    Next I

    

    Exit Sub
    
'
'    Dim LineOfText  As String
'    Dim SpacePos    As Long
'
'    Do
'        Text = Trim(Text)
'        SpacePos = InStr(1, " ", Text)
'        If SpacePos Then
'
'    Loop
'
'    'extTextOut hdc, RECT

End Sub

Private Sub pDrawBound(hDC As Long, Text As String, RECT As RECT, Points As Single, Alignment As ImgX_TextAlignments, Color As OLE_COLOR, Opacity As Long, Optional UndoText As String)

    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim TextBuffer  As ImgX_Buffer
    Dim ActualDraw  As Boolean   'Flag if we are rendering to the Image (hDC=0) or to the screen (hDC<>0)
    Dim ActualRECT  As RECT      'RECT to use when drawing to the image data
    Dim flags       As Long
    Dim hBitmap     As Long
    Dim OldhBitmap  As Long
    Dim hFont       As Long
    Dim OldhFont    As Long
    Dim BackColor   As OLE_COLOR
    Dim ForeColor   As OLE_COLOR
    Dim HBrush      As Long
    Dim LOGFONT     As LOGFONT
    Dim OldColor    As Long
    Dim OldMapMode  As Long
    Dim P           As Long


    RaiseEvent GetImgX(ImgX)

    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Text.DrawBound", "No Image Data"


    Color = ImgX.Support.TranslateColor(Color)
    If Color = -1 Then ImgX.f_RaiseError 5, "ImgX.Text.DrawBound", "Invalid Color Parameter"

    Select Case Alignment
        Case ixtaLeft, ixtaJustified:   flags = DT_LEFT     'We have to do Justified by hand!!
        Case ixtaCenter:                flags = DT_CENTER
        Case ixtaRight:                 flags = DT_RIGHT
    End Select

    flags = flags Or DT_WORDBREAK

    ActualDraw = hDC = 0

    If ActualDraw Then
        '
        'Make background black (unless the text color is black)
        '
        BackColor = IIf(Color = vbBlack, vbWhite, vbBlack)
        ForeColor = Not BackColor
        '
        'Create a Memory Device Context compatible with the Screen
        '
        hDC = CreateCompatibleDC(0)
        If hDC = 0 Then ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.DrawBound.CreateCompatibleDC", pGetErrorDesc(ixeDeviceContextErr)
    End If


    '
    'Create a Font object based on our font information
    '
    LOGFONT = pLogFont
    LOGFONT.lfHeight = (Points / 72) * GetDeviceCaps(hDC, LOGPIXELSY)

    hFont = CreateFontIndirect(LOGFONT)
    If hFont = 0 Then
        If ActualDraw Then DeleteDC hDC
        ImgX.f_RaiseError ixeFontError, "ImgX.Text.DrawBound.CreateFontIndirect", pGetErrorDesc(ixeFontError)
    End If

    OldhFont = SelectObject(hDC, hFont)
    If OldhFont = 0 Then
        If ActualDraw Then DeleteDC hDC
        DeleteObject hFont
        ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.DrawBound.SelectObject(hFont)", pGetErrorDesc(ixeDeviceContextErr)
    End If


    If ActualDraw Then
        ActualRECT.Left = 0
        ActualRECT.Top = 0
        ActualRECT.Right = RECT.Right - RECT.Left
        ActualRECT.Bottom = RECT.Bottom - RECT.Top

        If ActualRECT.Bottom <= ActualRECT.Top Then      'No Clipping.
            DrawTextEx hDC, Text, Len(Text), ActualRECT, flags Or DT_CALCRECT, 0
        End If


        '
        'Create a Bitmap with the same dimensions as our image
        '
        hBitmap = CreateCompatibleBitmap(hDC, ActualRECT.Right - ActualRECT.Left, ActualRECT.Bottom - ActualRECT.Top)
        If hBitmap = 0 Then
            SelectObject hDC, OldhFont
            DeleteObject hFont
            DeleteDC hDC
            ImgX.f_RaiseError ixeCrtCmpBmpFail, "ImgX.Text.DrawBound.CreateCompatibleBitmap", pGetErrorDesc(ixeCrtCmpBmpFail)
        End If

        '
        'Select the Bitmap into the Device Context
        '
        OldhBitmap = SelectObject(hDC, hBitmap)
        If OldhBitmap = 0 Then
            SelectObject hDC, OldhFont
            DeleteObject hFont
            DeleteObject hBitmap
            DeleteDC hDC
            ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.DrawBound.SelectObject(hBitmap)", pGetErrorDesc(ixeDeviceContextErr)
        End If

        '
        'Create a brush to draw the background color
        '
        HBrush = CreateSolidBrush(BackColor)
        If HBrush = 0 Then
            SelectObject hDC, OldhFont
            DeleteObject hFont
            SelectObject hDC, OldhBitmap
            DeleteObject hBitmap
            DeleteDC hDC
            ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.DrawBound.CreateSolidBrush", pGetErrorDesc(ixeDeviceContextErr)
        End If

        '
        'Fill in the backcolor and delete the brush
        '
        FillRect hDC, ActualRECT, HBrush
        DeleteObject HBrush

        SetBkColor hDC, BackColor
        'SetBkMode hDC, TRANSPARENT

    Else
        If RECT.Bottom <= RECT.Top Then flags = flags Or DT_NOCLIP
    End If



    OldMapMode = SetMapMode(hDC, MM_TEXT)   'Pixels!

    If ActualDraw Then
        OldColor = SetTextColor(hDC, ForeColor)
        If Alignment = ixtaJustified Then
            pDrawJustifiedText hDC, Text, ActualRECT
        Else
            DrawTextEx hDC, Text, Len(Text), ActualRECT, flags, 0
        End If
    Else
        OldColor = SetTextColor(hDC, Color)
        If Alignment = ixtaJustified Then
            pDrawJustifiedText hDC, Text, RECT
        Else
            DrawTextEx hDC, Text, Len(Text), RECT, flags, 0
        End If
    End If

    SetMapMode hDC, OldMapMode              'Restore the old mapping mode
    SetTextColor hDC, OldColor

    SelectObject hDC, OldhFont
    DeleteObject hFont

    If ActualDraw Then
        Set TextBuffer = New ImgX_Buffer
        P = ISHBITMAPToRGB(hBitmap, ActualRECT.Right, ActualRECT.Bottom, ImgX.Support.ScreenDC, 0)

        If P = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Text.DrawBound.ISHBITMAPToRGB", pGetErrorDesc(pGetLastError)

        TextBuffer.SetBuffer P, ActualRECT.Right, ActualRECT.Bottom, 24

        Set Buffer = ImgX.f_Buffer.Copy(True, 24)
        If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Text.DrawBound", pGetErrorDesc(ixeOutOfMemory)

        'Catch any error from f_OverlayBuffer
        On Error Resume Next

        'Replace the forecolor with the wanted color
        ISColorReplaceRGB TextBuffer.Pointer, TextBuffer.Width, TextBuffer.Height, ForeColor, Color

        ImgX.f_StartProgress "ImgX.Text.DrawBound"

        'Perform the overlay
        ImgX.f_OverlayBuffer TextBuffer, Buffer, RECT.Left, RECT.Top, Opacity, BackColor

        ImgX.f_StopProgress

        'If there was an error, clean up and re-raise it
        If Err Then ImgX.f_RaiseError Err.Number, "ImgX.Text.DrawBound.f_OverlayRGB" & Err.Source, Err.Description

        On Error GoTo 0

        'RGB = RGBOverlay

        SelectObject hDC, OldhBitmap
        DeleteObject hBitmap
        DeleteDC hDC

        If Len(UndoText) = 0 Then UndoText = "Draw Bound Text"
        ImgX.f_SetBuffer Buffer, UndoText
    End If
End Sub

Private Sub pDraw(hDC As Long, Text As String, X As Long, Y As Long, Points As Single, Color As OLE_COLOR, Opacity As Long, Optional UndoText As String)

    Dim ImgX        As ImgX
    Dim Buffer      As ImgX_Buffer
    Dim TextBuffer  As ImgX_Buffer
    Dim ActualDraw  As Boolean   'Flag if we are rendering to the Image (hDC=0) or to the screen (hDC<>0)
    Dim hBitmap     As Long
    Dim OldhBitmap  As Long
    Dim hFont       As Long
    Dim OldhFont    As Long
    Dim BackColor   As OLE_COLOR
    Dim ForeColor   As OLE_COLOR
    Dim HBrush      As Long
    Dim RECT        As RECT
    Dim LOGFONT     As LOGFONT
    Dim OldColor    As Long
    Dim OldMapMode  As Long
    Dim P           As Long

    RaiseEvent GetImgX(ImgX)

    If ImgX.f_Buffer.IsEmpty Then ImgX.f_RaiseError 5, "ImgX.Text.Draw", "No Image Data"

    Color = ImgX.Support.TranslateColor(Color)
    If Color = -1 Then ImgX.f_RaiseError 5, "ImgX.Text.Draw", "Invalid Color Parameter"

    ActualDraw = hDC = 0

    If ActualDraw Then
        '
        'Make background black (unless the text color is black)
        '
        BackColor = IIf(Color = vbBlack, vbWhite, vbBlack)
        ForeColor = IIf(BackColor = vbBlack, vbWhite, vbBlack)
        '
        'Create a Memory Device Context compatible with the Screen
        '
        hDC = CreateCompatibleDC(0)
        If hDC = 0 Then ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.Draw.CreateCompatibleDC", pGetErrorDesc(ixeDeviceContextErr)

        '
        'Create a Bitmap with the same dimensions as our image
        '
        hBitmap = CreateCompatibleBitmap(hDC, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height)
        If hBitmap = 0 Then
            DeleteDC hDC
            ImgX.f_RaiseError ixeCrtCmpBmpFail, "ImgX.Text.Draw.CreateCompatibleBitmap", pGetErrorDesc(ixeCrtCmpBmpFail)
        End If

        '
        'Select the Bitmap into the Device Context
        '
        OldhBitmap = SelectObject(hDC, hBitmap)
        If OldhBitmap = 0 Then
            DeleteObject hBitmap
            DeleteDC hDC
            ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.Draw.SelectObject(hBitmap)", pGetErrorDesc(ixeDeviceContextErr)
        End If

        '
        'Create a brush to draw the background color
        '
        HBrush = CreateSolidBrush(BackColor)
        If HBrush = 0 Then
            SelectObject hDC, OldhBitmap
            DeleteObject hBitmap
            DeleteDC hDC
            ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.Draw.CreateSolidBrush", pGetErrorDesc(ixeDeviceContextErr)
        End If

        '
        'Fill in the backcolor and delete the brush
        '
        RECT.Left = 0
        RECT.Top = 0
        RECT.Right = ImgX.f_Buffer.Width '- 1
        RECT.Bottom = ImgX.f_Buffer.Height '- 1
        FillRect hDC, RECT, HBrush
        DeleteObject HBrush

        SetBkColor hDC, BackColor
        'SetBkMode hDC, TRANSPARENT

    End If

    '
    'Create a Font object based on our font information
    '
    LOGFONT = pLogFont
    LOGFONT.lfHeight = (Points / 72) * GetDeviceCaps(hDC, LOGPIXELSY)

    hFont = CreateFontIndirect(LOGFONT)
    If hFont = 0 Then
        If ActualDraw Then  'Clean up the memory DC and bitmap
            SelectObject hDC, OldhBitmap
            DeleteObject hBitmap
            DeleteDC hDC
        End If
        ImgX.f_RaiseError ixeFontError, "ImgX.Text.Draw.CreateFontIndirect", pGetErrorDesc(ixeFontError)
    End If

    OldhFont = SelectObject(hDC, hFont)
    If OldhFont = 0 Then
        If ActualDraw Then  'Clean up the memory DC and bitmap
            SelectObject hDC, OldhBitmap
            DeleteObject hBitmap
            DeleteDC hDC
        End If
        DeleteObject hFont
        ImgX.f_RaiseError ixeDeviceContextErr, "ImgX.Text.Draw.SelectObject(hFont)", pGetErrorDesc(ixeDeviceContextErr)
    End If

    If ActualDraw Then
        OldColor = SetTextColor(hDC, ForeColor)
    Else
        OldColor = SetTextColor(hDC, Color)
    End If

    OldMapMode = SetMapMode(hDC, MM_TEXT)   'Pixels!

    TextOut hDC, X, Y, Text, Len(Text)

    SetMapMode hDC, OldMapMode              'Restore the old mapping mode
    SetTextColor hDC, OldColor

    SelectObject hDC, OldhFont
    DeleteObject hFont

    If ActualDraw Then
        Set TextBuffer = New ImgX_Buffer
        P = ISHBITMAPToRGB(hBitmap, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, ImgX.Support.ScreenDC, 0)

        If P = 0 Then ImgX.f_RaiseError pGetLastError, "ImgX.Text.Draw.ISHBITMAPToRGB", pGetErrorDesc(pGetLastError)

        TextBuffer.SetBuffer P, ImgX.f_Buffer.Width, ImgX.f_Buffer.Height, 24

        Set Buffer = ImgX.f_Buffer.Copy(True, 24)
        If Buffer Is Nothing Then ImgX.f_RaiseError ixeOutOfMemory, "ImgX.Text.Draw", pGetErrorDesc(ixeOutOfMemory)

        'Catch any error from f_OverlayBuffer
        On Error Resume Next

        'Replace the forecolor with the wanted color
        ISColorReplaceRGB TextBuffer.Pointer, TextBuffer.Width, TextBuffer.Height, ForeColor, Color

        ImgX.f_StartProgress "ImgX.Text.Draw"

        'Perform the overlay
        ImgX.f_OverlayBuffer TextBuffer, Buffer, 0, 0, Opacity, BackColor

        ImgX.f_StopProgress

        'If there was an error, clean up and re-raise it
        If Err Then ImgX.f_RaiseError Err.Number, "ImgX.Text.Draw.f_OverlayRGB" & Err.Source, Err.Description

        On Error GoTo 0

        SelectObject hDC, OldhBitmap
        DeleteObject hBitmap
        DeleteDC hDC

        If Len(UndoText) = 0 Then UndoText = "Draw Text"
        ImgX.f_SetBuffer Buffer, UndoText

    End If
End Sub


Public Sub DrawBound(ByVal X As Long, ByVal Y As Long, ByVal W As Long, ByVal H As Long, ByVal Text As String, ByVal Points As Single, ByVal Color As OLE_COLOR, Optional ByVal Alignment As ImgX_TextAlignments = ixtaLeft, Optional ByVal Opacity As Long = 100, Optional ByVal UndoText As String)

    Dim RECT    As RECT
    
    RECT.Left = X
    RECT.Top = Y
    RECT.Right = X + W
    RECT.Bottom = Y + H

    pDrawBound 0, Text, RECT, Points, Alignment, Color, Opacity, UndoText

End Sub

Public Sub Draw(ByVal X As Long, ByVal Y As Long, ByVal Text As String, ByVal Points As Single, ByVal Color As OLE_COLOR, Optional ByVal Opacity As Long = 100, Optional ByVal UndoText As String)

    pDraw 0, Text, X, Y, Points, Color, Opacity, UndoText

End Sub


Public Sub RenderBound(ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal W As Long, ByVal H As Long, ByVal Text As String, ByVal Points As Single, ByVal Color As OLE_COLOR, Optional ByVal Alignment As ImgX_TextAlignments = ixtaLeft)

    Dim RECT    As RECT
    
    RECT.Left = X
    RECT.Top = Y
    RECT.Right = X + W
    RECT.Bottom = Y + H

    pDrawBound hDC, Text, RECT, Points, Alignment, Color, 100

End Sub

Public Sub Render(ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal Text As String, ByVal Points As Single, ByVal Color As OLE_COLOR)

    pDraw hDC, Text, X, Y, Points, Color, 100

End Sub

Private Sub Class_Initialize()
    pLogFont.lfCharSet = DEFAULT_CHARSET
    pLogFont.lfPitchAndFamily = DEFAULT_PITCH Or FF_DONTCARE
    pLogFont.lfQuality = DEFAULT_QUALITY
    pLogFont.lfClipPrecision = OUT_DEFAULT_PRECIS
    pLogFont.lfOutPrecision = OUT_DEFAULT_PRECIS
    pLogFont.lfWeight = ixfwDontCare * 100
    pLogFont.lfEscapement = 0
    pLogFont.lfOrientation = pLogFont.lfEscapement  'Keep these the same because Win 9.x doesn't support it
    pLogFont.lfItalic = False
    pLogFont.lfUnderline = False
    pLogFont.lfStrikeOut = False
End Sub


Friend Property Get LogicalFont() As LOGFONT
    LogicalFont = pLogFont
End Property

Public Property Get Angle() As Single
    Angle = pLogFont.lfEscapement / 10
End Property
Public Property Let Angle(ByVal Degrees As Single)
    '
    'The angle is a long representing tenths of degrees.  Therefore, the
    'valid values are 0 To 3599.  However, if they enter a value ouside
    'this range, we can interpolate the degree by taking a modulos of the
    'entire circle (3600 degree tenths)
    '
    
    Dim TenthOfDegree As Long
    
    TenthOfDegree = Degrees * 10
    
    pLogFont.lfEscapement = TenthOfDegree Mod 3600
    If pLogFont.lfEscapement < 0 Then pLogFont.lfEscapement = pLogFont.lfEscapement + 3600
    pLogFont.lfOrientation = pLogFont.lfEscapement  'Only NT supports different lfOrientation so we ignore it.
    
End Property

Public Property Get Weight() As ImgX_FontWeights
    Weight = pLogFont.lfWeight / 100
End Property
Public Property Let Weight(ByVal NewWeight As ImgX_FontWeights)
    If NewWeight < ixfwDontCare Or NewWeight > ixfwHeavy Then Err.Raise 5, "ImgX_Font.Weight", "Invalid value for Weight"
    pLogFont.lfWeight = NewWeight * 100
End Property

Public Property Get Face() As String
    '
    'This routine loops through the LOGFONT.lfFaceName and creates a string
    '
    Dim I As Long
    For I = 1 To LF_FACESIZE
        If pLogFont.lfFaceName(I) = 0 Then Exit For
        Face = Face & Chr$(pLogFont.lfFaceName(I))
    Next I
End Property
Public Property Let Face(ByVal NewFace As String)
    '
    'This routine will take a UNICODE string and convert each
    'character to ASC and map it into the LOGFONT.lfFaceName array
    '
    Dim I As Long
    
    For I = 1 To LF_FACESIZE
        pLogFont.lfFaceName(I) = 0      'Null out any previous characters
    Next I
    
    For I = 1 To Len(NewFace)
        If I >= LF_FACESIZE Then Exit For    'Only allow upto LF_FACESIZE - 1 worth of characters
        pLogFont.lfFaceName(I) = Asc(Mid(NewFace, I, 1))
    Next I
End Property

Public Property Get Italic() As Boolean
    Italic = pLogFont.lfItalic
End Property
Public Property Let Italic(ByVal NewItalicValue As Boolean)
    pLogFont.lfItalic = -NewItalicValue 'Use the - to turn True (-1) to a value of 1
End Property
Public Property Get Underline() As Boolean
    Underline = pLogFont.lfUnderline
End Property
Public Property Let Underline(ByVal NewUnderlineValue As Boolean)
    pLogFont.lfUnderline = -NewUnderlineValue 'Use the - to turn True (-1) to a value of 1
End Property
Public Property Get StrikeThru() As Boolean
    StrikeThru = pLogFont.lfStrikeOut
End Property
Public Property Let StrikeThru(ByVal NewStrikeThruValue As Boolean)
    pLogFont.lfStrikeOut = -NewStrikeThruValue 'Use the - to turn True (-1) to a value of 1
End Property


