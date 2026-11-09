VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmImportPicture 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2430
   LinkTopic       =   "Form1"
   ScaleHeight     =   3990
   ScaleWidth      =   2430
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdImageEditor 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„⁄«·Ã… «·’Ê—…"
      Height          =   375
      Left            =   240
      MaskColor       =   &H00E1FEFF&
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   2280
      Width           =   1935
   End
   Begin VB.CommandButton cmbBack 
      BackColor       =   &H00E1FEFF&
      Caption         =   "⁄Êœ…"
      Height          =   375
      Left            =   240
      MaskColor       =   &H00E1FEFF&
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   3000
      Width           =   1935
   End
   Begin VB.CommandButton cmdImportFromScaner 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«” Ì—«œ ’Ê—… „‰ ”ﬂ«‰—"
      Height          =   375
      Left            =   248
      MaskColor       =   &H00E1FEFF&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1508
      Width           =   1935
   End
   Begin VB.CommandButton cmdImportFromFile 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«” Ì—«œ ’Ê—… „‰ „·›"
      Height          =   375
      Left            =   248
      MaskColor       =   &H00E1FEFF&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   788
      Width           =   1935
   End
   Begin MSComDlg.CommonDialog cmnDialog 
      Left            =   480
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H80000002&
      BorderWidth     =   10
      Height          =   3975
      Left            =   0
      Top             =   0
      Width           =   2415
   End
End
Attribute VB_Name = "frmImportPicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Caller_Form As String

Private Sub cmbBack_Click()
    Unload Me
End Sub

Private Sub cmdImageEditor_Click()
    frmPicture_Effects.Show 1
End Sub

Private Sub cmdImportFromFile_Click()
    ggAddPic = 1 'Load from File
    Select Case UCase(Caller_Form)
    Case "EMPLOYEE_CV"
        frmEmployee_CV.Save_Picture
    Case "DOCTOR_CV"
        frmDoctorCV.Save_Picture
    End Select
    Unload Me
End Sub

Private Sub cmdImportFromScaner_Click()
    ggAddPic = 2 'Load from Scanner
    Select Case UCase(Caller_Form)
    Case "EMPLOYEE_CV"
        frmEmployee_CV.GetScan
    Case "DOCTOR_CV"
        frmDoctorCV.GetScan
    End Select
    Unload Me
End Sub
