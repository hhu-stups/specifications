MACHINE Hanoi
SETS
 Stakes
DEFINITIONS
 GOAL == (!s.(s:Stakes & s/=dest => on(s) = <>));
/* 12.35 secs on PPC G4 1.25 GHz to find GOAL with hash_markers; 75 seconds on Alloy4 */
/* 0.67 secs on MBP 3.06 GHz wo symmetry using ProB 1.3.2-rc1
   0.330 secs
   5912 ms + 119ms with Alloy 4.1.10 and minisat */
 HEURISTIC_FUNCTION1 == card(on[Stakes-{dest}]);
 HEURISTIC_FUNCTION == (SIGMA(z).(z:ran(on(orig))|z) - SIGMA(z).(z:ran(on(dest))|z) );
 SET_PREF_SYMBOLIC == FALSE;
 scope_Stakes == 1..3;

 ANIMATION_IMG0 == "images/Disc_empty.gif";
 ANIMATION_IMG1 == "images/Disc1.gif";
 ANIMATION_IMG2 == "images/Disc2.gif";
 ANIMATION_IMG3 == "images/Disc3.gif";
 ANIMATION_IMG4 == "images/Disc4.gif";
 ANIMATION_IMG5 == "images/Disc5.gif";
 ANIMATION_FUNCTION == ({r,c,i|r:1..nrdiscs & c:Stakes & i=0} <+
                        {r,c,i|r:1..nrdiscs & c:Stakes & r-5+size(on(c)): dom(on(c)) &
                               i = on(c)(r-5+size(on(c))) }
                       )
CONSTANTS orig,dest,nrdiscs
PROPERTIES
 orig: Stakes & dest:Stakes & orig /= dest & card(Stakes) = 3
 & nrdiscs = 5
VARIABLES on
INVARIANT
 on : Stakes --> iseq(1..nrdiscs) & #s.(s:Stakes & on(s) /= <>) 
INITIALISATION 
  on := %s.(s:Stakes & s /= orig | <>) \/ {orig |-> %x.(x:1..nrdiscs|x)}
OPERATIONS
  Move(from,to,disc) = PRE from:Stakes & on(from) /= <> &
                           to:Stakes & to /= from &
                           disc:NATURAL1 & disc = first(on(from)) &
                           (on(to) /= <> =>  first(on(to))> disc )
                       THEN
     on := on <+ { from |-> tail(on(from)), to |-> (disc -> on(to)) }
  END
END

