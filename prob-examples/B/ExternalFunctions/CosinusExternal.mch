MACHINE CosinusExternal
ABSTRACT_CONSTANTS
 cos, sin
DEFINITIONS
 EXTERNAL_PROLOG_FILE == "ExternalTest.pl";  /* is still ignored */
 /* EXTERNAL_CODE == "
:- block 'COS'(-,?).
'COS'(int(X),int(R)) :- cos2(100,X,R).
:- block cos2(?,-,?).
cos2(Multiplier,X,R) :- R is round(Multiplier*cos(X/Multiplier)).
:- block 'SIN'(-,?).
'SIN'(int(X),int(R)) :- sin2(100,X,R).
:- block sin2(?,-,?).
sin2(Multiplier,X,R) :- R is round(Multiplier*sin(X/Multiplier)).

:- block 'CHOOSE'(-,?).
'CHOOSE'([],_) :- print('Cannot choose'),nl,fail.
'CHOOSE'([H|_],H). % TO DO: should really get minimum
'CHOOSE'(avl_set(A),H) :- avl_min(A,H).
'CHOOSE'(closure(_P,_T,_B),_H) :- print('not yet implemented'),nl,fail.
                  "; */
 /* 
*/
 EXTERNAL_FUNCTION_CHOOSE(T1) == (POW(T1) --> T1); 
 EXTERNAL_FUNCTION_COS == (INTEGER --> INTEGER);
 EXTERNAL_FUNCTION_SIN == (INTEGER --> INTEGER);
 COS(x) == cos(x); /* This macro gets overriden by external function */
 SIN(x) == sin(x);
 RealSIN(x) == sin(x);
 CHOOSE(x) == choose_cannot_be_written_in_B(x)
 /* other proposals (with type info) :
  EXTERNAL_FUNCTION_COS == INTEGER --> INTEGER;
  EXTERNAL_FUNCTIONS == {("COS",INTEGER,INTEGER),("SIN",INTEGER,INTEGER)};
 */
 /* other proposals (without type info): 
   COS == EXTERNAL_PROLOG(cos);
   COS == EXTERNAL;
   COS(x) == EXTERNAL_PROLOG(cos(x)); 
   EXTERNAL_cos == TRUE; EXTERNAL_sin == TRUE;
   EXTERNAL_PROLOG == {sin,cos};*/
PROPERTIES
  cos: NATURAL --> INTEGER &
  cos = %x.(x:NATURAL|COS(x)) /* This generates a "real" B function, where we can computed domain, computed image, ... */ &
  sin: INTEGER --> INTEGER &
  sin = %x.(x:INTEGER|SIN(x)) /* EXTERNAL */
ASSERTIONS
  cos(314) = -100;
  sin(314) = 0;
  cos(628) = 100;
  sin(628) = 0;
  !i.(i:0..630 => (sin(i)*sin(i)+cos(i)*cos(i) : (99*99)..(101*101)));
  cos[0..628] = -100..100;
  ([0,157,314];cos) = [100,0,-100];
  !i.(i:0..10000 => sin(i)<=100)
OPERATIONS
  r <-- GetCos(x) = PRE x:dom(cos) THEN r := cos(x) END;
  r <-- GetSin(x) = PRE x:dom(sin) THEN r := sin(x) END;
  r <-- GetChoose(s) = PRE s : POW1(0..3) THEN r := CHOOSE(s)+0 END; 
  r <-- ApplyCOS_Direct = BEGIN r:= COS(628)*1 END
END