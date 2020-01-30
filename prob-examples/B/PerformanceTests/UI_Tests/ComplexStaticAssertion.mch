MACHINE ComplexStaticAssertion
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID
ASSERTIONS  // an assertion that takes about a second
  !(xx,yy).(xx:POW(POW(ID)) & yy:ID => (
                     (xx=POW(ID) => {yy}:xx) &
                     (xx=POW(ID) => {yy,aa}:xx) &
                     (xx=POW(ID) => {yy,bb}:xx) &
                     (xx=POW(ID) => {yy,cc}:xx) &
                     (xx=POW(ID) => {yy,aa,bb}:xx) &
                     (xx=POW(ID) => {yy,aa,cc}:xx) &
                     (xx=POW(ID) => {yy,aa,bb,cc}:xx) &
                     (card(xx) < card(POW(ID)) <=> (xx /= POW(ID)))));
   iv /= cc // sometimes false
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

/*
==> !xx.(xx : POW(POW(ID)) => card(xx) <= card(POW(ID)))
TRUE
TRUE  (0 ms + 0 ms = 0 ms)
=======
SUMMARY
=======
1 predicates: 1 TRUE, 0 FALSE, 0 UNKNOWN (0 timeouts)
1350 ms to analyse
Checking Dynamic Assertions
=======
SUMMARY
=======
0 predicates: 0 TRUE, 0 FALSE, 0 UNKNOWN (0 timeouts)
0 ms to analyse

*/
