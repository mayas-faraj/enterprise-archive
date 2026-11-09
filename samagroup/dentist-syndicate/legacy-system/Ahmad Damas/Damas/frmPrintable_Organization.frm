VERSION 5.00
Begin VB.Form frmPrintable_Organizations 
   Caption         =   "ÿ»«⁄… ﬂ‘› √ﬂÀ— „‰ „ƒ””…"
   ClientHeight    =   7050
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7395
   ControlBox      =   0   'False
   Icon            =   "frmPrintable_Organization.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7050
   ScaleWidth      =   7395
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   375
      Left            =   4080
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   6600
      Width           =   1455
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "ÿ»«⁄…"
      Height          =   375
      Left            =   5760
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   6600
      Width           =   1455
   End
   Begin VB.CommandButton cmdDeleteOne 
      Caption         =   "<"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3510
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   2820
      Width           =   495
   End
   Begin VB.CommandButton cmdAddAll 
      Caption         =   ">>"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3510
      MaskColor       =   &H00004000&
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   3915
      Width           =   495
   End
   Begin VB.CommandButton cmdDeleteAll 
      Caption         =   "<<"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3510
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   5010
      Width           =   495
   End
   Begin VB.CommandButton cmdAddOne 
      Caption         =   ">"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3510
      MaskColor       =   &H00004000&
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1725
      Width           =   495
   End
   Begin VB.ListBox lstPrintable 
      Height          =   5715
      Left            =   270
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   600
      Width           =   3015
   End
   Begin VB.ListBox lstAll 
      Height          =   5715
      Left            =   4110
      RightToLeft     =   -1  'True
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   600
      Width           =   3015
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁ«∆„… «·„ƒ””«  «· Ì ‰—Ìœ ÿ»«⁄… ﬂ‘Ê›Â«"
      Height          =   255
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   240
      Width           =   2895
   End
   Begin VB.Label lblAllOrganizations 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ﬁ«∆„… Ã„Ì⁄ «·„ƒ””« "
      Height          =   255
      Left            =   4950
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "frmPrintable_Organizations"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub Load_All_Organizations()
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Set rs = ExecuteSelect(Conn, _
            "Select Organization_ID,Organization_Name from organization Order By Organization_Name", c)
    Do While Not rs.EOF
        lstAll.AddItem rs!Organization_Name
        lstAll.ItemData(lstAll.NewIndex) = rs!Organization_Id
        rs.MoveNext
    Loop
    If lstAll.ListCount > 0 Then lstAll.ListIndex = 0
    Set rs = Nothing
End Sub

Private Sub cmdAddAll_Click()
    lstPrintable.Clear
    If lstAll.ListCount = 0 Then Exit Sub
    For i = 0 To lstAll.ListCount - 1
        lstPrintable.AddItem lstAll.List(i)
        lstPrintable.ItemData(lstPrintable.NewIndex) = lstAll.ItemData(i)
    Next i
    lstPrintable.ListIndex = lstPrintable.NewIndex
End Sub

Private Sub cmdAddOne_Click()
    On Error GoTo 20
    Dim i As Integer
    For i = 0 To lstPrintable.ListCount - 1
        If lstPrintable.ItemData(i) = lstAll.ItemData(lstAll.ListIndex) Then
            MsgBox "·ﬁœ  „  ÕœÌœ Â–Â «·„ƒ””… „”»ﬁ«", vbOKOnly + vbInformation, "⁄„·Ì… „„‰Ê⁄…"
            Exit Sub
        End If
    Next i
    lstPrintable.AddItem lstAll.text
    lstPrintable.ItemData(lstPrintable.NewIndex) = lstAll.ItemData(lstAll.ListIndex)
    lstPrintable.ListIndex = lstPrintable.NewIndex
20:
End Sub

Private Sub cmdCLose_Click()
    Unload Me
End Sub

Private Sub cmdDeleteAll_Click()
    lstPrintable.Clear
End Sub

Private Sub cmdDeleteOne_Click()
    On Error GoTo 20
    lstPrintable.RemoveItem lstPrintable.ListIndex
20:
End Sub

Private Sub cmdPrint_Click()
    cmdPrint.Enabled = False
    On Error GoTo ErrHandler
    
    Dim Cancel As Boolean
    Dim rs As ADODB.Recordset
    Dim Whole_Total As Long
    Dim str As String
    Dim Zero_Account As Integer
    
    
    
    str = "ﬁ«∆„… «·„ƒ””«  «·„÷„‰… »«· ﬁ—Ì— Ê —’ÌœÂ« ’›— :" & Chr(10) & Chr(13)
    
    If lstPrintable.ListCount = 0 Then
        MsgBox " ÌÃ» «Œ Ì«— „ƒ””… Ê«Õœ… ⁄·Ï «·√ﬁ·", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    For i = 0 To lstPrintable.ListCount - 1
       
        Whole_Total = frmOrganization_Kashef.GetWhole_Total(lstPrintable.ItemData(i))
        
        If Whole_Total <> 0 Then
    
            If frmOrganization_Kashef.optWith_Treat.Value Then
            
                
                     With DRCompanyMoney
                        .Sections(1).Controls(1).Caption = "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ - ›—⁄ „Õ«›Ÿ…" & Current_State.name
                        .Sections(1).Controls(11).Caption = lstPrintable.List(i)
                        .Sections(1).Controls(13).Caption = frmOrganization_Kashef.cmbMonth.text
                        .Sections(1).Controls(18).Caption = year(frmOrganization_Kashef.dtyear.Value)
                        Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name").Caption = Current_State.name
                        Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name1").Caption = Current_State.name
                        Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name2").Caption = Current_State.name
                        Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblAccount_Number").Caption = Current_State.Account_Number
                        Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblBoss").Caption = Current_State.Boss
                        Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblAccountant").Caption = Current_State.Accountant
                        Set .DataSource = ExecuteSelect(Conn, frmOrganization_Kashef.GetSql(lstPrintable.ItemData(i)), Cancel)
                        .DataMember = ""
                        Dim lblTaff As RptLabel
                        Set lblTaff = Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblTaff")
                        lblTaff.Caption = WriteNo(frmOrganization_Kashef.GetWhole_Total(lstPrintable.ItemData(i)), 0)
                        .PrintReport
                    End With
        
            Else
    
        
                    With DrCompanyExamList
                        Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblStateName").Caption = Current_State.name
                        Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblOrganization_Name").Caption = lstPrintable.List(i)
                        Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblState_Name").Caption = Current_State.name
                        Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblState_Name1").Caption = Current_State.name
                        Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblState_Name2").Caption = Current_State.name
                        Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblAccount_Number").Caption = Current_State.Account_Number
                        Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblBoss").Caption = Current_State.Boss
                        Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblAccountant").Caption = Current_State.Accountant
                        Set .DataSource = ExecuteSelect(Conn, frmOrganization_Kashef.GetSql(lstPrintable.ItemData(i)), Cancel)
                        .DataMember = ""
'                        Set lblTaff = Get_DataReport_Label_byName(DRCompanyMoney_, 5, "lblTaff")
'                        lblTaff.Caption = WriteNo(frmOrganization_Kashef.GetWhole_Total(lstPrintable.ItemData(i)), 0)
                        .PrintReport
                    End With
                
                
           End If 'frmOrganization_Kashef.optWith_Treat.Value
        Else
            Zero_Account = Zero_Account + 1
            str = str & "-" & " " & lstPrintable.List(i) & Chr(13) & Chr(10)
        End If ' Whole_Total <> 0
        
    Next i
    cmdPrint.Enabled = True
    If Zero_Account <> 0 Then MsgBox str
    Exit Sub
    
ErrHandler:
    Debug.Print Err.description
    cmdPrint.Enabled = True
    If Err.Number = 8542 Then
        MsgBox " «·—Ã«¡  €ÌÌ— ⁄—÷ «·Ê—ﬁ ›Ì «·ÿ«»⁄… «·«› —«÷Ì…", vbCritical, "Õÿ√ ÿ»«⁄…"
        Exit Sub
    End If
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ÿ»«⁄… «· ﬁ—Ì—", vbCritical
    
End Sub

Private Sub Form_Load()
    FormatForm Me
    Load_All_Organizations
End Sub


Private Sub lstAll_DblClick()
    cmdAddOne_Click
End Sub
