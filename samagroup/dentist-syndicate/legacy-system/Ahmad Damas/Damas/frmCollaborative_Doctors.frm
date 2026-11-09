VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSComCt2.Ocx"
Begin VB.Form frmCollaborative_Doctors 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”Ã· «·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰"
   ClientHeight    =   8340
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11880
   Icon            =   "frmCollaborative_Doctors.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8340
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ã· «·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰"
      Height          =   7770
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   11670
      Begin MSComCtl2.DTPicker DTPickerEnd 
         Height          =   255
         Left            =   2760
         TabIndex        =   13
         Top             =   840
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   450
         _Version        =   393216
         Enabled         =   0   'False
         Format          =   55640065
         CurrentDate     =   40114
      End
      Begin MSComCtl2.DTPicker DTPickerStart 
         Height          =   255
         Left            =   5280
         TabIndex        =   12
         Top             =   840
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   450
         _Version        =   393216
         Enabled         =   0   'False
         Format          =   55640065
         CurrentDate     =   40145
      End
      Begin VB.CheckBox CheckTowDate 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "»Ì‰  «—ÌŒÌ‰"
         Height          =   195
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   840
         Width           =   1095
      End
      Begin VB.CommandButton btnSearch 
         Caption         =   "„⁄«Ì‰…"
         Height          =   375
         Left            =   600
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   720
         Width           =   1695
      End
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„Êﬁ›Ì «·«‘ —«ﬂ"
         Height          =   285
         Index           =   2
         Left            =   7920
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   855
         Width           =   1410
      End
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«· ⁄«Ê‰ÌÌ‰ «·¬‰"
         Height          =   285
         Index           =   1
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   855
         Width           =   1275
      End
      Begin VB.OptionButton opt 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ﬂ·"
         Height          =   285
         Index           =   0
         Left            =   10665
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   855
         Value           =   -1  'True
         Width           =   690
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
         Width           =   11475
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5940
         Left            =   90
         TabIndex        =   2
         Tag             =   $"frmCollaborative_Doctors.frx":1CFA
         Top             =   1395
         Width           =   11490
         _cx             =   20267
         _cy             =   10477
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MousePointer    =   0
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         BackColorFixed  =   14737632
         ForeColorFixed  =   -2147483630
         BackColorSel    =   -2147483635
         ForeColorSel    =   -2147483634
         BackColorBkg    =   14810879
         BackColorAlternate=   14810879
         GridColor       =   -2147483633
         GridColorFixed  =   -2147483632
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   5
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   12
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmCollaborative_Doctors.frx":1E0F
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
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "Õ Ï  «—ÌŒ"
         Height          =   255
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   840
         Width           =   855
      End
      Begin VB.Label lblKind 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«” ⁄—«÷ «·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰"
         Height          =   240
         Left            =   9360
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   450
         Width           =   1950
      End
      Begin VB.Shape Shape1 
         Height          =   900
         Left            =   120
         Top             =   480
         Width           =   11460
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·√ÿ»«¡"
         Height          =   255
         Left            =   10680
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   855
      End
      Begin VB.Label lblRecordCount 
         Alignment       =   2  'Center
         BackColor       =   &H00FF0000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Left            =   9240
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmCollaborative_Doctors"
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
Dim sql As String
Dim report_title As String


Private Sub CheckTowDate_Click()
        DTPickerStart.Enabled = Not DTPickerEnd.Enabled
        DTPickerEnd.Enabled = Not DTPickerEnd.Enabled
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
     If master.state <> ST_SEARCH Then
        cancel = True
    ElseIf Row <> 1 Then
        cancel = True
    End If
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
    oldScaleWidth = 12000
    FormSettings = btall - btsave - btnew - btUpdate - btDelete - btCancel
    btnSettings = btall - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    sql = "SELECT  Doctor_ID, First_Name, Last_Name, Father_Name, Mother_Name, " & _
            "Collaborative_Membership_No , Collaborative_Membership_Date, Cell_Phone, " & _
            "Clinic_Phone , Clinic_Adress, House_Phone, House_Adress " & _
            "From dbo.Doctor_CV " & _
            "Where isCollaborative_Member = 1 and 1 = 0" & _
            " Order by 1"
            
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    InitFrame
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    lblRecordCount.Caption = master.rs.RecordCount
    
    'opt_Click 0
    
   
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
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    lblRecordCount.Caption = master.rs.RecordCount
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    
    Get_DataReport_Label_byName(DRDocCvT, 1, "lblStateName").Caption = Current_State.FullName
    
    Set DRDocCvT.DataSource = rs
    
    DRDocCvT.Width = 100
    DRDocCvT.Show 1
    

End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    lblRecordCount.Caption = master.rs.RecordCount
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub opt_Click(Index As Integer)
   Exit Sub
    MousePointer = vbHourglass
    Dim cancel As Boolean
   ' Dim sql As String
    
    Dim report_title As String
    
    sql = "SELECT  Doctor_ID, First_Name, Last_Name, Father_Name, Mother_Name, " & _
            "Collaborative_Membership_No , Collaborative_Membership_Date, Cell_Phone, " & _
            "Clinic_Phone , Clinic_Adress, House_Phone, House_Adress " & _
            "From dbo.Doctor_CV " & _
            "Where isCollaborative_Member = 1 "
    report_title = "«·√ÿ»«¡ «·„‰ ”»Ì‰ ··‰Ÿ«„ «· ⁄«Ê‰Ì"
    Select Case Index
    Case 1  '«· ⁄«Ê‰ÌÌ‰ «·¬‰
        sql = sql + " and dbo.sf_IsActive_Collaborative_Doctor(Doctor_ID) = 1 "
        report_title = "«·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰ «·¬‰"
        
    Case 2 '„Êﬁ›Ì «·«‘ —«ﬂ
        sql = sql + " and Collaborative_Suspend_Date is not null and Collaborative_Resume_Date is Null "
        report_title = "«·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰ „Êﬁ›Ì «·≈‘ —«ﬂ"
                
    End Select
   
   Set master.rs = ExecuteSelect(Conn, sql & " order by 1 ", cancel)
    
    If master.rs.EOF Then
        master.MoveFirst
    End If
    
    lblRecordCount.Caption = master.rs.RecordCount
    
    Get_DataReport_Label_byName(DRDocCvT, 1, "lblcase").Caption = report_title
    
    MousePointer = vbDefault
End Sub

Private Sub btnSearch_Click()
    MousePointer = vbHourglass
    Dim cancel As Boolean
    sql = "set dateformat dmy SELECT  Doctor_ID, First_Name, Last_Name, Father_Name, Mother_Name, " & _
            "Collaborative_Membership_No , Collaborative_Membership_Date, Cell_Phone, " & _
            "Clinic_Phone , Clinic_Adress, House_Phone, House_Adress " & _
            "From dbo.Doctor_CV " & _
            "Where isCollaborative_Member = 1 "
    report_title = "«·√ÿ»«¡ «·„‰ ”»Ì‰ ··‰Ÿ«„ «· ⁄«Ê‰Ì"
    
    
   If (opt(1).Value) Then
       sql = sql + " and dbo.sf_IsActive_Collaborative_Doctor(Doctor_ID) = 1 "
        report_title = "«·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰ «·¬‰"
    End If
    If (opt(2).Value) Then
        sql = sql + " and Collaborative_Suspend_Date is not null and Collaborative_Resume_Date is Null "
        report_title = "«·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰ „Êﬁ›Ì «·≈‘ —«ﬂ"
    End If
    If (CheckTowDate.Value) Then
        sql = sql + " and Collaborative_Membership_Date > '" & _
                    DTPickerStart.Value & _
                    "' and  Collaborative_Membership_Date < '" & _
                    DTPickerEnd.Value & _
                    "'"
    End If
   
    Set master.rs = ExecuteSelect(Conn, sql & " order by 1 ", cancel)
    If master.rs.EOF Then
        master.MoveFirst
    End If
    
    lblRecordCount.Caption = master.rs.RecordCount
    
    Get_DataReport_Label_byName(DRDocCvT, 1, "lblcase").Caption = report_title
    
    MousePointer = vbDefault
End Sub
