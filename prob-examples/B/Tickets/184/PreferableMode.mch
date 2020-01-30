MACHINE PreferableMode
SETS
 MODES = {m1,m2,m3}; MANAGERS = {mg1,mg2}; OBSERVATIONS = {o1,o2,o3}
/* Highlights performance issue in solving constraints: probably due to the fact that expansion of the existential
 quantifiers delays for too long as PreferableMode is not yet instantiated */
CONSTANTS
 PreferableMode
PROPERTIES
PreferableMode : MODES * (MANAGERS --> OBSERVATIONS) -->> MODES 
 
 /* @axm_preferToStayOrToMove original */ /* !(md).(md : MODES => #(p).(p : POW(MANAGERS ** OBSERVATIONS) & #(q).(p : MANAGERS --> OBSERVATIONS & (q : MANAGERS --> OBSERVATIONS & (PreferableMode(md |-> p) = md & not(PreferableMode(md |-> q) = md))))))
 */

&

 /* @axm_preferToStayOrToMove */
  !(md).(md : MODES => #(p).(p : MANAGERS --> OBSERVATIONS & PreferableMode(md |-> p) = md) &
                       #(q).(q : MANAGERS --> OBSERVATIONS & not(PreferableMode(md |-> q) = md)))
 
END
