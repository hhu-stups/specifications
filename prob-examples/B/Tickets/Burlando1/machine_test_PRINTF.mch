MACHINE
   machine_test_PRINTF
DEFINITIONS
   "LibraryIO.def";
   SET_PREF_MAXINT == 2**31;
   SET_PREF_MININT == -(2**31)
VARIABLES
   xx,
   process
INVARIANT
   xx : INT &
   process : 1..10
INITIALISATION
   xx := 0 ||
   process := 1
OPERATIONS

   PROCESS = 
   SELECT
      process = 1
   THEN
      process := 2;
/* problematic */
     PRINTF("xx1 : ~w~n", [xx]); 
/* problematic */
      IF printf("xx2 : ~w~n", [xx]) THEN skip END;
      WHILE xx < 10 DO
         ANY aa, bb, cc 
         WHERE aa=1 & bb=2 & cc= 3 & aa |-> bb |-> cc = 1 |-> 2 |-> 3
         THEN
            xx := xx + 1  ; PRINTF("xx3 : ~w~n",[xx]) 
         END
      INVARIANT 0 = 0
      VARIANT 10 - (xx + 1)
      END
   END
END
