MACHINE           List(ELEMENT)

VARIABLES         list

INVARIANT         list : seq(ELEMENT)

INITIALISATION    list := <>

OPERATIONS

  add(ee) =
  PRE ee : ELEMENT
  THEN list := list <- ee
  END;

ee <-- take =
  PRE list /= <>
  THEN list := tail(list) || ee := first(list)
  END

END
