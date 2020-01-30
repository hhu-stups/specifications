MACHINE assertions_with_labels
SETS
 ID={aa,bb}
CONSTANTS a,b,c
PROPERTIES
 a>b & b>c & a:9..10 & c:2..3
ASSERTIONS
 /*@ label A1 */ a>c;
 /*@label A2 */ b:3..9;
 /*@label FALSE1 */ a<c
VARIABLES xx
INVARIANT
 xx:c..a
INITIALISATION xx:=a
OPERATIONS
  Inc = PRE xx<c THEN xx:=xx+1 END
END

