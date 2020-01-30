MACHINE Hanoi8Sym /* with Symmetry */
/* a version of Hanoi where we have no orig Stake and can hence exploit symmetry */
SETS
 Stakes
DEFINITIONS
 DISCS == 8;
 GOAL == (!s.(s:Stakes & s/=dest => on(s) = <>));
/* 23.05 seconds with Prob 1.3.2-rc3, 5 seconds with Hash Symmetry, normal mode */
 SET_PREF_SYMBOLIC == FALSE;
 scope_Stakes == 1..3;

 ANIMATION_IMG0 == "images/Disc_empty.gif";
 ANIMATION_IMG1 == "images/Disc1.gif";
 ANIMATION_IMG2 == "images/Disc2.gif";
 ANIMATION_IMG3 == "images/Disc3.gif";
 ANIMATION_IMG4 == "images/Disc4.gif";
 ANIMATION_IMG5 == "images/Disc5.gif";
 ANIMATION_IMG6 == "images/Disc6.gif";
 ANIMATION_IMG7 == "images/Disc6.gif";
 ANIMATION_IMG8 == "images/Disc6.gif";
 ANIMATION_FUNCTION == ({r,c,i|r:1..nrdiscs & c:Stakes & i=0} <+
                        {r,c,i|r:1..nrdiscs & c:Stakes & r-DISCS+size(on(c)): dom(on(c)) &
                               i = on(c)(r-DISCS+size(on(c))) }
                       );
  ALLDISCS == %x.(x:1..nrdiscs|x)
CONSTANTS dest,nrdiscs
PROPERTIES
 dest:Stakes &  nrdiscs = DISCS
VARIABLES on
INVARIANT
 on : Stakes --> seq(INTEGER)
INITIALISATION 
  on : ( on: Stakes --> {<>,ALLDISCS} &
         on(dest)=<> & #s.(s/=dest & on(s)=<>) & #orig.(on(orig)=ALLDISCS) )
  /* was in non-symmetry model:  %s.(s:Stakes & s /= orig | <>) \/ {orig |-> %x.(x:1..nrdiscs|x)} */
OPERATIONS
  Move(from,to,disc) = PRE from:Stakes & on(from) /= <> &
                           to:Stakes & to /= from &
                           disc:NATURAL1 & disc = first(on(from)) &
                           (on(to) /= <> =>  first(on(to))> disc )
                       THEN
     on := on <+ { from |-> tail(on(from)), to |-> (disc -> on(to)) }
  END
END

