MACHINE controller_v3
/* change to version v2: setting pump works concurrently to controller */
VARIABLES
        fmiLevel,
        ctrl_level , ctrl_pump,
        write_time, read_time, compute_time,
        pump, time

CONSTANTS 
   High, Low, ReadDelay, WriteDelay, ComputeDelay

PROPERTIES
   High = 700 & Low = 400 & ReadDelay = 1 & WriteDelay= 3 &  ComputeDelay = 2          

INVARIANT
         time : 0..12000 &
         pump : BOOL & ctrl_pump: BOOL &
         ctrl_level : 0..20000 &
         fmiLevel : NATURAL &
         read_time: INTEGER & write_time : INTEGER & compute_time : INTEGER
INITIALISATION 
                time :=  0 ||
                ctrl_level :=  0  ||
                pump ::  BOOL  || ctrl_pump := FALSE ||
                fmiLevel :: NATURAL  ||
                read_time :=0  || write_time := -1 || compute_time := -1

OPERATIONS

    fmiUpdateInputs(level) =
            PRE   level : NATURAL
            THEN
                  fmiLevel :=  level
            END;
    readLevel = SELECT time = read_time 
        THEN
              ctrl_level :=  fmiLevel ||
              read_time :=  -1 ||
              compute_time :=  time+ReadDelay 
        END;
    switch = SELECT time=compute_time THEN
                 IF ctrl_level <= Low THEN
                   ctrl_pump := TRUE
                 ELSIF ctrl_level >= High THEN
                    ctrl_pump := FALSE
                 END
                 || read_time := time + ComputeDelay
                 || write_time := time + WriteDelay  /* it takes some time for the pump to react */
                 /* what is not modelled: what if before WriteDelay expires the controller decides to stop the pump ? e.g. emergency stop */
                 || compute_time := -1
             END;
    setPump = SELECT time=write_time 
        THEN
              pump :=  ctrl_pump ||
              write_time :=  -1 
        END;
    tick = SELECT time /: {read_time, compute_time, write_time} THEN
       time := time+1
    END
    END
