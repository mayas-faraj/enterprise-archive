VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCouncil_CV 
   BackColor       =   &H00E1FEFF&
   Caption         =   "–« Ì… «·„Ã·”"
   ClientHeight    =   9150
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   7575
   Icon            =   "frmCouncil.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   9150
   ScaleWidth      =   7575
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "√⁄÷«¡ «·„Ã·”"
      Height          =   5175
      Left            =   75
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   ";repeat=true;"
      Top             =   2250
      Width           =   7455
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   240
         Width           =   7215
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4575
         Left            =   90
         TabIndex        =   10
         Tag             =   ";typeof=vsflexgrid;datafield=,0:full_name,1:council_position,2:Doctor_ID,;"
         Top             =   480
         Width           =   7215
         _cx             =   12726
         _cy             =   8070
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
         Cols            =   3
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmCouncil.frx":1CFA
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
      Caption         =   "–« Ì… «·„Ã·”"
      Height          =   2115
      Left            =   45
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   "master"
      Top             =   30
      Width           =   7455
      Begin VB.ComboBox cmbCouncil_Type 
         DataField       =   "Council_Type"
         Height          =   315
         ItemData        =   "frmCouncil.frx":1D66
         Left            =   330
         List            =   "frmCouncil.frx":1D70
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Tag             =   ";search=true;check=required;"
         Top             =   585
         Width           =   1935
      End
      Begin VB.CommandButton cmdGet_Council 
         Caption         =   " ‘ﬂÌ· «·„Ã·”"
         Height          =   345
         Left            =   375
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1575
         Visible         =   0   'False
         Width           =   1575
      End
      Begin VB.TextBox txtCouncil_No 
         Alignment       =   1  'Right Justify
         DataField       =   "Council_No"
         Height          =   375
         Left            =   3795
         RightToLeft     =   -1  'True
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   ";search=true;check=custom;"
         Top             =   540
         Width           =   1935
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   240
         Width           =   7215
      End
      Begin MSComCtl2.DTPicker dtStart_Date 
         DataField       =   "Start_Date"
         Height          =   375
         Left            =   3795
         TabIndex        =   0
         Tag             =   ";check=date;check=required;check=custom;"
         Top             =   1080
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtEnd_Date 
         DataField       =   "End_Date"
         Height          =   375
         Left            =   330
         TabIndex        =   1
         Tag             =   ";check=date;check=required;check=custom;"
         Top             =   1080
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰Ê⁄ «·„Ã·”"
         Height          =   195
         Left            =   2625
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";search=true;"
         Top             =   660
         Width           =   765
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ ‰Â«Ì… «·œÊ—…"
         Height          =   195
         Left            =   2385
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1170
         Width           =   1245
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·„Ã·”"
         Height          =   195
         Left            =   6180
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   660
         Width           =   765
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ »œ«Ì… «·œÊ—…"
         Height          =   195
         Left            =   5955
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   1170
         Width           =   1215
      End
   End
End
Attribute VB_Name = "frmCouncil_CV"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Double
Dim Council_Changed As Boolean

Sub Make_Combo_List()
    
    Dim str As String
    
    If cmbCouncil_Type.ListIndex = 0 Then  '„Ã·” «·›—⁄
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
        str = str & "|#0;"
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
        str = str & "⁄÷Ê ÂÌ∆… „«·‰Ÿ«„ «· ⁄«Ê‰Ì"
    End If
    
    fg.ColComboList(1) = str
    
End Sub
Sub Save_Grid_Data()
    Dim cancel As Boolean
    Dim rs As New ADODB.Recordset
    
    ExecuteCommand Conn, "Delete Council_Member where Council_ID = " & master.rs!Council_ID, cancel
    If cancel = True Then
        MsgBox "·„   „ «·⁄„·Ì… »‰Ã«Õ", vbCritical + vbOKCancel, "Œÿ√"
        Exit Sub
    End If
    
    With rs
        .MaxRecords = 1
        .LockType = adLockPessimistic
        .CursorType = adOpenKeyset
        .ActiveConnection = Conn
        .Open "Council_Member"
        For i = 1 To fg.Rows - 1
          .addNew
          !Council_ID = master.rs!Council_ID
          !Doctor_ID = val(fg.Cell(flexcpText, i, 2))
          !Council_Position = val(fg.Cell(flexcpText, i, 1))
          .Update
        Next i
        .Close
    End With
    
    Set rs = Nothing
    
End Sub
Sub Get_Council_Members_Names()

    Dim rs As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
     
    Clear_Grid fg
    
    If cmbCouncil_Type.ListIndex = 0 Then '›—⁄
     
         sql = " Select First_Name + ' ' + Last_Name as Full_Name,Council_Position,Doctor_ID from Doctor_Cv " & _
               " Where isNull(isCouncil_Member,0) = 1 order by cast(Council_Position as numeric) "
    Else
         sql = " Select First_Name + ' ' + Last_Name as Full_Name,Collaborative_Council_Position,Doctor_ID from Doctor_Cv " & _
               " Where isNull(isCollaborative_Council_Member,0) = 1  order by Collaborative_Council_Position"
    End If
           
    Set rs = ExecuteSelect(Conn, sql, cancel)
     
    If rs.RecordCount = 0 Then
        MsgBox "ÌÃ» ⁄·Ìﬂ  ÕœÌœ √⁄÷«¡ «·„Ã·” Ê „‰«’»Â„ „‰ ‘«‘… –« Ì… «·√ÿ»«¡ ", vbCritical + vbOKOnly, "Œÿ√"
        Exit Sub
    End If
     
    Set fg.DataSource = rs
     
    Set rs = Nothing
     
End Sub

Private Sub cmdGet_Council_Click()
    Dim ColWidth1 As Long
    Dim ColWidth2 As Long
    Dim strFormat  As String
    
    ColWidth1 = fg.ColWidth(0)
    ColWidth2 = fg.ColWidth(1)
    strFormat = fg.FormatString
    Get_Council_Members_Names
    fg.FormatString = strFormat
    fg.ColWidth(0) = ColWidth1
    fg.ColWidth(1) = ColWidth2
    Council_Changed = True
    ResizeGrid fg
    Make_Combo_List
End Sub

Private Sub detailFrame_Click()
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub


Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
    ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    Else
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 7695
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = 0
    btnDetailSettings = 0
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set details = New Controller
    Set details.Form = Me
    Set details.frame = detailFrame
    controllers.Add master, masterFrame.name
    controllers.Add details, detailFrame.name
    Dim cancel As Boolean
    
    Set master.rs = ExecuteSelect(Conn, "select * from Council order by 1", cancel)
    
    Dim sql As String
    If master.rs.RecordCount > 0 Then
        sql = "select * from vCouncil_Member where Council_ID = " & master.rs!Council_ID & " order by Council_Position"
    End If
    Set ActiveFrame = masterFrame
    If master.rs.RecordCount = 0 Then Exit Sub
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    master.rs.MoveLast
    Me.Width = masterFrame.Width + 330
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    
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

Private Sub master_doAddNew(rs As ADODB.Recordset)
    cmdGet_Council.visible = True
    Council_Changed = False
    Clear_Grid fg
    fg.Rows = 1
    dtStart_Date.Value = Date
    cmbCouncil_Type.ListIndex = 0
    ResizeGrid fg
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    cmdGet_Council.visible = False
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    sql = "select * from vCouncil_Member where Council_ID = " & rs!Council_ID & " order by Council_Position"
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    
    If details.rs.RecordCount = 0 Then Exit Sub
    details.rs.MoveFirst
    
   
    Council_Changed = False
    Make_Combo_List
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    
    If rs.AbsolutePosition <> rs.RecordCount Then
        MsgBox "·« Ì„ﬂ‰ﬂ «· ⁄œÌ· ›Ì »Ì«‰«  „Ã·” „« ·„ Ìﬂ‰ ÂÊ «·„Ã·” «·Õ«·Ì", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
        Exit Sub
    End If
    
    If master.SaveAfterWhat = ST_ADDNEW Then
        Dim rsGetMemberNo As ADODB.Recordset
        Dim sql As String
        
        sql = "Select Count(*) + 1 from Council Where Council_Type = " & cmbCouncil_Type.ListIndex
        
        Set rsGetMemberNo = ExecuteSelect(Conn, sql, cancel)
        
        txtCouncil_No.text = rsGetMemberNo.Fields(0).Value
        
    End If
    
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    If Council_Changed Then
        Save_Grid_Data
    End If
    cmdGet_Council.visible = False
End Sub



Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    
    Select Case UCase(ctrl.name)
    Case UCase("txtCouncil_ID")
        If fg.Rows = 1 Then
            checkType = True
            msg = " ·« Ì„ﬂ‰ Õ›Ÿ –« Ì… „Ã·” »œÊ‰  ⁄ÌÌ‰ «·√⁄÷«¡° «·—Ã«¡ «·÷€ÿ ⁄·Ï “—  ‘ﬂÌ· «·„Ã·”"
            Exit Sub
        End If
    Case UCase("dtEnd_Date")
        If dtStart_Date.Value >= dtEnd_Date.Value Then
            msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ ‰Â«Ì… «·œÊ—… √ﬂ»—  „«„« „‰  «—ÌŒ »œ«Ì Â«"
            checkType = True
            Exit Sub
        End If
    Case UCase("dtStart_Date")
        
        Dim rs As ADODB.Recordset
        Dim sql As String
        Dim cancel As Boolean
        
        sql = "SET DATEFORMAT DMY  Select count(*) from council where '" & dtStart_Date.Value & _
                "' between start_date and end_date and council_Type = " & cmbCouncil_Type.ListIndex
        
        Set rs = ExecuteSelect(Conn, sql, cancel)
        
       If rs.Fields(0).Value <> 0 Then
            msg = " ·« Ì„ﬂ‰ √‰ ÌﬂÊ‰  «—ÌŒ »œ«Ì… «·œÊ—… «·ÃœÌœ… ÷„‰ › —… œÊ—… ”«»ﬁ…"
            checkType = True
            Exit Sub
       End If
       

    End Select
End Sub

Private Sub masterFrame_Click()
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
'    FormSettings = 0
'    btnSettings = btAll - btCancel - btSave - btSearchCancel - btSearchExec
    RefreshCommands btnSettings And FormSettings
End Sub
Private Sub txtCouncil_No_KeyPress(KeyAscii As Integer)
    If master.state = ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    Else
        KeyAscii = 0
    End If
End Sub
