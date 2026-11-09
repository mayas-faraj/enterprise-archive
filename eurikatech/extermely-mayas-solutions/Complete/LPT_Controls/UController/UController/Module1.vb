Module Def
    Public Declare Auto Function Inp Lib "inpout32.dll" Alias "Inp32" (ByVal PortAddress As Int16) As Int16
    Public Declare Auto Sub Out Lib "inpout32.dll" Alias "Out32" (ByVal PortAddress As Int16, ByVal Value As Int16)
End Module
