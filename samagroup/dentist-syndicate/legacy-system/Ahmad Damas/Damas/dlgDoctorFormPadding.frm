VERSION 5.00
Begin VB.Form dlgDoctorFormPadding 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "≈÷«›…  ⁄·Ìﬁ ≈·Ï «·ÊÀÌﬁ….."
   ClientHeight    =   4740
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   8460
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   4740
   ScaleWidth      =   8460
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdNew 
      Height          =   350
      Left            =   5625
      Picture         =   "dlgDoctorFormPadding.frx":0000
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   38
      TabStop         =   0   'False
      ToolTipText     =   "ÃœÌœ"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdUpdate 
      Height          =   350
      Left            =   5280
      Picture         =   "dlgDoctorFormPadding.frx":0560
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   37
      TabStop         =   0   'False
      ToolTipText     =   " ⁄œÌ·"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdDel 
      Height          =   350
      Left            =   4920
      Picture         =   "dlgDoctorFormPadding.frx":0AE4
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   36
      TabStop         =   0   'False
      ToolTipText     =   "Õ–›"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdSave 
      Height          =   350
      Left            =   4560
      Picture         =   "dlgDoctorFormPadding.frx":1090
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   35
      TabStop         =   0   'False
      ToolTipText     =   "Õ›Ÿ"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdCancel 
      Height          =   350
      Left            =   4200
      Picture         =   "dlgDoctorFormPadding.frx":1614
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   34
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3480
      Picture         =   "dlgDoctorFormPadding.frx":1798
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   33
      TabStop         =   0   'False
      ToolTipText     =   "»ÕÀ"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdCancelSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2760
      Picture         =   "dlgDoctorFormPadding.frx":1D1C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   32
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡ »ÕÀ"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdExecSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3120
      Picture         =   "dlgDoctorFormPadding.frx":1EA0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   31
      TabStop         =   0   'False
      ToolTipText     =   " ‰›Ì– »ÕÀ"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdFirst 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1800
      Picture         =   "dlgDoctorFormPadding.frx":2262
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   30
      TabStop         =   0   'False
      ToolTipText     =   "«·√Ê·"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdPrev 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1440
      Picture         =   "dlgDoctorFormPadding.frx":25A6
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   29
      TabStop         =   0   'False
      ToolTipText     =   "«·”«»ﬁ"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdNext 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1080
      Picture         =   "dlgDoctorFormPadding.frx":28EA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   28
      TabStop         =   0   'False
      ToolTipText     =   "«· «·Ì"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdLast 
      Enabled         =   0   'False
      Height          =   350
      Left            =   720
      Picture         =   "dlgDoctorFormPadding.frx":2C2E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   27
      TabStop         =   0   'False
      ToolTipText     =   "«·√ŒÌ—"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdPrint 
      Enabled         =   0   'False
      Height          =   350
      Left            =   240
      Picture         =   "dlgDoctorFormPadding.frx":2F72
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   26
      TabStop         =   0   'False
      ToolTipText     =   "ÿ»«⁄…"
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   350
      Left            =   120
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   4800
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "‰’ «·ÊÀÌﬁ…"
      Height          =   4575
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   8295
      Begin VB.CommandButton cmdCancelDialog 
         BackColor       =   &H00E0E0E0&
         Cancel          =   -1  'True
         Caption         =   "≈·€«¡ «·√„—"
         Height          =   375
         Left            =   4920
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   4080
         Width           =   1515
      End
      Begin VB.CommandButton cmdOK 
         BackColor       =   &H00E0E0E0&
         Caption         =   "„Ê«›ﬁ"
         Default         =   -1  'True
         Height          =   375
         Left            =   6540
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   4080
         Width           =   1515
      End
      Begin VB.TextBox txtPadding 
         Alignment       =   1  'Right Justify
         DataField       =   "Padding"
         ForeColor       =   &H000000FF&
         Height          =   735
         Left            =   120
         MaxLength       =   500
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   2880
         Width           =   8010
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
         Width           =   8055
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "/"
         Height          =   195
         Index           =   11
         Left            =   8025
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   2010
         Width           =   75
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈‰ ÿ»Ì» «·√”‰«‰ «·”Ìœ "
         Height          =   195
         Index           =   1
         Left            =   6585
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   600
         Width           =   1545
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ê«·œ Â"
         Height          =   195
         Index           =   0
         Left            =   3480
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   600
         Width           =   390
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ÊÌÕ„· «·Ã‰”Ì…:"
         Height          =   195
         Index           =   2
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   1080
         Width           =   1050
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "/  «—ÌŒ:"
         Height          =   195
         Index           =   4
         Left            =   3000
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   1530
         Width           =   540
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ê„”Ã· ·œÏ ›—⁄‰« »—ﬁ„"
         Height          =   195
         Index           =   5
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   1530
         Width           =   1605
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ÊÌ„«—” «·„Â‰… „‰–  «—ÌŒ:"
         Height          =   195
         Index           =   6
         Left            =   2880
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   2010
         Width           =   1650
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ê· «—ÌŒÂ Õ”»"
         Height          =   195
         Index           =   8
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   2010
         Width           =   975
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ﬁÊ«‰ÌÌ‰ Ê«·√‰Ÿ„… «·‰«›–…, Ê·Ì” ›Ì ”Ã·Â √Ì… „Œ«·›… √Ê ⁄ﬁÊ»… „”·ﬂÌ… , Ê„”œœ ·ﬂ«›… «·—”Ê„ «·‰ﬁ«»Ì… Õ Ï  «—ÌŒÂ."
         Height          =   195
         Index           =   9
         Left            =   480
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   2520
         Width           =   7650
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Êﬁœ √⁄ÿÌ  ·Â Â–Â «·ÊÀÌﬁ… »‰«¡ ⁄·Ï ÿ·»Â."
         Height          =   195
         Index           =   10
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   3720
         Width           =   2775
      End
      Begin VB.Label lblDoctorFullName 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Full_Name"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   4080
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   480
         Width           =   2520
      End
      Begin VB.Label lblMotherName 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Mother_Name"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   1440
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   480
         Width           =   1920
      End
      Begin VB.Label lblNationality 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Nationality"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   4080
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   960
         Width           =   2880
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„”Ã¯· ·œÏ Ê“«—… «·’Õ… ›Ì ”Ã· √ÿ»«¡ «·√”‰«‰ »—ﬁ„ /"
         Height          =   195
         Index           =   3
         Left            =   4410
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   1530
         Width           =   3720
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Ministry_License_Date"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   1800
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1440
         Width           =   1200
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Ministry_License_No"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1440
         Width           =   840
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "/  «—ÌŒ:"
         Height          =   195
         Index           =   7
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   2010
         Width           =   540
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Cyndicate_Registration_No"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1920
         Width           =   840
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "Cyndicate_Registration_Date"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   4680
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1920
         Width           =   1800
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         DataField       =   "License_Date"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   1200
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   1920
         Width           =   1560
      End
   End
End
Attribute VB_Name = "dlgDoctorFormPadding"
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

Public DataSource As ADODB.Recordset

Private Sub Form_Load()
    oldScaleWidth = Me.Width
    FormSettings = 0
    btnSettings = 0
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    Set master.ButtonsForm = Me
    controllers.Add master, masterFrame.name
    Dim Cancel As Boolean
    Set master.rs = DataSource
    master.MoveFirst
    InitFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub InitFrame()
    ' ?
End Sub

Private Sub cmdCancelDialog_Click()
    Unload Me
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
End Sub

Private Sub cmdOK_Click()
    Dim c As Boolean
    Dim sql As String
    sql = "EXEC sp_AddDocotorFormPadding " & master.rs!DoctorForm & ", '" & txtPadding.text & "'"
    ExecuteCommand Conn, sql, c
    Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
End Sub

