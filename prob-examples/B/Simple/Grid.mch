MACHINE Grid
CONSTANTS
  limit
PROPERTIES
  limit: NAT & limit = 3
  
VARIABLES
 xx,yy
 
INVARIANT
 xx: NAT & yy: NAT & (xx /= limit or yy /= limit)
 
INITIALISATION
 xx,yy := 0,0
 
OPERATIONS

 incx = IF xx< limit THEN xx := xx + 1 END;
 incy = IF yy< limit THEN yy := yy + 1 END;
 decx = IF xx>0 THEN xx := xx - 1 END;
 decy = IF yy>0 THEN yy := yy - 1 END
END