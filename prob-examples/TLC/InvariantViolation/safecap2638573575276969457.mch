MACHINE safety
SETS /* deferred */
  POINT;
  SIGNAL;
  TRAIN;
  AMBIT={TBZ1, TBW, TAA, TBV, TCM, TDR, TCL, TCK, TAD, TCN, TAE, TAC, TAB, TBX, TBY, TAG, TBZ, TAA1, TAE2, TDQ, TDQ1, TBW1, TBU1, TBU11};
  ASPECT={RED,GREEN};
  LINE={A_F, A_B, D_C, E_C};
  ROUTE={A_SN3, D_SN2, E_SN12, SN3_SN14, SN14_SN16, SN16_SN, SN16_SN8, SN_SN19, SN19_F, SN8_SN1, SN1_B, SN2_SN18, SN18_SN10, SN10_SN11, SN11_SN4, SN4_SN7, SN7_SN5, SN5_C, SN12_SN6, SN6_SN20, SN20_SN7}
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
  /* &  RouteNext : ROUTE --> (AMBIT +-> AMBIT) */
  & /* @axm7 */ RouteFirst : ROUTE --> AMBIT
  & /* @axm8 */ RouteLast : ROUTE --> AMBIT
  & /* @axm10 */ SignalFree : ROUTE --> POW(AMBIT)
  & /* @axm11 */ SignalOccupied : ROUTE --> POW(AMBIT)
  & /* @axm12 */ SignalRed : ROUTE --> POW(ROUTE)
  & /* @axm13 */ SignalGreen : ROUTE --> POW(ROUTE)
  &
    /* @axm4 */ LineAll = {
    		A_F |-> {A_SN3, SN3_SN14, SN14_SN16, SN16_SN, SN_SN19, SN19_F } ,
    		A_B |-> {A_SN3, SN3_SN14, SN14_SN16, SN16_SN8, SN8_SN1, SN1_B } ,
    		D_C |-> {D_SN2, SN2_SN18, SN18_SN10, SN10_SN11, SN11_SN4, SN4_SN7, SN7_SN5, SN5_C } ,
    		E_C |-> {E_SN12, SN12_SN6, SN6_SN20, SN20_SN7, SN7_SN5, SN5_C }     }
  & /* @axm5 */ LineNext = {
    		A_F |-> {
A_SN3 |-> SN3_SN14
, 
SN3_SN14 |-> SN14_SN16
, 
SN14_SN16 |-> SN16_SN
, 
SN16_SN |-> SN_SN19
, 
SN_SN19 |-> SN19_F
    		} ,
    		A_B |-> {
A_SN3 |-> SN3_SN14
, 
SN3_SN14 |-> SN14_SN16
, 
SN14_SN16 |-> SN16_SN8
, 
SN16_SN8 |-> SN8_SN1
, 
SN8_SN1 |-> SN1_B
    		} ,
    		D_C |-> {
D_SN2 |-> SN2_SN18
, 
SN2_SN18 |-> SN18_SN10
, 
SN18_SN10 |-> SN10_SN11
, 
SN10_SN11 |-> SN11_SN4
, 
SN11_SN4 |-> SN4_SN7
, 
SN4_SN7 |-> SN7_SN5
, 
SN7_SN5 |-> SN5_C
    		} ,
    		E_C |-> {
E_SN12 |-> SN12_SN6
, 
SN12_SN6 |-> SN6_SN20
, 
SN6_SN20 |-> SN20_SN7
, 
SN20_SN7 |-> SN7_SN5
, 
SN7_SN5 |-> SN5_C
    		}   }
  & /* @axm6 */ LineFirst = {
    		A_F |-> A_SN3,
    		A_B |-> A_SN3,
    		D_C |-> D_SN2,
    		E_C |-> E_SN12  }
  & /* @axm7 */ LineLast = {
    		A_F |-> SN19_F,
    		A_B |-> SN1_B,
    		D_C |-> SN5_C,
    		E_C |-> SN5_C  	}
  & /* @axm8 */ RouteAll = {
    		A_SN3 |-> {TAA} ,
    		D_SN2 |-> {TBU11} ,
    		E_SN12 |-> {TDQ1} ,
    		SN3_SN14 |-> {TAA1} ,
    		SN14_SN16 |-> {TAB} ,
    		SN16_SN |-> {TAC, TAD, TCN, TCM} ,
    		SN16_SN8 |-> {TAC, TAD, TAE} ,
    		SN_SN19 |-> {TCL} ,
    		SN19_F |-> {TCK} ,
    		SN8_SN1 |-> {TAE2} ,
    		SN1_B |-> {TAG} ,
    		SN2_SN18 |-> {TBU1} ,
    		SN18_SN10 |-> {TBV} ,
    		SN10_SN11 |-> {TBW1} ,
    		SN11_SN4 |-> {TBW} ,
    		SN4_SN7 |-> {TBX, TBY} ,
    		SN7_SN5 |-> {TBZ} ,
    		SN5_C |-> {TBZ1} ,
    		SN12_SN6 |-> {TDQ} ,
    		SN6_SN20 |-> {TDR} ,
    		SN20_SN7 |-> {TCN, TAD, TAC, TBX, TBY}   }
  & /* @axm9 */ RouteNext = {
    		SN16_SN |-> {
TAC |-> TAD
, 
TAD |-> TCN
, 
TCN |-> TCM
    		} 
, 
    		SN16_SN8 |-> {
TAC |-> TAD
, 
TAD |-> TAE
    		} 
, 
    		SN4_SN7 |-> {
TBX |-> TBY
    		} 
, 
    		SN20_SN7 |-> {
TCN |-> TAD
, 
TAD |-> TAC
, 
TAC |-> TBX
, 
TBX |-> TBY
    		} 
  	}
  & /* @axm10 */ RouteFirst = {
    		A_SN3 |-> TAA,
    		D_SN2 |-> TBU11,
    		E_SN12 |-> TDQ1,
    		SN3_SN14 |-> TAA1,
    		SN14_SN16 |-> TAB,
    		SN16_SN |-> TAC,
    		SN16_SN8 |-> TAC,
    		SN_SN19 |-> TCL,
    		SN19_F |-> TCK,
    		SN8_SN1 |-> TAE2,
    		SN1_B |-> TAG,
    		SN2_SN18 |-> TBU1,
    		SN18_SN10 |-> TBV,
    		SN10_SN11 |-> TBW1,
    		SN11_SN4 |-> TBW,
    		SN4_SN7 |-> TBX,
    		SN7_SN5 |-> TBZ,
    		SN5_C |-> TBZ1,
    		SN12_SN6 |-> TDQ,
    		SN6_SN20 |-> TDR,
    		SN20_SN7 |-> TCN  
  }
  & /* @axm11 */ RouteLast = {
    		A_SN3 |-> TAA,
    		D_SN2 |-> TBU11,
    		E_SN12 |-> TDQ1,
    		SN3_SN14 |-> TAA1,
    		SN14_SN16 |-> TAB,
    		SN16_SN |-> TCM,
    		SN16_SN8 |-> TAE,
    		SN_SN19 |-> TCL,
    		SN19_F |-> TCK,
    		SN8_SN1 |-> TAE2,
    		SN1_B |-> TAG,
    		SN2_SN18 |-> TBU1,
    		SN18_SN10 |-> TBV,
    		SN10_SN11 |-> TBW1,
    		SN11_SN4 |-> TBW,
    		SN4_SN7 |-> TBY,
    		SN7_SN5 |-> TBZ,
    		SN5_C |-> TBZ1,
    		SN12_SN6 |-> TDQ,
    		SN6_SN20 |-> TDR,
    		SN20_SN7 |-> TBY  
  	}
  & /* @axm12 */ SignalFree = {
    			A_SN3 |-> {TAA} ,
	
    			D_SN2 |-> {TBU11} ,
	
    			E_SN12 |-> {TDQ1} ,
	
    			SN3_SN14 |-> {TAA1} ,
	
    			SN14_SN16 |-> {TAB} ,
	
    			SN16_SN |-> {TAC, TAD, TCN, TCM} ,
	
    			SN16_SN8 |-> {TAC, TAD, TAE} ,
	
    			SN_SN19 |-> {TCL} ,
	
    			SN19_F |-> {TCK} ,
	
    			SN8_SN1 |-> {TAE2} ,
	
    			SN1_B |-> {TAG} ,
	
    			SN2_SN18 |-> {TBU1} ,
	
    			SN18_SN10 |-> {TBV} ,
	
    			SN10_SN11 |-> {TBW1} ,
	
    			SN11_SN4 |-> {TBW} ,
	
    			SN4_SN7 |-> {TBX, TBY} ,
	
    			SN7_SN5 |-> {TBZ} ,
	
    			SN5_C |-> {TBZ1} ,
	
    			SN12_SN6 |-> {TDQ} ,
	
    			SN6_SN20 |-> {TDR} ,
	
    			SN20_SN7 |-> {TCN, TAD, TAC, TBX, TBY} 	
  
  	}
  & /* @axm13 */ SignalOccupied = {
    			A_SN3 |-> {} ,
	
    			D_SN2 |-> {} ,
	
    			E_SN12 |-> {} ,
	
    			SN3_SN14 |-> {} ,
	
    			SN14_SN16 |-> {} ,
	
    			SN16_SN |-> {} ,
	
    			SN16_SN8 |-> {} ,
	
    			SN_SN19 |-> {} ,
	
    			SN19_F |-> {} ,
	
    			SN8_SN1 |-> {} ,
	
    			SN1_B |-> {} ,
	
    			SN2_SN18 |-> {} ,
	
    			SN18_SN10 |-> {} ,
	
    			SN10_SN11 |-> {} ,
	
    			SN11_SN4 |-> {} ,
	
    			SN4_SN7 |-> {} ,
	
    			SN7_SN5 |-> {} ,
	
    			SN5_C |-> {} ,
	
    			SN12_SN6 |-> {} ,
	
    			SN6_SN20 |-> {} ,
	
    			SN20_SN7 |-> {} 	
  
  	}
  & /* @axm14 */ SignalRed = {
    			A_SN3 |-> {} ,
    			D_SN2 |-> {} ,
    			E_SN12 |-> {} ,
    			SN3_SN14 |-> {} ,
    			SN14_SN16 |-> {} ,
    			SN16_SN |-> {} ,
    			SN16_SN8 |-> {} ,
    			SN_SN19 |-> {} ,
    			SN19_F |-> {} ,
    			SN8_SN1 |-> {} ,
    			SN1_B |-> {} ,
    			SN2_SN18 |-> {} ,
    			SN18_SN10 |-> {} ,
    			SN10_SN11 |-> {} ,
    			SN11_SN4 |-> {} ,
    			SN4_SN7 |-> {} ,
    			SN7_SN5 |-> {} ,
    			SN5_C |-> {} ,
    			SN12_SN6 |-> {} ,
    			SN6_SN20 |-> {} ,
    			SN20_SN7 |-> {}   
  	}
  & /* @axm15 */ SignalGreen = {
    			A_SN3 |-> {} ,
    			D_SN2 |-> {} ,
    			E_SN12 |-> {} ,
    			SN3_SN14 |-> {} ,
    			SN14_SN16 |-> {} ,
    			SN16_SN |-> {} ,
    			SN16_SN8 |-> {} ,
    			SN_SN19 |-> {} ,
    			SN19_F |-> {} ,
    			SN8_SN1 |-> {} ,
    			SN1_B |-> {} ,
    			SN2_SN18 |-> {} ,
    			SN18_SN10 |-> {} ,
    			SN10_SN11 |-> {} ,
    			SN11_SN4 |-> {} ,
    			SN4_SN7 |-> {} ,
    			SN7_SN5 |-> {} ,
    			SN5_C |-> {} ,
    			SN12_SN6 |-> {} ,
    			SN6_SN20 |-> {} ,
    			SN20_SN7 |-> {}   
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

