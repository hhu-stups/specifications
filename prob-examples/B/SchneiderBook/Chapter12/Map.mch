MACHINE           Map(INDEX, ITEM)

VARIABLES         fun

INVARIANT         fun : INDEX +-> ITEM

INITIALISATION    fun := {}

OPERATIONS

  insert(ss1, ss2) =
  PRE ss1 : INDEX & ss2 : ITEM
  THEN fun(ss1) := ss2
  END;

  remove(r_par) =
  PRE r_par : INDEX
  THEN fun := {r_par} <<| fun
  END;

q_ret <-- query(q_par) =
  PRE q_par : dom(fun)
  THEN q_ret := fun(q_par)
  END

END
