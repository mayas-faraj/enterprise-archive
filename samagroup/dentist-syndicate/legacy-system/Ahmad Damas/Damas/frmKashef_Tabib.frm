VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmKashef_Tabib 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ﬂ‘› ≈Õ«·«  ÿ»Ì»"
   ClientHeight    =   8340
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   14880
   Icon            =   "frmKashef_Tabib.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8340
   ScaleWidth      =   14880
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬂ‘› ≈Õ«·«  ÿ»Ì»"
      Height          =   7965
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   120
      Width           =   14670
      Begin MSComCtl2.DTPicker dtYear 
         Height          =   375
         Left            =   8265
         TabIndex        =   22
         Top             =   1635
         Width           =   3480
         _ExtentX        =   6138
         _ExtentY        =   661
         _Version        =   393216
         CustomFormat    =   "yyyy"
         Format          =   51904515
         CurrentDate     =   40179
      End
      Begin VB.ComboBox cmbQuarter 
         Height          =   315
         ItemData        =   "frmKashef_Tabib.frx":1CFA
         Left            =   2055
         List            =   "frmKashef_Tabib.frx":1D0A
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   1170
         Width           =   4560
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "⁄—÷ «·»Ì«‰« "
         Height          =   330
         Left            =   13080
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1905
         Width           =   1365
      End
      Begin VB.ComboBox cmbMonth 
         Height          =   315
         Left            =   8288
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   1170
         Width           =   3390
      End
      Begin VB.OptionButton optQuarter 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄‰ «·—Ì⁄"
         Height          =   240
         Left            =   6893
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1215
         Width           =   960
      End
      Begin VB.OptionButton optMonth 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄‰ ‘Â—"
         Height          =   240
         Left            =   11888
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   1215
         Value           =   -1  'True
         Width           =   1005
      End
      Begin VB.TextBox txtCurer_Doctor_ID 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   8783
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   585
         Width           =   2850
      End
      Begin VB.TextBox txtCurer_Doctor_Name 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   2033
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   585
         Width           =   4605
      End
      Begin VB.CommandButton cmdSelect_Organization 
         Caption         =   "..."
         Height          =   375
         Left            =   8288
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   585
         Width           =   420
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
         Width           =   14460
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   4905
         Left            =   180
         TabIndex        =   11
         Top             =   2280
         Width           =   14325
         _cx             =   25268
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
         Cols            =   13
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmKashef_Tabib.frx":1D2D
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
      Begin VB.Label lblYear 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‰ ”‰…"
         Height          =   285
         Left            =   11820
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Top             =   1680
         Width           =   765
      End
      Begin VB.Label lblTotal 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
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
         Left            =   1845
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Top             =   7425
         Width           =   1575
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ﬁÌ„… «·≈Ã„«·Ì… ··ﬂ‘›"
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
         Left            =   3600
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Top             =   7485
         Width           =   1590
      End
      Begin VB.Label lblNotMoved 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
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
         Left            =   5760
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   7425
         Width           =   1575
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "€Ì— „—Õ·…"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   7470
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   7485
         Width           =   720
      End
      Begin VB.Label lblMoved 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
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
         Left            =   8370
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   7425
         Width           =   1575
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„—Õ·…"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   240
         Left            =   10170
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   7485
         Width           =   420
      End
      Begin VB.Label lblCount 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
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
         Left            =   10755
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   7425
         Width           =   1575
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "⁄œœ «·≈Õ«·« "
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
         Left            =   12405
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Top             =   7485
         Width           =   885
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "—ﬁ„ «·ÿ»Ì»"
         Height          =   285
         Left            =   11843
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   675
         Width           =   1005
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«”„ «·ÿ»Ì»"
         Height          =   285
         Left            =   6938
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   675
         Width           =   915
      End
   End
End
Attribute VB_Name = "frmKashef_Tabib"
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
Dim Curer_Doctor_checked
Sub Coloring_Grid()
    
    Dim i As Integer
    Dim j As Integer
    
    MousePointer = vbHourglass
    
    For i = 1 To fg.Rows - 1
        
        If val(fg.TextMatrix(i, 7)) = 1 Then
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(12)
            Next j
        Else
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(9)
            Next j
        End If
        
    Next i
    
    MousePointer = vbDefault
    
End Sub
Sub Set_Curer_Doctor_ID(Value As String)
    txtCurer_Doctor_ID.text = Value
End Sub
Sub Set_Curer_Doctor_Name(Value As String)
    txtCurer_Doctor_Name.text = Value
End Sub
Sub Select_Curer_Doctor()
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    Curer_Doctor_checked = False

'    sql = "select First_Name + ' ' + Last_Name as Name ,Doctor_ID as ID,Father_Name,Mother_Name from VCollaborative_Doctors" & _
'          " where Doctor_id = " & val(txtCurer_Doctor_ID.text) & " order by doctor_ID"

    sql = "select First_Name + ' ' + Last_Name as Name ,Doctor_ID as ID,Father_Name,Mother_Name from Doctor_CV" & _
          " where IsCollaborative_Member = 1 and Doctor_id = " & val(txtCurer_Doctor_ID.text) & " order by doctor_ID"

   Set rs = ExecuteSelect(Conn, sql, c)

   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Curer_Doctor_checked = False
        Exit Sub
   End If

   If rs.RecordCount <> 1 Then
       rs.Close

          sql = "select first_name + ' ' + last_name as Name ,Doctor_ID as ID,Father_Name,Mother_Name " & _
                "from Doctor_CV Where IsCollaborative_Member = 1 order by doctor_ID"

          Set rs = ExecuteSelect(Conn, sql, c)

          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Curer_Doctor_checked = False
               Exit Sub
          End If
          If rs.RecordCount <> 1 Then
               'Load Clin_List
              'Set Clin_List.callerForm = Me
              GLOBAL_TAG = "datafield=,0:id,1:Name,2:Father_Name,3:Mother_Name,;"
              GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Curer_Doctor_ID,1:Set_Curer_Doctor_Name,;"
               If txtCurer_Doctor_ID.text <> "" Then
                    GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & txtCurer_Doctor_ID.text & ",;"
                Else
                    GLOBAL_TAG = GLOBAL_TAG & "initQuery=,4:p,;"
               End If
              GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
              btnSettings = GetBtnSettings
              Clin_List.fg.Cols = 4
              Clin_List.fg.ColAlignment(3) = 7
              Clin_List.fg.FixedAlignment(3) = 7
              Clin_List.fg.ColWidth(0) = 1000
              Clin_List.fg.ColWidth(1) = 2000
              Clin_List.fg.ColWidth(2) = 1000
              Clin_List.fg.ColWidth(3) = 1000
              Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
              Clin_List.fg.Cell(flexcpText, 0, 0) = "«·—ﬁ„ «·–« Ì"
              Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·ÿ»Ì»"
              Clin_List.fg.Cell(flexcpText, 0, 2) = "«·√»"
              Clin_List.fg.Cell(flexcpText, 0, 3) = "«·√„"
              Set Clin_List.CallerForm = Me
              Clin_List.Show 1
              RefreshCommands btnSettings And FormSettings
              Exit Sub
          End If
    ElseIf rs.RecordCount = 1 Then
         txtCurer_Doctor_ID.text = rs.Fields("ID").Value
         txtCurer_Doctor_Name.text = rs.Fields("Name").Value
         Curer_Doctor_checked = True
    End If

End Sub


'    'Mahfoud
'    GLOBAL_TAG = ";datafield=,0:id,1:code,2:name,;"
'    GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetGroupId,2:SetGroupName,;"
'    GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=SELECT id, code, name FROM Stock_Group;"
'    If TxtGroupInfo.text <> "" Then
'        GLOBAL_TAG = GLOBAL_TAG & "initQuery=,2:" & TxtGroupInfo.text & ",;"
'    End If
'
'    Dim currBtns As Long
'    currBtns = GetBtnSettings
'
'    Clin_List.fg.Cols = 3
'    Clin_List.fg.ColHidden(0) = True
'    Clin_List.fg.ColHidden(1) = False
'    Clin_List.fg.ColHidden(2) = False
'    Clin_List.fg.ColWidth(0) = 0
'    Clin_List.fg.ColWidth(1) = 1000
'    Clin_List.fg.ColWidth(2) = 4000
'    Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
'    Clin_List.fg.Cell(flexcpText, 0, 2) = "«”„ «·„Ã„Ê⁄…"
'    Clin_List.fg.Cell(flexcpText, 0, 1) = "—„“ «·„Ã„Ê⁄…"
'    Set Clin_List.callerForm = Me
'
'    Clin_List.Show 1
    
'End Sub

Function Get_Date_Filter() As String
    
    Dim Start_Date As String
    Dim End_Date As String
    
    If optMonth.Value Then
        
        Get_Date_Filter = " And datePart(month,Expose_Date) = " & cmbMonth.ItemData(cmbMonth.ListIndex) & _
                            " And datePart(year,Expose_Date) = " & year(dtYear.Value)
        Exit Function
        
    Else
        
        Select Case cmbQuarter.ItemData(cmbQuarter.ListIndex)
        Case 1
            Start_Date = "01/01/" & year(dtYear.Value)
            End_Date = "31/03/" & year(dtYear.Value)
        Case 2
            Start_Date = "01/04/" & year(dtYear.Value)
            End_Date = "30/06/" & year(dtYear.Value)
        Case 3
            Start_Date = "01/07/" & year(dtYear.Value)
            End_Date = "30/09/" & year(dtYear.Value)
        Case 4
            Start_Date = "01/10/" & year(dtYear.Value)
            End_Date = "31/12/" & year(dtYear.Value)
        End Select
        Get_Date_Filter = " And Expose_Date between '" & Start_Date & "' And '" & End_Date & "' "
    End If
    
End Function

Private Sub cmdRefresh_Click()
    If txtCurer_Doctor_ID.text = "" Or txtCurer_Doctor_Name.text = "" Then
        MsgBox "ÌÃ» «Œ Ì«— ÿ»Ì» „« ﬁ»· ÿ·» «·ﬂ‘›", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        txtCurer_Doctor_ID.SetFocus
        Exit Sub
    End If
    
    Dim cancel As Boolean
    
    MousePointer = vbHourglass
    Dim rsDiscountsInfo As ADODB.Recordset
    sql = "select * from Acc_ConstKashef Where ID = (select max(ID) from Acc_ConstKashef)"
    Set rsDiscountsInfo = ExecuteSelect(Conn, sql, cancel)
    If cancel Or rsDiscountsInfo Is Nothing Then
        MsgBox "ÌÃ»  ÕœÌœ ‰”»… «·ÿ»Ì»", vbMsgBoxRtlReading + vbInformation, "‰”»… «·ÿ»Ì»"
        Exit Sub
    End If
'    sql = "Set DATEFORMAT DMY SELECT Central_Exam_ID,Central_Exam_Date,Expose_Date,Patient_Name,Organization_ID, " & _
'          "Organization_Name,case isNull(Whole_Total,0) when 0 then  isNull(Price,0) else Whole_Total end - isNull(Price,0) as Treatment_Total,Moved,discount,Discount_Reason,price " & _
'          "from vCentral_Exam where 1=1 "
    
    sql = "Set DATEFORMAT DMY Select vCentral_Exam.*,cast(((Treatment_Total - isNull(discount,0)) * " & rsDiscountsInfo!desert_percent & " /100 ) as integer) -cast(isnull(Has_More_Discount,0)*isnull(cdk.discount_percent,0)* Treatment_Total/100 as integer) as TabibShare,"
    sql = sql + " Treatment_Total +cast(isnull(Has_More_Discount,0)*isnull(cdk.discount_percent,0)* Treatment_Total/100 as integer) - cast(((Treatment_Total - isNull(discount,0)) * " & rsDiscountsInfo!desert_percent & " /100 ) as integer) as branchShare"
    sql = sql + " from vCentral_Exam ,Acc_ConstDiscountKashef cdk Where cdk.ID =(select top 1 year(cdate) from acc_Daily) "
    
    sql = sql + Get_Date_Filter
    
    sql = sql + " And Curer_Doctor_ID = " & val(txtCurer_Doctor_ID.text) & " order by Central_Exam_ID"
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not master.rs.EOF Then
        master.rs.MoveFirst
    End If
    
    
    Dim Total As Long
    Dim Moved As Integer
    Dim j As Integer
    Dim i As Integer
    
    Total = 0
    Moved = 0
    
    For i = 1 To fg.Rows - 1
        
        Total = Total + val(fg.TextMatrix(i, 6))
        
        If val(fg.TextMatrix(i, 7)) = 1 Then
            Moved = Moved + 1
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, i, j) = QBColor(12)
            Next j
'        Else
'            For j = 0 To fg.Cols - 1
'                fg.Cell(flexcpForeColor, i, j) = QBColor(7)
'            Next j
        End If
        
    Next i
    
    lblMoved.Caption = Moved
    lblCount.Caption = fg.Rows - 1
    lblNotMoved.Caption = fg.Rows - 1 - Moved
    lblTotal.Caption = Total
    MousePointer = vbDefault
    
    Coloring_Grid
    ResizeGrid fg
End Sub



Private Sub cmdSelect_Organization_Click()
    txtCurer_Doctor_ID_Validate False
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
    Dim rsDiscountsInfo As ADODB.Recordset
    Dim canccc As Boolean
    sql = "select * from Acc_ConstKashef Where ID = (select max(ID) from Acc_ConstKashef)"
    canccc = False
    Set rsDiscountsInfo = ExecuteSelect(Conn, sql, canccc)
    If canccc Or rsDiscountsInfo Is Nothing Then
        MsgBox "ÌÃ»  ÕœÌœ ‰”»… «·ÿ»Ì»", vbMsgBoxRtlReading + vbInformation, "‰”»… «·ÿ»Ì»"
    Else
    Dim val As Double
    val = rsDiscountsInfo!desert_percent
    fg.Cell(flexcpText, 0, 11) = "’«›Ì «·ÿ»Ì»(" & val & "%)"
    fg.Cell(flexcpText, 0, 12) = "Õ’… «·‰ﬁ«»…(" & (100 - val) & "%)"
    End If
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub
Private Sub Form_Load()
    oldScaleWidth = 15000 ' TODO: Put the Form.Width value here
    FormSettings = btall - btsave - btnew - btUpdate - btDelete - btCancel
    btnSettings = btall - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    InitFrame
    optMonth_Click
    sql = "Select * from vCentral_Exam where 0 = 1"
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    fg.ColComboList(7) = "#0;€Ì— „—Õ·…|#1;„—Õ·…"
'    If DataEnvironment.Conn.state = 0 Then _
'        DataEnvironment.Conn.Open (GetConnectionString(1))
    'master.MoveFirst
    Set ActiveFrame = masterFrame
    If Current_State.Show_Per_Company = False Then
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Central_Exam_ID,1:Central_Exam_Date,2:Expose_Date,3:Patient_Name,4:Organization_ID,5:Organization_Name,6:Treatment_Total,7:Moved,8:discount,9:Discount_Reason,10:price,11:TabibShare,12:BranchShare,;"
    Else
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Ihala_ID_in_Company,1:Central_Exam_Date,2:Expose_Date,3:Patient_Name,4:Organization_ID,5:Organization_Name,6:Treatment_Total,7:Moved,8:discount,9:Discount_Reason,10:price,11:TabibShare,12:BranchShare,;"
    End If
End Sub
Private Sub InitFrame()
    ' Lookups & Initialize stuff
    With cmbMonth
        .AddItem "ﬂ«‰Ê‰ «·À«‰Ì"
        .ItemData(.NewIndex) = 1
        .AddItem "‘»«ÿ"
        .ItemData(.NewIndex) = 2
        .AddItem "¬–«—"
        .ItemData(.NewIndex) = 3
        .AddItem "‰Ì”«‰"
        .ItemData(.NewIndex) = 4
        .AddItem "√Ì«—"
        .ItemData(.NewIndex) = 5
        .AddItem "Õ“Ì—«‰"
        .ItemData(.NewIndex) = 6
        .AddItem " „Ê“"
        .ItemData(.NewIndex) = 7
        .AddItem "¬»"
        .ItemData(.NewIndex) = 8
        .AddItem "√Ì·Ê·"
        .ItemData(.NewIndex) = 9
        .AddItem " ‘—Ì‰ «·√Ê·"
        .ItemData(.NewIndex) = 10
        .AddItem " ‘—Ì‰ «·À«‰Ì"
        .ItemData(.NewIndex) = 11
        .AddItem "ﬂ«‰Ê‰ «·√Ê·"
        .ItemData(.NewIndex) = 12
        .ListIndex = 0
    End With
    cmbQuarter.ListIndex = 0
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
    Coloring_Grid
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
'    DataEnvironment.Commands(1).CommandType = adCmdText
'    DataEnvironment.Commands(1).CommandText = sql
    Dim Filter  As Variant
    Filter = master.rs.Filter
    cmdRefresh_Click
    master.rs.Filter = Filter
    With DRDocList
        Get_DataReport_Label_byName(DRDocList, 1, "lblStateName").Caption = Current_State.name
        If optMonth.Value Then
            Get_DataReport_Label_byName(DRDocList, 1, "lblperiod_Title").Caption = "⁄‰ ‘Â—"
            Get_DataReport_Label_byName(DRDocList, 1, "lblperiod").Caption = cmbMonth.text
        Else
            Get_DataReport_Label_byName(DRDocList, 1, "lblperiod").Caption = cmbQuarter.text
        End If
        Get_DataReport_Label_byName(DRDocList, 1, "lblYear").Caption = year(dtYear.Value)
        Get_DataReport_Label_byName(DRDocList, 1, "lblCurer_Doctor_Name").Caption = txtCurer_Doctor_Name.text
        Set .DataSource = master.rs 'DataEnvironment
        .DataMember = "" '"vCentral_Exam"
        .Show 1
    End With
    
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    Coloring_Grid
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub optMonth_Click()
     cmbMonth.Enabled = optMonth.Value
     cmbQuarter.Enabled = Not optMonth.Value
    
End Sub

Private Sub optQuarter_Click()
    cmbMonth.Enabled = Not optQuarter.Value
    cmbQuarter.Enabled = optQuarter.Value
End Sub

Private Sub txtCurer_Doctor_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        txtCurer_Doctor_ID_Validate False
        Exit Sub
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub
Private Sub txtCurer_Doctor_ID_Validate(cancel As Boolean)
    Select_Curer_Doctor
    cancel = Not Curer_Doctor_checked
End Sub
