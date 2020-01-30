MACHINE LiftLargeWithLargeCst
CONSTANTS largeset,ls2
PROPERTIES
  largeset = 1..N \/ {N+2} & ls2 = largeset \/ {-2}
DEFINITIONS N == 200000; LIM == 1000
ABSTRACT_VARIABLES  floor

INVARIANT  floor : 0..LIM /* NAT */

INITIALISATION floor := 4

OPERATIONS

	inc = PRE floor<LIM THEN floor := floor + 1 END ;
	
	dec = PRE floor>0 THEN floor := floor - 1 END ;

    impossible = PRE floor =N  THEN floor := card(largeset)-card(ls2) END
END

