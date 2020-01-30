MACHINE seq_test

SETS
  ALPH = {a,b,c}
  
VARIABLES
  hist
  
INVARIANT
  hist: seq(ALPH)
  
INITIALISATION
  hist := []
  
 OPERATIONS
 
   add(nn) = PRE nn: ALPH THEN hist := hist^[nn] END;
   
   get(nr,el) = PRE nr: NAT & el: ALPH & nr|->el : hist THEN skip END;
   
   res <-- get1 = PRE hist /= [] THEN 
                      ANY cc WHERE cc:hist /* & cc: NAT*ALPH */
                  THEN res := cc END
                  END;
                  
   get2(nr,el) = PRE nr:NAT & el:ALPH & hist(nr) = el THEN skip END;
   get3(nr,els) = PRE nr:NAT & nr>1 & els:POW(ALPH) & hist[{nr,nr-1}] = els THEN skip END;
   
   in_dom(el) = PRE el:ALPH & el : ran(hist) THEN skip END;
   
   not_dom(el) = PRE el:ALPH & el /: ran(hist) THEN skip END;
   
   notget3(nr,el) = PRE nr: NAT & nr>0 & nr<3 & el: ALPH & nr|->el /: hist THEN skip END;
   
   is_permutation = PRE hist: perm(ALPH) THEN skip END;
   not_is_permutation = PRE not(hist: perm(ALPH)) THEN skip END
 END