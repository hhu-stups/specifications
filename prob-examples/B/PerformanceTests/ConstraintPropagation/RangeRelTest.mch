MACHINE RangeRelTest
/* check whether information propagates through range computation */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh}
CONSTANTS rels
PROPERTIES
 rels:{cc,ee} <-> ID & ran(rels)={bb} 
OPERATIONS
  inrel(x,y) = PRE x|->y : rels THEN skip END
END

