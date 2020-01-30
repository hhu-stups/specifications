MACHINE MaxInt_Test
VARIABLES xx
INVARIANT
 xx:INT
INITIALISATION xx:=0
OPERATIONS
  Set(yy) = PRE yy:NAT THEN xx:= yy END;
  Inc = PRE xx < MAXINT THEN xx := xx+1 END;
  Add(yy) = PRE yy:NAT & yy <MAXINT-xx THEN xx:= xx+yy END;
  SetMaxint = BEGIN xx := MAXINT END;
  SetMinint = BEGIN xx := MININT END;
  IncWrong = PRE xx <= MAXINT THEN xx := xx+1 END
END

