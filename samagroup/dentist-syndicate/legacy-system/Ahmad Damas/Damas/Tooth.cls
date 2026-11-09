VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Tooth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Type COORD
    x As Long
    Y As Long
End Type
Private Type POINTAPI
    x As Long
    Y As Long
End Type
Private Type LOGPEN
    lopnStyle As Long
    lopnWidth As POINTAPI
    lopnColor As Long
End Type

Private Type point
    pointX As Single
    pointY As Single
End Type

Const ALTERNATE = 1 ' ALTERNATE and WINDING are
Const WINDING = 2 ' constants for FillMode.
Const BLACKBRUSH = 4 ' Constant for brush type.

Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function CreatePenIndirect Lib "gdi32" (lpLogPen As LOGPEN) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Private Declare Function CreatePolygonRgn Lib "gdi32" (lpPoint As Any, ByVal nCount As Long, ByVal nPolyFillMode As Long) As Long
Private Declare Function Polygon Lib "gdi32" (ByVal hDC As Long, lpPoint As Any, ByVal nCount As Long) As Long
Private Declare Function FillRgn Lib "gdi32" (ByVal hDC As Long, ByVal hRgn As Long, ByVal HBrush As Long) As Long
Private Declare Function GetStockObject Lib "gdi32" (ByVal nIndex As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function GetSysColorBrush Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Public State As String
Public RetState As String
Private Num As Integer
Public ToothNum As Integer
Public ImgList As imageList
Public surfList As imageList
'Public imageIndex As Integer
Public Picture1 As PictureBox
Public img As Image
Public lastWorkName As String
Public PrevIhalaWorkName As String
Public visible As Integer
Dim p(0 To 1000) As COORD

Dim offsetX As Long
Dim offsetY As Long
Const CURVE_OFFSET = 4
Const Mouth = -100

Public Sub Init(pic As PictureBox, N As Integer, imageList As imageList, surfaceImageList As imageList, imag As Image, visble As Integer)
    State = "-1"
    ToothNum = N
    Num = N
    If N > 32 Then
        Num = N - 32
    End If
    
    Set ImgList = imageList
    Set Picture1 = pic
    Set surfList = surfaceImageList
    Set img = imag
    visible = visble
'    imageIndex = i
End Sub
Public Sub Init2(N As Integer, visble As Integer)
    State = "-1"
    ToothNum = N
    Num = N
    If N > 32 Then
        Num = N - 32
    End If
    visible = visble
End Sub
Public Function GetToothNum() As String
    GetToothNum = ImgList.ListImages(Num).Tag
End Function
Public Function GetImageX() As Integer
    If Num <= 16 Then
        GetImageX = ImgList.ImageWidth * (Num - 1)
    Else
        GetImageX = ImgList.ImageWidth * (32 - Num)
    End If
End Function
Public Function GetImageY() As Integer
    If Num <= 16 Then
        GetImageY = 0 + GetCurveOffset
    Else
        GetImageY = Picture1.Height / 15 - ImgList.ImageHeight - 3 - GetCurveOffset
    End If
End Function

Public Sub Draw()
    Dim ShouldDraw As Boolean
    offsetX = GetImageX
    offsetY = GetImageY

    Picture1.PaintPicture ImgList.ListImages(62).Picture, offsetX, offsetY
    If visible = 1 Then
        ShouldDraw = True
    Else
        ShouldDraw = False
    End If
   ' If ShouldDraw Then
        If visible = 1 Then
            Picture1.PaintPicture ImgList.ListImages(ToothNum).Picture, offsetX, offsetY
        End If
        If Num > 16 Then
            offsetY = offsetY - surfList.ImageHeight
            Picture1.CurrentX = ImgList.ImageWidth * (Num - 17) + ImgList.ImageWidth / 2
            Picture1.CurrentY = offsetY - 11
            Picture1.Print ImgList.ListImages(ToothNum).Tag
        Else
            Picture1.CurrentX = ImgList.ImageWidth * (16 - Num) + ImgList.ImageWidth / 2
            Picture1.CurrentY = offsetY + ImgList.ImageHeight + surfList.ImageHeight + 2
            Picture1.Print ImgList.ListImages(ToothNum).Tag
        End If
        If visible = 1 Then
        Dim N As Integer
        N = ToothNum
        ToothNum = 62
        DrawSurface
        ToothNum = N
        End If
        DrawTreats
    'Else
      '  DrawTreats
'    End If
End Sub

Private Sub DrawSurface()
    If visible = 1 Then
        If Num <= 16 Then
            Picture1.PaintPicture surfList.ListImages(ToothNum).Picture, offsetX, offsetY + ImgList.ImageHeight
        Else
            Picture1.PaintPicture surfList.ListImages(ToothNum).Picture, offsetX, offsetY ' - surfList.ImageHeight
        End If
    End If
End Sub


Private Sub DrawTreats()
    Dim Cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim NoDraw As Boolean
    '<MAJD>
    Dim DrawKharraj As Boolean
    Dim KharrajPos, j As Integer
    '</MAJD>
    NoDraw = False
    If ToothNum = 22 Then
        Debug.Print "hi"
    End If

    Pic_TeethImg.teethTreatsRS.Filter = "tooth=" & ToothNum
    Dim needDrawSurface As Integer
    needDrawSurface = 0
   DrawKharraj = False
   KharrajPos = 0
   j = 0
    Dim i As Integer
    If ToothNum > 32 Then
        i = ToothNum - 32
    Else
        i = ToothNum + 32
    End If
    
    'If rs.EOF Then
    If Pic_TeethImg.teethTreatsRS.EOF Then
            Pic_TeethImg.teethTreatsRS.Filter = "tooth=" & i
        NoDraw = True 'We need here to update the state and the last treat NOT drawing
    End If
    Dim Buffer As String
    
    Do While Not Pic_TeethImg.teethTreatsRS.EOF
       If Not NoDraw Then
                If needDrawSurface = 0 Then
                        If GetTagValue(Pic_TeethImg.teethTreatsRS!TreatOpt, "surf") = "true" Then
                            DrawSurface
                            needDrawSurface = 1
                        End If
                End If


                
                If Pic_TeethImg.teethTreatsRS!disable = 0 Or (Pic_TeethImg.teethTreatsRS!disable = 1 And Pic_TeethImg.teethTreatsRS!disableIhala > Pic_TeethImg.IhalaID) Then 'And GetTagValue(rs!TreatOpt, "rec") <> "true" Then
                '<MAJD>
                    If Pic_TeethImg.teethTreatsRS!treat_Id = 129 Then 'нягл
                        DrawKharraj = True
                        KharrajPos = j
                    Else
                    '</MAJD>
                        If Pic_TeethImg.teethTreatsRS!treat_Id = 265 Then
                            offsetX = GetImageX
                            offsetY = GetImageY
                            Picture1.PaintPicture ImgList.ListImages(ToothNum).Picture, offsetX, offsetY
                        Else
                            If Pic_TeethImg.teethTreatsRS!Shape <> "" Then
                                DrawTreat Pic_TeethImg.teethTreatsRS!Shape, Pic_TeethImg.teethTreatsRS!data, Pic_TeethImg.teethTreatsRS!Color, Pic_TeethImg.teethTreatsRS!OtherColor, Pic_TeethImg.teethTreatsRS!KIND
                            End If
                        End If
                    End If
                        State = Pic_TeethImg.teethTreatsRS!State
                End If
        Else
              
                State = Pic_TeethImg.teethTreatsRS!State
        End If
 
       Pic_TeethImg.teethTreatsRS.MoveNext
       j = j + 1 '<MAJD>
    Loop
    '<MAJD>
    If DrawKharraj Then
        Pic_TeethImg.teethTreatsRS.MoveFirst
        For j = 0 To KharrajPos - 1
            Pic_TeethImg.teethTreatsRS.MoveNext
        Next
        DrawTreat Pic_TeethImg.teethTreatsRS!Shape, Pic_TeethImg.teethTreatsRS!data, Pic_TeethImg.teethTreatsRS!Color, Pic_TeethImg.teethTreatsRS!OtherColor, Pic_TeethImg.teethTreatsRS!KIND
    End If
   '</MAJD>
   If State = "1" And ToothNum <= 32 Then 'If the tooth is moved to Labani, check if returned from Labani
        'Sql = "select  pct.IhalaId, pct.state, t.name, t.note TreatOpt, pp.*,pct.kind, pct.tooth from Pic_Pics pp inner join Pic_ClientTreats pct on (pp.tooth=pct.tooth) inner join Pic_Treats t on (pct.treatid=t.id) " & _
        '      "where pp.tooth=" & i & " and pp.tooth=pct.tooth and pp.treat=pct.treatid and pct.IhalaId in (select Central_Exam_ID from Central_Exam where Patient_ID=" & Pic_TeethImg.Client_ID & ") order by pct.ihalaId, pct.id, pp.id"
        'Debug.Print Sql
        'Set rs = ExecuteSelect(Conn, Sql, Cancel)
        Pic_TeethImg.teethTreatsRS.Filter = "tooth=" & i
        If Not Pic_TeethImg.teethTreatsRS.EOF Then
            Pic_TeethImg.teethTreatsRS.MoveLast
            If Pic_TeethImg.teethTreatsRS!treat = 211 Then 'This is a Remove Mntamira, its image has 2 parts move prev and draw the treat
                        Pic_TeethImg.teethTreatsRS.MovePrevious
                        Pic_TeethImg.teethTreatsRS.MovePrevious
                        DrawTreat Pic_TeethImg.teethTreatsRS!Shape, Pic_TeethImg.teethTreatsRS!data, Pic_TeethImg.teethTreatsRS!Color, Pic_TeethImg.teethTreatsRS!OtherColor, Pic_TeethImg.teethTreatsRS!KIND
                        Pic_TeethImg.teethTreatsRS.MoveNext
                        DrawTreat Pic_TeethImg.teethTreatsRS!Shape, Pic_TeethImg.teethTreatsRS!data, Pic_TeethImg.teethTreatsRS!Color, Pic_TeethImg.teethTreatsRS!OtherColor, Pic_TeethImg.teethTreatsRS!KIND
                        Pic_TeethImg.teethTreatsRS.MoveNext
                        DrawTreat Pic_TeethImg.teethTreatsRS!Shape, Pic_TeethImg.teethTreatsRS!data, Pic_TeethImg.teethTreatsRS!Color, Pic_TeethImg.teethTreatsRS!OtherColor, Pic_TeethImg.teethTreatsRS!KIND
                        If Pic_TeethImg.teethTreatsRS!IhalaID = Pic_TeethImg.IhalaID Then
                            lastWorkName = Pic_TeethImg.teethTreatsRS!name
                        End If
                        State = Pic_TeethImg.teethTreatsRS!State
            Else
                    State = Pic_TeethImg.teethTreatsRS!State 'change the state to the one set by the labani
                    If Pic_TeethImg.teethTreatsRS!IhalaID = Pic_TeethImg.IhalaID Then
                        lastWorkName = Pic_TeethImg.teethTreatsRS!name
                    End If
            End If
        End If
   End If

End Sub
Private Sub DrawTreat(Typ As String, ByVal ss As String, MyColor As Long, OtherColor As Long, KIND As Integer)
    Dim hRgn As Long, HBrush As Long
    Dim nbPoints As Long
    Dim Color As Long
    If KIND = 0 Then
        Color = MyColor
    Else
        Color = OtherColor
    End If
    
    If visible = 0 Then Exit Sub
   'VERY VERY IMPORTANT
    Picture1.ScaleMode = vbPixels
   
    Dim LP As LOGPEN, hRPen As Long
    LP.lopnStyle = 1

    LP.lopnColor = Color 'vbGreen
'    'Create a new pen

    hRPen = CreatePenIndirect(LP)

    SelectObject Picture1.hDC, hRPen
    Dim imgName As String
    Dim S As String
    If Typ = "I" And ss <> "" Then
        S = Mid(ss, InStr(1, ss, ";") + 1)
        imgName = Mid(ss, 1, InStr(1, ss, ";") - 1)
    Else
        S = ss
    End If
    nbPoints = ToArray(S)
    Dim i As Integer
    Select Case Typ
        Case "L":
            For i = 0 To nbPoints - 2
                Picture1.Line (p(i).x, p(i).Y)-(p(i + 1).x, p(i + 1).Y)
            Next
        Case "S":
            Polygon Picture1.hDC, p(0), nbPoints
            ' Gets stock black brush.
            HBrush = CreateSolidBrush(Color) 'GetStockObject(CLng(txtFillColor.Text)) 'BLACKBRUSH)
            ' Creates region to fill with color.
            hRgn = CreatePolygonRgn(p(0), nbPoints, ALTERNATE)
            ' If the creation of the region was successful then color.
            If hRgn Then
                FillRgn Picture1.hDC, hRgn, HBrush
            End If
            DeleteObject hRgn
        Case "I":
            img.Picture = LoadPicture(App.Path & "\treats\" & imgName)
            Picture1.PaintPicture img.Picture, p(0).x, p(0).Y, , , , , , , vbSrcAnd
            'Unload img.Picture
'            Set img = Nothing
    End Select
End Sub

Private Function ToArray(S As String) As Long
    Dim pos As Long, posComa As Long, posLast As Long
    Dim i As Long
    Dim arr() As String
    arr = Split(S, ",")
    i = LBound(arr)
    Do While i < UBound(arr)
        p(i / 2).x = CLng(arr(i)) + offsetX
        p(i / 2).Y = CLng(arr(i + 1)) + offsetY
        i = i + 2
    Loop
    ToArray = UBound(arr) / 2 'i - 1
End Function

Private Function GetCurveOffset() As Long
    If Num <= 8 Then
        GetCurveOffset = 8 * CURVE_OFFSET - (Num - 1) * CURVE_OFFSET
    ElseIf Num <= 16 Then
        GetCurveOffset = (Num - 9) * CURVE_OFFSET
    ElseIf Num <= 24 Then
        GetCurveOffset = (25 - Num) * CURVE_OFFSET
    Else
        GetCurveOffset = (Num - 25) * CURVE_OFFSET
    End If
    
End Function




