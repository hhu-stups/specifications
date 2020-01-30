MACHINE RandomEnumeration
DEFINITIONS 
  SET_PREF_RANDOMISE_ENUMERATION_ORDER == TRUE;
  SET_PREF_MAX_INITIALISATIONS == 1
SETS
 ID={aa,bb,cc}
CONSTANTS f1,f2,f3,f4, x,y,z
PROPERTIES
 f1: 1..200 --> ID &
 f2: 1..200 --> BOOL &
 f3: 1..150 --> 1..10 &  /* only seems to use 4,7,9 ! */
 f4: 1..150 --> {2,3,5,7,11,13} &
 (x,y,z) : (1..20000) * (1..20000) * (1..20000)
ASSERTIONS
 /* assertions which check that we have not used the non-random enumeration */
 /* these assertions have very low likelyhood to fail if enumeration is indeed random */
 card(ran(f1))>1 &
 ran(f2) = BOOL &
 card(ran(f3))>2 &
 card(ran(f4))>1 &
 (x>1 or y>1 or z>1)
END

