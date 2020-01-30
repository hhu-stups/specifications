MACHINE PartialSets
SETS
 Els
DEFINITIONS
 PartialSet == struct(def:POW(Els),maybe:POW(Els));
 pset(x) == (x:PartialSet &
             x'def /\ x'maybe = {});
 gamma(r) == {xx|xx:POW(Els) & xx <: (r'def \/ r'maybe) & r'def<:xx}
CONSTANTS x,y
PROPERTIES 
 pset(x) & pset(y)
VARIABLES r,g
INVARIANT
 pset(r) & g:POW(POW(Els))
INITIALISATION r:= rec(def:{},maybe:{}) || g:= {}
OPERATIONS
  punion = /* computes x \/ y */
    r:= rec(def:(x'def \/y'def),
        maybe:(x'maybe \/y'maybe - (x'def \/y'def)));
  compute_gamma =
    g:= gamma(r);
  compuge_gamma_xuniony =
    g := gamma(x) \/ gamma(y);
  pdiff =  /* computes x - y */
    r:= rec(def:(x'def - (y'def \/ y'maybe)),
            maybe:(x'maybe - y'def))
END

