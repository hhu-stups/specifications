MACHINE MaxClique
/* Finding maximal cliques
   Example 4.1 from page 111 of Combinatorial Algorithms by Kreher & Stinson
*/
DEFINITIONS
 V == 0..6;
 SET_PREF_MAX_INITIALISATIONS == 6;
 IsClique(S) == (S <: V & !(xc,yc).(xc:S & yc:S & xc/=yc => xc|->yc : gs) );
 Maximal(S) == !z.(z:V & z /: S => #v.(v:S & z|->v /: gs))
CONSTANTS g, gs, Clique
PROPERTIES
  g = { 0|->1, 0|->3, 0|->6,
        1|->2, 1|->4, 1|->5,
        2|->3, 2|->4, 2|->5,
        3|->6 } &
  gs = g \/ g~ &

  IsClique(Clique)
  & 
  Maximal(Clique)
ASSERTIONS
  {C| IsClique(C) & Maximal(C)} = {  {0,1},  {0,3,6},  {1,2,4},  {1,2,5},  {2,3} }
END

