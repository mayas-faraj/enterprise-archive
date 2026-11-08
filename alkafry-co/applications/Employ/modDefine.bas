Attribute VB_Name = "modDefine"
Global UserKind As String * 5, Rep As Byte, Bytid As Byte

Sub ExitProg()
Dim Ms As Byte
Ms = MsgBox("√„ √ﬂœ „‰ «·Œ—ÊÃ", vbYesNo, "≈‰Â«¡ «·»—‰«„Ã")
If Ms = vbYes Then
    Cancel = 1
    End
End If
End Sub

Sub MasStart(thisForm)
    'Dim CtrlA
    'For Each CtrlA In thisForm
    '   If CtrlA.Tag <> "0" Then
    '       CtrlA.Left = CtrlA.Left * (Screen.Width - 1024) \ 14300
    '       CtrlA.Top = CtrlA.Top * (Screen.Height - 768) \ 11500
    '   End If
    'Next
End Sub
Sub FindTarget()
    Dim Appl As String
    Appl = App.Path
    If Right(Appl, 1) <> "\" Then Appl = Appl & "\"
End Sub

