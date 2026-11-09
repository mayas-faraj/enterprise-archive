VERSION 5.00
Begin VB.Form Acc_TasdidChange 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ⁄œÌ·  ”œÌœ« "
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6210
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   3210
   ScaleWidth      =   6210
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtMotalabaId 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   2280
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtNum 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   2640
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtMotalaba 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1800
      Width           =   1815
   End
   Begin VB.TextBox txtD 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   2640
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   1800
      Width           =   735
   End
   Begin VB.TextBox txtAccName 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1800
      Width           =   2535
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ⁄œÌ· «·”‰œ"
      Default         =   -1  'True
      Height          =   375
      Left            =   4560
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2640
      Width           =   1455
   End
   Begin VB.CommandButton CCancel 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2640
      Width           =   1455
   End
   Begin VB.Label lblAccNameOld 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   960
      Width           =   4695
   End
   Begin VB.Label lblAccName 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   1320
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   2280
      Width           =   4695
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "≈·Ï «·ﬁÌœ                                                                          Ê«·„ÿ«·»…"
      Height          =   255
      Left            =   600
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   1440
      Width           =   5175
   End
   Begin VB.Label lblMotalabaOld 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label lblDOld 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   2640
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   480
      Width           =   735
   End
   Begin VB.Label lblAccOld 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   480
      Width           =   2535
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   " ⁄œÌ· «·ﬁÌœ                                                                    «·„— »ÿ »«·„ÿ«·»…"
      Height          =   255
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   240
      Width           =   5175
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   3090
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   2
      Left            =   0
      Top             =   0
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   3165
      Index           =   0
      Left            =   6120
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   3165
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   135
   End
End
Attribute VB_Name = "Acc_TasdidChange"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Dim conn As New adodb.Connection
Dim KaidId As String

' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String
'ALERT: It seems that this form has its own connection,
'please IyadK check this, and see if we need to integrate
'it through the use of ActiveDatabaseName. I did it anyway

Private Sub CCancel_Click()
    Conn.Close
    Acc_DailyNew.fg.Col = 2
    Unload Me
End Sub

Private Sub COk_Click()
    Dim Cancel As Boolean
    If txtNum.text = "" Or txtMotalabaId.text = "" Then
        MsgBox "ÌÃ»  ÕœÌœ «·‘—ﬂ… Ê«·„ÿ«·»… ﬁ»·  ⁄œÌ· «·”‰œ"
        Exit Sub
    End If
    Dim oldVal As Double
    Dim isKaid As Boolean
    Dim id As String
    isKaid = False
    id = txtMotalabaId.text
    oldVal = 0
    If txtMotalaba.text = lblMotalabaOld.Caption Then
        oldVal = CDbl(lblDOld.Caption)
        isKaid = True
        id = KaidId
    End If
    If Not AcceptableValueForCompany(Conn, CDbl(txtD.text), oldVal, id, isKaid) Then
        MsgBox "ﬁÌ„… «· ”œÌœ «· Ì √⁄ÿÌ Â« √ﬂ»— „‰ ﬁÌ„… «· ”œÌœ«  «·„ »ﬁÌ…. «·—Ã«¡  ⁄œÌ· ﬁÌ„… «· ”œÌœ"
        Exit Sub
    End If
    ExecuteCommand Conn, "update Acc_TasdidSanad" & Acc_DBYear & " set tasdid=" & txtMotalabaId.text & "  where sanad=" & KaidId & "  update acc_DetSanadTMP set D=" & txtD.text & ", acc=" & txtNum.text & " where id=" & KaidId, Cancel
    Debug.Print "update Acc_TasdidSanad" & Acc_DBYear & " set tasdid=" & txtMotalabaId.text & "  update acc_DetSanadTMP set D=" & txtD.text & ", acc=" & txtNum.text & " where id=" & KaidId
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
'    conn.Close
    Acc_DailyNew.fg.Col = 3
    Unload Me
End Sub

Private Sub txtTajaoz_Validate(Cancel As Boolean)
    If txtTajaoz.text = "" Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈·€«¡ ﬁÌ„… «· Ã«Ê“"
        Cancel = True
        Exit Sub
    End If
    If Not IsNumeric(txtTajaoz.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· «· Ã«Ê“"
        Cancel = True
        Exit Sub
    End If
    Cancel = False
End Sub

Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = currentDatabaseName
End Sub

Private Sub Form_Load()
    
    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName

'    OpenConnection conn
    lblAccNameOld.Caption = Acc_DailyNew.fg.Cell(flexcpText, Acc_DailyNew.fg.Row, Acc_DailyNew.fg.Col)
    'lblAccOld.Caption = Acc_DailyNew.fg.Cell(flexcpText, Acc_DailyNew.fg.Row, 4)
    lblDOld.Caption = Acc_DailyNew.fg.Cell(flexcpText, Acc_DailyNew.fg.Row, 2)
    KaidId = Acc_DailyNew.fg.Cell(flexcpText, Acc_DailyNew.fg.Row, 4)
    txtD.text = lblDOld.Caption
    
    Dim rs As ADODB.Recordset
    Dim Cancel As Boolean
    Set rs = ExecuteSelect(Conn, "select acc from Acc_Accounts where num=" & Acc_DailyNew.fg.Cell(flexcpText, Acc_DailyNew.fg.Row, 5), Cancel)
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    If IsNull(rs!acc) Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    lblAccOld.Caption = rs!acc
    rs.Close
    Set rs = ExecuteSelect(Conn, "select tasdid,Kashef_ID from Acc_TasdidSanad" & Acc_DBYear & ", Organization_Kashef" & Acc_DBYear & " where tasdid=Kashef_ID and sanad=" & KaidId, Cancel)
    If Cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    If rs.EOF Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    If IsNull(rs!tasdid) Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
        Exit Sub
    End If
    lblMotalabaOld.Caption = rs!Kashef_ID
    txtMotalabaId.text = rs!tasdid
    txtAccName.text = lblAccOld.Caption
    lblAccName.Caption = lblAccNameOld.Caption
    txtMotalaba.text = lblMotalabaOld.Caption
    txtNum.text = Acc_DailyNew.fg.Cell(flexcpText, Acc_DailyNew.fg.Row, 5)
    
    rs.Close
End Sub

Private Sub txtAccName_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 116 Then
        Dim Cancel As Boolean
        txtAccName_Validate Cancel
    End If
End Sub

Private Sub txtAccName_Validate(Cancel As Boolean)
    Dim c As Boolean
'    If master.State = 0 Then Exit Sub
    Dim acc As String
    acc = txtAccName.text
    If acc <> "" Then
       Dim numeric As Boolean
       numeric = IsNumeric(acc)
       If numeric Then 'He entered the number of the account
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where acc='" & acc & "'", c)
       ElseIf InStr(1, acc, "(") > 0 Then
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where '('+acc+') '+name like '" & acc & "'", c)
       Else
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where name like '" & acc & "'", c)
       End If
       If c Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            Cancel = True
            Exit Sub
       End If
       If rs.RecordCount <> 1 Then
            rs.Close
            If numeric Then 'He entered the number of the account
                Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where acc='%" & acc & "%'", c)
            Else
                Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where name like '%" & acc & "%'", c)
            End If
            If c Then
                 MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
                 Cancel = True
                 Exit Sub
            End If
            If rs.RecordCount <> 1 Then
                   GLOBAL_TAG = ";datafield=,0:acc,1:name,2:type,;"
                   GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetGridAcc,1:SetGridName,2:SetType,;"
                   If numeric Then
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & acc & ",;"
                   Else
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & acc & ",;"
                   End If
                   GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select acc,name, num from Acc_Fari" & Acc_DBYear & ";"
                  'btnSettings = GetBtnSettings
                   Clin_List.fg.Cols = 3
                   Clin_List.fg.ColHidden(2) = True: Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
                   Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
                   Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                   Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
                    Clin_List.fg.Row = 1
                   If numeric Then
                        Clin_List.fg.Col = 0
                   Else
                        Clin_List.fg.Col = 1
                   End If
                   Set Clin_List.CallerForm = Me
                   txtAccName.text = ""
                   lblAccNameCaption = ""
                   txtNum.text = ""
                   Clin_List.Show 1
                   RefreshCommands btnSettings And FormSettings
                   If txtNum.text = "" Then Cancel = True
                   Exit Sub
            End If
       End If 'rs.RecordCount <> 1
       txtAccName.text = rs!acc ' & ") " & rs!Name
       lblAccName.Caption = "ﬂ‘› Õ”«»: " & rs!name
       txtNum.text = rs!Type
       txtMotalaba.text = ""
       txtMotalabaId.text = ""
    End If
End Sub

Private Sub txtMotalaba_KeyUp(KeyCode As Integer, Shift As Integer)
    If txtNum.text = "" Then
        MsgBox "Õœœ «·‘—ﬂ… √Ê·«"
        Exit Sub
    End If
    If KeyCode = 116 Then
        Dim Cancel As Boolean
        txtMotalaba_Validate Cancel
    End If
End Sub

Private Sub txtMotalaba_Validate(Cancel As Boolean)
    If txtNum.text = "" Then
        MsgBox "Õœœ «·‘—ﬂ… √Ê·«"
        Exit Sub
    End If
    If txtMotalaba.text = "" Then
        Exit Sub
    End If
    Dim c As Boolean
    Dim Sql As String
    Sql = "set dateformat dmy select x.dbo_ComName,x.dbo_id id,  x.Organization_ID, x.dbo_NumSend, " & vbCrLf & _
            "x.dbo_dateSend, x.dbo_Total, x.dbo_ComNumAcc," & vbCrLf & _
            "dbo_Id, isnull(tt.D,0) as rasid," & vbCrLf & _
            "case when x.dbo_Total=tt.D then 2 when tt.d is null then 0 else 1 end as  dbo_Paid" & vbCrLf & _
            "From " & vbCrLf & _
            "(select Organization_Name dbo_ComName, Asking_NO dbo_NumSend, Asking_Date dbo_dateSend, M dbo_Total, Kashef_ID dbo_Id, Organization.Organization_ID dbo_id, Organization.Account_Number_ID  dbo_ComNumAcc " & vbCrLf & _
            "from Organization inner join Organization_Kashef on (Organization.Organization_ID=Organization_Kashef.Organization_ID) " & vbCrLf & _
            "inner join Acc_DetSanadTMP" & Acc_DBYear & " on (Organization_Kashef.SanadID=Acc_DetSanadTMP.SanadId) " & vbCrLf & _
            "Where Organization.Account_Number_ID = Acc_DetSanadTMP.acc " & vbCrLf & _
            ") x " & vbCrLf & _
            "left outer join ( " & vbCrLf & _
            "     select t.tasdid, sum(d.d) D " & vbCrLf & _
            "     from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & vbCrLf & _
            "     Where t.sanad = d.id " & vbCrLf & _
            "    group by t.tasdid " & vbCrLf & _
            ")tt on tt.tasdid=x.dbo_Id " & vbCrLf & _
            "Where L.dbo_Total! = IsNull(tt.D, 0) and l.dbo_NumSend=" & txtMotalaba.text & " and dbo_ComNumAcc=" & txtNum.text
'
'            "Where X.dbo_Total! = IsNull(tt.d, 0) " & S & vbCrLf & _
'            "ORDER BY x.dbo_ComName,x.dbo_dateSend "
    
'    Sql = "select l.dbo_NumSend,l.dbo_ComName, l.DBO_ID as id " & _
'            " from ListCompanyAll" & Acc_DBYear & "  l left outer join " & _
'            "( " & _
'            "    select t.tasdid, sum(d.d) D " & _
'            "    from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & _
'            "    where t.sanad=d.id " & _
'            "    group by t.tasdid " & _
'            ")tt on tt.tasdid=l.dbo_id " & _
'            "Where L.dbo_Total! = IsNull(tt.D, 0) and l.dbo_NumSend=" & txtMotalaba.text & " and dbo_ComNumAcc=" & txtNum.text
    
    Set rs = ExecuteSelect(Conn, Sql, c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì ﬁ«⁄œ… «·„⁄ÿÌ« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
    If rs.RecordCount <> 1 Then
        'MsgBox "·« ÌÊÃœ Õ”«» »Â–« «·—ﬁ„"
        pForm = "ChangeTasdidMotalaba"
        txtMotalaba.text = ""
        txtMotalabaId.text = ""
'        lblMotalabaName.Caption = ""
        Acc_LookUpAccount.Show 1
        Exit Sub
    End If
    txtMotalaba.text = rs!dbo_NumSend
    txtMotalabaId.text = rs!id
    'acc = rs!acc
    rs.Close
End Sub

Public Sub SetGridAcc(val As String)
    txtAccName.text = val
End Sub
Public Sub SetGridName(val As String)
    lblAccName.Caption = val
End Sub
Public Sub SetType(val As String)
    txtNum.text = val
End Sub

