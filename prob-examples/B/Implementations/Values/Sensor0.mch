/* Sensor0
 * Author: Michael Leuschel
 * Creation date: 22/11/2016
 */
MACHINE
    Sensor0
CONCRETE_CONSTANTS
     LowerBound, UpperBound
PROPERTIES
     LowerBound : NATURAL &
     UpperBound : NATURAL &
     UpperBound >= LowerBound
 VARIABLES val
 INVARIANT val: 1..3 --> NATURAL
 INITIALISATION 
    val := (1..3) * {LowerBound}
 OPERATIONS
      ChangeValue(ii,new) = PRE ii:1..3 & new:NATURAL THEN val(ii) := new END;
      res <-- ValuesOK = IF ran(val) <: LowerBound..UpperBound THEN res := TRUE 
               ELSE res := FALSE END
END