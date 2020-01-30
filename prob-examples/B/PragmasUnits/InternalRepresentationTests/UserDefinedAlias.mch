/*@ unit_alias myKMpH "km * s**-1" */
MACHINE UserDefinedAlias
ABSTRACT_VARIABLES
  /*@ unit "myKMpH"  */ xx,
  test,
  /*@ unit "km * s**-1" */ test2
INVARIANT
    xx : NAT
  & test : NAT
  & test2 : NAT
INITIALISATION
  xx,test,test2 := 1,2,2
OPERATIONS
  type = test := xx;
  assign = test := test2
END
