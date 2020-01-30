
MACHINE MM
CONCRETE_CONSTANTS
  y1__Y1__T_,
  y1__Y1__init,
  x1__X1__T_,
  x1__X1__init,
  y1__Y1__T_,
  y1__Y1__init,
  x1__X1__T_,
  x1__X1__init
ABSTRACT_VARIABLES
  a1__x1__v1,
  a1__x1__y1__vy1,
  a2__v2,
  a2__vy2,
  b1__x1__v1,
  b1__x1__y1__vy1,
  b2__v2,
  b2__vy2
/* PROMOTED OPERATIONS
  op1,
  op2,
  op3,
  op4,
  a1__x1__opx1,
  a2__opx2 */
/* NOT PROMOTED OPERATIONS
  a1__opa1,
  a1__x1__y1__opy1,
  a2__opa2,
  a2__opy2,
  b1__opb1,
  b1__x1__opx1,
  b1__x1__y1__opy1,
  b2__opb2,
  b2__opx2,
  b2__opy2 */
PROPERTIES
    x1__X1__T_ = {0,1}
  & x1__X1__init = 0
  & y1__Y1__T_ = x1__X1__T_
  & y1__Y1__init = x1__X1__init
  & x1__X1__init : x1__X1__T_
  & y1__Y1__init : y1__Y1__T_
  & x1__X1__T_ = {2,3}
  & x1__X1__init = 2
  & y1__Y1__T_ = x1__X1__T_
  & y1__Y1__init = x1__X1__init
  & x1__X1__init : x1__X1__T_
  & y1__Y1__init : y1__Y1__T_
INVARIANT
    a1__x1__v1 : INT
  & a1__x1__y1__vy1 : y1__Y1__T_
  & a2__v2 : INT
  & a2__vy2 : INT
  & b1__x1__v1 : INT
  & b1__x1__y1__vy1 : y1__Y1__T_
  & b2__v2 : INT
  & b2__vy2 : INT
INITIALISATION
    BEGIN
        a1__x1__y1__vy1 := y1__Y1__init
      ;
        b1__x1__y1__vy1 := y1__Y1__init
      ;
        a2__vy2 := 0
      ;
        b2__vy2 := 0
      ;
        a1__x1__v1 := 0
      ;
        b1__x1__v1 := 0
      ;
        a2__v2 := 0
      ;
        b2__v2 := 0
      ;
        skip
    END
OPERATIONS
  op1 = 
    skip;
  
  vv <-- op2 = 
    vv :: INTEGER;
  
  op3 = 
    skip;
  
  vv <-- op4 = 
    vv :: INTEGER;
  
  a1__opa1 = 
    skip;
  
  a1__x1__opx1 = 
    skip;
  
  a1__x1__y1__opy1 = 
    skip;
  
  a2__opa2 = 
    skip;
  
  vv <-- a2__opx2 = 
    vv :: INTEGER;
  
  vv <-- a2__opy2 = 
    vv :: INTEGER;
  
  b1__opb1 = 
    skip;
  
  b1__x1__opx1 = 
    skip;
  
  b1__x1__y1__opy1 = 
    skip;
  
  b2__opb2 = 
    skip;
  
  vv <-- b2__opx2 = 
    vv :: INTEGER;
  
  vv <-- b2__opy2 = 
    vv :: INTEGER
END
