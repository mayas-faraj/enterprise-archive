VERSION 5.00
Begin VB.Form Acc_NewDiscountDetails 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "«Œ Ì«— «·ÀÊ«»  (‰”» «·Õ”„ «·≈÷«›Ì)"
   ClientHeight    =   2745
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5445
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2745
   ScaleWidth      =   5445
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtDays 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   10241
         SubFormatType   =   1
      EndProperty
      Height          =   285
      Left            =   600
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   720
      Width           =   855
   End
   Begin VB.TextBox txtAccountName 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   285
      Left            =   480
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   1680
      Width           =   3495
   End
   Begin VB.CommandButton btnSearch 
      BackColor       =   &H00E0E0E0&
      Caption         =   "..."
      Height          =   375
      Left            =   480
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton btnUpdate 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Õ›Ÿ «· ⁄œÌ·"
      Height          =   375
      Left            =   3120
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   2160
      Width           =   1695
   End
   Begin VB.CommandButton btnClose 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   600
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   2160
      Width           =   1695
   End
   Begin VB.TextBox txtAccountNum 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   10241
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      Height          =   285
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1200
      Width           =   2295
   End
   Begin VB.TextBox txtDiscount 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   10241
         SubFormatType   =   1
      EndProperty
      Height          =   285
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   720
      Width           =   975
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "⁄œœ «·√Ì«„"
      Height          =   255
      Left            =   1440
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   720
      Width           =   735
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "«”„ «·Õ”«»"
      Height          =   255
      Index           =   2
      Left            =   4200
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "—ﬁ„ «·Õ”«»"
      Height          =   255
      Index           =   1
      Left            =   4200
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   1200
      Width           =   1095
   End
   Begin VB.Label lblYear 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2400
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   720
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "‰”»… «·Õ”„ «·«÷«›Ì"
      Height          =   255
      Index           =   0
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   720
      Width           =   1575
   End
   Begin VB.Label Label1 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·”‰… «·„«·Ì… "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "Acc_NewDiscountDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Dim accountChecked As Boolean
Public btnSettings As Long
Public FormSettings As Long

Private Sub btnClose_Click()
  Unload Me
End Sub
Sub Select_Account()
    Dim c As Boolean
'    If master.State = 0 Then Exit Sub
'    If Col = 0 And fg.editText <> "" Then
    MousePointer = vbHourglass
    Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari", c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Exit Sub
    End If
    If rs.RecordCount <> 1 Then
        rs.Close
        Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari", c)
        If c Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            Exit Sub
        End If
        If rs.RecordCount <> 1 Then
            GLOBAL_TAG = ";datafield=,0:acc,1:name,2:num,;"
            GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_account_num,1:Set_account_name,;"
            GLOBAL_TAG = GLOBAL_TAG & "initQuery=,;"
            GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select acc,name, num from Acc_Fari;"
            btnSettings = GetBtnSettings
            Clin_List.fg.Cols = 3
            Clin_List.fg.ColHidden(2) = True: Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
            Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
            Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
            Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
            Set Clin_List.CallerForm = Me
            Clin_List.Show 1
            RefreshCommands btnDetailSettings And FormSettings
            Exit Sub
        End If
    End If
    MousePointer = vbDefault
End Sub
Sub Set_account_num(Value As String)
    txtAccountNum.text = Value
    MousePointer = vbDefault
End Sub
Sub Set_account_name(Value As String)
    txtAccountName.text = Value
    MousePointer = vbDefault
End Sub
Private Sub btnSearch_Click()
Select_Account
End Sub

Private Sub btnUpdate_Click()
    Dim result As New ADODB.Recordset
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    Dim yearID As Integer
    
    yearID = lblYear.Caption
    sql = "Select * from Acc_ConstDiscountKashef where id=" & yearID
    Set result = ExecuteSelect(Conn, sql, cancel)
    
    If Not IsNumeric(txtDiscount.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· «·Õ”„"
        cancel = True
        Exit Sub
    End If
    If Not IsNumeric(txtDays.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· «·√Ì«„"
        cancel = True
        Exit Sub
    End If
    If Not IsNumeric(txtAccountNum.text) Then
       MsgBox "ÌÃ» √‰  œŒ· —ﬁ„ Õ”«» ’ÕÌÕ"
        cancel = True
        Exit Sub
    End If
    sql = "Select num from acc_accounts where acc = " & txtAccountNum.text
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If rs.RecordCount = 0 Then
        MsgBox "ÌÃ» √‰  œŒ· —ﬁ„ Õ”«» ’ÕÌÕ"
        cancel = True
        Exit Sub
    End If
    result.Fields("discount_percent").Value = txtDiscount.text
    result.Fields("dayes").Value = txtDays.text
    result.Fields("acc_num").Value = rs!Num
    result.Update
    MsgBox " „ Õ›Ÿ «·ﬁÌ„ «·„œŒ·…", vbOKOnly
    If cancel Then
       MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
       Exit Sub
   End If
End Sub

Private Sub Form_Load()
    Dim result As New ADODB.Recordset
    Dim res As New ADODB.Recordset
    Dim yearID As Integer
    Dim cancel As Boolean
    Dim sql As String
    Dim sqlcommGetID As String
      
    CheckEnabled (Acc_DBYear)
    ActiveDatabaseName = "default"
   ' OpenConnection (conn)
   If Acc_DBYear = "" Then
        sqlcommGetID = " Select max(ID) from Acc_ConstDiscountKashef "
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
    
    sql = "select ID,discount_percent,acc_num,acc,name as acc_name,dayes from Acc_ConstDiscountKashef k inner join acc_accounts a on  k.acc_num = a.num where id=" & yearID
    Set result = ExecuteSelect(Conn, sql, cancel)
    If result.RecordCount <> 0 Then
        lblYear.Caption = result.Fields("ID").Value
        txtDiscount.text = result.Fields("discount_percent").Value
        txtDays.text = result.Fields("dayes").Value
        txtAccountNum.text = result.Fields("acc").Value
        txtAccountName.text = result.Fields("acc_name").Value
     Else
      MsgBox "Â–Â «·⁄„·Ì… €Ì— „ «Õ… ›Ì «·”‰… «·Õ«·Ì…"
      'Exit Sub
     End If
    If cancel Then
       MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
       Exit Sub
   End If
End Sub
Private Sub CheckEnabled(yearID As String)
  Dim res As ADODB.Recordset
  Dim checkEdit As Boolean
  Dim cancel As Boolean
  Dim comm As String
   
    If Acc_DBYear = "" Then
        sqlcommGetID = " Select max(ID) from Acc_ConstDiscountKashef "
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
    comm = "select CanEdit from Acc_ConstDiscountKashef  where id=" & yearID
    Set res = ExecuteSelect(Conn, comm, cancel)
      
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
    Exit Sub
    Else
    If res.RecordCount <> 0 Then
      If Not res.Fields("CanEdit").Value Then
        txtDiscount.Enabled = False
        txtDays.Enabled = False
        txtAccountNum.Enabled = False
        txtAccountName.Enabled = False
        btnSearch.Enabled = False
        btnUpdate.Enabled = False
      End If
   End If
  End If

End Sub
