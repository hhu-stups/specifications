MACHINE
   toto

/* SEES LibraryStrings */


DEFINITIONS
abs(xx) == {TRUE |-> xx, FALSE |-> -xx}(bool(0<=xx));"LibraryIO.def"
VARIABLES
IC_Errors,
prop_toto_0,
   process

INVARIANT
IC_Errors : POW(STRING) &
   prop_toto_0 : POW(NAT) &
   process: NAT

INITIALISATION
IC_Errors := {} ||
   prop_toto_0:= {} ||
   process := 0

OPERATIONS
Prop_ICErrors=
ANY error
WHERE error : IC_Errors
THEN IC_Errors := IC_Errors - {error}
END;

prop_COMPUTE_0 =
SELECT
   process = 0
THEN
   process := 1 ||
   prop_toto_0 := { toto
| (toto > 0) & (toto < 10)
& not( 1=0
)} 

END;

toto_0=
ANY 
 toto
WHERE
    toto
 : prop_toto_0
THEN
   prop_toto_0 := prop_toto_0 - { toto
}
END
END
