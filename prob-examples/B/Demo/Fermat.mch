MACHINE Fermat

VARIABLES  sols

DEFINITIONS
    Base == 1..6;
    Exp == 1..3

INVARIANT  sols: POW(NAT)

INITIALISATION sols:={}

OPERATIONS

  test(nn) =
        PRE
          nn:Exp
        THEN
          sols := sols \/ {nn**2}
        END;
             
  add(nn,n1,n2,exp) =
		PRE
			nn:Base & n1:Base & n2:Base & exp: Exp & exp>1 &
			nn ** exp = (n1**exp + n2**exp)
		THEN
			sols := sols \/ { nn }
		END;
		
  add2(nn,n1,n2,exp) =
		PRE
			nn:Base & n1:Base & n2:Base & exp: Exp & exp>2 &
			nn ** exp = (n1**exp + n2**exp)
		THEN
			sols := sols \/ { nn }
		END	
END

