VERSION 5.00
Begin VB.Form frmOpenClosedRibas 
   BackColor       =   &H80000018&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "› Õ «·√—»«⁄ Ê «·Õ’…"
   ClientHeight    =   2325
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2325
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "≈€·«ﬁ"
      Height          =   375
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "„Ê«›ﬁ"
      Height          =   375
      Left            =   3240
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1680
      Width           =   1215
   End
   Begin VB.ComboBox cmbRibas 
      Height          =   360
      ItemData        =   "frmOpenClosedRibas.frx":0000
      Left            =   120
      List            =   "frmOpenClosedRibas.frx":0002
      RightToLeft     =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   247
      Width           =   2055
   End
   Begin VB.OptionButton opt 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000018&
      Caption         =   "«· —«Ã⁄ ⁄‰ ≈ﬁ›«· «·Õ’… «·”‰ÊÌ…"
      Height          =   375
      Index           =   1
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   960
      Width           =   4335
   End
   Begin VB.OptionButton opt 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000018&
      Caption         =   "«· —«Ã⁄ ⁄‰ ≈ﬁ›«· «·—»⁄"
      Height          =   375
      Index           =   0
      Left            =   2160
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   2295
   End
End
Attribute VB_Name = "frmOpenClosedRibas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub
Sub fillCmbRibas()
    Dim sql As String
    Dim cancel As Boolean
    Dim rs As New ADODB.Recordset
    
    sql = " select sanad as id," & _
          " case ribano when 1 then '«·√Ê·' when 10 then '«·À«‰Ì' when 100 then '«·À«·À' when 1000 then '«·—«»⁄' end" & _
          " as name from acc_riba order by ribano"
    fillCmb cmbRibas, sql
    opt(0).Enabled = cmbRibas.ListCount > 0
    
'    sql = "Select count(*) from acc_sanad where type = 6"
'
'    Set rs = ExecuteSelect(Conn, sql, cancel)
'
'    If Not cancel Then
'        opt(1).Enabled = rs.Fields(0).Value = 1
'    Else
'        opt(1).Enabled = False
'    End If
    ''''''''''''''
    Dim RsSettings As ADODB.Recordset
    Set RsSettings = ExecuteSelect(Conn, "select settings from State_Settings", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
        Exit Sub
    End If
    Dim sett As String
    sett = RsSettings.Fields(0).Value
    If InStr(sett, "IsHissaSanawiaClosed=") > 0 Then
        Dim bool As String
        bool = Mid(sett, InStr(sett, "IsHissaSanawiaClosed=") + 21, 1) ' get the value of the IsHissaSanawiaClosed parameter
        If bool = "1" Then opt(1).Enabled = True
    End If
    '''''''''''''''''
    cmdOK.Enabled = opt(0).Enabled Or opt(1).Enabled
End Sub
Private Sub cmdOK_Click()
     On Error GoTo ErrHandling
    Dim cancel As Boolean
    Dim msg As VbMsgBoxResult
    msg = MsgBox("Â· √‰  „ √ﬂœø", vbYesNo + vbQuestion, "”ƒ«·")
    If msg <> vbYes Then Exit Sub
    If opt(0).Value Then ' ≈ﬁ›«· «·—»⁄ «·–Ì «Œ —‰«Â
        If opt(1).Enabled = True Then
            MsgBox "ÌÃ» ⁄·Ìﬂ «· —«Ã⁄ ⁄‰ ≈ﬁ›«· «·Õ’… «·”‰ÊÌ… √Ê·«", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
            Exit Sub
        End If
        If cmbRibas.ListIndex <> cmbRibas.ListCount - 1 Then
            MsgBox "·« Ì„ﬂ‰ﬂ ≈ﬁ›«· Â–« «·—»⁄ ·√‰ Â‰«ﬂ √—»«⁄ √Œ—Ï „ﬁ›·… »⁄œÂ", vbCritical + vbOKOnly, "⁄„·Ì… „„‰Ê⁄…"
            Exit Sub
        End If
        Conn.BeginTrans
        MousePointer = vbHourglass
        ExecuteCommand Conn, "Delete from acc_sanad where id = " & cmbRibas.ItemData(cmbRibas.ListIndex), cancel
        If cancel = True Then GoTo ErrHandling
        ExecuteCommand Conn, "Delete from acc_sanadTmp where id = " & cmbRibas.ItemData(cmbRibas.ListIndex), cancel
        If cancel = True Then GoTo ErrHandling
        ExecuteCommand Conn, "Delete from acc_riba where sanad = " & cmbRibas.ItemData(cmbRibas.ListIndex), cancel
        If cancel = True Then GoTo ErrHandling
        ExecuteCommand Conn, "EXEC sp_UndoCloseRibaOrHissa " & cmbRibas.ListIndex + 1, cancel
        If cancel = True Then GoTo ErrHandling
        MousePointer = vbDefault
        Conn.CommitTrans
        MsgBox " „  ⁄„·Ì… «· —«Ã⁄ ⁄‰ ≈ﬁ›«· «·—»⁄ " & cmbRibas.text & " »‰Ã«Õ", vbInformation + vbOKOnly, "‰Ã«Õ «·⁄„·Ì…"
        fillCmbRibas
    Else ' «· —«Ã⁄ ⁄‰ ≈ﬁ›«· «·Õ’… ≈–« ﬂ«‰  „ﬁ›·… √’·«
        If opt(1).Enabled And opt(1).Value Then
          Conn.BeginTrans
          MousePointer = vbHourglass
          ExecuteCommand Conn, "Delete from acc_sanad where type = 6", cancel
          If cancel = True Then GoTo ErrHandling
          ExecuteCommand Conn, "Delete from acc_sanadTmp where type = 6", cancel
          If cancel = True Then GoTo ErrHandling
          '<Ashraf>
          Dim RsSettings As ADODB.Recordset
          Set RsSettings = ExecuteSelect(Conn, "select settings from State_Settings", cancel)
          If cancel Then
                MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
              Exit Sub
          End If
          Dim sett As String
          sett = RsSettings.Fields(0).Value
          Dim NewSett As String
          NewSett = Left(sett, InStr(sett, "IsHissaSanawiaClosed=") - 1) & "IsHissaSanawiaClosed=" & "0" & Mid(sett, InStr(sett, "IsHissaSanawiaClosed=") + 22)
          ExecuteCommand Conn, "update state_settings set settings='" & NewSett & "' where state_id=(select top 1 id from Active_State)", cancel ': the HissaSanawia is Open
          If cancel = True Then GoTo ErrHandling
          ExecuteCommand Conn, "EXEC sp_UndoCloseRibaOrHissa 5", cancel
          If cancel = True Then GoTo ErrHandling
          '</Ashraf>
           MousePointer = vbDefault
           Conn.CommitTrans
           MsgBox " „  ⁄„·Ì… «· —«Ã⁄ ⁄‰ ≈ﬁ›«· «·Õ’… «·”‰ÊÌ… »‰Ã«Õ", vbInformation + vbOKOnly, "‰Ã«Õ «·⁄„·Ì…"
           opt(1).Enabled = False
           fillCmbRibas
         End If
    End If
    Exit Sub
    
ErrHandling:
    Conn.RollbackTrans
    MsgBox "Õ’· Œÿ√ √À‰«¡  ‰›Ì– «·⁄„·Ì… Ê ”Ê› Ì „ «· —«Ã⁄ ⁄‰ «· ⁄œÌ·«  «·„Ã—«… ﬂ«„·…", vbCritical + vbOKOnly, "Œÿ√"
    MousePointer = vbDefault
End Sub

Private Sub Form_Load()

    Dim sql As String
    Dim cancel As Boolean
    Dim rs As New ADODB.Recordset
    fillCmbRibas
    '<MohMas  «·≈Œ »«— Â· «·Õ’… «·”‰ÊÌ… „ﬁ›·… ·ﬂÌ Ì „  ›⁄Ì· ⁄„·Ì… «· —«Ã⁄ ⁄‰ ≈ﬁ›«·Â«
     Dim RsSettings As ADODB.Recordset
    Set RsSettings = ExecuteSelect(Conn, "select settings from State_Settings", cancel)
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄"
        Exit Sub
    End If
    Dim sett As String
    sett = RsSettings.Fields(0).Value
    Dim bool As String
        bool = Mid(sett, InStr(sett, "IsHissaSanawiaClosed=") + 21, 1) ' get the value of the IsHissaSanawiaClosed parameter
        If bool = "1" Then
            opt(1).Enabled = True
        Else
          If bool = "0" Then
             opt(1).Enabled = False
          End If
        End If
    '<MohMas
    
    
End Sub
