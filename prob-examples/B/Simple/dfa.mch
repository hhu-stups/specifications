MACHINE dfa
DEFINITIONS GOAL == current:final
SETS
  States = {s1,s2,s3}; Labels = {a,b,c}
  
VARIABLES
   initial, final, trans, current
   
INVARIANT
   initial : POW(States) & initial /= {} &
   final : POW(States) &
   current : States
   &
   trans : States --> (Labels +-> States)
   
 INITIALISATION
   initial := {s1} || final := {s3} ||
   current := s1 ||
   trans := { s1 |-> { a |-> s1, b |-> s2 },
              s2 |-> { b |-> s2, c |-> s3 },
              s3 |-> { c |-> s3 }
            }
              
 OPERATIONS
    go(ll) = PRE ll: Labels & ll: dom(trans(current)) THEN
      current := trans(current)(ll)
    END;
    
    accept = PRE current: final THEN skip END
  END