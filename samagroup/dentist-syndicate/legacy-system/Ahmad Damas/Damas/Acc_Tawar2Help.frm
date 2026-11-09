VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_Tawar2Help 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "„⁄Ê‰«  ’‰œÊﬁ «·ÿÊ«—∆"
   ClientHeight    =   7290
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10875
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7290
   ScaleWidth      =   10875
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„⁄Ê‰…"
      Height          =   3195
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   "master"
      Top             =   0
      Width           =   10665
      Begin MSComCtl2.DTPicker dtEvent_Date 
         DataField       =   "HelpDate"
         Height          =   375
         Left            =   510
         TabIndex        =   23
         Tag             =   ";check=required;search=true;"
         Top             =   1080
         Width           =   3180
         _ExtentX        =   5609
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40084
      End
      Begin VB.CommandButton Command2 
         Caption         =   " ﬁ—Ì—«·„⁄Ê‰«  «·€Ì— „’—Ê›…"
         Height          =   495
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   2640
         Width           =   2295
      End
      Begin VB.CommandButton Command1 
         Caption         =   " ﬁ—Ì—«·„⁄Ê‰«  «·„’—Ê›…"
         Height          =   495
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox txtOrderNum 
         Alignment       =   1  'Right Justify
         DataField       =   "OrderNum"
         Height          =   375
         Left            =   6060
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   1680
         Width           =   3000
      End
      Begin VB.TextBox txtDisaster 
         Alignment       =   1  'Right Justify
         DataField       =   "type"
         Height          =   375
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";search=true;check=required;"
         Top             =   1080
         Width           =   2550
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
         TabIndex        =   9
         Top             =   240
         Width           =   10395
      End
      Begin VB.TextBox txtDoctor_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_Name"
         Height          =   375
         Left            =   510
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";check=required;search=true;"
         Top             =   615
         Width           =   3180
      End
      Begin VB.TextBox txtDoctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         Height          =   375
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;check=integer>0;check=required;"
         Top             =   600
         Width           =   2550
      End
      Begin VB.CommandButton cmdSelectDoctor 
         Caption         =   "..."
         Height          =   375
         Left            =   6090
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox txtPayOrder_No 
         Alignment       =   1  'Right Justify
         DataField       =   "OrderPayNum"
         Height          =   375
         Left            =   6060
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   2160
         Width           =   3000
      End
      Begin VB.TextBox txtAmount 
         Alignment       =   1  'Right Justify
         DataField       =   "Amount"
         Height          =   375
         Left            =   6060
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   2580
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtOrderDate 
         DataField       =   "OrderDate"
         Height          =   375
         Left            =   510
         TabIndex        =   24
         Tag             =   ";search=true;"
         Top             =   1560
         Width           =   3180
         _ExtentX        =   5609
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40084
      End
      Begin MSComCtl2.DTPicker dtPayOrder_Date 
         DataField       =   "OrderPayDate"
         Height          =   375
         Left            =   510
         TabIndex        =   25
         Tag             =   ";search=true;"
         Top             =   2040
         Width           =   3180
         _ExtentX        =   5609
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40084
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·ﬁ—«—"
         Height          =   195
         Left            =   3705
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   1650
         Width           =   1290
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ﬁ—«—"
         Height          =   195
         Left            =   9480
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";search=true;"
         Top             =   1755
         Width           =   675
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰Ê⁄ «·ﬂ«—À…"
         Height          =   195
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   1200
         Width           =   795
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì» "
         Height          =   195
         Left            =   9150
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   720
         Width           =   1005
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·ÿ»Ì»"
         Height          =   195
         Left            =   3705
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   720
         Width           =   1290
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ √„— «·’—›"
         Height          =   195
         Left            =   3705
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   2130
         Width           =   1290
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ √„— «·’—›"
         Height          =   195
         Left            =   9150
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";search=true;"
         Top             =   2235
         Width           =   1005
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„»·€ «·„⁄Ê‰…"
         Height          =   195
         Left            =   9330
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";search=true;"
         Top             =   2655
         Width           =   825
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·ÊﬁÊ⁄"
         Height          =   195
         Left            =   3705
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1170
         Width           =   1290
      End
   End
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„—›ﬁ« "
      Height          =   3930
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   3270
      Width           =   10665
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   10395
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   2970
         Left            =   135
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:type,1:SheetDate,2:Source,;check=,0:required,1:required,2:required,;check=,1:date,;"
         Top             =   495
         Width           =   10410
         _cx             =   18362
         _cy             =   5239
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   0
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         BackColorFixed  =   14737632
         ForeColorFixed  =   -2147483630
         BackColorSel    =   -2147483635
         ForeColorSel    =   -2147483634
         BackColorBkg    =   14810879
         BackColorAlternate=   14810879
         GridColor       =   -2147483633
         GridColorFixed  =   -2147483632
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   5
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
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Acc_Tawar2Help.frx":0000
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
         TabBehavior     =   1
         OwnerDraw       =   0
         Editable        =   2
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
End
Attribute VB_Name = "Acc_Tawar2Help"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Public FormSettings As Long
Public btnSettings As Long
Public WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim ActiveFrame As frame
Dim oldScaleWidth As Long
Dim Doctor_checked  As Boolean
Const Arrow_ = 2
Const Amount_ = 3

Sub Select_Doctor()
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    
    Doctor_checked = False
    
    ActiveDatabaseName = "Default"
    
    sql = "select first_name + ' ' + last_name as Name ,Doctor_ID as ID,Father_Name,Mother_Name from Doctor_CV" & _
          " where Doctor_id = " & val(txtDoctor_ID.text) & _
          " Order by Doctor_ID"
          
   Set rs = ExecuteSelect(Conn, sql, c)
   
   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Doctor_checked = False
        Exit Sub
   End If
   
   If rs.RecordCount <> 1 Then
       rs.Close
          
          sql = "select first_name + ' ' + last_name as Name ,Doctor_ID as ID,Father_Name,Mother_Name " & _
                "from Doctor_CV " & _
                " order by 2"
          
                
          Set rs = ExecuteSelect(Conn, sql, c)
          
          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Doctor_checked = False
               ActiveDatabaseName = "tawar2"
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
                    GLOBAL_TAG = "datafield=,0:id,1:Name,2:Father_Name,3:Mother_Name,;"
                    GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Doctor_ID,1:Set_Doctor_Name,;"
                    GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
                    btnSettings = GetBtnSettings
                    Clin_List.fg.Cols = 4
                    Clin_List.fg.ColAlignment(3) = 7
                    Clin_List.fg.FixedAlignment(3) = 7
                    Clin_List.fg.ColWidth(0) = 1000
                    Clin_List.fg.ColWidth(1) = 2000
                    Clin_List.fg.ColWidth(2) = 1000
                    Clin_List.fg.ColWidth(3) = 1000
                    Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                    Clin_List.fg.Cell(flexcpText, 0, 0) = "«·—ﬁ„ «·–« Ì"
                    Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·ÿ»Ì»"
                    Clin_List.fg.Cell(flexcpText, 0, 2) = "«·√»"
                    Clin_List.fg.Cell(flexcpText, 0, 3) = "«·√„"
                    Set Clin_List.CallerForm = Me
                    Clin_List.Show 1
                    RefreshCommands btnSettings And FormSettings
                    ActiveDatabaseName = "tawar2"
                    Exit Sub
              ElseIf rs.RecordCount = 1 Then
                    txtDoctor_ID.text = rs.Fields("ID").Value
                    txtDoctor_Name.text = rs.Fields("Name").Value
                    Doctor_checked = True
              End If
    ElseIf rs.RecordCount = 1 Then
         txtDoctor_ID.text = rs.Fields("ID").Value
         txtDoctor_Name.text = rs.Fields("Name").Value
         Doctor_checked = True
    End If
    
   ActiveDatabaseName = "tawar2"
    
End Sub

Sub Set_Doctor_ID(Value As Long)
    txtDoctor_ID.text = Value
End Sub

Sub Set_Doctor_Name(Value As String)
    txtDoctor_Name.text = Value
End Sub

Private Sub cmdSelectDoctor_Click()
    txtDoctor_ID_Validate False
End Sub

Private Sub Command1_Click()
    pForm = "Tawar2HelpPay"
    frmYearParameter.Show 1
End Sub

Private Sub Command2_Click()
    pForm = "Tawar2HelpWait"
    frmYearParameter.Show 1
End Sub

Private Sub detailFrame_Click()
     btnSettings = GetBtnSettings
    Set ActiveFrame = detailFrame
    SelectFrame Me, detailFrame
End Sub

Private Sub Details_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!parent = master.rs!id
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "tawar2"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    Else
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
   
    oldScaleWidth = 11000
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btPrev - btFirst - btNext - btLast - btPrint
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
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
     ActiveDatabaseName = "tawar2"
    Set master.rs = ExecuteSelect(Conn, "Select * from VHelpCard Order by 1", cancel)
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
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
    
    ' Resize the grid fg
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
    fg.Rows = 1
    dtOrderDate.Value = Null
    dtPayOrder_Date.Value = Null
    dtEvent_Date.Value = Date
End Sub

'Private Sub master_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
'    detailFrame.visible = True
'End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
'    ExecuteCommand Conn, "delete from HelpCard where id=" & master.rs!id, Cancel
'    If Cancel Then
'        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
'    End If
'    Cancel = True
'    On Error Resume Next
'    rs.Resync
'    rs.MovePrevious
'    If rs.EOF Then rs.MoveNext
End Sub

'Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
'    Dim Step As Integer
'
'    Dim c As Boolean
'    Dim sql As String
'
'    Step = 0
'
'    ExecuteCommand Conn, "Delete from Inharitance where InharitanceID = " & rs!InharitanceID, c
'
'    Set master.rs = Nothing
'
'    sql = "Select * from vInharitance Order by 1 "
'
'    Set master.rs = ExecuteSelect(Conn, sql, c)
'
'    If Not master.rs.EOF Then
'        master.MoveFirst
'    Else
'        txtDoctor_ID.text = ""
'        txtDisaster.text = ""
'        txtDoctor_Name.text = ""
'        txtOrderNum.text = ""
'        txtPayOrder_No.text = ""
'        txtAmount.text = ""
'    End If
'    cancel = True
'
'    Exit Sub
'End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "select * from HelpCard_Det where parent =" & master.rs!id & " order by 1"
    
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not details.rs.EOF Then
        details.rs.MoveFirst
    End If
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    If txtAmount.text <> "" Or txtPayOrder_No.text <> "" Or txtOrderNum.text <> "" Then
        If txtAmount.text <> "" And txtPayOrder_No.text <> "" And txtOrderNum.text <> "" Then
'            Dim rs2 As ADODB.Recordset
'            'Dim cancel As Boolean
'            Dim SanadDate As String
'            Dim Descrb As String
'            Dim DetailDescrb As String
'            DetailDescrb = "„⁄Ê‰… «·ÿ»Ì» " & txtDoctor_Name.text
'            Descrb = "„⁄Ê‰… «·ÿ»Ì» " & txtDoctor_Name.text & " »«·ﬁ—«— —ﬁ„ " & txtOrderNum.text & " Ê√„— «·’—› —ﬁ„ " & txtPayOrder_No.text
'            SanadDate = "'" & Day(dtPayOrder_Date.Value) & "/" & Month(dtPayOrder_Date.Value) & "/" & Year(dtPayOrder_Date.Value) & "'"
'            Set rs2 = ExecuteSelect(Conn, "SET DATEFORMAT DMY DECLARE @SanadId as numeric(9) select @SanadId=isnull(max(id),0)+1 from Acc_SanadTmp;" & _
'                                          "  insert into Acc_SanadTmp(id,cdate,dscrb,type,state) " & _
'                                          "  select @SanadId , " & SanadDate & ",'" & Descrb & "',2,1; " & _
'                                          "  insert into Acc_DetSanadTmp(Acc,M,D,SanadId,Dscrb) " & _
'                                          "  select num, " & txtAmount.text & ", 0, @SanadId,'" & DetailDescrb & "' from Acc_Accounts where acc='" & 2700000 + CInt(txtDoctor_ID.text) & "'" & _
'                                          "  exec sp_BalanceSandok @SanadId", Cancel)
            Dim sql As String
            Dim rsCheckBalance As ADODB.Recordset
            Dim rsCheckTawar2_Limit As ADODB.Recordset
            
            sql = "Select Limit_Value from Tawar2_Limits Where limit_Year = " & year(dtPayOrder_Date.Value)
            Set rsCheckTawar2_Limit = ExecuteSelect(Conn, sql, cancel)
            
            If rsCheckTawar2_Limit.RecordCount = 0 Then
                MsgBox "·« ÌÊÃœ ”ﬁ› ≈⁄«‰«  „⁄—› ·Â–Â «·”‰… ° «·—Ã«¡ «·–Â«» ≈·Ï ‘«‘… ”ﬁ› «·≈⁄«‰«  Ê ⁄—Ì› ”ﬁ› ≈⁄«‰«  ·Â–Â «·”‰…", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
                cancel = True
                Exit Sub
            End If
            
            sql = "Select isNull(Sum(isNull(Help_Amount,0)),0) from HelpCard Where Doctor_ID = " & val(txtDoctor_ID.text)
            Set rsCheckBalance = ExecuteSelect(Conn, sql, cancel)
            
            If rsCheckBalance.Fields(0).Value + val(txtAmount.text) > rsCheckTawar2_Limit.Fields(0).Value Then
                MsgBox " ·« Ì„ﬂ‰ ≈⁄ÿ«¡ ﬂ«„· Â–« «·„»·€ ··ÿ»Ì» ·√‰ „Ã„Ê⁄ ≈⁄«‰« Â ÷„‰ Â–Â «·”‰… Ì Ã«Ê“ «·Õœ «·„”„ÊÕ »Â" & Chr(13) & Chr(10) & _
                       "«·—’Ìœ «·Õ«·Ì = " & rsCheckBalance.Fields(0).Value & Chr(13) & Chr(10) & _
                       "”ﬁ› «·≈⁄«‰«  = " & rsCheckTawar2_Limit.Fields(0).Value, vbCritical + vbOKOnly + vbMsgBoxRight + vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
                cancel = True
            End If
            
        Else
            MsgBox "ÌÃ» „·∆ Ã„Ì⁄ «·ÕﬁÊ· «·Œ«’… »’—› «·„⁄Ê‰…", vbMsgBoxRight + vbMsgBoxRtlReading
            cancel = True
            Exit Sub
        End If
    End If
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    detailFrame.visible = True
    
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "select * from HelpCard_Det where parent =" & master.rs!id & " order by 1"
    
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not details.rs.EOF Then
        details.rs.MoveFirst
    End If
    
End Sub
Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Select Case ctrl.name
    Case "dtEvent_Date"
        If dtEvent_Date.Value > dtOrderDate.Value Then
            msg = "Ì—ÃÏ «· √ﬂœ „‰ √‰  «—ÌŒ «·ÊﬁÊ⁄ „œŒ· »‘ﬂ· ’ÕÌÕ"
            checkType = True
        End If
    Case "dtOrderDate"
        If dtOrderDate.Value > dtPayOrder_Date.Value Then
            msg = "Ì—ÃÏ «· √ﬂœ „‰ √‰  «—ÌŒ «·ﬁ—«— „œŒ· »‘ﬂ· ’ÕÌÕ"
            checkType = True
        End If
    End Select
End Sub

Private Sub masterFrame_Click()
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtAmount_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtDoctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        txtDoctor_ID_Validate False
    Else
        KeyAscii = Prevent_char(KeyAscii)
    End If
End Sub

Private Sub txtDoctor_ID_Validate(cancel As Boolean)
    Select_Doctor
    cancel = Not Doctor_checked
End Sub

Private Sub txtTotal_Change()
End Sub
'
'' This variable takes its value during loading this form
'' And its value will be passed to the global variable ActiveDatabaseName
'' every time this form is Activated
'Private currentDatabaseName As String
''ALERT: It seems that this form has its own connection,
''please IyadK check this, and see if we need to integrate
''it through the use of ActiveDatabaseName. I did it anyway
'
'Private Sub COk_Click()
'    If txtNum.text = "" Then
'        MsgBox "ÌÃ» ÷»ÿ «·Õ”«» «·„ÿ·Ê» ’—› «·„⁄Ê‰… ·Â ﬁ»· «·Õ›Ÿ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    If txtMoney.text = "" Then
'        MsgBox "ÌÃ» ÷»ÿ „»·€ «·„⁄Ê‰… ﬁ»· «·Õ›Ÿ", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    If Not IsNumeric(txtMoney.text) Then
'        MsgBox "„»·€ «·„⁄Ê‰… ÌÃ» √‰ ÌﬂÊ‰ —ﬁ„« √ﬂ»— „‰ «·’›—", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'    If CDbl(txtMoney.text) <= 0 Then
'        MsgBox "„»·€ «·„⁄Ê‰… ÌÃ» √‰ ÌﬂÊ‰ —ﬁ„« √ﬂ»— „‰ «·’›—", vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'
'    Dim sql As String
'    Dim cancel As Boolean
'
'    sql = "declare @max as numeric(9,0)" & vbCrLf & _
'        "select @max=maxHelp from Acc_Consts" & vbCrLf & _
'        "select @max-isnull(sum(d),0)-" & txtMoney.text & " a " & vbCrLf & _
'        "From acc_Daily" & vbCrLf & _
'        "Where accno = '" & txtAccName & "' and type=8"
'    Dim rs As adodb.Recordset
'    Set rs = ExecuteSelect(conn, sql, cancel)
'    If cancel Then GoTo 1
'    If rs!a < 0 Then
'        MsgBox "„Ã„Ê⁄ „⁄Ê‰«  Â–« «·ÿ»Ì»  Ã«Ê“  «·„»·€ «·„”„ÊÕ »„ﬁœ«— " & Abs(rs!a), vbMsgBoxRight + vbMsgBoxRtlReading
'        Exit Sub
'    End If
'
'    sql = "set dateformat dmy exec sp_AddToSandok '" & dtDate.Value & "'," & txtNum.text & "," & txtMoney.text & ",8,'’—› „⁄Ê‰… ··ÿ»Ì» " & lblAccName.Caption & "',1"
'    ExecuteCommand conn, sql, cancel
'    If cancel Then
'1:
'    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« "
'       Exit Sub
'    End If
'    conn.Close
'    Unload Me
'End Sub
'
'
'Private Sub Form_Load()
'
'    ' Memorizing the current value of ActiveDatabaseName
'    currentDatabaseName = ActiveDatabaseName
'
'    OpenConnection conn
'    dtDate.Value = Day(Date) & "/" & Month(Date) & "/" & year(Date)
'End Sub
'
'Private Sub txtAccName_KeyUp(KeyCode As Integer, Shift As Integer)
'    If KeyCode = 116 Then
'        pForm = "Tawar2Help"
''        txtAccName.text = ""
'        Acc_LookUpAccount.Show 1
'    End If
'End Sub
'
'Private Sub txtAccName_Validate(cancel As Boolean)
'    If txtAccName.text = "" Then
'        Exit Sub
'    End If
'    Dim c As Boolean
'    Set rs = ExecuteSelect(conn, "select num, acc, name, type, parent from acc_Fari" & Acc_DBYear & " where acc='" & txtAccName.text & "' and acc like '270%' and acc!='270'", c)
'    If c Then
'        MsgBox "ÕœÀ Œÿ√ ›Ì ﬁ«⁄œ… «·„⁄ÿÌ« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
'        Exit Sub
'    End If
'    If rs.RecordCount <> 1 Then
'        'MsgBox "·« ÌÊÃœ Õ”«» »Â–« «·—ﬁ„"
'        pForm = "Tawar2Help"
'        txtAccName.text = ""
'        txtNum.text = ""
'        lblAccName.Caption = ""
'        Acc_LookUpAccount.Show 1
'        Exit Sub
'    End If
'    txtAccName.text = rs!acc
'    txtNum.text = rs!Num
'    lblAccName.Caption = rs!Name
'    'acc = rs!acc
'    rs.Close
'End Sub
'
