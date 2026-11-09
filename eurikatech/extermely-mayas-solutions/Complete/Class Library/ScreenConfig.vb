Module ScreenConfig

    Dim ScreenWidth As Integer, ScreenHeight As Integer
    Const DSWidth As Integer = 1152, DSHeight As Integer = 864
    Sub New()
        ScreenWidth = Screen.PrimaryScreen.Bounds.Width
        ScreenHeight = Screen.PrimaryScreen.Bounds.Height
    End Sub
    Sub FormFScreen(ByVal myForm As Form)
        myForm.Width = ScreenWidth
        myForm.Height = ScreenHeight
        myForm.Location = New Point(0, 0)
    End Sub

    Sub ImagrFScreen(ByVal Image As PictureBox)
        Image.Width = ScreenWidth
        Image.Height = ScreenHeight
        Image.SizeMode = PictureBoxSizeMode.StretchImage
        Image.Location = New Point(0, 0)
    End Sub

    Sub ControlsLayout(ByVal cont As Control)

        Dim PSWidth, PSHeight As Double
        PSWidth = ScreenWidth / DSWidth
        PSHeight = ScreenHeight / DSHeight

        cont.Width = CInt(cont.Width * (PSWidth))
        cont.Height = CInt(cont.Height * (PSHeight))

        cont.Left = CInt(cont.Left * (PSWidth))
        cont.Top = CInt(cont.Top * (PSHeight))
    End Sub

    Sub ForAllControls(ByVal curForm As Form)
        Dim Rep, MiniRep As Int32
        For Rep = 0 To curForm.Controls.Count - 1
            ControlsLayout(curForm.Controls.Item(Rep))
            For MiniRep = 0 To curForm.Controls.Item(Rep).Controls.Count - 1
                ControlsLayout(curForm.Controls.Item(Rep).Controls.Item(MiniRep))
            Next
        Next
    End Sub

End Module


