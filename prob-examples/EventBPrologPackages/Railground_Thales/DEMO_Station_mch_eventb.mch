
MACHINE DEMO_Station_mch_eventb
SETS /* enumerated */
  RAIL_CTOR={E1E,E2E,E3E,E4E,T1A,T1B,T2A,T2B,T3A,T3B,T4A,T4B,T5A,T5B,T6A,T6B,T7A,T7B,T8A,T8B,P1T,P1L,P1R,P2T,P2L,P2R,P3T,P3L,P3R,P4T,P4L,P4R,C1A,C1B,C1C,C1D};
  RAIL_ELEM={T1,T2,T3,T4,T5,T6,T7,T8,P1,P2,P3,P4,C1};
  RAIL_SGMT={T1A_T1B,T1B_T1A,T2A_T2B,T2B_T2A,T3A_T3B,T3B_T3A,T4A_T4B,T4B_T4A,T5A_T5B,T5B_T5A,T6A_T6B,T6B_T6A,T7A_T7B,T7B_T7A,T8A_T8B,T8B_T8A,P1T_P1L,P1L_P1T,P1T_P1R,P1R_P1T,P2T_P2L,P2L_P2T,P2T_P2R,P2R_P2T,P3T_P3L,P3L_P3T,P3T_P3R,P3R_P3T,P4T_P4L,P4L_P4T,P4T_P4R,P4R_P4T,C1A_C1D,C1D_C1A,C1B_C1C,C1C_C1B};
  RAIL_TERM={E1,E2,E3,E4};
  RAIL_POS_ENUM={RAIL_POS_X,RAIL_POS_F,RAIL_POS_L,RAIL_POS_R};
  TVD_SECT={VT1,VT2,VT3,VT4,VT5,VT6,VT7,VT8,VP1,VP2,VP3,VP4,VC1};
  TVD_STATE_ENUM={TVD_STATE_VACANT,TVD_STATE_OCCUPIED};
  SIGNAL={S1,S2,S3,S4,S5,S6,S7,S8,S9,S0};
  SIGNAL_ASPECT_ENUM={SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED};
  PATH_ENUM={R01,R02,R03,R04,R05,R06,R07,R08,R09,R10,R11,R12,R13,R14}
CONCRETE_CONSTANTS
  RAIL_ELEM_CONN_ALL,
  RAIL_ELEM_CONN_DEFAULT,
  RAIL_ELEM_CTOR,
  RAIL_LINK,
  RAIL_SGMT_CTOR,
  RAIL_SGMT_ELEM,
  RAIL_TERM_CTOR,
  RAIL_ELEM_POS_CONN,
  RAIL_ELEM_POS_DEFAULT,
  TVD_SECT_SGMT,
  TVD_SGMT_SECT,
  SIGNAL_ASPECT_AVAIL,
  SIGNAL_ASPECT_DEFAULT,
  SIGNAL_CTOR,
  PATH_CTOR_BEG,
  PATH_CTOR_END,
  PATH_ELEM_POS,
  PATH_SGMT_ALL,
  PATH_SGMT_FST,
  PATH_SGMT_LST,
  PATH_SGMT_NXT,
  PATH_EXCL
ABSTRACT_VARIABLES
  PATH_ACT,
  PATH_SGMT_ACT,
  PATH_SGMT_CURR,
  PATH_SGMT_REQ,
  PATH_REQ,
  PATH_CURR,
  RAIL_ELEM_PATH_CURR,
  SIGNAL_ASPECT_CURR,
  TVDS_STATE_CURR,
  RAIL_ELEM_POS_CURR,
  RAIL_ELEM_CONN_CURR
/* PROMOTED OPERATIONS
  set_RAIL_ELEM_POS_CURR,
  set_RAIL_ELEM_PATH,
  set_TVDS_STATE_CURR,
  set_TVDS_STATE_PATH,
  set_SIGNAL_ASPECT_PROCEED,
  set_SIGNAL_ASPECT_DEFAULT,
  add_PATH_CURR,
  mod_PATH_CURR,
  rem_PATH_CURR,
  add_PATH_REQ,
  rem_PATH_REQ */
PROPERTIES
    TVD_SGMT_SECT : POW(RAIL_SGMT * TVD_SECT)
  & SIGNAL_ASPECT_DEFAULT : SIGNAL_ASPECT_ENUM
  & PATH_EXCL : POW(PATH_ENUM * PATH_ENUM)
  & /* @1_Rails_C:RAIL_ELEM_CTOR·type  */ RAIL_ELEM_CTOR : RAIL_ELEM --> POW1(RAIL_CTOR)
  & /* @1_Rails_C:RAIL_TERM_CTOR·type  */ RAIL_TERM_CTOR : RAIL_TERM --> RAIL_CTOR
  & /* @1_Rails_C:RAIL_CTOR·union  */ union(ran(RAIL_ELEM_CTOR)) \/ ran(RAIL_TERM_CTOR) = RAIL_CTOR
  & /* @1_Rails_C:RAIL_CTOR·inter·elem·elem  */ !(elem1,elem2).((elem1 : RAIL_ELEM & elem2 : RAIL_ELEM) & (elem1 /= elem2 & 1=1 /* LEQ_SYM_BREAK(elem1,elem2) */) => RAIL_ELEM_CTOR(elem1) /\ RAIL_ELEM_CTOR(elem2) = {})
  & /* @1_Rails_C:RAIL_CTOR·inter·term·term  */ !(term1,term2).((term1 : RAIL_TERM & term2 : RAIL_TERM) & (term1 /= term2 & 1=1 /* LEQ_SYM_BREAK(term1,term2) */) => RAIL_TERM_CTOR(term1) /= RAIL_TERM_CTOR(term2))
  & /* @1_Rails_C:RAIL_CTOR·inter·term·elem  */ !(term,elem).(term : RAIL_TERM & elem : RAIL_ELEM => RAIL_TERM_CTOR(term) /: RAIL_ELEM_CTOR(elem))
  & /* @1_Rails_C:RAIL_SGMT_CTOR.type  */ RAIL_SGMT_CTOR : RAIL_SGMT --> RAIL_CTOR * RAIL_CTOR
  & /* @1_Rails_C:RAIL_LINK·type  */ RAIL_LINK : RAIL_CTOR >->> RAIL_CTOR
  & /* @1_Rails_C:RAIL_LINK·symm  */ RAIL_LINK = RAIL_LINK~
  & /* @1_Rails_C:RAIL_LINK·diff  */ !(elem,conn1,conn2).(elem : RAIL_ELEM & (conn1 : RAIL_ELEM_CTOR(elem) & conn2 : RAIL_ELEM_CTOR(elem)) => (conn1 |-> conn2) /: RAIL_LINK)
  & /* @1_Rails_C:RAIL_ELEM_CONN_ALL·type  */ RAIL_ELEM_CONN_ALL : RAIL_ELEM --> POW(POW(RAIL_SGMT))
  & /* @1_Rails_C:RAIL_ELEM_CONN_ALL·symm  */ !(elem,conn).(elem : RAIL_ELEM & conn : RAIL_ELEM_CONN_ALL(elem) => RAIL_SGMT_CTOR[conn] = RAIL_SGMT_CTOR[conn]~)
  & /* @1_Rails_C:RAIL_ELEM_CONN_ALL·reflex  */ !(elem,conn).(elem : RAIL_ELEM & conn : RAIL_ELEM_CONN_ALL(elem) => RAIL_SGMT_CTOR[conn] /\ id(RAIL_CTOR) = {})
  & /* @1_Rails_C:RAIL_ELEM_CONN_ALL·total·dom  */ !elem.(elem : RAIL_ELEM => dom(RAIL_SGMT_CTOR[union(RAIL_ELEM_CONN_ALL(elem))]) = RAIL_ELEM_CTOR(elem))
  & /* @1_Rails_C:RAIL_ELEM_CONN_ALL·total·ran  */ !elem.(elem : RAIL_ELEM => ran(RAIL_SGMT_CTOR[union(RAIL_ELEM_CONN_ALL(elem))]) = RAIL_ELEM_CTOR(elem))
  & /* @1_Rails_C:RAIL_ELEM_CONN_ALL·unique  */ !(elem,conn1,conn2).(elem : RAIL_ELEM & (conn1 : RAIL_ELEM_CONN_ALL(elem) & (conn2 : RAIL_ELEM_CONN_ALL(elem) & conn1 /= conn2)) => conn1 /\ conn2 = {})
  & /* @1_Rails_C:RAIL_ELEM_CONN_DEFAULT·type  */ RAIL_ELEM_CONN_DEFAULT : RAIL_ELEM --> POW(RAIL_SGMT)
  & /* @1_Rails_C:RAIL_ELEM_CONN_DEFAULT·valid  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_CONN_DEFAULT(elem) : RAIL_ELEM_CONN_ALL(elem))
  & /* @1_Rails_C:RAIL_SGMT_ELEM·value  */ RAIL_SGMT_ELEM = {sgmt,elem|elem : RAIL_ELEM & sgmt : union(RAIL_ELEM_CONN_ALL(elem))}
  & /* @1_Rails_C:RAIL_SGMT_ELEM·type  */ RAIL_SGMT_ELEM : RAIL_SGMT --> RAIL_ELEM
  & /* @2_ElementPosition_C:RAIL_ELEM_POS_CONN·type  */ RAIL_ELEM_POS_CONN : RAIL_ELEM --> (RAIL_POS_ENUM +-> POW(RAIL_SGMT))
  & /* @2_ElementPosition_C:RAIL_ELEM_POS_CONN·diff  */ !(elem,pos1,pos2).(elem : RAIL_ELEM & (pos1 : dom(RAIL_ELEM_POS_CONN(elem)) & (pos2 : dom(RAIL_ELEM_POS_CONN(elem)) & pos1 /= pos2)) => RAIL_ELEM_POS_CONN(elem)(pos1) /= RAIL_ELEM_POS_CONN(elem)(pos2))
  & /* @2_ElementPosition_C:RAIL_ELEM_CONN_ALL·glue  */ RAIL_ELEM_CONN_ALL = {elem,conn|(elem : RAIL_ELEM & conn : POW(POW(RAIL_SGMT))) & conn = ran(RAIL_ELEM_POS_CONN(elem))}
  & /* @2_ElementPosition_C:RAIL_ELEM_POS_DEFAULT·type  */ RAIL_ELEM_POS_DEFAULT : RAIL_ELEM --> RAIL_POS_ENUM
  & /* @2_ElementPosition_C:RAIL_ELEM_POS_DEFAULT·valid  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_POS_DEFAULT(elem) : dom(RAIL_ELEM_POS_CONN(elem)))
  & /* @2_ElementPosition_C:RAIL_ELEM_CONN_DEFAULT·glue  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_CONN_DEFAULT(elem) = RAIL_ELEM_POS_CONN(elem)(RAIL_ELEM_POS_DEFAULT(elem)))
  & /* @3_VacancyDetection_C:TVD_SECT_SGMT·type  */ TVD_SECT_SGMT : TVD_SECT --> POW(RAIL_SGMT)
  & /* @3_VacancyDetection_C:TVD_SECT_SGMT·disjunct  */ !(sect1,sect2).((sect1 : TVD_SECT & sect2 : TVD_SECT) & (sect1 /= sect2 & 1=1 /* LEQ_SYM_BREAK(sect1,sect2) */) => TVD_SECT_SGMT(sect1) /\ TVD_SECT_SGMT(sect2) = {})
  & /* @3_VacancyDetection_C:TVD_SECT_SGMT·all  */ union(ran(TVD_SECT_SGMT)) = RAIL_SGMT
  & /* @3_VacancyDetection_C:TVD_SGMT_SECT·value  */ TVD_SGMT_SECT = {sgmt,sect|sect : TVD_SECT & sgmt : TVD_SECT_SGMT(sect)}
  & /* @4_Signals_C:SIGNAL_CTOR·type  */ SIGNAL_CTOR : SIGNAL --> RAIL_CTOR
  & /* @4_Signals_C:SIGNAL_ASPECT_AVAIL·type  */ SIGNAL_ASPECT_AVAIL : SIGNAL --> POW1(SIGNAL_ASPECT_ENUM)
  & /* @4_Signals_C:SIGNAL_ASPECT_DEFAULT·avail  */ !sig.(sig : SIGNAL => SIGNAL_ASPECT_DEFAULT : SIGNAL_ASPECT_AVAIL(sig))
  & /* @5_Paths_C:PATH_ELEM_POS·type  */ PATH_ELEM_POS : PATH_ENUM --> (RAIL_ELEM +-> RAIL_POS_ENUM)
  & /* @5_Paths_C:PATH_SGMT_ALL·type  */ PATH_SGMT_ALL : PATH_ENUM --> POW(RAIL_SGMT)
  & /* @5_Paths_C:PATH_SGMT_ALL·card  */ !path.(path : PATH_ENUM => card(PATH_SGMT_ALL(path)) = card(PATH_ELEM_POS(path)))
  & /* @5_Paths_C:PATH_SGMT·single_elem  */ !(path,sgmt1,sgmt2,elem1,elem2).(((path : PATH_ENUM & elem1 : RAIL_ELEM) & elem2 : RAIL_ELEM) & (sgmt1 : PATH_SGMT_ALL(path) & (sgmt2 : PATH_SGMT_ALL(path) & (sgmt1 /= sgmt2 & (sgmt1 |-> elem1 : RAIL_SGMT_ELEM & sgmt2 |-> elem2 : RAIL_SGMT_ELEM)))) => elem1 /= elem2)
  & /* @5_Paths_C:PATH_ELEM_POS·valid·single  */ !(path,elem).(path : PATH_ENUM & elem : dom(PATH_ELEM_POS(path)) => PATH_ELEM_POS(path)(elem) : dom(RAIL_ELEM_POS_CONN(elem)))
  & /* @5_Paths_C:PATH_ELEM_POS_SGMT·glue  */ !(path,elem,pos).((path : PATH_ENUM & elem : RAIL_ELEM) & (pos : dom(RAIL_ELEM_POS_CONN(elem)) & elem |-> pos : PATH_ELEM_POS(path)) => #sgmt.(sgmt : RAIL_SGMT & not(sgmt : PATH_SGMT_ALL(path))) or #sgmt.(sgmt : RAIL_ELEM_POS_CONN(elem)(pos)))
  & /* @5_Paths_C:PATH_SGMT_ELEM_POS·glue  */ !(path,sgmt).(path : PATH_ENUM & sgmt : PATH_SGMT_ALL(path) => (#elem.(elem : RAIL_ELEM & /* falsity */ not(/* truth */ elem : RAIL_ELEM)) or (#(elem,pos).((elem : RAIL_ELEM & pos : RAIL_POS_ENUM) & not(pos : dom(RAIL_ELEM_POS_CONN(elem)))) or #(elem,pos).((elem : RAIL_ELEM & pos : RAIL_POS_ENUM) & not(elem |-> pos : PATH_ELEM_POS(path))))) or #(elem,pos).((elem : RAIL_ELEM & pos : RAIL_POS_ENUM) & sgmt : RAIL_ELEM_POS_CONN(elem)(pos)))
  & /* @5_Paths_C:PATH_CTOR_BEG·type  */ PATH_CTOR_BEG : PATH_ENUM --> RAIL_CTOR
  & /* @5_Paths_C:PATH_CTOR_END·type  */ PATH_CTOR_END : PATH_ENUM --> RAIL_CTOR
  & /* @5_Paths_C:PATH_CTOR_BEG·dom  */ !path.(path : PATH_ENUM => PATH_CTOR_BEG(path) : dom(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]))
  & /* @5_Paths_C:PATH_CTOR_END·ran  */ !path.(path : PATH_ENUM => PATH_CTOR_END(path) : ran(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]))
  & /* @5_Paths_C:PATH_CTOR_BEG·link  */ !(path,endCtor).(path : PATH_ENUM & endCtor : ran(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]) => (endCtor |-> PATH_CTOR_BEG(path)) /: RAIL_LINK)
  & /* @5_Paths_C:PATH_CTOR_END·link  */ !(path,begCtor).(path : PATH_ENUM & begCtor : dom(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]) => (PATH_CTOR_END(path) |-> begCtor) /: RAIL_LINK)
  & /* @5_Paths_C:PATH_CTOR_BEG·single  */ !(path,begCtor,endCtor).((path : PATH_ENUM & endCtor : RAIL_CTOR) & (begCtor : dom(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]) - {PATH_CTOR_BEG(path)} & endCtor |-> begCtor : RAIL_LINK) => endCtor : ran(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]))
  & /* @5_Paths_C:PATH_CTOR_END·single  */ !(path,endCtor,begCtor).((path : PATH_ENUM & begCtor : RAIL_CTOR) & (endCtor : ran(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]) - {PATH_CTOR_END(path)} & endCtor |-> begCtor : RAIL_LINK) => begCtor : dom(RAIL_SGMT_CTOR[PATH_SGMT_ALL(path)]))
  & /* @5_Paths_C:PATH_SGMT_FST·type  */ PATH_SGMT_FST : PATH_ENUM --> RAIL_SGMT
  & /* @5_Paths_C:PATH_SGMT_LST·type  */ PATH_SGMT_LST : PATH_ENUM --> RAIL_SGMT
  & /* @5_Paths_C:PATH_SGMT_FST_BEG·glue  */ !path.(path : PATH_ENUM => PATH_CTOR_BEG(path) = prj1(RAIL_CTOR,RAIL_CTOR)(RAIL_SGMT_CTOR(PATH_SGMT_FST(path))))
  & /* @5_Paths_C:PATH_SGMT_LST_END·glue  */ !path.(path : PATH_ENUM => PATH_CTOR_END(path) = prj2(RAIL_CTOR,RAIL_CTOR)(RAIL_SGMT_CTOR(PATH_SGMT_LST(path))))
  & /* @5_Paths_C:PATH_SGMT_FST·valid  */ !path.(path : PATH_ENUM => PATH_SGMT_FST(path) : PATH_SGMT_ALL(path))
  & /* @5_Paths_C:PATH_SGMT_LST·valid  */ !path.(path : PATH_ENUM => PATH_SGMT_LST(path) : PATH_SGMT_ALL(path))
  & /* @5_Paths_C:PATH_SGMT_NXT·type  */ PATH_SGMT_NXT : PATH_ENUM --> (RAIL_SGMT >+> RAIL_SGMT)
  & /* @5_Paths_C:PATH_SGMT_NXT·valid·dom  */ !path.(path : PATH_ENUM => dom(PATH_SGMT_NXT(path)) \/ {PATH_SGMT_LST(path)} = PATH_SGMT_ALL(path))
  & /* @5_Paths_C:PATH_SGMT_NXT·valid·ran  */ !path.(path : PATH_ENUM => ran(PATH_SGMT_NXT(path)) \/ {PATH_SGMT_FST(path)} = PATH_SGMT_ALL(path))
  & /* @7_PathLifecycle_C:PATH_EXCL·symm  */ PATH_EXCL = PATH_EXCL~
  & /* @7_PathLifecycle_C:PATH_EXCL_irreflexive  */ PATH_EXCL /\ id(PATH_ENUM) = {}
  & /* @DEMO_Station_C:RAIL_ELEM_CTOR·data  */ RAIL_ELEM_CTOR = {T1 |-> {T1A,T1B},T2 |-> {T2A,T2B},T3 |-> {T3A,T3B},T4 |-> {T4A,T4B},T5 |-> {T5A,T5B},T6 |-> {T6A,T6B},T7 |-> {T7A,T7B},T8 |-> {T8A,T8B},P1 |-> {P1T,P1L,P1R},P2 |-> {P2T,P2L,P2R},P3 |-> {P3T,P3L,P3R},P4 |-> {P4T,P4L,P4R},C1 |-> {C1A,C1B,C1C,C1D}}
  & /* @DEMO_Station_C:RAIL_TERM_CTOR·data  */ RAIL_TERM_CTOR = {E1 |-> E1E,E2 |-> E2E,E3 |-> E3E,E4 |-> E4E}
  & /* @DEMO_Station_C:RAIL_SGMT_CTOR·data  */ RAIL_SGMT_CTOR = {T1A_T1B |-> (T1A |-> T1B),T1B_T1A |-> (T1B |-> T1A),T2A_T2B |-> (T2A |-> T2B),T2B_T2A |-> (T2B |-> T2A),T3A_T3B |-> (T3A |-> T3B),T3B_T3A |-> (T3B |-> T3A),T4A_T4B |-> (T4A |-> T4B),T4B_T4A |-> (T4B |-> T4A),T5A_T5B |-> (T5A |-> T5B),T5B_T5A |-> (T5B |-> T5A),T6A_T6B |-> (T6A |-> T6B),T6B_T6A |-> (T6B |-> T6A),T7A_T7B |-> (T7A |-> T7B),T7B_T7A |-> (T7B |-> T7A),T8A_T8B |-> (T8A |-> T8B),T8B_T8A |-> (T8B |-> T8A),P1T_P1L |-> (P1T |-> P1L),P1L_P1T |-> (P1L |-> P1T),P1T_P1R |-> (P1T |-> P1R),P1R_P1T |-> (P1R |-> P1T),P2T_P2L |-> (P2T |-> P2L),P2L_P2T |-> (P2L |-> P2T),P2T_P2R |-> (P2T |-> P2R),P2R_P2T |-> (P2R |-> P2T),P3T_P3L |-> (P3T |-> P3L),P3L_P3T |-> (P3L |-> P3T),P3T_P3R |-> (P3T |-> P3R),P3R_P3T |-> (P3R |-> P3T),P4T_P4L |-> (P4T |-> P4L),P4L_P4T |-> (P4L |-> P4T),P4T_P4R |-> (P4T |-> P4R),P4R_P4T |-> (P4R |-> P4T),C1A_C1D |-> (C1A |-> C1D),C1D_C1A |-> (C1D |-> C1A),C1B_C1C |-> (C1B |-> C1C),C1C_C1B |-> (C1C |-> C1B)}
  & /* @DEMO_Station_C:RAIL_LINK·data  */ RAIL_LINK = {E1E |-> T1A,E2E |-> T4B,E3E |-> T5A,E4E |-> T8B,T1A |-> E1E,T1B |-> T2A,T2A |-> T1B,T2B |-> P1T,T3A |-> P2T,T3B |-> T4A,T4A |-> T3B,T4B |-> E2E,T5A |-> E3E,T5B |-> T6A,T6A |-> T5B,T6B |-> P3T,T7A |-> P4T,T7B |-> T8A,T8A |-> T7B,T8B |-> E4E,P1T |-> T2B,P1L |-> C1C,P1R |-> P2L,P2T |-> T3A,P2L |-> P1R,P2R |-> C1A,P3T |-> T6B,P3L |-> C1B,P3R |-> P4L,P4T |-> T7A,P4L |-> P3R,P4R |-> C1D,C1A |-> P2R,C1B |-> P3L,C1C |-> P1L,C1D |-> P4R}
  & /* @DEMO_Station_C:RAIL_ELEM_POS_CONN·data  */ RAIL_ELEM_POS_CONN = {T1 |-> {RAIL_POS_F |-> {T1A_T1B,T1B_T1A}},T2 |-> {RAIL_POS_F |-> {T2A_T2B,T2B_T2A}},T3 |-> {RAIL_POS_F |-> {T3A_T3B,T3B_T3A}},T4 |-> {RAIL_POS_F |-> {T4A_T4B,T4B_T4A}},T5 |-> {RAIL_POS_F |-> {T5A_T5B,T5B_T5A}},T6 |-> {RAIL_POS_F |-> {T6A_T6B,T6B_T6A}},T7 |-> {RAIL_POS_F |-> {T7A_T7B,T7B_T7A}},T8 |-> {RAIL_POS_F |-> {T8A_T8B,T8B_T8A}},P1 |-> {RAIL_POS_X |-> {},RAIL_POS_L |-> {P1T_P1L,P1L_P1T},RAIL_POS_R |-> {P1T_P1R,P1R_P1T}},P2 |-> {RAIL_POS_X |-> {},RAIL_POS_L |-> {P2T_P2L,P2L_P2T},RAIL_POS_R |-> {P2T_P2R,P2R_P2T}},P3 |-> {RAIL_POS_X |-> {},RAIL_POS_L |-> {P3T_P3L,P3L_P3T},RAIL_POS_R |-> {P3T_P3R,P3R_P3T}},P4 |-> {RAIL_POS_X |-> {},RAIL_POS_L |-> {P4T_P4L,P4L_P4T},RAIL_POS_R |-> {P4T_P4R,P4R_P4T}},C1 |-> {RAIL_POS_F |-> {C1A_C1D,C1D_C1A,C1B_C1C,C1C_C1B}}}
  & /* @DEMO_Station_C:RAIL_ELEM_POS_DEFAULT·data  */ RAIL_ELEM_POS_DEFAULT = {T1 |-> RAIL_POS_F,T2 |-> RAIL_POS_F,T3 |-> RAIL_POS_F,T4 |-> RAIL_POS_F,T5 |-> RAIL_POS_F,T6 |-> RAIL_POS_F,T7 |-> RAIL_POS_F,T8 |-> RAIL_POS_F,P1 |-> RAIL_POS_X,P2 |-> RAIL_POS_X,P3 |-> RAIL_POS_X,P4 |-> RAIL_POS_X,C1 |-> RAIL_POS_F}
  & /* @DEMO_Station_C:TVD_SECT_SGMT·data  */ TVD_SECT_SGMT = {VT1 |-> {T1A_T1B,T1B_T1A},VT2 |-> {T2A_T2B,T2B_T2A},VT3 |-> {T3A_T3B,T3B_T3A},VT4 |-> {T4A_T4B,T4B_T4A},VT5 |-> {T5A_T5B,T5B_T5A},VT6 |-> {T6A_T6B,T6B_T6A},VT7 |-> {T7A_T7B,T7B_T7A},VT8 |-> {T8A_T8B,T8B_T8A},VP1 |-> {P1T_P1L,P1L_P1T,P1T_P1R,P1R_P1T},VP2 |-> {P2T_P2L,P2L_P2T,P2T_P2R,P2R_P2T},VP3 |-> {P3T_P3L,P3L_P3T,P3T_P3R,P3R_P3T},VP4 |-> {P4T_P4L,P4L_P4T,P4T_P4R,P4R_P4T},VC1 |-> {C1A_C1D,C1D_C1A,C1B_C1C,C1C_C1B}}
  & /* @DEMO_Station_C:SIGNAL_CTOR·data  */ SIGNAL_CTOR = {S1 |-> T4B,S2 |-> T1B,S3 |-> T6A,S4 |-> T8A,S5 |-> T1A,S6 |-> T4A,S7 |-> T7B,S8 |-> T5B,S9 |-> P2L,S0 |-> P1R}
  & /* @DEMO_Station_C:SIGNAL_ASPECT_AVAIL·data  */ SIGNAL_ASPECT_AVAIL = {S1 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S2 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S3 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S4 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S5 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S6 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S7 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S8 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S9 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED},S0 |-> {SIGNAL_ASPECT_STOP,SIGNAL_ASPECT_PROCEED}}
  & /* @DEMO_Station_C:SIGNAL_ASPECT_DEFAULT·data  */ SIGNAL_ASPECT_DEFAULT = SIGNAL_ASPECT_STOP
  & /* @DEMO_Station_C:PATH_ELEM_POS·data  */ PATH_ELEM_POS = {R01 |-> {T4 |-> RAIL_POS_F,T3 |-> RAIL_POS_F,P2 |-> RAIL_POS_R,C1 |-> RAIL_POS_F,P4 |-> RAIL_POS_R,T7 |-> RAIL_POS_F},R02 |-> {T4 |-> RAIL_POS_F,T3 |-> RAIL_POS_F,P2 |-> RAIL_POS_L},R03 |-> {T1 |-> RAIL_POS_F},R04 |-> {T6 |-> RAIL_POS_F,P3 |-> RAIL_POS_L,C1 |-> RAIL_POS_F,P1 |-> RAIL_POS_L,T2 |-> RAIL_POS_F},R05 |-> {T6 |-> RAIL_POS_F,P3 |-> RAIL_POS_R,P4 |-> RAIL_POS_L,T7 |-> RAIL_POS_F},R06 |-> {T1 |-> RAIL_POS_F,T2 |-> RAIL_POS_F,P1 |-> RAIL_POS_L,C1 |-> RAIL_POS_F,P3 |-> RAIL_POS_L,T6 |-> RAIL_POS_F},R07 |-> {T1 |-> RAIL_POS_F,T2 |-> RAIL_POS_F,P1 |-> RAIL_POS_R},R08 |-> {T8 |-> RAIL_POS_F},R09 |-> {T4 |-> RAIL_POS_F},R10 |-> {T7 |-> RAIL_POS_F,P4 |-> RAIL_POS_R,C1 |-> RAIL_POS_F,P2 |-> RAIL_POS_R,T3 |-> RAIL_POS_F},R11 |-> {T7 |-> RAIL_POS_F,P4 |-> RAIL_POS_L,P3 |-> RAIL_POS_R,T6 |-> RAIL_POS_F},R12 |-> {T5 |-> RAIL_POS_F},R13 |-> {P2 |-> RAIL_POS_L,T3 |-> RAIL_POS_F},R14 |-> {P1 |-> RAIL_POS_R,T2 |-> RAIL_POS_F}}
  & /* @DEMO_Station_C:PATH_SGMT_ALL·data  */ PATH_SGMT_ALL = {R01 |-> {T4B_T4A,T3B_T3A,P2T_P2R,C1A_C1D,P4R_P4T,T7A_T7B},R02 |-> {T4B_T4A,T3B_T3A,P2T_P2L},R03 |-> {T1B_T1A},R04 |-> {T6A_T6B,P3T_P3L,C1B_C1C,P1L_P1T,T2B_T2A},R05 |-> {T6A_T6B,P3T_P3R,P4L_P4T,T7A_T7B},R06 |-> {T1A_T1B,T2A_T2B,P1T_P1L,C1C_C1B,P3L_P3T,T6B_T6A},R07 |-> {T1A_T1B,T2A_T2B,P1T_P1R},R08 |-> {T8A_T8B},R09 |-> {T4A_T4B},R10 |-> {T7B_T7A,P4T_P4R,C1D_C1A,P2R_P2T,T3A_T3B},R11 |-> {T7B_T7A,P4T_P4L,P3R_P3T,T6B_T6A},R12 |-> {T5B_T5A},R13 |-> {P2L_P2T,T3A_T3B},R14 |-> {P1R_P1T,T2B_T2A}}
  & /* @DEMO_Station_C:PATH_CTOR_BEG·data  */ PATH_CTOR_BEG = {R01 |-> T4B,R02 |-> T4B,R03 |-> T1B,R04 |-> T6A,R05 |-> T6A,R06 |-> T1A,R07 |-> T1A,R08 |-> T8A,R09 |-> T4A,R10 |-> T7B,R11 |-> T7B,R12 |-> T5B,R13 |-> P2L,R14 |-> P1R}
  & /* @DEMO_Station_C:PATH_CTOR_END·data  */ PATH_CTOR_END = {R01 |-> T7B,R02 |-> P2L,R03 |-> T1A,R04 |-> T2A,R05 |-> T7B,R06 |-> T6A,R07 |-> P1R,R08 |-> T8B,R09 |-> T4B,R10 |-> T3B,R11 |-> T6A,R12 |-> T5A,R13 |-> T3B,R14 |-> T2A}
  & /* @DEMO_Station_C:PATH_SGMT_FST·data  */ PATH_SGMT_FST = {R01 |-> T4B_T4A,R02 |-> T4B_T4A,R03 |-> T1B_T1A,R04 |-> T6A_T6B,R05 |-> T6A_T6B,R06 |-> T1A_T1B,R07 |-> T1A_T1B,R08 |-> T8A_T8B,R09 |-> T4A_T4B,R10 |-> T7B_T7A,R11 |-> T7B_T7A,R12 |-> T5B_T5A,R13 |-> P2L_P2T,R14 |-> P1R_P1T}
  & /* @DEMO_Station_C:PATH_SGMT_LST·data  */ PATH_SGMT_LST = {R01 |-> T7A_T7B,R02 |-> P2T_P2L,R03 |-> T1B_T1A,R04 |-> T2B_T2A,R05 |-> T7A_T7B,R06 |-> T6B_T6A,R07 |-> P1T_P1R,R08 |-> T8A_T8B,R09 |-> T4A_T4B,R10 |-> T3A_T3B,R11 |-> T6B_T6A,R12 |-> T5B_T5A,R13 |-> T3A_T3B,R14 |-> T2B_T2A}
  & /* @DEMO_Station_C:PATH_SGMT_NXT·data  */ PATH_SGMT_NXT = {R01 |-> {T4B_T4A |-> T3B_T3A,T3B_T3A |-> P2T_P2R,P2T_P2R |-> C1A_C1D,C1A_C1D |-> P4R_P4T,P4R_P4T |-> T7A_T7B},R02 |-> {T4B_T4A |-> T3B_T3A,T3B_T3A |-> P2T_P2L},R03 |-> {},R04 |-> {T6A_T6B |-> P3T_P3L,P3T_P3L |-> C1B_C1C,C1B_C1C |-> P1L_P1T,P1L_P1T |-> T2B_T2A},R05 |-> {T6A_T6B |-> P3T_P3R,P3T_P3R |-> P4L_P4T,P4L_P4T |-> T7A_T7B},R06 |-> {T1A_T1B |-> T2A_T2B,T2A_T2B |-> P1T_P1L,P1T_P1L |-> C1C_C1B,C1C_C1B |-> P3L_P3T,P3L_P3T |-> T6B_T6A},R07 |-> {T1A_T1B |-> T2A_T2B,T2A_T2B |-> P1T_P1R},R08 |-> {},R09 |-> {},R10 |-> {T7B_T7A |-> P4T_P4R,P4T_P4R |-> C1D_C1A,C1D_C1A |-> P2R_P2T,P2R_P2T |-> T3A_T3B},R11 |-> {T7B_T7A |-> P4T_P4L,P4T_P4L |-> P3R_P3T,P3R_P3T |-> T6B_T6A},R12 |-> {},R13 |-> {P2L_P2T |-> T3A_T3B},R14 |-> {P1R_P1T |-> T2B_T2A}}
  & /* @DEMO_Station_C:PATH_EXCL·data  */ PATH_EXCL = {R02 |-> R05,R02 |-> R11,R05 |-> R02,R05 |-> R07,R05 |-> R13,R05 |-> R14,R07 |-> R05,R07 |-> R11,R11 |-> R02,R11 |-> R07,R11 |-> R13,R11 |-> R14,R13 |-> R05,R13 |-> R11,R14 |-> R05,R14 |-> R11}
INVARIANT
    PATH_ACT : POW(PATH_ENUM)
  & PATH_SGMT_ACT : POW(RAIL_SGMT)
  & PATH_SGMT_CURR : POW(RAIL_SGMT)
  & PATH_SGMT_REQ : POW(RAIL_SGMT)
  & PATH_REQ : POW(PATH_ENUM)
  & PATH_CURR : POW(PATH_ENUM)
  & /* @7_PathLifecycle:PATH_ELEM_POS·disjunct·req  */ !(path1,path2).((path1 : PATH_REQ & (path2 : PATH_REQ & path1 /= path2)) & 1=1 /* LEQ_SYM_BREAK(path1,path2) */ => dom(PATH_ELEM_POS(path1)) /\ dom(PATH_ELEM_POS(path2)) = {})
  & /* @7_PathLifecycle:PATH_ELEM_POS·disjunct·curr  */ !path.(path : PATH_REQ => dom(PATH_ELEM_POS(path)) /\ dom(RAIL_ELEM_PATH_CURR) = {})
  & /* @7_PathLifecycle:PATH_EXCL·curr  */ !path.(path : PATH_CURR => PATH_EXCL[{path}] /\ PATH_CURR = {})
  & /* @6_SignalDependency:SIGNAL_PATH·depend  */ !sig.(sig : SIGNAL & SIGNAL_ASPECT_CURR(sig) /= SIGNAL_ASPECT_DEFAULT => #path.(path : PATH_CURR & SIGNAL_CTOR(sig) = PATH_CTOR_BEG(path)))
  & /* @5_Paths:PATH_ELEM_CURR·type  */ RAIL_ELEM_PATH_CURR : RAIL_ELEM +-> PATH_CURR
  & /* @5_Paths:PATH_ELEM_CURR·val  */ !elem.(elem : dom(RAIL_ELEM_PATH_CURR) => elem : dom(PATH_ELEM_POS(RAIL_ELEM_PATH_CURR(elem))))
  & /* @5_Paths:PATH_ELEM_POS·glue  */ !elem.(elem : dom(RAIL_ELEM_PATH_CURR) => PATH_ELEM_POS(RAIL_ELEM_PATH_CURR(elem))(elem) = RAIL_ELEM_POS_CURR(elem))
  & /* @4_Signals:SIGNAL_ASPECT_CURR·type  */ SIGNAL_ASPECT_CURR : SIGNAL --> SIGNAL_ASPECT_ENUM
  & /* @4_Signals:SIGNAL_ASPECT_CURR·value  */ !sig.(sig : SIGNAL => SIGNAL_ASPECT_CURR(sig) : SIGNAL_ASPECT_AVAIL(sig))
  & /* @3_VacancyDetection:TVDS_STATE_CURR·type  */ TVDS_STATE_CURR : TVD_SECT --> TVD_STATE_ENUM
  & /* @2_ElementPosition:RAIL_ELEM_POS_CURR·type  */ RAIL_ELEM_POS_CURR : RAIL_ELEM --> RAIL_POS_ENUM
  & /* @2_ElementPosition:RAIL_ELEM_POS_CURR·valid  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_POS_CURR(elem) : dom(RAIL_ELEM_POS_CONN(elem)))
  & /* @2_ElementPosition:RAIL_ELEM_CONN_CURR·glue  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_CONN_CURR(elem) = RAIL_ELEM_POS_CONN(elem)(RAIL_ELEM_POS_CURR(elem)))
  & /* @1_Rails:RAIL_ELEM_CONN·type  */ RAIL_ELEM_CONN_CURR : RAIL_ELEM --> POW(RAIL_SGMT)
  & /* @1_Rails:RAIL_ELEM_CONN·valid  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_CONN_CURR(elem) : RAIL_ELEM_CONN_ALL(elem))
ASSERTIONS
  /* @1_Rails_C:RAIL_ELEM_CONN_ALL·ctor·dom  */ !(elem,conn).(elem : RAIL_ELEM & conn : RAIL_ELEM_CONN_ALL(elem) => dom(RAIL_SGMT_CTOR[conn]) <: RAIL_ELEM_CTOR(elem));
  /* @1_Rails_C:RAIL_ELEM_CONN_ALL·ctor·ran  */ !(elem,conn).(elem : RAIL_ELEM & conn : RAIL_ELEM_CONN_ALL(elem) => ran(RAIL_SGMT_CTOR[conn]) <: RAIL_ELEM_CTOR(elem));
  /* @2_ElementPosition_C:RAIL_ELEM_CONN_ALL·valid  */ !elem.(elem : RAIL_ELEM => RAIL_ELEM_CONN_ALL(elem) = ran(RAIL_ELEM_POS_CONN(elem)));
  /* @3_VacancyDetection_C:TVD_SGMT_SECT·type  */ TVD_SGMT_SECT : RAIL_SGMT --> TVD_SECT
INITIALISATION
    BEGIN
         RAIL_ELEM_POS_CURR := RAIL_ELEM_POS_DEFAULT
      ||
         TVDS_STATE_CURR := TVD_SECT * {TVD_STATE_VACANT}
      ||
         SIGNAL_ASPECT_CURR := {sig,asp|(sig : SIGNAL & asp : SIGNAL_ASPECT_ENUM) & asp = SIGNAL_ASPECT_DEFAULT}
      ||
         PATH_CURR := {}
      ||
         RAIL_ELEM_PATH_CURR := {}
      ||
         PATH_REQ := {}
      ||
         PATH_ACT := {}
      ||
         PATH_SGMT_CURR := {}
      ||
         PATH_SGMT_REQ := {}
      ||
         PATH_SGMT_ACT := {}
      || RAIL_ELEM_CONN_CURR := RAIL_ELEM_CONN_DEFAULT // added
    END
OPERATIONS
  set_RAIL_ELEM_POS_CURR = 
    ANY elem,pos
    WHERE 
        elem : RAIL_ELEM
      & /* @DEMO_Station:pos·valid  */ pos : dom(RAIL_ELEM_POS_CONN(elem))
      & /* @DEMO_Station:pos·diff  */ pos /= RAIL_ELEM_POS_CURR(elem)
      & /* @DEMO_Station:elem·path·curr  */ elem /: dom(RAIL_ELEM_PATH_CURR)
      & /* @DEMO_Station:elem·path·req  */ elem /: dom(union(PATH_ELEM_POS[PATH_REQ]))
    THEN
      RAIL_ELEM_POS_CURR := RAIL_ELEM_POS_CURR <+ {elem |-> pos}
    END;
  
  set_RAIL_ELEM_PATH = 
    ANY elem
    WHERE 
        /* @DEMO_Station:elem·path·req  */ elem : dom(union(PATH_ELEM_POS[PATH_REQ]))
      & /* @DEMO_Station:pos·diff  */ union(PATH_ELEM_POS[PATH_REQ])(elem) /= RAIL_ELEM_POS_CURR(elem)
    THEN
      RAIL_ELEM_POS_CURR := RAIL_ELEM_POS_CURR <+ {elem |-> union(PATH_ELEM_POS[PATH_REQ])(elem)}
    END;
  
  set_TVDS_STATE_CURR = 
    ANY sect,stat
    WHERE 
        sect : TVD_SECT
      & stat : TVD_STATE_ENUM
      & /* @DEMO_Station:stat·diff  */ stat /= TVDS_STATE_CURR(sect)
      & /* @DEMO_Station:elem·curr  */ RAIL_SGMT_ELEM[TVD_SECT_SGMT(sect)] /\ dom(RAIL_ELEM_PATH_CURR) = {}
    THEN
      TVDS_STATE_CURR := TVDS_STATE_CURR <+ {sect |-> stat}
    END;
  
  set_TVDS_STATE_PATH = 
    ANY sect,stat
    WHERE 
        sect : TVD_SECT
      & stat : TVD_STATE_ENUM
      & /* @DEMO_Station:stat·diff  */ stat /= TVDS_STATE_CURR(sect)
      & /* @DEMO_Station:elem·curr  */ (RAIL_SGMT_ELEM[TVD_SECT_SGMT(sect)] /\ dom(RAIL_ELEM_PATH_CURR)) /= {}
    THEN
      TVDS_STATE_CURR := TVDS_STATE_CURR <+ {sect |-> stat}
    END;
  
  set_SIGNAL_ASPECT_PROCEED = 
    ANY asp,sig
    WHERE 
        sig : SIGNAL
      & /* @DEMO_Station:asp·avail  */ asp : SIGNAL_ASPECT_AVAIL(sig)
      & /* @DEMO_Station:asp·diff  */ asp /= SIGNAL_ASPECT_CURR(sig)
      & /* @DEMO_Station:asp·default  */ asp /= SIGNAL_ASPECT_DEFAULT
      & /* @DEMO_Station:path·depend  */ #path.(path : PATH_CURR & SIGNAL_CTOR(sig) = PATH_CTOR_BEG(path))
    THEN
      SIGNAL_ASPECT_CURR := SIGNAL_ASPECT_CURR <+ {sig |-> asp}
    END;
  
  set_SIGNAL_ASPECT_DEFAULT = 
    ANY sig
    WHERE 
        sig : SIGNAL
      & /* @DEMO_Station:asp·default  */ SIGNAL_ASPECT_CURR(sig) /= SIGNAL_ASPECT_DEFAULT
    THEN
      SIGNAL_ASPECT_CURR := SIGNAL_ASPECT_CURR <+ {sig |-> SIGNAL_ASPECT_DEFAULT}
    END;
  
  add_PATH_CURR = 
    ANY path
    WHERE 
        /* @DEMO_Station:path·valid  */ path /: PATH_CURR
      & /* @DEMO_Station:path·elem·pos  */ !elem.(elem : dom(PATH_ELEM_POS(path)) => PATH_ELEM_POS(path)(elem) = RAIL_ELEM_POS_CURR(elem))
      & /* @DEMO_Station:path·elem·disjunct  */ dom(PATH_ELEM_POS(path)) /\ dom(RAIL_ELEM_PATH_CURR) = {}
      & /* @DEMO_Station:path·req  */ path : PATH_REQ
      & /* @DEMO_Station:path·excl  */ PATH_EXCL[{path}] /\ PATH_CURR = {}
    THEN
         PATH_CURR := PATH_CURR \/ {path}
      ||
         RAIL_ELEM_PATH_CURR := RAIL_ELEM_PATH_CURR <+ dom(PATH_ELEM_POS(path)) * {path}
      ||
         PATH_REQ := PATH_REQ - {path}
      ||
         PATH_SGMT_CURR := PATH_SGMT_CURR \/ PATH_SGMT_ALL(path)
      ||
         PATH_SGMT_REQ := PATH_SGMT_REQ - PATH_SGMT_ALL(path)
    END;
  
  mod_PATH_CURR = 
    ANY elem
    WHERE 
        /* @DEMO_Station:elem·valid  */ elem : dom(RAIL_ELEM_PATH_CURR)
    THEN
         RAIL_ELEM_PATH_CURR := {elem} <<| RAIL_ELEM_PATH_CURR
      ||
         PATH_SGMT_CURR := PATH_SGMT_CURR - (RAIL_SGMT_ELEM~)[{elem}]
      ||
         PATH_SGMT_ACT := PATH_SGMT_ACT - (RAIL_SGMT_ELEM~)[{elem}]
    END;
  
  rem_PATH_CURR = 
    ANY path
    WHERE 
        /* @DEMO_Station:path·valid  */ path : PATH_CURR
      & /* @DEMO_Station:path·depend  */ !sig.(sig : SIGNAL & SIGNAL_ASPECT_CURR(sig) /= SIGNAL_ASPECT_DEFAULT => SIGNAL_CTOR(sig) /= PATH_CTOR_BEG(path))
    THEN
         PATH_CURR := PATH_CURR - {path}
      ||
         RAIL_ELEM_PATH_CURR := RAIL_ELEM_PATH_CURR |>> {path}
      ||
         PATH_ACT := PATH_CURR \/ PATH_REQ
      ||
         PATH_SGMT_CURR := PATH_SGMT_CURR - (RAIL_SGMT_ELEM~)[(RAIL_ELEM_PATH_CURR~)[{path}]]
      ||
         PATH_SGMT_ACT := PATH_SGMT_ACT - (RAIL_SGMT_ELEM~)[(RAIL_ELEM_PATH_CURR~)[{path}]]
    END;
  
  add_PATH_REQ = 
    ANY path
    WHERE 
        path : PATH_ENUM
      & /* @DEMO_Station:path·valid·curr  */ path /: (PATH_CURR \/ PATH_REQ)
      & /* @DEMO_Station:path·elem·disjunct·curr  */ dom(PATH_ELEM_POS(path)) /\ dom(RAIL_ELEM_PATH_CURR) = {}
      & /* @DEMO_Station:path·elem·disjunct·req  */ dom(PATH_ELEM_POS(path)) /\ dom(union(PATH_ELEM_POS[PATH_REQ])) = {}
    THEN
         PATH_REQ := PATH_REQ \/ {path}
      ||
         PATH_ACT := PATH_ACT \/ {path}
      ||
         PATH_SGMT_REQ := PATH_SGMT_REQ \/ PATH_SGMT_ALL(path)
      ||
         PATH_SGMT_ACT := PATH_SGMT_ACT \/ PATH_SGMT_ALL(path)
    END;
  
  rem_PATH_REQ = 
    ANY path
    WHERE 
        /* @DEMO_Station:path·valid  */ path : PATH_REQ
    THEN
         PATH_REQ := PATH_REQ - {path}
      ||
         PATH_ACT := PATH_ACT - {path}
      ||
         PATH_SGMT_REQ := PATH_SGMT_REQ - PATH_SGMT_ALL(path)
      ||
         PATH_SGMT_ACT := PATH_SGMT_ACT - PATH_SGMT_ALL(path)
    END
END
