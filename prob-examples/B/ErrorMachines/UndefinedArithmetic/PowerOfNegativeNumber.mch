MACHINE PowerOfNegativeNumber
VARIABLES xx
INVARIANT
 xx:INTEGER
INITIALISATION xx:=2
OPERATIONS
  r <-- Get = r := xx ;
  Pow2 = BEGIN xx := xx ** 2 END;
  Pow0 = BEGIN xx := xx ** 0 END;
  PowMinus1 = BEGIN xx := xx ** -1 END
END

