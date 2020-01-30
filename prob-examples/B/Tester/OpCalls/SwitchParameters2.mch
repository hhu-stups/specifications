MACHINE SwitchParameters2
// Test that we can switch parameter names and types wrt called operation
INCLUDES SwitchParameters1
OPERATIONS
// p,q,r <-- div3(x) = PRE x:NAT THEN p := x /3 ; q := x mod 3 ; r := bool(q=0) END

 p,q,r <-- div3_v1(x) = PRE x:0..4 THEN p,q,r <-- div3(x) END;
 p,q,r <-- div3_v2(x) = PRE x:0..4 THEN r,p,q <-- div3(x) END;
 p,q,x <-- div3_v3(r) = PRE r:0..4 THEN x,p,q <-- div3(r) END

END

