MACHINE StateExplosion
CONSTANTS
       mx
PROPERTIES
       mx: NAT & mx = 3
VARIABLES
       vrel
INVARIANT
       vrel: (-mx..mx) <-> (-mx..mx)
INITIALISATION
       ANY rr WHERE rr: (-mx..mx) <-> (-mx..mx) & rr =  %xx.(xx:(-mx..mx)|mx) THEN
         vrel := rr~
       END
OPERATIONS
      invert = BEGIN vrel := vrel~ END;
      reset(rr) = PRE rr: (-mx..mx) <-> (-mx..mx) & 
                      dom(rr) = {0} & card(rr) = 1 THEN vrel := rr END
END