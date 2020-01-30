
MACHINE M
SETS /* deferred */
  MANAGERS;
  MODES
 ; /* enumerated */
  SUGGESTIONLEVELS={SL0,SL1,SL2,SL3}
CONCRETE_CONSTANTS
  MdDownToOff,
  MdOff,
  MdStandby,
  MnAOC,
  MnRW,
  MnTHR
ABSTRACT_VARIABLES
  ICM,
  ISL,
  ISM,
  UCM,
  USL,
  USM
/* PROMOTED OPERATIONS
  evt_ExecuteManager */
PROPERTIES
    /* @axm_diff_MdOff_MdStandby */ not(MdOff = MdStandby)
  & /* @axm_diff_MdOff_MdDownToOff */ not(MdOff = MdDownToOff)
  & /* @axm_diff_MdStandby_MdDownToOff */ not(MdStandby = MdDownToOff)
  & /* @axm_diff_MnAOC_MnRW */ not(MnAOC = MnRW)
  & /* @axm_diff_MnAOC_MnTHR */ not(MnAOC = MnTHR)
  & /* @axm_diff_MnRW_MnTHR */ not(MnRW = MnTHR)
INVARIANT
    /* @inv_decl_ICM */ ICM : MANAGERS --> (MANAGERS +-> MODES)
  & /* @inv_decl_ISL */ ISL : MANAGERS --> (MANAGERS +-> SUGGESTIONLEVELS)
  & /* @inv_decl_ISM */ ISM : MANAGERS --> (MANAGERS +-> MODES)
  & /* @inv_decl_UCM */ UCM : MANAGERS --> (MANAGERS --> MODES)
  & /* @inv_decl_USL */ USL : MANAGERS --> (MANAGERS --> SUGGESTIONLEVELS)
  & /* @inv_decl_USM */ USM : MANAGERS --> (MANAGERS --> MODES)
  & /* @inv_ext_ICM */ !(mn).(mn : MANAGERS => not(mn : dom(ICM(mn))))
  & /* @inv_eq_ISL */ !(mn).(mn : MANAGERS => dom(ISL(mn)) = dom(ICM(mn)))
  & /* @inv_eq_ISM */ !(mn).(mn : MANAGERS => dom(ISM(mn)) = dom(ICM(mn)))
ASSERTIONS
  /* @thm_inner_mode_mapping */ !(p).(p : POW(MANAGERS ** MODES) => !(q).(p : MANAGERS --> MODES & q : MANAGERS +-> MODES => p <+ q : MANAGERS --> MODES));
  /* @thm_outer_mode_mapping */ !(p).(p : POW(MANAGERS ** POW(MANAGERS ** MODES)) => !(q).(p : MANAGERS --> (MANAGERS --> MODES) & q : MANAGERS +-> (MANAGERS --> MODES) => p <+ q : MANAGERS --> (MANAGERS --> MODES)));
  /* @thm_outer_mode_maplet */ !(p).(p : MANAGERS => !(q).(q : MANAGERS --> MODES => {p |-> q} : MANAGERS +-> (MANAGERS --> MODES)));
  /* @thm_inner_level_mapping */ !(p).(p : POW(MANAGERS ** SUGGESTIONLEVELS) => !(q).(p : MANAGERS --> SUGGESTIONLEVELS & q : MANAGERS +-> SUGGESTIONLEVELS => p <+ q : MANAGERS --> SUGGESTIONLEVELS));
  /* @thm_outer_level_mapping */ !(p).(p : POW(MANAGERS ** POW(MANAGERS ** SUGGESTIONLEVELS)) => !(q).(p : MANAGERS --> (MANAGERS --> SUGGESTIONLEVELS) & q : MANAGERS +-> (MANAGERS --> SUGGESTIONLEVELS) => p <+ q : MANAGERS --> (MANAGERS --> SUGGESTIONLEVELS)));
  /* @thm_outer_level_maplet */ !(p).(p : MANAGERS => !(q).(q : MANAGERS --> SUGGESTIONLEVELS => {p |-> q} : MANAGERS +-> (MANAGERS --> SUGGESTIONLEVELS)))
INITIALISATION
    EVENT INITIALISATION = /* of machine M */
    THEN 
         ICM := MANAGERS ** {{}}
      ||
         ISL := MANAGERS ** {{}}
      ||
         ISM := MANAGERS ** {{}}
      ||
         UCM := MANAGERS ** {MANAGERS ** {MdOff}}
      ||
         USL := MANAGERS ** {MANAGERS ** {SL0}}
      ||
         USM := MANAGERS ** {MANAGERS ** {MdOff}}
    END
OPERATIONS
  evt_ExecuteManager(decidedMode,mn,nextDestinations,nextSuggLevel,nextSuggMode,prefMode) = 
    EVENT evt_ExecuteManager = /* of machine M */
    ANY decidedMode,mn,nextDestinations,nextSuggLevel,nextSuggMode,prefMode
    WHERE 
        /* @grd_decl_decidedMode */ decidedMode : {UCM(mn) <+ ICM(mn)(mn),nextSuggMode}
      & /* @grd_decl_nextDestinations */ nextDestinations <: MANAGERS \ {mn}
      & /* @grd_which_decidedMode */ (decidedMode = nextSuggMode) <=> (nextSuggMode = UCM(mn) <+ ICM(mn)(mn) or (USL(mn) <+ ISL(mn)(mn) = SL2 & nextSuggLevel = SL3))
      & (/* @grd_choose_prefMode */ nextSuggLevel = SL1 & not(prefMode = UCM(mn) <+ ICM(mn)(mn)) => nextSuggMode = prefMode)
      & (/* @grd_choose_currSuggMnAOCMode */ nextSuggLevel = SL2 => nextSuggMode = USM(mn) <+ ISM(mn)(MnAOC))
      & (/* @grd_choose_currSuggMode */ not(nextSuggMode = USM(mn) <+ ISM(mn)(mn)) => (nextSuggLevel = SL1 & not(prefMode = UCM(mn) <+ ICM(mn)(mn))) or nextSuggLevel = SL2)
      & /* @grd_whenLevel1 */ (nextSuggLevel = SL1) <=> ((USL(mn) <+ ISL(mn)(mn) = SL1 or not(prefMode = UCM(mn) <+ ICM(mn)(mn))) & (!(k).(k : MANAGERS => UCM(mn) <+ ICM(mn)(k) = UCM(mn) <+ ICM(mn)(mn) & USL(mn) <+ ISL(mn)(k) : {SL0,SL1}) & (not(mn = MnAOC) or #(i).(i : MANAGERS & (USL(mn) <+ ISL(mn)(i) = SL0 or not(USM(mn) <+ ISM(mn)(i) = USM(mn) <+ ISM(mn)(mn)))))))
      & /* @grd_whenLevel2 */ (nextSuggLevel = SL2) <=> (#(i).(i : MANAGERS & USL(mn) <+ ISL(mn)(i) = SL1) & ((mn = MnAOC & (USL(mn) <+ ISL(mn)(mn) = SL2 or !(k).(k : MANAGERS => USL(mn) <+ ISL(mn)(k) : {SL1,SL2} & USM(mn) <+ ISM(mn)(k) = USM(mn) <+ ISM(mn)(mn)))) or (not(mn = MnAOC) & USL(mn) <+ ISL(mn)(MnAOC) = SL2)))
      & /* @grd_whenLevel3 */ (nextSuggLevel = SL3) <=> (#(i).(i : MANAGERS & USL(mn) <+ ISL(mn)(i) = SL2) & !(k).(k : MANAGERS => USL(mn) <+ ISL(mn)(k) : {SL2,SL3}))
    THEN 
         UCM := UCM <+ {mn |-> ((UCM(mn) <+ ICM(mn)) <+ {mn |-> decidedMode})}
      ||
         USL := USL <+ {mn |-> ((USL(mn) <+ ISL(mn)) <+ {mn |-> nextSuggLevel})}
      ||
         USM := USM <+ {mn |-> ((USM(mn) <+ ISM(mn)) <+ {mn |-> nextSuggMode})}
      ||
         ICM := (ICM <+ {mn |-> {}}) <+ {_comp_result1|_comp_result1 : MANAGERS ** POW(MANAGERS ** MODES) & #(r,f).(f : POW(MANAGERS ** MODES) & (_comp_result1 = r |-> f & (r : nextDestinations & f = ICM(r) <+ {mn |-> decidedMode})))}
      ||
         ISL := (ISL <+ {mn |-> {}}) <+ {_comp_result2|_comp_result2 : MANAGERS ** POW(MANAGERS ** SUGGESTIONLEVELS) & #(r,f).(f : POW(MANAGERS ** SUGGESTIONLEVELS) & (_comp_result2 = r |-> f & (r : nextDestinations & f = ISL(r) <+ {mn |-> nextSuggLevel})))}
      ||
         ISM := (ISM <+ {mn |-> {}}) <+ {_comp_result3|_comp_result3 : MANAGERS ** POW(MANAGERS ** MODES) & #(r,f).(f : POW(MANAGERS ** MODES) & (_comp_result3 = r |-> f & (r : nextDestinations & f = ISM(r) <+ {mn |-> nextSuggMode})))}
    END
END
