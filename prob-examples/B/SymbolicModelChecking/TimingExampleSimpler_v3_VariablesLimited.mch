MACHINE TimingExampleSimpler_v3_VariablesLimited
/* 
This model has no invariant violation;
 TLC runs for 3 seconds generating 110725 distinct states
 
*/
CONSTANTS mxc, mxe
PROPERTIES
 mxc : 1..10 & mxe : 1..10
DEFINITIONS
  INV == (timer_c : NATURAL & timer_e : NATURAL &
          timer_c - timer_e < 50 & pc:0..2);
  INV0 == (timer_c - timer_e < 50);
  LIMIT == 50
VARIABLES timer_c, timer_e, pc, maxcycle
INVARIANT
 INV & maxcycle : 0..5 & timer_e < LIMIT & timer_c < LIMIT
INITIALISATION timer_c,timer_e := 0,0 || pc := 0 || maxcycle := 5
OPERATIONS
  IncTc(v) = SELECT pc=0 & v: 1..mxc &
                    timer_c < LIMIT - v &
                    maxcycle>0
             THEN timer_c := timer_c + v || pc:=1 || maxcycle := maxcycle-1 END;
  IncTe(v) = SELECT pc=1 & v: 1..mxe & timer_e < LIMIT - v  THEN timer_e := timer_e + v || pc:=2 END;
  Tick1(v) = SELECT v = timer_c & timer_c < timer_e  &  pc=2 THEN
      timer_c, timer_e := timer_c-v, timer_e-v || pc:=0 END;
  Tick2(v) = SELECT v = timer_e & timer_c >= timer_e &  pc=2 THEN
      timer_c, timer_e := timer_c-v, timer_e-v || pc:=0 END
END

