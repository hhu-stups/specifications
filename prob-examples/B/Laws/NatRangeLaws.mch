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
  xx..zz = {nn | nn:INT & nn>=xx & nn<=zz}&
  NAT1 = 1..MAXINT &
  NAT = 0..MAXINT &
  INT = MININT..MAXINT &
  NAT - NAT1 = {0} &
  NAT1 - NAT = {} &
  NAT \/ NAT1 = NAT &
  NAT1 <<: NAT & NAT <<: INT &
  (xx>=zz =>  zz..MAXINT = zz..xx \/ xx+1..MAXINT) &
  card(0..xx) = xx+1 &
  card(1..MAXINT) = MAXINT &
  min(-1..xx) = -1 & max(-1..xx) = xx &
  (xx..zz = {}  <=>  zz < xx) &
  (xx..zz /= {}  <=>  zz >= xx) &
  (#v.(v:xx..zz)  <=>  zz >= xx) &
  !v.(v:xx..zz => v>=xx & v <= zz) &

  xx..(xx-1) <: xx..zz &
  xx..zz <: xx..zz &
  xx..zz <: xx..(zz+1) &
  (xx+1)..zz <: xx..zz &
  xx..(zz-1) <: xx..zz &
  (xx+1)..(zz-1) <: xx..zz &
  (xx<=zz => (  xx..zz <: xx..(zz+1) &
               (xx+1)..zz <<: xx..zz &
                xx..(zz-1) <<: xx..zz &
               (xx+1)..(zz-1) <<: xx..zz)) &

  ( xx..zz <: zz..xx <=> zz<=xx) &
  ( xx..zz <<: zz..xx <=> zz<xx) &

  perm(NAT1) = perm(1..MAXINT) &
  %i.(i:NAT1|i) : perm(NAT1)

INITIALISATION xx:=0 || zz:=0
OPERATIONS
 Setxx(yy) = PRE yy:NAT THEN xx:= yy END;
 Setzz(yy) = PRE yy:INT THEN zz:= yy END;
 r <-- Cardxxzz = r := card(xx..zz)
END
