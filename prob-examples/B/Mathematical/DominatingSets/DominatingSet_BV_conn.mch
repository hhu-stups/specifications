MACHINE DominatingSet_BV_conn
 // represents the dominating set as a bit vector (total function to BOOL)
 // we also encode the connected constraint here (at least partially)
SETS
 Vertices = VERTICES  // requires new parser
CONSTANTS
  g /*@desc "full symmetric graph */,
  gd /*@desc "initial (possibly directed) version of the graph */,
  gn /*@desc "graph represented as neighbours function" */,
  DomSetBV,
  cd    /*@desc "The cardinality of DomSet" */
  , tr, root
PROPERTIES
  g: Vertices <-> Vertices &
  g = gd \/ gd~ & // complete the graph to a symmetric one
  gd = EDGES &
  gn = %x.(x:Vertices|g[{x}])
 &
  DomSetBV : Vertices --> BOOL
 &
  !x.(x:Vertices =>
        //(!y.(y:g[{x}] => DomSetBV(y) = FALSE)  => DomSetBV(x)=TRUE)
        #y.(y:g[{x}] & DomSetBV(y)=TRUE)
        // if x:DomSet => by connected constraint we need one neighbour at least in DomSet (assuming card(DomSet)>1)
        // and if x not in DomSet => we also need one neighbour in DomSet
      )
  & IsConnected(DomSet)
  & cd = card({xt|xt:Vertices & DomSetBV(xt)=TRUE}) //& cd<15  // 14 optimum wo full connected constraint
  // & MINIMIZE_EXPR(cd)

  // setting up constraints about the existence of a spanning tree:

  & DomSetBV(root) = TRUE
  & tr: Vertices >+> Vertices
  & !(x,y).(x|->y : tr => DomSetBV(x)=TRUE & DomSetBV(y)=TRUE & x/=y & y|->x:g & y|->x /:tr)
  & !x.(DomSetBV(x)=TRUE & x/= root => x:ran(tr))
  // what is still missing: absence of cycles

 & cd < 6
DEFINITIONS
   "Data_small_leaf.def"; // optimium: 5
  //"Data_middle_leaf.def";

 DomSet == {x|x|->TRUE:DomSetBV};
 NDS == {x|x|->FALSE:DomSetBV};
 CUSTOM_GRAPH_NODES == DomSet * {"green"} \/ NDS * {"slateblue"};
 CUSTOM_GRAPH_EDGES == {a,colour,b|a|->b:g & TO_INT(a) < TO_INT(b) & colour="blue"};
 //CUSTOM_GRAPH_EDGES2 == {b,lbl,colour,a|a|->b:tr & colour = "red" & lbl="tr"};

 SET_PREF_TIME_OUT == 100000;
 IsDomSet(ds) ==
  /* can be used for :min IsDomSet(ds) or :min %ds.(IsDomSet(ds)|card({x|x:Vertices & x|->TRUE:ds})) */
  /* or MAXIMIZE({cd,ds| IsDomSet(ds) & cd=card({x|x:Vertices & x|->FALSE:ds})}) */
     (ds : Vertices --> BOOL &
      !x.(x:Vertices =>
        (!y.(y:g[{x}] => ds(y) = FALSE)  => ds(x)=TRUE)
      ));
 // IsConnected1(ds) == !x.(ds(x)=TRUE => #y.(y:ds & x|->y : g));

 "CHOOSE.def";
 IsConnected(DS) == LET ds BE ds=DS IN !x.(x=CHOOSE(ds) => {x} \/ closure1(ds <| g |> ds)[{x}]=ds) END;

 SET_PREF_SMT == TRUE;
 SET_PREF_SOLVER_STRENGTH == 250;

 SET_PREF_KODKOD == TRUE;
 SET_PREF_KODKOD_ONLY_FULL == FALSE;
 SET_PREF_KODKOD_SYMMETRY == 50; SET_PREF_KODKOD_SAT_SOLVER == "glucose";
 SET_PREF_KODKOD_MAX_NR_SOLS == 5;

 SET_PREF_MAX_INITIALISATIONS == 1;
 "LibraryProB.def"
END

