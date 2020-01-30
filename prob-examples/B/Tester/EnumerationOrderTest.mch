MACHINE EnumerationOrderTest
DEFINITIONS
 SET_PREF_MAXINT == 5;
 MYMI == 3;
 SET_PREF_MAXOPERATIONS == 7
CONSTANTS v,w
PROPERTIES v:NAT1 & w:NAT1 & w:{1,2,3}
OPERATIONS
  res <-- MUL(x,y) = PRE x:NAT1 & y:NAT1 THEN res:= x*y END;
  res <-- MUL2(x,y) = PRE x:NAT1 & y:NAT1 & y <= MYMI THEN /* KEEPS SAME ENUMERATION ORDER */
     res:= x*y END  ;
  res <-- MUL3(x,y) = PRE x:NAT1 & y:NAT1 & y:{1,2,3} /* Does not seem to force y to be enumerated
           before x ! */
       THEN res:= x*y END
END

