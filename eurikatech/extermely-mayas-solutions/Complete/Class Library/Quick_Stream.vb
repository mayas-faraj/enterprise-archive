Public Class Quick_Stream
    Dim pFieldNum, pFieldLength, pRecordNum As Int64
    Dim pFilePath As String

    Property RecordNum() As Int64
        Get
            RecordNum = pRecordNum
        End Get
        Set(ByVal value As Int64)
            pRecordNum = value
        End Set
    End Property

    Property FieldNum() As Long
        Get
            FieldNum = pFieldNum
        End Get
        Set(ByVal value As Long)
            pFieldNum = value
        End Set
    End Property

    Property FieldLength() As Long
        Get
            FieldLength = pFieldLength
        End Get
        Set(ByVal value As Long)
            pFieldLength = value
        End Set
    End Property

    Property FilePath() As String
        Get
            FilePath = pFilePath
        End Get
        Set(ByVal value As String)
            pFilePath = value
        End Set
    End Property

    Sub SaveStream(ByVal ParamArray Values() As String)

        If Values.Length = 0 Then Exit Sub
        Dim SW As IO.StreamWriter
        Dim Rep As Int32

        Try
            SW = New IO.StreamWriter(FilePath, True)
        Catch ex As IO.FileNotFoundException
            ErrorMessage("«·„·› €Ì— „ÊÃÊœ , Ì—ÃÏ «· √ﬂœ „‰ «·„”«— Ê «·„Õ«Ê·… ·«Õﬁ«", "Õ›Ÿ ≈⁄œ«œ« ", ex)
            Exit Sub
        Catch ex As IO.FileLoadException
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·› ,  √ﬂœ „‰ √‰ «·Ê’Ê· ≈·Ï «·„·› „”„ÊÕ Ê «·„Õ«Ê·… ·«Õﬁ«", "Õ›Ÿ «·≈⁄œ«œ« ", ex)
            Exit Sub
        Catch ex As Exception
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·›", "Õ›Ÿ «·≈⁄œ«œ« ", ex)
            Exit Sub
        End Try

        Try
            SW.BaseStream.Seek(0, IO.SeekOrigin.End)
            SW.WriteLine()
        Catch ex As Exception
            ErrorMessage("Œÿ√ ≈À‰«¡ ≈Ã—«¡ ⁄„·Ì«  ⁄·Ï «·„·›", "Õ›Ÿ «·≈⁄œ«œ« ", ex)
            Exit Sub
        End Try


        For Rep = 0 To Values.Length - 1

            If Values(Rep).Length <= FieldLength Then
                Values(Rep) = Values(Rep).PadRight(CInt(FieldLength))
            Else
                Values(Rep) = Values(Rep).Substring(0, CInt(FieldLength))
            End If

            Try
                SW.Write(Values(Rep))
            Catch ex As Exception
                ErrorMessage("Œÿ√ ≈À‰«¡ «·ﬂ «»… ⁄·Ï «·„·›", "Õ›Ÿ «·≈⁄œ«œ« ", ex)
                Exit Sub
            End Try
        Next

        RecordNum += 1

        SW.Close()
    End Sub

    Function LoadStream(ByVal RecordID As Long, ByVal FieldID As Long) As String

        If Not IO.File.Exists(FilePath) Then
            MsgBox("«·„·› €Ì— „ÊÃÊœ , Ì—ÃÏ «· √ﬂœ „‰ «·„”«— Ê «·„Õ«Ê·… ·«Õﬁ«", CType(MsgBoxStyle.Critical + MsgBoxStyle.OkOnly, MsgBoxStyle), " Õ„Ì· «·≈⁄œ«œ« ")
            Return ""
            Exit Function
        End If

        Dim SR As IO.StreamReader

        Try
            SR = New IO.StreamReader(FilePath)

        Catch ex As IO.FileNotFoundException
            ErrorMessage("«·„·› €Ì— „ÊÃÊœ , Ì—ÃÏ «· √ﬂœ „‰ «·„”«— Ê «·„Õ«Ê·… ·«Õﬁ«", " Õ„Ì· ≈⁄œ«œ« ", ex)
            Return ""
            Exit Function
        Catch ex As IO.FileLoadException
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·› ,  √ﬂœ „‰ √‰ «·Ê’Ê· ≈·Ï «·„·› „”„ÊÕ Ê «·„Õ«Ê·… ·«Õﬁ«", " Õ„Ì· «·≈⁄œ«œ« ", ex)
            Return ""
            Exit Function
        Catch ex As Exception
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·›", " Õ„Ì· «·≈⁄œ«œ« ", ex)
            Return ""
            Exit Function
        End Try

        Dim Rep As Int32, CPos As Long, RetValue As String = ""


        Try
            CPos = (RecordID - 1) * (FieldNum * FieldLength) + (FieldID - 1) * FieldLength + (RecordID * 2)
            SR.BaseStream.Seek(CPos, IO.SeekOrigin.Begin)
        Catch ex As Exception
            ErrorMessage("Œÿ√ ≈À‰«¡ ≈Ã—«¡ ⁄„·Ì«  ⁄·Ï «·„·›", " Õ„Ì· «·≈⁄œ«œ« ", ex)
            Return ""
            Exit Function
        End Try




        Try
            For Rep = 0 To CInt(FieldLength - 1)
                RetValue &= Chr(SR.Read)
            Next
        Catch ex As Exception
            ErrorMessage("Œÿ√ ≈À‰«¡ «·ﬁ—«¡… „‰ «·„·›", " Õ„Ì· «·≈⁄œ«œ« ", ex)
            Return ""
            Exit Function
        End Try



        Return RetValue

    End Function

    Private Sub ErrorMessage(ByVal Message As String, ByVal Title As String, ByVal ExMessage As Exception)
        MsgBox(Message & ControlChars.CrLf & ExMessage.Message, CType(MsgBoxStyle.Critical + MsgBoxStyle.OkOnly, MsgBoxStyle), Title)
    End Sub
End Class
