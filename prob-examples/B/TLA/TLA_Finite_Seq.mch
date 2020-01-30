MACHINE TLA_Finite_Seq
/* Below we test how finiteness is encoded in TLA; the ProB enumeration
   does not work very well with this; it has to be improved */
SETS
 Resources={r1,r2}
DEFINITIONS SET_PREF_MAXINT == 200
CONSTANTS s
PROPERTIES
  s:seq(Resources) & !r.(r:Resources => #n.(n:1..size(s) & s(n)=r))
OPERATIONS
  r <--GetResource(yy) = PRE yy:dom(s) THEN r:= s(yy) END
END

