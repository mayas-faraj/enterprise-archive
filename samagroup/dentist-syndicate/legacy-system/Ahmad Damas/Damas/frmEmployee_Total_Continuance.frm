VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmEmployee_Total_Continuane 
   BackColor       =   &H00E1FEFF&
   Caption         =   "”Ã· œÊ«„ «·„ÊŸ›Ì‰ «·⁄«„"
   ClientHeight    =   7065
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10230
   Icon            =   "frmEmployee_Total_Continuance.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7065
   ScaleWidth      =   10230
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ã· œÊ«„ «·„ÊŸ›Ì‰ «·⁄«„"
      Height          =   6855
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   135
      Width           =   10050
      Begin VB.CommandButton cmdRefresh 
         Caption         =   " ÕœÌÀ «·»Ì«‰« "
         Height          =   375
         Left            =   405
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   705
         Width           =   1215
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
         Width           =   9855
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4905
         Left            =   135
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:full_Name,1:isDoctor,2:Exist_Count,3:Abcent_Count,4:Vacations,;"
         Top             =   1305
         Width           =   9780
         _cx             =   17251
         _cy             =   8652
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
         ForeColor       =   0
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
         Cols            =   5
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmEmployee_Total_Continuance.frx":1CFA
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
      Begin MSComCtl2.DTPicker dtFrom 
         Height          =   375
         Left            =   6165
         TabIndex        =   4
         Top             =   675
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin MSComCtl2.DTPicker dtTo 
         Height          =   375
         Left            =   2655
         TabIndex        =   6
         Top             =   675
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·⁄ÿ· ›Ì ‰ÿ«ﬁ «·»ÕÀ «·„ÿ·Ê» "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   1905
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";AlwaysEnable=true;"
         Top             =   6360
         Width           =   2475
      End
      Begin VB.Label lblHolidays 
         Alignment       =   2  'Center
         BackColor       =   &H00800000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   11.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   375
         Left            =   180
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";AlwaysEnable=true;"
         Top             =   6300
         Width           =   1575
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·√Ì«„ ›Ì ‰ÿ«ﬁ «·»ÕÀ «·„ÿ·Ê» "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   7425
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Tag             =   ";AlwaysEnable=true;"
         Top             =   6405
         Width           =   2445
      End
      Begin VB.Label lblCount 
         Alignment       =   2  'Center
         BackColor       =   &H00800000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   11.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   375
         Left            =   5715
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";AlwaysEnable=true;"
         Top             =   6345
         Width           =   1575
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·‰Â«Ì…"
         Height          =   195
         Left            =   4995
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   795
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   " «—ÌŒ «·»œ«Ì…"
         Height          =   195
         Left            =   8550
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   810
         Width           =   825
      End
      Begin VB.Shape Shape1 
         Height          =   615
         Left            =   180
         Top             =   585
         Width           =   9690
      End
   End
End
Attribute VB_Name = "frmEmployee_Total_Continuane"
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



Private Sub cmdRefresh_Click()
    If dtFrom.Value > dtTo.Value Then
        MsgBox "·« Ì„ﬂ‰ ÿ·» «· ﬁ—Ì— ≈–« ﬂ«‰  «—ÌŒ «·‰Â«Ì… √’€— „‰  «—ÌŒ «·»œ«Ì…", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    Dim cancel As Boolean
    
    Dim sql As String
    
    Dim rs As ADODB.Recordset
    
    Dim DateFilter As String
    DateFilter = "('" & dtFrom.Value & "','" & dtTo.Value & "')"
    sql = " set dateformat DMY SET DATEFIRST 5 Select * from dbo.sf_Get_Employee_Total_Continuance" & _
          DateFilter
          
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not cancel Then
        If Not master.rs.EOF Then _
            master.MoveFirst
    End If
    
    lblCount.Caption = DateDiff("d", dtFrom.Value, dtTo.Value)
    
    Set rs = ExecuteSelect(Conn, "Select dbo.sf_Holidays_Count" & DateFilter, cancel)
    
    If Not cancel Then
        lblHolidays.Caption = rs.Fields(0).Value
        rs.Close
    End If
    
    Set rs = Nothing
    
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state <> ST_SEARCH Or Row <> 1 Then cancel = True
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
    oldScaleWidth = 10350
    FormSettings = 0
    btnSettings = 0
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    fg.ColComboList(1) = "#0;·«|#1;‰⁄„"
    InitFrame
    
    'master.MoveFirst
    Set ActiveFrame = masterFrame
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    dtFrom.Value = Date
    dtTo.Value = Date
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
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    fg.Editable = flexEDKbdMouse
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    fg.Editable = flexEDNone
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    fg.Editable = flexEDNone
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub
