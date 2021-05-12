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
 CHOOSE(%x.(x:1..10|x*x)) : %y.(y:1..10|y*y);
 CHOOSE((1..20000)*(2..200)) : ((1..20000)*(2..200));
 card({v,w,x,a,b|CHOOSE(x)={a,b} & x ={{1,v},{3,w}} & v:2..3 & w:2..3}) = 8;
 card({v,w,a,b|#x.(CHOOSE(x)={a,b} & x ={{1,v},{3,w}} & v:2..3 & w:2..3)}) = 8;
 {v,w,ab|#x.(CHOOSE(x)=ab & x ={{1,v},{3,w}} & v:3..4 & w:1..2)} =
  {((3|->1)|->{1,3}),((3|->2)|->{1,3}),((4|->1)|->{1,3}),((4|->2)|->{1,4})} /* this is a very specific assertion; checking that we CHOOSE the minimal elements */
 ;

 MU({1}) = 1;
 !x.(x:ID => MU({x}) = CHOOSE({x}));
 MU(2..2) = 2
VARIABLES xx
INVARIANT
 xx <: ID &
 (xx={} or CHOOSE(xx) : xx) /* this is undefined for xx={}; now raises real WD error; maybe we should still add source location info */
INITIALISATION xx:=ID
OPERATIONS
  Delete(yy) = PRE /* xx /= {} & */ yy=CHOOSE(xx) THEN xx := xx - {yy} END;
  Add(yy) = PRE yy /: xx THEN xx := xx \/ {yy} END
END

