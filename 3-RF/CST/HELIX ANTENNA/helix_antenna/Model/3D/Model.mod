'# MWS Version: Version 2014.0 - Feb 24 2014 - ACIS 23.0.0 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.0 fmax = 0.0
'# created = '[VERSION]2014.0|23.0.0|20140224[/VERSION]


'@ activate local coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "local"


'@ set units in materials

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Material.SetUnitInMaterial "$CoilMaterial$", "Hz", "m" 


'@ define units

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Units 
     .Geometry "mm" 
     .Frequency "Hz" 
     .Time "s" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "Siemens" 
     .Capacitance "PikoF" 
     .Inductance "NanoH" 
End With 


'@ define material: Copper (annealed)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
.FrqType "static" 
.Type "Normal" 
.SetMaterialUnit "Hz", "mm" 
.Epsilon "1" 
.Mue "1.0" 
.Kappa "5.8e+007" 
.TanD "0.0" 
.TanDFreq "0.0" 
.TanDGiven "False" 
.TanDModel "ConstTanD" 
.KappaM "0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstTanD" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "1st Order" 
.DispersiveFittingSchemeMue "1st Order" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.FrqType "all" 
.Type "Lossy metal" 
.SetMaterialUnit "GHz", "mm" 
.Mue "1.0" 
.Kappa "5.8e+007" 
.Rho "8930.0" 
.ThermalType "Normal" 
.ThermalConductivity "401.0" 
.HeatCapacity "0.39" 
.MetabolicRate "0" 
.BloodFlow "0" 
.VoxelConvection "0" 
.MechanicsType "Isotropic" 
.YoungsModulus "120" 
.PoissonsRatio "0.33" 
.ThermalExpansionRate "17" 
.Colour "1", "1", "0" 
.Wireframe "False" 
.Reflection "False" 
.Allowoutline "True" 
.Transparentoutline "False" 
.Transparency "0" 
.Create
End With 


'@ new component: component1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Component.New "component1" 


'@ define brick: component1:Brick1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "Brick1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-L/2", "L/2" 
     .Yrange "-W/2", "W/2" 
     .Zrange "0", "T" 
     .Create
End With


'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:Brick1", "1" 


'@ align wcs with face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.AlignWCSWithSelected "Face"


'@ define cylinder: component1:solid1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "H" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:Brick1", "2" 


'@ define extrude: component1:Extr

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Extrude 
     .Reset 
     .Name "Extr" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Mode "Picks" 
     .Height "20" 
     .Twist "45" 
     .Taper "-20" 
     .UsePicksForHeight "False" 
     .DeleteBaseFaceSolid "False" 
     .ClearPickedFace "True" 
     .Create 
End With 


'@ rename block: component1:solid1 to: component1:Cylind

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Rename "component1:solid1", "Cylind"


'@ rename block: component1:Brick1 to: component1:Brick

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Rename "component1:Brick1", "Brick"


'@ delete shape: component1:Brick

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:Brick" 


'@ delete shape: component1:Cylind

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:Cylind" 


'@ delete shape: component1:Extr

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:Extr" 


'@ activate global coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "global"


'@ activate local coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "local"


'@ define units

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Units 
     .Geometry "mm" 
     .Frequency "GHz" 
     .Time "ns" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "Siemens" 
     .Capacitance "PikoF" 
     .Inductance "NanoH" 
End With 


'@ define cylinder: component1:Gnd

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "Gnd" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "H", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ execute macro: Construct\Coils\3D Linear Helical Spiral

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
 Dim scst_torrus_r As Double, cst_xxx As Double, scst_torrus_phi As Double, scst_torrus_h As Double
 Dim scst_torrus_N As Integer, cst_result As Integer,  sCurveName As String
 Dim cst_torrus_N As Integer, cst_torrus_phi As Double, cst_torrus_h As Double, cst_torrus_r As Double

cst_result = -1%

If (cst_result =0) Then Exit All   ' if cancel/help is clicked, exit all

	cst_torrus_N=restoredoubleparameter ("cst_torrus_N")
	cst_torrus_h=restoredoubleparameter ("cst_torrus_h")
	cst_torrus_r=restoredoubleparameter ("cst_torrus_r")
	cst_torrus_phi=restoredoubleparameter ("cst_torrus_phi")



 ' Begin construction

	On Error GoTo Curve_Exists
 	Curve.NewCurve "3D-Analytical"
 	Curve_Exists:
	On Error GoTo 0
 	sCurveName = "3dpolygon_1"
 	With    Polygon3D
  		.Reset
  		.Name sCurveName
  		.Curve "3D-Analytical"
        ' the upper limit takes the numerical inaccuracies into account. The logic of the following loop is as follows:
        ' We go complete the number of turns the user has specified. If 360 modulo cst_torrus_phi is not equal to zero
        ' (which shouldn't be the case usually) we insert the last segment only if the overlap is less than half the length
        ' of the segment.
  		For cst_xxx = 0  To    cst_torrus_N *2*Pi+(cst_torrus_phi*pi/180)/2 STEP  cst_torrus_phi*pi/180
	 		.Point cst_torrus_r*Sin(cst_xxx), cst_torrus_r*Cos(cst_xxx) , cst_torrus_h*cst_xxx/(2*pi* cst_torrus_N)
  		Next cst_xxx
  		.Create
 	End With


'@ pick end point

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickCurveEndpointFromId "3D-Analytical:3dpolygon_1", "121" 


'@ align wcs with point

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.AlignWCSWithSelected "Point" 


'@ rotate wcs

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.RotateWCS "v", "90.0" 


'@ define curve circle: 3D-Analytical:Circle

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Circle
     .Reset 
     .Name "Circle" 
     .Curve "3D-Analytical" 
     .Radius ".5" 
     .Xcenter "0.0" 
     .Ycenter "0.0" 
     .Segments "0" 
     .Create
End With


'@ define sweepprofile: component1:helix

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With SweepCurve
     .Reset 
     .Name "helix" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Twistangle "0.0" 
     .Taperangle "0.0" 
     .ProjectProfileToPathAdvanced "True" 
     .Path "3D-Analytical:3dpolygon_1" 
     .Curve "3D-Analytical:Circle" 
     .Create
End With


'@ rename block: component1:Gnd to: component1:ground_plane

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Rename "component1:Gnd", "ground_plane"


