MACHINE Graph
 SETS LabelsUniverse;Vertices
 CONSTANTS Labels
 PROPERTIES 
    Labels <: LabelsUniverse & 
    card(Labels)<card(LabelsUniverse) & 
    Labels /= {}
    
 VARIABLES V,E,InitialLabeling,L,f,g 
 
 INVARIANT
       V<:Vertices & 
       E<:Vertices*Vertices &
       InitialLabeling:Vertices*Vertices<->Labels & 
       L:Vertices*Vertices<->LabelsUniverse &
       f:V>->> V &
       g : Labels >+> LabelsUniverse &
       
       E /= {} & /* */
       InitialLabeling /= {} & 
       V /= {} 
       
       
   
 INITIALISATION 
   V,E,InitialLabeling,L,f,g : (  V : POW1(Vertices) &
                                  E : POW1(V*V) &
                                  InitialLabeling : E<->Labels & dom(InitialLabeling)=E  & 
                                  f=id(V) & 
                                  g=id(ran(InitialLabeling)) & 
                                  L = InitialLabeling
                                )
 OPERATIONS
   renameOperation(o1,o2)=
    PRE (o1:ran(g) & o2:LabelsUniverse & o2/:ran(g))
    THEN
      L:= (InitialLabeling;(g |>> {o1} \/ {g~(o1) |-> o2})) ||
      g:= g |>> {o1} \/ {g~(o1) |-> o2}
    END
END