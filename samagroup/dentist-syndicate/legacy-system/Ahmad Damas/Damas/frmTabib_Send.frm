VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmTabib_Send 
   BackColor       =   &H00E1FEFF&
   Caption         =   "«·»—Ìœ «·’«œ— ( «·√ÿ»«¡)"
   ClientHeight    =   7500
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   9600
   Icon            =   "frmTabib_Send.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   7500
   ScaleWidth      =   9600
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "‰’ «·—”«·…"
      Height          =   7320
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Tag             =   "master"
      Top             =   120
      Width           =   9375
      Begin VB.CommandButton cmdHayaa 
         Caption         =   "√⁄÷«¡ ÂÌ∆… «·›—⁄"
         Enabled         =   0   'False
         Height          =   375
         Left            =   5985
         RightToLeft     =   -1  'True
         TabIndex        =   18
         Top             =   5715
         Width           =   3255
      End
      Begin VB.CommandButton cmdFemales 
         Caption         =   "≈÷«›… Ã„Ì⁄ «·ÿ»Ì»«  «·≈‰«À ≈·Ï «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   17
         Top             =   4740
         Width           =   3255
      End
      Begin VB.CommandButton cmdHezb_Members 
         Caption         =   "≈÷«›… Ã„Ì⁄ «·√ÿ»«¡ «·Õ“»ÌÌ‰ ≈·Ï «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   16
         Top             =   5235
         Width           =   3255
      End
      Begin VB.CommandButton cmdAdd_All_None_Collaborative_Doctors 
         Caption         =   "≈÷«›… Ã„Ì⁄ «·√ÿ»«¡ €Ì— «· ⁄«Ê‰ÌÌ‰ ≈·Ï «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   15
         Top             =   4245
         Width           =   3255
      End
      Begin VB.CommandButton cmdAdd_All_Collaborative_Doctors 
         Caption         =   "≈÷«›… Ã„Ì⁄ «·√ÿ»«¡ «· ⁄«Ê‰ÌÌ‰ ≈·Ï «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   14
         Top             =   3750
         Width           =   3255
      End
      Begin VB.ListBox lstRecipeints 
         Height          =   4350
         Left            =   390
         RightToLeft     =   -1  'True
         TabIndex        =   13
         Tag             =   ";search=true;"
         Top             =   2760
         Width           =   3975
      End
      Begin VB.CommandButton cmdAdd_Doctor 
         Caption         =   "≈÷«›… ÿ»Ì» ≈·Ï «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   12
         Top             =   2760
         Width           =   3255
      End
      Begin VB.CommandButton cmdDelete_Doctor 
         BackColor       =   &H008080FF&
         Caption         =   "Õ–› «·ÿ»Ì» «·Õ«·Ì „‰ «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   6180
         Width           =   3255
      End
      Begin VB.CommandButton cmdAdd_All_Doctors 
         Caption         =   "≈÷«›… Ã„Ì⁄ «·√ÿ»«¡ ≈·Ï «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   3255
         Width           =   3255
      End
      Begin VB.CommandButton cmdDelete_All_Doctors 
         BackColor       =   &H008080FF&
         Caption         =   "Õ–› Ã„Ì⁄ «·√ÿ»«¡ „‰ «·ﬁ«∆„…"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6000
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   6675
         Width           =   3255
      End
      Begin MSComCtl2.DTPicker dtMessage_Date 
         DataField       =   "Message_Date"
         Height          =   375
         Left            =   360
         TabIndex        =   0
         Tag             =   ";search=true;check=required;check=date;"
         Top             =   600
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   62783489
         CurrentDate     =   40139
      End
      Begin VB.TextBox txtTabib_Send_ID 
         Alignment       =   1  'Right Justify
         DataField       =   "Tabib_Send_ID"
         Height          =   375
         Left            =   6480
         RightToLeft     =   -1  'True
         TabIndex        =   3
         TabStop         =   0   'False
         Tag             =   ";search=true;check=Integer > 0;"
         Top             =   600
         Width           =   1575
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
         TabIndex        =   4
         Top             =   240
         Width           =   9135
      End
      Begin VB.TextBox txtMessage_Text 
         Alignment       =   1  'Right Justify
         DataField       =   "Message_Text"
         Height          =   1335
         Left            =   360
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Tag             =   ";search=true;check=required;"
         Top             =   1320
         Width           =   7695
      End
      Begin VB.Label lblRecipients 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ﬁ«∆„… «·„—”· ≈·ÌÂ„"
         Height          =   195
         Left            =   4440
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Tag             =   ";search=false;"
         Top             =   2760
         Width           =   1260
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "‰’ «·—”«·…"
         Height          =   195
         Left            =   8295
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Tag             =   ";Search=true;"
         Top             =   1320
         Width           =   750
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«· «—ÌŒ"
         Height          =   195
         Left            =   2670
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Tag             =   ";Search=true;"
         Top             =   720
         Width           =   480
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "«·—ﬁ„ «·„ ”·”·"
         Height          =   195
         Left            =   8175
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Tag             =   ";Search=true;"
         Top             =   720
         Width           =   1020
      End
   End
End
Attribute VB_Name = "frmTabib_Send"
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

Dim vDoctor_ID As Long
Dim vFull_Name As String
Dim List_Changed As Boolean
Sub Delete_All_Doctors()
    If lstRecipeints.ListCount = 0 Then Exit Sub
    lstRecipeints.Clear
End Sub
Sub Add_Doctors_To_List(Filter As String)
    
    Dim rsDoctors As New ADODB.Recordset
    Dim cancel As Boolean
    Dim Qry As String
    
    Delete_All_Doctors
    
    List_Changed = True
    
    Qry = "Select First_Name + ' ' + Last_Name as Full_Name,Doctor_ID from Doctor_CV " & _
            " where " & Filter & " order by 1"
    
    Set rsDoctors = ExecuteSelect(Conn, Qry, cancel)

    With rsDoctors
        If .RecordCount = 0 Then
            MsgBox "·« ÌÊÃœ √ÿ»«¡ „⁄—›Ê‰", vbCritical + vbOKOnly, "⁄œœ «·”Ã·«  «·‰« Ã… = 0"
            Exit Sub
        Else
            .MoveFirst
            Do While Not .EOF
                lstRecipeints.AddItem .Fields("Full_Name").Value
                lstRecipeints.ItemData(lstRecipeints.NewIndex) = .Fields("Doctor_ID").Value
                lstRecipeints.ListIndex = lstRecipeints.NewIndex
                .MoveNext
            Loop
        End If
    End With
     
    Set rsDoctors = Nothing
    
End Sub
Sub InitFrame()

End Sub

Sub Enable_List_Buttons(Enable_Satus As Boolean)
    cmdAdd_All_Doctors.Enabled = Enable_Satus
    cmdAdd_Doctor.Enabled = Enable_Satus
    cmdDelete_All_Doctors.Enabled = Enable_Satus
    cmdDelete_Doctor.Enabled = Enable_Satus
    cmdAdd_All_None_Collaborative_Doctors.Enabled = Enable_Satus
    cmdAdd_All_Collaborative_Doctors.Enabled = Enable_Satus
    cmdHezb_Members.Enabled = Enable_Satus
    cmdFemales.Enabled = Enable_Satus
    cmdHayaa.Enabled = Enable_Satus
End Sub
Function Check_Uniqueness_In_List(Doctor_ID As Long) As Boolean

    Check_Uniqueness_In_List = False
    
    For i = 0 To lstRecipeints.ListCount - 1
        If lstRecipeints.ItemData(i) = Doctor_ID Then
            MsgBox "Â–« «·ÿ»Ì» „÷«› „”»ﬁ« ·Â–Â «·ﬁ«∆„…", vbCritical + vbOKOnly, "⁄„·Ì… „—›Ê÷…"
            Check_Uniqueness_In_List = True
            Exit Function
        End If
    Next i
    
End Function

Private Sub cmdAdd_All_Collaborative_Doctors_Click()
    Add_Doctors_To_List "dbo.sf_IsActive_Collaborative_Doctor(Doctor_ID) = 1"
End Sub

Private Sub cmdAdd_All_Doctors_Click()
    Add_Doctors_To_List "1=1"
End Sub

Private Sub cmdAdd_All_None_Collaborative_Doctors_Click()
    Add_Doctors_To_List "dbo.sf_IsActive_Collaborative_Doctor(Doctor_ID) = 0"
End Sub

Private Sub cmdAdd_Doctor_Click()
    
    Dim rs As ADODB.Recordset
    Dim c As Boolean
    
    vDoctor_ID = 0
    vFull_Name = ""
    
    Set rs = ExecuteSelect(Conn, "select First_Name + ' ' + Last_Name as Full_Name, Doctor_ID from Doctor_Cv where First_Name + ' ' + Last_Name like '% %'", c)
    If c Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·„⁄ÿÌ« "
        c = True
        Exit Sub
    End If
       'Load Clin_List
       'Set Clin_List.callerForm = Me
       GLOBAL_TAG = ";datafield=,0:Doctor_ID,1:Full_Name,;"
       GLOBAL_TAG = GLOBAL_TAG & "caller=,0:SetDoctor_ID,1:SetFull_Name,;"
       'GLOBAL_TAG = GLOBAL_TAG & "initQuery=1:" ,;"
       GLOBAL_TAG = GLOBAL_TAG & "SearchQuery=select Doctor_ID,First_Name + ' ' + Last_Name as Full_Name from Doctor_CV;"
'       Debug.Print "Show List"
       btnSettings = GetBtnSettings
       Clin_List.fg.Cols = 2
       Clin_List.fg.ColHidden(0) = False
       Clin_List.fg.ColHidden(1) = False
       Clin_List.fg.ColWidth(1) = 3000
       Clin_List.fg.ColAlignment(1) = flexAlignRightCenter
       Clin_List.fg.Cell(flexcpText, 0, 1) = "«”„ «·ÿ»Ì»"
       Clin_List.fg.Cell(flexcpText, 0, 0) = "—ﬁ„ «·ÿ»Ì»"
       Set Clin_List.CallerForm = Me
       'fg.Cell(flexcpText, fg.Row, 6) = ""
       'fg.Cell(flexcpText, fg.Row, 2) = ""
       Clin_List.Show 1
       RefreshCommands btnSettings And FormSettings
'       If fg.Cell(flexcpText, fg.Row, CLIENT_ID) = "" Then Cancel = True
'        Exit Sub
    
'       fg.EditText = rs!Full_Name
'       fg.Cell(flexcpText, Row, CLIENT_ID) = rs!id

       If vDoctor_ID <> 0 Then
       
        If Not Check_Uniqueness_In_List(vDoctor_ID) Then
            lstRecipeints.AddItem vFull_Name
            lstRecipeints.ItemData(lstRecipeints.NewIndex) = vDoctor_ID
            lstRecipeints.SetFocus
            lstRecipeints.ListIndex = lstRecipeints.NewIndex
            vDoctor_ID = 0
            vFull_Name = 0
            List_Changed = True
        End If
        
       End If
   
End Sub
Public Sub SetDoctor_ID(val As String)
    vDoctor_ID = val
End Sub
Public Sub SetFull_Name(val As String)
    vFull_Name = val
End Sub

Private Sub cmdDelete_All_Doctors_Click()
    msg = MsgBox("Â· √‰  „ √ﬂœ „‰ «·Õ–›ø", vbCritical + vbYesNo, " √ﬂÌœ «·Õ–›")
    If msg <> vbYes Then Exit Sub
    Delete_All_Doctors
End Sub

Private Sub cmdDelete_Doctor_Click()
    Dim msg As VbMsgBoxResult
    
    msg = MsgBox("Â· √‰  „ √ﬂœ „‰ «·Õ–›ø", vbCritical + vbYesNo, " √ﬂÌœ «·Õ–›")
    If msg <> vbYes Then Exit Sub
    
    If lstRecipeints.ListCount = 0 Then Exit Sub
    lstRecipeints.SetFocus
    lstRecipeints.RemoveItem lstRecipeints.ListIndex
    List_Changed = True
    If lstRecipeints.ListCount <> 0 Then lstRecipeints.ListIndex = lstRecipeints.ListCount - 1
End Sub

Private Sub cmdFemales_Click()
    Add_Doctors_To_List " Gender = 0 "
End Sub

Private Sub cmdHayaa_Click()
    Add_Doctors_To_List " isCouncil_Member = 1  and Council_Position = 5"
End Sub

Private Sub cmdHezb_Members_Click()
    Add_Doctors_To_List " dbo.sf_IsBaathy(Doctor_ID) = 1"
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
    oldScaleWidth = 9720
    FormSettings = btall - btPrint
    btnSettings = btall - btCancel - btsave - btSearchCancel - btSearchExec
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
    Dim cancel As Boolean
    Set master.rs = ExecuteSelect(Conn, "select * from Tabib_Send", cancel)
    InitFrame
    Set ActiveFrame = masterFrame
    List_Changed = False
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
    Dim i As Integer
    Dim W As Long
    Dim totWidth As Long
    totWidth = 0
'    For i = 0 To fg.Cols - 1
'        totWidth = totWidth + fg.ColWidth(i)
'    Next
'    For i = 0 To fg.Cols - 1
'        fg.ColWidth(i) = (fg.Width - 400) * fg.ColWidth(i) / totWidth
'    Next
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub



Private Sub master_doAddNew(rs As ADODB.Recordset)
    Enable_List_Buttons True
    lstRecipeints.Clear
    dtMessage_Date.Value = True
    dtMessage_Date.Value = Date
End Sub

Private Sub master_doBeginSearch(rs As ADODB.Recordset)
    Enable_List_Buttons False
    lstRecipeints.visible = False
    lblRecipients.visible = False
End Sub

Private Sub master_doCancelSearch(rs As ADODB.Recordset)
    lblRecipients.visible = True
    lstRecipeints.visible = True
    Enable_List_Buttons True
End Sub



Private Sub master_doMoveComplete(rs As ADODB.Recordset)
    If Not (rs.EOF Or rs.BOF) Then
        Dim rsRecepients As New ADODB.Recordset
        Dim cancel As Boolean
        Dim sql As String
        
        sql = " Select First_Name + ' ' + Last_Name as Full_Name,B.Doctor_ID " & _
              " from Doctor_Cv A,Recipients_Groups B " & _
              " Where A.Doctor_ID = B.Doctor_ID and Tabib_Send_ID = " & rs.Fields("Tabib_Send_ID").Value & _
              " Order by 1"
              
        Set rsRecepients = ExecuteSelect(Conn, sql, cancel)
                
        With rsRecepients
            lstRecipeints.Clear
            Do While Not .EOF
                lstRecipeints.AddItem rsRecepients.Fields("Full_Name").Value
                lstRecipeints.ItemData(lstRecipeints.NewIndex) = rsRecepients.Fields("Doctor_ID").Value
                lstRecipeints.ListIndex = lstRecipeints.NewIndex
                .MoveNext
            Loop
            
        End With
        
        Set rsRecepients = Nothing
    End If
End Sub

Private Sub master_doSave(rs As ADODB.Recordset, cancel As Boolean)
    If lstRecipeints.ListCount = 0 Then
        cancel = True
        MsgBox "ÌÃ» ≈÷«›… «”„ ÿ»Ì» ⁄·Ï «·√ﬁ· ≈·Ï ﬁ«∆„… «·„—”· ≈·ÌÂ„", vbCritical + vbOKOnly, "⁄„·Ì… „—›Ê÷…"
    End If
End Sub

Private Sub master_doSaveComplete(rs As ADODB.Recordset)
    
    txtTabib_Send_ID.text = rs.Fields(0).Value
    
    Enable_List_Buttons False
    
    If List_Changed Then
        Dim cancel As Boolean
        Dim sql As String
        List_Changed = False
        If Not (rs.EOF Or rs.BOF) Then
            ExecuteCommand Conn, "Delete Recipients_Groups where Tabib_Send_ID = " & rs.Fields("Tabib_Send_ID").Value, cancel
            For i = 0 To lstRecipeints.ListCount - 1
                sql = "Insert Into Recipients_Groups(Tabib_Send_ID,Doctor_Id) values (" & rs.Fields("Tabib_Send_ID").Value _
                        & "," & _
                        lstRecipeints.ItemData(i) & ")"
                
                ExecuteCommand Conn, sql, cancel
            Next i
        End If
    End If
    
End Sub

Private Sub master_doSearch(rs As ADODB.Recordset, S As String, DefaultType As Integer)
    lblRecipients.visible = False
    lstRecipeints.visible = False
    
End Sub

Private Sub master_doSearchComplete(rs As ADODB.Recordset)
    lblRecipients.visible = True
    lstRecipeints.visible = True
    Enable_List_Buttons True
End Sub

Private Sub master_doUpdate(rs As ADODB.Recordset)
    Enable_List_Buttons True
End Sub
Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub txtTabib_Send_ID_KeyPress(KeyAscii As Integer)
      If master.state <> ST_SEARCH Then
        KeyAscii = 0
    Else
        If Chr(KeyAscii) Like "[!0-9]" Then
            KeyAscii = 0
        End If
    End If
End Sub
