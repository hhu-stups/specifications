MACHINE DomRelTest
/* check whether information propagates through domain computation */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh}
CONSTANTS rels
PROPERTIES
 rels: ID <-> {cc,ee} & dom(rels)={bb} 
OPERATIONS
  inrel(x,y) = PRE x|->y : rels THEN skip END
END

