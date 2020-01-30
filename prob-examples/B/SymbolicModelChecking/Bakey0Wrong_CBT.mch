MACHINE Bakery0_CBT
 /* rewritten so that CBC Test case generation algorithm performs symbolic MC */
 /* CBC Test Algorithm finds enter1; leave1 counter example in 50 ms */
 /* you can use the following to find an invariant violation:
     probcli Bakey0Wrong_CBT.mch -cbc_tests 99 '1=1' 'cbc.xml' -cbc_cover INVARIANT_VIOLATED
    on the original you can use:
	probcli Bakery0Wrong.mch -cbc_tests 5 'not(aa:0..2)' 'cbc.xml'
	However, the latter will continue looking to find invariant violations after every event
*/
 DEFINITIONS INV == (aa:0..2)

ABSTRACT_VARIABLES  aa

INVARIANT  aa:INTEGER

INITIALISATION aa:=0

OPERATIONS
    INVARIANT_VIOLATED = SELECT not(INV) THEN skip END;
    
	enter1 = SELECT aa=0 & INV THEN aa:=1 END ;
	enter2 = SELECT aa=0 & INV  THEN aa:=2 END ;
	leave1 = SELECT aa=1 & INV  THEN aa:=0 END ;
	leave2 = SELECT aa=2 & INV THEN aa:=3 END ;
	try1 = SELECT INV THEN skip END;
	try2 = SELECT INV THEN skip END
END





