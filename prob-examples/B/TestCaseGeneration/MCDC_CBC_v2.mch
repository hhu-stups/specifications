MACHINE MCDC_CBC_v2
SETS
 ID={aa,bb}
DEFINITIONS
   PHI1(A,B,C) ==  bool(A=TRUE & B=TRUE & C=TRUE);
   PHI2(A,B,C) ==  bool(A=TRUE or B=TRUE or C=TRUE);
   PHI(A,B,C) ==  bool(A=TRUE or (B=TRUE & C=TRUE))
CONSTANTS Tests, neg
PROPERTIES
 neg = {TRUE |-> FALSE, FALSE |-> TRUE} &
 Tests <: (1..3 --> BOOL) &
 #v.(v:Tests & PHI(v(1),v(2),v(3)) /= PHI(neg(v(1)),v(2),v(3))) &

 #v.(v:Tests & PHI(v(1),v(2),v(3)) /= PHI(v(1),neg(v(2)),v(3))) &

 #v.(v:Tests & PHI(v(1),v(2),v(3)) /= PHI(v(1),v(2),neg(v(3)))) &

 card(Tests) = 5
 
END

