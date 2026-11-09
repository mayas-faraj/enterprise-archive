VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmEmployee_Continuance_Report 
   BackColor       =   &H00E1FEFF&
   Caption         =   " ﬁ—Ì— «·œÊ«„"
   ClientHeight    =   6855
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11790
   Icon            =   "frmEmployee_Continuance.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   6855
   ScaleWidth      =   11790
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ﬁ—Ì— «·œÊ«„"
      Height          =   8220
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   "master"
      Top             =   120
      Width           =   11655
      Begin VB.CommandButton cmdRefresh 
         Caption         =   " ÕœÌÀ «·»Ì«‰« "
         Height          =   375
         Left            =   3465
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   840
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker dtDate 
         Height          =   375
         Left            =   5018
         TabIndex        =   13
         Top             =   840
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.CheckBox chkDoctor_Absent 
         Alignment       =   1  'Right Justify
         Caption         =   "€Ì«» ›ﬁÿ"
         Height          =   615
         Left            =   11100
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   7485
         Width           =   495
      End
      Begin VB.CheckBox chkDoctor_Late 
         Alignment       =   1  'Right Justify
         Caption         =   " √Œ— ›ﬁÿ"
         Height          =   615
         Left            =   11100
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   6525
         Width           =   495
      End
      Begin VB.CheckBox chkEmployee_Absent 
         Alignment       =   1  'Right Justify
         Caption         =   "€Ì«» ›ﬁÿ"
         Height          =   735
         Left            =   11100
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   3870
         Width           =   495
      End
      Begin VB.CheckBox chkEmployee_Late 
         Alignment       =   1  'Right Justify
         Caption         =   " √Œ— ›ﬁÿ"
         Height          =   735
         Left            =   11100
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   2910
         Width           =   495
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
         Width           =   11415
      End
      Begin VSFlex7Ctl.VSFlexGrid GrdEmployees_Contiuance 
         Height          =   4425
         Left            =   5280
         TabIndex        =   6
         Top             =   1800
         Width           =   5775
         _cx             =   10186
         _cy             =   7805
         _ConvInfo       =   1
         Appearance      =   0
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
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   0
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
         FormatString    =   $"frmEmployee_Continuance.frx":1CFA
         ScrollTrack     =   0   'False
         ScrollBars      =   3
         ScrollTips      =   0   'False
         MergeCells      =   0
         MergeCompare    =   0
         AutoResize      =   0   'False
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
         TabBehavior     =   0
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
      Begin VSFlex7Ctl.VSFlexGrid GrdDoctors_Contiuance 
         Height          =   1575
         Left            =   5280
         TabIndex        =   7
         Top             =   6525
         Width           =   5775
         _cx             =   10186
         _cy             =   2778
         _ConvInfo       =   1
         Appearance      =   0
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
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   0
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
         FormatString    =   $"frmEmployee_Continuance.frx":1D87
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
         TabBehavior     =   0
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
      Begin VSFlex7Ctl.VSFlexGrid GrdEmployees_Vacations 
         Height          =   4380
         Left            =   120
         TabIndex        =   8
         Top             =   1800
         Width           =   4815
         _cx             =   8493
         _cy             =   7726
         _ConvInfo       =   1
         Appearance      =   0
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
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   0
         SelectionMode   =   0
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
         FormatString    =   $"frmEmployee_Continuance.frx":1E14
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
         TabBehavior     =   0
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
      Begin VSFlex7Ctl.VSFlexGrid GrdDoctors_Vacations 
         Height          =   1575
         Left            =   120
         TabIndex        =   9
         Top             =   6525
         Width           =   4815
         _cx             =   8493
         _cy             =   2778
         _ConvInfo       =   1
         Appearance      =   0
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
         TreeColor       =   -2147483632
         FloodColor      =   192
         SheetBorder     =   -2147483642
         FocusRect       =   1
         HighLight       =   1
         AllowSelection  =   -1  'True
         AllowBigSelection=   -1  'True
         AllowUserResizing=   0
         SelectionMode   =   0
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
         FormatString    =   $"frmEmployee_Continuance.frx":1E83
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
         TabBehavior     =   0
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
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "œÊ«„ «·√ÿ»«¡ «·›«Õ’Ì‰"
         Height          =   195
         Left            =   9555
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   6285
         Width           =   1455
      End
      Begin VB.Shape Shape1 
         Height          =   615
         Left            =   3360
         Top             =   720
         Width           =   5055
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·ÌÊ„ «·„ÿ·Ê»"
         Height          =   195
         Left            =   7418
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   960
         Width           =   885
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "œÊ«„ «·„ÊŸ›Ì‰"
         Height          =   195
         Left            =   10185
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   1560
         Width           =   930
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈Ã«“«  «·„ÊŸ›Ì‰ «·”«⁄Ì…"
         Height          =   195
         Left            =   3240
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   1560
         Width           =   1680
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "≈Ã«“«  «·√ÿ»«¡ «·›«Õ’Ì‰ «·”«⁄Ì…"
         Height          =   195
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   6285
         Width           =   2205
      End
   End
End
Attribute VB_Name = "frmEmployee_Continuance_Report"
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
Dim rsCurrent_Time As ADODB.Recordset


Sub Fill_Doctors_Grid()

    Dim rsDoctor_Continuance As New ADODB.Recordset
    Dim sql As String
    Dim Filter As String
    Dim cancel As Boolean
    sql = "set dateformat DMY Select Employee_Name,Exist_Status,Comming_Time,Leaving_Time from sf_Get_Employee_Dialy_Continuance('" & _
          format(dtDate.Value, "dd/mm/yyyy") & "',1) where "
                                                
    If chkDoctor_Late.Value = 1 Then
        Filter = " isNull(Comming_Time,'01/01/1980 08:00:00 AM') > '" & _
                 Replace(Replace(CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy") & " 08:30:00 AM"), "’", "AM"), "„", "PM") & "'"
    Else
        Filter = " 1=1"
    End If
    
    If chkDoctor_Absent.Value = 1 Then
        Filter = Filter & " and Exist_Status='€Ì«»'"
    Else
        Filter = Filter & " and 1=1 "
    End If
    
    Clear_Grid GrdDoctors_Contiuance
    
    sql = sql + " " + Filter
    
    Set rsDoctor_Continuance = ExecuteSelect(Conn, sql, cancel)
    
    If rsDoctor_Continuance.RecordCount <> 0 Then
        Set GrdDoctors_Contiuance.DataSource = rsDoctor_Continuance
    End If
    
    Set rsDoctor_Continuance = Nothing
    
End Sub

Sub Fill_Employees_Grid()
    
    Dim rsEmployee_Continuance As New ADODB.Recordset
    Dim sql As String
    Dim Filter As String
    Dim cancel As Boolean
    sql = "set dateformat DMY Select Employee_Name,Exist_Status,Comming_Time,Leaving_Time from sf_Get_Employee_Dialy_Continuance('" & _
          format(dtDate.Value, "dd/mm/yyyy") & "',0) where "
                                                
    If chkEmployee_Late.Value = 1 Then
        Filter = " isNull(Comming_Time,'01/01/1980 08:00:00 AM') > '" & _
                 Replace(Replace(CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy") & " 08:30:00 AM"), "’", "AM"), "„", "PM") & "'"
    Else
        Filter = " 1=1"
    End If
    
    If chkEmployee_Absent.Value = 1 Then
        Filter = Filter & " and Exist_Status='€Ì«»'"
    Else
        Filter = Filter & " and 1=1 "
    End If
    
    Clear_Grid GrdEmployees_Contiuance
    
    sql = sql + " " + Filter
    
    Set rsEmployee_Continuance = ExecuteSelect(Conn, sql, cancel)
    
    If rsEmployee_Continuance.RecordCount <> 0 Then
        Set GrdEmployees_Contiuance.DataSource = rsEmployee_Continuance
    End If
    
    Set rsEmployee_Continuance = Nothing
    
End Sub

Sub Set_Current_Time()
    Dim cancel As Boolean
    Set rsCurrent_Time = ExecuteSelect(Conn, "Select GetDate()", cancel)
End Sub


Private Sub chkEmployee_Absent_Click()
     If chkEmployee_Absent.Value = 1 Then chkEmployee_Late.Value = 0
     Fill_Employees_Grid
End Sub

Private Sub chkEmployee_Late_Click()
    If chkEmployee_Late.Value = 1 Then chkEmployee_Absent.Value = 0
    Fill_Employees_Grid
End Sub

Private Sub chkDoctor_Absent_Click()
     If chkDoctor_Absent.Value = 1 Then chkDoctor_Late.Value = 0
     Fill_Doctors_Grid
End Sub

Private Sub chkDoctor_Late_Click()
    If chkDoctor_Late.Value = 1 Then chkDoctor_Absent.Value = 0
    Fill_Doctors_Grid
End Sub

Private Sub cmdRefresh_Click()
    Dim rsEmployee_Continuance As New ADODB.Recordset
    Dim rsDoctors_Continuance As New ADODB.Recordset
    Dim rsEmployee_Vacations As New ADODB.Recordset
    Dim rsDoctors_Vacations As New ADODB.Recordset
    Dim sql As String
    Dim cancel As Boolean
    
    Set_Current_Time
    
    If dtDate.Value > rsCurrent_Time.Fields(0).Value Then
        MsgBox "·« Ì„ﬂ‰ﬂ ÿ·» »Ì«‰«   «—ÌŒ √ﬂ»— „‰ «· «—ÌŒ «·Õ«·Ì", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    
    Clear_Grid GrdEmployees_Contiuance
    Clear_Grid GrdDoctors_Contiuance
    Clear_Grid GrdEmployees_Vacations
    Clear_Grid GrdDoctors_Vacations
    
    sql = " set dateformat DMY Select Employee_Name,Exist_Status,comming_Time,leaving_Time " & _
          " from sf_Get_Employee_Dialy_Continuance('" & format(dtDate.Value, "dd/mm/yyyy") & "',0)"
    
    Set rsEmployee_Continuance = ExecuteSelect(Conn, sql, cancel)
    
    If rsEmployee_Continuance.RecordCount <> 0 Then
        Set GrdEmployees_Contiuance.DataSource = rsEmployee_Continuance
    End If
    
    sql = " set dateformat DMY Select Employee_Name,Exist_Status,comming_Time,leaving_Time " & _
          " from sf_Get_Employee_Dialy_Continuance('" & format(dtDate.Value, "dd/mm/yyyy") & "',1)"
    
    Set rsDoctors_Continuance = ExecuteSelect(Conn, sql, cancel)
                                                
    If rsDoctors_Continuance.RecordCount <> 0 Then
        Set GrdDoctors_Contiuance.DataSource = rsDoctors_Continuance
    End If
    
    sql = "set dateformat DMY Select Employee_Name,Start_Time,End_Time from " & _
          " sf_Get_Employee_Dialy_Vacations('" & format(dtDate.Value, "dd/mm/yyyy") & "',0)"
    
    Set rsEmployee_Vacations = ExecuteSelect(Conn, sql, cancel)
                                                
    If rsEmployee_Vacations.RecordCount <> 0 Then
        Set GrdEmployees_Vacations.DataSource = rsEmployee_Vacations
    End If
    
    sql = "set dateformat DMY Select Employee_Name,Start_Time,End_Time from " & _
          " sf_Get_Employee_Dialy_Vacations('" & format(dtDate.Value, "dd/mm/yyyy") & "',1)"
    
    Set rsDoctors_Vacations = ExecuteSelect(Conn, sql, cancel)
                                                
    If rsDoctors_Vacations.RecordCount <> 0 Then
        Set GrdDoctors_Vacations.DataSource = rsDoctors_Vacations
    End If
    
                                                
End Sub

Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    RefreshCommands btall
    RefreshCommands btnSettings And FormSettings
    ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 11910
    FormSettings = 0
    btnSettings = 0
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    InitFrame
    Set ActiveFrame = masterFrame
    dtDate.Value = Date
    cmdRefresh_Click
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
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub GrdEmployees_Contiuance_AfterDataRefresh()
    For i = 1 To GrdEmployees_Contiuance.Rows - 1
        GrdEmployees_Contiuance.TextMatrix(i, 2) = format(GrdEmployees_Contiuance.TextMatrix(i, 2), "h:mm AM/PM")
        GrdEmployees_Contiuance.TextMatrix(i, 3) = format(GrdEmployees_Contiuance.TextMatrix(i, 3), "h:mm AM/PM")
    Next i
    GrdEmployees_Contiuance.ColWidth(0) = 2505
    GrdEmployees_Contiuance.ColWidth(2) = 900
    GrdEmployees_Contiuance.ColWidth(3) = 1035
End Sub

Private Sub GrdDoctors_Contiuance_AfterDataRefresh()
    For i = 1 To GrdDoctors_Contiuance.Rows - 1
        GrdDoctors_Contiuance.TextMatrix(i, 2) = format(GrdDoctors_Contiuance.TextMatrix(i, 2), "h:mm AM/PM")
        GrdDoctors_Contiuance.TextMatrix(i, 3) = format(GrdDoctors_Contiuance.TextMatrix(i, 3), "h:mm AM/PM")
    Next i
    GrdDoctors_Contiuance.ColWidth(0) = 2505
    GrdDoctors_Contiuance.ColWidth(2) = 900
    GrdDoctors_Contiuance.ColWidth(3) = 1020
End Sub
Private Sub GrdDoctors_Vacations_AfterDataRefresh()
    For i = 1 To GrdDoctors_Vacations.Rows - 1
        GrdDoctors_Vacations.TextMatrix(i, 2) = format(GrdDoctors_Vacations.TextMatrix(i, 2), "h:mm AM/PM")
        GrdDoctors_Vacations.TextMatrix(i, 1) = format(GrdDoctors_Vacations.TextMatrix(i, 1), "h:mm AM/PM")
    Next i
    GrdDoctors_Vacations.ColWidth(0) = 2505
    GrdDoctors_Vacations.ColWidth(1) = 900
    GrdDoctors_Vacations.ColWidth(2) = 1035
End Sub
Private Sub GrdEmployees_Vacations_AfterDataRefresh()
    For i = 1 To GrdEmployees_Vacations.Rows - 1
        GrdEmployees_Vacations.TextMatrix(i, 2) = format(GrdEmployees_Vacations.TextMatrix(i, 2), "h:mm AM/PM")
        GrdEmployees_Vacations.TextMatrix(i, 1) = format(GrdEmployees_Vacations.TextMatrix(i, 1), "h:mm AM/PM")
    Next i
    GrdEmployees_Vacations.ColWidth(0) = 2505
    GrdEmployees_Vacations.ColWidth(1) = 900
    GrdEmployees_Vacations.ColWidth(2) = 1035
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub


