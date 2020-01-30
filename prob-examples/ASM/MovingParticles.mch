MACHINE MovingParticles
DEFINITIONS
 SET_PREF_USE_RECORD_CONSTRUCTION == FALSE;
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == TRUE;
CONSTANTS n, mn, mx
PROPERTIES
 n = 2 & mn=0 & mx=10
VARIABLES pos, cont
INVARIANT
 pos: 1..n --> (mn..mx) &
 cont : (mn..mx) --> NATURAL
INITIALISATION pos := {1|->mn, 2|->mx} || cont := (mn..mx)*{0} <+ {mn|->1, mx|->1}
OPERATIONS
  Move(i,m) = PRE i : 1..n & m:{-1,1} THEN
     LET pm BE pm = pos(i)+m IN
       IF pm:mn..mx THEN
          pos(i) := pm ||
          cont(pos(i)) := cont(pos(i)) -1 ||  /* accumulative assignment */
          cont(pm) := cont(pm) +1   /* accumulative assignment */
      END
    END
  END
END

