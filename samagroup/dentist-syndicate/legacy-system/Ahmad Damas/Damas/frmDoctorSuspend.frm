VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmDoctorSuspend 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " —ﬁÌ‰ «·ﬁÌœ Ê≈⁄«œ… «· ”ÃÌ·"
   ClientHeight    =   8280
   ClientLeft      =   3015
   ClientTop       =   1725
   ClientWidth     =   7515
   Icon            =   "frmDoctorSuspend.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   8280
   ScaleWidth      =   7515
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCLose 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "⁄Êœ…"
      Default         =   -1  'True
      Height          =   375
      Left            =   120
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   120
      Width           =   1515
   End
   Begin VB.CommandButton cmdNew 
      Height          =   350
      Left            =   7065
      Picture         =   "frmDoctorSuspend.frx":1CFA
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   26
      TabStop         =   0   'False
      ToolTipText     =   "ÃœÌœ"
      Top             =   105
      Width           =   375
   End
   Begin VB.CommandButton cmdUpdate 
      Height          =   350
      Left            =   6720
      Picture         =   "frmDoctorSuspend.frx":225A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   25
      TabStop         =   0   'False
      ToolTipText     =   " ⁄œÌ·"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton CmdDel 
      Height          =   350
      Left            =   6360
      Picture         =   "frmDoctorSuspend.frx":27DE
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   24
      TabStop         =   0   'False
      ToolTipText     =   "Õ–›"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdSave 
      Height          =   350
      Left            =   6000
      Picture         =   "frmDoctorSuspend.frx":2D8A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   23
      TabStop         =   0   'False
      ToolTipText     =   "Õ›Ÿ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdCancel 
      Height          =   350
      Left            =   5640
      Picture         =   "frmDoctorSuspend.frx":330E
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   22
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   4920
      Picture         =   "frmDoctorSuspend.frx":3492
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   21
      TabStop         =   0   'False
      ToolTipText     =   "»ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdCancelSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   4200
      Picture         =   "frmDoctorSuspend.frx":3A16
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   20
      TabStop         =   0   'False
      ToolTipText     =   "≈·€«¡ »ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdExecSearch 
      Enabled         =   0   'False
      Height          =   350
      Left            =   4560
      Picture         =   "frmDoctorSuspend.frx":3B9A
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   19
      TabStop         =   0   'False
      ToolTipText     =   " ‰›Ì– »ÕÀ"
      Top             =   120
      Width           =   375
   End
   Begin VB.CommandButton cmdFirst 
      Enabled         =   0   'False
      Height          =   350
      Left            =   3240
      Picture         =   "frmDoctorSuspend.frx":3F5C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   18
      TabStop         =   0   'False
      ToolTipText     =   "«·√Ê·"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdPrev 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2880
      Picture         =   "frmDoctorSuspend.frx":42A0
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   17
      TabStop         =   0   'False
      ToolTipText     =   "«·”«»ﬁ"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdNext 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2520
      Picture         =   "frmDoctorSuspend.frx":45E4
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      TabStop         =   0   'False
      ToolTipText     =   "«· «·Ì"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdLast 
      Enabled         =   0   'False
      Height          =   350
      Left            =   2160
      Picture         =   "frmDoctorSuspend.frx":4928
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      TabStop         =   0   'False
      ToolTipText     =   "«·√ŒÌ—"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdPrint 
      Enabled         =   0   'False
      Height          =   350
      Left            =   1680
      Picture         =   "frmDoctorSuspend.frx":4C6C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      ToolTipText     =   "ÿ»«⁄…"
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«· —ﬁÌ‰«  «·”«»ﬁ…"
      Height          =   5775
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   2400
      Width           =   7335
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
         Width           =   7095
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5175
         Left            =   120
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:sn,1:sd,2:rn,3:rd,;"
         Top             =   480
         Width           =   7095
         _cx             =   12515
         _cy             =   9128
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
         AllowSelection  =   0   'False
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   4
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmDoctorSuspend.frx":4DF0
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
   End
   Begin VB.Frame lastFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "Õ«·Ì«"
      Height          =   1815
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   480
      Width           =   7335
      Begin MSComCtl2.DTPicker sd 
         DataField       =   "sd"
         Height          =   375
         Left            =   3960
         TabIndex        =   28
         Tag             =   ";check=required;"
         Top             =   1200
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         DateIsNull      =   -1  'True
         Format          =   66125825
         CurrentDate     =   38250
      End
      Begin VB.TextBox rn 
         Alignment       =   2  'Center
         DataField       =   "rn"
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   240
         MaxLength       =   20
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   720
         Width           =   1935
      End
      Begin VB.TextBox sn 
         Alignment       =   2  'Center
         DataField       =   "sn"
         ForeColor       =   &H00800080&
         Height          =   375
         Left            =   3960
         MaxLength       =   20
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";check=required;"
         Top             =   720
         Width           =   1935
      End
      Begin VB.CheckBox chklastFrame 
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
         Width           =   7095
      End
      Begin MSComCtl2.DTPicker rd 
         Bindings        =   "frmDoctorSuspend.frx":4EB3
         DataField       =   "rd"
         DataMember      =   "Resume_Date"
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Tag             =   ";check=custom;"
         Top             =   1200
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         DateIsNull      =   -1  'True
         Format          =   66125825
         CurrentDate     =   38250
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   " «—ÌŒ «·ﬁ—«— "
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   4
         Left            =   2640
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   1290
         Width           =   825
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "—ﬁ„ «·ﬁ—«— "
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   3
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   810
         Width           =   690
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈⁄«œ… «· ”ÃÌ·"
         Height          =   195
         Index           =   1
         Left            =   2505
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   480
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   " «—ÌŒ «·ﬁ—«— "
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   2
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   1290
         Width           =   825
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   " —ﬁÌ‰ «·ﬁÌœ"
         Height          =   195
         Index           =   0
         Left            =   6360
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   480
         Width           =   735
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "—ﬁ„ «·ﬁ—«— "
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   30
         Left            =   6375
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   810
         Width           =   690
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H80000003&
         Height          =   1095
         Left            =   3720
         Top             =   600
         Width           =   3495
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H80000003&
         Height          =   1095
         Left            =   120
         Top             =   600
         Width           =   3495
      End
   End
End
Attribute VB_Name = "frmDoctorSuspend"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public controllers As New Collection

Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public FormSettings As Long
Public btnSettings As Long

Public WithEvents Last As Controller
Attribute Last.VB_VarHelpID = -1
Public FormLastSettings As Long
Public btnLastSettings As Long

Dim ActiveFrame As frame
Dim oldScaleWidth As Long

Public Event OnShouldChangeTasdeed(ByRef rsTasdeed As ADODB.Recordset, ByVal isDelete As Boolean)
'<AHMAD>
    Public DataChanged As Boolean
'</AHMAD>
Public Doctor As Integer
Const orderBy = "ORDER BY Suspend_Date DESC"
Const Sql = "Set DateFormat DMY SELECT $$$ Doctor_Id AS di, Suspend_No AS sn, " & _
    "Suspend_Date AS sd, Resume_No AS rn, Resume_Date rd, TasdeedStatus, TasdeedDate" & vbCrLf & _
    "FROM DoctorSuspend WHERE Doctor_Id = DDD" & vbCrLf


Private Sub cmdCancel_Click()
    Last.CancelSave
End Sub

Private Sub cmdCancelSearch_Click()
    master.CancelSearch
End Sub

Private Sub cmdCLose_Click()
    Unload Me
End Sub

Private Sub cmdDel_Click()
    If ActiveFrame = masterFrame Then
        master.Delete
    Else
        Last.Delete
    End If
End Sub

Private Sub cmdExecSearch_Click()
    master.Search
End Sub

Private Sub cmdNew_Click()
    Last.addNew
End Sub

Private Sub cmdSave_Click()
    Last.Save
End Sub

Private Sub cmdSearch_Click()
    master.BeginSearch
End Sub

Private Sub cmdUpdate_Click()
    Last.Update
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
    Cancel = (master.State And ST_SEARCH) = 0 Or Row <> 1
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Default"
    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings, Me
    Else
        RefreshCommands btnLastSettings And FormLastSettings, Me
    End If
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings(Me)
    Else
        btnLastSettings = GetBtnSettings(Me)
    End If
End Sub

Private Sub Form_Load()
    oldScaleWidth = 7515
    
    FormLastSettings = btnew Or btUpdate Or btsave Or btCancel Or btdelete
    btnLastSettings = btnew Or btUpdate Or btdelete
    FormSettings = btdelete Or btSearch Or btSearchCancel Or btSearchExec
    btnSettings = btdelete Or btSearch
    
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.ButtonsForm = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    
    Set Last = New Controller
    Set Last.Form = Me
    Set Last.ButtonsForm = Me
    Set Last.frame = lastFrame
    controllers.Add Last, lastFrame.name

    InitFrame
    
    Set ActiveFrame = lastFrame
    '<AHMAD>
        DataChanged = False
    '</AHMAD>
End Sub

Private Sub InitFrame()
    ' Initialization
    
    LoadData False

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
    ResizeGrid fg
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    Set master = Nothing
    RefreshCommands 0, Me
End Sub

Private Sub Last_doAddNew(rs As ADODB.Recordset)
    LoadData True
    cmdClose.Enabled = False
End Sub

Private Sub Last_doBeginSearch(rs As ADODB.Recordset)
    cmdClose.Enabled = False
End Sub

Private Sub Last_doCancelSave(rs As ADODB.Recordset, Cancel As Boolean)
    LoadData False
    cmdClose.Enabled = True
End Sub

Private Sub Last_doCancelSearch(rs As ADODB.Recordset)
    cmdClose.Enabled = True
End Sub

Private Sub Last_doDelete(rs As ADODB.Recordset, Cancel As Boolean)
    RaiseEvent OnShouldChangeTasdeed(Last.rs, True)
    rs.Delete
    LoadData False
    Cancel = True
End Sub


Private Sub Last_doMoveComplete(rs As ADODB.Recordset)
    Dim enable As Boolean
    enable = IsNull(rs!rd)
    If enable Then
        If (FormLastSettings And btnew) <> 0 Then
            FormLastSettings = FormLastSettings Xor btnew
        End If
    Else
        FormLastSettings = FormLastSettings Or btnew
    End If
    RefreshCommands btnLastSettings And FormLastSettings, Me
End Sub

Private Sub Last_doSave(rs As ADODB.Recordset, Cancel As Boolean)
    rs!di = Doctor
    
End Sub

Private Sub Last_doSaveComplete(rs As ADODB.Recordset)
    LoadData False
    If Last.State And ST_ADDNEW Then
        RaiseEvent OnShouldChangeTasdeed(Last.rs, False)
    End If
    cmdClose.Enabled = True
    '<AHMAD>
        DataChanged = True
    '</AHMAD>
End Sub

Private Sub Last_doSearchComplete(rs As ADODB.Recordset)
    cmdClose.Enabled = True
End Sub

Private Sub Last_doUpdate(rs As ADODB.Recordset)
    cmdClose.Enabled = False
End Sub

Private Sub Last_ValidateValue(ctrl As Control, S As String, checkType As Boolean, msg As String)
    sd.Value = format(sd.Value, "dd/mm/yyyy")
    rd.Value = format(rd.Value, "dd/mm/yyyy")
    If IsNull(rd.Value) Xor Trim(rn.text) = "" Then
        msg = "≈‰ —ﬁ„ ﬁ—«— ≈⁄«œ… «· ”ÃÌ· Ê «—ÌŒÂ „ ·«“„«‰° Ê·« Ì„ﬂ‰ ≈œŒ«· √ÕœÂ„« œÊ‰ «·¬Œ—."
        checkType = True
        Exit Sub
    End If
    If Not IsNull(rd.Value) Then
        If rd.Value <= sd.Value Then
            msg = "ÌÃ» √‰ ÌﬂÊ‰  «—ÌŒ ﬁ—«— ≈⁄«œ… «· ”ÃÌ· »⁄œ  «—ÌŒ  —ﬁÌ‰ «·ﬁÌœ."
            checkType = True
            Exit Sub
        End If
    End If
    If master.rs.RecordCount > 0 Then
        Dim lastDate As Date
        lastDate = CDate(fg.TextMatrix(1, 1))
        If sd.Value <= lastDate Then
            msg = "·« Ì„ﬂ‰  —ﬁÌ‰ «·ﬁÌœ » «—ÌŒ ﬁ»· √Õœ «· —ﬁÌ‰«  «·”«»ﬁ…."
            checkType = True
            Exit Sub
        End If
    End If
End Sub


Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    DataChanged = True
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    btnLastSettings = GetBtnSettings(Me)
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings, Me
End Sub

Private Sub LastFrame_Click()
    If ActiveFrame = lastFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings(Me)
    SelectFrame Me, lastFrame
    Set ActiveFrame = lastFrame
    RefreshCommands btnLastSettings And FormLastSettings, Me
End Sub

Public Sub LoadData(ByVal isNewLast As Boolean)
    Dim Cancel As Boolean
    Dim query As String
    
    If Not isNewLast Then
        query = Replace(Sql, "$$$", "TOP 1") & orderBy
        query = Replace(query, "DDD", Doctor)
        Set Last.rs = ExecuteSelect(Conn, query, Cancel)
        If Last.rs.RecordCount > 0 Then
            Last.MoveFirst
        Else
            Last.rs.Requery
        End If
    End If
    
    query = Replace(Sql, "$$$", "")
    If Not isNewLast Then
        If Last.rs.RecordCount > 0 Then
            query = query & "AND Suspend_Date != '" & format(Last.rs!sd, "dd/mm/yyyy") & "'" & vbCrLf
        End If
    End If
    query = Replace(query, "DDD", Doctor)
    Set master.rs = ExecuteSelect(Conn, query & orderBy, Cancel)
    If master.rs.RecordCount > 0 Then
        master.MoveFirst
    Else
        master.rs.Requery
    End If
End Sub
