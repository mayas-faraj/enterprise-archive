Structure MathBuild
    Dim Takrip As Single

    Function TakripValue(ByVal Value As Double) As Double

    End Function

    Function MathMass(ByVal Width As Double, ByVal Height As Double, ByVal Tall As Double, Optional ByVal Number As Int32 = 1, Optional ByVal Ground As Boolean = False, Optional ByVal WidthUnit As TallUnits = 0, Optional ByVal HeightUnit As TallUnits = 0, Optional ByVal TallUnit As TallUnits = 0, Optional ByVal MassUnit As TallUnits = 0) As Double
        If Not Ground Then
            Return (Width * Height * Tall * Number) / (Unt(WidthUnit) * Unt(HeightUnit) * Unt(TallUnit) * Unt(MassUnit))
        Else
            Return (Width * Height * Number) / (10 * Unt(WidthUnit) * Unt(HeightUnit))
        End If
    End Function

    Function MathIron(ByVal Mass As Double, ByVal MassUnit As TallUnits, ByVal IronUnit As WeightUnits) As Double
        Return Mass / (10 * Unt(MassUnit) * Unt(IronUnit))
    End Function

    Private Overloads Function Unt(ByVal Unit As TallUnits) As Double
        Return 10 ^ Unit
    End Function

    Private Overloads Function Unt(ByVal Unit As WeightUnits) As Double
        Return 10 ^ (Unit / 10)
    End Function

    Enum TallUnits
        TUmilli = -3
        TUCinti = -2
        TUBase = 0
        TUKillo = 3
    End Enum

    Enum WeightUnits
        WUBase = 0
        WUTon = 30
        WUGar = 17
    End Enum
End Structure


