VERSION 5.00
Begin VB.Form dlgLock_Doctor_CV 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "≈ﬁ›«· «·–« Ì…"
   ClientHeight    =   3315
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7350
   Icon            =   "dlgLock_Doctor_CV.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   3315
   ScaleWidth      =   7350
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fra 
      BackColor       =   &H00E1FEFF&
      Caption         =   " ⁄œÌ·«  «·Ê÷⁄ «·—«Â‰ "
      Height          =   1815
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   120
      Width           =   7215
      Begin VB.ComboBox cmbContinus 
         ForeColor       =   &H00FF0000&
         Height          =   315
         Left            =   120
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   540
         Width           =   2055
      End
      Begin VB.ComboBox cmbNew 
         ForeColor       =   &H00FF0000&
         Height          =   315
         Left            =   3360
         RightToLeft     =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   540
         Width           =   2175
      End
      Begin VB.Label lblContinus 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00FF0000&
         Height          =   315
         Left            =   120
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   1110
         Width           =   2055
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï „” „—"
         Height          =   315
         Left            =   2400
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   1110
         Width           =   735
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ﬂ· «·√ÿ»«¡ «·–Ì‰ Ê÷⁄Â„ «·—«Â‰ ‰ﬁ·« „‰ "
         ForeColor       =   &H00FF0000&
         Height          =   315
         Left            =   3360
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1110
         Width           =   3735
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "≈·Ï „” „—"
         Height          =   315
         Left            =   2400
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   540
         Width           =   735
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "„‰ ÕœÌÀ"
         Height          =   195
         Left            =   6000
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   540
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdOk 
      BackColor       =   &H00E1FEFF&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   5160
      TabIndex        =   1
      Top             =   2760
      Width           =   1365
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00E1FEFF&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   480
      TabIndex        =   0
      Top             =   2760
      Width           =   1365
   End
   Begin VB.Label lblPayed 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "”Ê› Ì „  ⁄œÌ· Ê÷⁄ «· ”œÌœ ·Ã„Ì⁄ «·√ÿ»«¡ ≈·Ï €Ì— „”œœ Ê Õ–›  «—ÌŒ «· ”œÌœ ›Ì Õ«· ÊÃÊœÂ √Ì÷«"
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   2040
      Width           =   7215
   End
End
Attribute VB_Name = "dlgLock_Doctor_CV"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Function get_current_status_filter() As String
    Dim sql As String
    Dim Cancel As Boolean
    Dim rs As ADODB.Recordset
    
    Set rs = ExecuteSelect(Conn, "Select status_id from fixStatus Where Status_Name like '%‰ﬁ·« „‰%' or Status_Name like '%‰ﬁ·« „‰%' or Status_Name like '%„‰ﬁÊ· „‰%' order by 1", Cancel)
    If Not Cancel And rs.RecordCount <> 0 Then
        get_current_status_filter = " current_status_id in("
        Do While Not rs.EOF
            get_current_status_filter = get_current_status_filter & rs.Fields(0).Value & ","
            rs.MoveNext
        Loop
        get_current_status_filter = Left(get_current_status_filter, Len(get_current_status_filter) - 1) + ")"
    End If
    Set rs = Nothing
End Function
Private Sub cmbContinus_Click()
    lblContinus.Caption = cmbContinus.text
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
    On Error GoTo ErrHandler
    Dim msg As VbMsgBoxResult
    Dim Cancel As Boolean
    Dim sql As String
    
    msg = MsgBox("Â· √‰  „ √ﬂœ √‰ﬂ  —Ìœ ≈ﬁ›«· «·–« Ì… «·¬‰", vbQuestion + vbYesNo, " √ﬂÌœ")
    If msg = vbNo Then Exit Sub
    MousePointer = vbHourglass
    Conn.BeginTrans
        sql = " Update Doctor_CV " & _
              " Set Current_Status_ID = " & cmbContinus.ItemData(cmbContinus.ListIndex) & _
              " Where Current_Status_ID = " & cmbNew.ItemData(cmbNew.ListIndex) & _
              " or " & get_current_status_filter
              
        ExecuteCommand Conn, sql, Cancel
        
        If Cancel Then GoTo ErrHandler
        
         sql = " Update Doctor_CV " & _
              " Set Payed_Tax = 0 , Paying_Date = Null " & _
              " Where Payed_Tax = 1"
              
        ExecuteCommand Conn, sql, Cancel
        
        If Cancel Then GoTo ErrHandler
        
    Conn.CommitTrans
    MsgBox " „  «·⁄„·Ì… »‰Ã«Õ", vbInformation + vbOKOnly
    MousePointer = vbDefault
    Exit Sub
ErrHandler:
    MsgBox "Õ’· Œÿ√ €Ì— „ Êﬁ⁄ √À‰«¡ «·ﬁÌ«„ »⁄„·Ì… ≈ﬁ›«· «·–« Ì… " & Chr(10) & Chr(13) & " ”Ê› Ì „ «· —«Ã⁄ ⁄‰ Ã„Ì⁄ «·√⁄„«· «· Ì ﬁ«„  »Â« Â–Â «·⁄„·Ì…", vbCritical + vbMsgBoxRtlReading + vbMsgBoxRight, "Œÿ√"
    Conn.RollbackTrans
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Load()
    FormatForm Me
    fillCmb cmbNew, "Select Status_ID as id,Status_Name as name from fixStatus order by 1"
    fillCmb cmbContinus, "Select Status_ID as id,Status_Name as name from fixStatus order by 1"
    Dim i As Integer
    For i = 0 To cmbContinus.ListCount - 1
       If Trim(cmbContinus.List(i)) = "„” „—" Or Trim(cmbContinus.List(i)) = "„„«—”" Then
            cmbContinus.ListIndex = i
            Exit For
       End If
    Next i
End Sub
