Attribute VB_Name = "ModDef"
Global ADO, RS, selectSQL, Rep As Integer, MonthNum As String * 2, YearNum As String * 4
Global dName As String, dRegNum As String, dimportDes As String, dExportDes As String, dDate As String * 10

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
