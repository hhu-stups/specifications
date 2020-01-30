
MACHINE MultiplicationConversion
DEFINITIONS
  /*@ conversion */ cm_to_mm_1(x) == 10 * x;
  /*@ conversion */ cm_to_mm_2(x) == x * 10;
  /*@ conversion */ mm_to_cm(x) == x/10;
VARIABLES
  /*@ unit "cm"  */ xx,
  /*@ unit "mm"  */ yy,
  converted11,
  converted12,
  converted2
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
      converted11 := cm_to_mm_1(xx)
    END;

  CmToMm2 =
    BEGIN
      converted12 := cm_to_mm_2(xx)
    END;

  MmToCm1 =
    BEGIN
      converted2 := mm_to_cm(yy)
    END
END
