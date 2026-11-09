VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmInheritance 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ÃœÊ·  Ê“Ì⁄ «” Õﬁ«ﬁ «·Ê—À…"
   ClientHeight    =   8835
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10875
   Icon            =   "frmInheritance.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8835
   ScaleWidth      =   10875
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·Ê—À…"
      Height          =   5370
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   ";repeat=true;"
      Top             =   3360
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
         TabIndex        =   3
         Top             =   240
         Width           =   10395
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4320
         Left            =   135
         TabIndex        =   20
         Tag             =   $"frmInheritance.frx":1CFA
         Top             =   495
         Width           =   10410
         _cx             =   18362
         _cy             =   7620
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
         Cols            =   8
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmInheritance.frx":1DE1
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
      Begin VB.Label lblCount 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FF80FF&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9120
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   4920
         Width           =   420
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         Caption         =   "⁄œœ «·Ê—À…"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   9585
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   ";AlwaysEnables=true;"
         Top             =   4920
         Width           =   975
      End
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ÃœÊ·  Ê“Ì⁄ «” Õﬁ«ﬁ «·Ê—À…"
      Height          =   3195
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   90
      Width           =   10665
      Begin VB.TextBox txtArrow 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         DataField       =   "Total"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   420
         Left            =   510
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   2700
         Width           =   3180
      End
      Begin VB.TextBox txtTotal 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         DataField       =   "Total"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   375
         Left            =   6090
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   2700
         Width           =   3000
      End
      Begin VB.TextBox txtDivision_Type 
         Alignment       =   1  'Right Justify
         DataField       =   "Division_Type"
         Height          =   375
         Left            =   510
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";search=true;"
         Top             =   1140
         Width           =   3180
      End
      Begin VB.TextBox txtAmount 
         Alignment       =   1  'Right Justify
         DataField       =   "Amount"
         Height          =   375
         Left            =   6090
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";check=required;"
         Top             =   1140
         Width           =   3000
      End
      Begin VB.TextBox txtPayOrder_No 
         Alignment       =   1  'Right Justify
         DataField       =   "PayOrder_No"
         Height          =   375
         Left            =   6090
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";check=required;"
         Top             =   2160
         Width           =   3000
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
      Begin VB.TextBox txtDoctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         Height          =   375
         Left            =   6540
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;check=integer>0;check=required;check=custom;"
         Top             =   600
         Width           =   2550
      End
      Begin VB.TextBox txtDoctor_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_Name"
         Height          =   375
         Left            =   510
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";check=required;search=true;"
         Top             =   615
         Width           =   3180
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
         TabIndex        =   1
         Top             =   240
         Width           =   10395
      End
      Begin MSComCtl2.DTPicker dtTo 
         DataField       =   "Die_Date"
         Height          =   375
         Left            =   6120
         TabIndex        =   22
         Top             =   1680
         Width           =   2955
         _ExtentX        =   5212
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         DataField       =   "PayOrder_Date"
         Height          =   375
         Left            =   510
         TabIndex        =   23
         Top             =   2160
         Width           =   3180
         _ExtentX        =   5609
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40139
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·Ê›«…"
         Height          =   195
         Left            =   9345
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   1800
         Width           =   840
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Õ’… «·”Â„ «·Ê«Õœ"
         Height          =   195
         Left            =   4065
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";search=true;"
         Top             =   2790
         Width           =   1290
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·√”Â„"
         Height          =   195
         Left            =   9240
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";search=true;"
         Top             =   2790
         Width           =   1005
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ÿ—Ìﬁ… «· Ê“Ì⁄"
         Height          =   195
         Left            =   4245
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";search=true;"
         Top             =   1230
         Width           =   930
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„»·€"
         Height          =   195
         Left            =   9240
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";search=true;"
         Top             =   1215
         Width           =   1005
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ √„— «·’—›"
         Height          =   195
         Left            =   9240
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";search=true;"
         Top             =   2235
         Width           =   1005
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ √„— «·’—›"
         Height          =   195
         Left            =   4065
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   2235
         Width           =   1290
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·ÿ»Ì»"
         Height          =   195
         Left            =   4065
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   720
         Width           =   1290
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì» "
         Height          =   195
         Left            =   9240
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   720
         Width           =   1005
      End
   End
End
Attribute VB_Name = "frmInheritance"
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
Dim Amount As Long
Sub SetInharitorsCount()
    If details.state = ST_SEARCH Then
        lblCount.Caption = fg.Rows - 2
    Else
        lblCount.Caption = fg.Rows - 1
    End If
End Sub


Sub Divide_Inharitance()


    If details.rs.RecordCount = 0 Then Exit Sub


    Dim sql As String
    Dim cancel As Boolean
    Dim i As Integer
    Dim IntAmount As Double
    
    If details.rs.RecordCount = 0 Then
        fg.Clear , flexClearData
    End If
    
    
    sql = "DECLARE @inharitance_id numeric(18,0)" & vbTab & _
          "Set @inharitance_id =" & master.rs!InharitanceID & vbTab & _
          "EXEC sp_divide_inharitance @inharitance_id"
    ExecuteCommand Conn, sql, cancel
    
    details.rs.Requery
     
     txtTotal.text = 0
     
     IntAmount = 0
     
'     For i = 1 To fg.Rows - 2
'            IntAmount = IntAmount + Fix(val(fg.Cell(flexcpText, i, Amount_)))
'            fg.Cell(flexcpText, i, Amount_) = Int(val(fg.Cell(flexcpText, i, Amount_)))
'     Next i
'
'
'     For i = 1 To fg.Rows - 1
'            txtTotal.text = val(txtTotal.text) + val(fg.Cell(flexcpText, i, Arrow_))
'     Next i
'
'
'     If fg.Rows > 2 Then
'        fg.Cell(flexcpText, fg.Rows - 1, Amount_) = val(txtAmount.text) - IntAmount
'     Else
'        fg.Cell(flexcpText, fg.Rows - 1, Amount_) = val(txtAmount.text)
'     End If
'



'If diff > 0 Then _
'        fg.Cell(flexcpText, fg.Rows - 1, Amount_) = val(fg.Cell(flexcpText, fg.Rows - 1, Amount_)) + 1
     
End Sub


Sub Select_Doctor(Optional ForceSelectDoctor As Boolean = True)
    
    If master.state <> ST_ADDNEW And master.state <> ST_UPDATE And master.state <> ST_SEARCH And ForceSelectDoctor Then
        MsgBox " ·«Ì„ﬂ‰ ⁄—÷ ﬁ«∆„… «·√ÿ»«¡ ﬁ»· «·÷€ÿ ⁄·Ï “— ÃœÌœ √Ê  ⁄œÌ· √Ê »ÕÀ"
        Exit Sub
    End If
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    
    Doctor_checked = False
    
    ActiveDatabaseName = "Defualt"
    
    sql = "select dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as  Name ,Doctor_ID as ID from Doctor_CV" & _
          " where  Doctor_id = " & val(txtDoctor_ID.text) & _
          " Order by Doctor_ID"
          
   Set rs = ExecuteSelect(Conn, sql, c)
   
   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Doctor_checked = False
        Exit Sub
   End If
   
   If rs.RecordCount <> 1 Then
       rs.Close
          
          sql = "select dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as  Name ,Doctor_ID as ID " & _
                "from Doctor_CV  " & _
                " order by 2"
          
                
          Set rs = ExecuteSelect(Conn, sql, c)
          
          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Doctor_checked = False
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
                GLOBAL_TAG = "datafield=,0:id,1:Name,;"
                GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Doctor_ID,1:Set_Doctor_Name,;"
                GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
                btnSettings = GetBtnSettings
                Clin_List.fg.Cols = 2
                Clin_List.fg.ColWidth(0) = 1000
                Clin_List.fg.ColWidth(1) = 2000
                Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                Clin_List.fg.Cell(flexcpText, 0, 0) = "«·—ﬁ„ «·–« Ì"
                Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·ÿ»Ì»"
                Set Clin_List.CallerForm = Me
                Clin_List.Show 1
                RefreshCommands btnSettings And FormSettings
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
    
   ActiveDatabaseName = "tadamonfari"
    
End Sub

Sub Set_Doctor_ID(Value As Long)
    txtDoctor_ID.text = Value
    Doctor_checked = True
    ActiveDatabaseName = "tadamonfari"
End Sub

Sub Set_Doctor_Name(Value As String)
    txtDoctor_Name.text = Value
End Sub

Private Sub cmdSelectDoctor_Click()
    txtDoctor_ID_Validate False
End Sub

Private Sub detailFrame_Click()
     btnSettings = GetBtnSettings
    Set ActiveFrame = detailFrame
    SelectFrame Me, detailFrame
    RefreshCommands btnDetailSettings And FormDetailSettings
End Sub

Private Sub Details_doAddNew(rs As ADODB.Recordset)
    fg.Cell(flexcpText, fg.Row, Arrow_) = 0
    fg.Cell(flexcpText, fg.Row, Amount_) = 0
    fg.Cell(flexcpBackColor, fg.Row, Amount_) = &H4080&
    fg.Cell(flexcpForeColor, fg.Row, Amount_) = &HFFFF&
End Sub

Private Sub details_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    If master.rs.RecordCount = 0 Then
        MsgBox "·« Ì„ﬂ‰ﬂ ≈÷«›… Ê—À… œÊ‰ ≈œŒ«· »Ì«‰«  «·ﬁ”„ «·⁄·ÊÌ ›Ì «·‘«‘… ÊÕ›ŸÂ«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
    End If
End Sub

Private Sub Details_doDeleteCompleted(rs As ADODB.Recordset)
    Divide_Inharitance
    SetInharitorsCount
End Sub

Private Sub Details_doMoveComplete(rs As ADODB.Recordset)
    
    Dim i As Integer
    
    txtTotal.text = 0
    
    For i = 1 To fg.Rows - 1
          txtTotal.text = val(txtTotal.text) + val(fg.Cell(flexcpText, i, Arrow_))
    Next i
    
End Sub

Private Sub Details_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!Inharitance_ID = master.rs!InharitanceID
End Sub

Private Sub Details_doSaveComplete(rs As ADODB.Recordset)
    Divide_Inharitance
    If details.SaveAfterWhat = ST_ADDNEW Then
        SetInharitorsCount
    End If
End Sub


Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
'    Dim i As Integer
'    txtTotal.text = 0
'    Select Case Col
'    Case Arrow_
'        For i = 1 To fg.Rows - 1
'            txtTotal.text = val(txtTotal.text) + val(fg.Cell(flexcpText, i, Arrow_))
'        Next i
'        fg.Cell(flexcpText, Row, Amount_) = val(fg.Cell(flexcpText, Row, Arrow_)) * val(txtArrow.text)
'    End Select
    
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Col = Amount_ Then cancel = True
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "tadamonfari"
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
    FormSettings = btall
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
     ActiveDatabaseName = "tadamonfari"
    Set master.rs = ExecuteSelect(Conn, "Select * from vInharitance Order by 1", cancel)
    InitFrame
     
    If master.rs.RecordCount = 0 Then
        detailFrame.visible = False
    Else
        detailFrame.visible = True
    End If
    
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
    txtDoctor_ID.SetFocus
    txtArrow.text = 0
    txtTotal.text = 0
    detailFrame.visible = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    If master.rs.RecordCount = 0 Then
        Set details.rs = ExecuteSelect(Conn, "select * from inharitors where 1=0", cancel)
        Exit Sub
    End If
    If master.rs.RecordCount > 0 Then detailFrame.visible = True
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim step As Integer

    Dim c As Boolean
    Dim sql As String
    
    step = 0

    ExecuteCommand Conn, "Delete from Inharitance where InharitanceID = " & rs!InharitanceID, c
    
    Set master.rs = Nothing
    
    sql = "Select * from vInharitance Order by 1 "
        
    Set master.rs = ExecuteSelect(Conn, sql, c)
    
    If Not master.rs.EOF Then
        master.MoveFirst
    Else
        txtDoctor_ID.text = ""
        txtDivision_Type.text = ""
        txtDoctor_Name.text = ""
        txtPayOrder_No.text = ""
        txtAmount.text = ""
    End If
    cancel = True
    
    fg.Clear , flexClearData
    
    detailFrame.visible = False
    
    Exit Sub
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "select * from inharitors where inharitance_id =" & master.rs!InharitanceID & " order by 1"
    
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not details.rs.EOF Then
        details.rs.MoveFirst
    End If
    
    SetInharitorsCount
    
    If fg.Rows > 1 Then
        fg.Cell(flexcpBackColor, 1, Amount_, fg.Rows - 1, Amount_) = &H4080&
        fg.Cell(flexcpForeColor, 1, Amount_, fg.Rows - 1, Amount_) = &HFFFF&
    End If
    
    Dim i As Integer
    
    txtTotal.text = 0
    
    For i = 1 To fg.Rows - 1
        txtTotal.text = val(txtTotal.text) + val(fg.Cell(flexcpText, i, Arrow_))
    Next i
    
    Amount = val(txtAmount.text)
    Select_Doctor False
    txtDoctor_Name.SetFocus
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    On Error GoTo 20
    If details.rs.RecordCount = 0 Then Exit Sub
    With DrInharitors
        Get_DataReport_Label_byName(DrInharitors, 1, "lblMethod").Caption = txtDivision_Type
        Get_DataReport_Label_byName(DrInharitors, 1, "lblStateName").Caption = Current_State.FullName
        Get_DataReport_Label_byName(DrInharitors, 1, "lblDoctor_Name").Caption = txtDoctor_Name.text
        Get_DataReport_Label_byName(DrInharitors, 1, "lblDoctor_ID").Caption = master.rs!Doctor_ID
        Get_DataReport_Label_byName(DrInharitors, 1, "lblAmount").Caption = master.rs!Amount
        Get_DataReport_Label_byName(DrInharitors, 1, "lblDie_Date").Caption = master.rs!Die_Date
        Get_DataReport_Label_byName(DrInharitors, 1, "lblPayOrder_No").Caption = master.rs!PayOrder_No
        Get_DataReport_Label_byName(DrInharitors, 1, "lblPayOrder_Date").Caption = master.rs!PayOrder_Date
        Set .DataSource = details.rs
        .Show 1
    End With
    master_doMoveComplete rs
    Exit Sub
20:
End Sub
Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    
    
    If master.rs.RecordCount = 0 Then
        Set details.rs = ExecuteSelect(Conn, "select * from inharitors where 1=0", cancel)
        Exit Sub
    End If
    detailFrame.visible = True
    
    
    
    sql = "select * from inharitors where inharitance_id =" & master.rs!InharitanceID & " order by 1"
    
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not details.rs.EOF Then
        details.rs.MoveFirst
    End If
    
    If val(txtAmount.text) <> Amount Then
        Divide_Inharitance
    End If
    
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If ctrl = txtDoctor_ID.text Then
        Select_Doctor
        If Not Doctor_checked Then
            checkType = True
            msg = "Â–« «·Õﬁ· ÌÕÊÌ ﬁÌ„… €Ì— „ﬁ»Ê·…"
        End If
    End If
End Sub

Private Sub masterFrame_Click()
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub txtAmount_Change()
    If val(txtTotal.text) <> 0 Then _
        txtArrow.text = Round(val(txtAmount.text) / val(txtTotal.text), 2)
End Sub

Private Sub txtAmount_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtDoctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Doctor_checked = False
        txtDoctor_ID_Validate False
    Else
        KeyAscii = Prevent_char(KeyAscii)
    End If
End Sub

Private Sub txtDoctor_ID_Validate(cancel As Boolean)
   ' If Not Doctor_checked Then
     Select_Doctor
    'End If
    cancel = Not Doctor_checked
    ActiveDatabaseName = "tadamonfari"
End Sub

Private Sub txtTotal_Change()
    If val(txtTotal.text) <> 0 Then _
        txtArrow.text = Round(val(txtAmount.text) / val(txtTotal.text), 2)
End Sub
