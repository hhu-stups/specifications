MACHINE Power2Nr
SETS
 obj = {o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11}
CONSTANTS
 nr
PROPERTIES
 nr : obj >-> 1..(2**card(obj)) &
 !i.(i:obj => #j.(j:1..card(obj) & nr(i)=2**j)) &
 nr(o1) < nr(o2) & nr(o2) < nr(o3) & nr(o3) < nr(o4) & nr(o4) < nr(o5) &
 nr(o5) < nr(o6) & nr(o6) < nr(o7) & nr(o7) < nr(o8) & nr(o8) < nr(o9) &
 nr(o9) < nr(o10) & nr(o10) < nr(o11)
OPERATIONS
 r <-- GetNr(o) = PRE o:obj THEN r:= nr(o) END
ASSERTIONS
 nr(o1) = 2**1;
 nr(o2) = 2**2;
 nr(o3) = 2**3;
 nr(o11) = 2**11
END