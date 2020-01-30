MACHINE Login
SETS User
PROPERTIES
  card(User) = 15
 /* User = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} */
DEFINITIONS
 Init == x = {};

VARIABLES x
INVARIANT
 x : POW(User)
INITIALISATION
 x:(Init)
OPERATIONS
 Login_Op = ANY x_n
	WHERE x /= User & #u.(u : User - x & x_n = x \/ {u})
	THEN x := x_n END;

 Logout_Op(u) = PRE x /= {} & u : x THEN ANY x_n WHERE x_n = x - {u} THEN
          x := x_n END END
END
/* Created Fri Jan 13 15:51:23 CET 2012 by TLA2B */