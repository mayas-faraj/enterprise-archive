VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Pic_CommTreats 
   BackColor       =   &H00E1FEFF&
   Caption         =   "« ›«ﬁÌ… ‘—Êÿ «·⁄·«Ã"
   ClientHeight    =   9330
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9510
   Icon            =   "Pic_CommTreats.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   9330
   ScaleWidth      =   9510
   Begin VB.Frame detailToothFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·√”‰«‰"
      Height          =   6960
      Left            =   5220
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Tag             =   ";repeat=true;"
      Top             =   2340
      Width           =   1815
      Begin VB.CheckBox chkdetailToothFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   240
         Width           =   1575
      End
      Begin VSFlex7Ctl.VSFlexGrid fga 
         Height          =   6255
         Left            =   120
         TabIndex        =   7
         Tag             =   ";typeof=vsflexgrid;datafield=,0:num,1:tmp,2:id,;"
         Top             =   600
         Width           =   1575
         _cx             =   2778
         _cy             =   11033
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
         TreeColor       =   8388608
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   3
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   10
         Cols            =   3
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   300
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Pic_CommTreats.frx":1CFA
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   2
         AutoSearchDelay =   5
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
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„⁄«·Ã« "
      Height          =   6960
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   ";repeat=true;"
      Top             =   2310
      Width           =   5055
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   240
         Width           =   4815
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6255
         Left            =   120
         TabIndex        =   3
         Tag             =   ";typeof=vsflexgrid;datafield=,0:name,1:available,;"
         Top             =   600
         Width           =   4815
         _cx             =   8493
         _cy             =   11033
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
         TreeColor       =   8388608
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   3
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   10
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   300
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Pic_CommTreats.frx":1D57
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   -1  'True
         AutoSizeMode    =   0
         AutoSearch      =   2
         AutoSearchDelay =   5
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
      Caption         =   "«·‘—ﬂ…"
      Height          =   2265
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   75
      Width           =   6975
      Begin VB.CheckBox chkTajreef 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "› Õ Ê Ã—Ì› ·À… ›Ì «·›ﬂÌ‰"
         Height          =   255
         Left            =   4590
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Top             =   2025
         Width           =   2145
      End
      Begin VB.CheckBox chkPic1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "’Ê—… ≈÷«›Ì… Ê«Õœ…"
         Height          =   255
         Left            =   5040
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Top             =   1710
         Width           =   1695
      End
      Begin VB.CheckBox chkPic2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "’Ê—… »«‰Ê—«„Ì…"
         Height          =   255
         Left            =   5355
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   1440
         Width           =   1380
      End
      Begin VB.CheckBox chkZroa 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "ﬁÿ⁄ –—Ê…"
         Height          =   255
         Left            =   2205
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Top             =   1980
         Width           =   975
      End
      Begin VB.CheckBox chkTawaj 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " Ê«Ã —ÕÏ À«·À…"
         Height          =   255
         Left            =   3150
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   1980
         Width           =   1425
      End
      Begin VB.CheckBox chkTaklih 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ﬁ·ÌÕ"
         Height          =   255
         Left            =   2430
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   1710
         Width           =   735
      End
      Begin VB.CheckBox chkClean 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   " ‰ŸÌ›"
         Height          =   255
         Left            =   2430
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   1440
         Width           =   735
      End
      Begin VB.CheckBox chkLothaAdv 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "·À… „ ﬁœ„…"
         Height          =   255
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   1710
         Width           =   975
      End
      Begin VB.CheckBox chkLothaSimple 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "·À… »”Ìÿ…"
         Height          =   255
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   1395
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Alignment       =   1  'Right Justify
         DataField       =   "PWife"
         Height          =   375
         Left            =   840
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   "check=required;check=custom;"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox Text2 
         Alignment       =   1  'Right Justify
         DataField       =   "PChild"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   "check=required;check=custom;"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         DataField       =   "PSelf"
         Height          =   375
         Left            =   1560
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   "check=required;check=custom;"
         Top             =   1320
         Width           =   735
      End
      Begin VB.ComboBox comboPricaCat 
         DataField       =   "PriceCat"
         Height          =   315
         Left            =   4440
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   960
         Width           =   1575
      End
      Begin VB.TextBox txtOrganization_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_ID"
         Enabled         =   0   'False
         Height          =   375
         Left            =   4440
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   1575
      End
      Begin VB.TextBox txtOrganization_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Organization_Name"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;"
         Top             =   480
         Width           =   3375
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
         Width           =   6735
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‘Œ’Ì"
         Height          =   195
         Left            =   1680
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   525
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·“ÊÃ…"
         Height          =   195
         Left            =   1050
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   435
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·√Ê·«œ"
         Height          =   195
         Left            =   375
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   390
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·‰”»… «·„∆ÊÌ… ·ﬁÌ„… «·„⁄«·Ã…"
         Height          =   195
         Left            =   2370
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   1875
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·√”⁄«—"
         Height          =   195
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";search=true;"
         Top             =   960
         Width           =   525
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·‘—ﬂ…"
         Height          =   195
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";search=true;"
         Top             =   570
         Width           =   765
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·‘—ﬂ…"
         Height          =   195
         Left            =   3480
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";search=true;"
         Top             =   570
         Width           =   900
      End
   End
End
Attribute VB_Name = "Pic_CommTreats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public WithEvents detail As Controller
Attribute detail.VB_VarHelpID = -1
Public WithEvents teethController As Controller
Attribute teethController.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Public FormFraSettings As Long
Public btnFraSettings As Long
Dim oldScaleWidth As Long
Dim UpdateGrid As Boolean
Dim NoUpdateIlaj As Boolean


Private Sub chkClean_Click()
    If chkClean.Value Then
        UpdateMasterTable 1, 183
    Else
        UpdateMasterTable 0, 183
    End If
End Sub

Private Sub chkLothaAdv_Click()
    If chkLothaAdv.Value Then
        UpdateMasterTable 1, 184
    Else
        UpdateMasterTable 0, 184
    End If
End Sub

Private Sub chkLothaSimple_Click()
    If chkLothaSimple.Value Then
        UpdateMasterTable 1, 185
    Else
        UpdateMasterTable 0, 185
    End If
End Sub
Private Sub UpdateMasterTable(val As Integer, treatId As Long)
        Dim cancel As Boolean
        If NoUpdateIlaj Then Exit Sub
        ExecuteCommand Conn, "Update Pic_CommTeethTreat set available=" & val & "  where Organization_ID=" & master.rs!Organization_Id & " and treatid=" & treatId, cancel
End Sub

Private Sub chkPic1_Click()
    If chkPic1.Value Then
        UpdateMasterTable 1, 218
    Else
        UpdateMasterTable 0, 218
    End If
End Sub

Private Sub chkPic2_Click()
    If chkPic2.Value Then
        UpdateMasterTable 1, 219
    Else
        UpdateMasterTable 0, 219
    End If
End Sub

Private Sub chkTajreef_Click()
    If chkTajreef.Value Then
        UpdateMasterTable 1, 261
    Else
        UpdateMasterTable 0, 261
    End If
End Sub

Private Sub chkTaklih_Click()
    If chkTaklih.Value Then
        UpdateMasterTable 1, 182
    Else
        UpdateMasterTable 0, 182
    End If
End Sub

Private Sub chkTawaj_Click()
    If chkTawaj.Value Then
        UpdateMasterTable 1, 262
    Else
        UpdateMasterTable 0, 262
    End If
End Sub

Private Sub chkZroa_Click()
    If chkZroa.Value Then
        UpdateMasterTable 1, 220
    Else
        UpdateMasterTable 0, 220
    End If
End Sub

Private Sub detail_doBeforeMoveComplete(rs As ADODB.Recordset, cancel As Boolean)
    fg.Rows = 1
    FillGrid fg, rs, 1, 0
    cancel = True
    detail.state = detail.state - ST_FILLGRID
End Sub

Private Sub detail_doSave(rs As ADODB.Recordset, cancel As Boolean)
    
    If rs!available = 2 Then
            cancel = True
            Dim val As String
            val = fg.Cell(flexcpText, fg.Row, 1)
            rs.CancelUpdate
            detail.state = 0
            If val = 2 Then Exit Sub
            Dim Level As Integer
            Level = CInt(fg.Cell(flexcpText, fg.Row, 2)) + 1
            Dim Row As Integer
            Row = fg.Row + 1
            If Row = fg.Rows Then Exit Sub
            Do While fg.Cell(flexcpText, Row, 2) >= Level
                fg.Row = Row
                fg.Cell(flexcpText, Row, 1) = val
                Row = Row + 1
                If Row = fg.Rows Then Exit Sub
            Loop
    End If
End Sub

Private Sub detailFrame_Click()
   If ActiveFrame = detailFrame Then Exit Sub
    Select Case ActiveFrame
    Case detailToothFrame
        btnFraSettings = GetBtnSettings
    Case masterFrame
        btnSettings = GetBtnSettings
    End Select
    
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

Private Sub detailToothFrame_Click()
    If ActiveFrame = detailToothFrame Then Exit Sub
    Select Case ActiveFrame
    Case masterFrame
        btnSettings = GetBtnSettings
    Case detailFrame
        btnDetailSettings = GetBtnSettings
    End Select
    
    SelectFrame Me, detailToothFrame
    Set ActiveFrame = detailToothFrame
    RefreshCommands FormFraSettings And btnFraSettings
End Sub

Private Sub fg_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    If OldRow * NewRow = 0 Then Exit Sub
        detail.Update
End Sub

Private Sub fga_AfterRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long)
    If master.rs Is Nothing Then Exit Sub
    If OldRow <> NewRow Then
        Dim cancel As Boolean
        'MsgBox fga.Cell(flexcpText, NewRow, 2)
       ' Set detail.rs = ExecuteSelect(Conn, "select * from VPic_CommTeethTreat where Organization_ID=" & master.rs!Organization_Id & " and tooth=" & fga.Cell(flexcpText, NewRow, 2) & "  and id not between 181 and 193 order by num", cancel)
        Set detail.rs = ExecuteSelect(Conn, "select * from VPic_CommTeethTreat where Organization_ID=" & master.rs!Organization_Id & " and tooth=" & fga.Cell(flexcpText, NewRow, 2) & " order by num", cancel)
        If detail.rs.RecordCount = 0 Then
              fg.Rows = 1
         Else
              detail.rs.MoveFirst
         End If
    End If
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    Select Case ActiveFrame
    Case masterFrame
            RefreshCommands btnSettings And FormSettings
    Case detailFrame
            RefreshCommands btnDetailSettings And FormDetailSettings
    Case detailToothFrame
            RefreshCommands btnFraSettings And FormFraSettings
    End Select
End Sub

Private Sub Form_Deactivate()
    Select Case ActiveFrame
    Case masterFrame
            btnSettings = GetBtnSettings
    Case detailFrame
            btnDetailSettings = GetBtnSettings
    Case detailToothFrame
            btnFraSettings = GetBtnSettings
    End Select
End Sub

Private Sub Form_Load()
    oldScaleWidth = 7320 'Me.Width
    FormSettings = btall - btPrint - btnew - btDelete
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec - btnew - btDelete
    FormDetailSettings = 0
    btnDetailSettings = btall - btCancel - btSearchCancel - btSearchExec - btnew - btDelete - btUpdate - btsave
    FormFraSettings = 0
    btnFraSettings = 0
    FormatForm Me
    Set master = New Controller
    Set detail = New Controller
    Set teethController = New Controller
    
    Set master.Form = Me
    Set detail.Form = Me
    Set teethController.Form = Me
    
    Set master.frame = masterFrame
    Set detail.frame = detailFrame
    Set teethController.frame = detailToothFrame
    
    controllers.Add master, masterFrame.name
    controllers.Add detail, detailFrame.name
    controllers.Add teethController, detailToothFrame.name
    
    Dim cancel As Boolean
    comboPricaCat.AddItem "Õœ √⁄·Ï"
    comboPricaCat.ItemData(0) = 0
    comboPricaCat.AddItem "Õœ √œ‰Ï"
    comboPricaCat.ItemData(1) = 1
    
    Set teethController.rs = ExecuteSelect(Conn, "select * from Pic_Teeth", cancel)
    teethController.rs.MoveFirst
    fga.Row = 1
    
    Set master.rs = ExecuteSelect(Conn, "select * from Organization", cancel)
    fga.ColComboList(1) = "|#0; œ«∆„|#1; ·»‰Ì"
    fg.ColComboList(1) = "|#0; ·«|#1; ‰⁄„|#2;  "
'    fga.ColComboList(1) = "|#0; »·«|#1; œ«∆‰|#2; „œÌ‰"
         
     'Set detail.rs = ExecuteSelect(Conn, "select * from vwPic_CompanyTreats where 1=0", cancel)
     Set detail.rs = ExecuteSelect(Conn, "select * from VPic_CommTeethTreat where 1=0", cancel)
    With fg
        ' layout
        .Rows = 1
        '.Cols = 10
        '.ColWidth(0) = 1000
        .FixedCols = 0
        '.ExtendLastCol = True
'        .TextMatrix(0, 0) = "Tag"
'        .TextMatrix(0, 1) = "Value"
        .ColAlignment(-1) = flexAlignRightTop
        .Editable = flexEDKbdMouse
                
        ' outline
        .OutlineCol = 0
        .OutlineBar = flexOutlineBarSimpleLeaf
        '.MergeCells = flexMergeOutline
        
        ' other
        '.AllowUserResizing = flexResizeColumns
        .AllowSelection = False
        '.GridLines = flexGridFlatVert
'         fg.ColComboList(TYPE_) = "|#0; »·«|#1; œ«∆‰|#2; „œÌ‰"
'         fg.ColComboList(DEST_) = "|#0;„Ì“«‰Ì… |#1; √—»«Õ ÊŒ”«∆—|#2;„ «Ã—…"
    End With
    
'    fg.Redraw = False
'    fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "" & vbTab & "1" & vbTab & ""
'    fg.IsSubtotal(fg.Rows - 1) = True
'    fg.RowOutlineLevel(fg.Rows - 1) = 1

'    FillGrid fg, master.rs, 2, 0
'    fg.Redraw = True
    Set ActiveFrame = masterFrame
End Sub

Private Sub Form_Resize()
    Dim Alpha As Double
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
        Exit Sub
    End If
    If MDIMain.WindowState = vbMinimized Then Exit Sub
    
    If Me.WindowState = vbMinimized Then Exit Sub
    
    If ScaleWidth = 0 Then
        Exit Sub
    End If
    Alpha = ScaleWidth / oldScaleWidth
'    masterFrame.Top = masterFrame.Top * Alpha
'    masterFrame.Left = masterFrame.Left * Alpha
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
    
    'resize grid
    ResizeGrid fg
'    Dim i As Integer
'    Dim W As Long
'    Dim totWidth As Long
'    totWidth = 0
'    For i = 0 To fg.Cols - 1
'        totWidth = totWidth + fg.ColWidth(i)
'    Next
'    For i = 0 To fg.Cols - 1
'        fg.ColWidth(i) = fg.Width * fg.ColWidth(i) / totWidth - 10
'    Next
End Sub

Private Sub Form_Unload(cancel As Integer)
    Dim msg As VbMsgBoxResult
    If master.state <> 0 Then
'        msg = MsgBox("Â·  —Ìœ «·Õ›Ÿ ﬁ»· «·Œ—ÊÃø", vbYesNo + vbQuestion, " √ﬂÌœ Õ›Ÿ ﬁÌ· «·Œ—ÊÃ")
'        If msg = vbYes Then
'            master.Save
'        Else
'            master.CancelSave
'        End If
        masterFrame_Click
        MsgBox "ÌÃ» ⁄·Ìﬂ «·÷€ÿ ⁄·Ï “— «·Õ›Ÿ √Ê “— «·≈·€«¡ ﬁ»· «·Œ—ÊÃ „‰ «·‘«‘…", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        cancel = True
    Else
            
        Set controllers = Nothing
        'master.rs.Close
        Set master = Nothing
        Set detail = Nothing
        Set teethController = Nothing
        'MDIMain.CloseForm
        RefreshCommands 0
    
    End If
    
    
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
'    txtOrganization_ID.Enabled = True
'    txtOrganization_Name.Enabled = True
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    txtOrganization_ID.Enabled = True
    txtOrganization_Name.Enabled = True
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    'txtOrganization_ID.Enabled = False
    'txtOrganization_Name.Enabled = False
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    Dim cancel As Boolean
    Dim sqlTreat As String
    'sqlTreat = "select * from VPic_CommTeethTreat where Organization_ID=" & rs!Organization_Id & " and tooth=" & fga.Cell(flexcpText, fga.Row, 2) & " and id not between 181 and 193 order by num"
     sqlTreat = "select * from VPic_CommTeethTreat where Organization_ID=" & rs!Organization_Id & " and tooth=" & fga.Cell(flexcpText, fga.Row, 2) & " order by num"
    Set detail.rs = ExecuteSelect(Conn, sqlTreat, cancel)
    If detail.rs.RecordCount = 0 Then
         fg.Rows = 1
    Else
         detail.rs.MoveFirst
         fg.Row = 1
    End If
    Dim rs2 As ADODB.Recordset
    Dim cancel2 As Boolean
    Set rs2 = ExecuteSelect(Conn, "select available, treatId from Pic_CommTeethTreat where treatid in (182,183,184,185,218,219,220,261,262) and organization_ID=" & rs!Organization_Id, cancel2)
    NoUpdateIlaj = True
    Do While Not rs2.EOF
        Select Case rs2!treatId
            Case 182
                chkTaklih.Value = rs2!available
            Case 183
                chkClean.Value = rs2!available
            Case 184
                chkLothaAdv.Value = rs2!available
            Case 185
                chkLothaSimple.Value = rs2!available
            Case 218
                chkPic1.Value = rs2!available
            Case 219
                chkPic2.Value = rs2!available
            Case 220
                chkZroa.Value = rs2!available
            Case 261
                chkTajreef.Value = rs2!available
            Case 262
                chkTawaj.Value = rs2!available
        End Select
       rs2.MoveNext
    Loop
    NoUpdateIlaj = False
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    txtOrganization_ID.Enabled = False
    txtOrganization_Name.Enabled = False
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If CDbl(ctrl.text) > 100 Then
        msg = "·« Ì„ﬂ‰ ≈⁄ÿ«¡ ﬁÌ„… ·Â–« «·Õﬁ· √ﬂ»— „‰ 100"
        checkType = True
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then Exit Sub
    Select Case ActiveFrame
    Case detailToothFrame
        btnFraSettings = GetBtnSettings
    Case detailFrame
        btnDetailSettings = GetBtnSettings
    End Select
    
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub fg_BeforeRowColChange(ByVal OldRow As Long, ByVal OldCol As Long, ByVal NewRow As Long, ByVal NewCol As Long, cancel As Boolean)
    If OldRow = NewRow Then Exit Sub
    If OldRow * NewRow = 0 Then Exit Sub
    If detail.state And (ST_ADDNEW + ST_UPDATE) Then
        detail.Save
        If detail.state And (ST_ADDNEW + ST_UPDATE) Then
            cancel = True
            Exit Sub
        End If
    End If
End Sub

Private Sub fg_KeyDown(KeyCode As Integer, Shift As Integer)
    If Not ((fg.Row = fg.Rows - 1) And (fg.Col = 3)) Then Exit Sub
    If KeyCode = 9 Or KeyCode = 40 And Shift <> 1 Then
        If master.state And (ST_ADDNEW + ST_UPDATE) Then
            master.Save
            If master.state And (ST_ADDNEW + ST_UPDATE) Then
                Exit Sub
            End If
        End If
        master.addNew
        fg.Col = 0
    End If
End Sub

Private Sub FillGrid(fg As VSFlexGrid, rs As ADODB.Recordset, ByVal Level As Integer, parent As Long)
    'Debug.Print level & "," & parent
    Do While Not rs.EOF
        If (rs!parent <> parent) Or (IsNull(rs!parent) And parent <> 0) Then Exit Sub 'And IsNull(rs!Parent) Then Exit Sub
        fg.AddItem rs!name & vbTab & rs!available & vbTab & Level
        fg.IsSubtotal(fg.Rows - 1) = True
        fg.RowOutlineLevel(fg.Rows - 1) = Level
'        If Num = 4 Then
        Debug.Print rs!id & "," & rs!name
'        End If
        Dim p As Long
        p = rs!id
        rs.MoveNext
        If rs.EOF Then
            Exit Sub
        End If
        FillGrid fg, rs, Level + 1, p
    Loop
End Sub


