MACHINE EnumSetLookups
/* number of states 9*9*9*6 = 4374 */
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 10
SETS
  A = {a1,a2,a3,a4,a5,a6,a7,a8,a9};
  B = {b1,b2,b3,b4,b5,b6,b7,b8,b9};
  C = {c1,c2,c3,c4,c5,c6,c7,c8,c9};
  D
PROPERTIES card(D) = 6
VARIABLES x,y,z,v
INVARIANT
 x:A & y:B & z:C & v:D
INITIALISATION
 x,y,z := a1,b1,c1 || v::D
OPERATIONS
  SetX =
    IF x:{a1,a2,a3,a4,a5} THEN
       x::{a6,a7,a8,a9}
    ELSE
       x::{a2,a3,a4,a5}
    END;
  SetY =
    IF y:{b1,b2,b3,b4,b5} THEN
       y::{b6,b7,b8,b9}
    ELSE
       y::{b2,b3,b4,b5}
    END;
  SetZ =
    IF z:{c1,c2,c3,c4,c5} THEN
       z::{c6,c7,c8,c9}
    ELSE
       z::{c2,c3,c4,c5}
    END
END