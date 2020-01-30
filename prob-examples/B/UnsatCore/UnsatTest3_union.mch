MACHINE UnsatTest3_union
SETS
 ID={aa,bb}
CONSTANTS S,V,W
PROPERTIES
  union({S,V,W}) = 1..4 & S={} & 
  V={1} & W=2..4 & S/\V = {} & S/\W ={} & 
  V /\ W = {} & S <<: V & V<<:W
END

