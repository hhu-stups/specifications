MACHINE GraphMiningSimple
SETS Vertices = {v1,v2,v3,v4, v5, v6}
DEFINITIONS
  SET_PREF_KODKOD == TRUE;
  hinj(hh,graph) == hh:dom(pat)\/ran(pat) >-> Vertices & 
                 !(x,y).(x|->y : pat => hh(x)|->hh(y):graph)
CONSTANTS pos,neg, pat, hpos
PROPERTIES
  pos = LET g BE g={v1 |-> v2, v2|->v3, v3|->v4, v4|->v5, v5|->v6, v6|->v1,
                    v1 |-> v4, v3|-> v6} IN g\/g~ END &
  neg = LET g BE g={v1 |-> v2, v2|->v3, v3|->v4} IN g\/g~ END &
  
  pat : Vertices <-> Vertices &
  hinj(hpos,pos) &
  pat /= {}
  
  // &  not(#hneg.(hinj(hneg,neg))) 
  // leads to kodkod.engine.fol2sat.HigherOrderDeclException:
END

