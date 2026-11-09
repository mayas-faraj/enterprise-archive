Public Class SpeedStream
    Sub StreamSaveRecord(ByVal FilePath As String, ByVal RecLen() As Int32, ByVal RecValue() As String)
        Dim FStr As IO.FileStream
        Dim SW As IO.StreamWriter
        Dim StrValue As String, IntLen As Int32, Rep As Int32, Charactor As Char = CChar(ControlChars.CrLf)
        Dim FM As IO.FileMode

        If IO.File.Exists(FilePath) Then
            FM = IO.FileMode.Append
        Else
            FM = IO.FileMode.CreateNew
        End If

        Try

            FStr = New IO.FileStream(FilePath, FM)
            SW = New IO.StreamWriter(FStr)
        Catch ex As IO.FileNotFoundException
            ErrorMessage("«·„·› €Ì— „ÊÃÊœ , Ì—ÃÏ «· √ﬂœ „‰ «·„”«— Ê «·„Õ«Ê·… ·«Õﬁ«", "Õ›Ÿ ≈⁄œ«œ« ", ex)

        Catch ex As IO.FileLoadException
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·› ,  √ﬂœ „‰ √‰ «·Ê’Ê· ≈·Ï «·„·› „”„ÊÕ Ê «·„Õ«Ê·… ·«Õﬁ«", "Õ›Ÿ ≈⁄œ«œ« ", ex)

        Catch ex As Exception
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·›", "Õ›Ÿ ≈⁄œ«œ« ", ex)

        End Try

        For Rep = 0 To RecLen.Length - 1
            If RecValue.Length <= Rep + 1 Then
                StrValue = RecValue(Rep)
            Else
                StrValue = ""
            End If

            If RecLen(Rep) >= StrValue.Length Then
                StrValue.PadRight(RecLen(Rep))
            Else
                StrValue.Substring(0, RecLen(Rep))
            End If

            Try
                SW.Write(Charactor & StrValue)
            Catch ex As Exception
                ErrorMessage("Œÿ√ √À‰«¡ «·Õ›Ÿ ›Ì «·„·›", "Õ›Ÿ «·≈⁄œ«œ« ", ex)
            End Try

            Charactor = CChar("")
        Next

        SW.Close()
    End Sub

    Sub StreamLoadRecord(ByVal FilePath As String, ByVal RecLen() As Int32, ByVal RecValue() As String)
        Dim FS As IO.FileStream
        Dim SR As IO.StreamReader
        Dim strValue As String, Rep As Int32, LastPoint As Int32 = 0
        ReDim RecValue(RecLen.Length - 1)

        Try
            FS = New IO.FileStream(FilePath, IO.FileMode.Open)
            SR = New IO.StreamReader(FS)

        Catch ex As IO.FileLoadException
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·› ,  √ﬂœ „‰ √‰ «·Ê’Ê· ≈·Ï «·„·› „”„ÊÕ Ê «·„Õ«Ê·… ·«Õﬁ«", " Õ„Ì· «·≈⁄œ«œ« ", ex)

        Catch ex As IO.FileNotFoundException
            ErrorMessage("«·„·› €Ì— „ÊÃÊœ , Ì—ÃÏ «· √ﬂœ „‰ «·„”«— Ê «·„Õ«Ê·… ·«Õﬁ«", " Õ„Ì· «·≈⁄œ«œ« ", ex)

        Catch ex As Exception
            ErrorMessage("Œÿ√ √À‰«¡  Õ„Ì· «·„·›", " Õ„Ì· «·≈⁄œ«œ« ", ex)

        End Try

        Try
            strValue = SR.ReadLine
        Catch ex As Exception
            ErrorMessage("Œÿ√ √À‰«¡ «·ﬁ—«¡… „‰ «·„·›", " Õ„Ì· «·≈⁄œ«œ« ", ex)
        End Try


        For Rep = 0 To RecLen.Length - 1
            RecValue(Rep) = strValue.Substring(LastPoint, RecLen(Rep))
            LastPoint = RecLen(Rep) + 1
        Next

    End Sub

    Private Sub ErrorMessage(ByVal Message As String, ByVal Title As String, ByVal ExMessage As Exception)
        MsgBox(Message & ControlChars.CrLf & ExMessage.Message, CType(MsgBoxStyle.Critical + MsgBoxStyle.OkOnly, MsgBoxStyle), Title)
        Exit Sub
    End Sub
End Class
