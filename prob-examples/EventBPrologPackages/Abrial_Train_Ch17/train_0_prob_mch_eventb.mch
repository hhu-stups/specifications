
MACHINE train_0_prob_mch_eventb
SETS /* enumerated */
  BLOCKS={A,B,C,D,E,F,G,H,I};
  ROUTES={R1,R2,R3,R4,R5,R6,R7,R8}
CONCRETE_CONSTANTS
  fst,
  lst,
  nxt,
  rtbl
ABSTRACT_VARIABLES
  OCC,
  resbl,
  resrt,
  rsrtbl
/* PROMOTED OPERATIONS
  route_reservation,
  route_freeing,
  FRONT_MOVE_1,
  FRONT_MOVE_2,
  BACK_MOVE */
PROPERTIES
    rtbl : POW(BLOCKS * ROUTES)
  & /* @train_ctx0:axm2  */ dom(rtbl) = BLOCKS
  & /* @train_ctx0:axm3  */ ran(rtbl) = ROUTES
  & /* @train_ctx0:axm4  */ nxt : ROUTES --> (BLOCKS >+> BLOCKS)
  & /* @train_ctx0:axm5  */ fst : ROUTES --> BLOCKS
  & /* @train_ctx0:axm6  */ lst : ROUTES --> BLOCKS
  & /* @train_ctx0:axm7  */ fst~ <: rtbl
  & /* @train_ctx0:axm8  */ lst~ <: rtbl
  & /* @train_ctx0:axm11  */ !r.(r : ROUTES => fst(r) /= lst(r))
  & /* @train_ctx0:axm10  */ !r.(r : ROUTES => !S.(S <: ran(nxt(r)) & S <: nxt(r)[S] => S = {}))
  & /* @train_ctx0:axm9  */ !r.(r : ROUTES => nxt(r) : (rtbl~)[{r}] - {lst(r)} >->> (rtbl~)[{r}] - {fst(r)})
  & /* @train_ctx0:axm12  */ !(r,s).((r : ROUTES & s : ROUTES) & r /= s => fst(r) /: (rtbl~)[{s}] - {fst(s),lst(s)})
  & /* @train_ctx0:axm13  */ !(r,s).((r : ROUTES & s : ROUTES) & r /= s => lst(r) /: (rtbl~)[{s}] - {fst(s),lst(s)})
  & /* @train_ctx0_prob:axm14  */ rtbl = {A |-> R1,A |-> R2,A |-> R5,A |-> R6,B |-> R1,B |-> R2,B |-> R5,B |-> R6,C |-> R1,C |-> R5,D |-> R2,D |-> R6,E |-> R2,E |-> R3,E |-> R4,E |-> R6,E |-> R7,E |-> R8,F |-> R2,F |-> R3,F |-> R4,F |-> R6,F |-> R7,F |-> R8,G |-> R3,G |-> R4,G |-> R4,G |-> R7,G |-> R8,H |-> R3,H |-> R7,I |-> R4,I |-> R8}
  & /* @train_ctx0_prob:axm40  */ nxt = {R1 |-> {A |-> B,B |-> C},R2 |-> {A |-> B,B |-> D,D |-> E,E |-> F},R3 |-> {H |-> G,G |-> E,E |-> F},R4 |-> {I |-> G,G |-> E,E |-> F},R5 |-> {C |-> B,B |-> A},R6 |-> {F |-> E,E |-> D,D |-> B,B |-> A},R7 |-> {F |-> E,E |-> G,G |-> H},R8 |-> {F |-> E,E |-> G,G |-> I}}
  & /* @train_ctx0_prob:axm41  */ fst = {R1 |-> A,R2 |-> A,R3 |-> H,R4 |-> I,R5 |-> C,R6 |-> F,R7 |-> F,R8 |-> F}
  & /* @train_ctx0_prob:axm42  */ lst = {R1 |-> C,R2 |-> F,R3 |-> F,R4 |-> F,R5 |-> A,R6 |-> A,R7 |-> H,R8 |-> I}
INVARIANT
    resbl : POW(BLOCKS)
  & resrt : POW(ROUTES)
  & /* @train_0:inv3  */ rsrtbl : resbl --> resrt
  & /* @train_0:inv5  */ rsrtbl <: rtbl
  & /* @train_0:inv4  */ OCC <: resbl
  & /* @train_0:inv6  */ !r.(r : ROUTES => nxt(r)[(rtbl~)[{r}] - (rsrtbl~)[{r}]] /\ (rsrtbl~)[{r}] - OCC = {})
  & /* @train_0:inv7  */ !r.(r : ROUTES => nxt(r)[(rsrtbl~)[{r}]] <: (rsrtbl~)[{r}])
  & /* @train_0:inv8  */ !r.(r : ROUTES => nxt(r)[(rsrtbl~)[{r}] - OCC] <: (rsrtbl~)[{r}] - OCC)
INITIALISATION
    BEGIN
         resrt := {}
      ||
         resbl := {}
      ||
         rsrtbl := {}
      ||
         OCC := {}
    END
OPERATIONS
  route_reservation = 
    ANY r
    WHERE 
        r : ROUTES
      & /* @train_0_prob:grd1  */ r /: resrt
      & /* @train_0_prob:grd2  */ (rtbl~)[{r}] /\ resbl = {}
    THEN
         resrt := resrt \/ {r}
      ||
         rsrtbl := rsrtbl \/ (rtbl |> {r})
      ||
         resbl := resbl \/ (rtbl~)[{r}]
    END;
  
  route_freeing = 
    ANY r
    WHERE 
        /* @train_0_prob:grd1  */ r : resrt - ran(rsrtbl)
    THEN
      resrt := resrt - {r}
    END;
  
  FRONT_MOVE_1 = 
    ANY r
    WHERE 
        /* @train_0_prob:grd1  */ r : resrt
      & /* @train_0_prob:grd2  */ fst(r) : resbl - OCC
      & /* @train_0_prob:grd3  */ rsrtbl(fst(r)) = r
    THEN
      OCC := OCC \/ {fst(r)}
    END;
  
  FRONT_MOVE_2 = 
    ANY b,c
    WHERE 
        c : BLOCKS
      & /* @train_0_prob:grd1  */ b : OCC
      & /* @train_0_prob:grd2  */ c /: OCC
      & /* @train_0_prob:grd3  */ b |-> c : nxt(rsrtbl(b))
    THEN
      OCC := OCC \/ {c}
    END;
  
  BACK_MOVE = 
    ANY b,n
    WHERE 
        n : POW(BLOCKS * BLOCKS)
      & /* @train_0_prob:grd1  */ b : OCC
      & /* @train_0_prob:grd2  */ n = nxt(rsrtbl(b))
      & (/* @train_0_prob:grd3  */ b : dom(n) => n(b) : OCC)
      & (/* @train_0_prob:grd4  */ b : ran(n) & (n~)(b) : dom(rsrtbl) => rsrtbl((n~)(b)) /= rsrtbl(b))
    THEN
         OCC := OCC - {b}
      ||
         rsrtbl := {b} <<| rsrtbl
      ||
         resbl := resbl - {b}
    END
END
