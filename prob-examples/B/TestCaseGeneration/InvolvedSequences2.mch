MACHINE InvolvedSequences2
 /* Try and find sequence Op1;Op2;Op3;Target3 */
CONSTANTS mx
PROPERTIES
 mx:INTEGER
VARIABLES x,y,z,s
INVARIANT
 x:INT & y:INT & z:INT & s<:INT
INITIALISATION x::INT || y::INT || z::NAT || s:= {}
OPERATIONS
  Op1 = IF x < mx-10 THEN
            s := s \/ {x}
        END;
  Op2 = IF y < x-1 THEN
            s := s \/ {y}
        ELSE
             s := {y}
        END;
  Op3 = IF z < y THEN
             s := s \/ {z}
        ELSE
           s := {z}
        END;
  Target = SELECT s = {x,y,z} THEN skip END;
  Target3 = SELECT card(s) = 3 THEN skip END
END

