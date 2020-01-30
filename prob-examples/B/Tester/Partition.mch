MACHINE Partition
SETS
 ID={aa,bb,cc,dd}
CONSTANTS A,B,C
PROPERTIES
 ID = A \/ B \/ C &
 A /\ B = {} & A /\ C = {} & C /\ B = {} &
 aa:A & bb:B & card(C)>card(A)

/* & A = {aa} & B={bb} & C={cc,dd} */
DEFINITIONS part(S,AA,BB,CC) == (S = AA \/ BB \/ CC & AA /\ BB = {} & AA /\ CC = {} & CC /\ BB = {});
ASSERTIONS
  A = {aa};
  B = {bb};
  C = {cc,dd};
  {A,B,C| A<:ID & B<:ID & C<: ID & part({},A,B,C)} = { ({},{},{}) };
  card({A,B,C| part({aa},A,B,C)}) = 3;
  card({A,B,C| part({aa,bb},A,B,C)}) = 9;
  card({A,B,C| A:POW1(ID) & B:POW1(ID) & C:POW1(ID)& part(ID,A,B,C)}) = 36;
  card({A,B,C| A:POW1(ID) & B:POW1(ID) & C:POW1(ID)& part(ID,A,B,C) &
               card(A) <= card(B) & card(B) <= card(C)}) = 12;
  card({A,B,C| A:POW1(ID) & B:POW1(ID) & C:POW1(ID)& part(ID,A,B,C) & A<:B}) = 0
END

