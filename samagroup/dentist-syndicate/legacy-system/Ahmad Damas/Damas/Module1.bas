Attribute VB_Name = "Module1"
Option Explicit
Global ggNumFile
Global ggFreeFile
Global ggLenFile
Global ggEnter As ss
Global ggConect As Enter
Global ggAddPic As Integer
Global ggUserName As String
Global ggAccNum As Long

Type ss
    ggServer1 As String
    ggDb1 As String
    ggUser1 As String
    ggPas1 As String
End Type

Type Enter
    ggServer(2) As Variant
    ggDb(2) As Variant
    ggUser(2) As Variant
    ggPas(2) As Variant
End Type

Global ggClintId As Long
Global ggDate As Date
Global ggAge As Integer
Global ggTypeConect As Integer
Global ggNumTeeth As Integer
Global ggPriceCat As Integer


Public Sub LoafFile()
ggLenFile = Len(ggConect)
ggFreeFile = FreeFile
Open App.Path & "\Enter217.HA" For Random As ggFreeFile Len = ggLenFile
Get #ggFreeFile, 1, ggConect
End Sub

Public Sub ResetPic()
'Unload FormClintPic
'Load FormClintPic
'FormClintPic.Show
End Sub
