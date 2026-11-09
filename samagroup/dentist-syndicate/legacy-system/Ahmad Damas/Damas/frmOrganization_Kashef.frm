VERSION 5.00
Object = "{D76D7128-4A96-11D3-BD95-D296DC2DD072}#1.0#0"; "Vsflex7.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmOrganization_Kashef 
   BackColor       =   &H00E1FEFF&
   Caption         =   "ﬂ‘› „ÿ«·»… „ƒ””…"
   ClientHeight    =   8490
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11865
   Icon            =   "frmOrganization_Kashef.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8490
   ScaleWidth      =   11865
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "ﬂ‘› „ÿ«·»… „ƒ””…"
      Height          =   8355
      Left            =   90
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Tag             =   ";repeat=true;"
      Top             =   0
      Width           =   11670
      Begin VB.CommandButton cmdCancelIhalat 
         Caption         =   "≈·€«¡ „⁄«·Ã«  «·≈Õ«·«  ÷„‰ «·ﬂ‘›"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         TabIndex        =   32
         Top             =   2280
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.ComboBox cmbSort 
         Height          =   315
         ItemData        =   "frmOrganization_Kashef.frx":1CFA
         Left            =   2160
         List            =   "frmOrganization_Kashef.frx":1D0D
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   28
         Top             =   2325
         Width           =   2310
      End
      Begin VB.CommandButton cmdPrintMore 
         Caption         =   "ÿ»«⁄… „ÿ«·»… √ﬂÀ— „‰ ‘—ﬂ…"
         Height          =   330
         Left            =   6240
         RightToLeft     =   -1  'True
         TabIndex        =   26
         Top             =   2310
         Width           =   2085
      End
      Begin VB.CommandButton cmdMove_Kashef 
         Caption         =   " —ÕÌ· «·ﬂ‘›"
         Height          =   330
         Left            =   8550
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   2310
         Width           =   1365
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         ForeColor       =   &H80000008&
         Height          =   465
         Left            =   225
         RightToLeft     =   -1  'True
         ScaleHeight     =   435
         ScaleWidth      =   11280
         TabIndex        =   13
         Top             =   1725
         Width           =   11310
         Begin VB.OptionButton optWithout_Treat 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E1FEFF&
            Caption         =   "›Õ’ „—ﬂ“Ì"
            Height          =   330
            Left            =   135
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   15
            Top             =   45
            Width           =   4650
         End
         Begin VB.OptionButton optWith_Treat 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E1FEFF&
            Caption         =   "›Õ’ „—ﬂ“Ì + „⁄«·Ã…"
            Height          =   330
            Left            =   6435
            RightToLeft     =   -1  'True
            Style           =   1  'Graphical
            TabIndex        =   14
            Top             =   45
            Value           =   -1  'True
            Width           =   4650
         End
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "⁄—÷ «·»Ì«‰« "
         Height          =   330
         Left            =   10170
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   2310
         Width           =   1365
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
         TabIndex        =   7
         Top             =   240
         Width           =   11430
      End
      Begin VB.CommandButton cmdSelect_Organization 
         Caption         =   "..."
         Height          =   375
         Left            =   6720
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   495
         Width           =   420
      End
      Begin VB.TextBox txtOrganization_Name 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   495
         Width           =   4605
      End
      Begin VB.TextBox txtOrganization_ID 
         Alignment       =   1  'Right Justify
         Height          =   375
         Left            =   7200
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   495
         Width           =   2850
      End
      Begin VB.OptionButton optMonth 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄‰ ‘Â—"
         Height          =   240
         Left            =   10215
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   1125
         Value           =   -1  'True
         Width           =   1005
      End
      Begin VB.OptionButton optRange 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‰  «—ÌŒ"
         Height          =   240
         Left            =   5220
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   1125
         Width           =   960
      End
      Begin VB.ComboBox cmbMonth 
         Height          =   315
         Left            =   8190
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   1088
         Width           =   1815
      End
      Begin VSFlex7Ctl.VSFlexGrid fg 
         Height          =   5085
         Left            =   90
         TabIndex        =   11
         Tag             =   $"frmOrganization_Kashef.frx":1D71
         Top             =   2760
         Width           =   11490
         _cx             =   20267
         _cy             =   8969
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
         Cols            =   8
         FixedRows       =   1
         FixedCols       =   0
         RowHeightMin    =   400
         RowHeightMax    =   400
         ColWidthMin     =   0
         ColWidthMax     =   0
         ExtendLastCol   =   0   'False
         FormatString    =   $"frmOrganization_Kashef.frx":1E3C
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
      Begin MSComCtl2.DTPicker dtYear 
         DataField       =   "Die_Date"
         Height          =   315
         Left            =   6705
         TabIndex        =   31
         Top             =   1088
         Width           =   885
         _ExtentX        =   1561
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "yyyy"
         Format          =   59637763
         CurrentDate     =   40076
      End
      Begin MSComCtl2.DTPicker dtTo 
         DataField       =   "Die_Date"
         Height          =   315
         Left            =   360
         TabIndex        =   29
         Top             =   1095
         Width           =   1785
         _ExtentX        =   3149
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   59637763
         CurrentDate     =   40543
      End
      Begin MSComCtl2.DTPicker dtFrom 
         DataField       =   "Die_Date"
         Height          =   315
         Left            =   3195
         TabIndex        =   30
         Top             =   1095
         Width           =   2010
         _ExtentX        =   3545
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   59637763
         CurrentDate     =   40179
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   " — Ì» «·≈Õ«·«  Õ”» :"
         Height          =   225
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   27
         Top             =   2385
         Width           =   1500
      End
      Begin VB.Label lblYear 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "„‰ ”‰…"
         Height          =   240
         Left            =   7560
         RightToLeft     =   -1  'True
         TabIndex        =   25
         Top             =   1125
         Width           =   570
      End
      Begin VB.Label lblWhole_Caption 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈Ã„«·Ì «·„ÿ«·»…"
         Height          =   255
         Left            =   1440
         RightToLeft     =   -1  'True
         TabIndex        =   24
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   1095
      End
      Begin VB.Label lblWhole_Total 
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
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   23
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   1335
      End
      Begin VB.Label lblTreatment_Caption 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈Ã„«·Ì «·„⁄«·Ã…"
         Height          =   255
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   22
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   1095
      End
      Begin VB.Label lblTreatment_Total 
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
         Left            =   2880
         RightToLeft     =   -1  'True
         TabIndex        =   21
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   1335
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈Ã„«·Ì «·›Õ’"
         Height          =   255
         Left            =   7080
         RightToLeft     =   -1  'True
         TabIndex        =   20
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   975
      End
      Begin VB.Label lblExam_Total 
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
         Left            =   5640
         RightToLeft     =   -1  'True
         TabIndex        =   19
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   1335
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "⁄œœ «·≈Õ«·« "
         Height          =   255
         Left            =   10440
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
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
         Left            =   9000
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Tag             =   ";AlwaysEnabled=true;"
         Top             =   7980
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "«”„ «·„ƒ””…"
         Height          =   285
         Left            =   5265
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   585
         Width           =   915
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "—ﬁ„ «·„ƒ””…"
         Height          =   285
         Left            =   10170
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   585
         Width           =   1005
      End
      Begin VB.Label lblTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E1FEFF&
         Caption         =   "≈·Ï  «—ÌŒ"
         Height          =   240
         Left            =   2310
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   1125
         Width           =   690
      End
   End
End
Attribute VB_Name = "frmOrganization_Kashef"
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
Dim Organization_checked As Boolean
Public sql As String
Public Asking_No As String
Public Asking_Date As String
Dim AccYear As String
Dim Start_Date As String
Dim End_Date As String
Public Moving_Kahsef As Boolean

Public Function getSql(Organization_Id As Long) As String

     Dim sql As String
     
'     Sql = "Set DateFormat DMY Select Central_Exam_ID, Exam_Date, Patient_Name, " & _
'          "Curer_Doctor_Name, Examiner_Doctor_Name, case isNull(Whole_Total,0) when 0 then  isNull(Price,0) else whole_total end - isNull(Price,0) " & _
'          " AS Treatment_Total, isNull(Price,0) as Price, case isNull(Whole_Total,0) when 0 then  isNull(Price,0) else Whole_Total end as Whole_Total " & _
'          " from vCentral_Exam where moved = 0 "
    sql = "Set DateFormat DMY Select * from vCentral_Exam Where Moved = 0 "
    
    If optWith_Treat.Value Then
        
        sql = sql + " And Not Curer_Doctor_ID is Null "
        
         If Not optMonth.Value Then
            sql = sql + " And Expose_Date between '" & dtFrom.Value & "' and '" & dtTo.Value & "'"
         Else
            Set_Date_Edge cmbMonth.ItemData(cmbMonth.ListIndex)
            sql = sql + " And Expose_Date between '" & Start_Date & "' and '" & End_Date & "'"
         End If
    
    Else
        
        sql = sql + " And Curer_Doctor_ID is Null "
        
         If Not optMonth.Value Then
            sql = sql + " And Exam_Date between '" & dtFrom.Value & "' and '" & dtTo.Value & "'"
         Else
            Set_Date_Edge cmbMonth.ItemData(cmbMonth.ListIndex)
            sql = sql + " And Exam_Date between '" & Start_Date & "' and '" & End_Date & "'"
         End If
         
    End If
    
     sql = sql + " And Organization_ID = " & Organization_Id
     
     Select Case cmbSort.ListIndex
     Case 0 ' «—ÌŒ «·ﬂ‘›
        sql = sql + " order by Expose_Date "
     Case 1 '—ﬁ„ «·≈Õ«·…
        sql = sql + " order by Central_Exam_ID "
     Case 2 ' «—ÌŒ «· À»Ì 
        sql = sql + " order by Fixing_Date "
     Case 3 '«·ÿ»Ì» «·„⁄«·Ã
        sql = sql + " order by Curer_Doctor_Name "
     Case 4 '«·ÿ»Ì» «·›«Õ’
        sql = sql + " order by Examiner_Doctor_Name "
     End Select
    
     getSql = sql
    
End Function

Public Function GetWhole_Total(Organization_Id As Long) As Long

     Dim sql As String
     Dim rs As ADODB.Recordset
     Dim cancel As Boolean
    
    If optWith_Treat.Value Then
    
        sql = "Set DateFormat DMY Select isnull(sum(Whole_Total),0) as Whole_Total " & _
          " from vCentral_Exam where moved = 0 "
        
        sql = sql + " And Not Curer_Doctor_ID is Null "
        
         If Not optMonth.Value Then
            sql = sql + " And Expose_Date between '" & dtFrom.Value & "' and '" & dtTo.Value & "'"
         Else
            Set_Date_Edge cmbMonth.ItemData(cmbMonth.ListIndex)
            sql = sql + " And Expose_Date between '" & Start_Date & "' and '" & End_Date & "'"
         End If
    
    Else
    
        sql = "Set DateFormat DMY Select isnull(sum(Price),0) as Whole_Total " & _
          " from vCentral_Exam where moved = 0 "
        
        sql = sql + " And Curer_Doctor_ID is Null "
        
         If Not optMonth.Value Then
            sql = sql + " And Exam_Date between '" & dtFrom.Value & "' and '" & dtTo.Value & "'"
         Else
            Set_Date_Edge cmbMonth.ItemData(cmbMonth.ListIndex)
            sql = sql + " And Exam_Date between '" & Start_Date & "' and '" & End_Date & "'"
         End If
         
    End If
    
     sql = sql + " And Organization_ID = " & Organization_Id
    
    Set rs = ExecuteSelect(Conn, sql, cancel)
    
    If Not cancel Then GetWhole_Total = rs!Whole_Total
    
End Function

Sub Set_Date_Edge(Month_No As Integer)
    
    With frmMoving_Options
        If optMonth.Value Then
            
            Select Case Month_No
            Case 1
                    .Start_Date = "01/01/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/01/" & format(dtYear.Value, "yyyy")
            Case 2
                    If year(Date) Mod 4 = 0 Then
                        .Start_Date = "01/02/" & format(dtYear.Value, "yyyy")
                        .End_Date = "29/02/" & format(dtYear.Value, "yyyy")
                    Else
                        .Start_Date = "01/02/" & format(dtYear.Value, "yyyy")
                        .End_Date = "28/02/" & format(dtYear.Value, "yyyy")
                    End If
            Case 3
                    .Start_Date = "01/03/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/03/" & format(dtYear.Value, "yyyy")
            Case 4
                    .Start_Date = "01/04/" & format(dtYear.Value, "yyyy")
                    .End_Date = "30/04/" & format(dtYear.Value, "yyyy")
            Case 5
                    .Start_Date = "01/05/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/05/" & format(dtYear.Value, "yyyy")
            Case 6
                    .Start_Date = "01/06/" & format(dtYear.Value, "yyyy")
                    .End_Date = "30/06/" & format(dtYear.Value, "yyyy")
            Case 7
                    .Start_Date = "01/07/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/07/" & format(dtYear.Value, "yyyy")
            Case 8
                    .Start_Date = "01/08/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/08/" & format(dtYear.Value, "yyyy")
            Case 9
                    .Start_Date = "01/09/" & format(dtYear.Value, "yyyy")
                    .End_Date = "30/09/" & format(dtYear.Value, "yyyy")
            Case 10
                    .Start_Date = "01/10/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/10/" & format(dtYear.Value, "yyyy")
            Case 11
                    .Start_Date = "01/11/" & format(dtYear.Value, "yyyy")
                    .End_Date = "30/11/" & format(dtYear.Value, "yyyy")
            Case 12
                    .Start_Date = "01/12/" & format(dtYear.Value, "yyyy")
                    .End_Date = "31/12/" & format(dtYear.Value, "yyyy")
            End Select
            
        Else
            .Start_Date = dtFrom.Value
            .End_Date = dtTo.Value
        End If
        
        Start_Date = .Start_Date
        End_Date = .End_Date
        
    End With
    
End Sub
Sub Set_Organization_ID(Value As String)
    txtOrganization_ID.text = Value
End Sub
Sub Set_Organization_Name(Value As String)
    txtOrganization_Name.text = Value
End Sub
Sub Select_Organization()
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    Dim sql As String
    Organization_checked = False
    
    sql = "select Organization_Name as Name ,organization_ID as ID from organization" & _
          " where Organization_id = " & val(txtOrganization_ID.text) & " order by 1"
          
   Set rs = ExecuteSelect(Conn, sql, c)
   
   If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        Organization_checked = False
        Exit Sub
   End If
   
   If rs.RecordCount = 1 Then
         txtOrganization_ID.text = rs.Fields("ID").Value
         txtOrganization_Name.text = rs.Fields("Name").Value
         Organization_checked = True
   
   ElseIf rs.RecordCount <> 1 Then
       rs.Close
          
          sql = "select Organization_Name as Name ,organization_ID as ID from organization"
                
          Set rs = ExecuteSelect(Conn, sql, c)
          
          If c Then
               MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
               Organization_checked = False
               Exit Sub
          End If
          
          If rs.RecordCount = 1 Then
                txtOrganization_ID.text = rs.Fields("ID").Value
                txtOrganization_Name.text = rs.Fields("Name").Value
                Organization_checked = True
          ElseIf rs.RecordCount <> 1 Then
               'Load Clin_List
              'Set Clin_List.callerForm = Me
              GLOBAL_TAG = "datafield=,0:id,1:Name,;"
              GLOBAL_TAG = GLOBAL_TAG & "caller=,0:Set_Organization_ID,1:Set_Organization_Name,;"
              'GLOBAL_TAG = GLOBAL_TAG & "initQuery=0:" & txtExaminer_Doctor_ID.text & ",;"
              GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=" & sql & ";"
              btnSettings = GetBtnSettings
              Clin_List.fg.Cols = 2
              Clin_List.fg.ColWidth(0) = 1000
              Clin_List.fg.ColWidth(1) = 2000
              Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
              Clin_List.fg.Cell(flexcpText, 0, 0) = "«·—ﬁ„ «·‘—ﬂ…"
              Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·”—ﬂ…"
              Set Clin_List.CallerForm = Me
              Clin_List.Show 1
              RefreshCommands btnSettings And FormSettings
              Exit Sub
          End If
    End If

End Sub
'Sub Resize_Grid(Cols As Integer)
'     ' Resize the grid fg
'    Dim i As Integer
'    Dim W As Long
'    Dim totWidth As Long
'    totWidth = 0
'    For i = 0 To fg.Cols - 3
'        totWidth = totWidth + fg.ColWidth(i)
'    Next
'    For i = 0 To fg.Cols - 1
'        fg.ColWidth(i) = fg.Width * fg.ColWidth(i) / totWidth
'    Next
'End Sub

Sub Clear_Grid()
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "Select * from vCentral_Exam where 1 = 0", cancel)
    If Not master.rs.EOF Then
        master.rs.MoveFirst
    End If
    
End Sub

Private Sub cmdCancelIhalat_Click()
    If master.rs.RecordCount = 0 Then Exit Sub
    Dim cancelState As Boolean
    Dim sq1 As String
    Dim i As Integer
    For i = 1 To fg.Rows - 1
       sq1 = "delete pic_clientTreats where ihalaID = " + fg.Cell(flexcpText, i, 0)
       ExecuteCommand Conn, sq1, cancelState
       sq1 = "exec sp_UpdateWholeTotal " + fg.Cell(flexcpText, i, 0) + ", '" + fg.Cell(flexcpText, i, 1) + "'"
       ExecuteCommand Conn, sq1, cancelState
    Next i
    MsgBox " „ ≈·€«¡ „⁄«·Ã«  «·≈Õ«·« ", vbInformation + vbOKOnly, " „  «·⁄„·Ì… »‰Ã«Õ"
    cmdCancelIhalat.Enabled = False
End Sub

Private Sub cmdMove_Kashef_Click()
    If cmdCancelIhalat.visible And cmdCancelIhalat.Enabled Then
        MsgBox "ÌÃ» ≈·€«¡ „⁄«·Ã«  «·≈Õ«·«  ÷„‰ «·ﬂ‘› ﬁ»·  —ÕÌ· «·ﬂ‘›", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
    If master.rs.RecordCount = 0 Then Exit Sub
    Set_Date_Edge cmbMonth.ItemData(cmbMonth.ListIndex)
    
    frmMoving_Options.Show 1
    If Moving_Kahsef Then
        cmdRefresh_Click
    End If
End Sub

Private Sub cmdPrintMore_Click()
    frmPrintable_Organizations.Show 1
End Sub

Private Sub cmdRefresh_Click()

    'Moving_Kahsef = False
    
    If AccYear = "" Then
        MsgBox "ÌÃ»  ÕœÌœ «·”‰… «·„«·Ì… ﬁ»· ⁄—÷ «·»Ì«‰« ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        Exit Sub
    End If
        
    Asking_Date = ""
    Asking_No = ""
    
    Clear_Grid
    
    If txtOrganization_ID.text = "" Or txtOrganization_Name.text = "" Then
        MsgBox "ÌÃ» «Œ Ì«— «·„ƒ””… ﬁ»· ÿ·» «·ﬂ‘›", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
        txtOrganization_ID.SetFocus
        Exit Sub
    End If
    
    
    Dim cancel As Boolean
    Dim sql As String
    Me.MousePointer = vbHourglass
    sql = getSql(val(txtOrganization_ID.text))
    
    Set master.rs = ExecuteSelect(Conn, sql, cancel)
    cmdCancelIhalat.Enabled = True
'     If master.rs.RecordCount = 0 And Moving_Kahsef Then
'       MsgBox "·« ÌÊÃœ ≈Õ«·«  ‰« Ã… ⁄‰ „Õœœ«  «·»ÕÀ «· Ì √œŒ· Â«", vbCritical + vbOKOnly, "⁄œœ «·”Ã·«  = 0"
'       Exit Sub
'    End If
    
    If Not master.rs.EOF Then
        master.rs.MoveFirst
    End If
    Me.MousePointer = vbDefault
End Sub

Private Sub cmdSelect_Doctor_Click()
    
End Sub

Private Sub cmdSelect_Organization_Click()
    txtOrganization_ID_Validate False
End Sub

Private Sub fg_BeforeEdit(ByVal Row As Long, ByVal Col As Long, cancel As Boolean)
    If master.state <> ST_SEARCH Then
        cancel = True
    ElseIf Row <> 1 Then
        cancel = True
    End If
End Sub
Private Sub fg_DblClick()
        
'    If GetTagValue(Current_State.Settings, "EDIT_TOTAL") = "false" Or fg.Rows = 1 Then Exit Sub
'
'    With frmUpdate_Ihala_Total
'        .Caption = .Caption & fg.Cell(flexcpText, fg.Row, 0)
'        .lblCentral_Exam_ID.Caption = fg.Cell(flexcpText, fg.Row, 0)
'        .lblPatient_Name.Caption = fg.Cell(flexcpText, fg.Row, 2)
'        .lblCurer_Doctor_Name.Caption = fg.Cell(flexcpText, fg.Row, 3)
'        .lblOld_Total.Caption = fg.Cell(flexcpText, fg.Row, 7)
'        .Show 1
'    End With
'    MousePointer = vbHourglass
'    cmdRefresh_Click
'    MousePointer = vbDefault
    
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
    
    oldScaleWidth = 12000 ' TODO: Put the Form.Width value here
    FormSettings = btall - btsave - btNew - btUpdate - btDelete - btCancel
    btnSettings = btall - btsave - btSearchCancel - btSearchExec
    
    
    
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    InitFrame
    optMonth_Click
    Clear_Grid
    sql = "Select * from vCentral_Exam where 0 = 1"
    'master.MoveFirst
    Set ActiveFrame = masterFrame
'    If DataEnvironment.Conn.state = 0 Then _
'        DataEnvironment.Conn.Open (GetConnectionString(1))
    
    '<IYADK>
    Dim AccRs As ADODB.Recordset
    Dim cancel As Boolean
    Set AccRs = ExecuteSelect(Conn, "select top 1 year(cDate) AccYear from Acc_SanadTmp", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« ", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    If AccRs.EOF Then
        MsgBox "€Ì— ﬁ«œ— ⁄·Ï  ÕœÌœ «·”‰… «·„«·Ì… «·Õ«·Ì…° ÌÃ» √‰ ÌÊÃœ ”‰œ Ê«Õœ ›Ì «·„Õ«”»… ⁄·Ï «·√ﬁ·", vbMsgBoxRight + vbMsgBoxRtlReading
        Exit Sub
    End If
    AccYear = AccRs!AccYear
    '</IYADK>
    If AccYear <> "" Then
        dtYear.Value = format("01/01/" & AccYear)
    End If
    Moving_Kahsef = False
    If Current_State.id = 1 Then '—Ì› œ„‘ﬁ
        cmbSort.ListIndex = 2
    Else
        cmbSort.ListIndex = 0
    End If
    If Current_State.Show_Per_Company = False Then
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Central_Exam_ID,1:Exam_Date,2:Patient_Name,3:Curer_Doctor_Name,4:Examiner_Doctor_Name,5:Treatment_Total,6:Price,7:Whole_Total,;"
    Else
        fg.Tag = ";typeof=vsflexgrid;datafield=,0:Ihala_ID_in_Company,1:Exam_Date,2:Patient_Name,3:Curer_Doctor_Name,4:Examiner_Doctor_Name,5:Treatment_Total,6:Price,7:Whole_Total,;"
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

Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    lblRecordCount.Caption = master.rs.RecordCount
    Dim i As Integer
    lblWhole_Total.Caption = 0
    lblTreatment_Total.Caption = 0
    lblExam_Total.Caption = 0
    For i = 1 To fg.Rows - 1
        lblTreatment_Total.Caption = val(lblTreatment_Total.Caption) + val(fg.Cell(flexcpText, i, 5))
        lblExam_Total.Caption = val(lblExam_Total.Caption) + val(fg.Cell(flexcpText, i, 6))
        lblWhole_Total.Caption = val(lblWhole_Total.Caption) + val(fg.Cell(flexcpText, i, 7))
    Next i
    
End Sub

Private Sub master_doPrint(rs As ADODB.Recordset)
    On Error GoTo errHandler
    If rs.RecordCount = 0 Then Exit Sub
    If optWith_Treat.Value Then
        With DRCompanyMoney
            .Sections(1).Controls(1).Caption = Current_State.FullName
            .Sections(1).Controls(11).Caption = txtOrganization_Name.text
            .Sections(1).Controls(13).Caption = cmbMonth.text
            .Sections(1).Controls(18).Caption = year(dtYear.Value)
            .Sections(1).Controls(15).Caption = Asking_No
            .Sections(1).Controls(16).Caption = Asking_Date
            '.Sections(5).Controls(15).Caption = Current_State.Name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name").Caption = Current_State.name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name1").Caption = Current_State.name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblState_Name2").Caption = Current_State.name
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblAccount_Number").Caption = Current_State.Account_Number
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblBoss").Caption = Current_State.Boss
            Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblAccountant").Caption = Current_State.Accountant
            Set .DataSource = master.rs 'DataEnvironment
            .DataMember = ""
            Dim lblTaff As RptLabel
            Set lblTaff = Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblTaff")
            lblTaff.Caption = WriteNo(val(lblWhole_Total.Caption), 0)
            .Show 1
        End With
    Else
        With DrCompanyExamList
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblStateName").Caption = Current_State.name
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblOrganization_Name").Caption = txtOrganization_Name.text
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblAsking_No").Caption = Asking_No
            Get_DataReport_Label_byName(DrCompanyExamList, 1, "lblAsking_Date").Caption = Asking_Date
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblState_Name").Caption = Current_State.name
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblAccount_Number").Caption = Current_State.Account_Number
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblBoss").Caption = Current_State.Boss
            Get_DataReport_Label_byName(DrCompanyExamList, 5, "lblAccountant").Caption = Current_State.Accountant
            Set .DataSource = master.rs 'DataEnvironment
            .DataMember = ""
            Set lblTaff = Get_DataReport_Label_byName(DRCompanyMoney, 5, "lblTaff")
            lblTaff.Caption = WriteNo(val(lblWhole_Total.Caption), 0)
            .Show 1
        End With
    End If
    Exit Sub
errHandler:
    Debug.Print Err.description
    If Err.Number = 8542 Then
        MsgBox " «·—Ã«¡  €ÌÌ— ⁄—÷ «·Ê—ﬁ ›Ì «·ÿ«»⁄… «·«› —«÷Ì…", vbCritical, "Õÿ√ ÿ»«⁄…"
        Exit Sub
    End If
    MsgBox "ÕœÀ Œÿ√ √À‰«¡ ÿ»«⁄… «· ﬁ—Ì—", vbCritical
End Sub

Private Sub masterFrame_Click()
    If ActiveFrame = masterFrame Then Exit Sub
    
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub


Private Sub optMonth_Click()
    cmbMonth.Enabled = optMonth.Value
    dtYear.Enabled = optMonth.Value
    lblYear.Enabled = optMonth.Value
    lblTo.Enabled = Not optMonth
    dtFrom.Enabled = Not optMonth
    dtTo.Enabled = Not optMonth
    
End Sub

Private Sub optRange_Click()
    cmbMonth.Enabled = Not optRange
    lblTo.Enabled = optRange.Value
    dtFrom.Enabled = optRange.Value
    dtTo.Enabled = optRange.Value
    dtYear.Enabled = Not optRange.Value
    lblYear.Enabled = Not optRange.Value
End Sub

Private Sub optWith_Treat_Click()
    txtOrganization_ID.text = ""
    txtOrganization_Name.text = ""
    
    Clear_Grid
    fg.ColHidden(3) = False
    fg.ColHidden(7) = False
    fg.ColHidden(5) = False
    ResizeGrid fg
    
    optMonth.Enabled = True
    optMonth.Value = True
    optRange.Enabled = False
    
    lblWhole_Caption.visible = True
    lblWhole_Total.visible = True
    lblTreatment_Caption.visible = True
    lblTreatment_Total.visible = True
    
    cmdCancelIhalat.visible = False
    
End Sub

Private Sub optWithout_Treat_Click()
    Clear_Grid
    txtOrganization_ID.text = ""
    txtOrganization_Name.text = ""
    fg.ColHidden(3) = True
    fg.ColHidden(7) = True
    fg.ColHidden(5) = True
    'Resize_Grid fg.Cols - 3
    optRange.Enabled = True
    Picture1.SetFocus
    lblWhole_Caption.visible = False
    lblWhole_Total.visible = False
    lblTreatment_Caption.visible = False
    lblTreatment_Total.visible = False
    ResizeGrid fg
    cmdCancelIhalat.visible = True
    cmdCancelIhalat.Enabled = False
End Sub

Private Sub txtOrganization_ID_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        txtOrganization_ID_Validate False
        Exit Sub
    End If
    KeyAscii = Prevent_char(KeyAscii)
End Sub

Private Sub txtOrganization_ID_Validate(cancel As Boolean)
    Select_Organization
    cancel = Not Organization_checked
End Sub

