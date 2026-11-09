VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCouncil_Meeting 
   BackColor       =   &H00E1FEFF&
   Caption         =   "„Õ«÷— «·Ã·”« "
   ClientHeight    =   7050
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11700
   Icon            =   "frmCouncil_Meeting.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7050
   ScaleWidth      =   11700
   WindowState     =   2  'Maximized
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«· ›ﬁœ"
      Height          =   5535
      Left            =   6000
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Tag             =   ";repeat=true;"
      Top             =   1440
      Width           =   5655
      Begin VB.CheckBox chkfra 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   240
         Width           =   5400
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4935
         Left            =   120
         TabIndex        =   15
         Tag             =   ";typeof=vsflexgrid;datafield=,0:full_name,1:council_position,2:exist_status,3:Council_Member_ID,;"
         Top             =   480
         Width           =   5415
         _cx             =   9551
         _cy             =   8705
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
         AllowUserResizing=   1
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmCouncil_Meeting.frx":1CFA
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
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„⁄·Ê„«  «·Ã·”…"
      Height          =   6990
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   "master"
      Top             =   0
      Width           =   11535
      Begin VB.TextBox txtMeet_Body 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000E&
         DataField       =   "Meet_Body"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   5145
         Left            =   135
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   22
         Tag             =   ";search=true;check=required;"
         Top             =   1710
         Width           =   5595
      End
      Begin VB.CommandButton cmdAddClause 
         Caption         =   "..."
         Height          =   285
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "≈÷«›… «·»‰œ „‰ «·ÀÊ«» "
         Top             =   1395
         Width           =   375
      End
      Begin VB.TextBox txtCouncil_No 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   3480
         RightToLeft     =   -1  'True
         TabIndex        =   19
         TabStop         =   0   'False
         Tag             =   ";search=true;check=Integer > 0;"
         Top             =   480
         Width           =   975
      End
      Begin VB.CheckBox chkComplementary 
         Alignment       =   1  'Right Justify
         Caption         =   "√⁄÷«¡ „ „„Ì‰"
         DataField       =   "Complementary_Exists"
         Height          =   375
         Left            =   3480
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   960
         Visible         =   0   'False
         Width           =   1815
      End
      Begin VB.TextBox txtPercentage 
         Alignment       =   1  'Right Justify
         DataField       =   "Presents_Percentage"
         Height          =   375
         Left            =   375
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   ";check=custom;"
         Text            =   "0"
         Top             =   960
         Width           =   1935
      End
      Begin VB.TextBox txtPresents 
         Alignment       =   1  'Right Justify
         DataField       =   "Presents"
         Height          =   375
         Left            =   5640
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   12
         TabStop         =   0   'False
         Text            =   "0"
         Top             =   960
         Width           =   1815
      End
      Begin VB.ComboBox cmbMeeting_Type 
         Height          =   315
         Left            =   8640
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   ";check=required;"
         Top             =   960
         Width           =   1575
      End
      Begin VB.TextBox txtMeeting_Time 
         Alignment       =   1  'Right Justify
         DataField       =   "Meeting_Time"
         Height          =   375
         Left            =   5640
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   ";check=required;"
         Top             =   480
         Width           =   1800
      End
      Begin VB.TextBox txtMeeting_No 
         Alignment       =   1  'Right Justify
         DataField       =   "Meeting_No"
         Height          =   375
         Left            =   8655
         RightToLeft     =   -1  'True
         TabIndex        =   5
         TabStop         =   0   'False
         Tag             =   ";search=true;check=Integer > 0;"
         Top             =   480
         Width           =   1575
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   75
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   195
         Width           =   11385
      End
      Begin MSComCtl2.DTPicker dtMeeting_Date 
         DataField       =   "Meeting_Date"
         Height          =   375
         Left            =   375
         TabIndex        =   1
         Tag             =   ";search=true;check=date;"
         Top             =   480
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   57212929
         CurrentDate     =   40139
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "»‰Êœ «·≈Ã „«⁄"
         Height          =   195
         Index           =   1
         Left            =   4740
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   "search=true;"
         Top             =   1440
         Width           =   870
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H8000000B&
         BorderStyle     =   2  'Dash
         BorderWidth     =   2
         Height          =   5370
         Left            =   90
         Top             =   1530
         Width           =   5730
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·„Ã·”"
         Height          =   195
         Left            =   4560
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";search=true;"
         Top             =   600
         Width           =   735
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·Õ÷Ê—"
         Height          =   195
         Left            =   7680
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   "search=true;"
         Top             =   1050
         Width           =   795
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰”»… «·Õ÷Ê—"
         Height          =   195
         Left            =   2400
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   "search=true;"
         Top             =   1050
         Width           =   870
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰Ê⁄ «·≈Ã „«⁄"
         Height          =   195
         Index           =   0
         Left            =   10380
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   "search=true;"
         Top             =   1050
         Width           =   840
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " ÊﬁÌ  «·Ã·”…"
         Height          =   195
         Left            =   7500
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   "search=true;"
         Top             =   570
         Width           =   915
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ"
         Height          =   195
         Left            =   2640
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   "search=true;"
         Top             =   570
         Width           =   465
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·Ã·”…"
         Height          =   195
         Left            =   10500
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   "search=true;"
         Top             =   570
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmCouncil_Meeting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
'Public WithEvents details As Controller
Dim WithEvents fraController As Controller
Attribute fraController.VB_VarHelpID = -1
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
'Public FormDetailSettings As Long
'Public btnDetailSettings As Long
Public FormFraSettings As Long
Public btnFraSettings As Long
Dim oldScaleWidth As Double
Dim Current_Council_No As Long
Dim Current_Council_ID As Long
Public Council_Type As Integer
'0 ›—⁄
'1 ‰Ÿ«„  ⁄«Ê‰Ì



Sub Make_Combo_List()
    Dim str As String
    
    If Council_Type = 0 Then  '„Ã·” «·›—⁄
        str = str & "#0;"
        str = str & "—∆Ì” «·›—⁄"
        str = str & "|#1;"
        str = str & "√„Ì‰ «·”—"
        str = str & "|#2;"
        str = str & "«·Œ«“‰"
        str = str & "|#3;"
        str = str & "⁄÷Ê"
        str = str & "|#4;"
        str = str & "⁄÷Ê „ „„"
        str = str & "|#5;"
        str = str & "⁄÷Ê ÂÌ∆… ›—⁄"
    Else
        str = str & "#0;"
        str = str & "—∆Ì” „Ã·” ≈œ«—… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
        str = str & "|#1;"
        str = str & "√„Ì‰ «·”— «·‰Ÿ«„ «· ⁄«Ê‰Ì"
        str = str & "|#2;"
        str = str & "Œ«“‰ «·‰Ÿ«„ «· ⁄«Ê‰Ì"
        str = str & "|#3;"
        str = str & "⁄÷Ê „Ã·” ≈œ«—… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
        str = str & "|#4;"
        str = str & "⁄÷Ê „ „„  ⁄«Ê‰Ì"
        str = str & "|#5;"
        str = str & "⁄÷Ê ÂÌ∆… «·‰Ÿ«„ «· ⁄«Ê‰Ì"
    End If
    fg.ColComboList(1) = str
    
    Dim str2 As String
    str2 = str2
    str2 = str2 & "#0;"
    str2 = str2 & "€Ì«» »œÊ‰ ⁄–—"
    str2 = str2 & "|#1;"
    str2 = str2 & "€Ì«» »⁄–—"
    str2 = str2 & "|#2;"
    str2 = str2 & "Õ÷Ê—"
    fg.ColComboList(2) = str2

End Sub

Function Overrite_Space_Function(Spaces_Count As Integer) As String
    Overrite_Space_Function = ""
    For i = 0 To Spaces_Count - 1
        Overrite_Space_Function = Overrite_Space_Function & Chr(48)
    Next i
End Function
Function Get_Absents_String()
    Dim i As Integer
    Get_Absents_String = ""
    Dim X As Integer
    For i = 1 To fg.Rows - 1
        If fg.TextMatrix(i, 2) = 2 Then
            'X = 50 - Len(Trim(fg.TextMatrix(i, 0)))
            Get_Absents_String = Get_Absents_String & Trim(fg.TextMatrix(i, 0)) & vbCrLf
        End If
    Next i
End Function
Sub Save_Grid_In_DB()
    
    Dim cancel As Boolean
    Dim Delete_Statmet As String
    Dim rs As New ADODB.Recordset
    
    Delete_Statmet = "Delete Meeting_Present where Meeting_Clause_ID = " & master.rs!Council_Meeting_ID
    ExecuteCommand Conn, Delete_Statmet, cancel
    
    
    With rs
        .ActiveConnection = Conn
        .LockType = adLockPessimistic
        .CursorType = adOpenKeyset
        .MaxRecords = 1
        .Open "Meeting_Present"
        For i = 1 To fg.Rows - 1
            .addNew
            !Council_Meeting_ID = master.rs!Council_Meeting_ID
            !Council_Member_ID = val(fg.TextMatrix(i, 3))
            !Exist_Status = val(fg.TextMatrix(i, 2))
            .Update
        Next i
        .Close
    End With
    
    Set rs = Nothing
    
    
End Sub


Function Get_New_Meeting_No() As Long
    
    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    Dim sql1 As String
    sql1 = "Select max(Council_No) , Council_ID from Council Where Council_Type = " & Council_Type & " and getdate() between Start_Date and End_Date group by Council_ID"
    Set rs = ExecuteSelect(Conn, sql1, cancel)
    If (cancel) Then
        MsgBox "·« ÌÊÃœ –« Ì… „Ã·” „⁄—›… ÊÂÊ ÷„‰ «· «—ÌŒ «·Õ«·Ì ° «·—Ã«¡ «·–Â«» ≈·Ï ‘«‘… –« Ì… «·„Ã·” Ê ⁄—Ì› –« Ì… „Ã·” „‰ Â‰«ﬂ", vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        Set rs = Nothing
        Unload Me
        Exit Function
    End If
    If rs.EOF <> True Then
        If IsNull(rs.Fields(0).Value) Then
           MsgBox "·« ÌÊÃœ –« Ì… „Ã·” „⁄—›… ° «·—Ã«¡ «·–Â«» ≈·Ï ‘«‘… –« Ì… «·„Ã·” Ê ⁄—Ì› –« Ì… „Ã·” „‰ Â‰«ﬂ", vbCritical, "⁄„·Ì… „„‰Ê⁄…"
           Set rs = Nothing
           Unload Me
            Exit Function
        End If
  
        Current_Council_No = rs.Fields(0).Value
        Current_Council_ID = rs.Fields(1).Value
    
        sql = "Select isnull(Max(Meeting_No),0) + 1 from Council_Meeting " & _
           "where Council_ID = " & Current_Council_ID & " and Council_Type = " & Council_Type
           
        Set rs = ExecuteSelect(Conn, sql, cancel)
    
          txtMeeting_No.text = rs.Fields(0).Value
    Else
          MsgBox "·« ÌÊÃœ –« Ì… „Ã·” „⁄—›… ÊÂÊ ÷„‰ «· «—ÌŒ «·Õ«·Ì ° «·—Ã«¡ «·–Â«» ≈·Ï ‘«‘… –« Ì… «·„Ã·” Ê ⁄—Ì› –« Ì… „Ã·” „‰ Â‰«ﬂ", vbCritical, "⁄„·Ì… „„‰Ê⁄…"
           Set rs = Nothing
           Unload Me
            Exit Function
     End If ' rs is null
    Set rs = Nothing
    
End Function

Private Sub chkComplementary_Click()
    Dim cancel As Boolean
    Dim sql As String
    
    Select Case chkComplementary.Value
    Case 0
        sql = " Select Council_Member_ID,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as Full_Name , Council_Position, 0 as Exist_Status " & _
          " from  Council_member a,Council b" & _
          " where  b.Council_No = " & Current_Council_No & _
          " And Council_Type =  " & Council_Type & _
          " And a.Council_ID = b.Council_ID  " & _
          " And Council_Position <> 4 " & _
          " order by Council_Position"
    Case 1
        sql = " Select Council_Member_ID,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as Full_Name , Council_Position, 0 as Exist_Status " & _
          " from  Council_member a,Council b" & _
          " where  b.Council_No = " & Current_Council_No & _
          " And Council_Type =  " & Council_Type & _
          " And a.Council_ID = b.Council_ID " & _
          " order by Council_Position"
    End Select
    
    Set fraController.rs = ExecuteSelect(Conn, sql, cancel)
    If Not fraController.rs.EOF Then
        fraController.rs.MoveFirst
    End If
    
    txtPercentage.text = 0
    txtPresents.text = 0
    
    ResizeGrid fg
    
End Sub

Private Sub detailFrame_Click()
'    Select Case ActiveFrame
'    Case fra
'        btnFraSettings = GetBtnSettings
'    Case masterFrame
'        btnSettings = GetBtnSettings
'    End Select
'
'    If details.rs.RecordCount = 0 Then
'        FormDetailSettings = FormDetailSettings - btUpdate
'        btnDetailSettings = FormDetailSettings - btUpdate
'    Else
'        FormDetailSettings = FormDetailSettings + btUpdate
'        btnDetailSettings = FormDetailSettings + btUpdate
'    End If
'    SelectFrame Me, detailFrame
'    Set ActiveFrame = detailFrame
'    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

'Private Sub details_doSave(rs As ADODB.Recordset, Cancel As Boolean)
'     If details.rs.RecordCount = 0 Then
'        MsgBox "·« Ì„ﬂ‰ «· ⁄œÌ· ⁄·Ï ”Ã· ›«—€"
'        Cancel = True
'        details.CancelSave
'        txtClause_Text.text = ""
'        txtClause_Title.text = ""
'        Exit Sub
'    End If
'
'    If details.State = ST_ADDNEW Then
'        rs.Fields("Council_Meeting_ID").Value = master.rs.Fields("Council_Meeting_ID").Value
'    End If
'End Sub

Private Sub fg_AfterDataRefresh()
   With fg
    .ColWidth(0) = 1990
    .ColWidth(1) = 1005
    .ColWidth(2) = 1050
  End With
End Sub

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    Dim Presents_Count As Integer
    Dim Council_Main_Members As Integer
    
    If Col <> 2 Then Exit Sub
    
    Presents_Count = 0
    Council_Main_Members = 0
    
    For i = 1 To fg.Rows - 1
        If fg.TextMatrix(i, 1) <> "4" Then
            Council_Main_Members = Council_Main_Members + 1
            If fg.TextMatrix(i, 2) = 2 Then Presents_Count = Presents_Count + 1
        End If
    Next i
    txtPresents.text = Presents_Count
    txtPercentage.text = Left((Presents_Count * 100) / Council_Main_Members, 5)
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    Select Case Col
    Case 0, 1
        cancel = True
    Case 2
        If master.state <> ST_ADDNEW Then cancel = True
    End Select
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
    ActiveDatabaseName = "Default"
End Sub
Private Sub cmdAddClause_Click()
   
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    
    Set rs = ExecuteSelect(Conn, "select Meeting_Clause_Name as Title, Meeting_Clause_Text as Text from FixMeeting_Clause order by Meeting_Clause_ID", c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        c = True
        Exit Sub
    End If
       GLOBAL_TAG = ";datafield=,0:Title,1:Text,;"
       GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetClause_Title,1:SetClause_Text,;"
       GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select Meeting_Clause_Name as Title, Meeting_Clause_Text as Text from FixMeeting_Clause order by Meeting_Clause_ID;"
       btnSettings = GetBtnSettings
       Clin_List.fg.Cols = 2
       Clin_List.fg.ColHidden(0) = False
       Clin_List.fg.ColHidden(1) = False
       Clin_List.fg.ColWidth(1) = 3000
       Clin_List.fg.ColWidth(0) = 2000
       Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
       Clin_List.fg.Cell(flexcpText, 0, 1) = "⁄‰Ê«‰ «·»‰œ"
       Clin_List.fg.Cell(flexcpText, 0, 0) = "«·‰’ «·≈› —«÷Ì ··»‰œ"
       Set Clin_List.CallerForm = Me
       Clin_List.Show 1
       RefreshCommands btnSettings And FormSettings
       txtMeet_Body.SetFocus
       txtMeet_Body.SelStart = Len(txtMeet_Body.text)
End Sub
Public Sub SetClause_Title(val As String)
    txtMeet_Body.text = txtMeet_Body.text & val & vbNewLine
End Sub
Public Sub SetClause_Text(val As String)
    txtMeet_Body.text = txtMeet_Body.text & val & vbNewLine
End Sub
Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub
Private Sub Form_Load()
    oldScaleWidth = 11820
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
'    FormDetailSettings = btAll
'    btnDetailSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    FormFraSettings = 0
    btnFraSettings = 0
    
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    
'    Set details = New Controller
'    Set details.Form = Me
'    Set details.frame = detailFrame
'    controllers.Add details, detailFrame.Name
    
    Set fraController = New Controller
    Set fraController.Form = Me
    Set fraController.frame = fra
    controllers.Add fraController, fra.name
        
    InitFrame
    
    Dim cancel As Boolean
    Dim sql As String
    
    sql = " Select c.Council_No, cm.* from  Council_Meeting  cm inner join Council c on cm.council_ID = c.council_ID" & _
          " where cm.Council_ID = (select max(council_ID)   from Council Where Council_type = " & Council_Type & "  and getdate() between Start_Date and End_Date) and cm.Council_type = " & Council_Type & _
          " order by Council_Meeting_ID" '''
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    If master.rs.RecordCount > 0 Then
        master.rs.MoveLast
    End If
    
'    If master.rs.RecordCount <> 0 Then
''        Current_Council_No = master.rs.Fields("Council_ID").value
'        Sql = " Select * from  Meeting_Clauses " & _
'              " where  Council_Meeting_ID = " & master.rs.Fields("Council_Meeting_ID").Value & _
'              " order by Meeting_Clause_ID"
'        Set details.rs = ExecuteSelect(Conn, Sql, Cancel)
'    End If
    
    'master.MoveFirst
    
        
    Set ActiveFrame = masterFrame
    '<Ashraf>
    If master.rs.RecordCount = 0 Then dtMeeting_Date.Value = DateTime.Date
    '</Ashraf>
    'fg.ColComboList(1) = mak
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
     With cmbMeeting_Type
        .AddItem "œÊ—Ì"
        .ItemData(.NewIndex) = 0
        .AddItem "«” À‰«∆Ì"
        .ItemData(.NewIndex) = 1
        .AddItem "ÂÌ∆… ⁄«„…"
        .ItemData(.NewIndex) = 2
        .AddItem "«‰ Œ«»Ì"
        .ItemData(.NewIndex) = 3
        .ListIndex = 0
     End With
End Sub

Private Sub Form_Resize()
 Dim Alpha As Double
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
        Exit Sub
    End If
    If (MDIMain.WindowState = vbMinimized) Then
        Exit Sub
    End If
    If (Me.WindowState = vbMinimized) Then
        Exit Sub
    End If
    Alpha = ScaleWidth / oldScaleWidth
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub
Private Sub fra_Click()
    
    Select Case ActiveFrame
    Case masterFrame
        btnSettings = GetBtnSettings
    Case detailFrame
        btnDetailSettings = GetBtnSettings
    End Select
    
    btnSettings = GetBtnSettings
    SelectFrame Me, fra
    Set ActiveFrame = fra
    RefreshCommands FormFraSettings And btnFraSettings
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    
    Get_New_Meeting_No
    txtMeeting_Time.SetFocus
    chkComplementary.visible = True
    txtPresents.text = 0
    txtPercentage.text = 0
    txtCouncil_No.text = Current_Council_No
    fg.Editable = flexEDKbdMouse

'    Dim Cancel As Boolean
'    Dim Sql As String
'    If Council_Type = 0 Then  '„Ã·” ›—⁄
'       Sql = " Select Council_Member_ID,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as Full_Name , Council_Position, 0 as Exist_Status " & _
'              " from   Council_member,Council " & _
'              " where  Council_No = " & Current_Council_No & _
'              " And Council_Position <> 4 and council_member.council_id = council.council_id" & _
'              " order by Council_Position "
'    Else
'        Sql = " Select Council_Member_ID,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as Full_Name , Council_Position, 0 as Exist_Status " & _
'              " from   Council_member,Council " & _
'              " where  Council_No = " & Current_Council_No & _
'              " And Collaborative_Council_Position <> 4  and council_member.council_id = council.council_id" & _
'              " order by Council_Position "
'    End If
'    Set fraController.rs = ExecuteSelect(Conn, Sql, Cancel)
'    If Not fraController.rs.EOF Then
'        fraController.rs.MoveFirst
'    End If
    chkComplementary.Value = 0
    chkComplementary_Click
    
    '-----------------
    Make_Combo_List
    master.state = ST_ADDNEW
    
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.Editable = flexEDKbdMouse
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    
    cmbMeeting_Type.ListIndex = GetListIndex(cmbMeeting_Type, rs.Fields("Meeting_Type_ID").Value)
   If IsEmpty(master.rs.Fields("Council_ID").Value) Then
     Exit Sub
   End If
   
    Current_Council_No = master.rs.Fields("Council_No").Value
    Current_Council_ID = master.rs.Fields("Council_ID").Value
    txtCouncil_No.text = Current_Council_No
    
'    Sql = " Select * from  Meeting_Clauses " & _
'          " where  Council_Meeting_ID = " & master.rs.Fields("Council_Meeting_ID").Value & _
'          " order by Meeting_Clause_ID"
'
'    Set details.rs = ExecuteSelect(Conn, Sql, Cancel)
'    If Not details.rs.EOF Then
'        details.rs.MoveFirst
'    End If
'    Set details.rs = ExecuteSelect(Conn, Sql, Cancel)
'    If Not details.rs.EOF Then
'        details.rs.MoveFirst
'    End If
    
    sql = " Select distinct B.Council_Member_ID,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as Full_Name , Council_Position, Exist_Status " & _
          " from   Council_member A , Meeting_Present B" & _
          " where  Council_ID = " & Current_Council_ID & _
          " And    A.Council_Member_ID = B.Council_Member_ID" & _
          " And Council_Meeting_ID = " & rs!Council_Meeting_ID & _
          " order by Council_Position"
          
    Set fraController.rs = ExecuteSelect(Conn, sql, cancel)
    If Not fraController.rs.EOF Then
        fraController.rs.MoveFirst
    End If
    
    txtMeet_Body.SelStart = Len(txtMeet_Body.text)
    
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If rs.RecordCount = 0 Then Exit Sub
    Dim i As Integer
    
    Dim Abcent As String
    Dim Signatures As String
    
    Abcent = ""
    Signatures = ""
    
    For i = 1 To fg.Rows - 1
        If fg.Cell(flexcpTextDisplay, i, 2) <> "Õ÷Ê—" Then
            Abcent = Abcent & fg.Cell(flexcpTextDisplay, i, 0) + vbTab + "/" + fg.Cell(flexcpTextDisplay, i, 2) + "/" + vbNewLine
        Else
            Signatures = Signatures & fg.Cell(flexcpTextDisplay, i, 1) + vbTab + "œ." + fg.Cell(flexcpTextDisplay, i, 0) + vbNewLine
        End If
    Next i
    
    Signatures = Signatures + vbNewLine + vbNewLine
    
    For Each ctrl In DRMeetList.Sections(1).Controls
        Select Case LCase(ctrl.name)
        Case "lblstate_name"
            ctrl.Caption = "‰ﬁ«»… √ÿ»«¡ «·√”‰«‰ - ›—⁄ „Õ«›Ÿ… " & Current_State.name
        Case "lbldate"
            ctrl.Caption = dtMeeting_Date.Value
        Case "lbltime"
            ctrl.Caption = txtMeeting_Time.text
        Case "lblmeeting_type"
            ctrl.Caption = cmbMeeting_Type.text
        Case "lblmeeting_no"
            ctrl.Caption = txtMeeting_No.text
        Case "lblpresents"
            ctrl.Caption = txtPresents.text
        Case "lblabcent"
            ctrl.Caption = Abcent
        End Select
    Next ctrl
    
    Get_DataReport_Label_byName(DRMeetList, 5, "lblSignatures").Caption = Signatures
    
    Dim rsReport As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "Select Meet_Body from Council_Meeting where Council_Meeting_ID = " & master.rs!Council_Meeting_ID
    
    Set rsReport = ExecuteSelect(Conn, sql, cancel)
    Set DRMeetList.DataSource = rsReport
    
    DRMeetList.Show 1
    
    Set rsReport = Nothing
    
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    
    If master.state = ST_ADDNEW Then
        rs.Fields("Council_ID").Value = Current_Council_ID
    End If
    
    rs.Fields("Meeting_Type_ID").Value = cmbMeeting_Type.ItemData(cmbMeeting_Type.ListIndex)
    rs.Fields("Council_Type").Value = Council_Type
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    chkComplementary.visible = False
    fg.Editable = flexEDNone
    Save_Grid_In_DB
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    msg = "·« Ì„ﬂ‰ Õ›Ÿ Â–Â «·Ã·”… »Â–« «·—ﬁ„ ·√‰ —ﬁ„ «·Ã·”… „ÊÃÊœ „”»ﬁ«"
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    fg.Editable = flexflexEDNone
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If ctrl = txtPercentage Then
        If val(txtPercentage.text) <= 0 Then
            msg = "ÌÃ» √‰ ÌﬂÊ‰ ⁄œœ «·Õ÷Ê— √ﬂ»— „‰ «·’›—"
            checkType = True
        End If
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then Exit Sub
    Select Case ActiveFrame
    Case fra
        btnFraSettings = GetBtnSettings
    Case detailFrame
        btnDetailSettings = GetBtnSettings
    End Select
    
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
    
End Sub
Private Sub txtCouncil_No_KeyPress(KeyAscii As Integer)
    If master.state = ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub txtMeeting_No_KeyPress(KeyAscii As Integer)
    If master.state = ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    Else
        KeyAscii = 0
    End If
End Sub

