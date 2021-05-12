MACHINE controller_v2
/* change to version v1: setting pump now also has a delay */
SETS
    PC = {read, compute, write}

VARIABLES
        fmiLevel,
        ctrl_level , ctrl_pump, 
        time  ,
        pump ,
        pc  

CONSTANTS 
   High, Low, ReadDelay, WriteDelay, ComputeDelay

PROPERTIES
   High = 7000 & Low = 4000 & ReadDelay = 20 & WriteDelay= 20 &  ComputeDelay = 100          

INVARIANT
         time : 0..12000 &
         pump : BOOL & ctrl_pump: BOOL &
         ctrl_level : 0..20000 &
         fmiLevel : NATURAL &
         pc : PC
INITIALISATION 
                time :=  0 ||
                ctrl_level :=  0  ||
                pump ::  BOOL  || ctrl_pump := FALSE ||
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
                   ctrl_pump := TRUE
                 ELSIF ctrl_level >= High THEN
                    ctrl_pump := FALSE
                 END
                 || pc := write || time := time + ComputeDelay
             END;
    setPump = SELECT pc = write 
        THEN
              pump :=  ctrl_pump ||
              time :=  time + WriteDelay ||
              pc :=  read 
        END

    END
