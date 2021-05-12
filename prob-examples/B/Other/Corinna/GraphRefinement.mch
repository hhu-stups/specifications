MACHINE GraphRefinement
/* Started by Michael 22/3/06. It is now 17:13 */
SETS
  Nodes = {N0,N1,N2,N3,N4,N5,N6,N7}
CONSTANTS
  Edges
PROPERTIES
  Edges : Nodes <-> Nodes &
  Edges = { N0 |-> N1, N1 |-> N0,
            N1 |-> N2, N2 |-> N1,
            N2 |-> N3, N3 |-> N2,
            N3 |-> N4, N4 |-> N3,
            N4 |-> N5, N5 |-> N4,
            N5 |-> N6, N6 |-> N5,
            N6 |-> N7, N7 |-> N6,
            N7 |-> N0, N0 |-> N7,
            N0 |-> N3, N3 |-> N0,
            N1 |-> N4, N4 |-> N1,
            N2 |-> N6, N6 |-> N2,
            N5 |-> N7, N7 |-> N5 }
DEFINITIONS
  Block == POW(Nodes);
  NG(v) == {x|x:Nodes & x|->v: Edges};
  DT(T,v) == card(NG(v) /\ T);
  L(h,BB,T) == {v|v:Nodes & v:BB & DT(T,v) = h};
  MAXCON == 3;
  GOAL == (S=<> & Status=0)
VARIABLES
  B, S, T, Status, BC, B_i, Lh
INVARIANT
  B : seq(Block) &
  BC : seq(Block) &  /* a copy of B for first for loop */
  S : seq(Block) &
  T : Block &
  Status : NAT &
  B_i : Block &
  Lh : POW(NAT*Block)
  
INITIALISATION
  B :=  [ {N0}, {N1,N2,N3,N4,N5,N6,N7}] ||
  BC :=  <> ||
  S :=  [ {N0}, {N1,N2,N3,N4,N5,N6,N7}] ||
  T := {} ||
  B_i := {} ||
  Lh := {} ||
  Status := 0
OPERATIONS
 Finished = PRE S=<> & Status=0 THEN skip END;
 
 StartLoop1 = PRE S /= <> & Status = 0 THEN /* choose first block */
   Status := 1 ||
   T := first(S) ||
   S := tail(S) ||
   BC := B ||
   B := <>
 END;
 
 StartLoop2 = PRE S /= {} & Status = 0 THEN /* choose last block */
   Status := 1 ||
   T := last(S) ||
   S := front(S) ||
   BC := B ||
   B := <>
 END;
 
 For_Do_Choose_B_i = PRE Status = 1 & BC /= <> THEN
   B_i := first(BC) ||
   BC := tail(BC) ||
   Status := 2
 END;
 
 For_B_i_End = PRE Status = 1 & BC = <> THEN Status := 0 END;
 
 ll <-- Compute_L_i(h) = PRE h:NAT & h<4 & Status=2 THEN
    ll := L(h,B_i,T)
 END;
 
 ComputeL = PRE Status = 2 THEN
       Lh := { h,lh | lh: Block & h: NAT & h <= MAXCON &
                 lh=L(h,B_i,T) &  card(lh)>0 } ||
       Status := 3
 END;
 
 if_more_than_one = PRE Status = 3 & card(Lh)>1 
    THEN
    Status := 4
 END;
 
 if_not_more = PRE Status = 3 & card(Lh)<2 THEN
   Status := 1 ||
   B := B <- B_i
 END;
 
  add__smallest_from_Lh(LhBlock) = PRE Status =4 & Lh /= {} & LhBlock: Lh &
               !bb.(bb:Lh => prj1(NAT,Block)(LhBlock) <= prj1(NAT,Block)(bb)) THEN
     S := S <- prj2(NAT,Block)(LhBlock) ||
     Lh := Lh \ {LhBlock}||
     B := B <- prj2(NAT,Block)(LhBlock)
  END;
  
  
  finished_Lh = PRE Status=4 & Lh={} THEN
    Status := 1
  END
 
END