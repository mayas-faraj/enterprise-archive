Attribute VB_Name = "modNumberToString"
Function GetNo(ns As String, sex As Integer, Power As Integer, frst() As String, frst1() As String, scnd() As String, thrd() As String) As String
  Dim Lngth As Integer, InvSex  As Integer
  ReDim Indx(3) As Integer
  ReDim TmpArray(2) As String
  Dim tms As String

  If sex = 0 Then
    InvSex = 1
  Else
    InvSex = 0
  End If
  '«·Õ· „‰ √Ã· À·«À… √—ﬁ«„
  Lngth = Len(ns)
  '«·¬Õ«œ
  Indx(1) = Val(Mid$(ns, Lngth, 1))
  TmpArray(0) = frst(Indx(1), sex)
  Lngth = Lngth - 1
  If Lngth > 0 Then
    '«·⁄‘—« 
    Indx(2) = Val(Mid$(ns, Lngth, 1))
    If TmpArray(0) <> "" Then
      TmpArray(1) = scnd(Indx(2), InvSex)
    Else
      TmpArray(1) = scnd(Indx(2), sex)
    End If
    If (Indx(2) > 1) And (TmpArray(0) <> "") Then '«·⁄‘—«  „‰ 1 ≈·Ï  ”⁄…
      TmpArray(0) = TmpArray(0) + " Ê"
    ElseIf (Indx(1) = 1) And (Indx(2) = 1) Then  '√Õœ ⁄‘—
      TmpArray(0) = frst1(1, sex)
    ElseIf (Indx(1) = 2) And (Indx(2) = 1) Then ' «À‰« ⁄‘—
      TmpArray(0) = frst1(2, sex)
    End If
    Lngth = Lngth - 1
    If Lngth > 0 Then
    '«·„∆« 
      Indx(3) = Val(Mid$(ns, Lngth, 1))
      TmpArray(2) = thrd(Indx(3))
      If (Indx(3) > 0) And ((TmpArray(0) <> "") Or (TmpArray(1) <> "")) Then TmpArray(2) = TmpArray(2) + " Ê"
    Else
      GoTo last
    End If
  Else
    GoTo last
  End If
  '≈÷«›… ﬂ·„… «·„— »…(„∆…,√·›,...)Õ”» „— »… «·√—ﬁ«„
last:
Select Case Power
  Case Is = -1
    tms = TmpArray(2) & TmpArray(0) & TmpArray(1)
    If (TmpArray(0) <> "") And (TmpArray(1) = "") And (TmpArray(2) = "") Then
      GetNo = tms & " »«·⁄‘—…"
    ElseIf (TmpArray(0) <> "") And (TmpArray(1) <> "") And (TmpArray(2) = "") Then
       GetNo = tms & " »«·„∆…"
    ElseIf (TmpArray(0) <> "") And (TmpArray(1) <> "") And (TmpArray(2) <> "") Then
       GetNo = tms & " »«·√·›"
    End If
  Case Is = 0
    GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1)
  Case Is = 1
    If (Indx(1) = 1) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = " √·› "
    ElseIf (Indx(1) = 2) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = " √·›«‰ "
    ElseIf (Indx(1) > 2) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = TmpArray(0) & " ¬·«› "
    ElseIf (Indx(1) = 0) And (Indx(2) = 1) And (Indx(3) = 0) Then
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1) & " ¬·«› "
    ElseIf (Indx(1) = 0) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1)
    Else
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1) & " √·› "
    End If
  Case Is = 2
    If (Indx(1) = 1) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = " „·ÌÊ‰ "
    ElseIf (Indx(1) = 2) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = " „·ÌÊ‰«‰ "
    ElseIf (Indx(1) > 2) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = TmpArray(0) & " „·«ÌÌ‰ "
    ElseIf (Indx(1) = 0) And (Indx(2) = 1) And (Indx(3) = 0) Then
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1) & " „·«ÌÌ‰ "
    ElseIf (Indx(1) = 0) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1)
    Else
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1) & " „·ÌÊ‰ "
    End If
  Case Is = 3
    If (Indx(1) = 1) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = " „·Ì«— "
    ElseIf (Indx(1) = 2) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = " „·Ì«—«‰ "
    ElseIf (Indx(1) > 2) And (Indx(2) = 0) And (Indx(3) = 0) Then
      GetNo = TmpArray(0) & " „·Ì«—«  "
    ElseIf (Indx(1) = 0) And (Indx(2) = 1) And (Indx(3) = 0) Then
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1) & " „·Ì«—«  "
    Else
      GetNo = TmpArray(2) & TmpArray(0) & TmpArray(1) & " „·Ì«— "
    End If
 End Select
End Function
Function WriteNo(no As String, sex As Integer) As String
  
  Static FirstArray(9, 1) As String
  Static FirstArray1(2, 1)  As String
  Static SecondArray(9, 1) As String
  Static ThirdArray(9) As String
  
  ReDim Parts(4) As String
  ReDim PartStr(-1 To 3) As String
  
  Dim Length As Integer, i As Integer, TempLength As Integer
  Dim NoString As String, pos  As Integer
  Dim AfterPoint As String
  Dim txt As String

  'sex=0 „–ﬂ—
  'sex= 1 „ƒ‰À

  FirstArray(1, 0) = "Ê«Õœ ": FirstArray(2, 0) = "«À‰«‰ ": FirstArray(3, 0) = "À·«À… "
  FirstArray(4, 0) = "√—»⁄… ": FirstArray(5, 0) = "Œ„”… ": FirstArray(6, 0) = "” … "
  FirstArray(7, 0) = "”»⁄… ": FirstArray(8, 0) = "À„«‰Ì… ": FirstArray(9, 0) = " ”⁄… "

  FirstArray(1, 1) = "Ê«Õœ… ": FirstArray(2, 1) = "«À‰ «‰ ": FirstArray(3, 1) = "À·«À "
  FirstArray(4, 1) = "√—»⁄ ": FirstArray(5, 1) = "Œ„” ": FirstArray(6, 1) = "”  "
  FirstArray(7, 1) = "”»⁄ ": FirstArray(8, 1) = "À„«‰ ": FirstArray(9, 1) = " ”⁄ "
                                                        
  FirstArray1(1, 0) = "√Õœ ": FirstArray1(2, 0) = "«À‰« "
  
  FirstArray1(1, 1) = "≈ÕœÏ ": FirstArray1(2, 1) = "«À‰ « "
                     
  SecondArray(1, 0) = "⁄‘—… ": SecondArray(2, 0) = "⁄‘—Ê‰ ": SecondArray(3, 0) = "À·«ÀÊ‰ "
  SecondArray(4, 0) = "√—»⁄Ê‰ ": SecondArray(5, 0) = "Œ„”Ê‰ ": SecondArray(6, 0) = "” Ê‰ "
  SecondArray(7, 0) = "”»⁄Ê‰ ": SecondArray(8, 0) = "À„«‰Ê‰ ": SecondArray(9, 0) = " ”⁄Ê‰ "

  SecondArray(1, 1) = "⁄‘— ": SecondArray(2, 1) = "⁄‘—Ê‰ ": SecondArray(3, 1) = "À·«ÀÊ‰ "
  SecondArray(4, 1) = "√—»⁄Ê‰ ": SecondArray(5, 1) = "Œ„”Ê‰ ": SecondArray(6, 1) = "” Ê‰ "
  SecondArray(7, 1) = "”»⁄Ê‰ ": SecondArray(8, 1) = "À„«‰Ê‰ ": SecondArray(9, 1) = " ”⁄Ê‰ "


  ThirdArray(1) = "„∆… ": ThirdArray(2) = "„∆ «‰ ": ThirdArray(3) = "À·«À„∆… "
  ThirdArray(4) = "√—»⁄„∆… ": ThirdArray(5) = "Œ„”„∆… ": ThirdArray(6) = "” „∆… "
  ThirdArray(7) = "”»⁄„∆… ": ThirdArray(8) = "À„«‰„∆… ": ThirdArray(9) = " ”⁄„∆… "
  
  txt = "": i = -1

  If Val(no) = 0 Then 'Â· «·⁄œœ «·„œŒ· ’›—
    WriteNo = "’›—"
    Exit Function
  End If
  '«Õ–› «·›—«€«  «·Ì„Ì‰Ì… Ê«·Ì”«—Ì… «·“«∆œ… ›Ì Õ«· ÊÃÊœÂ«
  NoString = Trim(no)
  ' «Õ’· ⁄·Ï ÿÊ· ”·”·… «·⁄œœ
  Length = Len(NoString)
  '«Õ›Ÿ „ﬂ«‰ ÊÃÊœ «·›«’·… «·⁄‘—Ì…
  pos = InStr(NoString, ".")
  '«ﬁ”„ ”·”·… «·⁄œœ≈·Ï „«ﬁ»· «·›«’·… Ê„«»⁄œ «·›«’·…
  If pos > 0 Then
    AfterPoint = Right$(NoString, Length - pos)
    NoString = Left$(NoString, pos - 1)
    Length = Len(NoString)
  Else
    pos = InStr(NoString, ",")
    If pos > 0 Then
      AfterPoint = Right$(NoString, Length - pos)
      NoString = Left$(NoString, pos - 1)
      Length = Len(NoString)
    End If
  End If
  'Ã“¡ «·⁄œœ ≈·Ï ”·«”· Õ—›Ì… „ƒ·›… „‰ À·«À Œ«‰«  ⁄‘—Ì… √Ê √ﬁ·
  TempLength = Length
  Parts(0) = NoString
  Do While TempLength >= 3
    TempLength = TempLength - 3
    i = i + 1
    Parts(i) = Right$(NoString, 3)
    NoString$ = Left$(NoString, TempLength)
  Loop
  Parts(i + 1) = NoString
  '«” œ⁄ «· «»⁄ «·›—⁄Ì Ê«Õ›Ÿ «·‰ «∆Ã ›Ì «·„’›Ê›…
  For i = 0 To 3
    If Len(Parts(i)) > 0 Then
      PartStr(i) = GetNo(Parts(i), sex, i, FirstArray(), FirstArray1(), SecondArray(), ThirdArray())
    Else
      Exit For
    End If
  Next
 '««Ã„⁄ «·ﬂ·„«  «·Ã“∆Ì… «·‰« Ã… ›Ì ⁄«—… Ê«Õœ…
  For i = 3 To 0 Step -1
    If Len(PartStr(i)) > 0 Then
      If Len(PartStr(i - 1)) > 0 Then
        txt = txt & " " & PartStr(i) & "Ê"
      Else
        txt = txt & " " & PartStr(i) & " "
      End If
    End If
  Next
  If Val(AfterPoint) > 0 Then
    txt = txt & "Ê" & GetNo(AfterPoint, sex, -1, FirstArray(), FirstArray1(), SecondArray(), ThirdArray())
  End If
  WriteNo = txt
End Function




