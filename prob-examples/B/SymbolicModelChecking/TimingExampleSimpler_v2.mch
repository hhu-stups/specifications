MACHINE TimingExampleSimpler_v2
/* This version does not use min compared to TimingExampleSimpler; this makes a big difference for CBC-test case generation

  standard model checking has trouble finding counter examples:
  
 With TLC (2 workers) it takes 1-2 seconds to find counter example of length 16
 ProB takes 2 secs (with SET_PREF_MAX_INITIALISATIONS == 101 
 CBC takes 2 seconds
 
*/
CONSTANTS mxc, mxe
PROPERTIES
 mxc : 1..10 & mxe : 1..10
DEFINITIONS
  INV == (timer_c : NATURAL & timer_e : NATURAL &
          timer_c - timer_e < 50 & pc:0..2);
  INV0 == (timer_c - timer_e < 50)
VARIABLES timer_c, timer_e, pc
INVARIANT
 INV
INITIALISATION timer_c,timer_e := 0,0 || pc := 0
OPERATIONS
  IncTc(v) = SELECT pc=0 & v: 1..mxc THEN timer_c := timer_c + v || pc:=1 END;
  IncTe(v) = SELECT pc=1 & v: 1..mxe THEN timer_e := timer_e + v || pc:=2 END;
  Tick1(v) = SELECT v = timer_c & timer_c < timer_e  &  pc=2 THEN
      timer_c, timer_e := timer_c-v, timer_e-v || pc:=0 END;
  Tick2(v) = SELECT v = timer_e & timer_c >= timer_e &  pc=2 THEN
      timer_c, timer_e := timer_c-v, timer_e-v || pc:=0 END
END

