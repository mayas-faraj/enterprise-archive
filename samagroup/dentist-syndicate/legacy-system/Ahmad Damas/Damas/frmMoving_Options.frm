VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmMoving_Options 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2175
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   7665
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2175
   ScaleWidth      =   7665
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   540
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   1575
      Width           =   1905
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "»œ¡  —ÕÌ· «·ﬂ‘›"
      Height          =   375
      Left            =   5130
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1620
      Width           =   1905
   End
   Begin VB.TextBox txtAsking_No 
      Alignment       =   1  'Right Justify
      Height          =   375
      Left            =   4350
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   315
      Width           =   1995
   End
   Begin MSComCtl2.DTPicker dtAsking_Date 
      Height          =   375
      Left            =   360
      TabIndex        =   5
      Top             =   315
      Width           =   1995
      _ExtentX        =   3519
      _ExtentY        =   661
      _Version        =   393216
      CustomFormat    =   "dd/MM/yyyy"
      Format          =   57081859
      CurrentDate     =   40139
   End
   Begin VB.Shape Shape1 
      BorderWidth     =   2
      Height          =   2175
      Left            =   0
      Top             =   0
      Width           =   7665
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "—ﬁ„ «·„ÿ«·»…"
      Height          =   240
      Left            =   6510
      TabIndex        =   2
      Top             =   382
      Width           =   870
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   " «—ÌŒ «·„ÿ«·»…"
      Height          =   240
      Left            =   2910
      TabIndex        =   1
      Top             =   382
      Width           =   1005
   End
End
Attribute VB_Name = "frmMoving_Options"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Start_Date As String
Public End_Date As String

Private Sub cmdCancel_Click()
    Unload Me
    frmOrganization_Kashef.Moving_Kahsef = False
End Sub

Private Sub cmdOK_Click()
'*************************************************************************************************
'    Dim rsKashef As New ADODB.Recordset
'    Dim Kashef_ID As Long
'    Dim Master_Inserted As Boolean
'    Dim Cancel As Boolean
'
'    Me.MousePointer = 11
''    'Insert The Master Record
'    Conn.BeginTrans
'
'    On Error GoTo ErrHandeler
'
''    Set rsKashef = ExecuteSelect(Conn, "Select * from Organization_Kashef", Cancel)
''    With rsKashef
'        .addNew
'        !Organization_ID = val(frmOrganization_Kashef.txtOrganization_ID.text)
'        !Asking_No = val(txtAsking_No.text)
'        !Asking_Date = dtAsking_Date.Value
'        !Start_Date = Start_Date
'        !End_Date = End_Date
'        If frmOrganization_Kashef.optWith_Treat.Value Then
'            !Kashef_Type = 0
'        Else
'            !Kashef_Type = 1
'        End If
'        .Update
'        Kashef_ID = rsKashef.Fields("Kashef_ID").Value
'        .Close
'    End With
'    Set rsKashef = Nothing
'
'    '**************************
'
'    'Update Related Records in Central Exam ID
'    Dim rsCentral_Exam As ADODB.Recordset
'    Dim Record_Count As Long
'
'    Set rsCentral_Exam = ExecuteSelect(Conn, frmOrganization_Kashef.Sql, Cancel)
'
'    With rsCentral_Exam
'        Record_Count = .RecordCount
'        Do While Not .EOF
'            !Moved = 1
'            !Kashef_ID = Kashef_ID
'            .Update
'            .MoveNext
'        Loop
'    End With
'
'    Conn.CommitTrans
'
'    frmOrganization_Kashef.Asking_No = txtAsking_No.text
'    frmOrganization_Kashef.Asking_Date = str(dtAsking_Date.Value)
'*************************************************************************************************
    Dim sql As String
    Dim Kashef_Type As Integer
    Dim Organization_Id As Long
    Dim cancel As Boolean
    Dim Moving_Date As String
    
    If Not IsNumeric(txtAsking_No.text) Then
        MsgBox "ÌÃ» ≈œŒ«· —ﬁ„ „ÿ«·»… ’ÕÌÕ ﬁ»· «· —ÕÌ·"
        Exit Sub
    End If
    
    
'    Dim rs As ADODB.Recordset
'
'    Set rs = ExecuteSelect(Conn, "Select  isNull(Max(Asking_No),0) + 1 as Asking_No From Organization_Kashef ", Cancel)
'
'    txtAsking_No.text = rs!Asking_No
    
    Set rs = ExecuteSelect(Conn, "Set dateformat DMY Select GetDate()", cancel)
    
    Moving_Date = format(rs.Fields(0).Value, "dd/mm/yyyy")
    
    MousePointer = vbHourglass
    
    Organization_Id = val(frmOrganization_Kashef.txtOrganization_ID.text)
    
    If frmOrganization_Kashef.optWith_Treat.Value Then
        Kashef_Type = 0
    Else
        Kashef_Type = 1
    End If
    
    sql = "Set DateFormat DMY" & vbTab & _
          " DECLARE @Kashef_Type smallint" & vbTab & _
          " DECLARE @Start_Date datetime" & vbTab & _
          " DECLARE @End_Date datetime" & vbTab & _
          " DECLARE @Moving_Date datetime" & vbTab & _
          " DECLARE @Organization_ID numeric(18,0)" & vbTab & _
          " DECLARE @Asking_No numeric(18,0)" & vbTab & _
          " DECLARE @Asking_Date datetime" & vbTab & _
          " set @Kashef_Type        = " & Kashef_Type & vbTab & _
          " set @Moving_Date        = '" & Moving_Date & "'" & vbTab & _
          " set @Start_Date         = '" & Start_Date & "'" & vbTab & _
          " set @End_Date           = '" & End_Date & "'" & vbTab & _
          " set @Organization_ID    = " & Organization_Id & vbTab & _
          " set @Asking_No          = " & val(txtAsking_No.text) & vbTab & _
          " set @Asking_Date        = '" & dtAsking_Date.Value & "'" & vbTab & _
          " EXEC [NewDocDb].[dbo].[sp_Organization_Kashef_Moving] @Kashef_Type, @Start_Date, @End_Date, @Organization_ID, @Asking_No, @Asking_Date,@Moving_Date"
    
    ExecuteCommand Conn, sql, cancel
    
    If cancel Then GoTo ErrHandeler
    
    MsgBox " „  ⁄„·Ì…  —ÕÌ· «·ﬂ‘› »‰Ã«Õ", vbInformation + vbOKOnly, " —ÕÌ·"
    Unload Me
    frmOrganization_Kashef.Moving_Kahsef = True
    MousePointer = 0
    Exit Sub
    
ErrHandeler:
    frmOrganization_Kashef.Moving_Kahsef = False
    Debug.Print Err.description
    MsgBox "ÕœÀ Œÿ√√À‰«¡ ⁄„·Ì… «· —ÕÌ· ° ”Ê› Ì „ «· —«Ã⁄ ⁄‰ Ã„Ì⁄ «·”Ã·«  «·„—Õ·… Œ·«· Â–Â «·⁄„·Ì…", vbCritical + vbOKOnly, "Œÿ√"
    Me.MousePointer = 0
    
End Sub

Private Sub Form_Activate()
    ActiveDatabaseName = "Default"
End Sub

Private Sub Form_Load()

    Dim cancel As Boolean
    Dim rs As ADODB.Recordset
    
    Set rs = ExecuteSelect(Conn, "Select  isNull(Max(Asking_No),0) + 1 as Asking_No From Organization_Kashef ", cancel)
    
    txtAsking_No.text = rs!Asking_No
   dtAsking_Date.Value = DateTime.Date
    
    
End Sub

Private Sub txtAsking_No_KeyPress(KeyAscii As Integer)
    KeyAscii = Prevent_char(KeyAscii)
End Sub
