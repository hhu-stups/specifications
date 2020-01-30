MACHINE DeferredSetSurjectionTest
SETS
 ID={aa,bb,cc,dd} ; ID2 = {aa2} ; ID3 ; ID4 ; ID5 ; ID6 ; ID7
DEFINITIONS
 scope_ID3 == 3 // {"a","b","C"}
CONSTANTS iv, surj4, surj3, ff,gg,hh,ii
PROPERTIES
 iv:ID &
 surj4 : ID4 -->> (ID*ID) // test that ProB sets the sizes correctly
 &
 surj3 : ID5 +->> 11..16
 & // also test that we detect that card(ID6) >= 4
  ff:ID6 & gg:ID6 & hh:ID6 &
 {ff,gg} /= {ff,hh} & // hh /= gg
 {hh,ii} /= {gg,hh} & // gg /= ii
 {hh} /= {ff} &
 {ff} /= {ii} & 
 ff /= gg &
 hh /= ii
 &
 // also test that we can compute this expression:
 card(ID7) = (2*card(ID) + MAXINT - MININT) + -(MAXINT - MININT) / (card(ID2))
END

