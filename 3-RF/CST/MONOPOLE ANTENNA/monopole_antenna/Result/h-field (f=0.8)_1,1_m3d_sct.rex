<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile creator="Modeler" version="20140129">
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="Copper (annealed)" type="FIELDFREE"/>
  </SpecialMaterials>
  <SimulationProperties excitationpower="0.5" fieldtype="H-Field (peak)" frequency="0.8000000119209" unit="A/m"/>
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <FieldFreeNodes filename="PECNodes.ffn" type="ffn"/>
  <SurfaceFieldCoefficients filename="h-field_m3d_sct.coe" type="coe"/>
  <ResultGroups num_steps="1">
    <Frame index="0">
      <FieldResultFile filename="h-field (f=0.8)_1,1.m3d" meshname="" type="m3d"/>
    </Frame>
  </ResultGroups>
  <ResultDataType complex="1" timedomain="0" vector="1"/>
  <SimulationDomain min="0 0 0" max="0 0 0"/>
  <PlotSettings Clipping="Possible" Plot="2" ignore_symmetry="0"/>
  <Source type="SOLVER"/>
  <AutoScale>
    <Histogram bins="" values=""/>
    <InitialPhase value="0"/>
  </AutoScale>
</MetaResultFile>
