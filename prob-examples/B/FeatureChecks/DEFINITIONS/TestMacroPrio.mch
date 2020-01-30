/* TestMacroPrio
 * Author: Michael Leuschel
 * Creation date: Thu Jul 15 2010
 */
MACHINE
    TestMacroPrio
DEFINITIONS
    sm(x,y) == x+y
ASSERTIONS
    sm(1,1)*2 = 4; /* (1+1)*2 = 4 TRUE in ProB, FALSE in Atelier B */
    sm(1,1)*2 = 3  /* 1+1*2 = 3 FALSE in ProB, TRUE in Atelier B */
OPERATIONS
 r <-- Get4 = BEGIN r:= sm(1,1)*2 END
END