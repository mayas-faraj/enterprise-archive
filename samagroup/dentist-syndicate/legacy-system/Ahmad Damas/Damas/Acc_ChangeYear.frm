VERSION 5.00
Begin VB.Form Acc_ChangeYear 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " €ÌÌ— «·”‰… «·„«·Ì… "
   ClientHeight    =   2730
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6210
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2730
   ScaleWidth      =   6210
   StartUpPosition =   1  'CenterOwner
   Begin VB.ComboBox cmbYear 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "Acc_ChangeYear.frx":0000
      Left            =   1065
      List            =   "Acc_ChangeYear.frx":0002
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   720
      Width           =   2655
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   4440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton CCancel 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   360
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2040
      Width           =   1455
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«Œ — «·”‰… «·„«·Ì…"
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
      Left            =   3945
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   780
      Width           =   1200
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   3
      Left            =   0
      Top             =   2610
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   135
      Index           =   2
      Left            =   0
      Top             =   0
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2805
      Index           =   0
      Left            =   6120
      Top             =   0
      Width           =   135
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00970004&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   2800
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   135
   End
End
Attribute VB_Name = "Acc_ChangeYear"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' This variable takes its value during loading this form
' And its value will be passed to the global variable ActiveDatabaseName
' every time this form is Activated
Private currentDatabaseName As String
Dim Default_Year As String
Private Sub CCancel_Click()
Unload Me
End Sub

Private Sub COk_Click()
    Dim AccountYear As String
    Dim msg As VbMsgBoxResult
    
    If cmbYear.text <> Default_Year Then
        msg = MsgBox("≈‰  €ÌÌ— «·”‰… «·„«·Ì… ”Ì‰ Ã ⁄‰Â ≈€·«ﬁ Ã„Ì⁄ «·‘«‘«  «·Ã“∆Ì… «·„› ÊÕ… ›Ì «·»—‰«„Ã ° Â· √‰  „ √ﬂœ „‰ «·„ «»⁄…ø", vbQuestion + vbYesNoCancel + vbMsgBoxRtlReading + vbMsgBoxRight, "”ƒ«·")
        If msg <> vbYes Then Exit Sub
        Do While Not MDIMain.ActiveForm Is Nothing
            Unload MDIMain.ActiveForm
        Loop
    End If
    Dim AccDBYear As String
    Acc_DBYear = cmbYear.ItemData(cmbYear.ListIndex)
    If Acc_DBYear = "0" Then
        Acc_DBYear = ""
    End If
    
    AccountYear = Acc_DBYear
    
    '<AHMAD>
        Select Case UCase(ActiveDatabaseName)
        Case "DEFAULT"
            Acc_DBYearSysTem = Acc_DBYear
        Case "STOCK"
            Acc_DBYearS = Acc_DBYear
        Case "FARI"
            Acc_DBYearM = Acc_DBYear
        Case "TADAMONFARI"
            Acc_DBYearT = Acc_DBYear
        Case "TAWAR2"
            Acc_DBYearK = Acc_DBYear
        End Select
    '</AHMAD>
    
    
    
    ActiveDatabaseName = "Stock"
    connStock.Close
    OpenConnection connStock
    ActiveDatabaseName = "fari"
    connFari.Close
    OpenConnection connFari
    ActiveDatabaseName = "tadamonfari"
    connTadamonFari.Close
    OpenConnection connTadamonFari
    ActiveDatabaseName = "tawar2"
    connTawar2.Close
    OpenConnection connTawar2
    ActiveDatabaseName = ""
    connDefault.Close
    OpenConnection connDefault
'    Debug.Print Acc_DBYear

    Acc_DBYear = AccountYear
    
    MDIMain.mnuBrowseOrgVouchers.Enabled = Acc_DBYearSysTem = ""
    Unload Me
End Sub

Private Sub Form_Load()
    ' Memorizing the current value of ActiveDatabaseName
    currentDatabaseName = ActiveDatabaseName
    SetCaption Me
    Dim Conn As New ADODB.Connection
    OpenConnection Conn
    Dim rs As ADODB.Recordset
    Dim cancel As Boolean
    Set rs = ExecuteSelect(Conn, "select name from dbo.sysobjects where name like 'Acc_Accounts%' and type='U' order by name", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ ›Ì «·—»ÿ „⁄ ﬁ«⁄œ… «·»Ì«‰« °  «·—Ã«¡ «·„Õ«Ê·… „‰ ÃœÌœ"
        Exit Sub
    End If
    rs.MoveFirst
    Debug.Print rs.RecordCount
    FillComboData rs
    cmbYear.ListIndex = 0
    Default_Year = cmbYear.text
End Sub

Private Sub FillComboData(rs As ADODB.Recordset)
    'rs.MoveFirst
    Dim i As Integer
    Dim val As Integer
    Dim S As String
    i = 0
    Do While (Not rs.EOF)
        S = trimName(rs!name)
        val = CInt(GetDoubleValue(S))
        cmbYear.AddItem S, i
        cmbYear.ItemData(i) = val
        rs.MoveNext
        i = i + 1
    Loop
End Sub
Private Function trimName(name As String) As String
    Dim S As String
    S = Mid$(name, 13)
    If S = "" Then
        S = "«·”‰… «·„«·Ì… «·Õ«·Ì…"
    End If
    trimName = S
End Function
