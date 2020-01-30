MACHINE Login2
SETS
 ENUM1 = {u1, u2, u3, u4, u5, u6, u7, u8, u9, u10}
CONSTANTS User
PROPERTIES
 User = ENUM1
DEFINITIONS
 Init == x = {};

VARIABLES x
INVARIANT
 x : POW(ENUM1)
INITIALISATION
 x:(Init)
OPERATIONS
 Login_Op(u) = ANY x_n
	WHERE u : User - x & 
	 x_n = x \/ {u} & x /= User
	THEN x := x_n END;

 Logout_Op(u) = ANY x_n
	WHERE u : x & 
	 x_n = x - {u} & x /= {}
	THEN x := x_n END
END
/* Created Fri Jan 13 15:51:17 CET 2012 by TLA2B */