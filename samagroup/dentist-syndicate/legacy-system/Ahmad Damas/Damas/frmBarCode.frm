VERSION 5.00
Begin VB.Form frmBarCode 
   BackColor       =   &H00E1FEFF&
   Caption         =   "»«—ﬂÊœ"
   ClientHeight    =   4770
   ClientLeft      =   3030
   ClientTop       =   1740
   ClientWidth     =   11880
   Icon            =   "frmBarCode.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   4770
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.Frame masterFrame 
      BackColor       =   &H00E1FEFF&
      Caption         =   "»«—ﬂÊœ"
      Height          =   2310
      Left            =   105
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Tag             =   "master"
      Top             =   120
      Width           =   11655
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   1125
         Top             =   690
      End
      Begin VB.TextBox txtBarCode 
         Alignment       =   1  'Right Justify
         DataField       =   "num"
         Height          =   375
         Left            =   3188
         RightToLeft     =   -1  'True
         TabIndex        =   0
         Tag             =   "search=true;check=required;check=integer>0;check=custom;"
         Top             =   720
         Width           =   4815
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
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   240
         Width           =   11415
      End
      Begin VB.Label lblScreen 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   615
         Left            =   255
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   1335
         Visible         =   0   'False
         Width           =   11175
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "»«—ﬂÊœ"
         Height          =   195
         Left            =   8228
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Tag             =   "search=true;"
         Top             =   810
         Width           =   465
      End
   End
End
Attribute VB_Name = "frmBarCode"
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
Dim Message2Screen As String
Sub write_to_text_file(Barcode As String)
    Open "c:\BarCode.txt" For Output As #100
    Print #100, Barcode
    Close #100
End Sub
Function IsHoliday(pDate As Date) As Boolean
    
    Dim rs As New ADODB.Recordset
    Dim Cancel As Boolean
    Dim Sql As String
    
    IsHoliday = False
    
    Sql = "set dateformat DMY SET DATEFIRST 5 SELECT DATEPART(dw,'" & Replace(Replace(pDate, "’", "AM"), "„", "PM") & "')"
    Set rs = ExecuteSelect(Conn, Sql, Cancel)
    
    If rs.Fields(0).Value = 1 Or rs.Fields(0).Value = 2 Then
        IsHoliday = True
        Exit Function
    End If
    
    Sql = "set dateformat DMY SELECT count(*) from FixHoliday where Holiday_Date = '" & _
                                                    format(pDate, "dd/mm/yyyy") & "'"
    Set rs = ExecuteSelect(Conn, Sql, Cancel)
    
    If rs.Fields(0).Value <> 0 Then
        IsHoliday = True
        Exit Function
    End If
    
    Set rs = Nothing
    
End Function
Sub Set_Current_Time()
    Dim Cancel As Boolean
    Set rsCurrent_Time = ExecuteSelect(Conn, "Select GetDate()", Cancel)
End Sub
Function Get_Employee_Status(Employee_ID As Long) As Integer
    'This function is to determine the last status of this employee to determine the new status
    'Status is one of these
    ' 0 :œŒÊ·
    ' 1 :Œ—ÊÃ
    ' 2 :»œ¡ ≈Ã«“… ”«⁄Ì…
    ' 3 :«‰ Â«¡ ≈Ã«“… ”«⁄Ì…
    
    Dim rs As New ADODB.Recordset
    Dim Cancel As Boolean
     
    Set_Current_Time
    
    
    If IsHoliday(rsCurrent_Time.Fields(0).Value) Then
        Get_Employee_Status = -1
        Exit Function
    End If
    
    
    If rsCurrent_Time.Fields(0).Value > CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy") & " 08:00:00 PM") _
                    Or rsCurrent_Time.Fields(0).Value < CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy") & " 06:30:00 AM") Then
        Get_Employee_Status = -1
        Exit Function
    End If
    
    Set rs = ExecuteSelect(Conn, "set dateformat DMY select Process_Type from Employee_Continuance where employee_ID = " & Employee_ID & _
                        " and Process_Date = '" & CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy")) & "' order by Process_Time desc", Cancel)
    
    If rs.RecordCount = 0 Then
        Get_Employee_Status = 0
        Exit Function
    End If
    
    ' 0 :œŒÊ·
    ' 1 :Œ—ÊÃ
    ' 2 :»œ¡ ≈Ã«“… ”«⁄Ì…
    ' 3 :«‰ Â«¡ ≈Ã«“… ”«⁄Ì…
    
    Select Case rs.Fields(0).Value
    Case 0
        If rsCurrent_Time.Fields(0).Value > _
                        CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy") & " 02:20:00 PM") Then
           Get_Employee_Status = 1
        Else
           Get_Employee_Status = 2
        End If
    Case 1
        Get_Employee_Status = -1
    Case 2
        Get_Employee_Status = 3
    Case 3
        If rsCurrent_Time.Fields(0).Value > _
                        CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy") & " 02:20:00 PM") Then
           Get_Employee_Status = 1
        Else
           Get_Employee_Status = 2
        End If
    End Select
    
    
    
End Function


Private Sub Form_Activate()
    SelectFrame Me, ActiveFrame
    RefreshCommands btall
    RefreshCommands btnSettings And FormSettings
    txtBarCode.SetFocus
    ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Deactivate()
    btnSettings = GetBtnSettings
End Sub

Private Sub Form_Load()
    oldScaleWidth = 12000
    FormSettings = 0
    btnSettings = 0
    FormatForm Me
    Set master = New Controller
    Set master.Form = Me
    Set master.frame = masterFrame
    controllers.Add master, masterFrame.name
'    Dim Cancel As Boolean
'    Set master.rs = ExecuteSelect(conn, "My SQL", Cancel)
    InitFrame
    Set_Current_Time
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
        If Not TypeOf ctrl Is Timer Then
            ctrl.Left = ctrl.Left * Alpha
            ctrl.Width = ctrl.Width * Alpha
        End If
    Next
    oldScaleWidth = ScaleWidth
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set controllers = Nothing
    'master.rs.Close
    Set master = Nothing
    'MDIMain.CloseForm
    RefreshCommands 0
End Sub

Private Sub masterFrame_Click()
    SelectFrame Me, masterFrame
    Set ActiveFrame = masterFrame
End Sub

Private Sub Timer1_Timer()
    lblScreen.visible = False
    Timer1.Enabled = False
End Sub

Private Sub txtBarCode_KeyPress(KeyAscii As Integer)
    
    If KeyAscii <> 13 Then Exit Sub
  
    Dim rsEmployee As New ADODB.Recordset
    Dim rsSave_Process As New ADODB.Recordset
    Dim Employee_Status As Integer
    Dim Cancel As Boolean
    Dim rsTmp As New ADODB.Recordset
    Dim Sql As String
    
    
    write_to_text_file txtBarCode.text
    
    Sql = "  Select Employee_ID,First_Name + ' ' + Last_Name as Full_Name,Gender " & _
          "  from Employee_CV where BarCode_No = '" & Trim(txtBarCode.text) & "'"
          
    Debug.Print Sql
    
    Set rsEmployee = ExecuteSelect(Conn, Sql, Cancel)
                            
    If rsEmployee.RecordCount = 0 Then
        txtBarCode.text = ""
        Exit Sub
    End If
    
    Message2Screen = "·„   „ «·⁄„·Ì… »‰Ã«Õ ° «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
    
    Employee_Status = Get_Employee_Status(rsEmployee!Employee_ID)
    
    If Employee_Status = -1 Then
        txtBarCode.text = ""
        lblScreen.Caption = Message2Screen
        lblScreen.ForeColor = QBColor(12)
        lblScreen.visible = True
        Timer1.Enabled = True
        Exit Sub
    End If
    
    Message2Screen = "«”„ «·„ÊŸ›"
    
    If rsEmployee!Gender = 0 Then Message2Screen = Message2Screen + "…"
    
    Message2Screen = Message2Screen + " : "
    
    Message2Screen = Message2Screen + rsEmployee!Full_Name + "  ”ÃÌ· "
    
    Select Case Employee_Status
    Case 0 ' 0 :œŒÊ·
        Message2Screen = Message2Screen + "œŒÊ·"
        lblScreen.ForeColor = QBColor(9)
    Case 1 ' 1 :Œ—ÊÃ
        Message2Screen = Message2Screen + "Œ—ÊÃ"
        lblScreen.ForeColor = QBColor(12)
'    Case 2 ' 2 :»œ¡ ≈Ã«“… ”«⁄Ì…
'        Message2Screen = Message2Screen + "»œ¡ ≈Ã«“… ”«⁄Ì…"
'        lblScreen.ForeColor = QBColor(4)
'    Case 3 ' 3 :«‰ Â«¡ ≈Ã«“… ”«⁄Ì…
'        Message2Screen = Message2Screen + "«‰ Â«¡ ≈Ã«“… ”«⁄Ì…"
'        lblScreen.ForeColor = QBColor(13)
    End Select
    
    lblScreen.Caption = Message2Screen
    lblScreen.visible = True
    Timer1.Enabled = True
    
    With rsSave_Process
        .LockType = adLockOptimistic
        .CursorType = adOpenStatic
        .ActiveConnection = Conn
        .MaxRecords = 1
        .Open "Employee_Continuance"
        .addNew
        !Employee_ID = rsEmployee!Employee_ID
        !Process_Date = CDate(format(rsCurrent_Time.Fields(0).Value, "dd/mm/yyyy"))
        !Process_Time = rsCurrent_Time.Fields(0).Value
        !Process_Type = Employee_Status
        .Update
        .Close
        txtBarCode.text = ""
    End With
    
    Set rsSave_Process = Nothing
    Set rsEmployee = Nothing
                        
End Sub
