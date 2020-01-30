MACHINE dijkstra

SETS
  States = {s1,s2,s3,s4,s5}
  
VARIABLES
   marked, dist, trans
   
INVARIANT
   marked : POW(States) &
   dist : States +-> NAT &
   dom(dist) = marked &
   trans : States <-> States &
   (dom(trans) \/ ran(trans)) = States
   
 INITIALISATION
   dist := {s3 |-> 0} ||
   marked := {s3} ||
   trans := { s1 |-> s2,
              s2 |-> s3,
              s3 |-> s1,
              s4 |-> s1,
              s1 |-> s4,
              s5 |-> s3,
              s1 |-> s5
            }
              
 OPERATIONS
    mark(ss,mm) = SELECT ss: States & mm:States & mm: marked & ss /: marked &
                      mm: trans[{ss}]
                      & !xx.(xx:States & xx: marked & dist(xx) < dist(mm) 
                                    =>  trans~[{xx}] <: marked )
                   THEN
      marked := marked \/ {ss} ||
      dist := dist \/ {ss |-> (dist(mm)+1)}
    END;
    
    finish = SELECT marked = States THEN skip END;

    r <-- distance(x) = PRE x:dom(dist) THEN r := dist(x) END
  END