MACHINE Goldbach
DEFINITIONS
  prime(x) == x>1 & !y.(y:NATURAL & y>1 & y<x => x mod y /= 0);
  SET_PREF_MAXINT == 16
OPERATIONS
  GoldbachNumber(x,p1,p2) = SELECT x:NATURAL & x mod 2 = 0 & x>2 &
         p1<x & p2<x & p1<=p2 & prime(p1) & prime(p2) & x = p1+p2 THEN
  skip
 END;
  NotGoldbachNumber(x) = SELECT x:NATURAL & x mod 2 = 0 & x>2 &
      !(p1,p2).(p1<x & p2<x & p1<=p2 & prime(p1) & prime(p2) => x /= p1+p2) THEN
  skip
 END
     
END

