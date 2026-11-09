Option Strict Off
Option Explicit On
Module InpOut32_Declarations
	
	'Inp and Out declarations for port I/O using inpout32.dll.
	
	Public Declare Function Inp Lib "inpout32.dll"  Alias "Inp32"(ByVal PortAddress As Short) As Short
	
	Public Declare Sub Out Lib "inpout32.dll"  Alias "Out32"(ByVal PortAddress As Short, ByVal Value As Short)
End Module