
MACHINE M0_v2
SETS /* deferred */
  colors_list;
  V
CONCRETE_CONSTANTS
  color,
  tmax
ABSTRACT_VARIABLES
  node_color,
  t
PROPERTIES
    /* @Coloration:axm1  */ card(colors_list) <= card(V)
  & /* @Coloration:axm2  */ color : 1 .. card(V) >->> colors_list
  & /* @Coloration:axm4  */ colors_list /= {}
  & /* @c:axm1  */ tmax : NATURAL - {0}
INVARIANT
    /* @M0_v2:inv1  */ node_color : V * (0 .. t) --> colors_list
INITIALISATION
    
    BEGIN 
         t,node_color : (t = 0 & node_color = V * {0} * colors_list)
    END
END
