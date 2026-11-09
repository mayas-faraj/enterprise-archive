VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Acc_LookUpAccount 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "«Œ Ì«— Õ”«» "
   ClientHeight    =   6105
   ClientLeft      =   1785
   ClientTop       =   1725
   ClientWidth     =   5850
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   6105
   ScaleWidth      =   5850
   Begin VSFlex7Ctl.VSFlexGrid flxAccounts 
      Height          =   4605
      Left            =   225
      TabIndex        =   5
      Top             =   675
      Width           =   5415
      _cx             =   9551
      _cy             =   8123
      _ConvInfo       =   1
      Appearance      =   1
      BorderStyle     =   1
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      BackColorFixed  =   -2147483633
      ForeColorFixed  =   -2147483630
      BackColorSel    =   -2147483635
      ForeColorSel    =   -2147483634
      BackColorBkg    =   -2147483636
      BackColorAlternate=   -2147483643
      GridColor       =   -2147483633
      GridColorFixed  =   -2147483632
      TreeColor       =   -2147483632
      FloodColor      =   192
      SheetBorder     =   -2147483642
      FocusRect       =   1
      HighLight       =   1
      AllowSelection  =   -1  'True
      AllowBigSelection=   -1  'True
      AllowUserResizing=   0
      SelectionMode   =   0
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   1
      Cols            =   9
      FixedRows       =   1
      FixedCols       =   0
      RowHeightMin    =   0
      RowHeightMax    =   0
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   $"Acc_LookUpAccount.frx":0000
      ScrollTrack     =   0   'False
      ScrollBars      =   3
      ScrollTips      =   0   'False
      MergeCells      =   0
      MergeCompare    =   0
      AutoResize      =   -1  'True
      AutoSizeMode    =   0
      AutoSearch      =   0
      AutoSearchDelay =   2
      MultiTotals     =   -1  'True
      SubtotalPosition=   1
      OutlineBar      =   0
      OutlineCol      =   0
      Ellipsis        =   0
      ExplorerBar     =   0
      PicturesOver    =   0   'False
      FillStyle       =   0
      RightToLeft     =   -1  'True
      PictureType     =   0
      TabBehavior     =   0
      OwnerDraw       =   0
      Editable        =   0
      ShowComboButton =   -1  'True
      WordWrap        =   0   'False
      TextStyle       =   0
      TextStyleFixed  =   0
      OleDragMode     =   0
      OleDropMode     =   0
      DataMode        =   0
      VirtualData     =   -1  'True
      DataMember      =   ""
      ComboSearch     =   3
      AutoSizeMouse   =   -1  'True
      FrozenRows      =   0
      FrozenCols      =   0
      AllowUserFreezing=   0
      BackColorFrozen =   0
      ForeColorFrozen =   0
      WallPaperAlignment=   9
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   255
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   210
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   5400
      Width           =   1400
   End
   Begin VB.TextBox Text2 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   2670
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   210
      Width           =   2055
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "—ﬁ„ «·Õ”«»"
      Height          =   195
      Left            =   1710
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   300
      Width           =   795
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   6000
      Width           =   5895
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   2
      Left            =   0
      Top             =   0
      Width           =   5895
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   6975
      Index           =   0
      Left            =   5730
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   6975
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   135
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«”„ «·Õ”«»"
      Height          =   195
      Left            =   4830
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   300
      Width           =   810
   End
End
Attribute VB_Name = "Acc_LookUpAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim rs As New ADODB.Recordset
Dim RowCount As Long
Dim StartBal As Double
Dim accType As Integer
Dim step As Long
Dim AccountLevel As String

Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub flxAccounts_AfterDataRefresh()
    Dim i As Integer
    Dim Visible_Coulumns(2) As Integer
    
    For i = 0 To flxAccounts.Cols - 1

        Select Case UCase(rs.Fields(i).name)
        Case "ACC"
            flxAccounts.ColWidth(i) = 1500
            Visible_Coulumns(0) = i
        Case "NAME"
            flxAccounts.ColWidth(i) = 3500
            Visible_Coulumns(1) = i
        Case Else
            flxAccounts.ColHidden(i) = True
        End Select
        
    Next i
    
    Select Case pForm
    Case "ChangeTasdidMotalaba"
        flxAccounts.TextMatrix(0, Visible_Coulumns(1)) = "«”„ «·‘—ﬂ…"
        flxAccounts.TextMatrix(0, Visible_Coulumns(0)) = "—ﬁ„ «·„ÿ«·»…"
    Case Else
        flxAccounts.TextMatrix(0, Visible_Coulumns(1)) = "«”„ «·Õ”«»"
        flxAccounts.TextMatrix(0, Visible_Coulumns(0)) = "—ﬁ„ «·Õ”«»"
    End Select
    
    For i = 0 To 1
        flxAccounts.ColAlignment(Visible_Coulumns(i)) = 7
        flxAccounts.FixedAlignment(Visible_Coulumns(i)) = 7
    Next i
    
    
End Sub

Private Sub flxAccounts_Click()
    Dim AccName As String
    Dim acc, accNum As Long
    flxAccounts.Col = 0
    accNum = flxAccounts.text
    flxAccounts.Col = 1
    AccName = flxAccounts.text

    flxAccounts.Col = 2
    acc = flxAccounts.text
    If pForm = "Daily" Then
        SetParentValues 0, "(" & accNum & ") " & AccName
        SetParentValues 4, acc
        Acc_DailyNew.fg.Col = 1
        'Acc_DailyNew.cmdDetCancel.Enabled = True
        'Acc_DailyNew.cmdDetSave.Enabled = True
    ElseIf pForm = "ChangeTasdid" Then
        Acc_TasdidChange.txtAccName.text = accNum
        Acc_TasdidChange.lblAccName.Caption = AccName
        Acc_TasdidChange.txtNum.text = acc
    ElseIf pForm = "ChangeTasdidMotalaba" Then
        Acc_TasdidChange.txtMotalaba.text = accNum
        Acc_TasdidChange.txtMotalabaId.text = acc
    ElseIf pForm = "Sandok" Then
        SetParentValues 0, "(" & accNum & ") " & AccName
        SetParentValues 4, acc
        Acc_Sandok.fg.Col = 1
        'Acc_Daily.cmdDetCancel.Enabled = True
        'Acc_Daily.cmdDetSave.Enabled = True
    ElseIf pForm = "DailyOpening" Then
        SetParentValues 0, "(" & accNum & ") " & AccName
        SetParentValues 4, acc
        Acc_DailyOpening.fg.Col = 1
    ElseIf pForm = "Master" Then
        Acc_Master.txtAcc.text = accNum
        Acc_Master.lblAccount.Caption = "ﬂ‘› Õ”«»: " & AccName
        Acc_DailyOpening.fg.Col = 3
        Acc_Master.txtType.text = flxAccounts.text
    ElseIf pForm = "Mizan" Then
        Acc_Mizan.txtAcc.text = accNum
    ElseIf pForm = "Tasdid" Then
        Acc_Tasdid.txtNum.text = acc
        Acc_Tasdid.txtDest.text = AccName
    ElseIf pForm = "Tawar2Help" Then
'        Acc_Tawar2Help.txtAccName.text = accNum
'        Acc_Tawar2Help.txtNum.text = acc
'        Acc_Tawar2Help.lblAccName.Caption = AccName
    End If
    Unload Me
End Sub
Private Sub SetParentValues(ByVal Col As Integer, ByVal text As String)
    If pForm = "Daily" Then
        Acc_DailyNew.fg.Col = Col
        Acc_DailyNew.fg.text = text
    ElseIf pForm = "Sandok" Then
        Acc_Sandok.fg.Col = Col
        Acc_Sandok.fg.text = text
    ElseIf pForm = "DailyOpening" Then
        Acc_DailyOpening.fg.Col = Col
        Acc_DailyOpening.fg.text = text
    End If
End Sub

Private Sub flxAccounts_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        flxAccounts_Click
    End If
End Sub

Private Sub Form_Load()
    SetCaption Me
    Dim sqlText As String
'    <AHMAD>
'    PrepareConnection adoAccount
'    adoAccount.CommandType = adCmdText
'    </AHMAD>

    
    
    If pForm = "Master" Then
        sqlText = " select * from Acc_Accounts" & Acc_DBYear
    ElseIf pForm = "Mizan" Then
        sqlText = " select * from Acc_Raisi" & Acc_DBYear
    ElseIf pForm = "Sandok" Then
        sqlText = " select * from Acc_Fari" & Acc_DBYear & " where acc!=181"
    ElseIf pForm = "Tawar2Help" Then
        sqlText = "select num, acc, name, type, parent from acc_Fari" & Acc_DBYear & " where acc like '270%' and acc!='270'"
    Else
        sqlText = " select * from Acc_Fari" & Acc_DBYear
    End If
    If pForm = "ChangeTasdidMotalaba" Then
        flxAccounts.TextMatrix(0, 0) = "«”„ «·‘—ﬂ…"
        flxAccounts.TextMatrix(0, 1) = "—ﬁ„ «·„ÿ«·»…"
        sqlText = "select l.dbo_NumSend as acc,l.dbo_ComName as name, l.dbo_Id as num " & _
            " from ListCompanyAll" & Acc_DBYear & "  l left outer join " & _
            "( " & _
            "    select t.tasdid, sum(d.d) D " & _
            "    from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & _
            "    where t.sanad=d.id " & _
            "    group by t.tasdid " & _
            ")tt on tt.tasdid=l.dbo_id " & _
            "Where L.dbo_Total! = IsNull(tt.D, 0) and l.dbo_ComNumAcc=" & Acc_TasdidChange.txtNum.text
    End If
'    <AHMAD>
'    adoAccount.RecordSource = sqlText
'    adoAccount.Refresh
     Dim Cancel As Boolean
     
     Set rs = ExecuteSelect(Conn, sqlText, Cancel)
     Set flxAccounts.DataSource = rs
     
'    </AHMAD
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Account.Recordset.Close
End Sub

Private Sub Text1_Change()
    Dim sqlText As String
    If pForm = "Master" Then
        sqlText = " select * from Acc_Accounts" & Acc_DBYear & " where [acc] like '" & Text1.text & "%'"
    ElseIf pForm = "Mizan" Then
        sqlText = " select * from Acc_Raisi" & Acc_DBYear & " where [acc] like '" & Text1.text & "%' "
    ElseIf pForm = "Sandok" Then
        sqlText = " select * from Acc_Fari" & Acc_DBYear & " where [acc] like '" & Text1.text & "%' and [acc]!='181'"
    ElseIf pForm = "Tawar2Help" Then
        sqlText = "select num, acc, name, type, parent from acc_Fari" & Acc_DBYear & " where [acc] like '" & Text1.text & "%'  and [acc] like '270%' and acc!='270'"
    ElseIf pForm = "ChangeTasdidMotalaba" Then
        sqlText = "select l.dbo_NumSend as acc,l.dbo_ComName as name, l.dbo_Id as id " & _
            " from ListCompanyAll" & Acc_DBYear & "  l left outer join " & _
            "( " & _
            "    select t.tasdid, sum(d.d) D " & _
            "    from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & _
            "    where t.sanad=d.id " & _
            "    group by t.tasdid " & _
            ")tt on tt.tasdid=l.dbo_id " & _
            "Where L.dbo_Total! = IsNull(tt.D, 0) and l.dbo_ComNumAcc=" & Acc_TasdidChange.txtNum.text & " and l.dbo_NumSend=" & Text1.text
    Else
        sqlText = " select * from Acc_Fari" & Acc_DBYear & " where [acc] like '" & Text1.text & "%'"
    End If
    
    
    Dim Cancel As Boolean
    
    Set rs = ExecuteSelect(Conn, sqlText, Cancel)
    
    Set flxAccounts.DataSource = rs

End Sub

Private Sub Text2_Change()
    Dim sqlText As String
    If pForm = "Master" Then
        sqlText = " select * from Acc_Accounts" & Acc_DBYear & " where [name] like '%" & Text2.text & "%'"
    ElseIf pForm = "Mizan" Then
        sqlText = " select * from Acc_Raisi" & Acc_DBYear & " where [name] like '" & Text2.text & "%' "
    ElseIf pForm = "Sandok" Then
        sqlText = " select * from Acc_Fari" & Acc_DBYear & " where [name] like '%" & Text2.text & "%' and acc!='181'"
    ElseIf pForm = "Tawar2Help" Then
        sqlText = "select num, acc, name, type, parent from acc_Fari" & Acc_DBYear & " where [name] like '%" & Text2.text & "%'  and [acc] like '270%' and acc!='270'"
    ElseIf pForm = "ChangeTasdidMotalaba" Then
        sqlText = "select l.dbo_NumSend as acc,l.dbo_ComName as name, l.dbo_Id as id " & _
            " from ListCompanyAll" & Acc_DBYear & "  l left outer join " & _
            "( " & _
            "    select t.tasdid, sum(d.d) D " & _
            "    from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & _
            "    where t.sanad=d.id " & _
            "    group by t.tasdid " & _
            ")tt on tt.tasdid=l.dbo_id " & _
            "Where L.dbo_Total! = IsNull(tt.D, 0) and l.dbo_ComNumAcc=" & Acc_TasdidChange.txtNum.text & " and l.dbo_ComName=" & Text2.text
    Else
        sqlText = " select * from Acc_Fari" & Acc_DBYear & " where [name] like '%" & Text2.text & "%'"
    End If
'    adoAccount.RecordSource = sqlText
'    adoAccount.Refresh
End Sub


