MACHINE           House_Tracker

SETS HOUSES DEFINITIONS scope_HOUSES == 17

VARIABLES         houseset

INVARIANT         houseset <: HOUSES & card(houseset) < 17

INITIALISATION    houseset := {}

OPERATIONS

  add_house(new) = 
  PRE new : HOUSES 
  THEN
        houseset := houseset \/ {new}
  END;


  add_house2(new) = 
  PRE new : HOUSES & new : houseset
  THEN
      houseset := houseset \/ {new}
  END;

/* need to strengthen pre with card(houseset) < 16 */
  add_house3(new) = 
  PRE new : HOUSES & new /: houseset
  THEN
       houseset := houseset \/ {new}
  END;

/* need to strengthen pre with card(houseset) < 16 */
  add_house4(new) = 
  PRE new : HOUSES & new /: houseset & card(houseset) < 16
  THEN
       houseset := houseset \/ {new}
  END
END
