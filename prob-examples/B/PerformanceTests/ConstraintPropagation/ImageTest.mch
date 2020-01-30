MACHINE ImageTest
SETS
  S = {i,s2,s3,s4}
CONSTANTS
  tr, /* transition relation */
  reach /* reachable states */
  
PROPERTIES
  tr : S <-> S &

  /* alternative representation of the reachable states */
  reach : POW(S) &

  i:reach &

  tr[reach] <: reach &
  /* reach is the smallest fix point of reachable states */
  !(r).(r : POW(S) &
        i : r & tr[r] <: r => reach <: r)
END