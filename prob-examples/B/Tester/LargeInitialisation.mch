MACHINE LargeInitialisation
VARIABLES xx, yy, zz
INVARIANT
 xx:NATURAL & yy:INTEGER & zz:NATURAL1
INITIALISATION xx::NATURAL || yy::NATURAL1 ||  zz : ( zz>1000)
OPERATIONS
  IncXX = BEGIN xx := xx+1 END;
  r <-- Sum = BEGIN r:= xx+yy END;
  r <-- Mul = BEGIN r:= xx*yy END
END

