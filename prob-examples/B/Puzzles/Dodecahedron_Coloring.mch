MACHINE Dodecahedron_Coloring
SETS
 COLORS = {red,green,blue};
 NODES={B,C,D,F,G,
	H,J,K,L,M,N,P,Q,R,S,
	T,V,W,X,Y}
DEFINITIONS
  CUSTOM_GRAPH_NODES == {node,col | node:EDGES & col=mapping(node)};
  CUSTOM_GRAPH_EDGES == {n1,n2 | n1:EDGES & n2:EDGES & n1 /= n2 & n1 /\ n2 /= {}}
CONSTANTS EDGES, mapping
PROPERTIES
 EDGES={
   /* inner */
   {B,C}, {B,G}, {B,H},
   {C,D}, {C,K}, {C,B}, /* for completeness */
   {D,C}, {D,F}, {D,M},
   {F,G}, {F,D}, {F,P},
   {G,B}, {G,F}, {G,R},
   /* center */
   {H,B}, {H,J}, {H,S},
   {J,H}, {J,K}, {J,T},
   {K,C}, {K,J}, {K,L},
   {L,K}, {L,M}, {L,V},
   {M,D}, {M,L}, {M,N},
   {N,M}, {N,P}, {N,W},
   {P,F}, {P,N}, {P,Q},
   {Q,P}, {Q,R}, {Q,X},
   {R,G}, {R,Q}, {R,S},
   {S,H}, {S,R}, {S,Y},
   /* outer */
   {T,J}, {T,V}, {T,Y},
   {V,L}, {V,T}, {V,W},
   {W,N}, {W,V}, {W,X},
   {X,Q}, {X,W}, {X,Y},
   {Y,S}, {Y,T}, {Y,X}
 } &
 card(EDGES) = 30 &
 card(NODES) = 20 &

 /* check that every node has 3 edges : */
 !(k).(k:NODES => card({e|e:EDGES & k : e})=3) &

 mapping : EDGES --> COLORS &
 /*!(k).(k:NODES => card(mapping[{e|e:EDGES & k : e}]) = 3) & */

 !(k).(k:NODES => 
  !(k1,k2).(k1 : EDGES & k : k1 & k2 : EDGES - {k1} & k : k2 => mapping(k1) /= mapping(k2))) 

/* Alternative formulation : 
 !(k).(k:NODES => 
  !(k1,k2).(k1 : EDGES & k : k1 & k2 : EDGES & k1/=k2 & k : k2 => mapping(k1) /= mapping(k2))) */

 /*card(mapping[{e|e:EDGES & k : e}]) = 3)*/

ASSERTIONS /* some assertions for checking ProB */
  #(k1,k2).(k1 : EDGES & W : k1 & k2 : EDGES - {k1} & W : k2);
  #(k1,k2).(k1 : EDGES & W : k1 & k2 : EDGES & k1/=k2 & W : k2)
END

