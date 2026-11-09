VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Pic_Prices 
   BackColor       =   &H00E1FEFF&
   Caption         =   "⁄Ì«œ… «·„—÷Ï"
   ClientHeight    =   6990
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   10740
   Icon            =   "Pic_Prices.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6990
   ScaleWidth      =   10740
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command1 
      Caption         =   " ÿ»Ìﬁ √”⁄«— «·„⁄«·Ã« "
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   4920
      Width           =   2055
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»ÿ«ﬁ… „—Ì÷"
      Height          =   4695
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   10575
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
         Width           =   10335
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4095
         Left            =   120
         TabIndex        =   2
         Tag             =   ";typeof=vsflexgrid;datafield=,0:name,1:MinUnit,2:MaxUnit,3:Unit,4:MinSp,5:MaxSp,6:Sp,;"
         Top             =   480
         Width           =   10335
         _cx             =   18230
         _cy             =   7223
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
         BackColor       =   16777215
         ForeColor       =   -2147483640
         BackColorFixed  =   -2147483633
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
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   1
         SelectionMode   =   0
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   7
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   600
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"Pic_Prices.frx":1CFA
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
End
Attribute VB_Name = "Pic_Prices"
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
Dim GlobalTreatNames As String

Private Sub Command1_Click()
    dlgPriceApplay.Show 1
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    'RefreshCommands btAll, False
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    'fillCmb cmbIhalaOrFix, "(select 1 as ID,'«·≈Õ«·…' as Name) union (select 2 as ID,'«·›Õ’' as Name)"
    oldScaleWidth = 10860
    FormSettings = btall - btDelete - btNew
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Dim sql As String
    '''''''''''''''''''''''''''
    '<Mohamad Masrie> Â–« «·ﬂÊœ ·Õ–›  ﬂ—«— «·„⁄«·Ã«  ›Ì « ›«ﬁÌ… «·‘—Êÿ
    'Dim rsTreat As ADODB.Recordset
    'Dim rsGetID As ADODB.Recordset
    'Dim sqlGetRep As String
    'Dim idTeeth As Integer
    'Dim idTreat As Integer
    'Dim idOrg As Integer
    'sql = "SELECT     id, treatID, organization_id, rowguid ,available  FROM         Pic_CommTeethTreat"
    ' Set rsTreat = ExecuteSelect(Conn, sql, cancel)
    ' Do While Not rsTreat.EOF
    '        idTeeth = rsTreat.Fields(0).Value
    '         idTreat = rsTreat.Fields(1).Value
    '         idOrg = rsTreat.Fields(2).Value
    '         sqlGetRep = " SELECT     id, treatID, organization_id, rowguid FROM  Pic_CommTeethTreat where " & _
    '             " id = " & idTeeth & " and treatID= " & idTreat & " and organization_id= " & idOrg
    '          Set rsGetID = ExecuteSelect(Conn, sqlGetRep, cancel)
    '          If rsGetID.RecordCount > 1 Then
    '           ' sql = ""
    '             ExecuteCommand Conn, "delete from Pic_CommTeethTreat where rowguid = '" & rsTreat.Fields(3).Value & "'", cancel
    '          End If
    '    rsTreat.MoveNext
    ' Loop
    ''''''''''''''''''''''''''''''''''''''
    '<Mohamad Masrie> Â–« «·ﬂÊœ ·Õ–›  ﬂ—«— √”⁄«— «·„⁄«·Ã… «·Ê«Õœ… „— Ì‰
    '    Dim rsTreat As ADODB.Recordset
    'Dim rsGetID As ADODB.Recordset
    'Dim sqlGetRep As String
    'Dim idTreat As Integer
    'sql = "select  imgTreat , rowguid  from pic_TreatExam"
    ' Set rsTreat = ExecuteSelect(Conn, sql, cancel)
    ' Do While Not rsTreat.EOF
    '         idTreat = rsTreat.Fields(0).Value
    '         sqlGetRep = " select * from pic_TreatExam where imgTreat = " & idTreat
    '          Set rsGetID = ExecuteSelect(Conn, sqlGetRep, cancel)
    '          If rsGetID.RecordCount > 1 Then
               ' sql = ""
    '             ExecuteCommand Conn, "delete from Pic_TreatExam where rowguid = '" & rsTreat.Fields(1).Value & "'", cancel
    '          End If
    '    rsTreat.MoveNext
    ' Loop
    ' ''''''''''''Â–« «·ﬂÊœ ·«” »œ«· «”„ «· ”⁄Ì—… »«”„ «·„⁄«·Ã… «·ÕﬁÌﬁÌ
  ' Dim rsTreat As ADODB.Recordset
  '  Dim rsGetID As ADODB.Recordset
  '  Dim sqlGetRep As String
  '  Dim PriceidTreat As Integer
  '  Dim mainTreatName As String
  '
  '  sql = "select   pt.name TreatName ,  pt.id as TreatID ,  ptx.realTreat  realTreat,fe.name fixExamName       " & _
  '   "from FixExam fe inner join Pic_TreatExam ptx on  ptx.realTreat = fe.num " & _
  '  "inner join Pic_Treats pt on pt.id = ptx.imgTreat "
  '
  '   Set rsTreat = ExecuteSelect(Conn, sql, cancel)
  '   Do While Not rsTreat.EOF
  '           PriceidTreat = rsTreat.Fields("realTreat").Value
  '          mainTreatName = rsTreat.Fields("TreatName").Value
  '           sqlGetRep = "update FixExam set name = '" & mainTreatName & "'  where num = " & PriceidTreat
  '           ExecuteCommand Conn, sqlGetRep, cancel
  '      rsTreat.MoveNext
  '  Loop
     '<Mohamad Masrie>
    '''''''''''''''''''''''''''''''''''''''
     sql = "select    pt.name , fe.[MinUnit], fe.[MinSp]," & _
             " fe.[MaxUnit] , fe.[MaxSp], fe.[Unit], fe.[Sp]  " & _
             "  from FixExam fe inner join Pic_TreatExam ptx on  ptx.realTreat = fe.num " & _
             " inner join Pic_Treats pt on pt.id = ptx.imgTreat   "
   ' sql = "select * from FixExam order by num"
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    'fg.ColComboList(7) = "#0;€Ì«» »œÊ‰ ⁄–—|#1;€Ì«» »⁄–—|#2;Õ÷Ê—|"
    'GetGlobalTreatNames
    'fg.ColComboList(7) = GlobalTreatNames
    Set ActiveFrame = masterFrame
End Sub
Private Sub GetGlobalTreatNames()
  Dim sql As String
  Dim i As Integer
  Dim cancel As Boolean
  Dim rsNamesTreat As ADODB.Recordset
  GlobalTreatNames = ""
  sql = "select '|#'+cast( NumAsParent as varchar)+';'+name as fullName  from Pic_GlobalTreatNames  "
  Set rsNamesTreat = ExecuteSelect(Conn, sql, cancel)
    If cancel Then
        '    MsgBox '·„ Ì „ ≈Ã÷«— √”„«¡ «·„⁄«·Ã« '
        GlobalTreatNames = ""
        Exit Sub
    End If
    
    For i = 1 To rsNamesTreat.RecordCount
       If Not rsNamesTreat.EOF Then
           GlobalTreatNames = GlobalTreatNames & rsNamesTreat.Fields(0).Value
        End If
        rsNamesTreat.MoveNext
    Next
End Sub
Private Sub Form_Resize()
    Dim Alpha As Double
    If oldScaleWidth = 0 Then
        oldScaleWidth = ScaleWidth
        Exit Sub
    End If
    If MDIMain.WindowState = vbMinimized Then Exit Sub
    
    If Me.WindowState = vbMinimized Then Exit Sub
    
    If ScaleWidth = 0 Then
        Exit Sub
    End If
    Alpha = ScaleWidth / oldScaleWidth
'    masterFrame.Top = masterFrame.Top * Alpha
'    masterFrame.Left = masterFrame.Left * Alpha
    Dim ctrl As Control
    For Each ctrl In Me.Controls
        ctrl.Left = ctrl.Left * Alpha
        ctrl.Width = ctrl.Width * Alpha
    Next
    oldScaleWidth = ScaleWidth
    
    'resize grid
    ResizeGrid fg
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, ByRef rs As ADODB.Recordset, ByRef ErrorObeject As ErrObject, ByRef msg As String, ByRef KeepState As Boolean)
     Dim strError As String
     strError = master.rs.ActiveConnection.Errors(0).description
     'MsgBox strError
    If InStr(1, strError, "IX_FixExam") Then
         msg = "Â‰«·ﬂ „⁄«·Ã… »‰›” «·≈”„ . ÌÃ» ⁄œ„ ≈÷«›… „⁄«·Ã Ì‰ »‰›” «·≈”„."
    'Else
    '    msg = "Â‰«·ﬂ „⁄«·Ã… »‰›” «·≈”„ . ÌÃ» ⁄œ„ ≈÷«›… „⁄«·Ã Ì‰ »‰›” «·≈”„."
    End If
    KeepState = True
  End Sub
Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

