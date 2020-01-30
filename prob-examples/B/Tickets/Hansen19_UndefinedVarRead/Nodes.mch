MACHINE
    Nodes
SETS NODES //= {k1,k2,k3,k4}
ABSTRACT_CONSTANTS next, reachable, Start_Node, Routes
PROPERTIES
 NODES : FIN1(NODES)
& next : NODES <-> NODES
& next : FIN1(next)
& next /\ id(NODES) = {}
& !(aa,bb).(aa |-> bb : next => aa /= bb)
& !(aa,bb).(aa |-> bb : next => bb|-> aa /: next)
& !aa.(aa: dom(next) => card(next[{aa}]) <= 2)
& !tt.(tt :NODES & tt : dom(next) => tt /: next[{tt}])
& !tt.(tt :NODES & tt : dom(next) => tt /: closure1(next)[{tt}])
//& next = {(k1|->k2), (k1 |->k3), (k3|->k4), (k2|->k4)}
& reachable : NODES <-> NODES
//& reachable = {xx,yy| xx : NODES & yy : NODES & xx : dom(next) & yy : closure1(next)[{xx}]}
& next <: reachable
& !(aa,bb).(aa |-> bb : next => aa |-> bb : reachable)
& !(aa,bb).(aa : NODES & bb : NODES & aa |-> bb /: reachable => aa |-> bb /: next)
& !(aa).(aa : NODES => ((aa : dom(reachable)) <=> (aa : dom(next))))
& !(aa,bb).(aa |-> bb : reachable => reachable[{bb}] <<: reachable[{aa}])
& !aa.(aa: NODES => ((aa : ran(reachable)) <=> (aa : ran(next))))
& !(aa,bb,cc).(aa : NODES & bb : NODES & cc : NODES & next[{aa}] = {cc} &  bb |-> cc : next => aa |-> bb /: reachable)
& !aa.(aa: dom(reachable) => aa /: reachable[{aa}])
& !aa.(aa: dom(next) => aa /: next[{aa}])
& !aa.(aa: dom(next) => aa /: reachable[{aa}])
&!(aa,bb,cc).(aa : NODES & bb : NODES & cc : NODES
    & aa|-> bb : next & bb|-> cc : next
    => aa |-> cc : reachable & cc |-> aa /: reachable
)
& !(aa,bb).(aa |-> bb : reachable => aa /= bb)
& !(aa,bb).(aa |-> bb : reachable => bb|-> aa /: reachable)
& !(aa,bb,cc).(aa : NODES & bb : NODES & cc : NODES
    & aa|-> bb : reachable & bb|-> cc : reachable
    => aa |-> cc : reachable & cc |-> aa /: reachable
)
& !(aa,bb).(aa |-> bb : next => card(reachable[{aa}]) >  card(reachable[{bb}]))

& Start_Node : NODES
& Routes :  POW(iseq(NODES))
& Routes = 
    {ss| ss : iseq(NODES)
       & !(ii,jj).(ii : 1..size(ss)-1 & jj : 2..size(ss) & ii + 1 = jj
            => ss(ii) |-> ss(jj) : next)
    }
OPERATIONS
    out_kk <-- OP_getFirst = BEGIN out_kk := Start_Node END;

    out_bool <-- OP_hasNext(tt) =
      PRE
          tt : NODES
      THEN
          IF
              tt : dom(next)
              & {tt} <| next : {tt} >-> NODES
          THEN out_bool := TRUE
          ELSE out_bool := FALSE
          END
      END;

   out_nextNode <-- OP_getNextNode(tt) =
      PRE
          tt : NODES
          & tt : dom(next)
          & {tt} <| next : {tt} >-> NODES
      THEN
        LET next_function
        BE
          next_function = {tt} <| next
        IN
          ASSERT
           tt |-> next_function(tt) : next
           &  tt /= next_function(tt)
           & next_function <: next
           & next_function(tt) : reachable[{tt}]
          THEN
            out_nextNode := next_function(tt)
          END
        END
      END
END
