
MACHINE train_1  /* uses POR style reduction by giving priority to route_freeing */
DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 99;
  SET_PREF_MAX_OPERATIONS == 99;
   ROUTE_FREEING_IMPOSSIBLE == ({} = resrt \ ran(rsrtbl))
SETS /* enumerated */
  BLOCKS={A,B,C,D,E,F,G,H,I};
  ROUTES={R1,R2,R3,R4,R5,R6,R7,R8}  /* a simplified topology by Lukas; not the one by Abrial */
CONCRETE_CONSTANTS
  fst,
  lst,
  nxt,
  rtbl
ABSTRACT_VARIABLES
  LBT,
  TRK,
  frm,
  OCC,
  resbl,
  resrt,
  rsrtbl
/* PROMOTED OPERATIONS
  route_reservation,
  route_freeing,
  FRONT_MOVE_1,
  FRONT_MOVE_2,
  BACK_MOVE_1,
  BACK_MOVE_2,
  point_positionning,
  route_formation */
PROPERTIES
    /* @axm2 */ dom(rtbl) = BLOCKS
  & /* @axm3 */ ran(rtbl) = ROUTES
  & /* @axm4 */ nxt : ROUTES --> (BLOCKS >+> BLOCKS)
  & /* @axm5 */ fst : ROUTES --> BLOCKS
  & /* @axm6 */ lst : ROUTES --> BLOCKS
  & /* @axm7 */ fst~ <: rtbl
  & /* @axm8 */ lst~ <: rtbl
  & /* @axm11 */ !(r).(r : ROUTES => fst(r) /= lst(r))
  & /* @axm10 */ !(r).(r : ROUTES => !(S).(S <: nxt(r)[S] => S = {}))
  & /* @axm9 */ !(r).(r : ROUTES => nxt(r) : (rtbl~)[{r}] \ {lst(r)} >->> (rtbl~)[{r}] \ {fst(r)})
  & /* @axm12 */ !(r,s).((r : ROUTES & s : ROUTES) & r /= s => fst(r) /: (rtbl~)[{s}] \ {fst(s),lst(s)})
  & /* @axm13 */ !(r,s).((r : ROUTES & s : ROUTES) & r /= s => lst(r) /: (rtbl~)[{s}] \ {fst(s),lst(s)})
  & /* @axm14 */ rtbl = {A |-> R1,A |-> R2,A |-> R5,A |-> R6,B |-> R1,B |-> R2,B |-> R5,B |-> R6,C |-> R1,C |-> R5,D |-> R2,D |-> R6,E |-> R2,E |-> R3,E |-> R4,E |-> R6,E |-> R7,E |-> R8,F |-> R2,F |-> R3,F |-> R4,F |-> R6,F |-> R7,F |-> R8,G |-> R3,G |-> R4,G |-> R4,G |-> R7,G |-> R8,H |-> R3,H |-> R7,I |-> R4,I |-> R8}
  & /* @axm40 */ nxt = {R1 |-> {A |-> B,B |-> C},R2 |-> {A |-> B,B |-> D,D |-> E,E |-> F},R3 |-> {H |-> G,G |-> E,E |-> F},R4 |-> {I |-> G,G |-> E,E |-> F},R5 |-> {C |-> B,B |-> A},R6 |-> {F |-> E,E |-> D,D |-> B,B |-> A},R7 |-> {F |-> E,E |-> G,G |-> H},R8 |-> {F |-> E,E |-> G,G |-> I}}
  & /* @axm41 */ fst = {R1 |-> A,R2 |-> A,R3 |-> H,R4 |-> I,R5 |-> C,R6 |-> F,R7 |-> F,R8 |-> F}
  & /* @axm42 */ lst = {R1 |-> C,R2 |-> F,R3 |-> F,R4 |-> F,R5 |-> A,R6 |-> A,R7 |-> H,R8 |-> I}
INVARIANT
    /* @inv1 */ TRK : BLOCKS >+> BLOCKS
  & /* @inv2 */ frm <: resrt
  & /* @inv3 */ rsrtbl[OCC] <: frm
  & /* @inv4 */ !(r).(r : resrt \ frm => rtbl |> {r} = rsrtbl |> {r})
  & /* @inv5 */ !(x,y).((x : BLOCKS & y : BLOCKS) & x |-> y : TRK => #(r).(r : ROUTES & x |-> y : nxt(r)))
  & /* @inv6 */ !(r).(r : frm => (rsrtbl~)[{r}] <| nxt(r) = (rsrtbl~)[{r}] <| TRK)
  & /* @inv7 */ LBT <: OCC
  & /* @inv8 */ !(a,b).(b : LBT & (b : ran(nxt(rsrtbl(b))) & (a = (nxt(rsrtbl(b))~)(b) & a : dom(rsrtbl))) => rsrtbl(a) /= rsrtbl(b))
  & /* @inv3 */ rsrtbl : resbl --> resrt
  & /* @inv5 */ rsrtbl <: rtbl
  & /* @inv4 */ OCC <: resbl
  & /* @inv6 */ !(r).(r : ROUTES => nxt(r)[(rtbl~)[{r}] \ (rsrtbl~)[{r}]] /\ (rsrtbl~)[{r}] \ OCC = {})
  & /* @inv7 */ !(r).(r : ROUTES => nxt(r)[(rsrtbl~)[{r}]] <: (rsrtbl~)[{r}])
  & /* @inv8 */ !(r).(r : ROUTES => nxt(r)[(rsrtbl~)[{r}] \ OCC] <: (rsrtbl~)[{r}] \ OCC)
INITIALISATION
         resrt := {}
      ||
         resbl := {}
      ||
         rsrtbl := {}
      ||
         OCC := {}
      ||
         TRK := {}
      ||
         frm := {}
      ||
         LBT := {}

OPERATIONS
  route_reservation = 
    
    ANY r
    WHERE 
        /* @grd1 */ r /: resrt
      & /* @grd2 */ (rtbl~)[{r}] /\ resbl = {}
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
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
        /* @grd1 */ r : resrt \ ran(rsrtbl)
    THEN 
         resrt := resrt \ {r}
      ||
         frm := frm \ {r}
    END;
  
  FRONT_MOVE_1 = 
    ANY r
    WHERE 
        /* @grd1 */ r : frm
      & /* @grd2 */ fst(r) : resbl \ OCC
      & /* @grd3 */ rsrtbl(fst(r)) = r
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
    THEN 
         OCC := OCC \/ {fst(r)}
      ||
         LBT := LBT \/ {fst(r)}
    END;
  
  FRONT_MOVE_2 = 
    ANY b
    WHERE 
        /* @grd1 */ b : OCC
      & /* @grd2 */ b : dom(TRK)
      & /* @grd3 */ TRK(b) /: OCC
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
    THEN 
         OCC := OCC \/ {TRK(b)}
    END;
  
  BACK_MOVE_1= 
    ANY b
    WHERE 
        /* @grd1 */ b : LBT
      & /* @grd2 */ b /: dom(TRK)
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
    THEN 
         OCC := OCC \ {b}
      ||
         rsrtbl := {b} <<| rsrtbl
      ||
         resbl := resbl \ {b}
      ||
         LBT := LBT \ {b}
    END;
  
  BACK_MOVE_2 = 
    ANY b
    WHERE 
        /* @grd1 */ b : LBT
      & /* @grd2 */ b : dom(TRK)
      & /* @grd3 */ TRK(b) : OCC
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
    THEN 
         OCC := OCC \ {b}
      ||
         rsrtbl := {b} <<| rsrtbl
      ||
         resbl := resbl \ {b}
      ||
         LBT := LBT \ {b} \/ {TRK(b)}
    END;
  
  point_positionning = 
    ANY r
    WHERE 
        /* @grd1 */ r : resrt \ frm
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
    THEN 
         TRK := ((dom(nxt(r)) <<| TRK) |>> ran(nxt(r))) \/ nxt(r)
    END;
  
  route_formation = 
    ANY r
    WHERE 
        /* @grd1 */ r : resrt \ frm
      & /* @grd2 */ (rsrtbl~)[{r}] <| nxt(r) = (rsrtbl~)[{r}] <| TRK
      & ROUTE_FREEING_IMPOSSIBLE /* POR REDUCTION */
    THEN 
         frm := frm \/ {r}
    END
END