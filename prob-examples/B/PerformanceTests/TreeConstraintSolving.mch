MACHINE TreeConstraintSolving
SETS
  MODULES = {info,wp,sp,wp1,wp2,sp1,sp2}
DEFINITIONS
  NODE == struct(from:NATURAL,to:NATURAL,module:MODULES); /* type of the nodes stored in the tree */
  SET_PREF_MAX_INITIALISATIONS == 10;
  /* the following allows to use the view state as custom graph option in ProB Tcl/Tk: */
  CUSTOM_GRAPH_EDGES == mgraph;
  CUSTOM_GRAPH_NODES == {m,col|m:MODULES & col=bool(m:units)}
CONSTANTS choiceTree, WPTree,SPTree,choices, selected, mgraph, units
PROPERTIES
  choiceTree : tree(NODE) &
  /* setting up a choice tree with mandatory WP and SP, each with two possibilities wp1,wp2 and sp1,sp2 */
  choiceTree = const(rec(from:2,to:2,module:(info)),[WPTree,SPTree]) &
  WPTree = const(rec(from:1,to:1,module:(wp)),
                  [bin(rec(from:0,to:0,module:(wp1))),
                   bin(rec(from:0,to:0,module:(wp2)))]) &
  SPTree = const(rec(from:1,to:1,module:(sp)),
                  [bin(rec(from:0,to:0,module:(sp1))),
                   bin(rec(from:0,to:0,module:(sp2)))]) &
                   
  /* regiser which children are chosen for a module; possibly redundant wrt selected */
  choices : MODULES --> POW(NATURAL1) &
  
  /* which branches are selected */
  selected : dom(choiceTree) --> BOOL &
  !p.(p:dom(choiceTree) & selected(p)=TRUE =>
       card(choices(choiceTree(p)'module)) : choiceTree(p)'from..choiceTree(p)'to) &
  !p.(p:dom(choiceTree) & selected(p)=TRUE =>
       choices(choiceTree(p)'module) <: 1..arity(choiceTree,p)) &
  !(p,i).(p:dom(choiceTree) & i:1..arity(choiceTree,p) =>
        (i:choices(choiceTree(p)'module) <=> selected(son(choiceTree,p,i))=TRUE)) &
  !p.(p:dom(choiceTree) & selected(p)=FALSE => choices(choiceTree(p)'module) = {}) 
  &
  selected([])=TRUE /* force the root node to be selected */
  
  /* module graph */
  & mgraph = dom({m1,m2,p|p:dom(choiceTree) & m1=choiceTree(p)'module & 
                        #s.(s:1..arity(choiceTree,p) & m2 = choiceTree(p<-s)'module)})
 /* selected units */
  & units = dom({m,p|p:selected~[{TRUE}] & m=choiceTree(p)'module })

END

