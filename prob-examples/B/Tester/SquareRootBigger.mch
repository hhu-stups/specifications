MACHINE SquareRootBigger
CONSTANTS x,y
PROPERTIES
 x:1..100000 & x*x = y & y:12164000..12196000

OPERATIONS
  Get(yy) = PRE yy:-10000..10000 & yy*yy = y THEN skip END;
  Get2(yy) = PRE yy:-3000..30000 & yy*yy = y THEN skip END;
  GetPos(yy) = PRE yy:0..10000 & yy*yy = y THEN skip END;
  GetNeg(yy) = PRE yy:-30000..0 & yy*yy = y THEN skip END
END

