MACHINE StaticAssertionProjection
/* try:
  probcli StaticAssertionProjection.mch -p CLPFD TRUE -main_assertions
  probcli StaticAssertionProjection.mch -p CLPFD TRUE -assertions
*/
INCLUDES StaticAssertionProj_Sub
SETS
 ID={aa,bb}
CONSTANTS a,b,c,d,e
PROPERTIES
  a:NATURAL & b:NATURAL & c:NATURAL & d:NATURAL &
  a = b+b &
  c = d+d & e=c+c & e<25 &
  a<8 & d<20 & c>3
ASSERTIONS
  c > d
 /* ; xx=aa */
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

