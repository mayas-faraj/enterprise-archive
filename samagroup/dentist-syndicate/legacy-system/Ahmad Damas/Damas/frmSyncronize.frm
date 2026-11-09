VERSION 5.00
Begin VB.Form frmSyncronize 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   0  'None
   ClientHeight    =   9285
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9180
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   9285
   ScaleWidth      =   9180
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ 5"
      Height          =   1455
      Index           =   4
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   6960
      Width           =   8535
      Begin VB.Label lblMessage 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   4
         Left            =   120
         TabIndex        =   26
         Top             =   960
         Width           =   7575
      End
      Begin VB.Label LabelMessage 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—”«·…"
         Height          =   255
         Index           =   4
         Left            =   7680
         TabIndex        =   25
         Top             =   1020
         Width           =   795
      End
      Begin VB.Label lblStatus 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   4
         Left            =   120
         TabIndex        =   24
         Top             =   360
         Width           =   7575
      End
      Begin VB.Label LabelStatus 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Õ«·…"
         Height          =   255
         Index           =   4
         Left            =   7740
         TabIndex        =   23
         Top             =   420
         Width           =   735
      End
   End
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ 4"
      Height          =   1455
      Index           =   3
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   5280
      Width           =   8535
      Begin VB.Label LabelStatus 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Õ«·…"
         Height          =   255
         Index           =   3
         Left            =   7740
         TabIndex        =   21
         Top             =   420
         Width           =   735
      End
      Begin VB.Label lblStatus 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   3
         Left            =   120
         TabIndex        =   20
         Top             =   360
         Width           =   7575
      End
      Begin VB.Label LabelMessage 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—”«·…"
         Height          =   255
         Index           =   3
         Left            =   7740
         TabIndex        =   19
         Top             =   1020
         Width           =   735
      End
      Begin VB.Label lblMessage 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   3
         Left            =   120
         TabIndex        =   18
         Top             =   960
         Width           =   7575
      End
   End
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ 3"
      Height          =   1455
      Index           =   2
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   3600
      Width           =   8535
      Begin VB.Label lblMessage 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   16
         Top             =   960
         Width           =   7575
      End
      Begin VB.Label LabelMessage 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—”«·…"
         Height          =   255
         Index           =   2
         Left            =   7740
         TabIndex        =   15
         Top             =   1020
         Width           =   735
      End
      Begin VB.Label lblStatus 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   14
         Top             =   360
         Width           =   7575
      End
      Begin VB.Label LabelStatus 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Õ«·…"
         Height          =   255
         Index           =   2
         Left            =   7740
         TabIndex        =   13
         Top             =   420
         Width           =   735
      End
   End
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ 2"
      Height          =   1455
      Index           =   1
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1920
      Width           =   8535
      Begin VB.Label lblMessage 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   11
         Top             =   960
         Width           =   7575
      End
      Begin VB.Label LabelMessage 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—”«·…"
         Height          =   255
         Index           =   1
         Left            =   7740
         TabIndex        =   10
         Top             =   1020
         Width           =   735
      End
      Begin VB.Label lblStatus 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   9
         Top             =   360
         Width           =   7575
      End
      Begin VB.Label LabelStatus 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Õ«·…"
         Height          =   255
         Index           =   1
         Left            =   7740
         TabIndex        =   8
         Top             =   420
         Width           =   735
      End
   End
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ 1"
      Height          =   1455
      Index           =   0
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   240
      Width           =   8535
      Begin VB.Label LabelStatus 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·Õ«·…"
         Height          =   255
         Index           =   0
         Left            =   7740
         TabIndex        =   6
         Top             =   420
         Width           =   735
      End
      Begin VB.Label lblStatus 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   7575
      End
      Begin VB.Label LabelMessage 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—”«·…"
         Height          =   255
         Index           =   0
         Left            =   7740
         TabIndex        =   4
         Top             =   1020
         Width           =   735
      End
      Begin VB.Label lblMessage 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   7575
      End
   End
   Begin VB.Timer Tmr 
      Enabled         =   0   'False
      Index           =   4
      Interval        =   1000
      Left            =   5580
      Top             =   8640
   End
   Begin VB.Timer Tmr 
      Enabled         =   0   'False
      Index           =   3
      Interval        =   1000
      Left            =   4980
      Top             =   8640
   End
   Begin VB.Timer Tmr 
      Enabled         =   0   'False
      Index           =   2
      Interval        =   1000
      Left            =   4380
      Top             =   8640
   End
   Begin VB.Timer Tmr 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   1000
      Left            =   3780
      Top             =   8640
   End
   Begin VB.Timer Tmr 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   1000
      Left            =   3180
      Top             =   8640
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   " ≈€·«ﬁ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   413
      TabIndex        =   1
      Top             =   8640
      Width           =   1335
   End
   Begin VB.CommandButton cmdSyncronize 
      Caption         =   "»œ¡ «·„“«„‰…"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7440
      TabIndex        =   0
      Top             =   8640
      Width           =   1335
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00800000&
      BorderWidth     =   10
      Height          =   9135
      Left            =   120
      Top             =   45
      Width           =   9015
   End
End
Attribute VB_Name = "frmSyncronize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim rsJobHistory(5) As New ADODB.Recordset
Dim rsJobID As New ADODB.Recordset
Dim JobID(5) As Variant
Dim Sql As String
Dim Cancel As Boolean
Dim Last_Instance_ID(5) As Integer

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdSyncronize_Click()
    MousePointer = vbHourglass
    ActiveDatabaseName = "Default"
    Dim i As Integer
    Dim Sql As String
    Dim rsLast_instance_ID As ADODB.Recordset
    
    Set rsJobID = ExecuteSelect(Conn, "Select job_id from msdb.dbo.sysjobs where category_id = 14", Cancel)
    
    If rsJobID.RecordCount = 0 Then
        MsgBox "·„ Ì „ ≈⁄œ«œ ﬁ«⁄œ… «·»Ì«‰«  ·≈Ã—«¡ ⁄„·Ì… «·„“«„‰… »⁄œ", vbInformation + vbOKOnly, ""
        Exit Sub
    End If
    
    For i = 0 To rsJobID.RecordCount - 1
        JobID(i) = rsJobID.Fields(0).Value
        rsJobID.MoveNext
    Next i
    
    For i = 0 To UBound(Last_Instance_ID) - 1
        Sql = "Select isNull(instance_id,0) from msdb.dbo.sysjobhistory Where job_id = '" & JobID(i) & "' order by instance_id desc"
        Set rsLast_instance_ID = ExecuteSelect(Conn, Sql, Cancel)
        Last_Instance_ID(i) = rsLast_instance_ID.Fields(0).Value
    Next i
    
    ExecuteCommand Conn, "exec Start_Syncronizing", Cancel
    
    For i = 0 To rsJobID.RecordCount - 1
        Tmr(i).Enabled = True
    Next i
    MousePointer = vbDefault
End Sub

Private Sub Form_Load()
    FormatForm Me
End Sub


Private Sub Tmr_Timer(Index As Integer)
    Sql = "Select message,run_status From msdb.dbo.sysjobhistory Where job_id = '" & JobID(Index) & _
          "' and  instance_id > " & Last_Instance_ID(Index) & " order by instance_id desc"
    Set rsJobHistory(Index) = ExecuteSelect(Conn, Sql, Cancel)
    If rsJobHistory(Index).EOF Or rsJobHistory(Index).BOF Then Exit Sub
    lblMessage(Index).Caption = rsJobHistory(Index).Fields(0).Value
    Select Case rsJobHistory(Index).Fields(1).Value
    Case 0
        lblStatus(Index).Caption = "Failed"
        Tmr(Index).Enabled = False
        MsgBox "›‘·  ⁄„·Ì… «·„“«„‰… ›Ì ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ " + str(Index + 1)
    Case 1
        lblStatus(Index).Caption = "Succeeded"
        Tmr(Index).Enabled = False
        MsgBox " „  ⁄„·Ì… «·„“«„‰…  »‰Ã«Õ ›Ì ﬁ«⁄œ… «·»Ì«‰«  —ﬁ„ " + str(Index + 1)
    Case 2
        lblStatus(Index).Caption = "Retry"
    Case 3
        lblStatus(Index).Caption = "Canceled"
    Case 4
       lblStatus(Index).Caption = "In Progress"
    End Select
End Sub
