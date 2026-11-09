VERSION 5.00
Begin VB.Form Acc_NewDetails 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "«Œ Ì«— «·ÀÊ«» "
   ClientHeight    =   5415
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5445
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   5415
   ScaleWidth      =   5445
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtBranchFundSupport 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   25
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton btnUpdate 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Õ›Ÿ «· ⁄œÌ·"
      Height          =   375
      Left            =   3120
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   4920
      Width           =   1695
   End
   Begin VB.CommandButton btnClose 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   480
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   4920
      Width           =   1695
   End
   Begin VB.TextBox txtImportsSystem 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   14
      Top             =   3600
      Width           =   1215
   End
   Begin VB.TextBox txtCenteralSolidarity 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   3120
      Width           =   1215
   End
   Begin VB.TextBox txtSecondSolidarity 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtRetirment 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   2160
      Width           =   1215
   End
   Begin VB.TextBox txtImports 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   10
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox txtTax 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   9
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox txtDesert 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2040
      RightToLeft     =   -1  'True
      TabIndex        =   8
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "œ⁄„ ’‰œÊﬁ «·›—⁄"
      Height          =   255
      Index           =   7
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   27
      Top             =   4080
      Width           =   1335
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   26
      Top             =   4080
      Width           =   255
   End
   Begin VB.Label lblYear 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      RightToLeft     =   -1  'True
      TabIndex        =   24
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   23
      Top             =   3600
      Width           =   255
   End
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   22
      Top             =   3120
      Width           =   255
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   21
      Top             =   1200
      Width           =   255
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   20
      Top             =   1680
      Width           =   255
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   19
      Top             =   2160
      Width           =   255
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   18
      Top             =   2640
      Width           =   255
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      RightToLeft     =   -1  'True
      TabIndex        =   17
      Top             =   720
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "Õ’… «·‰Ÿ«„"
      Height          =   255
      Index           =   6
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   3600
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "’‰œÊﬁ «· ÷«„‰ «·„—ﬂ“Ì"
      Height          =   255
      Index           =   5
      Left            =   3480
      RightToLeft     =   -1  'True
      TabIndex        =   6
      Top             =   3120
      Width           =   1695
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E1FEFF&
      Caption         =   "’‰œÊﬁ «· ÷«„‰ «·›—⁄Ì"
      Height          =   255
      Index           =   4
      Left            =   3360
      RightToLeft     =   -1  'True
      TabIndex        =   5
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "Œ“«‰… «· ﬁ«⁄œ"
      Height          =   255
      Index           =   3
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   4
      Top             =   2160
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·Õ’… «·”‰ÊÌ…"
      Height          =   255
      Index           =   2
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   1680
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "÷—Ì»…"
      Height          =   255
      Index           =   1
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   2
      Top             =   1200
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00E1FEFF&
      Caption         =   "‰”»… «” Õﬁ«ﬁ «·ÿ»Ì»"
      Height          =   255
      Index           =   0
      Left            =   3600
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   720
      Width           =   1695
   End
   Begin VB.Label Label1 
      BackColor       =   &H00E1FEFF&
      Caption         =   "«·”‰… «·„«·Ì… "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3720
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "Acc_NewDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub btnClose_Click()
  Unload Me
End Sub



Private Sub btnUpdate_Click()
    Dim result As New ADODB.Recordset
    Dim cancel As Boolean
    Dim sql As String
    Dim sum As Double
    Dim yearID As Integer
    yearID = lblYear.Caption
    sql = "Select * from Acc_ConstKashef where id=" & yearID
    Set result = ExecuteSelect(Conn, sql, cancel)
    
    If Not IsNumeric(txtDesert.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· ‰”»… «” Õﬁ«ﬁ «·ÿ»Ì»"
        cancel = True
        Exit Sub
    End If
    If Not IsNumeric(txtTax.text) Then
       MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· «·÷—Ì»…"
        cancel = True
        Exit Sub
    End If
    If Not IsNumeric(txtImports.text) Then
       MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· «·Õ’… «·”‰ÊÌ…"
        cancel = True
        Exit Sub
    End If
     If Not IsNumeric(txtRetirment.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· Œ“«‰… «· ﬁ«⁄œ"
        cancel = True
        Exit Sub
    End If
     If Not IsNumeric(txtSecondSolidarity.text) Then
       MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· ’‰œÊﬁ «· ÷«„‰ «·›—⁄Ì"
        cancel = True
        Exit Sub
    End If
     If Not IsNumeric(txtCenteralSolidarity.text) Then
       MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· ’‰œÊﬁ «· ÷«„‰ «·„—ﬂ“Ì"
        cancel = True
        Exit Sub
    End If
     If Not IsNumeric(txtImportsSystem.text) Then
       MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· Õ’… «·‰Ÿ«„"
        cancel = True
        Exit Sub
    End If
     
    If Not IsNumeric(txtBranchFundSupport.text) Then
        MsgBox "ÌÃ» √‰  œŒ· √—ﬁ«„« ›ﬁÿ ›Ì Õﬁ· œ⁄„ ’‰œÊﬁ «·›—⁄"
        cancel = True
        Exit Sub
    End If
     
    result.Fields("desert_percent").Value = txtDesert.text
    result.Fields("Tax_percent").Value = txtTax.text
    result.Fields("imports_percent").Value = txtImports.text
    result.Fields("retirment").Value = txtRetirment.text
    result.Fields("SecondSolidarity").Value = txtSecondSolidarity.text
    result.Fields("CenteralSolidarity").Value = txtCenteralSolidarity.text
    result.Fields("importsSystem").Value = txtImportsSystem.text
    result.Fields("BranchFundSupport").Value = txtBranchFundSupport.text
     
      sum = val(txtDesert.text) + val(txtTax.text) + val(txtImports.text) + val(txtRetirment.text) + val(txtSecondSolidarity.text) + val(txtCenteralSolidarity.text) + val(txtImportsSystem.text) + val(txtBranchFundSupport.text)
    If sum <> 100 Then
        MsgBox " √ﬂœ „‰ „Ã„Ê⁄ «·‰”» ", vbOKOnly + vbCritical
    Exit Sub
    End If
    result.Update
    MsgBox " „ Õ›Ÿ «·ﬁÌ„ «·„œŒ·…", vbOKOnly
    If cancel Then
       MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
       Exit Sub
   End If
End Sub

Private Sub Form_Load()
    Dim result As New ADODB.Recordset
    Dim res As New ADODB.Recordset
    Dim yearID As Integer
    Dim cancel As Boolean
    Dim sql As String
    Dim sqlcommGetID As String
      
    CheckEnabled (Acc_DBYear)
   ' OpenConnection (conn)
   If Acc_DBYear = "" Then
        sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
    
    sql = "Select * from Acc_ConstKashef where id=" & yearID
   ' desert_percent, tax_percent, imports_percent ,retirment ,SecondSolidarity ,CenteralSolidarity , importsSystem ,ID
   'severance , isPersent
    Set result = ExecuteSelect(Conn, sql, cancel)
    If result.RecordCount <> 0 Then
        lblYear.Caption = result.Fields("ID").Value
        txtDesert.text = result.Fields("desert_percent").Value
        txtTax.text = result.Fields("Tax_percent").Value
        txtImports.text = result.Fields("imports_percent").Value
        txtRetirment.text = result.Fields("retirment").Value
        txtSecondSolidarity.text = result.Fields("SecondSolidarity").Value
        txtCenteralSolidarity.text = result.Fields("CenteralSolidarity").Value
        txtImportsSystem.text = result.Fields("importsSystem").Value
        txtBranchFundSupport.text = result.Fields("BranchFundSupport").Value
     Else
      MsgBox "Â–Â «·⁄„·Ì… €Ì— „ «Õ… ›Ì «·”‰… «·Õ«·Ì…"
      'Exit Sub
     End If
    If cancel Then
       MsgBox "ÕœÀ Œÿ√ √À‰«¡ «·« ’«· »ﬁ«⁄œ… «·»Ì«‰« ", vbCritical + vbOKOnly, "Œÿ√"
       Exit Sub
   End If
End Sub
Private Sub CheckEnabled(yearID As String)
  Dim res As ADODB.Recordset
  Dim checkEdit As Boolean
  Dim cancel As Boolean
  Dim comm As String
   
    If Acc_DBYear = "" Then
        sqlcommGetID = " Select max(ID) from Acc_ConstKashef "
        Set res = ExecuteSelect(Conn, sqlcommGetID, cancel)
        yearID = res.Fields(0).Value
    Else
        yearID = Acc_DBYear
    End If
    comm = "select CanEdit from Acc_ConstKashef  where id=" & yearID
    Set res = ExecuteSelect(Conn, comm, cancel)
      
    If cancel Then
        MsgBox "ÕœÀ Œÿ√ €Ì— „ Êﬁ⁄ ›Ì ﬁ«⁄œ… «·»Ì«‰« "
    Exit Sub
    Else
    If res.RecordCount <> 0 Then
      If Not res.Fields("CanEdit").Value Then
        txtDesert.Enabled = False
        txtTax.Enabled = False
        txtImports.Enabled = False
        txtRetirment.Enabled = False
        txtSecondSolidarity.Enabled = False
        txtCenteralSolidarity.Enabled = False
        txtImportsSystem.Enabled = False
        txtBranchFundSupport.Enabled = False
        btnUpdate.Enabled = False
      End If
   End If
  End If

End Sub

