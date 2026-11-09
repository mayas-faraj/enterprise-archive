VERSION 5.00
Begin VB.Form frmStockObject 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… „«œ…"
   ClientHeight    =   4170
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9555
   Icon            =   "frmStockObject.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   4170
   ScaleWidth      =   9555
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… „«œ…"
      Height          =   3975
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   9375
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
         Width           =   9135
      End
      Begin VB.TextBox TxtCode 
         Alignment       =   1  'Right Justify
         DataField       =   "Code"
         Height          =   375
         Left            =   5880
         MaxLength       =   10
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";search=true;check=required;"
         Top             =   480
         Width           =   2265
      End
      Begin VB.TextBox TxtName 
         Alignment       =   1  'Right Justify
         DataField       =   "Name"
         Height          =   375
         Left            =   5880
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";search=true;check=required;"
         Top             =   960
         Width           =   2265
      End
      Begin VB.TextBox TxtLatinName 
         Alignment       =   1  'Right Justify
         DataField       =   "Latin_Name"
         Height          =   375
         Left            =   5880
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";search=true;check=custom;"
         Top             =   1440
         Width           =   2265
      End
      Begin VB.TextBox TxtDescription 
         Alignment       =   1  'Right Justify
         DataField       =   "Description"
         Height          =   975
         Left            =   120
         MaxLength       =   500
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         Tag             =   ";search=true;"
         Top             =   840
         Width           =   5580
      End
      Begin VB.ComboBox CbUnit 
         DataField       =   "Unit"
         ForeColor       =   &H80000012&
         Height          =   315
         Left            =   5880
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Tag             =   ";search=true;check=required;"
         Top             =   2070
         Width           =   2265
      End
      Begin VB.CommandButton CmdGroupHelp 
         BackColor       =   &H00E0E0E0&
         Caption         =   "...."
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   2400
         Width           =   325
      End
      Begin VB.TextBox TxtGroupInfo 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   445
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";check=custom;search=true;"
         Top             =   2400
         Width           =   5250
      End
      Begin VB.TextBox TxtSellPrice 
         Alignment       =   1  'Right Justify
         DataField       =   "Sell_Price"
         Height          =   375
         Left            =   5880
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";search=true;check=real>=0;check=required;"
         Top             =   2520
         Width           =   2265
      End
      Begin VB.TextBox TxtMinQty 
         Alignment       =   1  'Right Justify
         DataField       =   "Min_Qty"
         Height          =   375
         Left            =   5880
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";check=real>0;check=required;"
         Top             =   3000
         Width           =   2265
      End
      Begin VB.TextBox TxtMaxQty 
         Alignment       =   1  'Right Justify
         DataField       =   "Max_Qty"
         Height          =   375
         Left            =   5880
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";check=real>0;check=custom;check=required;"
         Top             =   3480
         Width           =   2265
      End
      Begin VB.TextBox TxtAveragePrice 
         Alignment       =   1  'Right Justify
         DataField       =   "Average_Price"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2280
         Locked          =   -1  'True
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   3000
         Width           =   2265
      End
      Begin VB.TextBox TxtLastSellPrice 
         Alignment       =   1  'Right Justify
         DataField       =   "Last_Buy_Price"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2280
         Locked          =   -1  'True
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   3480
         Width           =   2265
      End
      Begin VB.CommandButton CmdUnits 
         BackColor       =   &H00E0E0E0&
         Caption         =   "«·Ê«Õœ« "
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   3000
         Width           =   1665
      End
      Begin VB.CommandButton CmdObjectTransaction 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Õ—ﬂ… «·„«œ…"
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   3480
         Width           =   1665
      End
      Begin VB.TextBox TxtGroupId 
         Alignment       =   1  'Right Justify
         DataField       =   "Group"
         Height          =   375
         Left            =   4440
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   2160
         Visible         =   0   'False
         Width           =   465
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "—„“ «·„«œ…"
         Height          =   255
         Index           =   0
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   480
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·„«œ…"
         Height          =   255
         Index           =   1
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·«”„ «··« Ì‰Ì"
         Height          =   255
         Index           =   2
         Left            =   8040
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   1560
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Ê’› «·„«œ…"
         Height          =   255
         Index           =   3
         Left            =   4800
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   540
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÊÕœ…"
         Height          =   255
         Index           =   5
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   2100
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "”⁄— ¬Œ— ‘—«¡"
         Height          =   255
         Index           =   6
         Left            =   4560
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   3540
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "”⁄— «·„»Ì⁄"
         Height          =   255
         Index           =   7
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   2580
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·Õœ «·√⁄·Ï"
         Height          =   255
         Index           =   10
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   3540
         Width           =   855
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000000&
         BorderWidth     =   2
         X1              =   120
         X2              =   9135
         Y1              =   1920
         Y2              =   1920
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·„Ã„Ê⁄…"
         Height          =   255
         Index           =   4
         Left            =   4800
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   2100
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·”⁄— «·Ê”ÿÌ"
         Height          =   255
         Index           =   8
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   3060
         Width           =   1335
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«·Õœ «·√œ‰Ï"
         Height          =   255
         Index           =   9
         Left            =   8280
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   3060
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmStockObject"
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

Dim isDirty As Boolean
Dim WithEvents dlgGroups As dlgStockGroupSelect
Attribute dlgGroups.VB_VarHelpID = -1

Private Sub CmdGroupHelp_Click()
    Set dlgGroups = New dlgStockGroupSelect
    dlgGroups.Show 1
End Sub

Private Sub CmdObjectTransaction_Click()
    If (master.rs.RecordCount = 0) Or IsNull(master.rs!id) Then
        MsgBox "⁄·Ìﬂ ≈÷«›… „«œ… √Ê·«° À„ ÿ·»  ﬁ—Ì— Õ—ﬂ«  Â–Â «·„«œ….", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ—ﬂ… „«œ…"
        Exit Sub
    End If
    ShowStockObjectStatusReport master.rs!id, master.rs!name
End Sub

Private Sub CmdUnits_Click()
    MDIMain.mnuStockUnits_Click
    While MDIMain.ActiveForm.name <> Me.name
        DoEvents
    Wend
    CbUnit.Clear
    fillCmb CbUnit, "SELECT Id, Name FROM Stock_Unit"
    If master.State And (ST_ADDNEW Or ST_UPDATE) Then
        CbUnit.ListIndex = CbUnit.ListCount - 1
    End If
End Sub

Private Sub dlgGroups_OnClosingDialog(theGrid As VSFlex7Ctl.VSFlexGrid, Cancel As Boolean)
    If dlgGroups.Result Then
        Dim R As Long
        R = theGrid.Row
        '<AHMAD>
            If theGrid.Rows <= 2 Or theGrid.Row = 0 Or val(theGrid.TextMatrix(R, 3)) = 0 Then Exit Sub
        '</AHMAD>
        SetGroupId theGrid.TextMatrix(R, 3)
        SetGroupName theGrid.TextMatrix(R, 0)
    End If
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Stock"
    SelectFrame Me, ActiveFrame
    RefreshCommands btnSettings And FormSettings
    '<AHMAD>
'    If (master.State And (ST_UPDATE Or ST_ADDNEW)) <> 0 Then
'        Dim op As String
'        op = "'ÃœÌœ'"
'        If (master.State And ST_UPDATE) <> 0 Then op = "' ⁄œÌ·'"
'        MsgBox "»”»» «— »«ÿ »ÿ«ﬁ… „«œ… »⁄œ… »ÿ«ﬁ«  √Œ—Ï° ·–·ﬂ ”Ì „ ≈·€«¡ ⁄„·Ì… " & op & " «·Õ«·Ì…° Ê” „  ÕœÌÀ „Õ ÊÏ «·»ÿ«ﬁ….", vbOKOnly Or vbInformation Or vbMsgBoxRight Or vbMsgBoxRtlReading, " ‰»ÌÂ"
'        master.CancelSave
'    End If
    'master.rs.Requery
    InitFrame
    '</AHMAD>
'    If (master.rs.RecordCount = 0) Then
'        master.addNew
'    End If
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9675
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    
    master.TraceChanges = True
    
    Dim Cancel As Boolean
    Dim Sql As String
    Sql = "SELECT * FROM Stock_Object"
    Set master.rs = ExecuteSelect(Conn, Sql, Cancel)
    
    InitFrame
    
    Set ActiveFrame = masterFrame
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    
    isDirty = False
    
    fillCmb CbUnit, "SELECT Id, Name FROM Stock_Unit"

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
    Dim isVertical As Boolean
    Dim W As Single
    For Each ctrl In Me.Controls
        If TypeOf ctrl Is Line Then
            isVertical = (ctrl.x1 = ctrl.X2)
            If isVertical Then
                ctrl.x1 = ctrl.x1 * Alpha
                ctrl.X2 = ctrl.x1
            Else
                W = Alpha * (ctrl.X2 - ctrl.x1)
                ctrl.x1 = ctrl.x1 * Alpha
                ctrl.X2 = ctrl.x1 + W
            End If
        Else
            ctrl.Left = ctrl.Left * Alpha
            ctrl.Width = ctrl.Width * Alpha
        End If
    Next
    oldScaleWidth = ScaleWidth
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    TxtGroupInfo.text = ""
    CmdObjectTransaction.Enabled = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
    CmdObjectTransaction.Enabled = True
End Sub

Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, Cancel As Boolean)
    MsgBox "·« Ìı„ﬂ‰ﬂ Õ–› Â–Â «·„«œ… »”»» ÊÃÊœ ›Ê« Ì— „— »ÿ… »Â«.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading Or vbMsgBoxRight, "Œÿ√ √À‰«¡ «·Õ–›"
    Cancel = True
End Sub

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    ' Get Group
    Dim rsGroup As ADODB.Recordset
    Set rsGroup = getGroupByWhereClause("Id = " & rs!group)
    rsGroup.MoveFirst
    TxtGroupInfo.text = rsGroup!name
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    CmdObjectTransaction.Enabled = True
End Sub

Private Sub master_doSaveError(ByVal State As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
    msg = " Õﬁﬁ „‰ ⁄œ„ ÊÃÊœ „«œ… √Œ—Ï ·Â« «·—„“ √Ê «·«”„ –« Â."
    KeepState = True
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    If TxtGroupInfo.text <> "" Then
        Dim rsGroup As ADODB.Recordset
        Set rsGroup = getGroupByWhereClause("Name like '%" & TxtGroupInfo.text & "%'")
        If rsGroup.RecordCount = 0 Then
            S = "Group=-1"
            DefaultType = 0
            Exit Sub
        End If
        rsGroup.MoveFirst
        S = ""
        While Not rsGroup.EOF
            S = S & "Group=" & rsGroup!id & " Or "
            rsGroup.MoveNext
        Wend
        If S <> "" Then
            S = "(" & Left(S, Len(S) - Len(" Or ")) & ")"
        End If
        DefaultType = 1
    End If
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    Dim i As Long
    Dim c As String
    Dim choice As VbMsgBoxResult
    
    If ctrl.name = TxtLatinName.name Then
        If TxtLatinName.text = "" Then Exit Sub
        i = 1
        msg = "ÌÃ» ≈œŒ«· √Õ—› ·« Ì‰Ì… ›ﬁÿ ›Ì Â–« «·Õﬁ·."
        While i <= Len(TxtLatinName.text)
            c = Mid(TxtLatinName, i, 1)
            checkType = (c = " ")
            checkType = checkType Or (c >= "a" And c <= "z")
            checkType = checkType Or (c >= "A" And c <= "Z")
            checkType = checkType Or (c >= "0" And c <= "9")
            checkType = Not checkType
            If checkType Then Exit Sub
            i = i + 1
        Wend
        Exit Sub
    End If
    
    If ctrl.name = TxtGroupInfo.name Then
        If Trim(TxtGroupId.text) = "" And Trim(TxtGroupInfo.text) = "" Then
            choice = MsgBox("·„  Õœœ «·„Ã„Ê⁄…° Â·  —Ìœ «Œ Ì«— «·„Ã„Ê⁄… „‰ ﬁ«∆„… «·„Ã„Ê⁄« ø", vbQuestion Or vbOKCancel Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·„Ã„Ê⁄…")
        Else
            Dim G_Name As String
            If TxtGroupId.text <> "" Then
                G_Name = getGroupNameById(TxtGroupId.text)
                If TxtGroupInfo.text <> G_Name Then
                    choice = MsgBox("·ﬁœ ﬁ„  » ⁄œÌ· «”„ «·„Ã„Ê⁄…° Â·  —Ìœ «⁄ „«œ «·«”„ «·Õ«·Ìø", vbQuestion Or vbOKCancel Or vbMsgBoxRight Or vbMsgBoxRtlReading, "«·„Ã„Ê⁄…")
                    If choice = vbOK Then
                        TxtGroupId.text = ""
                    Else
                        TxtGroupInfo.text = G_Name
                    End If
                Else
                    choice = vbCancel
                End If
            Else
                choice = vbOK
            End If
        End If
        If choice = vbOK Then
            getGroupByInfo
        End If
        If Trim(TxtGroupId.text) = "" Then
            msg = "⁄·Ìﬂ «Œ Ì«— «·„Ã„Ê⁄… «· Ì  —Ìœ  ’‰Ì› «·„«œ… ÷„‰Â«."
            checkType = True
        End If
        Exit Sub
    End If
    
    If ctrl.name = TxtMaxQty.name Then
        If Trim(TxtMaxQty.text) = "" Then Exit Sub
        i = val(Trim(TxtMaxQty.text))
        If Trim(TxtMinQty.text) = "" Then Exit Sub
        msg = "ÌÃ» √‰ ÌﬂÊ‰ «·Õœ «·√⁄·Ï √ﬂ»— „‰ «·Õœ «·√œ‰Ï"
        checkType = val(Trim(TxtMaxQty.text)) < val(Trim(TxtMinQty.text))
        Exit Sub
    End If
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Public Sub SetGroupId(val As String)
    TxtGroupId.text = val
End Sub

Public Sub SetGroupName(val As String)
    TxtGroupInfo.text = val
End Sub

Private Sub getGroupByInfo()
    TxtGroupId.text = ""
    Dim rsGroup As ADODB.Recordset
    Set rsGroup = getGroupByWhereClause("Name like '%" & TxtGroupInfo.text & "%'")
    If rsGroup.RecordCount <> 1 Then
        CmdGroupHelp_Click
        Exit Sub
    End If
    rsGroup.MoveFirst
    TxtGroupId.text = rsGroup!id
    TxtGroupInfo.text = rsGroup!name
End Sub

Private Function getGroupNameById(ByVal id As String) As String
    Dim rsGroup As ADODB.Recordset
    Set rsGroup = getGroupByWhereClause("Id = " & id)
    If rsGroup.RecordCount <> 1 Then
        getGroupNameById = ""
    Else
        rsGroup.MoveFirst
        getGroupNameById = rsGroup!name
    End If
End Function

Private Function getGroupByWhereClause(ByVal Where As String) As ADODB.Recordset
    Dim SqlGroup As String
    Dim Cancel As Boolean
    SqlGroup = "SELECT * FROM Stock_Group WHERE " & Where
    Set getGroupByWhereClause = ExecuteSelect(Conn, SqlGroup, Cancel)
End Function

' Show Report StockObjectStatus Õ—ﬂ… „«œ…
Public Sub ShowStockObjectStatusReport(ByVal id As Integer, ByVal name As String)
    
    Dim rpt As New DRStockObjectsStatus
    
    ' Set object name
    Get_DataReport_Label_byName(rpt, 1, "lblObjectName").Caption = name
    
    ' Get object metrics
    Dim mns, mnb, mxs, mxb, avs, avb As String
    Dim rs As ADODB.Recordset
    Dim Cancel As Boolean
    Dim Sql As String
    Sql = "SELECT * FROM vStock_Prices WHERE Object = " & master.rs!id
    Set rs = ExecuteSelect(Conn, Sql, Cancel)
    If rs.RecordCount <> 0 Then
        rs.MoveFirst
        While Not rs.EOF
            If rs!Type = 1 Then
                mxb = rs!Max_Price
                mnb = rs!Min_Price
                avb = rs!Average_Price
            ElseIf rs!Type = 2 Then
                mxs = rs!Max_Price
                mns = rs!Min_Price
                avs = rs!Average_Price
            End If
            rs.MoveNext
        Wend
    End If
    
    Get_DataReport_Label_byName(rpt, 1, "lblBranchName").Caption = "›—⁄ „Õ«›Ÿ… " & Current_State.name
    Get_DataReport_Label_byName(rpt, 1, "lblBranchPhone").Caption = Current_State.Phone
    Get_DataReport_Label_byName(rpt, 1, "lblMin2").Caption = mns
    Get_DataReport_Label_byName(rpt, 1, "lblMax2").Caption = mxs
    Get_DataReport_Label_byName(rpt, 1, "lblAverage2").Caption = avs
    Get_DataReport_Label_byName(rpt, 1, "lblMin1").Caption = mnb
    Get_DataReport_Label_byName(rpt, 1, "lblMax1").Caption = mxb
    Get_DataReport_Label_byName(rpt, 1, "lblAverage1").Caption = avb
     Get_DataReport_Label_byName(rpt, 1, "lblUnit").Caption = CbUnit.text
    
    
    Set rs = ExecuteSelect(Conn, "SELECT * FROM fn_ObjectStatus(" & id & ")", Cancel)
    If rs.RecordCount = 0 Then
        MsgBox "·«  ÊÃœ Õ—ﬂ«  ⁄·Ï Â–Â «·„«œ….", vbInformation Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Õ—ﬂ… „«œ…"
    End If
    Set rpt.DataSource = rs
    rpt.Show 1
    Set rpt = Nothing
End Sub

Private Sub TxtMaxQty_KeyPress(KeyAscii As Integer)
    '<AHMAD>
        KeyAscii = Prevent_char(KeyAscii)
    '</AHMAD>
End Sub
Private Sub TxtMinQty_KeyPress(KeyAscii As Integer)
    '<AHMAD>
        KeyAscii = Prevent_char(KeyAscii)
    '</AHMAD>
End Sub
Private Sub TxtSellPrice_KeyPress(KeyAscii As Integer)
'<AHMAD>
    KeyAscii = Prevent_char(KeyAscii)
'</AHMAD>
End Sub
