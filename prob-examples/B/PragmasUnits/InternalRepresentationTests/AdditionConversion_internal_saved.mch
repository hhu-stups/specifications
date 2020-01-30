
MACHINE AdditionConversion_internal
ABSTRACT_VARIABLES
  /*@ unit "degC" */ gradCelsius,
  /*@ unit "K" */ gradKelvin,
  /*@ inferred_unit "K" */ converted11,
  /*@ inferred_unit "K" */ converted12,
  /*@ inferred_unit "degC" */ converted2
INVARIANT
    gradCelsius : NAT
  & gradKelvin : NAT
  & converted11 : NAT
  & converted12 : NAT
  & converted2 : NAT
INITIALISATION
    BEGIN
      gradCelsius,gradKelvin,converted11,converted12,converted2 := 0,0,0,0,0
    END
OPERATIONS
  gcToGk1 =
    BEGIN
      converted11 := gradCelsius + 273
    END;

  gcToGk2 =
    BEGIN
      converted12 := gradCelsius + 273
    END;

  gkToGc =
    BEGIN
      converted2 := gradKelvin - 273
    END
END
