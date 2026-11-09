VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmPaymentOrders_Report 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ﬁ—Ì— √Ê«„— «·ﬁ»÷"
   ClientHeight    =   8820
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9780
   Icon            =   "frmPaymentOrders_Report.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8820
   ScaleWidth      =   9780
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ﬁ—Ì— √Ê«„— «·ﬁ»÷"
      Height          =   8670
      Left            =   15
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;NoBlankSearchAlert=true;"
      Top             =   30
      Width           =   9720
      Begin VB.ComboBox cmbCurrent_Status 
         Height          =   315
         ItemData        =   "frmPaymentOrders_Report.frx":1CFA
         Left            =   5400
         List            =   "frmPaymentOrders_Report.frx":1CFC
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Top             =   1680
         Visible         =   0   'False
         Width           =   1815
      End
      Begin VB.CommandButton cmdTarhil 
         Caption         =   " —ÕÌ· «·ﬂ·"
         Height          =   330
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   2220
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.CommandButton cmdView 
         Caption         =   "„⁄«Ì‰…"
         Height          =   330
         Left            =   8355
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   2220
         Width           =   1170
      End
      Begin VB.ComboBox cmbMoving_Status 
         Height          =   315
         ItemData        =   "frmPaymentOrders_Report.frx":1CFE
         Left            =   1575
         List            =   "frmPaymentOrders_Report.frx":1D0E
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   1125
         Width           =   1815
      End
      Begin VB.ComboBox cmbOrder_Type 
         Height          =   315
         ItemData        =   "frmPaymentOrders_Report.frx":1D30
         Left            =   5400
         List            =   "frmPaymentOrders_Report.frx":1D40
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   1125
         Width           =   1815
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
         Width           =   9405
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5490
         Left            =   165
         TabIndex        =   8
         Tag             =   ";typeof=vsflexgrid;datafield=,0:IsalId,1:id,2:payer,3:OnDate,4:description,5:total,6:TasdeedState,7:Moving_Status,;"
         Top             =   2685
         Width           =   9390
         _cx             =   16563
         _cy             =   9684
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman (Arabic)"
            Size            =   11.25
            Charset         =   178
            Weight          =   700
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
         FormatString    =   $"frmPaymentOrders_Report.frx":1D60
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
      Begin MSComCtl2.DTPicker dtFrom 
         Height          =   315
         Left            =   5400
         TabIndex        =   15
         Top             =   585
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtTo 
         Height          =   315
         Left            =   1575
         TabIndex        =   16
         Top             =   585
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   62783491
         CurrentDate     =   40139
      End
      Begin VB.Label lblCurrent_Status 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Ê÷⁄ «·—«Â‰"
         Height          =   240
         Left            =   7290
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   1755
         Visible         =   0   'False
         Width           =   915
      End
      Begin VB.Label lblRecordCount 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Left            =   7260
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   8295
         Width           =   1335
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·√Ê«„—"
         Height          =   255
         Left            =   8700
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   8295
         Width           =   855
      End
      Begin VB.Label lblTotal 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Left            =   3900
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   8295
         Width           =   1335
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈Ã„«·Ì «·„»«·€"
         Height          =   255
         Left            =   5340
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   8295
         Width           =   975
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "‰Ê⁄ «·√„—"
         Height          =   240
         Left            =   7290
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1200
         Width           =   915
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "Ê÷⁄ «· —ÕÌ·"
         Height          =   240
         Left            =   3495
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1185
         Width           =   915
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‰  «—ÌŒ"
         Height          =   240
         Left            =   7380
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   615
         Width           =   690
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   240
         Left            =   3585
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   622
         Width           =   690
      End
   End
End
Attribute VB_Name = "frmPaymentOrders_Report"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Dim oldScaleWidth As Long
Dim Old_Result As Boolean
Sub Get_Totals()
    Dim i As Integer
    lblTotal.Caption = 0
     If master.state = ST_SEARCH Then
        For i = 2 To fg.Rows - 1
            lblTotal.Caption = val(lblTotal.Caption) + val(fg.Cell(flexcpText, i, 5))
        Next i
    Else
        For i = 1 To fg.Rows - 1
            lblTotal.Caption = val(lblTotal.Caption) + val(fg.Cell(flexcpText, i, 5))
        Next i
    End If
    lblRecordCount.Caption = master.rs.RecordCount
End Sub


Private Sub cmbMoving_Status_Click()
     Old_Result = True
End Sub

Private Sub cmbOrder_Type_Click()
    Old_Result = True
    lblCurrent_Status.visible = cmbOrder_Type.ListIndex = 1 ' ”œÌœ
    cmbCurrent_Status.visible = cmbOrder_Type.ListIndex = 1
End Sub

Private Sub cmdTarhil_Click()
    Dim i As Integer
    Dim c As Boolean
    Dim sql As String

    
    If Not (cmbMoving_Status.ListIndex = 1 And cmbOrder_Type.ListIndex = 1) Then
        MsgBox "·« Ì„ﬂ‰ﬂ  —ÕÌ· „Ã„Ê⁄… „‰ ”‰œ«  «·≈Ì’«· œ›⁄… Ê«Õœ… ≈·« ≈–« ﬂ«‰ ‰Ê⁄ «·≈Ì’«·«  :  ”œÌœ ÊÊ÷⁄ «· —ÕÌ· : €Ì— „—«Ã⁄", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
        cmdTarhil.visible = False
        Exit Sub
    End If
    
    If fg.Rows = 1 Then Exit Sub
    On Error GoTo errHandler
    
    MousePointer = vbHourglass
    
    
    For i = 1 To fg.Rows - 1
        sql = "set dateformat dmy exec sp_PaymentIsalMigration " & val(fg.Cell(flexcpText, i, 0)) & _
                ", '" & fg.Cell(flexcpText, i, 2)
        sql = sql & "', '" & format(fg.Cell(flexcpText, i, 3, "dd/mm/yyyy")) & "', '" & fg.Cell(flexcpText, i, 4)
        sql = sql & "', " & val(fg.Cell(flexcpText, i, 5)) & ",1 "
        sql = sql & ", NULL, " & fg.Cell(flexcpText, i, 6)
        ExecuteCommand Conn, sql, c
        If c Then
            Exit For
        End If
    Next i
    MsgBox " „  ⁄„·Ì… «· —ÕÌ· »‰Ã«Õ", vbInformation + vbOKOnly, ""
    
    MousePointer = vbDefault
    
    Unload Me
    
    
    Exit Sub
    
errHandler:
    MsgBox "Õ’· Œÿ√ √∆‰«¡ ⁄„·Ì… «· —ÕÌ· ° ”Ê› Ì „ «· —«Ã⁄ ⁄‰ ⁄„·Ì… «· —ÕÌ· ﬂ«„·…. «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ", vbCritical + vbOKOnly, "Œÿ√"
    Debug.Print Err.description
End Sub

Private Sub cmdView_Click()

    Old_Result = False
    Dim sql As String
    Dim cancel As Boolean
    On Error GoTo 20
    
      If cmbOrder_Type.ListIndex = 1 And cmbCurrent_Status.ListIndex <> 0 Then ' ”œÌœ
        sql = " Set DateFormat DMY  " & vbLf & _
              " Select po.id as IsalId, id,payer,po.ondate,description,total,po.TasdeedState, " & vbLf & _
              " Moving_Status,Order_Type from vPaymentOrder po,NewDocDb.dbo.DoctorTasdeed dt,NewDocDb.dbo.Doctor_cv dc " & vbLf & _
              " Where dt.isal = po.id and dc.doctor_id = dt.doctor_id and dc.current_Status_id = " & vbLf & _
                cmbCurrent_Status.ItemData(cmbCurrent_Status.ListIndex) & vbLf & _
              " and po.OnDate Between  '" & dtFrom.Value & "'" & vbLf & _
              " and '" & dtTo.Value & "' "
    Else
        sql = "Set DateFormat DMY  Select id as IsalId, id,payer,ondate,description,total,TasdeedState,Moving_Status,Order_Type from vPaymentOrder Where OnDate Between  '" & dtFrom.Value & _
            "' and '" & dtTo.Value & "' "
    End If
            
    If cmbMoving_Status.ItemData(cmbMoving_Status.ListIndex) <> 0 Then
        sql = sql & " And Moving_Status ='" & Trim(cmbMoving_Status.text) & "' "
    End If
    
    If cmbOrder_Type.ItemData(cmbOrder_Type.ListIndex) <> 0 Then
        sql = sql & " And Order_Type ='" & Trim(cmbOrder_Type.text) & "' "
    End If
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    If master.rs.RecordCount = 0 Then
        MsgBox "·« ÌÊÃœ ”Ã·«  „Ê«›ﬁ… ··‘—Êÿ «· Ì ﬁ„  » ÕœÌœÂ«", vbInformation + vbOKOnly, "⁄œœ «·”Ã·«  = 0"
        lblTotal.Caption = 0
        lblRecordCount.Caption = 0
        Exit Sub
    End If
    
    If Not master.rs.EOF Then
        master.MoveLast
    End If
    
    
    master.BeginSearch
    master.Search
    
    Get_Totals
    
    cmdTarhil.visible = cmbMoving_Status.ListIndex = 1 And cmbOrder_Type.ListIndex = 1
    Exit Sub
20:
    MsgBox Err.description, vbCritical + vbOKOnly, Err.Number
End Sub

Private Sub dtFrom_Change()
    Old_Result = True
End Sub

Private Sub dtTo_Change()
    Old_Result = True
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state <> ST_SEARCH Then
        cancel = True
    ElseIf Row <> 1 Then
        cancel = True
    End If
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
     ActiveDatabaseName = "Fari"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    
    Old_Result = True
    oldScaleWidth = 9900
    FormSettings = btall - btnew - btUpdate - btCancel - btsave - btDelete - btFirst - btNext - btPrev - btLast
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    'set master.rs = ExecuteSelect(Conn, "My SQL", Cancel)
    InitFrame
       
    dtFrom.Value = format("01/01/" & year(Date), "dd/mm/yyyy")
    dtTo.Value = format(Day(Date) & "/" & Month(Date) & "/" & year(Date), "dd/mm/yyyy")
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    cmbOrder_Type.ListIndex = 0
    cmbMoving_Status.ListIndex = 0
    fillCmb cmbCurrent_Status, "Select Status_id as id,Status_Name as name from newdocdb.dbo.fixStatus order by 1"
    cmbCurrent_Status.AddItem "«·ﬂ·", 0
    cmbCurrent_Status.ItemData(cmbCurrent_Status.NewIndex) = 0
    cmbCurrent_Status.ListIndex = 0
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

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    'Get_Totals  'Being uncommented will cause a dublicate count in the summary box
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If rs Is Nothing Then
        MsgBox "·« Ì„ﬂ‰ﬂ ÿ»«⁄… Â–Â «·‘«‘… ≈–« ﬂ«‰ ⁄œœ «·”Ã·«  «·Ÿ«Â—… = 0", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    If Old_Result Then
        cmdView_Click
    End If
    Get_DataReport_Label_byName(DrPaymentOrders, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrPaymentOrders, 1, "lblMoving_Status").Caption = cmbMoving_Status.text
    Get_DataReport_Label_byName(DrPaymentOrders, 1, "lblOrder_Type").Caption = cmbOrder_Type.text
    Get_DataReport_Label_byName(DrPaymentOrders, 1, "lblfrom").Caption = dtFrom.Value
    Get_DataReport_Label_byName(DrPaymentOrders, 1, "lblto").Caption = dtTo.Value
    Set DrPaymentOrders.DataSource = master.rs
    DrPaymentOrders.Show 1
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Get_Totals
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
