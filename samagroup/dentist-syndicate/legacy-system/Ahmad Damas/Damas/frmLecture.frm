VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmLecture 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·„Õ«÷—«  Ê«·‰œÊ«  «·⁄·„Ì…"
   ClientHeight    =   7695
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9405
   Icon            =   "frmLecture.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7695
   ScaleWidth      =   9405
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·„Õ«÷—«  Ê«·‰œÊ«  «·⁄·„Ì…"
      Height          =   7695
      Left            =   30
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Tag             =   "master"
      Top             =   0
      Width           =   9375
      Begin VB.TextBox txtNotes 
         Alignment       =   1  'Right Justify
         DataField       =   "Notes"
         Height          =   375
         Left            =   2160
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   2280
         Width           =   5775
      End
      Begin VB.TextBox txtTitle 
         Alignment       =   1  'Right Justify
         DataField       =   "Lecture_Title"
         Height          =   375
         Left            =   165
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Tag             =   ";search=true;check=required;"
         Top             =   1240
         Width           =   7755
      End
      Begin VB.TextBox txtCrowd_Count 
         Alignment       =   1  'Right Justify
         DataField       =   "Crowd_Count"
         Height          =   375
         Left            =   180
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";check=integer>0;check=required;"
         Top             =   2295
         Width           =   855
      End
      Begin VB.TextBox txtLecture_Place 
         Alignment       =   1  'Right Justify
         DataField       =   "Lecture_Place"
         Height          =   375
         Left            =   5070
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";search=true;check=required;"
         Top             =   1760
         Width           =   2850
      End
      Begin VB.TextBox txtLecturer 
         Alignment       =   1  'Right Justify
         DataField       =   "Lecturer"
         Height          =   375
         Left            =   165
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;check=required;"
         Top             =   1725
         Width           =   3015
      End
      Begin MSComCtl2.DTPicker dtLecture_Date 
         DataField       =   "Lecture_Date"
         Height          =   375
         Left            =   180
         TabIndex        =   1
         Tag             =   ";check=date;search=true;"
         Top             =   720
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   661
         _Version        =   393216
         Format          =   57475073
         CurrentDate     =   38244
      End
      Begin VB.TextBox txtLecture_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Lecture_ID"
         Height          =   375
         Left            =   5070
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   ";search=true;check=Integer > 0;"
         Top             =   720
         Width           =   2850
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
         TabIndex        =   11
         Top             =   240
         Width           =   9135
      End
      Begin VB.TextBox txtLecture_Body 
         Alignment       =   1  'Right Justify
         DataField       =   "Lecture_Body"
         Height          =   4455
         Left            =   120
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         Tag             =   ";search=true;check=required;"
         Top             =   3000
         Width           =   9135
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„·«ÕŸ« "
         Height          =   195
         Left            =   8100
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   2370
         Width           =   1020
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄‰Ê«‰ «·„Õ«÷—…"
         Height          =   195
         Left            =   8100
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";search=true;"
         Top             =   1330
         Width           =   1020
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·Õ÷Ê—"
         Height          =   195
         Left            =   1200
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   2385
         Width           =   810
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„ﬂ«‰ «·„Õ«÷—…"
         Height          =   195
         Left            =   8100
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   "search=true;"
         Top             =   1850
         Width           =   1020
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÿ»Ì» «·„Õ«÷—"
         Height          =   195
         Left            =   3615
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   "search=true;"
         Top             =   1860
         Width           =   1020
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ «·„Õ«÷—…"
         Height          =   195
         Left            =   8100
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";search=true;"
         Top             =   810
         Width           =   1020
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·„Õ«÷—…"
         Height          =   195
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   810
         Width           =   1050
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·„Õ«÷—…"
         Height          =   195
         Left            =   8100
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";search=true;"
         Top             =   2760
         Width           =   1020
      End
   End
End
Attribute VB_Name = "frmLecture"
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
    oldScaleWidth = 9525
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from Lecture order by 1", cancel)
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

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
  ' On Error GoTo ErrHandler
  '  rs.Delete
  '  cancel = False
   ' Exit Sub
'ErrHandler:
   ' MsgBox "·« Ì„ﬂ‰ Õ–› Â–« «·”Ã· Õ«·Ì«° «·—Ã«¡ «·„Õ«Ê·… ⁄‰œ„«  œŒ· ≈·Ï Â–Â «·Ê«ÃÂ… „—… √Œ—Ï"
   ' cancel = True
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
'HHHHHHHHHHHHHHHHHHHHHHH
    txtLecture_ID.text = rs.RecordCount
    
    End Sub
Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtCrowd_Count_KeyPress(KeyAscii As Integer)
    If Len(txtCrowd_Count.text) = 0 And KeyAscii = 48 Then KeyAscii = 0
    
    If master.state <> ST_SEARCH Then
        KeyAscii = Prevent_char(KeyAscii)
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub txtLecture_ID_KeyPress(KeyAscii As Integer)
    If master.state <> ST_SEARCH Then
        KeyAscii = 0
    Else
        If Chr(KeyAscii) Like "[!0-9]" Then
            KeyAscii = 0
        End If
    End If
End Sub


