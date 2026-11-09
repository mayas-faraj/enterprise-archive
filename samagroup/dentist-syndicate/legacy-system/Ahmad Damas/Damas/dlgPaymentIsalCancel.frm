VERSION 5.00
Begin VB.Form dlgPaymentIsalCancel 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "≈·€«¡ √„— «·ﬁ»÷.."
   ClientHeight    =   1860
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6660
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   1860
   ScaleWidth      =   6660
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Default         =   -1  'True
      Height          =   375
      Left            =   5100
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1440
      Width           =   1515
   End
   Begin VB.Frame frCollaborativeContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00E1FEFF&
      Caption         =   "”»» «·≈·€«¡"
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   120
      Width           =   6495
      Begin VB.TextBox txtDescription 
         Alignment       =   1  'Right Justify
         Height          =   855
         Left            =   120
         MaxLength       =   500
         MultiLine       =   -1  'True
         RightToLeft     =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   0
         Tag             =   ";search=true;"
         Top             =   240
         Width           =   6330
      End
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00E0E0E0&
      Cancel          =   -1  'True
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   3480
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1440
      Width           =   1515
   End
End
Attribute VB_Name = "dlgPaymentIsalCancel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public id As Integer

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    If Trim(txtDescription.text) = "" Then
        MsgBox "Ì—ÃÏ ≈œŒ«· ”»» ≈·€«¡ √„— «·ﬁ»÷ ·Ê ”„Õ .", vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading
        Exit Sub
    End If
    Dim c As Boolean
    ExecuteCommand Conn, "exec sp_PaymentIsalCancel " & id & ", '" & Replace(txtDescription.text, "'", "''") & "'", c
    If c Then
        MsgBox "·„  ‰ÃÕ «·⁄„·Ì….", vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading
    Else
        MsgBox "‰ÃÕ  «·⁄„·Ì….", vbOKOnly Or vbMsgBoxRight Or vbMsgBoxRtlReading
    End If
    Unload Me
End Sub

