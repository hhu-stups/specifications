MACHINE TwoSets
/* Example developed after discussion with Valmari */
/* Purpose: investigate whether a model can be easily
   be rewritten to incorporate symmetry.
   With one variable s1: easy; just replace s1 by a counter
   (Petri net style).
   I hope this example shows that with two sets s1,s2 this
   is no longer so easy */
/* If we limit the cardinality of s1 and s2 to 2, then
   we have at most 14 canonical forms; independent of the
   cardinality of ID */
/* s1 and s2 could be two Hotel Key cards with max. 2 KeyIDs on */
SETS
 ID
DEFINITIONS scope_ID == 1..5
CONSTANTS maxs
PROPERTIES maxs = 2
VARIABLES s1,s2
INVARIANT
 s1:POW(ID) & s2:POW(ID)
INITIALISATION s1,s2 := {},{}
OPERATIONS
  Add1(x) = PRE card(s1)<maxs & x/:s1 THEN s1 := s1 \/ {x} END;
  Add2(y) = PRE card(s2)<maxs & y/:s2 THEN s2 := s2 \/ {y} END;
  Exchange(x,y) = PRE x:s1 & x/: s2 & y:s2 & y/:s1 & x/=y THEN
	s1 := s1 - {x} \/ {y} ||
	s2 := s2 - {y} \/ {x}
  END
END

