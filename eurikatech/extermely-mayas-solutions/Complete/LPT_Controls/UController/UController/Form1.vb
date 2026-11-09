Public Class frmUController


    Private Sub Change_Digit(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lbl1.Click, lbl2.Click, lbl3.Click, lbl4.Click, lbl5.Click, lbl6.Click, lbl7.Click, lbl8.Click
        If CType(sender, Label).Text = "0" Then CType(sender, Label).Text = "1" Else CType(sender, Label).Text = "0"
    End Sub

    Private Sub GeneratCode(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGenerate.Click
        Dim DicValue As Short
        DicValue = CShort(CInt(lbl1.Text) + CInt(lbl2.Text) * 2 + CInt(lbl3.Text) * 4 + CInt(lbl4.Text) * 8 + CInt(lbl5.Text) * 16 + CInt(lbl6.Text) * 32 + CInt(lbl7.Text) * 64 + CInt(lbl8.Text) * 128)
        Out(&H378, DicValue)

    End Sub

    Private Sub ExitProgram(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExit.Click
        Out(&H378, 0)
        End
    End Sub

    Private Sub frmUController_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim Loading As String
        Loading = GetSetting("dev4", "dfgq", "key1", "")
        If Loading <> "apppath" Then
            MsgBox("error -353 , can't fine msopp.ocx reinstall programs", CType(MsgBoxStyle.Critical + MsgBoxStyle.OkOnly, MsgBoxStyle), "fatal error !")
            Me.Close()
        End If
    End Sub

    Private Sub lblCaption_MouseDoubleClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles lblCaption.MouseDoubleClick
        MsgBox("≈⁄œ«œ Ê  ’„Ì„ „Ì«” ›—Ã", CType(MsgBoxStyle.OkOnly + MsgBoxStyle.Information, MsgBoxStyle), "„·«ÕŸ…")
    End Sub
End Class
