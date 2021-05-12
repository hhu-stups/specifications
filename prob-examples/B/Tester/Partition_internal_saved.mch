
MACHINE Partition_internal
SETS /* enumerated */
  ID={aa,bb,cc,dd}
CONCRETE_CONSTANTS
  A,
  B,
  C
PROPERTIES
    A : POW(ID)
  & B : POW(ID)
  & C : POW(ID)
  & (ID = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {})
  & aa : A
  & bb : B
  & card(C) > card(A)
ASSERTIONS
     A = {aa}
   ; B = {bb}
   ; C = {cc,dd}
   ; {A,B,C|A : POW(ID) & B : POW(ID) & C : POW(ID) & ({} = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {})} = {{} |-> {} |-> {}}
   ; card({A,B,C|A : POW(ID) & B : POW(ID) & C : POW(ID) & ({aa} = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {})}) = 3
   ; card({A,B,C|A : POW(ID) & B : POW(ID) & C : POW(ID) & ({aa,bb} = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {})}) = 9
   ; card({A,B,C|A : POW1(ID) & B : POW1(ID) & C : POW1(ID) & (ID = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {})}) = 36
   ; card({A,B,C|A : POW1(ID) & B : POW1(ID) & C : POW1(ID) & (ID = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {}) & card(A) <= card(B) & card(B) <= card(C)}) = 12
   ; card({A,B,C|A : POW1(ID) & B : POW1(ID) & C : POW1(ID) & (ID = A\/B\/C & A/\B = {} & A/\C = {} & B/\C = {}) & A <: B}) = 0
INITIALISATION
    skip
END
