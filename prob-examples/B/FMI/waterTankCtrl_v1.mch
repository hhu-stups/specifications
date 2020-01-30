MACHINE controller 
SETS
    PC = {read, compute}

VARIABLES
        fmiLevel,
        ctrl_level ,
        time  ,
        pump ,
        pc  

CONSTANTS 
   High, Low, ReadDelay, ComputeDelay

PROPERTIES
   High = 7000 & Low = 4000 & ReadDelay = 20 &  ComputeDelay = 100          

INVARIANT
         time : 0..12000 &
         pump : BOOL &
         ctrl_level : 0..20000 &
         fmiLevel : NATURAL &
         pc : PC
INITIALISATION 
                time :=  0 ||
                ctrl_level :=  0  ||
                pump :=  FALSE  ||
                fmiLevel :: NATURAL  ||
                pc :=  read  

OPERATIONS

    fmiUpdateInputs(level) =
            PRE   level : NATURAL
            THEN
                  fmiLevel :=  level
            END; 
    readLevel = SELECT pc = read 
        THEN
              ctrl_level :=  fmiLevel ||
              time :=  time + ReadDelay ||
              pc :=  compute 
        END;
    switch = SELECT pc = compute THEN
                 IF ctrl_level <= Low THEN
                   pump := TRUE
                 ELSIF ctrl_level >= High THEN
                    pump := FALSE
                 END
                 || pc := read || time := time + ComputeDelay
             END

    END
