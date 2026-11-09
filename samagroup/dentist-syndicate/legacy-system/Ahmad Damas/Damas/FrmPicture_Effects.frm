VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmPicture_Effects 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "„⁄«·Ã… «·’Ê—…"
   ClientHeight    =   7425
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8205
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   7425
   ScaleWidth      =   8205
   StartUpPosition =   2  'CenterScreen
   Begin MSComCtl2.FlatScrollBar HBright 
      Height          =   285
      Left            =   4545
      TabIndex        =   13
      Top             =   3690
      Width           =   3390
      _ExtentX        =   5980
      _ExtentY        =   503
      _Version        =   393216
      Arrows          =   65536
      Orientation     =   1179649
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00E1FEFF&
      Height          =   6375
      Left            =   240
      RightToLeft     =   -1  'True
      ScaleHeight     =   6315
      ScaleWidth      =   4035
      TabIndex        =   9
      Top             =   240
      Width           =   4095
      Begin VB.PictureBox PicEffect 
         AutoSize        =   -1  'True
         BackColor       =   &H00E1FEFF&
         BorderStyle     =   0  'None
         Height          =   1575
         Left            =   0
         RightToLeft     =   -1  'True
         ScaleHeight     =   1575
         ScaleWidth      =   1695
         TabIndex        =   10
         Top             =   0
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E1FEFF&
      Caption         =   "“«ÊÌ… «·œÊ—«‰"
      Height          =   2415
      Left            =   4560
      RightToLeft     =   -1  'True
      TabIndex        =   3
      Top             =   240
      Width           =   3375
      Begin VB.OptionButton O90R 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Caption         =   "90 œ—Ã… ··Ì„Ì‰"
         Height          =   375
         Left            =   480
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   360
         Width           =   2415
      End
      Begin VB.OptionButton O90L 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Caption         =   "90 œ—Ã… ··Ì”«—"
         Height          =   375
         Left            =   480
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   840
         Width           =   2415
      End
      Begin VB.OptionButton O180 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Caption         =   "180 œ—Ã…"
         Height          =   375
         Left            =   480
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   1320
         Width           =   2415
      End
      Begin VB.CommandButton COkRot 
         BackColor       =   &H00E0E0E0&
         Caption         =   "„Ê«›ﬁ"
         Height          =   375
         Left            =   2160
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   1920
         Width           =   975
      End
      Begin VB.CommandButton CCancelRot 
         BackColor       =   &H00E0E0E0&
         Caption         =   "≈·€«¡ «·√„—"
         Height          =   375
         Left            =   240
         RightToLeft     =   -1  'True
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   1920
         Width           =   975
      End
   End
   Begin VB.CommandButton COk 
      BackColor       =   &H00E0E0E0&
      Caption         =   "„Ê«›ﬁ"
      Height          =   375
      Left            =   6720
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   6600
      Width           =   1215
   End
   Begin VB.CommandButton CCancel 
      BackColor       =   &H00E0E0E0&
      Caption         =   "≈·€«¡ «·√„—"
      Height          =   375
      Left            =   4440
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   6600
      Width           =   1215
   End
   Begin VB.PictureBox PicTmp 
      Height          =   495
      Left            =   360
      RightToLeft     =   -1  'True
      ScaleHeight     =   435
      ScaleWidth      =   1155
      TabIndex        =   0
      Top             =   6705
      Visible         =   0   'False
      Width           =   1215
   End
   Begin MSComCtl2.FlatScrollBar HContrast 
      Height          =   285
      Left            =   4545
      TabIndex        =   14
      Top             =   4680
      Width           =   3390
      _ExtentX        =   5980
      _ExtentY        =   503
      _Version        =   393216
      Arrows          =   65536
      Orientation     =   1179649
   End
   Begin VB.Label LblBright 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«·≈÷«¡… : 0"
      Height          =   240
      Left            =   5400
      RightToLeft     =   -1  'True
      TabIndex        =   12
      Top             =   3285
      Width           =   1185
   End
   Begin VB.Label LblContrast 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "«· »«Ì‰ : 0"
      Height          =   195
      Left            =   5910
      RightToLeft     =   -1  'True
      TabIndex        =   11
      Top             =   4275
      Width           =   660
   End
End
Attribute VB_Name = "frmPicture_Effects"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub CCancel_Click()
Unload Me
End Sub

Private Sub CCancelRot_Click()
PicEffect.Picture = PicTmp.Picture
O90R.Enabled = False
O90L.Enabled = False
O180.Enabled = False
HBright.Enabled = True
HContrast.Enabled = True
End Sub

Private Sub COk_Click()
SavePicture PicEffect.Picture, "C:\1.bmp"
ggAddPic = 2
'If ggPicNum = 1 Then
'        FormMDocCv.SavePic
'        Unload Me
'    ElseIf ggPicNum = 2 Then
'        FormMStaffCv.SavePic
'        Unload Me
'End If
    Select Case UCase(frmImportPicture.Caller_Form)
    Case "EMPLOYEE_CV"
        frmEmployee_CV.Save_Picture
    Case "DOCTOR_CV"
        frmDoctorCV.Save_Picture
    End Select
End Sub

Private Sub COkRot_Click()
PicTmp.Picture = PicEffect.Picture
O90R.Enabled = False
O90L.Enabled = False
O180.Enabled = False
HBright.Enabled = True
HContrast.Enabled = True
End Sub

Private Sub Form_Load()
    Select Case UCase(frmImportPicture.Caller_Form)
    Case "EMPLOYEE_CV"
        PicEffect.Picture = frmEmployee_CV.ImgPicture.Picture
        PicTmp.Picture = frmEmployee_CV.ImgPicture.Picture
    Case "DOCTOR_CV"
        PicEffect.Picture = frmDoctorCV.ImgPicture.Picture
        PicTmp.Picture = frmDoctorCV.ImgPicture.Picture
    End Select
    Unload frmImportPicture
'If ggPicNum = 1 Then
'        PicEffect.Picture = FormMDocCv.IPic.Picture
'        PicTmp.Picture = FormMDocCv.IPic.Picture
'    ElseIf ggPicNum = 2 Then
'        PicEffect.Picture = FormMStaffCv.IPic.Picture
'        PicTmp.Picture = FormMStaffCv.IPic.Picture
'End If
End Sub

Private Sub HBright_Change()
LblBright.Caption = "«·≈÷«¡… : " & HBright.Value
Dim ImgX As ImgX
Set ImgX = New ImgX
ImgX.Initialize
ImgX.Import.FromPicture PicTmp.Picture
ImgX.Effects.Brightness HBright.Value, HContrast.Value
PicEffect.Picture = ImgX.Export.ToPicture
End Sub

Private Sub HContrast_Change()
LblContrast.Caption = "«· »«Ì‰ : " & HContrast.Value
Dim ImgX As ImgX
Set ImgX = New ImgX
ImgX.Initialize
ImgX.Import.FromPicture PicTmp.Picture
ImgX.Effects.Brightness HBright.Value, HContrast.Value
PicEffect.Picture = ImgX.Export.ToPicture
End Sub

Private Sub O180_Click()
Dim ImgX As ImgX
Set ImgX = New ImgX
ImgX.Initialize
ImgX.Import.FromPicture PicTmp.Picture
ImgX.Effects.Rotate 180
PicEffect.Picture = ImgX.Export.ToPicture
End Sub

Private Sub O90L_Click()
Dim ImgX As ImgX
Set ImgX = New ImgX
ImgX.Initialize
ImgX.Import.FromPicture PicTmp.Picture
ImgX.Effects.Rotate 270
PicEffect.Picture = ImgX.Export.ToPicture
End Sub

Private Sub O90R_Click()
Dim ImgX As ImgX
Set ImgX = New ImgX
ImgX.Initialize
ImgX.Import.FromPicture PicTmp.Picture
ImgX.Effects.Rotate 90
PicEffect.Picture = ImgX.Export.ToPicture
End Sub

