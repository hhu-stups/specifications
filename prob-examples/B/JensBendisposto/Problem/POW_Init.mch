MACHINE POW_Init
SETS LabelsUniverse={a,b,c};Vertices={A1,A2}
CONSTANTS Labels
PROPERTIES Labels <: LabelsUniverse & card(Labels)<card(LabelsUniverse) & Labels /= {}
VARIABLES V,E
INVARIANT V<:Vertices & E<:Vertices*Vertices  & E /= {} &  V /= {}
INITIALISATION V,E : ( V: POW(Vertices)-{{}} & E : (POW(V*V)-{{}}) )  
/* Problem da V*V im Moment
   nicht berechnet werden kann; ProB weiss nicht ob es ein CartesianProduct oder ein Times ist ! 
Es gibt deshalb ein Problem der TypInferenz der closure für POW(V*V) */
END