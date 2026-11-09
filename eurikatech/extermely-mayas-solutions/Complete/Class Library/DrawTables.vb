Option Strict On
Public Class DrawTables
    Dim pColsNum, pRowsNum, pRowHeight, pColWidth, pXMargin, pYMargin As Int32
    Dim pColorBaseTable, pColorTable As Color, pColorText As Color, pLineBaseTable, pLineTable As Byte
    Dim pTexts As String, pTextAlign As Align, pPosition As Point

    Public ContexDevice As Object, RightToLeft As Boolean = False
    Public FontName As String, FontSize As Int16, FontProperty As FontStyle

    Property ColsNum() As Int32
        Get
            ColsNum = pColsNum
        End Get
        Set(ByVal value As Int32)
            pColsNum = value
        End Set
    End Property

    Property RowsNum() As Int32
        Get
            RowsNum = pRowsNum
        End Get
        Set(ByVal value As Int32)
            pRowsNum = value
        End Set
    End Property

    Property RowHeight() As Int32
        Get
            RowHeight = pRowHeight
        End Get
        Set(ByVal value As Int32)
            pRowHeight = value
        End Set
    End Property

    Property ColWidth() As Int32
        Get
            ColWidth = pColWidth
        End Get
        Set(ByVal value As Int32)
            pColWidth = value
        End Set
    End Property

    Property Position() As Point
        Get
            Position = pPosition
        End Get
        Set(ByVal value As Point)
            pPosition = value
        End Set
    End Property

    Property XMargin() As Int32
        Get
            XMargin = pXMargin
        End Get
        Set(ByVal value As Int32)
            pXMargin = value
        End Set
    End Property

    Property YMargin() As Int32
        Get
            YMargin = pYMargin
        End Get
        Set(ByVal value As Int32)
            pYMargin = value
        End Set
    End Property

    Property TextAlign() As Align
        Get
            TextAlign = pTextAlign
        End Get
        Set(ByVal value As Align)
            pTextAlign = value
        End Set
    End Property

    Property ColorTable() As Color
        Get
            ColorTable = pColorTable
        End Get
        Set(ByVal value As Color)
            pColorTable = value
        End Set
    End Property

    Property ColorBaseTable() As Color
        Get
            ColorBaseTable = pColorBaseTable
        End Get
        Set(ByVal value As Color)
            pColorBaseTable = value
        End Set
    End Property

    Property ColorText() As Color
        Get
            ColorText = pColorText
        End Get
        Set(ByVal value As Color)
            pColorText = value
        End Set
    End Property


    Property LineTable() As Byte
        Get
            LineTable = pLineTable
        End Get
        Set(ByVal value As Byte)
            pLineTable = value
        End Set
    End Property

    Property LineBaseTable() As Byte
        Get
            LineBaseTable = pLineBaseTable
        End Get
        Set(ByVal value As Byte)
            pLineBaseTable = value
        End Set
    End Property


    Property Texts(ByVal RowNumber As Int32, ByVal ColumnNumber As Int32) As String
        Get

        End Get
        Set(ByVal value As String)
            WriteText(value, RowNumber, ColumnNumber)
        End Set
    End Property

    Overloads Sub DrawTabel()
        'Value Recomendet
        If pColsNum = 0 Or pRowsNum = 0 Then
            ErrMsg("⁄œœ «·≈⁄„œ… Ê/√Ê ⁄œœ «·√”ÿ— Ì”«ÊÌ «·’›—", "≈‰‘«¡ ÃœÊ·")
            Exit Sub
        End If

        'Draw Table Limit
        Dim Gr As Graphics
        If Not IsNothing(ContexDevice) Then
            If TypeOf ContexDevice Is Form Then
                Gr = CType(ContexDevice, Form).CreateGraphics
            ElseIf TypeOf ContexDevice Is Drawing.Printing.PrintPageEventArgs Then
                Gr = CType(ContexDevice, Drawing.Printing.PrintPageEventArgs).Graphics
            Else
                ErrMsg("·„ Ì „ «· ⁄—› ⁄·Ï „ƒ‘— ·ÃÂ«“ «·⁄—÷ «·„ ’· »«·‰Ÿ«„", "ÿ»«⁄… «·„” ‰œ")
                Exit Sub
            End If
        Else
            ErrMsg("·„ Ì „ «·Õ’Ê· ⁄·Ï „ƒ‘— ·ÃÂ«“ «·⁄—÷ «·„ ’· »«·‰Ÿ«„", "ÿ»«⁄… «·„” ‰œ")
            Exit Sub
        End If

        Dim BsTblPen As New Pen(ColorBaseTable, LineBaseTable)
        Dim TblPen As New Pen(ColorTable, LineTable)
        Dim BsWidth, BsHeight As Int32

        BsWidth = ColsNum * ColWidth
        BsHeight = RowsNum * RowHeight

        Gr.DrawRectangle(BsTblPen, Position.X, Position.Y, BsWidth, BsHeight)

        Dim Counter As Int32
        For Counter = 1 To ColsNum - 1
            Dim Xpos, Ypos As Int32
            Xpos = (Counter * ColWidth) + Position.X
            Ypos = (RowHeight * RowsNum) + Position.Y
            Gr.DrawLine(TblPen, Xpos, Position.Y, Xpos, Ypos)
        Next

        For Counter = 1 To RowsNum - 1
            Dim Xpos, Ypos As Int32
            Xpos = (ColsNum * ColWidth) + Position.X
            Ypos = (Counter * RowHeight) + Position.Y
            Gr.DrawLine(TblPen, Position.X, Ypos, Xpos, Ypos)
        Next
    End Sub

    Overloads Sub DrawTabel(ByVal ColumnNumber As Int32, ByVal RowsNumber As Int32)
        pColsNum = ColumnNumber
        pRowsNum = RowsNumber

        DrawTabel()
    End Sub

    Private Sub WriteText(ByVal Str As String, ByVal Row As Int32, ByVal Column As Int32)
        If Row < 1 Or Row > RowsNum Or Column < 1 Or Column > ColsNum Then
            ErrMsg("ﬁÌ„… «·Œ·Ì… €Ì— „ÊÃÊœ… ›Ì «·ÃœÊ·", "ﬂ «»… Œ·Ì…")
            Exit Sub
        End If

        Dim StrFont As New Font(FontName, FontSize, FontProperty, GraphicsUnit.Point)
        Dim TextSize As SizeF
        Dim XPos, YPos As Int32
        Dim TextBrush As New SolidBrush(ColorText)
        Dim Gr As Graphics

        If Not IsNothing(ContexDevice) Then
            If TypeOf ContexDevice Is Form Then
                Gr = CType(ContexDevice, Form).CreateGraphics
            ElseIf TypeOf ContexDevice Is Drawing.Printing.PrintPageEventArgs Then
                Gr = CType(ContexDevice, Drawing.Printing.PrintPageEventArgs).Graphics
            Else
                ErrMsg("·„ Ì „ «· ⁄—› ⁄·Ï „ƒ‘— ·ÃÂ«“ «·⁄—÷ «·„ ’· »«·‰Ÿ«„", "ÿ»«⁄… «·„” ‰œ")
                Exit Sub
            End If
        Else
            ErrMsg("·„ Ì „ «·Õ’Ê· ⁄·Ï „ƒ‘— ·ÃÂ«“ «·⁄—÷ «·„ ’· »«·‰Ÿ«„", "ÿ»«⁄… «·„” ‰œ")
            Exit Sub
        End If

        BindingcontexDevice(Gr)

        TextSize = Gr.MeasureString(Str, StrFont, 10000)
        If RightToLeft Then
            Column = pColsNum - Column
        Else
            Column -= 1
        End If
        Row -= 1
        Dim RealXMargin As Int32

        Select Case TextAlign
            Case Align.Center
                RealXMargin = CInt((ColWidth - TextSize.Width) / 2)
            Case Align.Left
                RealXMargin = pXMargin
            Case Align.Right
                RealXMargin = CInt(ColWidth - (TextSize.Width + XMargin))
        End Select

        XPos = pPosition.X + (Column * pColWidth) + RealXMargin
        YPos = pPosition.Y + (Row * pRowHeight) + pYMargin
        Gr.DrawString(Str, StrFont, TextBrush, XPos, YPos)



    End Sub

    Private Sub BindingcontexDevice(ByVal Gr As Graphics)

        If Not IsNothing(ContexDevice) Then
            If TypeOf ContexDevice Is Form Then
                Gr = CType(ContexDevice, Form).CreateGraphics
            ElseIf TypeOf ContexDevice Is Drawing.Printing.PrintPageEventArgs Then
                Gr = CType(ContexDevice, Drawing.Printing.PrintPageEventArgs).Graphics
            Else
                ErrMsg("·„ Ì „ «· ⁄—› ⁄·Ï „ƒ‘— ·ÃÂ«“ «·⁄—÷ «·„ ’· »«·‰Ÿ«„", "ÿ»«⁄… «·„” ‰œ")
                Exit Sub
            End If
        Else
            ErrMsg("·„ Ì „ «·Õ’Ê· ⁄·Ï „ƒ‘— ·ÃÂ«“ «·⁄—÷ «·„ ’· »«·‰Ÿ«„", "ÿ»«⁄… «·„” ‰œ")
            Exit Sub
        End If
    End Sub

    Private Sub ErrMsg(ByVal StrMessage As String, ByVal Title As String)
        MsgBox(StrMessage, CType(MsgBoxStyle.Critical + MsgBoxStyle.OkOnly, MsgBoxStyle), Title)
    End Sub

    Public Enum Align
        Left
        Center
        Right
    End Enum

End Class
