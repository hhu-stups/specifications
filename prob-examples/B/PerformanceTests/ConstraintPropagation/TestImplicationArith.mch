MACHINE TestImplicationArith
DEFINITIONS SET_PREF_MAXINT == 128
CONSTANTS a,b,c,d
PROPERTIES
 a: NAT1 & b:NAT & c:NAT & d:NAT &
 (a>1 => b=2) &
 (b>2 => c=3) &
 (c>=3 => d=4) &
 (a<MAXINT => b=3) &
 (b<=2 => c=4)
OPERATIONS
  ABCD(x,y,z,v) = PRE x=a & y=b & z=c & v=d  THEN skip END;
  Find(x) = PRE x /=a & x/=b & x/=c & x/=d THEN skip END
END

