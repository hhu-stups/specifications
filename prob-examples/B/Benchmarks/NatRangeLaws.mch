MACHINE NatRangeLaws
DEFINITIONS
  SET_PREF_MAXINT == 4
VARIABLES xx,zz
INVARIANT
 xx:NAT & zz:INT &
 xx: xx..xx+1 &
 xx: xx..xx &
 xx: xx-1..xx &
 (xx<zz <=>  xx:0..zz-1) &
 (xx<=zz <=>  xx:0..zz) &
 card(xx..xx) = 1 & card(xx..xx-1) = 0 &
 card(xx..xx+1) = 2 &
 (xx>zz <=> card(xx..zz) = 0) &
 (xx<=zz => card(xx..zz) = zz-xx+1) &
 (xx<1 => {} : 1..xx --> INTEGER) &
 {} : 1..0 --> INTEGER &
  xx..zz = {nn | nn:INT & nn>=xx & nn<=zz} &
  NAT1 = 1..MAXINT &
  NAT = 0..MAXINT &
  INT = MININT..MAXINT &
  NAT - NAT1 = {0} &
  NAT1 - NAT = {} &
  NAT \/ NAT1 = NAT &
  NAT1 <<: NAT & NAT <<: INT &
  (xx>=zz =>  zz..MAXINT = zz..xx \/ xx+1..MAXINT)
INITIALISATION xx:=0 || zz:=0
OPERATIONS
  Setxx(yy) = PRE yy:NAT THEN xx:= yy END;
  Setzz(yy) = PRE yy:INT THEN zz:= yy END;
  r <-- Cardxxzz = r := card(xx..zz) /* ;
  r2 <-- XtoZ = r2:= {nn | nn:INT & nn>=xx & nn<=zz};
  r2 <-- XtoZ2 = r2:= xx..zz */
END

