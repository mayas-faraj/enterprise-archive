VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Begin VB.Form dlgStockGroupSelect 
   BackColor       =   &H00E1FEFF&
   Caption         =   "„Ã„Ê⁄«  «·„” Êœ⁄"
   ClientHeight    =   7035
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   7110
   Icon            =   "dlgStockGroupSelect.frx":0000
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   7035
   ScaleWidth      =   7110
   Begin VB.CommandButton cmdCancelDialog 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   1800
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   6600
      Width           =   1515
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   3480
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   6600
      Width           =   1515
   End
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„Ã„Ê⁄«  «·„” Êœ⁄"
      Height          =   6495
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   6960
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5895
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   6720
         _cx             =   11853
         _cy             =   10398
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
         TreeColor       =   8388608
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   3
         SelectionMode   =   0
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
         FormatString    =   $"dlgStockGroupSelect.frx":1CFA
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
         Width           =   6675
      End
   End
End
Attribute VB_Name = "dlgStockGroupSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Event OnClosingDialog(ByRef theGrid As VSFlexGrid, ByRef Cancel As Boolean)
Public Result As Boolean

Dim oldScaleWidth As Long

Const NUM_ = 0
Const NAME_ = 1
Const NOTE_ = 2
Const ID_ = 3

Const SELECT_GROUP = "select Id, Code as Name, Name as Num, Parent, Notes as note from Stock_Group"


Private Sub cmdCancelDialog_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Result = True
    Unload Me
End Sub

Private Sub fg_DblClick()
    If fg.Row <= 0 Then Exit Sub
    Result = True
    Unload Me
End Sub

Private Sub Form_Load()
    oldScaleWidth = 7230
    FormatForm Me
    
    With fg
        .Rows = 1
        .FixedCols = 0
        .ColAlignment(-1) = flexAlignRightTop
        .OutlineCol = 0
        .OutlineBar = flexOutlineBarSimpleLeaf
        .AllowSelection = False
    End With
    Result = False
    BuildTree
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Dim c As Boolean
    c = False
    RaiseEvent OnClosingDialog(fg, c)
    If c Then Cancel = 1
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

Private Sub FillGrid(fg As VSFlexGrid, rs As ADODB.Recordset, ByVal level As Integer, Parent As Long)
    Do While Not rs.EOF
        fg.AddItem rs!Num & vbTab & rs!name & vbTab & rs!note & vbTab & rs!id
        fg.IsSubtotal(fg.Rows - 1) = True
        fg.RowOutlineLevel(fg.Rows - 1) = level
        Dim p As Long
        p = rs!id
        Dim rsChildren As ADODB.Recordset
        Dim Cancel As Boolean
        Set rsChildren = ExecuteSelect(Conn, SELECT_GROUP & " WHERE parent = " & p, Cancel)
        FillGrid fg, rsChildren, level + 1, p
        Set rsChildren = Nothing
        rs.MoveNext
    Loop
End Sub

Private Sub BuildTree()
    Dim rootsRS As ADODB.Recordset
    Dim Cancel As Boolean
    MousePointer = vbHourglass
    Set rootsRS = ExecuteSelect(Conn, SELECT_GROUP & " WHERE parent IS NULL", Cancel)
    fg.Rows = 1
    fg.AddItem "" & vbTab & "" & vbTab & "" & vbTab & ""
    fg.IsSubtotal(1) = True
    fg.RowOutlineLevel(1) = 1
    FillGrid fg, rootsRS, 2, 0
    MousePointer = vbDefault
    Set rootsRS = Nothing
End Sub
