'# MWS Version: Version 2014.0 - Feb 24 2014 - ACIS 23.0.0 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.0 fmax = 1
'# created = '[VERSION]2014.0|23.0.0|20140224[/VERSION]


'@ use template: Antenna_Dipole

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
With MeshSettings
     .SetMeshType "Srf"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "Surface"
End With
'set the solver type
ChangeSolverType("HF IntegralEq")

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

'@ define cylinder: component1:cylinder1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "cylinder1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "G/2", "L/2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:cylinder2

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "cylinder2" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "-L/2", "-G/2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ rename block: component1:cylinder1 to: component1:dip_branch_1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Rename "component1:cylinder1", "dip_branch_1"

'@ rename block: component1:cylinder2 to: component1:dip_branch_2

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Rename "component1:cylinder2", "dip_branch_2"

'@ define cylinder: component1:gap

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Cylinder 
     .Reset 
     .Name "gap" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "R" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "-G/2", "G/2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ clear picks

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "1", "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "2", "2"

'@ define discrete face port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "feed" 
     .Impedance "73" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0.5696056702", "0", "-1.4240141755" 
     .SetP2 "True", "0.5696056702", "0", "1.4240141755" 
     .LocalCoordinates "True" 
     .InvertDirection "False" 
     .CenterEdge "True" 
     .Monitor "True" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create 
End With

'@ define monitor: surface-current (f=0.5)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "surface-current (f=0.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Surfacecurrent" 
     .Frequency "0.5" 
     .Create 
End With

'@ define farfield monitor: farfield (f=0.5)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=0.5)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .Frequency "0.5" 
     .UseSubvolume "False" 
     .ExportFarfieldSource "False" 
     .SetSubvolume  "-0.5696056702",  "0.5696056702",  "-0.5696056702",  "0.5696056702",  "-142.40141755",  "142.40141755" 
     .Create 
End With

'@ define frequency range

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solver.FrequencyRange "0.0", "1"

'@ change solver and mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
ChangeSolverAndMeshType "HF Time Domain"

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
     .NormingImpedance "73"
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

'@ delete monitor: surface-current (f=0.5)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Monitor.Delete "surface-current (f=0.5)"

'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ define boundaries

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Boundary
     .Xmin "expanded open" 
     .Xmax "expanded open" 
     .Ymin "expanded open" 
     .Ymax "expanded open" 
     .Zmin "expanded open" 
     .Zmax "expanded open" 
     .Xsymmetry "electric" 
     .Ysymmetry "electric" 
     .Zsymmetry "none" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "adiabatic" 
     .YsymmetryThermal "adiabatic" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ define boundaries

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
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
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "none" 
     .YsymmetryThermal "none" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ delete shape: component1:gap

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Delete "component1:gap"

'@ define brick: component1:gap

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "gap" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "0" 
     .Yrange "-R/2", "R/2" 
     .Zrange "-G/2", "G/2" 
     .Create
End With

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "1", "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "3", "3"

'@ define discrete face port: 2

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "2" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "73" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0", "0", "-1.4240141755" 
     .SetP2 "True", "0", "0", "1.4240141755" 
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

'@ delete port: port1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Delete "1"

'@ rename port: 2 to: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Rename "2", "1" 
Port.RenameLabel "1", "feed"

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
     .SetFrequency "-1" 
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

'@ define monitor: h-field (f=0.5)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=0.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "0.5" 
     .UseSubvolume "False" 
     .SetSubvolume  "-150.4658346702",  "150.4658346702",  "-150.4658346702",  "150.4658346702",  "-292.29764655",  "292.29764655" 
     .Create 
End With

'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ delete port: port1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Delete "1"

'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:gap", "1"

'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:gap", "2"

'@ define discrete port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "73" 
     .VoltagePortImpedance "0.0" 
     .Voltage "1.0" 
     .Current "1.0" 
     .SetP1 "False", "-R/100", "0.0", "0.0" 
     .SetP2 "False", "R/100", "0.0", "0.0" 
     .InvertDirection "False" 
     .LocalCoordinates "True" 
     .Monitor "True" 
     .Radius "0.0" 
     .Wire "" 
     .Position "end1" 
     .Create 
End With

'@ delete port: port1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Delete "1"

'@ clear picks

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "1", "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "3", "3"

'@ define discrete face port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "73" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0.05696056702", "0", "-1.4240141755" 
     .SetP2 "True", "0.05696056702", "0", "1.4240141755" 
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

'@ delete port: port1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Delete "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "1", "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "3", "3"

'@ define discrete face port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "73" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0.05696056702", "0", "-1.4240141755" 
     .SetP2 "True", "0.05696056702", "0", "1.4240141755" 
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

'@ delete port: port1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Port.Delete "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "1", "1"

'@ pick edge

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickEdgeFromId "component1:gap", "3", "3"

'@ define discrete face port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "73" 
     .VoltagePortImpedance "0.0" 
     .VoltageAmplitude "1.0" 
     .SetP1 "True", "0", "0", "-1.4240141755" 
     .SetP2 "True", "0", "0", "1.4240141755" 
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
     .Plottype "Polar" 
     .Vary "angle2" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "0.5" 
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

'@ farfield plot options

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle2" 
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
     .SetFrequency "0.5" 
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

'@ define boundaries

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
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
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "none" 
     .YsymmetryThermal "none" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "True" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With


'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

'@ define boundaries

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
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
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "none" 
     .YsymmetryThermal "none" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With


'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.MeshType "PBA"

