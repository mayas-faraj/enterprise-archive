VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmBranch_Recive 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”Ã· «·Ê«—œ «·⁄«„ («·›—⁄)"
   ClientHeight    =   4215
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9420
   Icon            =   "frmBranch_Recive.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   4215
   ScaleWidth      =   9420
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ã· «·Ê«—œ «·⁄«„ («·›—⁄)"
      Height          =   4215
      Left            =   30
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Tag             =   "master"
      Top             =   -15
      Width           =   9375
      Begin VB.TextBox txtMessage_No 
         Alignment       =   1  'Right Justify
         DataField       =   "Message_No"
         Height          =   375
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   0
         TabStop         =   0   'False
         Tag             =   ";search=true;check=required;"
         Top             =   1320
         Width           =   1575
      End
      Begin MSComCtl2.DTPicker dtMessage_Date 
         DataField       =   "Message_Date"
         Height          =   375
         Left            =   3480
         TabIndex        =   1
         Tag             =   ";search=true;check=required;check=date;check=custom;"
         Top             =   1320
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40100
      End
      Begin VB.TextBox txtBranch_Recive_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Branch_Recive_ID"
         Height          =   375
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   6
         TabStop         =   0   'False
         Tag             =   ";search=true;"
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
         TabIndex        =   10
         Top             =   240
         Width           =   9135
      End
      Begin VB.TextBox txtMessage_Text 
         Alignment       =   1  'Right Justify
         DataField       =   "Message_Text"
         Height          =   1215
         Left            =   360
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Tag             =   ";search=true;;check=required;"
         Top             =   2040
         Width           =   7695
      End
      Begin VB.TextBox txtDestination 
         Alignment       =   1  'Right Justify
         DataField       =   "Destination"
         Height          =   375
         Left            =   3960
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;check=required;"
         Top             =   3600
         Width           =   4095
      End
      Begin MSComCtl2.DTPicker dtRecive_Date 
         DataField       =   "Recive_Date"
         Height          =   375
         Left            =   360
         TabIndex        =   2
         Tag             =   ";search=true;check=required;check=date;check=custom;"
         Top             =   1320
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40100
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·Ê—Êœ"
         Height          =   195
         Left            =   2475
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   "search=true;"
         Top             =   1410
         Width           =   840
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·»—Ìœ"
         Height          =   195
         Left            =   8175
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   "search=true;"
         Top             =   1410
         Width           =   1005
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·„ ”·”·"
         Height          =   195
         Left            =   8160
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   "search=true;"
         Top             =   690
         Width           =   1020
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·»—Ìœ"
         Height          =   195
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   "search=true;"
         Top             =   1410
         Width           =   780
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·»Ì«‰"
         Height          =   195
         Left            =   8490
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   2130
         Width           =   375
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÃÂ…"
         Height          =   195
         Left            =   8430
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   3690
         Width           =   480
      End
   End
End
Attribute VB_Name = "frmBranch_Recive"
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
    oldScaleWidth = 9540
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from Branch_Recive order by 1", cancel)
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
    txtMessage_No.SetFocus
    dtMessage_Date.Value = True
    dtMessage_Date.Value = Date - 10
    dtRecive_Date.Value = tru
    dtRecive_Date.Value = Date
End Sub
Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    txtBranch_Recive_ID.text = rs.Fields(0).Value
End Sub

Private Sub master_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    If dtMessage_Date.Value > dtRecive_Date.Value Then
        msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ «·»—Ìœ √’€— √Ê Ì”«ÊÌ  «—ÌŒ «·Ê—Êœ "
        checkType = True
    End If
End Sub
Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
Private Sub txtBranch_Recive_ID_KeyPress(KeyAscii As Integer)
     If master.state <> ST_SEARCH Then
        KeyAscii = 0
    Else
        If Chr(KeyAscii) Like "[!0-9]" Then
            KeyAscii = 0
        End If
    End If
End Sub
