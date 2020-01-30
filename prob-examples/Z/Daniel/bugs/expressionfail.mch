MACHINE expressionfail
VARIABLES
  state
INVARIANT
  state : POW(INTEGER * INTEGER)
INITIALISATION
  state := {1, 2, 3} * {0}
OPERATIONS
  Transfer(x) = 
    PRE x:INTEGER THEN
      ANY state2
        WHERE 
            x : {2, 3}
          & state2 : POW(INTEGER * INTEGER)
          & #a. (  a = {2, 3} 
                 & #b.(  b = a-{x}
                       & state2 = state <+ {2 |-> state(x)}))
        THEN 
          state := state2
        END
      END
END
