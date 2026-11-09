VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form dlgQuarter_Signature_Refresh_List 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ÕœÌÀ ﬁ«∆„… «·√ÿ»«¡"
   ClientHeight    =   8775
   ClientLeft      =   3015
   ClientTop       =   1725
   ClientWidth     =   8055
   Icon            =   "dlgQuarter_Signature_Refresh_List.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   8775
   ScaleWidth      =   8055
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ÕœÌÀ ﬁ«∆„… «·√ÿ»«¡"
      Height          =   8655
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   7935
      Begin VB.CommandButton cmdClose 
         Caption         =   "≈·€«¡ «·√„—"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   5400
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   8160
         Width           =   1095
      End
      Begin VB.CommandButton cmdOk 
         Caption         =   " ‰›Ì–"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   8160
         Width           =   1095
      End
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "”Ê› ÌÕ–›Ê‰ „‰ «·ﬁ«∆„…"
         Height          =   285
         Index           =   0
         Left            =   5520
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   885
         Value           =   -1  'True
         Width           =   2010
      End
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "”Ê› Ì÷«›Ê‰ ≈·Ï «·ﬁ«∆„…"
         Height          =   285
         Index           =   1
         Left            =   2640
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   885
         Width           =   2115
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
         Width           =   7695
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6615
         Left            =   120
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:doctor_id,1:full_name,2:mDate,;"
         Top             =   1440
         Width           =   7695
         _cx             =   13573
         _cy             =   11668
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
         BackColorAlternate=   -2147483624
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
         Cols            =   3
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"dlgQuarter_Signature_Refresh_List.frx":1CFA
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
         Editable        =   0
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
      Begin VB.Label lblCount 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   11.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   8160
         Width           =   1335
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "⁄œœ «·”Ã·«  "
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1440
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   8160
         Width           =   1095
      End
      Begin VB.Label lblKind 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«” ⁄—«÷ «·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰ «·–Ì‰"
         Height          =   240
         Left            =   5295
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   480
         Width           =   2310
      End
      Begin VB.Shape Shape1 
         Height          =   780
         Left            =   2520
         Top             =   570
         Width           =   5220
      End
   End
End
Attribute VB_Name = "dlgQuarter_Signature_Refresh_List"
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
Public Quarter_Year As String
'Dim i As Integer

Function Get_Dataset(Index As Integer) As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    Dim pre_year As Integer
    
    pre_year = Quarter_Year - 1
    Select Case Index
    Case 0 'to be deleteted
        sql = "Set DateFormat DMY Select  distinct Doctor_ID,Full_Name," & _
               " dbo.sf_Get_Collaborative_Membership_Date(Doctor_ID) as mDate " & _
               " From vQuarter_Signature_Details " & _
               " Where (DatePart(Year,dbo.sf_Get_Collaborative_Membership_Date(Doctor_ID)) > " & Quarter_Year & _
               " or dbo.sf_Get_Collaborative_Membership_Date(Doctor_ID) is Null) " & _
               " and Quarter_Year = " & Quarter_Year & _
               "  Order by 1"
    Case 1 'to be Added
        sql = "Set DateFormat DMY Select Doctor_ID,First_Name + ' ' + Last_Name as full_name," & _
               " Collaborative_Membership_Date as mDate " & _
               " From Doctor_CV " & _
               " Where DatePart(Year,Collaborative_Membership_Date) = " & Quarter_Year & _
               " and isCollaborative_Member = 1 " & _
               "and Doctor_id not in " & _
               "(Select doctor_id from vQuarter_Signature_Details where Quarter_Year = '" & Quarter_Year & "' ) " & _
               " Order by 1"
    End Select
    Set Get_Dataset = ExecuteSelect(Conn, sql, cancel)
End Function

Function Get_DatasetExec(Index As Integer) As ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    Dim pre_year As Integer
    
    pre_year = Quarter_Year - 1
    Select Case Index
    Case 0 'to be deleteted
        sql = "Set DateFormat DMY Select  distinct Doctor_ID,Full_Name," & _
               " dbo.sf_Get_Collaborative_Membership_Date(Doctor_ID) as mDate " & _
               " From vQuarter_Signature_Details " & _
               " Where (DatePart(Year,dbo.sf_Get_Collaborative_Membership_Date(Doctor_ID)) > " & Quarter_Year & _
               " or dbo.sf_Get_Collaborative_Membership_Date(Doctor_ID) is Null " & _
               " or Collaborative_Suspend_Date is  not null  " & _
               " or (DatePart(Year,Collaborative_Suspend_Date))= " & Quarter_Year & " ) " & _
               " and Quarter_Year = " & Quarter_Year & _
               "  Order by 1"
    Case 1 'to be Added
        sql = "Set DateFormat DMY Select Doctor_ID,First_Name + ' ' + Last_Name as full_name," & _
               " Collaborative_Membership_Date as mDate " & _
               " From Doctor_CV " & _
               " Where DatePart(Year,Collaborative_Membership_Date) = " & Quarter_Year & _
               " and  Collaborative_Suspend_Date is  null " & _
               " and isCollaborative_Member = 1 " '& _
'               "and Doctor_id not in " & _
'               "(Select doctor_id from vQuarter_Signature_Details where Quarter_Year = '" & Quarter_Year & "' ) " & _
'               " Order by 1"
    End Select
    Debug.Print sql
    Set Get_DatasetExec = ExecuteSelect(Conn, sql, cancel)
End Function

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Dim msg  As VbMsgBoxResult
    Dim InsertSQl As String
    Dim rs As ADODB.Recordset
    Dim Doctor_ID As Long
    Dim i As Integer
    Dim rsQuarters As ADODB.Recordset
    Dim cancel As Boolean
    
    msg = MsgBox("Â·  √ﬂœ  „‰ √”„«¡ Ã„Ì⁄ «·√ÿ»«¡ «·–Ì‰ ”Ì÷«›Ê‰ Ê «·√ÿ»«¡ «·–Ì‰ ”ÌÕ–›Ê‰ „‰ «·ﬁ«∆„…ø", vbQuestion + vbYesNo, " √ﬂÌœ")
    
    If msg <> vbYes Then Exit Sub
    
    Set rs = Get_DatasetExec(0)
    If (Not rs Is Nothing) Then
       If rs.RecordCount <> 0 Then
         rs.MoveFirst
        ' cancel deleteing
         'Do While Not rs.EOF
            'ExecuteCommand Conn, "Delete from Quarter_Sinature_Details Where Doctor_ID = " & rs.Fields(0).Value & " and quarter_id in (select quarter_id from dbo.Quarter_Signature where quarter_year = " & Quarter_Year & ") ", cancel
            'rs.MoveNext
         'Loop
      End If
   End If
   Set rs = Get_DatasetExec(1)
   
   If rs.RecordCount <> 0 Then
   
    Set rsQuarters = ExecuteSelect(Conn, "Select Quarter_id from Quarter_Signature " & _
                                        " Where Quarter_Year = " & Quarter_Year, cancel)
    Do While Not rs.EOF
         Do While Not rsQuarters.EOF
             InsertSQl = "Insert into Quarter_Sinature_Details(Quarter_ID,Doctor_ID,Sinature_Status) " & _
                         " values(" & rsQuarters.Fields(0).Value & "," & _
                         rs.Fields(0).Value & ",1)"
             ExecuteCommand Conn, InsertSQl, cancel
             rsQuarters.MoveNext
         Loop
         rsQuarters.MoveFirst
         rs.MoveNext
     Loop
     
   End If
   
   frmNewQuarter_Signature.master_doMoveComplete frmNewQuarter_Signature.master.rs
   
   Unload Me
    
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
    oldScaleWidth = 0 ' TODO: Put the Form.Width value here
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "My SQL", cancel)
    InitFrame
    opt_Click 0
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
    ' ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub lblCount_Change()
    cmdOK.Enabled = val(lblCount.Caption) <> 0
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub opt_Click(Index As Integer)
    
    MousePointer = vbHourglass
    
    fg.Clear , flexClearData
    lblCount.Caption = 0
    
    Set master.rs = Get_DatasetExec(Index)
    If (master.rs Is Nothing) Then
        Exit Sub
    End If
    If Not master.rs.BOF Then
        master.MoveLast
    End If
    
    lblCount.Caption = master.rs.RecordCount
    
    ResizeGrid fg
    MousePointer = vbDefault
    
End Sub
