MACHINE           House_Tracker_CBC

SETS HOUSES DEFINITIONS scope_HOUSES == 17

CONSTANTS         houseset, new, houseset2

PROPERTIES
       houseset <: HOUSES & card(houseset) < 17 &

       new : HOUSES &
  
       houseset2 = houseset \/ {new}

ASSERTIONS
        houseset2 <: HOUSES & card(houseset2) < 17
END
