MACHINE
    Nodes_Sequence
SEES Nodes
ABSTRACT_VARIABLES ss
INVARIANT
  ss : iseq(NODES)
& !nn.(nn : NODES & ss /= [] & nn : ran(ss) => last(ss) |-> nn /: reachable)
& !nn.(nn : NODES & ss /= [] & last(ss) |-> nn : next => nn /: ran(ss))
&!(ii,jj).(ii : 1..size(ss)-1 & jj : 2..size(ss) & ii + 1 = jj
            => ss(ii) |-> ss(jj) : next)
&!(ii).(ii : 1..size(ss)-1 & ii + 1 : 2..size(ss)
            => ss(ii) |-> ss(ii + 1) : next)
& ss : Routes
INITIALISATION ss := []
OPERATIONS
 OP_addFirst(pp) =
     PRE pp : NODES & ss = []
     THEN ss := [pp]
     END;

 OP_add(pp) =
     PRE pp : NODES
         & ss /= []
         & last(ss) |-> pp : next
         //& pp /: ran(ss)
     THEN
         ss := ss <- pp
     END;

 out_bool <-- OP_contains(pp) =
     PRE pp : NODES
     THEN
         IF pp : ran(ss)
         THEN out_bool := TRUE
         ELSE out_bool := FALSE
         END
     END;

 out_bool <-- OP_isEmpty =
     IF ss = []
     THEN out_bool := TRUE
     ELSE out_bool := FALSE
     END
END
