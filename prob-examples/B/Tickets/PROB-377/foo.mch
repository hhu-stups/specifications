/*@ generated */
MACHINE foo
DEFINITIONS foo(a) == 1000 * a;
/*@ conversion */ bar(a) == 1000 * a;
/*@ units x "m"
z "m/s" */
VARIABLES x, y, z
INVARIANT /*@ label inv1 */ x <: NAT &
/*@ label "I like longer labels" */ not(3 : x)
INITIALISATION x := /*@ symbolic */
{x|x :NAT & x mod 2 = 0}
|| y := bar(x) * foo(z)
END
