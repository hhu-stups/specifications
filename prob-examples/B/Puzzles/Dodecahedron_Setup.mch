MACHINE Dodecahedron_Setup
/* Kodkod finds solution in about 0.1 secs with Symmetry and Glucose */
DEFINITIONS
      SET_PREF_KODKOD == TRUE;
      SET_PREF_KODKOD_SYMMETRY == 20;
      SET_PREF_KODKOD_MAX_NR_SOLS == 1;
      SET_PREF_KODKOD_SAT_SOLVER == "glucose";
      SET_PREF_MAX_INITIALISATIONS == 1
SETS
 COLORS = {red,green,blue,orange,gray}; 
 NODES={B,C,D,F,G,
	H,J,K,L,M,N,P,Q,R,S,
	T,V,W,X,Y}
CONSTANTS EDGES
PROPERTIES
 EDGES : NODES <-> NODES &  
 card(EDGES) = 60 &
 card(NODES) = 20 &
 EDGES = EDGES~ &
 !(x,y).(x|->y:EDGES => x/=y) &
 /* !n.(n:NODES => card(EDGES[{n}])=3) */
 !n.(n:NODES => card({x|n|->x:EDGES})=3)
END

