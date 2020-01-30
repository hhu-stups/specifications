MACHINE CallOp

VARIABLES
   xx,yy
   
INVARIANT
   xx: NAT & yy: NAT
   
INITIALISATION
  xx,yy := 0,0
  
OPERATIONS
  res <-- IncXX = BEGIN
      res := xx+1 ||
      xx := xx+1
   END;
   
  res <-- AddToXX(inc) = PRE inc: NAT THEN
      res := xx+inc ||
      xx := xx+inc
   END;
   
  IncXXYY = BEGIN
     yy <-- IncXX
   END;
   
  DoubleXXYY = BEGIN
     yy <-- AddToXX(xx)
   END
END