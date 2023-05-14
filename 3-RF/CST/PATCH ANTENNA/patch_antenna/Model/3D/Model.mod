'# MWS Version: Version 2014.0 - Feb 24 2014 - ACIS 23.0.0 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.0 fmax = 2
'# created = '[VERSION]2014.0|23.0.0|20140224[/VERSION]


'@ use template: Antenna_Patch

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
' optimize mesh settings for planar structures
With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With
' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)
MeshAdaption3D.SetAdaptionStrategy "Energy"
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Tet"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "Tetrahedral"
End With
'set the solver type
ChangeSolverType("HF Frequency Domain")

'@ set workplane properties

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With WCS
     .SetWorkplaneSize "100"
     .SetWorkplaneRaster "10"
     .SetWorkplaneAutoadjust "True"
     .SetWorkplaneSnap "True"
     .SetWorkplaneSnapRaster "0.1"
     .SetWorkplaneAutosnapFactor "0.01"
     .SetWorkplaneSnapAutoadjust "True"
End With

'@ activate local coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "local"

'@ activate global coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "global"

'@ activate local coordinates

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.ActivateWCS "local"

'@ define material: FR-4 (lossy)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Material
     .Reset
     .Name "FR-4 (lossy)"
     .Folder ""
.FrqType "all" 
.Type "Normal" 
.SetMaterialUnit "GHz", "mm"
.Epsilon "4.3" 
.Mue "1.0" 
.Kappa "0.0" 
.TanD "0.025" 
.TanDFreq "10.0" 
.TanDGiven "True" 
.TanDModel "ConstTanD" 
.KappaM "0.0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstKappa" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "General 1st" 
.DispersiveFittingSchemeMue "General 1st" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.Rho "0.0" 
.ThermalType "Normal" 
.ThermalConductivity "0.3" 
.SetActiveMaterial "all" 
.Colour "0.94", "0.82", "0.76" 
.Wireframe "False" 
.Transparency "0" 
.Create
End With

'@ new component: component1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Component.New "component1"

'@ define brick: component1:substrate

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "substrate" 
     .Component "component1" 
     .Material "FR-4 (lossy)" 
     .Xrange "-W", "W" 
     .Yrange "-L", "L" 
     .Zrange "0", "h" 
     .Create
End With

'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:substrate", "2"

'@ align wcs with face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:substrate", "2"

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

'@ define extrude: component1:ground_plane

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Extrude 
     .Reset 
     .Name "ground_plane" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Mode "Picks" 
     .Height "Mt" 
     .Twist "0.0" 
     .Taper "0.0" 
     .UsePicksForHeight "False" 
     .DeleteBaseFaceSolid "False" 
     .ClearPickedFace "True" 
     .Create 
End With

'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:substrate", "1"

'@ align wcs with face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define brick: component1:patch

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "patch" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "W/2" 
     .Yrange "-L/2", "L/2" 
     .Zrange "0", "Mt" 
     .Create
End With

'@ rename block: component1:ground_plane to: component1:ground

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solid.Rename "component1:ground_plane", "ground"

'@ define material: Nickel

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Material
     .Reset
     .Name "Nickel"
     .Folder ""
.FrqType "all" 
.Type "Lossy metal" 
.SetMaterialUnit "GHz", "mm" 
.Mue "600" 
.Kappa "1.44e7" 
.Rho "8900" 
.ThermalType "Normal" 
.ThermalConductivity "91" 
.HeatCapacity "0.45" 
.MetabolicRate "0" 
.BloodFlow "0" 
.VoxelConvection "0" 
.MechanicsType "Isotropic" 
.YoungsModulus "207" 
.PoissonsRatio "0.31" 
.ThermalExpansionRate "13.1" 
.FrqType "static" 
.Type "Normal" 
.SetMaterialUnit "GHz", "mm" 
.Epsilon "1" 
.Mue "600" 
.Kappa "1.44e7" 
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
.Colour "0", "0.501961", "0.25098" 
.Wireframe "False" 
.Reflection "False" 
.Allowoutline "True" 
.Transparentoutline "False" 
.Transparency "0" 
.Create
End With

'@ define brick: component1:empty

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "empty" 
     .Component "component1" 
     .Material "Nickel" 
     .Xrange "-(Wf/2+Gpf)", "(Wf/2+Gpf)" 
     .Yrange "L/2-Fi", "L/2" 
     .Zrange "0", "Mt" 
     .Create
End With

'@ boolean subtract shapes: component1:patch, component1:empty

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Solid 
     .Version 9
     .Subtract "component1:patch", "component1:empty" 
     .Version 1
End With

'@ define brick: component1:microstrip

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Brick
     .Reset 
     .Name "microstrip" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2", "Wf/2" 
     .Yrange "L/2-Fi", "Lf+L/2-Fi" 
     .Zrange "0", "Mt" 
     .Create
End With

'@ boolean add shapes: component1:patch, component1:microstrip

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Solid 
     .Version 9
     .Add "component1:patch", "component1:microstrip" 
     .Version 1
End With

'@ pick face

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Pick.PickFaceFromId "component1:patch", "5"

'@ define port: 1

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "feed" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-4.35", "4.35" 
     .Yrange "38", "38" 
     .Zrange "4.5", "4.6" 
     .XrangeAdd "3*Wf", "3*Wf" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "h+Mt", "4*h" 
     .SingleEnded "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Solver.FrequencyRange "0.0", "2"

'@ define monitor: h-field (f=1.8)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1.8)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "1.8" 
     .UseSubvolume "False" 
     .SetSubvolume  "-125.9481145",  "125.9481145",  "-112.9481145",  "112.9481145",  "-75.0481145",  "97.5481145" 
     .Create 
End With

'@ define farfield monitor: farfield (f=1.8)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=1.8)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .Frequency "1.8" 
     .UseSubvolume "False" 
     .ExportFarfieldSource "False" 
     .SetSubvolume  "-125.9481145",  "125.9481145",  "-112.9481145",  "112.9481145",  "-75.0481145",  "97.5481145" 
     .Create 
End With

'@ change solver and mesh type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
ChangeSolverAndMeshType "HF Time Domain"

'@ change solver type

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
ChangeSolverType "HF Time Domain"

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
     .AutoNormImpedance "False"
     .NormingImpedance "50"
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

'@ define time domain solver parameters

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "True"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

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
     .SetFrequency "1.8" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "True" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
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

'@ define material: Copper (annealed)

'[VERSION]2014.0|23.0.0|20140224[/VERSION]
With Material 
     .Reset 
     .Name "Copper (annealed)"
     .Folder ""
     .FrqType "static"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .Epsilon "1"
     .Mue "1.0"
     .Sigma "5.8e+007"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "True"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMue "True"
     .ConstTanDModelOrderMue "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "1st Order"
     .DispersiveFittingSchemeMue "1st Order"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .FrqType "all"
     .Type "Lossy metal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Mue "1.0"
     .Sigma "5.8e+007"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
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

