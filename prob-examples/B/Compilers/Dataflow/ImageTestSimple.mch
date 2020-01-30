MACHINE ImageTest
/* A simple test to see if info propagates through image [.] operator */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh}
CONSTANTS rels
PROPERTIES
 rels:{cc,ee} <-> ID &
 rels[ID] = {bb}
OPERATIONS
  inrel(x,y) = PRE x|->y : rels THEN skip END
END

