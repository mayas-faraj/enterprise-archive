VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Acc_Tasdid 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ”œÌœ ﬂ‘Ê› „ÿ«·»… «·‘—ﬂ« "
   ClientHeight    =   8805
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11430
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8805
   ScaleWidth      =   11430
   Tag             =   ";AlwaysEnabled=true;"
   WindowState     =   2  'Maximized
   Begin MSComCtl2.DTPicker txtDate 
      Height          =   375
      Left            =   240
      TabIndex        =   21
      Top             =   660
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   661
      _Version        =   393216
      CheckBox        =   -1  'True
      CustomFormat    =   "dd/MM/yyyy"
      Format          =   20643843
      CurrentDate     =   39961
   End
   Begin VB.TextBox txtAsking_No 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   2460
      Width           =   2415
   End
   Begin VB.CheckBox chkIgnoreDay 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   " Ã«Â· «·ÌÊ„"
      Height          =   255
      Left            =   1305
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   1260
      Width           =   1335
   End
   Begin VB.CommandButton Command4 
      Caption         =   " ÕœÌœ «·ﬂ·"
      Height          =   375
      Left            =   9600
      RightToLeft     =   -1  'True
      TabIndex        =   16
      Top             =   2820
      Width           =   1575
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
      Left            =   1800
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   8295
      Width           =   840
   End
   Begin VB.TextBox txtVal 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   1740
      Width           =   2415
   End
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   7560
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   60
      Width           =   2895
   End
   Begin VB.TextBox txtNum 
      Alignment       =   1  'Right Justify
      Height          =   240
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   8505
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtDest 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   9165
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   8340
      Width           =   855
   End
   Begin VB.CommandButton cmdSearch 
      BackColor       =   &H00E0E0E0&
      Caption         =   "› Õ ”‰œ «· ”œÌœ"
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
      Left            =   225
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   8295
      Width           =   1400
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "⁄—÷ ﬂ‘Ê› «·„ÿ«·»…"
      Height          =   375
      Left            =   7200
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2820
      Width           =   2115
   End
   Begin VSFlex7Ctl.VSFlexGrid fg 
      Height          =   2055
      Left            =   4560
      TabIndex        =   4
      Top             =   660
      Width           =   6615
      _cx             =   11668
      _cy             =   3625
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
      AllowUserResizing=   0
      SelectionMode   =   0
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   50
      Cols            =   3
      FixedRows       =   1
      FixedCols       =   0
      RowHeightMin    =   400
      RowHeightMax    =   600
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   $"Acc_Tasdid.frx":0000
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
   Begin VSFlex7Ctl.VSFlexGrid fga 
      Height          =   4095
      Left            =   0
      TabIndex        =   5
      Top             =   3600
      Width           =   10935
      _cx             =   19288
      _cy             =   7223
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
      BackColorSel    =   16761024
      ForeColorSel    =   8388608
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
      Rows            =   50
      Cols            =   12
      FixedRows       =   1
      FixedCols       =   0
      RowHeightMin    =   400
      RowHeightMax    =   600
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   $"Acc_Tasdid.frx":0060
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
   Begin MSComCtl2.DTPicker txtDateTasdid 
      Height          =   375
      Left            =   285
      TabIndex        =   22
      Top             =   7815
      Width           =   2370
      _ExtentX        =   4180
      _ExtentY        =   661
      _Version        =   393216
      CustomFormat    =   "dd/MM/yyyy"
      Format          =   20643843
      CurrentDate     =   39961
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C00000&
      BackStyle       =   0  'Transparent
      Caption         =   "„Ã„Ê⁄ ﬁÌ„… «·„ÿ«·»…"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   7245
      Width           =   1695
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C00000&
      BackStyle       =   0  'Transparent
      Caption         =   "„Ã„Ê⁄ ﬁÌ„… »«ﬁÌ «· ”œÌœ"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   9360
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   7725
      Width           =   1965
   End
   Begin VB.Label lblSumRest 
      Alignment       =   2  'Center
      BackColor       =   &H00C00000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   20.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   435
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   7605
      Width           =   4380
   End
   Begin VB.Label lblSumAll 
      Alignment       =   2  'Center
      BackColor       =   &H00C00000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   20.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   435
      Left            =   5040
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   7125
      Width           =   4380
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "—ﬁ„ «·„ÿ«·»…"
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
      Index           =   5
      Left            =   2850
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   2580
      Width           =   840
   End
   Begin VB.Label lblAccount_Name 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "«·Õ”«» «·„ﬁ«»·"
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
      Height          =   420
      Left            =   5805
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   8340
      Width           =   3255
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«·„»·€"
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
      Index           =   4
      Left            =   3075
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   1860
      Width           =   405
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«·‘—ﬂ…"
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
      Index           =   3
      Left            =   10590
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   180
      Width           =   510
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "«·—ﬁ„ «·„Õ«”»Ì «·œ«Œ·Ì ··ÃÂ… «·„”œœ…"
      Height          =   195
      Left            =   5130
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   8295
      Visible         =   0   'False
      Width           =   510
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ «· ”œÌœ"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   2
      Left            =   2775
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   7860
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«·Õ”«» «·„ﬁ«»·"
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
      Index           =   1
      Left            =   10125
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   8385
      Width           =   1095
   End
   Begin VB.Label lblStatus 
      BackStyle       =   0  'Transparent
      Height          =   255
      Left            =   6240
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   780
      Width           =   2295
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   " «—ÌŒ «·≈—”«·"
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
      Index           =   0
      Left            =   2760
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   780
      Width           =   1020
   End
End
Attribute VB_Name = "Acc_Tasdid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String
'ALERT: It seems that this form has its own connection,
'please IyadK check this, and see if we need to integrate
'it through the use of ActiveDatabaseName. I did it anyway
Public tasdid_summary As Long
Public motalabat_summary As Long
Dim oldScaleWidth As Integer
Sub Get_Summaries()
    Dim i As Integer
    lblSumAll.Caption = 0
    lblSumRest.Caption = 0
    For i = 1 To fga.Rows - 1
        lblSumAll.Caption = val(lblSumAll.Caption) + val(fga.Cell(flexcpText, i, 6))
        lblSumRest.Caption = val(lblSumRest.Caption) + val(fga.Cell(flexcpText, i, 7))
    Next i
End Sub

Private Sub cmdSearch_Click()
On Error GoTo ErrHandling
    If txtNum.text = "" Then
        MsgBox "ÌÃ»  ÕœÌœ «·ÃÂ… «·„”œœ… √Ê·«"
        txtDest.SetFocus
        Exit Sub
    End If
    
    Conn.BeginTrans
    Dim sql As String
    sql = "set nocount on set dateformat dmy insert into acc_sanadtmp" & Acc_DBYear & "(id, type, cDate, Dscrb) select isnull(max(id),0)+1,3,'" & txtDateTasdid.Day & "/" & txtDateTasdid.Month & "/" & txtDateTasdid.year & " ',' ”œÌœ« ' from acc_sanadTMP" & Acc_DBYear & " select id from acc_SanadTMP" & Acc_DBYear & " where autoid=@@IDENTITY "
    Debug.Print sql
    Dim rs As New ADODB.Recordset
    rs.CursorLocation = adUseClient
'    On Error GoTo ErrHandler
    rs.Open sql, Conn, adOpenStatic, adLockOptimistic
    Dim sanadId As Long
    sanadId = rs.Fields(0).Value 'The new inserted id
    Dim i As Long
    i = 1
    Dim EmptySanad As Boolean
    EmptySanad = True
    Do While i < fga.Rows
        If fga.Cell(flexcpChecked, i, 0) = 1 Then
            EmptySanad = False
            Dim ComAcc, Bayan, Value, ComValue, Kid, Dscrb, MotalabaNum, MotalabaDate, TasdidKind As String
            ComAcc = fga.Cell(flexcpText, i, 11)
            Bayan = fga.Cell(flexcpText, i, 8)
            Value = fga.Cell(flexcpText, i, 5)
            ComValue = fga.Cell(flexcpText, i, 7)
            Kid = fga.Cell(flexcpText, i, 10)
            MotalabaNum = fga.Cell(flexcpText, i, 3)
            MotalabaDate = fga.Cell(flexcpText, i, 4)
            If Value = "" Then
                MsgBox "ﬁÌ„… «· ”œÌœ ·« ÌÃ» √‰  ﬂÊ‰ ›«—€…"
                Conn.RollbackTrans
                fga.Col = 5
                fga.Row = i
                Exit Sub
            End If
            If (Not IsNumeric(Value)) Or (CDbl(Value) < 0) Then
                MsgBox "ﬁÌ„… «· ”œÌœ ÌÃ» √‰  ﬂÊ‰ —ﬁ„« „ÊÃ»«"
                Conn.RollbackTrans
                fga.Col = 5
                fga.Row = i
                Exit Sub
            End If
            If CDbl(Value) > CDbl(ComValue) Then
                MsgBox "ﬁÌ„… «· ”œÌœ ·« Ì„ﬂ‰ √‰  ﬂÊ‰ √ﬂ»— „‰ „»·€ «· ”œÌœ «·„ »ﬁÌ"
                Conn.RollbackTrans
                fga.Col = 5
                fga.Row = i
                Exit Sub
            End If
            If RTrim(LTrim(fga.Cell(flexcpText, i, 1))) = " ”œÌœ ﬂ«„·" Then
                TasdidKind = 2
                Dscrb = " ”œÌœ " & MotalabaNum & "  « " & MotalabaDate
            ElseIf RTrim(LTrim(fga.Cell(flexcpText, i, 1))) = " ”œÌœ Ã“∆Ì" Then
                TasdidKind = 1
                ComValue = Value
                Dscrb = " ”œÌœ Ã“∆Ì " & MotalabaNum & "  « " & MotalabaDate
        Else
                MsgBox "ÌÃ» √‰  Õœœ ‰Ê⁄ «· ”œÌœ „‰ √Ã· «·„ÿ«·»«  Ã„Ì⁄«"
                Conn.RollbackTrans
                fga.Col = 1
                fga.Row = i
                Exit Sub
            End If
            'insert sanad D from company
            sql = "insert into acc_detsanadtmp" & Acc_DBYear & "(acc,D,sanadid,Dscrb) values (" & ComAcc & "," & ComValue & "," & sanadId & ",'" & Dscrb & "')"
            sql = sql & " insert into Acc_TasdidSanad" & Acc_DBYear & "(sanad,tasdid) values (@@IDENTITY," & Kid & ")"
            sql = sql & " insert into acc_detsanadtmp" & Acc_DBYear & "(acc,M,sanadid,Dscrb) values (" & txtNum.text & "," & Value & "," & sanadId & ",'" & Bayan & "')"
            'sql = sql & " update ListCompanyAll" & Acc_DBYear & " set dbo_Paid=" & TasdidKind & " where dbo_id=" & Kid
            Dim cancel As Boolean
            Debug.Print sql
            ExecuteCommand Conn, sql, cancel
            If cancel Then
                MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄° «·—Ã«¡ ≈⁄«œ… «·„Õ«Ê·… „‰ ÃœÌœ"
                Conn.RollbackTrans
                Exit Sub
            End If
        End If
        i = i + 1
    Loop
    If EmptySanad Then
        Conn.RollbackTrans
        MsgBox "·„  ﬁ„ » ÕœÌœ √Ì  ”œÌœ«  ·√Ì ‘—ﬂ…!!"
        Exit Sub
    End If
    Conn.CommitTrans
    OpenSanad sanadId
    'Conn.Close
    '<AHMAD>
        'Unload Me
        Command2_Click
    '</AHMAD>
    Exit Sub
ErrHandling:
    If Acc_DBYear = "" Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
    Else
        MsgBox "Â–Â «·”‰… ··ﬁ—«¡… ›ﬁÿ° ·« Ì„ﬂ‰ﬂ  ⁄œÌ· √Ì ”‰œ ›ÌÂ«"
    End If
    
End Sub

Private Sub Command1_Click()
'    Conn.Close
    Unload Me
End Sub

Private Sub Command2_Click()
    fga.Rows = 1
    Dim S As String
    S = ""
    If Not IsNull(txtDate.Value) Then
        If chkIgnoreDay.Value = 1 Then
            S = S & " and month(dbo_dateSend)=" & txtDate.Month & " and year(dbo_dateSend)=" & txtDate.year
        Else
            S = S & " and dbo_dateSend='" & txtDate.Day & "/" & txtDate.Month & "/" & txtDate.year & "'  "
        End If
    End If
    
    If txtVal.text <> "" Then
        S = S & " and dbo_Total=" & txtVal.text
    End If
    
    If txtAsking_No.text <> "" Then
        S = S & " and dbo_NumSend=" & txtAsking_No.text
    End If
    
    
    Dim i As Integer
    Dim ss As String
    i = 1
    ss = ""
    Do While i < fg.Rows
        If fg.Cell(flexcpChecked, i, 0) = 1 Then
            ss = ss & fg.Cell(flexcpText, i, 2) & ","
        End If
        i = i + 1
    Loop
    If ss <> "" Then
        S = S & " and Organization_ID in (" & ss & "-1) "
    End If
    Dim sql As String
'            "inner join Acc_DetSanadTMP" & Acc_DBYear & " on (Organization_Kashef.SanadID=Acc_DetSanadTMP.SanadId) " & vbCrLf & _
'            "Where Organization.Account_Number_ID = Acc_DetSanadTMP.acc " & vbCrLf & _

'    sql = "set dateformat dmy select x.dbo_ComName, x.Organization_ID, x.dbo_NumSend, " & vbCrLf & _
'            "x.dbo_dateSend, x.dbo_Total, x.dbo_ComNumAcc," & vbCrLf & _
'            "dbo_Id, isnull(tt.D,0) as rasid," & vbCrLf & _
'            "case when x.dbo_Total=tt.D then 2 when tt.d is null then 0 else 1 end as  dbo_Paid" & vbCrLf & _
'            "From " & vbCrLf & _
'            "(select Organization_Name dbo_ComName, Asking_NO dbo_NumSend, Asking_Date dbo_dateSend, Kashef_amount dbo_Total, Kashef_ID dbo_Id, Organization.Organization_ID, Organization.Account_Number_ID  dbo_ComNumAcc " & vbCrLf & _
'            "from Organization inner join Organization_Kashef" & Acc_DBYear & " Organization_Kashef on (Organization.Organization_ID=Organization_Kashef.Organization_ID) " & vbCrLf & _
'            ") x " & vbCrLf & _
'            "left outer join ( " & vbCrLf & _
'            "     select t.tasdid, sum(d.d) D " & vbCrLf & _
'            "     from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & vbCrLf & _
'            "     Where t.sanad = d.id " & vbCrLf & _
'            "    group by t.tasdid " & vbCrLf & _
'            ")tt on tt.tasdid=x.dbo_Id " & vbCrLf & _
'            "Where X.dbo_Total! = IsNull(tt.d, 0) and X.Closed = 0 " & S & vbCrLf & _
             "ORDER BY x.dbo_ComName,x.dbo_dateSend "
    sql = "Set DateFormat DMY Select * from vTasdid "
    If ss <> "" Then sql = sql + " where 1 = 1 " & S
    sql = sql + "ORDER BY dbo_ComName,dbo_dateSend "
    Debug.Print sql
    If Conn.state = 0 Then OpenConnection Conn
    Dim rs As New ADODB.Recordset
    rs.CursorLocation = adUseClient
    On Error GoTo errHandler
    rs.Open sql, Conn, adOpenStatic, adLockOptimistic
    '<AHMAD>
        If rs.RecordCount = 0 Then
            MsgBox "·« ÌÊÃœ „ÿ«·»«  „Ê«›ﬁ… ·‰ÿ«ﬁ «·»ÕÀ «·–Ì ÿ·» Â", vbInformation + vbOKOnly, "⁄œœ «·”Ã·«  = 0"
            Get_Summaries
            Exit Sub
        End If
    '</AHMAD>
    FillDetGrid rs, fga
    '<AHMAD>
        ResizeGrid fga
        Get_Summaries
    '</AHMAd>
    Exit Sub
errHandler:
    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
    'MsgBox Err.Description & "," & Err.Number
End Sub

Private Sub Command3_Click()
    tasdid_summary = 0
    motalabat_summary = 0
    Dim i As Integer
    For i = 1 To fga.Rows - 1
        tasdid_summary = tasdid_summary + val(fga.Cell(flexcpText, i, 7))
        motalabat_summary = motalabat_summary + val(fga.Cell(flexcpText, i, 6))
    Next i
    
    pForm = "TasdidRep"
    Acc_MasterRep.Show 1
End Sub

Private Sub Command4_Click()
    Dim i As Integer
    For i = 1 To fg.Rows - 1
        If Command4.Caption = " ÕœÌœ «·ﬂ·" Then
            fg.Cell(flexcpChecked, i, 0) = 1
        Else
            fg.Cell(flexcpChecked, i, 0) = 0
        End If
    Next
    If Command4.Caption = " ÕœÌœ «·ﬂ·" Then
        Command4.Caption = "≈·€«¡  ÕœÌœ «·ﬂ·"
    Else
        Command4.Caption = " ÕœÌœ «·ﬂ·"
    End If
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Row = 0 Then
        cancel = True
        Exit Sub
    End If
    If Col > 0 Then
        'MsgBox "·« Ì„ﬂ‰  ⁄œÌ· ﬁÌ„ Â–« «·⁄„Êœ"
        cancel = True
        Exit Sub
    End If

End Sub
Private Sub fga_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    If Col = 0 Then Exit Sub
    fga.Cell(flexcpChecked, Row, 0) = 1
'    fga.Cell(flexcpChecked, Row, 7) = "adsasd"

End Sub


Private Sub fga_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If Row = 0 Then
        cancel = True
        Exit Sub
    End If
    If Col = 2 Or Col = 3 Or Col = 4 Or Col = 6 Or Col = 7 Or Col = 9 Then
        'MsgBox "·« Ì„ﬂ‰  ⁄œÌ· ﬁÌ„ Â–« «·⁄„Êœ"
        cancel = True
        Exit Sub
    End If

End Sub

Private Sub fga_CellChanged(ByVal Row As Long, ByVal Col As Long)
    If Col = 0 Then
        'if fga.Cell(flexcpChecked,fg.row
        If fga.Cell(flexcpChecked, Row, 0) = 1 Then
            fga.Cell(flexcpText, Row, 1) = " ”œÌœ ﬂ«„·"
            fga.Cell(flexcpText, Row, 5) = fga.Cell(flexcpText, Row, 7)
        Else
            fga.Cell(flexcpText, Row, 1) = ""
            fga.Cell(flexcpText, Row, 5) = ""
        End If

    End If
    
End Sub
Private Sub Form_Activate()
    ' Switching to the proper database
    ActiveDatabaseName = "Default"
    ResizeGrid fga
End Sub

Private Sub Form_Load()
    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName
    oldScaleWidth = 11520
    
    'OpenConnection Conn
    Dim rs As New ADODB.Recordset
    Dim sql As String
'            "inner join Acc_DetSanadTMP" & Acc_DBYear & " on (Organization_Kashef.SanadID=Acc_DetSanadTMP.SanadId) " & vbCrLf & _
'            "Where Organization.Account_Number_ID = Acc_DetSanadTMP.acc " & vbCrLf &
'  <AHMAD>
'   sql = "select distinct x.Organization_Name, x.Organization_ID " & vbCrLf & _
'            "From " & vbCrLf & _
'            "(select Organization_Name, Kashef_amount M, Kashef_ID, Organization.Organization_ID from Organization inner join Organization_Kashef" & Acc_DBYear & " Organization_Kashef on (Organization.Organization_ID=Organization_Kashef.Organization_ID) " & vbCrLf & _
'            ") x " & vbCrLf & _
'            "left outer join ( " & vbCrLf & _
'            "     select t.tasdid, sum(d.d) D " & vbCrLf & _
'            "     from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & vbCrLf & _
'            "     Where t.sanad = d.id " & vbCrLf & _
'            "    group by t.tasdid " & vbCrLf & _
'            ")tt on tt.tasdid=x.Kashef_ID " & vbCrLf & _
'            "Where X.M! = IsNull(tt.d, 0) "
    sql = "Select Distinct Organization_id,dbo_ComName as Organization_Name From vTasdid Order by Organization_ID"
    '</AHMAD>
    rs.CursorLocation = adUseClient
    On Error GoTo errHandler
    rs.Open sql, Conn, adOpenStatic, adLockOptimistic
    'rs = ExecuteSelect(conn, , cancel)
    'rs.Open
    txtDate.Value = Null
    FillGrid rs, fg
    'MsgBox fg.Cell(flexcpText, 1, 0)
    fga.Rows = 1
    txtDateTasdid.Value = Day(Date) & "/" & Month(Date) & "/" & GetCurrentAccYear(Conn)
    SetCaption Me
    
    Exit Sub
errHandler:
    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
    'MsgBox Err.Description & "," & Err.Number
End Sub

Private Sub FillGrid(rs As ADODB.Recordset, fg As VSFlexGrid)
    fg.Rows = rs.RecordCount + 1
    Dim i As Long
    i = 1
    Do While Not rs.EOF
        fg.Cell(flexcpText, i, 1) = rs!Organization_Name
        fg.Cell(flexcpText, i, 2) = rs!Organization_Id
        rs.MoveNext
        i = i + 1
    Loop
End Sub

Private Sub FillDetGrid(rs As ADODB.Recordset, fg As VSFlexGrid)
    fg.Clear , flexClearData
    fg.Rows = rs.RecordCount + 1
    Dim i As Long
    i = 1
    Do While Not rs.EOF
        'fg.Cell(flexcpText, i, 1) = rs!dbo_NumSend
        Dim S As String
        Dim rest As Double
        rest = 0
        '<AHMAD>
    '        If rs!dbo_Paid = 0 Then
    '            S = "€Ì— „”œœ"
    '        Else
    '            S = "„”œœ Ã“∆Ì«"
    '        End If
             S = rs!dbo_Paid
        '</AHMAD>
        fg.Cell(flexcpText, i, 2) = S
        fg.Cell(flexcpText, i, 3) = rs!dbo_NumSend
        fg.Cell(flexcpText, i, 4) = rs!dbo_dateSend
        fg.Cell(flexcpText, i, 6) = rs!dbo_Total
        fg.Cell(flexcpText, i, 7) = rs!dbo_Total - rs!rasid
        fg.Cell(flexcpText, i, 9) = rs!dbo_ComName
        fg.Cell(flexcpText, i, 10) = rs!dbo_Id
        fg.Cell(flexcpText, i, 11) = rs!dbo_ComNumAcc
        rs.MoveNext
        i = i + 1
    Loop
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

Private Sub Text1_Change()
    Dim rs As New ADODB.Recordset
    Dim sql As String
'            "inner join Acc_DetSanadTMP" & Acc_DBYear & " on (Organization_Kashef.SanadID=Acc_DetSanadTMP.SanadId) " & vbCrLf & _
'            "Where Organization.Account_Number_ID = Acc_DetSanadTMP.acc " & vbCrLf & _

   sql = "select distinct x.Organization_Name, x.Organization_ID " & vbCrLf & _
            "From " & vbCrLf & _
            "(select Organization_Name, Kashef_amount M, Kashef_ID, Organization.Organization_ID from Organization inner join Organization_Kashef" & Acc_DBYear & " Organization_Kashef on (Organization.Organization_ID=Organization_Kashef.Organization_ID) " & vbCrLf & _
            ") x " & vbCrLf & _
            "left outer join ( " & vbCrLf & _
            "     select t.tasdid, sum(d.d) D " & vbCrLf & _
            "     from Acc_TasdidSanad" & Acc_DBYear & " t, Acc_DetSanadTMP" & Acc_DBYear & " d " & vbCrLf & _
            "     Where t.sanad = d.id " & vbCrLf & _
            "    group by t.tasdid " & vbCrLf & _
            ")tt on tt.tasdid=x.Kashef_ID " & vbCrLf & _
            "Where X.M! = IsNull(tt.d, 0) and  x.Organization_Name like '%" & Text1.text & "%'"
    rs.CursorLocation = adUseClient
    On Error GoTo errHandler
    rs.Open sql, Conn, adOpenStatic, adLockOptimistic
    FillGrid rs, fg
    'MsgBox fg.Cell(flexcpText, 1, 0)
    fga.Rows = 1
    rs.Close
    Exit Sub
errHandler:
    MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
End Sub

Private Sub txtAsking_No_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtDest_Validate(cancel As Boolean)
    Dim rs As ADODB.Recordset
    lblAccount_Name.Caption = ""
    Dim c As Boolean
'    If master.State = 0 Then Exit Sub
    Dim acc As String
    acc = txtDest.text
    If acc <> "" Then
       Dim numeric As Boolean
       numeric = IsNumeric(acc)
       If numeric Then 'He entered the number of the account
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where acc='" & acc & "'", c)
       ElseIf InStr(1, acc, "(") > 0 Then
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where '('+acc+') '+name like '" & acc & "'", c)
       Else
           Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where name like '" & acc & "'", c)
       End If
       If c Then
            MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
            cancel = True
            Exit Sub
       End If
       If rs.RecordCount <> 1 Then
            rs.Close
            If numeric Then 'He entered the number of the account
                Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where acc='%" & acc & "%'", c)
            Else
                Set rs = ExecuteSelect(Conn, "select num,acc,name from acc_fari" & Acc_DBYear & " where name like '%" & acc & "%'", c)
            End If
            If c Then
                 MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
                 cancel = True
                 Exit Sub
            End If
            If rs.RecordCount <> 1 Then
                   GLOBAL_TAG = ";datafield=,0:acc,1:name,2:num,;"
                   GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetGridAcc,1:SetGridName,2:SetType,;"
                   If numeric Then
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,0:" & acc & ",;"
                   Else
                       GLOBAL_TAG = GLOBAL_TAG & "initQuery=,1:" & acc & ",;"
                   End If
                   GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select acc,name, num from Acc_Fari" & Acc_DBYear & ";"
                   'btnDetailSettings = GetBtnSettings
                   Clin_List.fg.Cols = 3
                   Clin_List.fg.ColHidden(2) = True: Clin_List.fg.ColHidden(1) = False: Clin_List.fg.ColHidden(0) = False
                   Clin_List.fg.ColWidth(0) = 1500: Clin_List.fg.ColWidth(1) = 3000
                   Clin_List.fg.ColAlignment(0) = flexAlignRightCenter: Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
                   Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·Õ”«»": Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·Õ”«»"
                    Clin_List.fg.Row = 1
                   If numeric Then
                        Clin_List.fg.Col = 0
                   Else
                        Clin_List.fg.Col = 1
                   End If
                   Set Clin_List.CallerForm = Me
                   txtDest.text = ""
                   txtNum.text = ""
                   'lblAccount.Caption = ""
                   'txtType.text = ""
                   Clin_List.Show 1
                   'RefreshCommands btnDetailSettings And FormSettings
                   If txtNum.text = "" Then cancel = True
                   Exit Sub
            End If
       End If 'rs.RecordCount <> 1
       txtDest.text = rs!acc ' & ") " & rs!Name
       txtNum.text = rs!Num
       lblAccount_Name.Caption = rs!name
       'lblAccount.Caption = "ﬂ‘› Õ”«»: " & rs!Name
       'txtType.text = rs!Type
    End If
End Sub

Private Sub txtDest_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 116 Then
        Dim cancel As Boolean
        txtDest.text = " "
        txtDest_Validate cancel
    End If
End Sub
Public Sub SetGridAcc(val As String)
    txtDest.text = val
End Sub
Public Sub SetGridName(val As String)
    lblAccount_Name.Caption = val
End Sub
Public Sub SetType(val As String)
    txtNum.text = val
End Sub

Private Sub OpenSanad(sanadId As Long)
    'Unload Me
    Acc_DailyNew.Show
    Acc_DailyNew.master.BeginSearch
    Acc_DailyNew.txtId.text = sanadId
    Acc_DailyNew.master.Search
End Sub

Private Sub txtVal_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtVal_Validate(cancel As Boolean)
    If txtVal.text = "" Then Exit Sub
    If Not IsValidNumber(txtVal.text, "integer") Then
        MsgBox "Õﬁ· «·„»·€ ÌÃ» √‰ ÌﬂÊ‰ —ﬁ„« ’ÕÌÕ« „ÊÃ»«  „«„«"
        cancel = True
        Exit Sub
    End If
End Sub
