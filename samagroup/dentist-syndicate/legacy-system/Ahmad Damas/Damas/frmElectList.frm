VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmElectList 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ﬁ—Ì— «·ﬁ«∆„… «·⁄‘Ê«∆Ì…"
   ClientHeight    =   6690
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   7080
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6690
   ScaleWidth      =   7080
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ﬁ—Ì— «·ﬁ«∆„… «·⁄‘Ê«∆Ì…"
      Height          =   8790
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   13035
      Begin VB.CheckBox chLastName 
         Alignment       =   1  'Right Justify
         Caption         =   "»«·ﬂ‰Ì…"
         Height          =   375
         Left            =   8640
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   600
         Width           =   975
      End
      Begin VB.CheckBox chNum 
         Alignment       =   1  'Right Justify
         Caption         =   "«·—ﬁ„"
         Height          =   375
         Left            =   10800
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   600
         Width           =   855
      End
      Begin VB.CheckBox chName 
         Alignment       =   1  'Right Justify
         Caption         =   "»«·≈”„ "
         Height          =   375
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   600
         Width           =   975
      End
      Begin VB.CommandButton Command1 
         Caption         =   " ’œÌ— ≈·Ï ≈ﬂ”·"
         Height          =   360
         Left            =   2880
         TabIndex        =   7
         Top             =   600
         Width           =   2145
      End
      Begin VB.CommandButton cmdDeleteAll 
         Caption         =   "≈›—«€ «·»Ì«‰«  „‰ «·ﬁ«∆„…"
         Height          =   360
         Left            =   360
         TabIndex        =   4
         Top             =   600
         Width           =   2145
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   240
         Width           =   12600
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   " ÕœÌÀ «·»Ì«‰« "
         Height          =   360
         Left            =   6240
         TabIndex        =   1
         Top             =   600
         Width           =   2145
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   7155
         Left            =   330
         TabIndex        =   3
         Tag             =   $"frmElectList.frx":0000
         Top             =   1080
         Width           =   12555
         _cx             =   22146
         _cy             =   12621
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
         Cols            =   10
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmElectList.frx":00EE
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
         Caption         =   "«Œ Ì«— «· — Ì»"
         Height          =   375
         Left            =   11760
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   600
         Width           =   975
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
         Left            =   10440
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   8280
         Width           =   1335
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·√ÿ»«¡"
         Height          =   255
         Left            =   11880
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   8280
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmElectList"
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

Private Sub Command1_Click()
   MousePointer = vbHourglass
    Dim sql As String
    Dim cancel As Boolean

    sql = " set dateformat dmy select Doctor_ID , First_Name, Last_Name, Father_Name, Mother_Name, " & _
            "Birth_Place  , BirthDay, Cell_Phone, " & _
            "Clinic_Phone , Clinic_Adress, House_Phone, House_Adress , Field_name" & _
            " from Doctor_CV inner join FixCertificationField on Field_Id = Certification_Field_ID " & _
            " where IsInElectList = 1" & Get_OrderOption
     
    Set master.rs = Nothing
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)

    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
  '  If (master.rs Is Not Null) Then
       If master.rs.EOF Then
         master.MoveFirst
       End If
    Export2Exel master.rs
   ' End If
    MousePointer = vbDefault
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
Private Sub cmdDeleteAll_Click()
    Dim sql As String
    Dim cancel As Boolean

    sql = " update Doctor_CV set IsInElectList = 0"
     
    Set master.rs = Nothing
    
    ExecuteCommand Conn, sql, cancel
    
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    Else
         MsgBox " „  ⁄œÌ· Õ–› Ã„Ì⁄ «·√ÿ»«¡ „‰ «·ﬁ«∆„… «·⁄‘Ê«∆Ì… »‰Ã«Õ"
    End If
    Refresh_Data
End Sub

Private Sub cmdRefresh_Click()
 Refresh_Data
End Sub

Private Sub Form_Load()
    oldScaleWidth = 13170
    FormSettings = btall
    'Data grid counts the header as a row so: "Me.fg.Rows < 1"
    If Not Current_AppUser.IsAdmin Then FormSettings = FormSettings - btUpdate - btsave - btCancel - btNew - btDelete
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    If Not Current_AppUser.IsAdmin Then btnSettings = btnSettings - btUpdate - btsave - btCancel - btNew - btDelete
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
   
    If (controllers.count = 0) Then
        controllers.Add master, masterFrame.name
    End If
     
    Refresh_Data
    InitFrame
     'master.MoveFirst
    Set ActiveFrame = masterFrame
    
    lblRecordCount.Caption = master.rs.RecordCount
    
End Sub
Private Sub InitFrame()

End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    lblRecordCount.Caption = master.rs.RecordCount
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
Private Function Get_OrderOption() As String
        Get_OrderOption = " "
        If (chNum.Value = 1) Then
           Get_OrderOption = " order by Doctor_ID"
        End If
        If (chName.Value = 1) Then
           Get_OrderOption = " order by First_Name"
        End If
        If (chLastName.Value = 1) Then
           Get_OrderOption = " order by Last_Name"
        End If
End Function
Sub Refresh_Data()
    MousePointer = vbHourglass
    Dim sql As String
    Dim cancel As Boolean
    Dim order_Record As String
    'order_Record = Get_OrderOption
    sql = " set dateformat dmy select Doctor_ID , First_Name, Last_Name, Father_Name, Mother_Name, " & _
            "Birth_Place , BirthDay, Cell_Phone, " & _
            "Clinic_Phone , Clinic_Adress, House_Phone, House_Adress , Field_name" & _
            " from Doctor_CV inner join FixCertificationField on Field_Id = Certification_Field_ID " & _
            " where IsInElectList = 1" & Get_OrderOption
      
    Set master.rs = Nothing
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
  '  If (master.rs Is Not Null) Then
       If master.rs.EOF Then
         master.MoveFirst
       End If
   ' End If
    MousePointer = vbDefault
End Sub
Private Sub master_doPrint(rs As ADODB.Recordset)
    
    Get_DataReport_Label_byName(DRDocCvElectList, 1, "lblStateName").Caption = Current_State.FullName
    
    Set DRDocCvElectList.DataSource = master.rs
    
    DRDocCvElectList.Width = 100
    DRDocCvElectList.Show 1
End Sub
Private Sub Export2Exel(res As ADODB.Recordset)
    Dim sFileLocation As String
    Dim file As Application
    Dim oXL, oBook As Object
    
    Dim xlApp As Object
    Dim xlWb As Object
    Dim xlWs As Object
    
    Dim recArray As Variant
    
    Dim strDB As String
    Dim fldCount As Integer
    Dim recCount As Long
    Dim iCol As Integer
    Dim iRow As Integer

    ' Create an instance of Excel and add a workbook
    Set xlApp = CreateObject("Excel.Application")
    Set xlWb = xlApp.Workbooks.Add
    Set xlWs = xlWb.Worksheets("Ê—ﬁ…1")
  
    ' Display Excel and give user control of Excel's lifetime
    xlApp.visible = True
    xlApp.UserControl = True
    
    ' Copy field names to the first row of the worksheet
    fldCount = res.Fields.count
    For iCol = 1 To fldCount
        xlWs.Cells(1, iCol).Value = Get_Arabic_Name(res.Fields(iCol - 1).name)
    Next
    'xlWs.Cells(1, 1).Value = "«·—ﬁ„"
    'xlWs.Cells(1, 2).Value = "«·≈”„ "
   
    ' Check version of Excel
    If val(Mid(xlApp.Version, 1, InStr(1, xlApp.Version, ".") - 1)) > 8 Then
        'EXCEL 2000,2002,2003, or 2007: Use CopyFromRecordset
         
        ' Copy the recordset to the worksheet, starting in cell A2
        If (res.state = 0) Then
            res.Open Get_Sql_Statment, Conn, , , adCmdText
        End If
            xlWs.Cells(2, 1).CopyFromRecordset res
       
        'Note: CopyFromRecordset will fail if the recordset
        'contains an OLE object field or array data such
        'as hierarchical recordsets
        
    End If
    ' Close ADO objects
    'res.Close
   ' Set res = Nothing
    ' Release Excel references
    Set xlWs = Nothing
    Set xlWb = Nothing

    Set xlApp = Nothing
End Sub
Private Function Get_Arabic_Name(column_Name As String) As String
  
    Dim sql As String
    Dim cancel As Boolean
    Dim recSet As ADODB.Recordset

    sql = "  select Arabic_name   from Report_Options " & _
            " where English_Name like  '" & column_Name & "'"
     
    Set recSet = Nothing
    
    Set recSet = ExecuteSelect(Conn, sql, cancel)
    
    If cancel Then
        MsgBox "Õ’· Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Function
    End If
    Get_Arabic_Name = recSet.Fields(0).Value

End Function

Private Sub chLastName_Click()
  If (chLastName.Value = 1) Then
    chName.Enabled = False
    chNum.Enabled = False
  Else
    chName.Enabled = True
    chNum.Enabled = True
  End If
End Sub

Private Sub chName_Click()
 If (chName.Value = 1) Then
    chLastName.Enabled = False
    chNum.Enabled = False
  Else
    chLastName.Enabled = True
    chNum.Enabled = True
  End If
End Sub

Private Sub chNum_Click()
 If (chNum.Value = 1) Then
    chLastName.Enabled = False
    chName.Enabled = False
  Else
    chLastName.Enabled = True
    chName.Enabled = True
  End If
End Sub
