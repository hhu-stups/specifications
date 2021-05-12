MACHINE controller_instaneous
/* a simple controller ; assumes all delays are modelled outside using other
 FMI components */
VARIABLES
        pump
CONSTANTS 
   High, Low
PROPERTIES
   High = 700 & Low = 400      
INVARIANT
         pump : BOOL
INITIALISATION 
                pump :: BOOL
OPERATIONS
    fmiUpdateInputs(level) =
                IF level <= Low THEN
                   pump := TRUE
                 ELSIF level >= High THEN
                    pump := FALSE
                 END
END
