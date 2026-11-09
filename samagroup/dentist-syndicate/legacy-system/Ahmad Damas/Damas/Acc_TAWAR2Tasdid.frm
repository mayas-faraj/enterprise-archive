VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form Acc_TAWAR2Tasdid 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Õ«·…  ”œÌœ «·√ÿ»«¡"
   ClientHeight    =   7905
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7095
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   14.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   7905
   ScaleWidth      =   7095
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtSumTasdid 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   20.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Tag             =   ";AlwaysEnabled=true;"
      Top             =   6480
      Width           =   3615
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "⁄—÷"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   510
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   360
      Width           =   795
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E1FEFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1470
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   240
      Width           =   4095
      Begin VB.OptionButton optAll 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·ﬂ·"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   240
         Value           =   -1  'True
         Width           =   1215
      End
      Begin VB.OptionButton optNotTasdid 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "€Ì— «·„”œœÌ‰"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1560
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton optTasdid 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«·„”œœÌ‰"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H00E0E0E0&
      Caption         =   " ﬁ—Ì—"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4920
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   7320
      Width           =   1400
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "Œ—ÊÃ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   7320
      Width           =   1400
   End
   Begin VSFlex7Ctl.VSFlexGrid fga 
      Height          =   5415
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   6585
      _cx             =   11615
      _cy             =   9551
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
      SelectionMode   =   0
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   1
      Cols            =   3
      FixedRows       =   1
      FixedCols       =   0
      RowHeightMin    =   400
      RowHeightMax    =   600
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   $"Acc_TAWAR2Tasdid.frx":0000
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
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "«·„Ã„Ê⁄"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   6540
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "⁄—÷ «·√ÿ»«¡"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5550
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   480
      Width           =   1095
   End
   Begin VB.Label lblStatus 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   960
      Width           =   2295
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   7785
      Width           =   11415
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   2
      Left            =   0
      Top             =   0
      Width           =   11415
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   8655
      Index           =   0
      Left            =   0
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   7965
      Index           =   1
      Left            =   6975
      Top             =   -90
      Width           =   135
   End
End
Attribute VB_Name = "Acc_TAWAR2Tasdid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Conn As New ADODB.Connection

Private Sub Command1_Click()
    Conn.Close
    Unload Me
End Sub


Private Sub Command2_Click()
    Dim S As String
    Dim SqlTasdid As String
    Dim SqlNotTasdid As String
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim Cancel As Boolean
    
    On Error GoTo ErrHandler
    
    If optTasdid.Value Then
        '<AHMAD>
        'Sql = "select AccName, sum(D) Amount,  '„”œœ' as TasdidState from Acc_Daily" & Acc_DBYear & " where type =2 and accParent in (select num from Acc_Accounts" & Acc_DBYear & " where acc='270') group by AccName order by AccName"
        SqlTasdid = "select AccName, sum(D) Amount,  '„”œœ' as TasdidState from Acc_Daily" & Acc_DBYear & " where type =2 and accParent in (select num from Acc_Accounts" & Acc_DBYear & " where acc='270') group by AccName having isNull(Sum(D),0) > 0 order by AccName"
        Set rs = ExecuteSelect(Conn, SqlTasdid, Cancel)
        '</AHMAD>
    ElseIf optNotTasdid.Value Then
        SqlNotTasdid = "select '('+acc + ') '+ name AccName,0 Amount, '€Ì— „”œœ' TasdidState" & vbCrLf & _
            "From Acc_Accounts" & Acc_DBYear & vbCrLf & _
            "where acc like '270_%'" & vbCrLf & _
            "    and num not in (select distinct(accnum) from acc_daily" & Acc_DBYear & _
            " where type=2 and accno like '270_%' and isNull(D,0) = 0) order by Acc" & vbCrLf
        Set rs = ExecuteSelect(Conn, SqlNotTasdid, Cancel)
                
    ElseIf optAll.Value Then
        '<AHMAD>
'        Sql = "select AccName, sum(D) Amount,  '„”œœ' as TasdidState from Acc_Daily" & Acc_DBYear & " where type =2 and accParent in (select num from Acc_Accounts" & Acc_DBYear & " where acc='270')  group by AccName " & vbCrLf & _
'                "UNION" & vbCrLf & _
'                "select '('+acc + ') '+ name AccName,0 Amount, '€Ì— „”œœ' TasdidState" & vbCrLf & _
'                "From Acc_Accounts" & Acc_DBYear & vbCrLf & _
'                "where acc like '270_%'" & vbCrLf & _
'                "    and num not in (select distinct(accnum) from acc_daily" & Acc_DBYear & " where type=2 and accno like '270_%' and D is not null) order by AccName" & vbCrLf
        sql = SqlTasdid & vbCrLf & "UNION" & vbCrLf & SqlNotTasdid
        Set rs = ExecuteSelect(Conn, sql, Cancel)
        '/<AHMAD>
    End If
    
    fga.Rows = 1
    FillGrid rs, fga
    Exit Sub
ErrHandler:
    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
    'MsgBox Err.Description & "," & Err.Number
    
End Sub

Private Sub Command3_Click()
    If fga.Rows = 1 Then
        MsgBox "·«  ÊÃœ „⁄·Ê„«  ·ÿ»«⁄… «· ﬁ—Ì—!. «÷€ÿ “— --⁄—÷-- ·⁄—÷ «·„⁄·Ê„« ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    pForm = "Tawar2TasdidRep"
    Acc_MasterRep.Show 1
End Sub


Private Sub Form_Load()
    
    OpenConnection Conn
    SetCaption Me
End Sub

Private Sub FillGrid(rs As ADODB.Recordset, fg As VSFlexGrid)
    fg.Rows = rs.RecordCount + 1
    Dim i As Long
    Dim sumTasdid As Double
    sumTasdid = 0
    i = 1
    Do While Not rs.EOF
        fg.Cell(flexcpText, i, 0) = rs!AccName
        fg.Cell(flexcpText, i, 1) = rs!TasdidState
        fg.Cell(flexcpText, i, 2) = rs!Amount
        sumTasdid = sumTasdid + rs!Amount
        rs.MoveNext
        i = i + 1
    Loop
    txtSumTasdid.text = sumTasdid
End Sub

Private Sub optAll_Click()
    fga.Rows = 1
End Sub

Private Sub optNotTasdid_Click()
    fga.Rows = 1
End Sub

Private Sub optTasdid_Click()
    fga.Rows = 1
End Sub
