MACHINE included2(Param,value)
CONSTRAINTS value:INTEGER
SETS sI2
VARIABLES vI2a
INVARIANT
  vI2a : seq(Param)
INITIALISATION vI2a := <>
OPERATIONS
  add(elem) =
    PRE elem:Param & size(vI2a) < value THEN
      vI2a := vI2a <- elem
    END;
  elem <-- get =
    PRE size(vI2a) > 0 THEN
         vI2a := tail(vI2a)
      || elem := first(vI2a)
    END;
  clear = BEGIN vI2a := <> END
END
