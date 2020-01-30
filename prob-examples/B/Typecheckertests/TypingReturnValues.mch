MACHINE TypingReturnValues
CONSTANTS 
        partition 
PROPERTIES 
        partition = 
        %(ee, nn).(ee : POW (NATURAL) & nn : NATURAL | {uu | uu : ee & uu <= nn} |-> {vv | vv : ee & nn < vv}) 
CONCRETE_VARIABLES 
        tab 
INVARIANT 
        tab : 1..50 --> NAT 
INITIALISATION 
        tab := 
      [27,74,17,33,94,18,46,83,65,2,32,53,28,85,99,47,28,82,6,11,55,29,39,81,90,37,10,0,66,51,7,21,85,27,31,63,75,4,95,99,11,28,61,74,18,92,40,53,59,8] 
OPERATIONS 
        xx, yy <-- TRIER = 
        PRE 
                xx : POW (NAT) 
        &        yy : POW (NAT) 
        THEN 
                ANY 
                        aa, bb 
                WHERE 
                        aa |-> bb = partition (ran (tab), 27) 
                THEN 
                        xx, yy := aa, bb 
                END 
        END 
END 