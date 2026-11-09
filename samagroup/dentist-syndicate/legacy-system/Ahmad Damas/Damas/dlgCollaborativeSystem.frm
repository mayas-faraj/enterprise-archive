VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form dlgCollaborativeSystem 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "«·«‰ ”«» ≈·Ï «·‰Ÿ«„ «· ⁄«Ê‰Ì"
   ClientHeight    =   3105
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6810
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   3105
   ScaleWidth      =   6810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkIsCollaborativeMember 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "„‰ ”» ··‰Ÿ«„ «· ⁄«Ê‰Ì"
      DataField       =   "IsCouncil_Member"
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   3420
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   120
      Width           =   3135
   End
   Begin VB.Frame frCollaborativeContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00E1FEFF&
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   600
      Width           =   6495
      Begin VB.TextBox TxtDocumentNumber 
         Alignment       =   2  'Center
         ForeColor       =   &H80000012&
         Height          =   375
         Left            =   3360
         MaxLength       =   50
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   720
         Width           =   1400
      End
      Begin MSComCtl2.DTPicker dtDocumentDate 
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   720
         Width           =   1395
         _ExtentX        =   2461
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40106
      End
      Begin MSComCtl2.DTPicker dtSuspendDate 
         Height          =   375
         Left            =   3360
         TabIndex        =   12
         Top             =   1320
         Width           =   1395
         _ExtentX        =   2461
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   62783489
         CurrentDate     =   40106
      End
      Begin MSComCtl2.DTPicker dtResumeDate 
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   1320
         Width           =   1395
         _ExtentX        =   2461
         _ExtentY        =   661
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         Format          =   62783489
         CurrentDate     =   40106
      End
      Begin VB.Label LblCollaborativeNumber 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "270001"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   4110
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   360
         Width           =   645
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ ≈⁄«œ… «·«‰ ”«»"
         Height          =   195
         Index           =   4
         Left            =   1680
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   1440
         Width           =   1425
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ ≈Ìﬁ«› «·«‰ ”«»"
         Height          =   195
         Index           =   3
         Left            =   4920
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1440
         Width           =   1425
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ ﬁ—«— «·«‰ ”«»"
         Height          =   195
         Index           =   2
         Left            =   1785
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   840
         Width           =   1320
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "—ﬁ„ ﬁ—«— «·«‰ ”«»"
         Height          =   195
         Index           =   1
         Left            =   5160
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   840
         Width           =   1185
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «· ⁄«Ê‰Ì"
         Height          =   195
         Index           =   0
         Left            =   5370
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   3360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2640
      Width           =   1515
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   5040
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2640
      Width           =   1515
   End
End
Attribute VB_Name = "dlgCollaborativeSystem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub chkIsCollaborativeMember_Click()
    ' to do
    enableCollaborative (chkIsCollaborativeMember.Value = 1)
    If chkIsCollaborativeMember.Value = 1 Then
        TxtDocumentNumber_Change
    End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    If saveValues Then
        frmDoctorCV.LoadCollaborativeSystemMembershipInfo frmDoctorCV.master.rs
        Unload Me
    End If
End Sub

Private Sub dtSuspendDate_Change()
    If Not IsNull(dtSuspendDate.Value) Then
        dtResumeDate.Enabled = True
    Else
        dtResumeDate.Enabled = False
    End If
End Sub

Private Sub Form_Load()
    loadValues
    If Not IsNull(dtSuspendDate.Value) Then
        dtResumeDate.Enabled = True
    Else
        dtResumeDate.Enabled = False
    End If
End Sub

Private Function saveValues() As Boolean
    
    frmDoctorCV.master.rs!IsCollaborative_Member = chkIsCollaborativeMember.Value
    If chkIsCollaborativeMember.Value <> 1 Then
        frmDoctorCV.master.rs!Collaborative_Membership_No = Null
        frmDoctorCV.master.rs!Collaborative_Membership_Date = Null
        frmDoctorCV.master.rs!Collaborative_Suspend_Date = Null
        frmDoctorCV.master.rs!Collaborative_Resume_Date = Null
        saveValues = True
        Exit Function
    End If
    
    If Trim(CStr(TxtDocumentNumber.text)) <> "" Then
        frmDoctorCV.master.rs!Collaborative_Membership_No = TxtDocumentNumber
    Else
        MsgBox "—Ã«¡ √œŒ· —ﬁ„ ﬁ—«— «·«‰ ”«».", vbCritical, " ‰»ÌÂ"
        saveValues = False
        Exit Function
    End If
    
    frmDoctorCV.master.rs!Collaborative_Membership_Date = dtDocumentDate.Value
    
    frmDoctorCV.master.rs!Collaborative_Suspend_Date = dtSuspendDate.Value
    
    frmDoctorCV.master.rs!Collaborative_Resume_Date = dtResumeDate.Value
    
    saveValues = True

End Function

Private Sub loadValues()

    LblCollaborativeNumber.Caption = frmDoctorCV.master.rs!Doctor_ID
    
    If Not IsNull(frmDoctorCV.master.rs!Collaborative_Membership_No) Then
        TxtDocumentNumber.text = frmDoctorCV.master.rs!Collaborative_Membership_No
        dtDocumentDate.Value = frmDoctorCV.master.rs!Collaborative_Membership_Date
    Else
        TxtDocumentNumber.text = ""
        dtDocumentDate.Enabled = True
    End If
    
    If Not IsNull(frmDoctorCV.master.rs!Collaborative_Suspend_Date) Then
        dtSuspendDate.Value = frmDoctorCV.master.rs!Collaborative_Suspend_Date
    Else
        dtSuspendDate.Value = Null
    End If
    
    If Not IsNull(frmDoctorCV.master.rs!Collaborative_Resume_Date) Then
        dtResumeDate.Value = frmDoctorCV.master.rs!Collaborative_Resume_Date
    Else
        dtResumeDate.Value = Null
    End If
    
    chkIsCollaborativeMember.Value = frmDoctorCV.master.rs!IsCollaborative_Member
    chkIsCollaborativeMember_Click

End Sub

Private Sub enableCollaborative(enable As Boolean)
    
    TxtDocumentNumber.Enabled = enable
    LblCollaborativeNumber.Enabled = enable
    dtDocumentDate.Enabled = enable
    dtSuspendDate.Enabled = enable
    'dtResumeDate.Enabled = enable
    If enable Then
        TxtDocumentNumber.BackColor = &H80000005
    Else
        TxtDocumentNumber.BackColor = &HE0E0E0
        'LblCollaborativeNumber.Caption = "-"
    End If

End Sub

Private Sub TxtDocumentNumber_Change()
    dtDocumentDate.Enabled = Len(TxtDocumentNumber.text) > 0
End Sub
