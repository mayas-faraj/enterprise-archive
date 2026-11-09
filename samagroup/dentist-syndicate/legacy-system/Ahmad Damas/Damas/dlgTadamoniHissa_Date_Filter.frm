VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form dlgTadamoniHissa_Date_Filter 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·—Ã«¡  ÕœÌœ «·› —… «·“„‰Ì…"
   ClientHeight    =   3120
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7200
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   RightToLeft     =   -1  'True
   ScaleHeight     =   3120
   ScaleWidth      =   7200
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbMonth 
      Height          =   315
      Left            =   3705
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   11
      Top             =   413
      Width           =   2220
   End
   Begin MSComCtl2.DTPicker dtFrom 
      Height          =   315
      Left            =   3705
      TabIndex        =   6
      Top             =   1650
      Width           =   2220
      _ExtentX        =   3916
      _ExtentY        =   556
      _Version        =   393216
      Format          =   62783489
      CurrentDate     =   40102
   End
   Begin VB.OptionButton optFromTo 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "„‰  «—ÌŒ"
      Height          =   240
      Left            =   6045
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   1680
      Width           =   960
   End
   Begin VB.OptionButton optMonth 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "⁄‰ ‘Â—"
      Height          =   240
      Left            =   6000
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   450
      Width           =   1005
   End
   Begin VB.OptionButton optQuarter 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "⁄‰ «·—Ì⁄"
      Height          =   240
      Left            =   6045
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1050
      Value           =   -1  'True
      Width           =   960
   End
   Begin VB.ComboBox cmbQuarter 
      Height          =   315
      ItemData        =   "dlgTadamoniHissa_Date_Filter.frx":0000
      Left            =   3705
      List            =   "dlgTadamoniHissa_Date_Filter.frx":0010
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1020
      Width           =   2220
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "≈€·«ﬁ"
      Height          =   330
      Left            =   360
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   2460
      Width           =   1410
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "„Ê«›ﬁ"
      Height          =   330
      Left            =   5490
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   2460
      Width           =   1410
   End
   Begin MSComCtl2.DTPicker dtTo 
      Height          =   315
      Left            =   240
      TabIndex        =   8
      Top             =   1650
      Width           =   2220
      _ExtentX        =   3916
      _ExtentY        =   556
      _Version        =   393216
      Format          =   62783489
      CurrentDate     =   40102
   End
   Begin MSComCtl2.DTPicker dtYear 
      Height          =   315
      Left            =   1560
      TabIndex        =   10
      Top             =   690
      Width           =   900
      _ExtentX        =   1588
      _ExtentY        =   556
      _Version        =   393216
      CustomFormat    =   "yyyy"
      Format          =   62783491
      CurrentDate     =   39980
   End
   Begin VB.Label lblYear 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "„‰ ”‰…"
      Height          =   255
      Left            =   2520
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   720
      Width           =   615
   End
   Begin VB.Label lblTo 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "≈·Ï  «—ÌŒ"
      Height          =   255
      Left            =   2520
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   1680
      Width           =   735
   End
End
Attribute VB_Name = "dlgTadamoniHissa_Date_Filter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Hissa_Type As Integer
Public Start_Date As String
Public End_Date As String
Private Sub Open_AccMaster()
    If Hissa_Type = 1 Then
        ActiveDatabaseName = "Default"
    Else
        ActiveDatabaseName = "fari"
    End If
    MDIMain.EnterClinic
    Acc_Master.Show
End Sub
'0 Õ’… «·’‰œÊﬁ „‰ «·›—⁄
'1 Õ’… «·’‰œÊﬁ „‰ «·‰Ÿ«„ «· ⁄«Ê‰Ì
Sub InitFrame()
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
Sub Set_Date_Filter()
    
    If optMonth.Value Then
        
        Start_Date = format("01/" & format(cmbMonth.ListIndex + 1, "00") & "/" & year(dtYear.Value), "dd/mm/yyyy")
        
        If cmbMonth.ListIndex < 11 Then
            End_Date = CDate("01/" & CStr(Month(Start_Date) + 1) & "/" & year(Start_Date)) - 1
        Else
            End_Date = format("31/12/" & year(dtYear.Value), "dd/mm/yyyy")
        End If
        
    ElseIf optQuarter Then
        
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
        
    Else
        
        Start_Date = dtFrom.Value
        End_Date = dtTo.Value
        
    End If
    
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    
    Dim sql As String
    Dim cancel As Boolean
    Dim rsAcc As ADODB.Recordset
    
    Set_Date_Filter
      
    If optFromTo.Value = False Then
        If Hissa_Type = 0 Then '›—⁄
            ActiveDatabaseName = "fari"
            pForm = "TadamonFara"
        Else
            ActiveDatabaseName = "default" '‰Ÿ«„
            pForm = "TadamonHissa"
        End If
        Acc_MasterRep.Show vbModal, Me
    Else
        
        sql = " Select Acc from Acc_Accounts" & Acc_DBYearT & " Where Name like '%’‰œÊﬁ «· ÷«„‰ «·›—⁄Ì%'"
        
        If Hissa_Type = 0 Then '›—⁄
            ActiveDatabaseName = "fari"
        Else
            ActiveDatabaseName = "default"
        End If
        
        Set rsAcc = ExecuteSelect(Conn, sql, cancel)
        
        If cancel Then
            MsgBox "Õ’· Œÿ√ €Ì— „ Êﬁ⁄ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
            Exit Sub
        End If
        
        If rsAcc.RecordCount <> 1 Then
            MsgBox "Õ’· Œÿ√ √À‰«¡ „Õ«Ê·… «·Õ’Ê· ⁄·Ï —ﬁ„ Õ”«» ’‰œÊﬁ «· ÷«„‰ «·›—⁄Ì ›Ì «·‘Ã—… «·„Õ«”»Ì…", vbCritical + vbOKOnly, "Œÿ√"
            Exit Sub
        End If
        
        Set dlgAcc_Master_Object = New dlgAcc_Master
        dlgAcc_Master_Object.Default_Acc = rsAcc.Fields(0).Value
        dlgAcc_Master_Object.Show 1
    End If
    Set rsAcc = Nothing
End Sub

Private Sub Form_Load()
    FormatForm Me
    InitFrame
    optQuarter_Click
End Sub

Private Sub optFromTo_Click()
    lblYear.Enabled = optMonth.Value Or optQuarter.Value
    dtYear.Enabled = optMonth.Value Or optQuarter.Value
    cmbQuarter.Enabled = optQuarter.Value
    
    cmbMonth.Enabled = optMonth.Value
    lblYear.Enabled = optMonth.Value Or optQuarter.Value
    dtYear.Enabled = optMonth.Value Or optQuarter.Value
    
    dtFrom.Enabled = optFromTo.Value
    dtTo.Enabled = optFromTo.Value
    lblTo.Enabled = optFromTo.Value
End Sub

Private Sub optMonth_Click()
    lblYear.Enabled = optMonth.Value Or optQuarter.Value
    dtYear.Enabled = optMonth.Value Or optQuarter.Value
    cmbQuarter.Enabled = optQuarter.Value
    
    cmbMonth.Enabled = optMonth.Value
    lblYear.Enabled = optMonth.Value Or optQuarter.Value
    dtYear.Enabled = optMonth.Value Or optQuarter.Value
    
    dtFrom.Enabled = optFromTo.Value
    dtTo.Enabled = optFromTo.Value
    lblTo.Enabled = optFromTo.Value
End Sub

Private Sub optQuarter_Click()
    lblYear.Enabled = optMonth.Value Or optQuarter.Value
    dtYear.Enabled = optMonth.Value Or optQuarter.Value
    cmbQuarter.Enabled = optQuarter.Value
    
    cmbMonth.Enabled = optMonth.Value
    lblYear.Enabled = optMonth.Value Or optQuarter.Value
    dtYear.Enabled = optMonth.Value Or optQuarter.Value
    
    dtFrom.Enabled = optFromTo.Value
    dtTo.Enabled = optFromTo.Value
    lblTo.Enabled = optFromTo.Value
End Sub
