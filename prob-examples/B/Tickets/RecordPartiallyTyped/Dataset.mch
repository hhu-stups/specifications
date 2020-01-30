MACHINE Dataset
SETS
  Labels = {a,b,c,d,e,f,g,k}
DEFINITIONS
  node == 1..8;
  sign == {"POS", "NEG"};
CONSTANTS
	graphs
PROPERTIES
  /*graphs : {struct(LABEL:node+->Labels, EDGES:node<->node),SIGN:sign} &*/ /*DOM:{node}*/
  graphs = {
            rec(LABEL:{(1,a),(2,a),(3,b),(4,a),(5,a),(6,a),(7,a),(8,a)}, EDGES:{(1,2),(2,3),(3,4)},SIGN:"POS"),
            rec(LABEL:{(1,a),(2,a),(3,a),(4,a),(5,a),(6,a),(7,a),(8,a)}, EDGES:{(1,2),(2,3),(3,4)},SIGN:"POS")
           }
END
