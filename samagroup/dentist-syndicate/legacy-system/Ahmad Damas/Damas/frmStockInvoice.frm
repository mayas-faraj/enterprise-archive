VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmStockInvoice 
   BackColor       =   &H00E1FEFF&
   Caption         =   "›Ê« Ì— "
   ClientHeight    =   6930
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7875
   Icon            =   "frmStockInvoice.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6930
   ScaleWidth      =   7875
   Tag             =   $"frmStockInvoice.frx":1CFA
   WindowState     =   2  'Maximized
   Begin VB.Frame detailFrame 
      BackColor       =   &H80000018&
      Caption         =   " ›«’Ì· «·›« Ê—…"
      Height          =   3135
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Tag             =   ";repeat=true;"
      Top             =   3720
      Width           =   7695
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   240
         Width           =   7335
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   2055
         Left            =   120
         TabIndex        =   4
         Top             =   480
         Width           =   7335
         _cx             =   12938
         _cy             =   3625
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
         Cols            =   7
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmStockInvoice.frx":1E3A
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
      Begin VB.Label LblNetValue 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2640
         Width           =   1320
      End
      Begin VB.Label LblTotalDiscount 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   2280
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2640
         Width           =   1320
      End
      Begin VB.Label LblTotalPrice 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2640
         Width           =   1320
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·’«›Ì"
         Height          =   255
         Index           =   8
         Left            =   1560
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2700
         Width           =   615
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "„Ã„Ê⁄ «·Õ”„Ì« "
         Height          =   255
         Index           =   7
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2700
         Width           =   1215
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·≈Ã„«·Ì «·ﬂ·Ì"
         Height          =   255
         Index           =   2
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   2700
         Width           =   1095
      End
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„⁄·Ê„«  «·›« Ê—…"
      Height          =   3615
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   7695
      Begin VB.TextBox TxtInvoiceId 
         Alignment       =   1  'Right Justify
         DataField       =   "Serial"
         Height          =   375
         Left            =   4080
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Tag             =   ";search=true;integer>0;"
         Top             =   480
         Width           =   2415
      End
      Begin VB.TextBox TxtClientName 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   4405
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   ";search=true;check=custom;"
         Top             =   1080
         Width           =   2090
      End
      Begin VB.CommandButton CmdClientHelp 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   4080
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   1080
         Width           =   325
      End
      Begin VB.ComboBox CbPayMethod 
         DataField       =   "Pay_Method"
         ForeColor       =   &H80000012&
         Height          =   315
         Left            =   4080
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Tag             =   ";search=true;check=required;"
         Top             =   1710
         Width           =   2415
      End
      Begin VB.TextBox TxtDiscountPercent 
         Alignment       =   1  'Right Justify
         DataField       =   "Discount_Percent"
         Height          =   375
         Left            =   195
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";new=0;check=real>=0;check=custom;"
         Top             =   1680
         Width           =   2415
      End
      Begin VB.TextBox TxtDiscount 
         Alignment       =   1  'Right Justify
         DataField       =   "Discount"
         BeginProperty DataFormat 
            Type            =   0
            Format          =   """·.”.˛"" #,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   10241
            SubFormatType   =   0
         EndProperty
         Height          =   375
         Left            =   4080
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";new=0;check=real>=0;check=custom;"
         Top             =   2160
         Width           =   2415
      End
      Begin VB.TextBox TxtClientAccount 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   195
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";search=true;"
         Top             =   1080
         Width           =   2415
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
         Width           =   7455
      End
      Begin VB.TextBox TxtClientID 
         Alignment       =   1  'Right Justify
         DataField       =   "Account"
         Height          =   375
         Left            =   6120
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   1200
         Visible         =   0   'False
         Width           =   465
      End
      Begin VB.TextBox TxtDescription 
         Alignment       =   1  'Right Justify
         DataField       =   "Description"
         Height          =   735
         Left            =   195
         MaxLength       =   500
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         Tag             =   ";search=true;"
         Top             =   2700
         Width           =   6330
      End
      Begin MSComCtl2.DTPicker dtInvoiceDate 
         DataField       =   "Date"
         Height          =   375
         Left            =   195
         TabIndex        =   26
         Tag             =   ";search=true;check=required;"
         Top             =   480
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   661
         _Version        =   393216
         DateIsNull      =   -1  'True
         Format          =   52297729
         CurrentDate     =   38250
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ"
         Height          =   255
         Index           =   1
         Left            =   3120
         RightToLeft     =   -1  'True
         TabIndex        =   28
         Top             =   540
         Width           =   735
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·›« Ê—…"
         Height          =   255
         Left            =   6600
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   540
         Width           =   855
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H8000000D&
         BorderStyle     =   3  'Dot
         BorderWidth     =   2
         FillColor       =   &H00FFFFFF&
         Height          =   1670
         Left            =   150
         Top             =   960
         Width           =   7395
      End
      Begin VB.Label lblClient 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·⁄„Ì·"
         Height          =   255
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   1140
         Width           =   735
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "ÿ—Ìﬁ… «·œ›⁄"
         Height          =   255
         Index           =   0
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   1740
         Width           =   975
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·»Ì«‰"
         Height          =   255
         Index           =   6
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   2940
         Width           =   735
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Õ”„ ≈÷«›Ì"
         Height          =   255
         Index           =   5
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   2220
         Width           =   975
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "‰”»… «·Õ”„ (%)"
         Height          =   255
         Index           =   4
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1740
         Width           =   1095
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ Õ”«»Â"
         Height          =   255
         Index           =   3
         Left            =   3120
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1140
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmStockInvoice"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Enum PrimaryAccountsEnum
    paStartStock = 0
    paCashSupplier = 1
    paCashClient = 2
    paClients = 3
    paSuppliers = 4
End Enum

Private Type AccountInfo
    id As String
    Account As String
    name As String
End Type

Const MAX_PRIMARY = paSuppliers

Public controllers As New Collection
Dim WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Dim WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Double

' √Ê· „œ…: 0 √Ê ≈œŒ«·: 1 √Ê ≈Œ—«Ã: 2
Public InvoiceType As Integer
' "Start", "In" or "Out"
Public Postfix As String

' Required Accounts names
Dim PrimaryAccountsNames(MAX_PRIMARY) As String
Dim PrimaryAccounts(MAX_PRIMARY) As AccountInfo

Const OBJECT_ = 0
Const QTY_ = 1
Const UNIT_ = 2
Const PRICE_ = 3
Const EXPIRE_ = 4
Const TOTAL_ = 5
Const RETURN_ = 6

Private RetQty As Integer
Private rsObjects As ADODB.Recordset

Private Sub CmdClientHelp_Click()
    
    GLOBAL_TAG = ";datafield=,0:num,1:acc,2:name,;"
    GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetAccNum,1:SetAccAcc,2:SetAccName,;"
    GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select num,acc,name from Acc_Accounts;"
    GLOBAL_TAG = GLOBAL_TAG & "initQuery=,2:" & TxtClientName.text & ",1:" & TxtClientAccount.text & ",;"
    
    Dim currBtns As Long
    currBtns = GetBtnSettings
    
    Clin_List.fg.Cols = 3
    Clin_List.fg.ColHidden(0) = True
    Clin_List.fg.ColHidden(1) = False
    Clin_List.fg.ColHidden(2) = False
    Clin_List.fg.ColWidth(0) = 0
    Clin_List.fg.ColWidth(1) = 1000
    Clin_List.fg.ColWidth(2) = 4000
    Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
    Clin_List.fg.Cell(flexcpText, 0, 2) = "«”„ «·Õ”«»"
    Clin_List.fg.Cell(flexcpText, 0, 1) = "—ﬁ„ «·Õ”«»"
    Set Clin_List.CallerForm = Me
    
    Clin_List.Show 1
    
    RefreshCommands currBtns
    
End Sub

Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

Private Sub Details_doAddNew(rs As ADODB.Recordset)
    fg.ColComboList(RETURN_) = ""
    RefreshObjects
End Sub

Private Sub details_doBeforeAddNew(rs As ADODB.Recordset, cancel As Boolean)
    If master.rs.RecordCount = 0 Then
        cancel = True
        MsgBox "·« Ì„ﬂ‰ﬂ ≈÷«›…  ›«’Ì· ›« Ê—… ﬁ»· ≈÷«›… «·„⁄·Ê„«  «·√”«”Ì… ⁄‰Â«", vbOKOnly + vbCritical, "⁄„·Ì… „„‰Ê⁄…"
    End If
End Sub

Private Sub Details_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.ColComboList(RETURN_) = "..."
    calculateTotals
End Sub

Private Sub details_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim sql As String
    
    sql = "DELETE FROM Stock_Invoice_Detail_Return" & vbCrLf
    sql = sql & "WHERE Detail = " & rs!id & vbCrLf
    
    rs.ActiveConnection.BeginTrans
    ExecuteCommand rs.ActiveConnection, sql, cancel
    If cancel Then
        rs.ActiveConnection.RollbackTrans
        MsgBox "·« Ìı„ﬂ‰ﬂ Õ–› Â–« «·ﬁ·„°  √ﬂ¯œ „‰ ⁄œ„ «— »«ÿ  ›«’Ì·Â« »√Ì… „⁄·Ê„«  √Œ—Ï ›Ì ﬁ«⁄œ… «·„⁄ÿÌ« .", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› ﬁ·„ „‰ ›« Ê—…"
    Else
        rs.ActiveConnection.CommitTrans
    End If
End Sub

Private Sub Details_doDeleteCompleted(rs As ADODB.Recordset)
    rs.Requery
End Sub

Private Sub details_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    Dim strError As String
    strError = rs.ActiveConnection.Errors(0).description
    If InStr(1, strError, "stock unbalanced") Then
        MsgBox "·« Ì„ﬂ‰ ≈ „«„ Â–Â «·⁄„·Ì… ·√‰Â«  ”»» Œ·· ›Ì ﬂ„Ì… «·„Ê«œ.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–›"
        cancel = True
    ElseIf InStr(1, strError, "can't delete sold quantity") Then
        MsgBox "·« Ì„ﬂ‰ Õ–› ≈œŒ«·Ì… »⁄œ √‰¯ »Ì⁄ „‰Â«.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–›"
        cancel = True
    End If
End Sub

Private Sub Details_doMoveComplete(rs As ADODB.Recordset)
    rsObjects.Filter = "Id = " & rs!Object
    fg.TextMatrix(fg.Row, UNIT_) = rsObjects!Unit
    fg.TextMatrix(fg.Row, TOTAL_) = rs!qty * rs!Unit_Price
    If InvoiceType > 0 Then
        Dim cancel As Boolean
        Dim sql As String
        Dim rsRet As ADODB.Recordset
        sql = "SELECT IsNull(Sum(RetQty), 0) FROM Stock_Invoice_Detail_Return" & vbCrLf
        sql = sql & "WHERE Detail = " & rs!id
        Set rsRet = ExecuteSelect(Conn, sql, cancel)
        rsRet.MoveFirst
        fg.TextMatrix(fg.Row, RETURN_) = rsRet.Fields(0)
    End If
End Sub

Private Sub Details_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!Invoice = master.rs!id
End Sub

Private Sub Details_doSaveComplete(rs As ADODB.Recordset)
    fg.TextMatrix(fg.Row, RETURN_) = "0"
    fg.ColComboList(RETURN_) = "..."
    If rs.RecordCount = 1 Then
        loadDetailsRs rs
    Else
        rs.Requery
    End If
End Sub

Private Sub details_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    Dim strError As String
    strError = rs.ActiveConnection.Errors(0).description
    If InStr(1, strError, "can't modify invoice detail object") Then
        msg = "·« Ì„ﬂ‰ﬂ  ⁄œÌ· Õﬁ· «·„«œ… ·√Õœ √ﬁ·«„ «·›« Ê—…° ﬁ„ »Õ–› Â–« «·ﬁ·„ Ê≈œŒ«· ﬁ·„ ÃœÌœ »«·„«œ… «·ÃœÌœ…"
    ElseIf InStr(1, strError, "stock unbalanced") Then
        msg = "·« Ì„ﬂ‰ ≈ „«„ Â–Â «·⁄„·Ì… ·√‰Â«  ”»» Œ·· ›Ì ﬂ„Ì… «·„Ê«œ."
    Else
        msg = "·« Ì„ﬂ‰ﬂ ≈œŒ«· ﬁ·„Ì‰ ·‰›” «·„«œ… ›Ì ›« Ê—… Ê«Õœ…."
    End If
    KeepState = True
End Sub

Private Sub details_doUpdate(rs As ADODB.Recordset)
    fg.ColComboList(RETURN_) = ""
End Sub

Private Sub details_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim total_Qty As Double
    If ctrl.Col = QTY_ Then
        rsObjects.Filter = "Id = " & fg.TextMatrix(fg.Row, OBJECT_)
        total_Qty = rsObjects!Net_Qty
        Dim qty As Double
        On Error Resume Next
        qty = CDbl(ctrl.text)
        If Err.Number <> 0 Then
            'msg = "ﬁÌ„… Â–« «·Õﬁ· ﬂ»Ì—… Ãœ«° «·Õœ «·√⁄·Ï «·„”„ÊÕ »Â ÂÊ 32767."
            msg = "ﬁÌ„… Â–« «·Õﬁ· ﬂ»Ì—… Ãœ«."
            checkType = True
            Exit Sub
        End If
        If (details.state And ST_UPDATE) <> 0 Then
            details.MoveRSToSelectedRow ctrl, details.rs
            total_Qty = total_Qty + details.rs!qty
        End If
        msg = "«·ﬂ„Ì… «·„»«⁄… €Ì— „ Ê›—… ›Ì «·„” Êœ⁄° «·ﬂ„Ì… «·„ Ê›—… ›Ì «·„” Êœ⁄ ÂÌ " & total_Qty & " ›ﬁÿ."
        checkType = (InvoiceType = 2) And (qty > total_Qty)
        If checkType Then Exit Sub
        If InvoiceType = 2 And Not IsNull(rsObjects!Min_Qty) Then
            If qty <= (total_Qty - rsObjects!Min_Qty) Then Exit Sub
            msg = "√ı·€ÌÛ  ⁄„·Ì… «·Õ›Ÿ° ‰—ÃÊ  ⁄œÌ· «·ﬂ„Ì… «·„»«⁄…."
            checkType = (MsgBox("«·ﬂ„Ì… «·„»«⁄…  —»„«  ”»» ‰ﬁ’ ⁄‰ «·Õœ «·√œ‰Ï «·„”„ÊÕ ··„«œ…° ≈÷€ÿ „Ê«›ﬁ ·≈ „«„ «·⁄„·Ì… √Ê ≈·€«¡ «·√„— ·· —«Ã⁄ ⁄‰Â«.", vbQuestion Or vbOKCancel Or vbMsgBoxRight Or vbMsgBoxRtlReading, " ‰»ÌÂ") <> vbOK)
        End If
        If InvoiceType = 1 And Not IsNull(rsObjects!Max_Qty) Then
            If qty <= (rsObjects!Max_Qty - total_Qty) Then Exit Sub
            msg = "√ı·€ÌÛ  ⁄„·Ì… «·Õ›Ÿ° ‰—ÃÊ  ⁄œÌ· «·ﬂ„Ì… «·„œŒ·…."
            checkType = (MsgBox("«·ﬂ„Ì… «·„œŒ·… —»„«  ”»» “Ì«œ… ⁄‰ «·Õœ «·√⁄·Ï «·„”„ÊÕ ··„«œ…° ≈÷€ÿ „Ê«›ﬁ ·≈ „«„ «·⁄„·Ì… √Ê ≈·€«¡ «·√„— ·· —«Ã⁄ ⁄‰Â«.", vbQuestion Or vbOKCancel Or vbMsgBoxRight Or vbMsgBoxRtlReading, " ‰»ÌÂ") <> vbOK)
        End If
    End If
    If ctrl.Col = EXPIRE_ Then
        Dim dd, di As Date
        dd = CDate(ctrl.text)
        di = CDate(master.rs!Date)
        msg = " ‰ ÂÌ ’·«ÕÌ… Â–Â «·„«œ… ﬁ»·  «—ÌŒ ≈œŒ«·Â«!"
        checkType = DateDiff("d", di, dd) <= 0
    End If
End Sub

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    If Col = OBJECT_ Then
        ' display unit name
        If Trim(fg.TextMatrix(Row, OBJECT_)) = "" Then Exit Sub
        If Not IsNumeric(fg.TextMatrix(Row, OBJECT_)) Then
            MsgBox "Ì—ÃÏ «Œ Ì«— „«œ… „‰ «·„” Êœ⁄° Â–Â «·„«œ… €Ì— „ﬁ»Ê·….", vbOKOnly Or vbCritical Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·„«œ…"
            fg.TextMatrix(Row, OBJECT_) = ""
            Exit Sub
        End If
        rsObjects.Filter = "Id = " & fg.TextMatrix(Row, OBJECT_)
        If rsObjects.RecordCount = 0 Then
            MsgBox "Ì—ÃÏ «Œ Ì«— „«œ… „‰ «·„” Êœ⁄° Â–Â «·„«œ… €Ì— „ﬁ»Ê·….", vbOKOnly Or vbCritical Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·„«œ…"
            fg.TextMatrix(Row, OBJECT_) = ""
            Exit Sub
        End If
        fg.TextMatrix(Row, UNIT_) = rsObjects!Unit
        Dim str As String
        If InvoiceType = 0 Then
            str = ""
        ElseIf InvoiceType = 1 Then
            If IsNull(rsObjects!Last_Buy_Price) Then
                str = ""
            Else
                str = rsObjects!Last_Buy_Price
            End If
        Else
            If IsNull(rsObjects!Sell_Price) Then
                str = ""
            Else
                str = rsObjects!Sell_Price
            End If
        End If
        fg.TextMatrix(Row, PRICE_) = str
        doTotal Row, Col
    End If
    If Col = QTY_ Or Col = PRICE_ Then
        doTotal Row, Col
    End If
End Sub

Private Sub doTotal(ByVal Row As Long, ByVal Col As Long)
    If Trim(fg.TextMatrix(Row, QTY_)) = "" Or Trim(fg.TextMatrix(Row, PRICE_)) = "" Then
        Exit Sub
    End If
    Dim qty As Double
    Dim price As Single
    On Error GoTo ErrorHandling
    qty = val(Trim(fg.TextMatrix(Row, QTY_)))
    price = val(Trim(fg.TextMatrix(Row, PRICE_)))
    fg.TextMatrix(Row, TOTAL_) = val(qty * price)
    calculateTotals
    Exit Sub
ErrorHandling:
    fg.TextMatrix(Row, TOTAL_) = "√œŒ· «·ﬂ„Ì… Ê«·”⁄— ’ÕÌÕÌ‰"
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Col = UNIT_ Or Col = TOTAL_ Then
        cancel = True
    End If
    If Col = RETURN_ And (details.state And ST_ADDNEW <> 0) Then
        cancel = True
    End If
End Sub

Private Sub fg_CellButtonClick(ByVal Row As Long, ByVal Col As Long)
    Dim DetailId As Long
    Dim ObjectName As String
    details.MoveRSToSelectedRow fg, details.rs
    DetailId = details.rs!id
    ObjectName = fg.Cell(flexcpTextDisplay, fg.Row, 0)
    With dlgSqlSelect
        .GridTag = ";typeof=vsflexgrid;datafield=,0:fk,1:qty,2:dt,;check=,1:required,2:required,;"
        .GridTag = .GridTag & "check=,2:date,;"
        .GridTag = .GridTag & "HiddenColumns=,0:true,;MasterValues=,0:" & DetailId & ",;"
        .sql = "SELECT Detail as fk, RetQty as qty, [Date] as dt FROM Stock_Invoice_Detail_Return WHERE Detail = " & DetailId & " Order By 3"
        .ColumnsNames = ",«·ﬂ„Ì… «·„⁄«œ…, «—ÌŒ «·≈⁄«œ…"
        .FrameCaption = "„— Ã⁄«  «·›« Ê—… „‰ /" & ObjectName & "/"
        .AlwaysPerformOnSelectEvent = True
        .DontReturnOnDblClick = 1
        Set .Opener = Me
        .Show 1
    End With
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
    If master.rs Is Nothing Then Exit Sub
    If (master.state And ST_CANCELSEARCH <> 0) Or (master.rs.RecordCount = 0) Then
        Exit Sub
    End If
    If master.CheckIfIsModified(master.rs) Then
        Dim msg As String
        msg = "·ﬁœ ﬁ„  » ⁄œÌ· »⁄÷ «·ﬁÌ„° Â·  —Ìœ Õﬁ« ≈€·«ﬁ «·»ÿ«ﬁ… œÊ‰ Õ›Ÿ «· ⁄œÌ·« ø"
        cancel = MsgBox(msg, vbCritical Or vbOKCancel) <> vbOK
    End If
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
    'ResizeGrid fg
    ResizeGrid fg
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Stock"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
'    If (master.rs.RecordCount = 0) Then
'        master.addNew
'    End If
    RefreshObjects
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    Else
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 7995
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btPrev - btFirst - btNext - btLast - btPrint
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    master.TraceChanges = True
    Set master.Form = Me
    Set master.frame = masterFrame
    Set details = New Controller
    Set details.Form = Me
    Set details.frame = detailFrame
    controllers.Add master, masterFrame.name
    controllers.Add details, detailFrame.name
    
    Dim cancel As Boolean
    Dim sql As String
    Dim invoiceName As String
    
    sql = "SELECT * FROM vStock_Objects"
    Set rsObjects = ExecuteSelect(Conn, sql, cancel)
    
    Dim df, ck1, ck2, ck3 As String
    If InvoiceType = 0 Then
        df = "4:Expire_On,"
        ck1 = "4:required,"
        ck2 = "4:date,"
        ck3 = "4:custom,"
        Postfix = "Start"
        invoiceName = "»÷«⁄… √Ê· «·„œ…"
        FormSettings = btUpdate Or btsave Or btCancel Or btPrint
        DisplayControls
    ElseIf InvoiceType = 1 Then
        df = "4:Expire_On,"
        ck1 = "4:required,"
        ck2 = "4:date,"
        ck3 = "4:custom,"
        Postfix = "In"
        invoiceName = "≈œŒ«·"
    ElseIf InvoiceType = 2 Then
        df = ""
        ck1 = ""
        ck2 = ""
        ck3 = ""
        Postfix = "Out"
        invoiceName = "≈Œ—«Ã"
        fg.ColHidden(EXPIRE_) = True
        fg.ColWidth(EXPIRE_) = 0
    Else
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄° «·—Ã«¡ «·« ’«· »„Ê“⁄ «·»—‰«„Ã."
        Unload Me
    End If
    
    fg.Tag = ";typeof=vsflexgrid;"
    fg.Tag = fg.Tag & "datafield=,0:Object,1:Qty,3:Unit_Price," & df & ";"
    fg.Tag = fg.Tag & "check=,0:required,1:required,3:required," & ck1 & ";"
    fg.Tag = fg.Tag & "check=,1:real>0,3:real>0," & ck2 & ";"
    fg.Tag = fg.Tag & "check=,1:custom," & ck3 & ";"
    
    Me.Caption = "›Ê« Ì— " & invoiceName
    masterFrame.Caption = "›« Ê—… " & invoiceName
    masterFrame.ForeColor = IIf(InvoiceType <> 2, vbRed, vbBlue)
    
    InitFrame
    
    ' »÷«⁄… √Ê· «·„œ… ÂÌ ›« Ê—… Ê«Õœ… ›ﬁÿ
    ExecuteCommand Conn, "DELETE FROM Stock_Invoice_Start WHERE Serial <> 1", cancel
    
    ' master sql
    sql = "SELECT * FROM Stock_Invoice_" & Postfix & " ORDER BY Serial"
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    ' ≈÷«›… ›« Ê—… »÷«⁄… √Ê· «·„«œ… ›Ì Õ«· ·„  ﬂ‰ „ÊÃÊœ…
    Dim rsInsert As ADODB.Recordset
    If InvoiceType = 0 Then
        If master.rs.RecordCount = 0 Then
            With master
                Set rsInsert = .rs.Clone(adLockOptimistic)
                rsInsert.addNew
                rsInsert!serial = 1
                rsInsert!Type = 0
                If Trim(PrimaryAccounts(paStartStock).id) = "" Then
                    MsgBox "«·Õ”«» '„Œ“Ê‰ √Ê· «·„œ…' €Ì— „ÊÃÊœ ›Ì «·œ·Ì· «·„Õ«”»Ì° ·« Ì„ﬂ‰ ≈‰‘«¡ √Ê  ⁄œÌ· ›« Ê—… √Ê· «·„œ… »œÊ‰Â.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "›« Ê—… √Ê¯· «·„œ…"
                    Set rsInsert = Nothing
                    Set master.rs = Nothing
                    Unload Me
                    Exit Sub
                End If
                rsInsert!Account = PrimaryAccounts(paStartStock).id
                rsInsert!Date = CDate("01/01/" & DatePart("YYYY", Date))
                rsInsert!description = "«·»÷«⁄… «·„ÊÃÊœ… ›Ì «·„” Êœ⁄ ›Ì »œ«Ì… «·„œ…."
                rsInsert!Pay_Method = 1
                rsInsert!Discount_Percent = 0
                rsInsert!discount = 0
                rsInsert.Update
                rsInsert.Close
                Set rsInsert = Nothing
                .rs.Requery
            End With
        End If
        TxtInvoiceId.Enabled = False
        TxtClientAccount.Enabled = False
        TxtClientName.Enabled = False
        txtDiscount.Enabled = False
        TxtDiscountPercent.Enabled = False
        CbPayMethod.Enabled = False
        CmdClientHelp.Enabled = False
        Shape1.BorderColor = &HE0E0E0
    End If
    
    fg.ColHidden(RETURN_) = True
    fg.ColWidth(RETURN_) = 0
    
    master.rs.sort = "Serial ASC"
    
    Set ActiveFrame = masterFrame
End Sub

Private Sub InitFrame()

    PrimaryAccountsNames(paClients) = "“»«∆‰"
    PrimaryAccountsNames(paSuppliers) = "„Ê—œÊ‰"
    PrimaryAccountsNames(paCashClient) = "«·’‰œÊﬁ"
    PrimaryAccountsNames(paStartStock) = "„Œ“Ê‰ √Ê· «·„œ…"
    PrimaryAccountsNames(paCashSupplier) = "«·’‰œÊﬁ"

    getPrimaryAccounts
        
    With CbPayMethod
        .AddItem "‰ﬁœÌ", 0
        .ItemData(0) = 0
        .AddItem "¬Ã·", 1
        .ItemData(1) = 1
    End With
    
    dtInvoiceDate.Tag = SetTagValue(dtInvoiceDate.Tag, "new", CStr(Date))
    
    fg.ColComboList(OBJECT_) = fg.BuildComboList(rsObjects, "Group,*Name", "Id", &HE1FEFF)
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    TxtInvoiceId.text = CStr(getNextInvoiceId)
    SetClientInfo InvoiceType
    
    loadDetailsRs rs
    detailFrame.visible = False

    CmdClientHelp.SetFocus
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    detailFrame.visible = True
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim sql As String
    
    sql = "DELETE FROM Stock_Invoice_Detail_Return" & vbCrLf
    sql = sql & "WHERE Detail IN (" & vbCrLf
    sql = sql & vbTab & "SELECT Id FROM Stock_Invoice_Detail " & vbCrLf
    sql = sql & vbTab & "WHERE Invoice = " & rs!id & vbCrLf
    sql = sql & ");" & vbCrLf
    sql = sql & "DELETE FROM Stock_Invoice_Detail WHERE Invoice = " & rs!id
    
    rs.ActiveConnection.BeginTrans
    ExecuteCommand rs.ActiveConnection, sql, cancel
    If cancel Then
        rs.ActiveConnection.RollbackTrans
        MsgBox "·« Ìı„ﬂ‰ﬂ Õ–› Â–Â «·›« Ê—…°  √ﬂ¯œ „‰ ⁄œ„ «— »«ÿ  ›«’Ì·Â« »√Ì… „⁄·Ê„«  √Œ—Ï ›Ì ﬁ«⁄œ… «·„⁄ÿÌ« .", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ–› ›« Ê—…"
    Else
        rs.ActiveConnection.CommitTrans
    End If
End Sub

Private Sub master_doDeleteCompleted(rs As ADODB.Recordset)
   If rs.RecordCount = 0 Then TxtInvoiceId.text = ""
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    
    If IsNull(rs!Account) Then Exit Sub
    Dim rsClient As ADODB.Recordset
    Set rsClient = getClientByWhereClause("num = " & rs!Account)
    If rsClient Is Nothing Then Exit Sub
    If rsClient.RecordCount = 0 Then Exit Sub
    rsClient.MoveFirst
    TxtClientName.text = rsClient!name
    TxtClientAccount.text = rsClient!acc
    
    loadDetailsRs rs
   
    calculateTotals
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If rs.RecordCount = 0 Or IsNull(rs!id) Then
        MsgBox "ﬁ„ »≈‰‘«¡ «·›« Ê—… À„ «ÿ»⁄Â« —Ã«¡.", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "ÿ»«⁄… ›« Ê—…"
        Exit Sub
    End If
    Dim rpt As DataReport
    If InvoiceType = 0 Or InvoiceType = 1 Then
        Set rpt = DRStockInvoiceIn
    Else
        Set rpt = DRStockInvoice
    End If

    Dim rsReport As ADODB.Recordset
    Dim Error As Boolean
    Set rsReport = ExecuteSelect(Conn, "SELECT * FROM vStock_Details WHERE Invoice = " & rs!id, Error)
    Set rpt.DataSource = rsReport
    
    If rs.RecordCount = 0 Then
        MsgBox "·« ÌÊÃœ  ›«’Ì· ›Ì Â–Â «·›« Ê—….", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "›« Ê—…"
    End If
    
    Get_DataReport_Label_byName(rpt, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
    Get_DataReport_Label_byName(rpt, 1, "lblBranchPhone").Caption = Current_State.Phone
    
    Get_DataReport_Label_byName(rpt, 1, "lblInvoice").Caption = masterFrame.Caption
    Get_DataReport_Label_byName(rpt, 1, "lblClient").Caption = TxtClientName.text
    Get_DataReport_Label_byName(rpt, 1, "lblSerial").Caption = rs!serial
    Get_DataReport_Label_byName(rpt, 1, "lblDate").Caption = FormatDateTime(rs!Date, vbShortDate)
    Get_DataReport_Label_byName(rpt, 1, "lblPayMethod").Caption = CbPayMethod.text
    If Not IsNull(rs!description) Then
        Get_DataReport_Label_byName(rpt, 1, "lblDescription").Caption = rs!description
    End If
    Get_DataReport_Label_byName(rpt, 1, "lblDiscount").Caption = FormatCurrency(rs!discount)
    Get_DataReport_Label_byName(rpt, 1, "lblDiscountPercent").Caption = rs!Discount_Percent & "%"
    '<AHMAD>
'        Get_DataReport_Label_byName(rpt, 5, "lblDiscountTotal").Caption = FormatCurrency(LblTotalDiscount.Caption)
'        Get_DataReport_Label_byName(rpt, 5, "lblTotalNet").Caption = FormatCurrency(LblNetValue.Caption)
         Get_DataReport_Label_byName(rpt, 5, "lblDiscountTotal").Caption = LblTotalDiscount.Caption
         Get_DataReport_Label_byName(rpt, 5, "lblTotalNet").Caption = LblNetValue.Caption
    '</AHMAD>
    
    '<AHMAD>
        If InvoiceType = 0 Then
            Get_DataReport_Label_byName(rpt, 1, "lblDiscount").visible = False
            Get_DataReport_Label_byName(rpt, 1, "lblDiscountPercent").visible = False
            Get_DataReport_Label_byName(rpt, 5, "lblDiscountTotal").visible = False
            Get_DataReport_Label_byName(rpt, 5, "lblTotalNet").visible = False
            Get_DataReport_Label_byName(rpt, 5, "lblCurrency_Symbol2").visible = False
            Get_DataReport_Label_byName(rpt, 5, "lblCurrency_Symbol3").visible = False
            
            Get_DataReport_Label_byName(rpt, 1, "lbl1").visible = False
            Get_DataReport_Label_byName(rpt, 1, "lbl2").visible = False
            Get_DataReport_Label_byName(rpt, 5, "lbl3").visible = False
            Get_DataReport_Label_byName(rpt, 5, "lbl4").visible = False
            Get_DataReport_Label_byName(rpt, 1, "lbl5").visible = False
            Get_DataReport_Label_byName(rpt, 1, "lblPayMethod").visible = False
        End If
    '</AHMAD>
    
    If InvoiceType = 0 Or InvoiceType = 1 Then
        DRStockInvoiceIn.Show 1
    Else
        DRStockInvoice.Show 1
    End If
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    rs!Type = InvoiceType
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    detailFrame.visible = True
    calculateTotals
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, keepControllerState As Boolean)
    msg = " ÊÃœ ›« Ê—… √Œ—Ï ·Â« «·—ﬁ„ «· ”·”·Ì –« Â° «·—Ã«¡  €ÌÌ— —ﬁ„ «·›« Ê—…."
    keepControllerState = True
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    If TxtClientAccount.text <> "" Or TxtClientName.text <> "" Then
        Dim rsClient As ADODB.Recordset
        Dim Where As String
        Where = ""
        If TxtClientName.text <> "" Then
            Where = "Name like '%" & TxtClientName.text & "%'"
        End If
        If TxtClientAccount.text <> "" Then
            If Where <> "" Then
                Where = Where & " and "
            End If
            Where = Where & "Acc like '%" & TxtClientAccount.text & "%'"
        End If
        Set rsClient = getClientByWhereClause(Where)
        If rsClient.RecordCount = 0 Then
            S = "Account=-1"
            DefaultType = 0
            Exit Sub
        End If
        rsClient.MoveFirst
        S = ""
        While Not rsClient.EOF
            S = S & "Account=" & rsClient!Num & " Or "
            rsClient.MoveNext
        Wend
        If S <> "" Then
            S = "(" & Left(S, Len(S) - Len(" Or ")) & ")"
        End If
        DefaultType = 1
    End If
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim choice As VbMsgBoxResult
    If ctrl.name = TxtClientName.name Then
        If Trim(TxtClientID.text) = "" Then
            choice = MsgBox("·„  Õœœ «·⁄„Ì·° Â·  —Ìœ «Œ Ì«—Â „‰ «·ﬁ«∆„…ø", vbQuestion Or vbOKCancel Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·⁄„Ì·")
            If choice = vbOK Then
                getClientByNameOrAccount
            End If
        Else
            Dim C_Name As String
            Dim C_Account As String
            getClientByNum TxtClientID.text, C_Name, C_Account
            If TxtClientName.text <> C_Name Or TxtClientAccount.text <> C_Account Then
                choice = MsgBox("·ﬁœ ﬁ„  » ⁄œÌ· „⁄·Ê„«  «·Õ”«»° Â·  —Ìœ «⁄ „«œ «·Õ«·Ìø", vbQuestion Or vbOKCancel Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·⁄„Ì·")
                If choice = vbOK Then
                    TxtClientID.text = ""
                    getClientByNameOrAccount
                Else
                    TxtClientName.text = C_Name
                    TxtClientAccount.text = C_Account
                End If
            End If
        End If
        If Trim(TxtClientID.text) = "" Then
            msg = "⁄·Ìﬂ «Œ Ì«— «·⁄„Ì·."
            checkType = True
        End If
        Exit Sub
    End If
    
    If ctrl.name = TxtDiscountPercent.name Then
        Dim X As Double
        On Error Resume Next
        X = CDbl(TxtDiscountPercent.text)
        If Err.Number <> 0 Then
            msg = "Â–« «·Õﬁ· ÌÕÊÌ ﬁÌ„… €Ì— „ﬁ»Ê·…."
            checkType = True
        Else
            msg = "ÌÃ» √‰  ﬂÊ‰ ‰”»… «·Õ”„ √ﬁ· „‰ 100%."
            checkType = (X > 100)
        End If
        Exit Sub
    End If
    
    If ctrl.name = txtDiscount.name Then
        On Error Resume Next
        X = CDbl(txtDiscount.text)
        If Err.Number <> 0 Then
            checkType = True
            msg = "Â–« «·Õﬁ· ÌÕÊÌ ﬁÌ„… €Ì— „ﬁ»Ê·…."
        Else
            checkType = CDbl(LblNetValue) < 0
            X = CDbl(LblTotalPrice.Caption) * (100 - CDbl(TxtDiscountPercent.text)) / 100
            msg = "·« Ì„ﬂ‰ Õ”„ Â–« «·„»·€ „‰ ﬁÌ„… «·›« Ê—… Õ«·Ì«° √œŒ· „»·€« √ﬁ· „‰ '" & X & "' ·.”"
        End If
        Exit Sub
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub loadDetailsRs(ByRef rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    
    sql = "SELECT * " & vbCrLf & _
          "FROM Stock_Invoice_Detail d " & vbCrLf & _
          "WHERE "
          
    If IsNull(rs!id) Or IsEmpty(rs!id) Then
        sql = sql & "d.Invoice IS NULL"
    Else
        sql = sql & "d.Invoice = " & master.rs!id
    End If
    
    Set details.rs = ExecuteSelect(Conn, sql, cancel)
    If details.rs.EOF Then Exit Sub
    details.rs.MoveFirst
End Sub

Private Sub calculateTotals()
    Dim Total As Double
    Total = 0
    Dim R As Integer
    For R = 1 To fg.Rows - 1
        If Trim(fg.TextMatrix(R, TOTAL_)) <> "" Then
            Total = Total + val(Trim(fg.TextMatrix(R, TOTAL_)))
        End If
    Next
    Dim Percent As Double
    Dim discount As Double
    
    On Error GoTo ErrorHandler
    If Trim(TxtDiscountPercent.text) = "" Then
        Percent = 0
    Else
        Percent = CDbl(TxtDiscountPercent.text)
    End If
    If Trim(txtDiscount.text) = "" Then
        discount = 0
    Else
        discount = CDbl(txtDiscount.text)
    End If
    discount = Total * Percent / 100 + discount
    
    LblTotalPrice.Caption = format(Total, "#.00")
    LblTotalDiscount.Caption = CStr(discount)
    LblNetValue.Caption = CStr(Total - discount)
    Exit Sub
ErrorHandler:
    MsgBox "·« Ì„ﬂ‰ Õ”«» ’«›Ì «·›« Ê—…°  √ﬂœ „‰ «·ﬁÌ„ «·„œŒ·…."
End Sub

Public Sub SetAccNum(val As String)
    TxtClientID.text = val
End Sub

Public Sub SetAccAcc(val As String)
    TxtClientAccount.text = val
End Sub

Public Sub SetAccName(val As String)
    TxtClientName.text = val
End Sub

Private Sub getClientByNameOrAccount()
    TxtClientID.text = ""
    Dim rsClient As ADODB.Recordset
    Dim Where As String
    Where = "Name like '%" & TxtClientName.text & "%'"
    Where = Where & " OR Acc like '%" & TxtClientAccount.text & "%'"
    Set rsClient = getClientByWhereClause(Where)
    If rsClient.RecordCount <> 1 Then
        CmdClientHelp_Click
        Exit Sub
    End If
    rsClient.MoveFirst
    TxtClientID.text = rsClient!Num
    TxtClientName.text = rsClient!name
    TxtClientAccount.text = rsClient!acc
End Sub

Private Sub getClientByNum(ByVal Num As String, ByRef name As String, ByRef Account As String)
    Dim rs As ADODB.Recordset
    Set rs = getClientByWhereClause("Num = " & Num)
    If rs.RecordCount <> 1 Then
        name = ""
        Account = ""
    Else
        rs.MoveFirst
        name = rs!name
        Account = rs!acc
    End If
End Sub

Private Function getClientByWhereClause(ByVal Where As String) As ADODB.Recordset
    Dim SqlClient As String
    Dim cancel As Boolean
    SqlClient = "SELECT num, name, acc FROM Acc_Accounts WHERE " & Where
    Set getClientByWhereClause = ExecuteSelect(Conn, SqlClient, cancel)
End Function

Private Function getNextInvoiceId() As Long
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    sql = "SELECT IsNull(max(Serial)+1, 1) FROM Stock_Invoice_" & Postfix
    Set rs = ExecuteSelect(Conn, sql, cancel)
    rs.MoveFirst
    getNextInvoiceId = rs.Fields(0)
End Function

Private Sub getPrimaryAccounts()
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    sql = "SELECT Num as id, Name AS name, Acc AS account" & vbCrLf & _
          "FROM Acc_Accounts WHERE " & vbCrLf
    Dim i As PrimaryAccountsEnum
    For i = 0 To MAX_PRIMARY
        sql = sql & "Name like '%" & PrimaryAccountsNames(i) & "%'"
        If i <> MAX_PRIMARY Then
            sql = sql & " OR" & vbCrLf
        End If
    Next
    Set rs = ExecuteSelect(Conn, sql, cancel)
    If cancel Then Exit Sub
    On Error Resume Next
    rs.MoveFirst
    If Err.Number <> 0 Then Exit Sub
    Dim pa As PrimaryAccountsEnum
    While Not rs.EOF
        pa = getPrimaryAccountByName(rs!name)
        PrimaryAccounts(pa).id = rs!id
        PrimaryAccounts(pa).name = rs!name
        PrimaryAccounts(pa).Account = rs!Account
        rs.MoveNext
    Wend
End Sub

Private Function getPrimaryAccountByName(ByVal name As String) As PrimaryAccountsEnum
    Dim i As PrimaryAccountsEnum
    For i = 0 To MAX_PRIMARY
        If InStr(1, name, PrimaryAccountsNames(i)) > 0 Then
            getPrimaryAccountByName = i
            Exit Function
        End If
    Next
    getPrimaryAccountByName = -1
End Function

Private Sub SetClientInfo(ByVal primaryAccount As PrimaryAccountsEnum)
'    TxtClientID.text = PrimaryAccounts(primaryAccount).id
'    TxtClientName.text = PrimaryAccounts(primaryAccount).name
'    TxtClientAccount.text = PrimaryAccounts(primaryAccount).Account
    TxtClientID.text = ""
    TxtClientName.text = ""
    TxtClientAccount.text = ""
End Sub

Private Sub TxtClientName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        CmdClientHelp_Click
    End If
End Sub

Private Sub TxtDiscount_Change()
    calculateTotals
End Sub

Private Sub TxtDiscountPercent_Change()
    calculateTotals
End Sub

Public Sub OnSqlSelected(ByRef dialogForm As dlgSqlSelect)
    If InStr(1, dialogForm.FrameCaption, "„— Ã⁄«  «·›« Ê—…") > 0 Then
        fg.TextMatrix(fg.Row, fg.Col) = RsSum(dialogForm.master.rs.Clone(adLockReadOnly), "qty")
    Else
        MsgBox "Œÿ√  ﬁ‰Ì  ”»» ›Ì ≈ŸÂ«— „—»⁄ «·«Œ Ì«— »œÊ‰ „⁄«·Ã… «·ﬁÌ„… «·„Œ «—…"
    End If
End Sub

Public Function RsSum(ByRef rs As ADODB.Recordset, ByVal Field As String) As Double
    RsSum = 0
    If rs.RecordCount = 0 Then
        Exit Function
    End If
    rs.MoveFirst
    While Not rs.EOF
        RsSum = RsSum + CDbl(rs.Fields(Field))
        rs.MoveNext
    Wend
End Function

Public Sub RefreshObjects()
    rsObjects.Requery
    fg.ColComboList(OBJECT_) = fg.BuildComboList(rsObjects, "Group,*Name", "Id", &HE1FEFF)
End Sub
Private Sub DisplayControls()
    Dim ctrl As Control
    For Each ctrl In Controls
        If ctrl.Container.name = masterFrame.name Then
            If ctrl.name = "Label6" Then
                If ctrl.Index = 1 Then
                    ctrl.Left = Label1.Left + Label1.Width - ctrl.Width
                ElseIf ctrl.Index <> 6 Then
                    ctrl.visible = False
                End If
            ElseIf ctrl.name = "dtInvoiceDate" Then
                ctrl.Left = TxtInvoiceId.Left + TxtInvoiceId.Width - ctrl.Width
            ElseIf ctrl.name <> "TxtDescription" And ctrl.name <> "chkmasterFrame" Then
                ctrl.visible = False
            End If
        End If
    Next
    txtDescription.Top = Shape1.Top
    Label6(6).Top = lblClient.Top
    masterFrame.Height = masterFrame.Height - Shape1.Height
    detailFrame.Top = detailFrame.Top - Shape1.Height
    Label6(2).visible = False
    Label6(7).visible = False
    LblTotalDiscount.visible = False
    LblTotalPrice.visible = False
End Sub

Private Sub TxtInvoiceId_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
