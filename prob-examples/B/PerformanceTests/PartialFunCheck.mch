MACHINE PartialFunCheck
DEFINITIONS
 SET_PREF_MAXINT == 500
VARIABLES r,check
INVARIANT
 r:INTEGER <->INTEGER & check:BOOL
ASSERTIONS
 r: INTEGER+->INTEGER;
 r: 1..MAXINT-->INTEGER;
 r: INTEGER >+> INTEGER;
 r: INTEGER +->> 2..MAXINT;  /* gets very slow if 1 is replaced by x in INIT */
 MAXINT : dom(r);
 2 /: dom(r)

/* 
(r:(INTEGER+->INTEGER))
TRUE  (400 ms + 1440 ms = 1840 ms)
(r:((1..MAXINT)-->INTEGER))
false  (1710 ms + 2370 ms = 4080 ms)
(r:PartialInjection(INTEGER,INTEGER))
false  (1040 ms + 2430 ms = 3470 ms)
(r:PartialSurjection(INTEGER,(2..MAXINT)))
false  (40 ms + 0 ms = 40 ms)
(MAXINT:dom(r))
TRUE  (10 ms + 0 ms = 10 ms)
(2/:dom(r))
not_in_dom(int(2))
in_dom(int(2))
false  (0 ms + 0 ms = 0 ms)
*/
INITIALISATION r,check:=%x.(x:2..MAXINT|1),FALSE
OPERATIONS
  Set(x,y) = PRE x:NATURAL & y:NATURAL THEN r(x) := y END/* 
 Set2(x,y) = PRE x:NATURAL & x/: dom(r) & y:NATURAL THEN r(x) := y END;
  SetAll(x1,y) = PRE x1:NATURAL & y:NATURAL THEN
     r := r \/ %x.(x:x1..MAXINT|y)
  END */
 /* ;
  c <-- getcard = c:= card(r) */
/* ;
  StartCheck = check := TRUE;
  res <-- checkpf = PRE check=TRUE THEN
                       IF r: INTEGER+->INTEGER THEN res:= TRUE ELSE res:=FALSE END
                    END
*/
END

