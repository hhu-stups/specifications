MACHINE TimingExample
/* standard model checking has trouble finding counter examples:
  -mixed DF/BF search: aborted after 397 seconds, generated 647101 states (644995 checked) and 1192833 transitions
  -DF strategy also does not find counter example:
problem is limited enumeration of SETUP_CONSTANTS, always chooses mxe > mxc
 setting MAX_INITIALISATIONS to 2501 -> we find counter example using mixed DF/BF after 5 secs (excluding time to compute root node)
 With TLC (2 workers) it takes 344 seconds to find counter example (generated states:
 66038439, distinct states: 7397454)
 
*/
CONSTANTS mxc, mxe
PROPERTIES
 mxc : 1..50 & mxe : 1..50
DEFINITIONS
  INV == (timer_c : NATURAL & timer_e : NATURAL &
          timer_c - timer_e < 100 & pc:0..2);
  INV0 == (timer_c - timer_e < 100)
VARIABLES timer_c, timer_e, pc
INVARIANT
 INV
INITIALISATION timer_c,timer_e := 0,0 || pc := 0
OPERATIONS
  IncTc(v) = SELECT pc=0 & v: 1..mxc THEN timer_c := timer_c + v || pc:=1 END;
  IncTe(v) = SELECT pc=1 & v: 1..mxe THEN timer_e := timer_e + v || pc:=2 END;
  Tick(v) = SELECT v = min({timer_c,timer_e}) &  pc=2 THEN
      timer_c, timer_e := timer_c-v, timer_e-v || pc:=0 END
END

