VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCentral_Mail 
   BackColor       =   &H00E1FEFF&
   ClientHeight    =   7815
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9555
   Icon            =   "frmCentral_Mail.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7815
   ScaleWidth      =   9555
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Height          =   7365
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   "master"
      Top             =   45
      Width           =   9375
      Begin VB.TextBox txtMessage_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Message_ID"
         Height          =   375
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   3
         TabStop         =   0   'False
         Tag             =   ";search=true;check=Integer > 0;"
         Top             =   600
         Width           =   1575
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
         TabIndex        =   4
         Top             =   240
         Width           =   9135
      End
      Begin VB.TextBox txtMessage_Body 
         Alignment       =   1  'Right Justify
         DataField       =   "Message_Body"
         Height          =   5775
         Left            =   360
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Tag             =   ";search=true;"
         Top             =   1320
         Width           =   7695
      End
      Begin MSComCtl2.DTPicker dtMessage_Date 
         DataField       =   "Message_Date"
         Height          =   375
         Left            =   360
         TabIndex        =   0
         Tag             =   ";search=true;check=date;"
         Top             =   600
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40100
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰’ «·—”«·…"
         Height          =   195
         Left            =   8175
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";search=true;"
         Top             =   1320
         Width           =   990
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·„ ”·”·"
         Height          =   195
         Left            =   8160
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";search=true;"
         Top             =   690
         Width           =   1020
      End
      Begin VB.Label lblMessage_Date 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·—”«·…"
         Height          =   195
         Left            =   2460
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";search=true;"
         Top             =   720
         Width           =   900
      End
   End
End
Attribute VB_Name = "frmCentral_Mail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Dim oldScaleWidth As Long
Public Mail_Type As Mail_Type
Sub InitFrame()

End Sub
Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
     ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    Dim cancel As Boolean
    Dim sql As String
    Dim Table_Name As String
    
    oldScaleWidth = 9675
    
    If Mail_Type = Sent Then
        FormSettings = btall - btUpdate - btDelete
        btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
        Table_Name = "Central_Mail_Sent"
        Caption = "«·—”«∆· «·„—”·… ≈·Ï «·‰ﬁ«»… «·„—ﬂ“Ì…"
    Else
        FormSettings = btall - btCancel - btsave - btnew - btUpdate - btDelete
        btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
        Table_Name = "Central_Mail_Received"
        Caption = "«·—”«∆· «·Ê«—œ… „‰ «·‰ﬁ«»… «·„—ﬂ“Ì…"
    End If
    
    masterFrame.Caption = Caption
    
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    sql = " Select * from " & Table_Name & " Order by 1"
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    InitFrame
    Set ActiveFrame = masterFrame
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
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    txtMessage_ID.Enabled = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    txtMessage_ID.Enabled = True
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If rs.RecordCount = 0 Then Exit Sub
    Set DRCentral_Mail.DataSource = rs
    Get_DataReport_Label_byName(DRCentral_Mail, 1, "lblState_Name").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DRCentral_Mail, 1, "lblID").Caption = rs!Message_ID
    Get_DataReport_Label_byName(DRCentral_Mail, 1, "lblDate").Caption = rs!Message_Date
    If Mail_Type = Recived Then
        Get_DataReport_Label_byName(DRCentral_Mail, 1, "lblType").Caption = "—”«·… Ê«—œ… „‰ «·‰ﬁ«»…"
    Else
        Get_DataReport_Label_byName(DRCentral_Mail, 1, "lblType").Caption = "—”«·… „—”·… „‰ «·‰ﬁ«»…"
    End If
    DRCentral_Mail.Show 1
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    txtMessage_ID.Enabled = True
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    If master.SaveAfterWhat = ST_ADDNEW Then
        txtMessage_ID.text = master.rs!Message_ID
    End If
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    txtMessage_ID.Enabled = False
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
Private Sub txtTabib_Recive_ID_Change()
     If master.state <> ST_SEARCH Then
        KeyAscii = 0
    Else
        If Chr(KeyAscii) Like "[!0-9]" Then
            KeyAscii = 0
        End If
    End If
End Sub
