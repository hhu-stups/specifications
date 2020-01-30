
MACHINE UserDefinedAlias_internal
ABSTRACT_VARIABLES
  /*@ unit "myKMpH" */ xx,
  /*@ inferred_unit "myKMpH" */ test,
  /*@ unit "km * s**-1" */ test2
INVARIANT
    xx : NAT
  & test : NAT
  & test2 : NAT
INITIALISATION
    BEGIN
      xx,test,test2 := 1,2,2
    END
OPERATIONS
  type =
    BEGIN
      test := xx
    END;

  assign =
    BEGIN
      test := test2
    END
END
