MACHINE SequenceSolving
DEFINITIONS
 SET_PREF_MAXINT == 3;
 SET_PREF_MININT == -1
/* Check whether constraint solving over sequences powerful enough to 
   derive solutions without enumerating */
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Solve0(x) = PRE [1]^x = rev([55,66,77,88,99,2,3,1]) THEN skip END;
  Solve0_b(x) = PRE [1]^x = rev(rev(rev([55,66,77,88,99,2,3,1]))) THEN skip END;
  Solve1(x,y) = PRE ([y]^[1])^x = rev([55,33,2,1,3]) THEN skip END;
  Solve2(x,y) = PRE ([y]^[1])^x = [155,1,3,77,88,99] THEN skip END;
  Solve3 = PRE not(#(x,y).(([y]^[1])^x = rev([55,33,2,1,3,77,88,99]))) THEN skip END;
  Solve4(x) = PRE conc([[1,22],x,[5,6,77,88]]) = [1,22,33,4,5,6,77,88] THEN skip END; 
  Solve5(x) = PRE conc([[1,22],x,[77,88]]) = [1,22,33,4,5,6,77,88] THEN skip END; 
  Solve6 = PRE not(#x.(conc([[1,22],x,[77,88]]) = [1,2,33,4,5,6,77,88])) THEN skip END;

/* does not work yet: */
  Solve7(x) = PRE x/=<> & front(x)=[1,2,3,4] THEN skip END
/*
   #x.(x^x = [1,2,3,44,1,2,3,44])
   #x.(front(x)=[1,2,3,4])
 */
END


