MACHINE graph_error
/* Diese Maschine hatte zware keine Invarianten-Verletzung; war aber trotzdem
  nicht richtig; dies wurde mit dem Animator herausgefunden */
 SETS LabelsUniverse={a,b,c,d,e};Vertices={A1,A2} 
 CONSTANTS Labels
 PROPERTIES Labels <: LabelsUniverse & card(Labels)<card(LabelsUniverse) 
& Labels /= {}
 VARIABLES V,E,L,f,g
 INVARIANT
   	V<:Vertices & E<:Vertices*Vertices & 
	L:Vertices*Vertices<->LabelsUniverse &
   	E /= {} & L /= {} & V /= {} &
   	f:V>->> V &
   	g : Labels >+> LabelsUniverse
   	/* g:LabelsUniverse >->> LabelsUniverse*/
   
 INITIALISATION V,E,L,f,g : ( 	V : POW1(Vertices) & 
 							E : POW1(V*V) & 
 							L : E<->Labels & dom(L)=E  & f=id(V) & g=id(ran(L)))
 OPERATIONS
   rename(o1,o2)=
    PRE (o1:ran(L) & o2:LabelsUniverse & o2/:ran(L))
    THEN
      V:=V ||
      E:=E ||
      L:= L |>> {o1} \/ (dom(L |> {o1}) * {o2}) ||
      f:= (f; id(Vertices) <+ id(V)) ||
      g:=(g;(g <+ {o1 |-> o2}))
    END
END