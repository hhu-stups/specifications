MACHINE Threads51
/* Two simple threads communicating from time to time
This kind of situation should happen quite often in controller systems
A partial-order reduction can hopefully reduce the interleavings
*/
DEFINITIONS
 ASSERT_LTL1 == "F deadlock(Step1_p1,Step1_p2)";
 HEURISTIC_FUNCTION == pc1 // for sfdp colouring
CONSTANTS n
PROPERTIES n = 51 /* n=51: 208 states with POR (deadlock checking), 5410 without */
VARIABLES pc1,pc2, v1,v2
INVARIANT
pc1 : NATURAL & pc2:NATURAL &
v1 :  INTEGER & v2:INTEGER
INITIALISATION pc1,pc2,v1,v2 := 0,0,0,0
OPERATIONS
 Step1_p1 = PRE pc1<n THEN /* maybe the fact that we have a decreasing variant has an influence on POR ? In Event-B this event would be convergent */
     pc1 := pc1+1|| v1 := v1+1
 END;
 Step1_p2 = PRE pc2<n /* & pc1=n manual POR */
             THEN /* also a convergent event (variant n-pc2) */
     pc2 := pc2+1 || v2 := v2+1
 END;
 Sync = PRE pc1=n & pc2=n THEN
    pc1, pc2 := 0,0 ||
    v1,v2 := v1 mod 2, v2 mod 2
 END
END