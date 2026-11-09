Public Class ArrangeIcon

    'Basic Class Filled
    Public ID As Int16

    Public IconWidth As Int16
    Public IconHeight As Int16
    Public IconNumX As Int16
    Public IconNumY As Int16
    Public IconLeft As Int16
    Public IconTop As Int16

    Public MarginTop As Int16
    Public MarginLeft As Int16
    Public MarginBottom As Int16
    Public MarginRight As Int16

    Public DisX As Int16
    Public DisY As Int16

    Public PanelWidth As Int32
    Public PanelHeight As Int32

    Public RTLAlign As Boolean

    'Class Variant
    Private tdisX As Int16
    Private tDisY As Int16

    'Class Method
    Public Sub GetXYbyIconNumDis(ByVal ID As Int16)
        Dim OP As SByte, Line As Int16
        If (MarginLeft = 0 And MarginRight <> 0) Or (MarginLeft <> 0 And MarginRight = 0) Then OP = 0
        If MarginLeft = 0 And MarginRight = 0 Then OP = 1
        If MarginLeft <> 0 And MarginRight <> 0 Then OP = -1

        If IconNumX * IconWidth < PanelWidth Then
            DisX = CShort((PanelWidth - (MarginLeft + MarginRight) - (IconNumX * IconWidth)) / (IconNumX + (1 * OP)))
            DisY = CShort((PanelHeight - (MarginTop + MarginBottom) - (IconNumY * IconHeight)) / (IconNumY + (1 * OP)))
        Else
            DisX = 0
            DisY = 0
        End If

        Line = CShort((ID - 1) \ (IconNumX))
        IconLeft = CShort(DisX * (ID - (Line * (IconNumX))) + IconWidth * (ID - 1 - (Line * (IconNumX))))
        IconTop = CShort(DisY * (Line + 1) + IconHeight * (Line))
    End Sub

End Class

Public Class SetIcon
    Public Sub SetIconPosition(ByVal ObjIcon As Object, ByVal StrPath As String, ByVal StrString As String, ByVal X As Int16, ByVal Y As Int16)
        CType(ObjIcon, PictureBox).Image = Bitmap.FromFile(StrPath)
        CType(ObjIcon, PictureBox).Tag = StrString
        CType(ObjIcon, PictureBox).Top = Y
        CType(ObjIcon, PictureBox).Left = X
    End Sub
End Class