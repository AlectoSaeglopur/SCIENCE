'# MWS Version: Version 2014.0 - Feb 24 2014 - ACIS 23.0.0 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0 fmax = 1.5
'# created = '[VERSION]2014.0|23.0.0|20140224[/VERSION]


'@ use template: Antenna_Monopole

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With

'----------------------------------------------------------------------------

Plot.DrawBox True

With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mue "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With

With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With

' switch on FD-TET setting for accurate farfields

FDSolver.ExtrudeOpenBC "True"

Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
Mesh.RatioLimit "20"
Mesh.AutomeshRefineAtPecLines "True", "10"

With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "10"
End With

With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With

With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With

PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"

With MeshSettings
     .SetMeshType "Srf"
     .Set "Version", 1
End With
IESolver.SetCFIEAlpha "1.000000"

'----------------------------------------------------------------------------

'set the frequency range
Solver.FrequencyRange "0", "1.5"

Dim sDefineAt As String
sDefineAt = "0.8"
Dim sDefineAtName As String
sDefineAtName = "0.8"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")

Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)

Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)

' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield ("& zz_name &")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .Frequency zz_val
    .ExportFarfieldSource "False"
    .Create
End With

Next

'----------------------------------------------------------------------------

With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With

With Mesh
     .MeshType "PBA"
End With

'set the solver type
ChangeSolverType("HF Time Domain")



'@ activate local coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "local"


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


'@ define cylinder: component1:cylinder

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "cylinder" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "G", "L" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ define brick: component1:ground

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "ground" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-S/2", "S/2" 
     .Yrange "-S/2", "S/2" 
     .Zrange "0", "0" 
     .Create
End With


'@ define brick: component1:gap

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "gap" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-R", "R" 
     .Yrange "0", "0" 
     .Zrange "0", "G" 
     .Create
End With


'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "2", "2" 


'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "4", "4" 


'@ define discrete face port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "37" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0", "0", "0.937" 
     .SetP2 "True", "0", "0", "0" 
     .LocalCoordinates "True" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "True" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create 
End With 


'@ define time domain solver parameters

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30.0"
     .MeshAdaption "False"
     .AutoNormImpedance "True"
     .NormingImpedance "37"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With


'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ define monitor: h-field (f=.8)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=.8)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency ".8" 
     .UseSubvolume "False" 
     .SetSubvolume  "-287.33081933333",  "287.33081933333",  "-287.33081933333",  "287.33081933333",  "-99.930819333333",  "193.63081933333" 
     .Create 
End With 


'@ define monitor: h-field (f=0.8)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=0.8)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "0.8" 
     .UseSubvolume "False" 
     .SetSubvolume  "-287.33081933333",  "287.33081933333",  "-287.33081933333",  "287.33081933333",  "-99.930819333333",  "193.63081933333" 
     .Create 
End With 


'@ delete monitor: h-field (f=.8)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Monitor.Delete "h-field (f=.8)" 


'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ delete shape: component1:cylinder

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:cylinder" 


'@ delete shape: component1:gap

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:gap" 


'@ delete shape: component1:ground

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:ground" 


'@ define cylinder: component1:cylinder

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "cylinder" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "G", "L" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ define brick: component1:ground

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "ground" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-S/2", "S/2" 
     .Yrange "-S/2", "S/2" 
     .Zrange "-G", "0" 
     .Create
End With


'@ define brick: component1:gap

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "gap" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "0" 
     .Yrange "-R", "R" 
     .Zrange "0", "G" 
     .Create
End With


'@ delete port: port1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Delete "1" 


'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "3", "3" 


'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "1", "1" 


'@ define discrete face port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "37" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0", "0", "1.6875" 
     .SetP2 "True", "0", "0", "0" 
     .LocalCoordinates "True" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "True" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create 
End With 


'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ farfield plot options

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "0.8" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAnntenaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With 


'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

