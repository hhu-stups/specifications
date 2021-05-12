MACHINE DominatingSet_BV
 // represents the dominating set as a bit vector (total function to BOOL)
 // does not encode connected constraint
SETS
 Vertices = {v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,
             v10,v11,v12,v13,v14}
CONSTANTS g, gd,
  DomSetBV, cd
PROPERTIES
  g: Vertices <-> Vertices &
  g = gd \/ gd~ & // complete the graph to a symmetric one
  gd = {v0|->v1,
        v1|->v2, v1|->v3, v1|->v4,
        v2|->v5, v2|->v6, v2|->v3,
        v3|->v6, v3|->v7, v3|->v8,
        v4|->v3, v4|->v8, v4|->v9,
        v5|->v10, v5|->v6,
        v6|->v10, v6|->v11, v6|->v7,
        v7|->v11, v7|->v12, v7|->v13,
        v8|->v7,  v8|->v13, v8|->v14,
        v9|->v8, v9 |-> v14,
        v10|->v11,
        v11|->v12,
        v13|->v12,
        v14|->v13
}
 &
  DomSetBV : Vertices --> BOOL
 &
  !x.(x:Vertices =>
        (!y.(y:g[{x}] => DomSetBV(y) = FALSE)  => DomSetBV(x)=TRUE)
      )
 // & IsConnected(DomSet)
  & cd = card({xt|xt:Vertices & DomSetBV(xt)=TRUE}) // & cd<5
  & MINIMIZE_EXPR(cd) // card(DomSet) = 4
DEFINITIONS
 DomSet == {x|x|->TRUE:DomSetBV};
 NDS == {x|x|->FALSE:DomSetBV};
 CUSTOM_GRAPH_NODES == DomSet * {"green"} \/ NDS * {"slateblue"};
 CUSTOM_GRAPH_EDGES == {a,b|a|->b:g & TO_INT(a) < TO_INT(b)};
 SET_PREF_TIME_OUT == 10000;
 IsDomSet(ds) ==
  /* can be used for :min IsDomSet(ds) or :min %ds.(IsDomSet(ds)|card({x|x:Vertices & x|->TRUE:ds})) */
  /* or MAXIMIZE({cd,ds| IsDomSet(ds) & cd=card({x|x:Vertices & x|->FALSE:ds})}) */
     (ds : Vertices --> BOOL &
      !x.(x:Vertices =>
        (!y.(y:g[{x}] => ds(y) = FALSE)  => ds(x)=TRUE)
      ));
 // IsConnected1(ds) == !x.(ds(x)=TRUE => #y.(y:ds & x|->y : g));
  //IsConnected(ds) == !x.(ds(x)=TRUE => {x} \/ closure1(ds <| g |> ds)[{x}]=ds);
 SET_PREF_SMT == TRUE; SET_PREF_KODKOD == FALSE;
 SET_PREF_SOLVER_STRENGTH == 100;
 "LibraryProB.def"
END

