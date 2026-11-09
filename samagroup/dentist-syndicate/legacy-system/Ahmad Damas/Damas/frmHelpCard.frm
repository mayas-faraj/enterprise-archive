VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmHelpCard 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»ÿ«ﬁ… ≈⁄«‰…"
   ClientHeight    =   5685
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9555
   Icon            =   "frmHelpCard.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   5685
   ScaleWidth      =   9555
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… ≈⁄«‰…"
      Height          =   5490
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   90
      Width           =   9375
      Begin VB.TextBox txtHelpCard_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "HelpCard_ID"
         Height          =   375
         Left            =   5445
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Tag             =   ";search=true;"
         Top             =   540
         Width           =   2550
      End
      Begin VB.TextBox txtTotal 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         DataField       =   "Total"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   405
         Left            =   270
         Locked          =   -1  'True
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   4815
         Width           =   3135
      End
      Begin VB.TextBox txtHelp_Amount 
         Alignment       =   1  'Right Justify
         DataField       =   "Help_Amount"
         Height          =   375
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Tag             =   ";check=required;new=0;"
         Top             =   4845
         Width           =   3000
      End
      Begin VB.TextBox txtTreatment_Cost 
         Alignment       =   1  'Right Justify
         DataField       =   "Treatment_Cost"
         Height          =   375
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";check=required;new=0;"
         Top             =   4230
         Width           =   3000
      End
      Begin VB.TextBox txtWorkbreakdown 
         Alignment       =   1  'Right Justify
         DataField       =   "WorkDown_Cost"
         Height          =   375
         Left            =   270
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";check=required;new=0;"
         Top             =   4230
         Width           =   3135
      End
      Begin VB.TextBox txtPayOrder_No 
         Alignment       =   1  'Right Justify
         DataField       =   "PayOrder_No"
         Height          =   375
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";check=required;"
         Top             =   3615
         Width           =   3000
      End
      Begin VB.TextBox txtMail_No 
         Alignment       =   1  'Right Justify
         DataField       =   "Mail_No"
         Height          =   375
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";check=required;"
         Top             =   3015
         Width           =   3000
      End
      Begin VB.TextBox txtDoctor_Name 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_Name"
         Height          =   375
         Left            =   270
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";check=required;search=true;"
         Top             =   1155
         Width           =   3135
      End
      Begin VB.TextBox txtDoctor_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Doctor_ID"
         Height          =   375
         Left            =   5445
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;check=integer>0;check=required;check=custom;"
         Top             =   1125
         Width           =   2550
      End
      Begin VB.TextBox txtCurer 
         Alignment       =   1  'Right Justify
         DataField       =   "Curer"
         Height          =   375
         Left            =   270
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   2340
         Width           =   7725
      End
      Begin VB.CommandButton cmdSelectDoctor 
         Caption         =   "..."
         Height          =   375
         Left            =   4860
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   1140
         Width           =   510
      End
      Begin VB.ComboBox cmbHelp_Type 
         DataField       =   "Help_Type"
         Height          =   315
         ItemData        =   "frmHelpCard.frx":1CFA
         Left            =   4860
         List            =   "frmHelpCard.frx":1D0A
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   ";search=true;check=required;"
         Top             =   1785
         Width           =   3135
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
         Width           =   9135
      End
      Begin MSComCtl2.DTPicker dtFrom 
         DataField       =   "HelpCard_Date"
         Height          =   315
         Left            =   270
         TabIndex        =   28
         Top             =   1785
         Width           =   3135
         _ExtentX        =   5530
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   57671683
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtTo 
         DataField       =   "Mail_Date"
         Height          =   375
         Left            =   270
         TabIndex        =   29
         Top             =   3015
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   57671683
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtPayOrder_Date 
         DataField       =   "PayOrder_Date"
         Height          =   375
         Left            =   270
         TabIndex        =   30
         Top             =   3615
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   57671683
         CurrentDate     =   40139
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «· ”·”·Ì"
         Height          =   195
         Left            =   8175
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   660
         Width           =   1050
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·≈Ã„«·Ì"
         Height          =   195
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   ";search=true;"
         Top             =   4890
         Width           =   1290
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ﬁÌ„… «·≈⁄«‰…"
         Height          =   195
         Left            =   8250
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   ";search=true;"
         Top             =   4920
         Width           =   795
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· ⁄ÿ· ⁄‰ «·⁄„·"
         Height          =   195
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   4335
         Width           =   1290
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰›ﬁ… «·⁄·«Ã"
         Height          =   195
         Left            =   8265
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";search=true;"
         Top             =   4335
         Width           =   765
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ √„— «·’—›"
         Height          =   195
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   3690
         Width           =   1290
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ √„— «·’—›"
         Height          =   195
         Left            =   8145
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";search=true;"
         Top             =   3690
         Width           =   1005
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÿ»Ì» «·„⁄«·Ã √Ê «·„‘›Ï"
         Height          =   465
         Left            =   8235
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";search=true;"
         Top             =   2295
         Width           =   1020
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·ÿ»Ì»"
         Height          =   195
         Left            =   8340
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   1260
         Width           =   720
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ »—Ìœ «·„—ﬂ“Ì…"
         Height          =   195
         Left            =   8055
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";search=true;"
         Top             =   3090
         Width           =   1185
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«”„ «·ÿ»Ì»"
         Height          =   195
         Left            =   3780
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1260
         Width           =   765
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ »—Ìœ «·„—ﬂ“Ì…"
         Height          =   195
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   3090
         Width           =   1290
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ"
         Height          =   195
         Left            =   3960
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=true;"
         Top             =   1845
         Width           =   495
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰Ê⁄  «·„”«⁄œ…"
         Height          =   195
         Left            =   8205
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;"
         Top             =   1845
         Width           =   1005
      End
   End
End
Attribute VB_Name = "frmHelpCard"
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
Dim Doctor_checked  As Boolean

Sub Select_Doctor()
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    
    Doctor_checked = False
    
    ActiveDatabaseName = "Defualt"
    
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
          ElseIf rs.RecordCount = 1 Then
                    txtDoctor_ID.text = rs.Fields("ID").Value
                    txtDoctor_Name.text = rs.Fields("Name").Value
                    Doctor_checked = True
                    Exit Sub
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
End Sub

Sub Set_Doctor_Name(Value As String)
    txtDoctor_Name.text = Value
End Sub

Private Sub cmdSelectDoctor_Click()
    txtDoctor_ID_Validate False
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
     ActiveDatabaseName = "tadamonfari"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 9675
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    ActiveDatabaseName = "tadamonfari"
    Set master.rs = ExecuteSelect(Conn, "Select * From vHelpCard Order by HelpCard_id", cancel)
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
'    Dim i As Integer
'    Dim W As Long
'    Dim totWidth As Long
'    totWidth = 0
'    For i = 0 To fg.Cols - 1
'        totWidth = totWidth + fg.ColWidth(i)
'    Next
'    For i = 0 To fg.Cols - 1
'        fg.ColWidth(i) = (fg.Width - 400) * fg.ColWidth(i) / totWidth
'    Next
    
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
    cmbHelp_Type.ListIndex = 0
    txtTreatment_Cost.text = 0
    txtHelp_Amount.text = 0
    txtWorkbreakdown.text = 0
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    txtDoctor_Name.datafield = "Doctor_Name"
    txtTotal.datafield = "Total"
    If rs.RecordCount = 0 Then Exit Sub
    Dim HelpCard_ID As Long
    If master.state = ST_UPDATE Then
        HelpCard_ID = rs!HelpCard_ID
        If HelpCard_ID <> 0 Then
            rs.Requery
            rs.Find "HelpCard_ID = " & HelpCard_ID
            If IsNull(rs!Doctor_Name) Or IsNull(rs!Total) Then Exit Sub
            txtDoctor_Name.text = rs!Doctor_Name
            txtTotal.text = rs!Total
        End If
    End If

    
End Sub

Private Sub master_doDeleteCompleted(rs As ADODB.Recordset)
    txtDoctor_Name.datafield = "Doctor_Name"
    txtTotal.datafield = "Total"
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    Dim sql As String
    Dim cancel As Boolean
    If rs.RecordCount = 0 Then Exit Sub
    sql = "Select * from vHelpCard Where HelpCard_id = " & rs!HelpCard_ID
    Set DrHelp_Card.DataSource = ExecuteSelect(Conn, sql, cancel)
    Get_DataReport_Label_byName(DrHelp_Card, 1, "lblState_Name").Caption = Current_State.FullName
    DrHelp_Card.Show 1
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    txtHelpCard_ID.datafield = ""
    txtDoctor_Name.datafield = ""
    txtTotal.datafield = ""
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    txtHelpCard_ID.datafield = "HelpCard_ID"
    txtHelpCard_ID.text = rs!HelpCard_ID
    txtDoctor_Name.datafield = "Doctor_Name"
    txtTotal.datafield = "Total"
End Sub


Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    cmbHelp_Type.SetFocus
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If ctrl = txtDoctor_ID Then
        Select_Doctor
        If Not Doctor_checked Then
            msg = "«·ﬁÌ„… «·„œŒ·… ›Ì Â–« «·Õﬁ· €Ì— „ﬁ»Ê·…"
            checkType = True
        End If
    End If
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtDoctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        txtDoctor_ID_Validate False
        Exit Sub
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub


Private Sub txtDoctor_ID_Validate(cancel As Boolean)
    Select_Doctor
    cancel = Not Doctor_checked
End Sub

Private Sub txtHelp_Amount_Change()
    txtTotal.text = val(txtTreatment_Cost.text) + val(txtHelp_Amount.text) + val(txtWorkbreakdown.text)
End Sub

Private Sub txtHelp_Amount_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtHelpCard_ID_KeyPress(KeyAscii As Integer)
    If master.state <> ST_SEARCH Then
        KeyAscii = 0
    Else
        KeyAscii = Prevent_char(KeyAscii)
    End If
End Sub

Private Sub txtTreatment_Cost_Change()
    txtTotal.text = val(txtTreatment_Cost.text) + val(txtHelp_Amount.text) + val(txtWorkbreakdown.text)
End Sub

Private Sub txtTreatment_Cost_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtWorkbreakdown_Change()
    txtTotal.text = val(txtTreatment_Cost.text) + val(txtHelp_Amount.text) + val(txtWorkbreakdown.text)
End Sub

Private Sub txtWorkbreakdown_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub




Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
    Dim i As Integer
    Dim c As Boolean
    Dim sql As String
    
'    '************Delete Record from the table

    Dim step As Integer

    On Error GoTo errHandler

    step = 0

    ExecuteCommand Conn, "Delete from HelpCard where HelpCard_ID = " & rs!HelpCard_ID, c
    
    Set master.rs = Nothing
    
    sql = "Select * from vHelpCard Order by 1 "
    
    
    Set master.rs = ExecuteSelect(Conn, sql, c)
    
    master_doDeleteCompleted rs
    
    If Not master.rs.EOF Then
        master.MoveFirst
    Else
        txtCurer.text = ""
        txtDoctor_ID.text = ""
        txtDoctor_Name.text = ""
        txtMail_No.text = ""
        txtPayOrder_No.text = ""
        txtTreatment_Cost.text = 0
        txtWorkbreakdown.text = 0
        txtTotal.text = 0
        txtHelp_Amount.text = 0
    End If

'    master_doDeleteCompleted rs
'
'    rs.MoveNext
'
'    If rs.RecordCount > 0 Then
'        rs.MoveFirst
'    Else
'        master.addNew
'    End If

    cancel = True
    Exit Sub

errHandler:
    If step <> 0 Then
        Err.Raise Err.Number
        Exit Sub
    End If
    cancel = False
    rs.CancelUpdate
    Call master_doDeleteError(rs, Err, cancel)
    If Not cancel Then
        MsgBox "Õ’· Œÿ√ √À‰«¡ ⁄„·Ì… «·Õ–›° Õ«Ê· „—… √Œ—Ï Ê›Ì Õ«·  ﬂ—«— «·Œÿ√° «·—Ã«¡ «·« ’«· »„Ê“⁄ «·»—‰«„Ã.", vbCritical Or vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading, "Œÿ√ —ﬁ„ " & Err.Number
    End If
    
End Sub



Private Sub master_doDeleteError(rs As ADODB.Recordset, ErrorObeject As ErrObject, cancel As Boolean)
    If cancel Then Exit Sub
    MsgBox "·« Ì„ﬂ‰ﬂ Õ–› Â–« «·”Ã· »”»» ÊÃÊœ „⁄·Ê„«  √Œ—Ï „— »ÿ… »Â.", vbCritical Or vbOKOnly Or vbMsgBoxRtlReading, "⁄„·Ì… „„‰Ê⁄…"
    cancel = True
End Sub
