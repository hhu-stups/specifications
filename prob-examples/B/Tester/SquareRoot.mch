MACHINE SquareRoot
CONSTANTS x,y
PROPERTIES
 x:1..1000 & x*x = y & y:64000..66000

OPERATIONS
  Get(yy) = PRE yy:-1000..1000 & yy*yy = y THEN skip END;
  Get2(yy) = PRE yy:-300..300 & yy*yy = y THEN skip END;
  GetPos(yy) = PRE yy:0..1000 & yy*yy = y THEN skip END;
  GetNeg(yy) = PRE yy:-300..0 & yy*yy = y THEN skip END
END

