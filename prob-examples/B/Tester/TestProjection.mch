MACHINE TestProjection
 // Test projection onto static assertions
CONCRETE_CONSTANTS
t_Float,
float2int,
x
PROPERTIES
  float2int = %x.(x : t_Float | prj1(INTEGER, INTEGER)(x) * 1 / prj2(INTEGER, INTEGER)(x)) & // causes virtual time-out when attempting expansion
  t_Float = INTEGER * NATURAL1 &
  x : t_Float &
  x = (2,3)

ASSERTIONS
  x : INTEGER * NATURAL
END

/*
PROJECTING on static ASSERTIONS
Static Assertion: x : INTEGER * NATURAL
IDS: [x]
% Searching for valid initial states
project: float2int = %x.(x : t_Float|(prj1(INTEGER,INTEGER)(x) * 1) / prj2(INTEGER,INTEGER)(x)) & t_Float = INTEGER * NATURAL1 & x = 2 |-> 3 & x : t_Float
  on : [x]
*result: float2int = %x.(x : t_Float|(prj1(INTEGER,INTEGER)(x) * 1) / prj2(INTEGER,INTEGER)(x)) & t_Float = INTEGER * NATURAL1 & x = 2 |-> 3 & x : t_Float
  on : [float2int,t_Float,x]

*/
