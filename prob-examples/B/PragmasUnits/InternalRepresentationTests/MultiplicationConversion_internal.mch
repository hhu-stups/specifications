
MACHINE MultiplicationConversion_internal
ABSTRACT_VARIABLES
  /*@ unit "cm" */ xx,
  /*@ unit "mm" */ yy,
  /*@ inferred_unit "mm" */ converted11,
  /*@ inferred_unit "mm" */ converted12,
  /*@ inferred_unit "cm" */ converted2
INVARIANT
    xx : NAT
  & yy : NAT
  & converted11 : NAT
  & converted12 : NAT
  & converted2 : NAT
INITIALISATION
    BEGIN
      xx,yy,converted11,converted12,converted2 := 0,0,0,0,0
    END
OPERATIONS
  CmToMm1 = 
    BEGIN
      converted11 := 10 * xx
    END;
  
  CmToMm2 = 
    BEGIN
      converted12 := xx * 10
    END;
  
  MmToCm1 = 
    BEGIN
      converted2 := yy / 10
    END
END
