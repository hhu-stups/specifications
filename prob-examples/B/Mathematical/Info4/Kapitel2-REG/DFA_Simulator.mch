MACHINE DFA_Simulator
/* Simuliert die Ausführung eines DFAs oder NFAs */
/* Benutzt den Automaten von Folie 11 aus folien-kapitel-2 */
DEFINITIONS
  Alphabet == {0,1};
  CUSTOM_GRAPH_NODES == (S*{"lightgray"}) <+ (F*{"yellow"}) <+ {cur}*{"red"} <+ (F /\ {cur})*{"chartreuse3"};
  CUSTOM_GRAPH_EDGES == {z,n,z2| (z,n) : dom(delta) & z2 = delta(z,n)}
SETS
   S = {z0,z1,z2,z3}
ABSTRACT_CONSTANTS deltae
CONSTANTS I, F, delta
PROPERTIES
 I <: S & F <: S & delta : (S*Alphabet) --> S &

 /* rekursive Definition der erweiterten Uebergangsfunktion (gilt nur für DFAs !!) */
 deltae = %(z,s).(z:S & s=<>|z) \/
          %(z,s).(z:S & s/=<> | deltae(delta(z,first(s)),tail(s)))
 &

 I = {z0} & F={z2} &
 delta = { (z0,0)|->z1, (z0,1)|->z3,
           (z1,0)|->z3, (z1,1)|->z2,
           (z2,0)|->z2, (z2,1)|->z2,
           (z3,0)|->z3, (z3,1)|->z3 }
ASSERTIONS
  deltae(z0,[0,1,1,1]) = z2;
  deltae(z3,<>) = z3;
  deltae(z0,[1]) = z3
VARIABLES cur
INVARIANT cur : S
INITIALISATION cur :: I
OPERATIONS
  Go(input) = PRE input:Alphabet THEN cur := delta(cur,input) END;
  Accept = PRE cur : F  THEN skip END
END

