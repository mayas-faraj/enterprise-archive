Attribute VB_Name = "basic"
Global ADO, Rs, SelSQL As String, Rep As Integer, Appl As String, thisAccount As String, bytRec As Byte, blnPrint As Boolean, PrintNum As Integer

Sub ExitPro()
Dim Ms As Integer
Ms = MsgBox("„ √ﬂœ „‰ «·Œ—ÊÃ", vbYesNo, "”Ã· «·Õ”«»« ")
If Ms = vbYes Then
    End
Else
    Cancel = True
    Exit Sub
End If
End Sub
