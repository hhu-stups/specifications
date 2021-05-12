MACHINE ChooseExternal
/* Check proper functioning of the CHOOSE external function */
SETS
 ID={aa,bb}
DEFINITIONS
 "CHOOSE.def"
/* CHOOSE(X) == "a member of X";
 EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T) */
ASSERTIONS
 CHOOSE(1..100) : 1..100;
 CHOOSE(1..100000) : 1..100000;
 CHOOSE(INTEGER) : INTEGER;
 CHOOSE(NATURAL1) : NATURAL1;
 CHOOSE(ID) : ID ;
 CHOOSE(ID) =  CHOOSE({bb,aa});
 CHOOSE(ID) = CHOOSE({aa}\/{bb});
 CHOOSE([aa,bb,aa]) : [aa,bb,aa];
 CHOOSE(%x.(x:1..10|x*x)) : %y.(y:1..10|y*y)
VARIABLES xx
INVARIANT
 xx <: ID &
 (xx={} or CHOOSE(xx) : xx) /* this is undefined for xx={}; now raises real WD error; maybe we should still add source location info */
INITIALISATION xx:=ID
OPERATIONS
  Delete(yy) = PRE /* xx /= {} & */ yy=CHOOSE(xx) THEN xx := xx - {yy} END;
  Add(yy) = PRE yy /: xx THEN xx := xx \/ {yy} END
END

