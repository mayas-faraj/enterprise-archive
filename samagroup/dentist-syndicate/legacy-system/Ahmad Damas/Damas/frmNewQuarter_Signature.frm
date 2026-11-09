VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form frmNewQuarter_Signature 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ÊﬁÌ⁄ «·√—»«⁄"
   ClientHeight    =   9060
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   12165
   Icon            =   "frmNewQuarter_Signature.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   9060
   ScaleWidth      =   12165
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ÊﬁÌ⁄ «·√—»«⁄"
      Height          =   1095
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   0
      Width           =   12030
      Begin VB.OptionButton rbName 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«”„ «·ÿ»Ì»"
         Height          =   300
         Left            =   4680
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Top             =   600
         Width           =   1500
      End
      Begin VB.OptionButton rbNumber 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·—ﬁ„ «·–« Ì"
         Height          =   300
         Left            =   5760
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Top             =   600
         Value           =   -1  'True
         Width           =   1500
      End
      Begin VB.TextBox txtYear 
         Alignment       =   1  'Right Justify
         DataField       =   "Quarter_Signature_Year"
         Height          =   330
         Left            =   9525
         MaxLength       =   4
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";check=integer>0;check=reuired;search=true;"
         Top             =   525
         Width           =   1860
      End
      Begin VB.CheckBox chkmasterFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   0
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   240
         Width           =   11955
      End
      Begin VB.CommandButton cmdUpdate_Details_List 
         Caption         =   " ⁄œÌ· ﬁ«∆„… «·√ÿ»«¡"
         Enabled         =   0   'False
         Height          =   195
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   600
         Visible         =   0   'False
         Width           =   75
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "«· — Ì» »Õ”»:"
         Height          =   255
         Left            =   7320
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·”‰…"
         Height          =   195
         Left            =   11565
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Tag             =   ";search=true;"
         Top             =   570
         Width           =   360
      End
   End
   Begin VB.Frame detailFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«· Ê«ﬁÌ⁄"
      Height          =   7935
      Left            =   135
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   ";repeat=true;"
      Top             =   1125
      Width           =   12015
      Begin VB.CheckBox chkdetailFrame 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   240
         Width           =   11670
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   6315
         Left            =   240
         TabIndex        =   5
         Tag             =   ";typeof=vsflexgrid;datafield=,0:Doctor_ID,1:Full_Name,2:Quarter1,3:Quarter2,4:Quarter3,5:Quarter4,6:Quarter_Count,7:IsCanceled,;"
         Top             =   495
         Width           =   11595
         _cx             =   20452
         _cy             =   11139
         _ConvInfo       =   1
         Appearance      =   1
         BorderStyle     =   1
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman"
            Size            =   14.25
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
         SelectionMode   =   1
         GridLines       =   1
         GridLinesFixed  =   2
         GridLineWidth   =   1
         Rows            =   1
         Cols            =   8
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmNewQuarter_Signature.frx":1CFA
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
      Begin VB.Label lblIsCanceled_Count 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   7320
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   6930
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·„‘ÿÊ»Ì‰"
         Height          =   240
         Index           =   6
         Left            =   8490
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   6990
         Width           =   1020
      End
      Begin VB.Label lblAllQuarters 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   9592
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·√—»«⁄ «·„Êﬁ⁄…"
         Height          =   195
         Index           =   5
         Left            =   10612
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7530
         Width           =   1290
      End
      Begin VB.Label lblOne_Quarter 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   982
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "—»⁄ Ê«Õœ"
         Height          =   195
         Index           =   4
         Left            =   2122
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7530
         Width           =   615
      End
      Begin VB.Label lblTwo_Quarters 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   3022
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "—»⁄Ì‰"
         Height          =   195
         Index           =   3
         Left            =   4297
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7530
         Width           =   390
      End
      Begin VB.Label lblTree_Quarters 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   4942
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "À·«À… √—»«⁄"
         Height          =   195
         Index           =   2
         Left            =   6247
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7530
         Width           =   720
      End
      Begin VB.Label lblFour_Quarters 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   7327
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7440
         Width           =   990
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         Caption         =   "√—»⁄… √—»«⁄"
         Height          =   195
         Index           =   1
         Left            =   8557
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7530
         Width           =   810
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·”Ã·« "
         Height          =   240
         Index           =   0
         Left            =   10882
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   6960
         Width           =   1020
      End
      Begin VB.Label lblCount 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Simplified Arabic"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   9592
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   6900
         Width           =   990
      End
   End
End
Attribute VB_Name = "frmNewQuarter_Signature"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public WithEvents master As Controller
Attribute master.VB_VarHelpID = -1
Public WithEvents details As Controller
Attribute details.VB_VarHelpID = -1
Public controllers As New Collection
Dim ActiveFrame As frame
Public FormSettings As Long
Public btnSettings As Long
Public FormDetailSettings As Long
Public btnDetailSettings As Long
Dim oldScaleWidth As Long
Dim Save_After As Controller_State
Dim searchResult As ADODB.Recordset
Dim rs As ADODB.Recordset

Dim numRecord As Integer
Dim prev_year As Integer


Sub Coloring_Grid()
    Dim i As Integer
    Dim j As Integer
    For i = 1 To fg.Rows - 1
        If val(fg.TextMatrix(i, 7)) = 1 Then
                For j = 0 To fg.Cols - 1
                    fg.Cell(flexcpForeColor, i, j) = QBColor(12) 'red
                Next j
        Else
            For j = 0 To fg.Cols - 1
                    fg.Cell(flexcpForeColor, i, j) = QBColor(0) 'black
                Next j
        End If
    Next i
End Sub
Sub Set_IsCanceled_Count()
    Dim i As Integer
    Dim start_row As Integer
    lblIsCanceled_Count.Caption = 0
    
    Dim rs As ADODB.Recordset
    
    
    Set rs = details.rs.Clone
    
    rs.Filter = "IsCanceled = 1"
    
    lblIsCanceled_Count.Caption = rs.RecordCount
    
    Set rs = Nothing
    
End Sub
Sub Get_Summaries()
      
    Dim cancel As Boolean
    Dim sql As String
    Dim rs As New ADODB.Recordset
    
    
    lblFour_Quarters.Caption = 0
    lblTree_Quarters.Caption = 0
    lblTwo_Quarters.Caption = 0
    lblOne_Quarter.Caption = 0
    If master.rs.EOF Or master.rs.BOF Then Exit Sub
    If master.rs.RecordCount = 0 Then Exit Sub
    
    sql = " Select Doctor_id from Quarter_Signature qs ,Quarter_Sinature_Details  qsd " & _
          " Where qs.Quarter_ID =qsd.Quarter_ID and qs.Quarter_Year = " & _
            master.rs.Fields("Quarter_Signature_Year").Value & _
          " group by Doctor_id " & _
          " Having Sum(Sinature_Status) = "
    Set rs = ExecuteSelect(Conn, sql & 1 & ";" & sql & 2 & ";" & sql & 3 & ";" & sql & 4, cancel)


    
    lblOne_Quarter.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblTwo_Quarters.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblTree_Quarters.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblFour_Quarters.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblAllQuarters.Caption = val(lblFour_Quarters.Caption) + val(lblTree_Quarters.Caption) + val(lblTwo_Quarters.Caption) + val(lblOne_Quarter.Caption)
    Set rs = Nothing
    lblCount.Caption = fg.Rows - 1
    
End Sub
Function Get_Last_ID()
    Dim cancel As Boolean
    Dim sql As String
    Dim TmpRs As New ADODB.Recordset
    
    Set TmpRs = ExecuteSelect(Conn, "Select max(Signature_Year_id) from NewQuarter_Signature_Years", cancel)
    
    Get_Last_ID = TmpRs.Fields(0).Value
    
    Set TmpRs = Nothing
End Function

Private Sub cmdUpdate_Details_List_Click()
    Dim preFormSettings As Long
    Dim preBtnSettings As Long
    If master.rs.RecordCount = 0 Then Exit Sub
    If Not IsValidNumber(txtYear.text, "integer") Then Exit Sub
    preBtnSettings = btnSettings
    preFormSettings = FormSettings
    dlgQuarter_Signature_Refresh_List.Quarter_Year = txtYear.text
    dlgQuarter_Signature_Refresh_List.Show 1
    FormSettings = preFormSettings
    btnSettings = preBtnSettings
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub detailFrame_Click()
    If ActiveFrame = detailFrame Then
        Exit Sub
    End If
    btnSettings = GetBtnSettings
    SelectFrame Me, detailFrame
    Set ActiveFrame = detailFrame
    RefreshCommands FormDetailSettings And btnDetailSettings
End Sub

Private Sub Details_doBeginSearch(rs As ADODB.Recordset)
    lblCount.Caption = rs.RecordCount
    Set_IsCanceled_Count
End Sub


Private Sub Details_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:Doctor_ID,1:Full_Name,2:Quarter1,3:Quarter2,4:Quarter3,5:Quarter4,6:Quarter_Count,7:IsCanceled,;"
End Sub

Private Sub Details_doCancelSearch(rs As ADODB.Recordset)
    lblCount.Caption = rs.RecordCount
    lblIsCanceled_Count.Caption = 0
End Sub

Private Sub Details_doMoveComplete(rs As ADODB.Recordset)
    On Error GoTo 10
    Dim j As Integer
    If val(fg.TextMatrix(rs.AbsolutePosition, 7)) = 1 Then
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, rs.AbsolutePosition, j) = QBColor(12)
            Next j
    End If
    Exit Sub
10:
End Sub

Private Sub Details_doPrint(rs As ADODB.Recordset)
    master_doPrint master.rs
End Sub

Private Sub Details_doSave(rs As ADODB.Recordset, cancel As Boolean)
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:Doctor_ID,1:Full_Name,2:Quarter1,3:Quarter2,4:Quarter3,5:Quarter4,7:IsCanceled,;"
End Sub

Private Sub Details_doSaveComplete(rs As ADODB.Recordset)
    Dim j As Integer
    fg.Tag = ";typeof=vsflexgrid;datafield=,0:Doctor_ID,1:Full_Name,2:Quarter1,3:Quarter2,4:Quarter3,5:Quarter4,6:Quarter_Count,7:IsCanceled,;"
    On Error GoTo 10
    If val(fg.TextMatrix(rs.AbsolutePosition, 7)) = 1 Then
            For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, rs.AbsolutePosition, j) = QBColor(12) 'red
            Next j
    Else
        For j = 0 To fg.Cols - 1
                fg.Cell(flexcpForeColor, rs.AbsolutePosition, j) = QBColor(0) 'black
            Next j
    End If
    Set_IsCanceled_Count
    Exit Sub
10:
End Sub
' Exec search
Private Sub Details_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    lblCount.Caption = rs.RecordCount
End Sub

Private Sub Details_doSearchComplete(rs As ADODB.Recordset)
    Set searchResult = rs
    lblCount.Caption = rs.RecordCount
    Set_IsCanceled_Count
End Sub

Private Sub fg_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    If details.state = ST_SEARCH Then Exit Sub
    Dim i As Integer
    Dim Signatures_Count  As Integer
    Signatures_Count = 0
    If Col >= 2 And Col <= 5 Then
        For i = 2 To 5
            Signatures_Count = Signatures_Count + val(fg.Cell(flexcpText, Row, i))
        Next i
        fg.Cell(flexcpText, Row, 6) = Signatures_Count
    End If
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Col >= 2 Then Exit Sub
    If details.state <> ST_SEARCH Then
        cancel = True
    Else
        If Row <> 1 Then cancel = True
    End If
End Sub


Private Sub Form_Activate()

    SelectFrame Me, ActiveFrame
    If ActiveFrame = masterFrame Then
        RefreshCommands btnSettings And FormSettings
    Else
        RefreshCommands btnDetailSettings And FormDetailSettings
    End If
     ActiveDatabaseName = "Default"
    If (master.rs.RecordCount = 0) Then
        master.addNew
    End If
    rbNumber.Value = True
    rbName.Value = False
End Sub

Private Sub Form_Deactivate()
    If ActiveFrame = masterFrame Then
        btnSettings = GetBtnSettings
    Else
        btnDetailSettings = GetBtnSettings
    End If
End Sub

Private Sub Form_Load()
    Dim sql As String
    oldScaleWidth = 12285
    FormSettings = btall
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormDetailSettings = btall - btNew - btDelete
    btnDetailSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    
    Set details = New Controller
    Set details.Form = Me
    Set details.frame = detailFrame
    controllers.Add details, detailFrame.name
    
    Dim cancel As Boolean
    sql = "  Select *  from NewQuarter_Signature_Years  "
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    InitFrame
    
    fg.ColComboList(2) = "#0;€Ì— „Êﬁ⁄|#1;„Êﬁ⁄"
    fg.ColComboList(3) = "#0;€Ì— „Êﬁ⁄|#1;„Êﬁ⁄"
    fg.ColComboList(4) = "#0;€Ì— „Êﬁ⁄|#1;„Êﬁ⁄"
    fg.ColComboList(5) = "#0;€Ì— „Êﬁ⁄|#1;„Êﬁ⁄"
    fg.ColComboList(7) = "#0;·«|#1;‰⁄„"
    
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
    ResizeGrid fg
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub master_doAddNew(rs As ADODB.Recordset)
    Dim cancel As Boolean
    Dim sql As String
    Dim res As ADODB.Recordset
    Dim year_signature As Integer
'    Sql = " Select *,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as full_Name from NewQuarter_Signatures " & _
'          " Where 1=0"
'    Set Details.rs = ExecuteSelect(Conn, Sql, Cancel)
'    If Details.rs.EOF Then
'        Details.MoveFirst
'    End If
   ' txtYear.text = year(Date)

    sql = "select max(Quarter_Signature_Year)from NewQuarter_Signature_Years"
     Set res = ExecuteSelect(Conn, sql, cancel)
      If (IsNull(res.Fields(0).Value)) Then
        Exit Sub
      End If
    year_signature = res.Fields(0).Value
    year_signature = year_signature + 1
    txtYear.text = year_signature
    detailFrame.visible = False
    cmdUpdate_Details_List.visible = False
    lblFour_Quarters.Caption = 0
    lblTree_Quarters.Caption = 0
    lblTwo_Quarters.Caption = 0
    lblOne_Quarter.Caption = 0
End Sub


Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    cmdUpdate_Details_List.visible = False
End Sub

Private Sub master_doCancelSave(rs As ADODB.Recordset, cancel As Boolean)
    If master.SaveAfterWhat = ST_ADDNEW Then
        detailFrame.visible = True
    End If
    cmdUpdate_Details_List.visible = True
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    cmdUpdate_Details_List.visible = False
End Sub

Private Sub master_doCancelSearchComplete(rs As ADODB.Recordset)
    Get_Summaries
    cmdUpdate_Details_List.visible = True
End Sub

Private Sub master_doDelete(rs As ADODB.Recordset, cancel As Boolean)
   
   Dim sql As String
   Dim c As Boolean
   
   cancel = True
   
   sql = "Delete from NewQuarter_Signature_Years Where Quarter_Signature_Year =  " & rs!Quarter_Signature_Year
   
   ExecuteCommand Conn, sql, c
        
   sql = "Select * from NewQuarter_Signature_Years Order BY 1"
   
   Set master.rs = ExecuteSelect(Conn, sql, c)
    
   If Not master.rs.EOF Then
       master.MoveFirst
    Else
        master.addNew
   End If
    
        
End Sub

Public Sub master_doMoveComplete(rs As ADODB.Recordset)
    Dim cancel As Boolean
    Dim sql As String
'    Sql = " Select *,dbo.sf_Get_Doctor_Full_Name(Doctor_ID) as full_Name from NewQuarter_Signatures " & _
'          " Where Signature_Year_ID = " & rs!Signature_Year_ID & _
'          " order by Doctor_ID"

         Dim year_sig  As Integer
         Dim prev_year As Integer
         year_sig = master.rs!Quarter_Signature_Year
         prev_year = year_sig - 1
    
        sql = "Select *,Quarter1 + Quarter2 + Quarter3 + Quarter4 as Quarter_Count, " & _
          " case when Quarter1 = 0 then '·«'  else '‰⁄„' end as quarter1_as_string," & _
          " case when Quarter2 = 0 then '·«'  else '‰⁄„' end as quarter2_as_string," & _
          " case when Quarter3 = 0 then '·«'  else '‰⁄„' end as quarter3_as_string," & _
          " case when Quarter4 = 0 then '·«'  else '‰⁄„' end as quarter4_as_string," & _
          " Case IsCanceled when 0 then '·«' else '‰⁄„' end as IsCanceled_As_Text " & _
          " from vQuarter_Signature_Details  " & _
          " Where  Quarter_Year = '" & year_sig & " ' " & _
         " and datepart(yy, Membership_Date) <= '" & year_sig & " ' order by Doctor_Id asc"
         Set details.rs = ExecuteSelect(Conn, sql, cancel)
         
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·œŒÊ· ≈·Ï «·‰«›–…"
        Exit Sub
    End If
    
    rbNumber.Value = True
    rbName.Value = False
    
    If Not details.rs.EOF Then
        details.MoveFirst
        lblCount.Caption = details.rs.RecordCount
    End If
    If year_sig < 2006 Then
        Get_Summaries
    Else
      Get_Summaries
      ' Get_NewSummaries
    End If
    Set_IsCanceled_Count
    Coloring_Grid
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    If master.rs.EOF Or master.rs.BOF Then Exit Sub
    If master.rs.RecordCount = 0 Then Exit Sub
    
    Dim cancel As Boolean
    Dim sql As String
   ' Dim rsReport As ADODB.Recordset
   
   ' sql = "Select *,Quarter1 + Quarter2 + Quarter3 + Quarter4 as Quarter_Count, " & _
   '       " case when Quarter1 = 0 then '·«'  else '‰⁄„' end as quarter1_as_string," & _
   '       " case when Quarter2 = 0 then '·«'  else '‰⁄„' end as quarter2_as_string," & _
   '       " case when Quarter3 = 0 then '·«'  else '‰⁄„' end as quarter3_as_string," & _
   '       " case when Quarter4 = 0 then '·«'  else '‰⁄„' end as quarter4_as_string," & _
   '       " Case IsCanceled when 0 then '·«' else '‰⁄„' end as IsCanceled_As_Text " & _
   '       " from vQuarter_Signature_Details " & _
   '       " Where Quarter_Year = " & master.rs!Quarter_Signature_Year
    'if()
          
   ' Set rsReport = ExecuteSelect(Conn, sql, Cancel)
    
    Set DrQuarter_Signatures.DataSource = searchResult
    Get_DataReport_Label_byName(DrQuarter_Signatures, 1, "lblStateName").Caption = Current_State.FullName
    Get_DataReport_Label_byName(DrQuarter_Signatures, 1, "lblHeader").Caption = Get_DataReport_Label_byName(DrQuarter_Signatures, 1, "lblHeader").Caption & master.rs!Quarter_Signature_Year
    DrQuarter_Signatures.Show 1
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    Me.MousePointer = vbHourglass
    Save_After = master.state
    
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
  '  If Save_After = ST_ADDNEW Then
        Dim cancel As Boolean
        Dim sql As String
        Dim year_sig As Integer
        sql = "Select * from NewQuarter_Signature_Years Order BY 1"
        Set master.rs = ExecuteSelect(Conn, sql, cancel)
        If Not master.rs.EOF Then
            master.MoveLast
        End If
        year_sig = master.rs!Quarter_Signature_Year
         prev_year = year_sig - 1
        LoadDataForNewYear
        sql = "Select *,Quarter1 + Quarter2 + Quarter3 + Quarter4 as Quarter_Count, " & _
        " case when Quarter1 = 0 then '·«'  else '‰⁄„' end as quarter1_as_string," & _
        " case when Quarter2 = 0 then '·«'  else '‰⁄„' end as quarter2_as_string," & _
        " case when Quarter3 = 0 then '·«'  else '‰⁄„' end as quarter3_as_string," & _
        " case when Quarter4 = 0 then '·«'  else '‰⁄„' end as quarter4_as_string," & _
        " Case IsCanceled when 0 then '·«' else '‰⁄„' end as IsCanceled_As_Text " & _
        " from vQuarter_Signature_Details " & _
        "Where   datepart(yy, Membership_Date) <= '" & year_sig & " 'and " & _
        " Quarter_Year = ' " & year_sig & " ' order by Doctor_Id asc"
        Set details.rs = ExecuteSelect(Conn, sql, cancel)
        
        rbNumber.Value = True
        rbName.Value = False
        
        If details.rs.EOF Then
            details.MoveFirst
        End If
        detailFrame.visible = True
 '   End If
    Me.MousePointer = vbDefault
   ' MsgBox numRecord, vbOKCancel, "hello"
    cmdUpdate_Details_List.visible = True
       Get_Summaries
     'Get_NewSummaries
    If master.SaveAfterWhat = ST_UPDATE Then
        Get_Summaries
       ' Get_NewSummaries
    End If
End Sub
 
 
Sub LoadDataForNewYear()
    Dim sql, sql2 As String
    Dim cancel As Boolean
    Dim pre_year As Integer
    Dim rsDoctors As ADODB.Recordset
    Dim rsQuarters As ADODB.Recordset
    Dim rsDoctorsQuarters As ADODB.Recordset
    Dim InsertSQl As String
    Dim isExist As Boolean
''    sql = "SELECT  qs.Quarter_ID, qsd.Doctor_ID, qsd.Sinature_Status " & _
''            " FROM Quarter_Signature qs " & _
''            " INNER JOIN Quarter_Sinature_Details qsd " & _
 ''           " ON qs.Quarter_ID = qsd.Quarter_ID " & _
  ''          " Where qs.Quarter_Year = " & prev_year
      sql = "(SELECT  distinct Doctor_ID From dbo.Doctor_CV Where isCollaborative_Member = 1 " & _
      "and ((dbo.sf_IsActive_Collaborative_Doctor(Doctor_ID) = 1)or" & _
      "((Collaborative_Suspend_Date is not null and Collaborative_Resume_Date is Null)" & _
      "and datepart(yy,Collaborative_Suspend_Date)>='" & txtYear.text & "')) " & _
      "and datepart(yy, Collaborative_Membership_Date) <= '" & txtYear.text & " ') union " & _
      "(SELECT distinct cv.Doctor_ID from dbo.acc_Daily ad inner join " & _
      "dbo.Doctor_CV cv on ad.AccNum = cv.Collaborative_Account_No) order by Doctor_ID asc"
    
    Set rsDoctors = ExecuteSelect(Conn, sql, cancel)
    If (rsDoctors.EOF) Then
        Exit Sub
    End If
    Set rsQuarters = ExecuteSelect(Conn, "Select Quarter_id from Quarter_Signature " & _
                                        " Where Quarter_Year = " & txtYear.text, cancel)

'    sql2 = "select * from fn_ListOfNewYearDoctorsSignature(" & prev_year & "," & txtYear.text & ")"
'    Set rsDoctorsQuarters = ExecuteSelect(Conn, sql2, cancel)
'
'    If rsDoctorsQuarters.RecordCount <> 0 Then
'    rsDoctorsQuarters.MoveFirst
'
'    Do While Not rsDoctorsQuarters.EOF
'         InsertSQl = "Insert into Quarter_Sinature_Details(Quarter_ID,Doctor_ID,Sinature_Status) " & _
'                     " values(" & rsDoctorsQuarters.Fields(0).Value & "," & _
'                     rsDoctorsQuarters.Fields(1).Value & "," & rsDoctorsQuarters.Fields(2).Value & ")"
'         ExecuteCommand Conn, InsertSQl, cancel
'         rsDoctorsQuarters.MoveNext
'    Loop

    rsDoctors.MoveFirst
    rsQuarters.MoveFirst
    Do While Not rsDoctors.EOF
         Do While Not rsQuarters.EOF
             isExist = ExistRecord(rsQuarters.Fields(0).Value, rsDoctors.Fields(0).Value)
             If Not isExist Then
                InsertSQl = "Insert into Quarter_Sinature_Details(Quarter_ID,Doctor_ID,Sinature_Status) " & _
                         " values(" & rsQuarters.Fields(0).Value & "," & _
                         rsDoctors.Fields(0).Value & ", 1)"
                ExecuteCommand Conn, InsertSQl, cancel
             End If
             rsQuarters.MoveNext
         Loop
         rsQuarters.MoveFirst
         rsDoctors.MoveNext
     Loop
'
'   End If
   
' master_doMoveComplete master.rs
   
End Sub
Private Function ExistRecord(quarterID As Integer, doctorID As Integer) As Boolean
  Dim sql As String
  Dim cancel As Boolean
  Dim res As ADODB.Recordset
        sql = "select * from  Quarter_Sinature_Details " & _
             " where Quarter_ID ='" & quarterID & "' and Doctor_ID ='" & doctorID & "'"
        Set res = ExecuteSelect(Conn, sql, cancel)
        If res.RecordCount <> 0 Then
            ExistRecord = True
        Else
            ExistRecord = False
        End If
End Function
Sub Get_NewSummaries()
    
    Dim cancel As Boolean
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim numYear As Integer
    
    lblFour_Quarters.Caption = 0
    lblTree_Quarters.Caption = 0
    lblTwo_Quarters.Caption = 0
    lblOne_Quarter.Caption = 0
    numYear = val(txtYear.text)
    numYear = numYear - 1
    If master.rs.EOF Or master.rs.BOF Then Exit Sub
    If master.rs.RecordCount = 0 Then Exit Sub
   '  If numYear < 2006 Then
   '      sql = " Select Doctor_id from Quarter_Signature qs ,Quarter_Sinature_Details  qsd " & _
   '       " Where qs.Quarter_ID =qsd.Quarter_ID and qs.Quarter_Year = " & _
   '         numYear & _
   '       " group by Doctor_id " & _
   '       " Having Sum(Sinature_Status) = "
   '  Else
       sql = "Select Doctor_id from Quarter_Signature qs ,Quarter_Sinature_Details  qsd " & _
             "Where qs.Quarter_ID = qsd.Quarter_ID and qs.Quarter_Year <='" & numYear & "' " & _
              "group by Doctor_id  " & _
              "Having Sum(Sinature_Status)= "
   '  End If
    Set rs = ExecuteSelect(Conn, sql & 1 & ";" & sql & 2 & ";" & sql & 3 & ";" & sql & 4, cancel)
'       master.rs.Fields("Quarter_Signature_Year").Value & _

    
    lblOne_Quarter.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblTwo_Quarters.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblTree_Quarters.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblFour_Quarters.Caption = rs.RecordCount
    Set rs = rs.NextRecordset
    lblAllQuarters.Caption = val(lblFour_Quarters.Caption) + val(lblTree_Quarters.Caption) + val(lblTwo_Quarters.Caption) + val(lblOne_Quarter.Caption)
    Set rs = Nothing
    
    lblCount.Caption = fg.Rows - 1
    
End Sub

Private Sub master_doSaveError(ByVal state As Controller_State, rs As ADODB.Recordset, ErrorObeject As ErrObject, msg As String, KeepState As Boolean)
   msg = "Â–Â «·”‰… „ÊÃÊœ… „”»ﬁ« °«·—Ã«¡ «· √ﬂœ „‰ «·„⁄·Ê„«  «·„œŒ·…"
   MousePointer = vbDefault
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    cmdUpdate_Details_List.visible = False
    Get_Summaries
    cmdUpdate_Details_List.visible = True
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    details.state = ST_UPDATE
    cmdUpdate_Details_List.visible = False
End Sub

Private Sub masterFrame_Click()
     If ActiveFrame = masterFrame Then
        Exit Sub
    End If
    btnDetailSettings = GetBtnSettings
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
    RefreshCommands btnSettings And FormSettings
End Sub

Private Sub rbName_Click()
    If rbName.Value Then
        details.rs.sort = "Full_Name asc"
        With fg
            .Refresh
        End With
    End If
End Sub

Private Sub rbNumber_Click()
    If rbNumber.Value Then
        details.rs.sort = "Doctor_Id asc"
        With fg
            .Refresh
        End With
    End If
End Sub

Private Sub txtYear_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
