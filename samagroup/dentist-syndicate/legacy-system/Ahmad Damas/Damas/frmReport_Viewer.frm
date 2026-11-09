VERSION 5.00
Object = "{8767A745-088E-4CA6-8594-073D6D2DE57A}#9.2#0"; "crviewer9.dll"
Begin VB.Form frmReport_Viewer 
   BackColor       =   &H00E1FEFF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   8490
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   11880
   Icon            =   "frmReport_Viewer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   8490
   ScaleWidth      =   11880
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      BackColor       =   &H00E0E0E0&
      Caption         =   "≈€·«ﬁ"
      Height          =   375
      Left            =   270
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   8010
      Width           =   1400
   End
   Begin VB.CommandButton cmdPrintSet 
      BackColor       =   &H00E0E0E0&
      Caption         =   "≈⁄œ«œ«  «·ÿ»«⁄… .."
      Height          =   375
      Left            =   1755
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   8010
      Width           =   1400
   End
   Begin CRVIEWER9LibCtl.CRViewer9 CRViewer 
      Height          =   7965
      Left            =   90
      TabIndex        =   1
      Top             =   0
      Width           =   11745
      lastProp        =   500
      _cx             =   20717
      _cy             =   14049
      DisplayGroupTree=   0   'False
      DisplayToolbar  =   -1  'True
      EnableGroupTree =   0   'False
      EnableNavigationControls=   -1  'True
      EnableStopButton=   -1  'True
      EnablePrintButton=   0   'False
      EnableZoomControl=   -1  'True
      EnableCloseButton=   -1  'True
      EnableProgressControl=   -1  'True
      EnableSearchControl=   -1  'True
      EnableRefreshButton=   0   'False
      EnableDrillDown =   -1  'True
      EnableAnimationControl=   0   'False
      EnableSelectExpertButton=   0   'False
      EnableToolbar   =   -1  'True
      DisplayBorder   =   0   'False
      DisplayTabs     =   0   'False
      DisplayBackgroundEdge=   -1  'True
      SelectionFormula=   ""
      EnablePopupMenu =   -1  'True
      EnableExportButton=   -1  'True
      EnableSearchExpertButton=   -1  'True
      EnableHelpButton=   0   'False
      LaunchHTTPHyperlinksInNewBrowser=   -1  'True
   End
End
Attribute VB_Name = "frmReport_Viewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Report As Report

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdPrintSet_Click()
    Report.PrinterSetup 0
End Sub
Private Sub CRViewer_CloseButtonClicked(UseDefault As Boolean)
    Unload Me
End Sub

Private Sub Form_Load()
   'Report.Application.SetLicenseKeycode ("AVS50-81SG00S-G61002U")
    MsgBox "form load"
    CRViewer.ReportSource = Report
    MsgBox "form load1"
    CRViewer.ViewReport
    MsgBox "form load2"
End Sub
