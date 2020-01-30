MACHINE safety
SETS /* deferred */
  POINT;
  SIGNAL;
  TRAIN;
  AMBIT={AE, AI, AG, BK, AF, AH, BL, BM, AJ, AK, AL, AM, AD};
  ASPECT={RED,GREEN};
  LINE={A_B, A_C};
  ROUTE={A_S10, S10_S12, S12_S14, S14_S16, S14_S116, S16_B, S116_C}
CONCRETE_CONSTANTS
  LineAll,
  LineFirst,
  LineLast,
  LineNext,
  RouteAll,
  RouteFirst,
  RouteLast,
  RouteNext,
  SignalFree,
  SignalGreen,
  SignalOccupied,
  SignalRed
ABSTRACT_VARIABLES
  collision,
  hd,
  hdr,
  line,
  locked,
  occ,
  signal,
  tl,
  tlr
/* PROMOTED OPERATIONS
  move_hd,
  move_hd_collide,
  move_hd_route,
  move_hd_route_collide,
  move_hd_route_collide_overlap,
  move_tl,
  move_tl_route,
  appear,
  disappear,
  switch_signal_green */
PROPERTIES
    /* @axm1 */ LineAll : LINE --> POW(ROUTE)
  & /* @axm2 */ LineNext : LINE --> (ROUTE +-> ROUTE)
  & /* @axm3 */ LineFirst : LINE --> ROUTE
  & /* @axm4 */ LineLast : LINE --> ROUTE
  & /* @axm5 */ RouteAll : ROUTE --> POW(AMBIT)
  /* &  RouteNext : ROUTE --> (AMBIT +-> AMBIT)*/
  & /* @axm7 */ RouteFirst : ROUTE --> AMBIT
  & /* @axm8 */ RouteLast : ROUTE --> AMBIT
  & /* @axm10 */ SignalFree : ROUTE --> POW(AMBIT)
  & /* @axm11 */ SignalOccupied : ROUTE --> POW(AMBIT)
  & /* @axm12 */ SignalRed : ROUTE --> POW(ROUTE)
  & /* @axm13 */ SignalGreen : ROUTE --> POW(ROUTE)
  &
    /* @axm4 */ LineAll = {
    		A_B |-> {A_S10, S10_S12, S12_S14, S14_S16, S16_B } ,
    		A_C |-> {A_S10, S10_S12, S12_S14, S14_S116, S116_C }     }
  & /* @axm5 */ LineNext = {
    		A_B |-> {
A_S10 |-> S10_S12
, 
S10_S12 |-> S12_S14
, 
S12_S14 |-> S14_S16
, 
S14_S16 |-> S16_B
    		} ,
    		A_C |-> {
A_S10 |-> S10_S12
, 
S10_S12 |-> S12_S14
, 
S12_S14 |-> S14_S116
, 
S14_S116 |-> S116_C
    		}   }
  & /* @axm6 */ LineFirst = {
    		A_B |-> A_S10,
    		A_C |-> A_S10  }
  & /* @axm7 */ LineLast = {
    		A_B |-> S16_B,
    		A_C |-> S116_C  	}
  & /* @axm8 */ RouteAll = {
    		A_S10 |-> {AD} ,
    		S10_S12 |-> {AE, AF} ,
    		S12_S14 |-> {AG, AH} ,
    		S14_S16 |-> {AI, AJ, AK} ,
    		S14_S116 |-> {AI, AJ, BK} ,
    		S16_B |-> {AL, AM} ,
    		S116_C |-> {BL, BM}   }
  & /* @axm9 */ RouteNext = {
    		S10_S12 |-> {
AE |-> AF
    		} 
, 
    		S12_S14 |-> {
AG |-> AH
    		} 
, 
    		S14_S16 |-> {
AI |-> AJ
, 
AJ |-> AK
    		} 
, 
    		S14_S116 |-> {
AI |-> AJ
, 
AJ |-> BK
    		} 
, 
    		S16_B |-> {
AL |-> AM
    		} 
, 
    		S116_C |-> {
BL |-> BM
    		} 
  	}
  & /* @axm10 */ RouteFirst = {
    		A_S10 |-> AD,
    		S10_S12 |-> AE,
    		S12_S14 |-> AG,
    		S14_S16 |-> AI,
    		S14_S116 |-> AI,
    		S16_B |-> AL,
    		S116_C |-> BL  
  }
  & /* @axm11 */ RouteLast = {
    		A_S10 |-> AD,
    		S10_S12 |-> AF,
    		S12_S14 |-> AH,
    		S14_S16 |-> AK,
    		S14_S116 |-> BK,
    		S16_B |-> AM,
    		S116_C |-> BM  
  	}
  & /* @axm12 */ SignalFree = {
    			A_S10 |-> {AD} ,
	
    			S10_S12 |-> {AE, AF} ,
	
    			S12_S14 |-> {AG, AH} ,
	
    			S14_S16 |-> {AI, AJ, AK} ,
	
    			S14_S116 |-> {AI, AJ, BK} ,
	
    			S16_B |-> {AL, AM} ,
	
    			S116_C |-> {BL, BM} 	
  
  	}
  & /* @axm13 */ SignalOccupied = {
    			A_S10 |-> {} ,
	
    			S10_S12 |-> {} ,
	
    			S12_S14 |-> {} ,
	
    			S14_S16 |-> {} ,
	
    			S14_S116 |-> {} ,
	
    			S16_B |-> {} ,
	
    			S116_C |-> {} 	
  
  	}
  & /* @axm14 */ SignalRed = {
    			A_S10 |-> {} ,
    			S10_S12 |-> {} ,
    			S12_S14 |-> {} ,
    			S14_S16 |-> {} ,
    			S14_S116 |-> {} ,
    			S16_B |-> {} ,
    			S116_C |-> {}   
  	}
  & /* @axm15 */ SignalGreen = {
    			A_S10 |-> {} ,
    			S10_S12 |-> {} ,
    			S12_S14 |-> {} ,
    			S14_S16 |-> {} ,
    			S14_S116 |-> {} ,
    			S16_B |-> {} ,
    			S116_C |-> {}   
  	}

INVARIANT
    /* @inv1 */ occ : AMBIT +-> TRAIN
  & /* @inv4 */ locked : AMBIT +-> TRAIN
  & /* @inv2 */ tl : TRAIN +-> AMBIT
  & /* @inv3 */ hd : TRAIN +-> AMBIT
  & /* @inv5 */ line : TRAIN +-> LINE
  & /* @inv6 */ tlr : TRAIN +-> ROUTE
  & /* @inv7 */ hdr : TRAIN +-> ROUTE
  & /* @inv9 */ collision = FALSE
  & /* @inv10 */ signal : ROUTE --> ASPECT
INITIALISATION
         occ := {}
      ||
         tl := {}
      ||
         hd := {}
      ||
         locked := {}
      ||
         line := {}
      ||
         tlr := {}
      ||
         hdr := {}
      ||
         collision := FALSE
      ||
         signal := ROUTE * {RED}

OPERATIONS
  move_hd(tt) = 
    PRE	
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ hd(tt) /= RouteLast(hdr(tt))
    THEN 
         hd := hd <+ {tt |-> RouteNext(hdr(tt))(hd(tt))}
      ||
         occ := occ <+ {RouteNext(hdr(tt))(hd(tt)) |-> tt}
    END;
  
  move_hd_collide(tt) = 
     PRE 
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ hd(tt) /= RouteLast(hdr(tt))
      & /* @grd3 */ RouteNext(hdr(tt))(hd(tt)) : dom(occ)
    THEN 
         collision := TRUE
    END;
  
  move_hd_route(tt) = 
    PRE 
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ hd(tt) = RouteLast(hdr(tt))
      & /* @grd3 */ hdr(tt) /= LineLast(line(tt))
      & /* @grd4 */ signal(LineNext(line(tt))(hdr(tt))) = GREEN
    THEN 
         hdr := hdr <+ {tt |-> LineNext(line(tt))(hdr(tt))}
      ||
         hd := hd <+ {tt |-> RouteFirst(LineNext(line(tt))(hdr(tt)))}
      ||
         occ := occ <+ {RouteFirst(LineNext(line(tt))(hdr(tt))) |-> tt}
      ||
         signal := signal <+ {LineNext(line(tt))(hdr(tt)) |-> RED}
    END;
  
  move_hd_route_collide(tt) = 
    PRE 
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ hd(tt) = RouteLast(hdr(tt))
      & /* @grd3 */ hdr(tt) /= LineLast(line(tt))
      & /* @grd4 */ signal(LineNext(line(tt))(hdr(tt))) = GREEN
      & /* @grd5 */ RouteFirst(LineNext(line(tt))(hdr(tt))) : dom(occ)
    THEN 
         collision := TRUE
    END;
    
  
  move_tl(tt) = 
    PRE 
        /* @grd1 */ tt : dom(tl)
      & /* @grd2 */ tl(tt) /= hd(tt)
      & /* @grd3 */ tl(tt) /= RouteLast(tlr(tt))
    THEN 
         tl := tl <+ {tt |-> RouteNext(tlr(tt))(tl(tt))}
      ||
         occ := {tl(tt)} <<| occ
      ||
         locked := {tl(tt)} <<| locked
    END;
  
  move_tl_route(tt) = 
    PRE 
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ tl(tt) /= hd(tt)
      & /* @grd3 */ tl(tt) = RouteLast(tlr(tt))
      & /* @grd4 */ tlr(tt) /= LineLast(line(tt))
    THEN 
         tlr := tlr <+ {tt |-> LineNext(line(tt))(tlr(tt))}
      ||
         tl := tl <+ {tt |-> RouteFirst(LineNext(line(tt))(tlr(tt)))}
      ||
         occ := {tl(tt)} <<| occ
      ||
         locked := {tl(tt)} <<| locked
    END;
  
  appear(ll,tt) = 
    PRE 
        /* @grd2 */ tt : TRAIN \ dom(hd)
      & /* @grd3 */ RouteAll(LineFirst(ll)) /\ dom(locked) = {}
      & /* @grd4 */ RouteAll(LineFirst(ll)) /\ dom(occ) = {}
    THEN 
         line := line <+ {tt |-> ll}
      ||
         hd := hd <+ {tt |-> RouteFirst(LineFirst(ll))}
      ||
         tl := tl <+ {tt |-> RouteFirst(LineFirst(ll))}
      ||
         hdr := hdr <+ {tt |-> LineFirst(ll)}
      ||
         tlr := tlr <+ {tt |-> LineFirst(ll)}
      ||
         occ := occ <+ {RouteFirst(LineFirst(ll)) |-> tt}
    END;
  
  disappear(tt) = 
    PRE 
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ tlr(tt) = LineLast(line(tt))
    THEN 
         hd := {tt} <<| hd
      ||
         tl := {tt} <<| tl
      ||
         hdr := {tt} <<| hdr
      ||
         tlr := {tt} <<| tlr
      ||
         line := {tt} <<| line
      ||
         occ := occ |>> {tt}
      ||
         locked := locked |>> {tt}
    END;
  
  switch_signal_green(tt) = 
    PRE 
        /* @grd1 */ tt : dom(hd)
      & /* @grd2 */ hdr(tt) /= LineLast(line(tt))
      & /* @grd4 */ SignalFree(LineNext(line(tt))(hdr(tt))) /\ dom(occ) = {}
      & /* @grd5 */ SignalOccupied(LineNext(line(tt))(hdr(tt))) <: dom(occ)
      & /* @grd6 */ SignalRed(LineNext(line(tt))(hdr(tt))) <: signal~[{RED}]
      & /* @grd7 */ SignalGreen(LineNext(line(tt))(hdr(tt))) <: signal~[{GREEN}]
    THEN 
         locked := locked \/ RouteAll(LineNext(line(tt))(hdr(tt))) * {tt}
      ||
         signal := signal <+ {LineNext(line(tt))(hdr(tt)) |-> GREEN}
    END
END

