MACHINE IceCream2SAT
/* A mis-interpretation of the IceCream_kSAT problem; still useful as a test case though ;-) */
DEFINITIONS
 i(Nr) == ice(Nr)=TRUE
CONSTANTS ice, pegs
PROPERTIES
 ice : 1..24 --> BOOL &
 
 pegs = card(ice~[{TRUE}]) &  /* propagation here is not yet ideal: image will wait until first argument can be determined before moving to second argument, ... */
 pegs <16 &  /* minimal solution requires 15 pegs */

 (i(1) or i(2)) &
 (i(1) or i(4)) &
 (i(2) or i(3)) &
 (i(3) or i(4)) &
 (i(3) or i(5)) &
 (i(3) or i(7)) &
 (i(4) or i(7)) &
 (i(5) or i(6)) &
 (i(5) or i(9)) &
 (i(6) or i(7)) &
 (i(6) or i(8)) &
 (i(7) or i(8)) &
 (i(8) or i(10)) &
 (i(8) or i(13)) &
 (i(9) or i(10)) &
 (i(9) or i(11)) &
 (i(9) or i(12)) &
 (i(11) or i(12)) &
 (i(11) or i(14)) &
 (i(12) or i(13)) &
 (i(13) or i(16)) &
 (i(14) or i(15)) &
 (i(14) or i(17)) &
 (i(15) or i(16)) &
 (i(15) or i(17)) &
 (i(15) or i(18)) &
 (i(15) or i(21)) &
 (i(16) or i(18)) &
 (i(16) or i(19)) &
 (i(17) or i(19)) &
 (i(18) or i(19)) &
 (i(18) or i(20)) &
 (i(18) or i(21)) &
 (i(19) or i(20)) &
 (i(19) or i(21)) &
 (i(20) or i(21)) &
 (i(21) or i(22)) &
 (i(21) or i(23)) &
 (i(21) or i(24)) &
 (i(22) or i(23)) &
 (i(22) or i(24)) &
 (i(23) or i(24))  
OPERATIONS
  r <-- NrPegs = BEGIN r :=pegs END;
  r <-- Get(yy) = PRE yy:dom(ice) THEN r := ice(yy) END
END

