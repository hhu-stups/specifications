
MACHINE context
SETS /* enumerated */
  ValueElements={Prod1,Prod2};
  Variables={C1,C2a,C2b}
CONCRETE_CONSTANTS
  Systems,
  Systems_states,
  Valuations,
  VariablesSets,
  fvar_of,
  system_of,
  valuation_of,
  variables_of,
  varval_of,
  Sys1,
  Sys2
PROPERTIES
    /* @C0:type1  */ Valuations <: Variables +-> POW(ValueElements)
  & /* @C0:prop1  */ VariablesSets /= {}
  & /* @C0:prop2  */ !(v1,v2).(v1 : VariablesSets & (v2 : VariablesSets & v1 /= v2) => v1 /\ v2 = {})
  & /* @C0:type3  */ Systems <: VariablesSets * (Valuations +-> NATURAL)
  & /* @C0:prop3a  */ finite(Systems)
  & /* @C0:prop3b  */ Systems /= {}
  & /* @C0:prop4  */ !(vars,f_var).(vars |-> f_var : Systems => !val.(val : Valuations => (val : dom(f_var)) <=> (dom(val) = vars)))
  & /* @C0:type4  */ Systems_states <: Systems * Valuations
  & /* @C0:prop5  */ Systems_states /= {}
  & /* @C0:prop6  */ dom(Systems_states) = Systems
  & /* @C0:prop7  */ !sys_st.(sys_st : Systems_states => dom(prj2(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st)) = prj1(POW(Variables),((Variables<->POW(ValueElements))<->INTEGER))(prj1(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st)))
  & /* @C0:fun1  */ system_of = %sys_st.(sys_st : Systems_states|prj1(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st))
  & /* @C0:fun2  */ valuation_of = %sys_st.(sys_st : Systems_states|prj2(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st))
  & /* @C0:fun3  */ variables_of = %sys_st.(sys_st : Systems_states|prj1(POW(Variables),((Variables<->POW(ValueElements))<->INTEGER))(prj1(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st)))
  & /* @C0:fun4  */ fvar_of = %sys_st.(sys_st : Systems_states|prj2(POW(Variables),((Variables<->POW(ValueElements))<->INTEGER))(prj1(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st)))
  & /* @C0:prop9  */ !sys.(sys : Systems => ran({sys} <| Systems_states) = dom(prj2(POW(Variables),((Variables<->POW(ValueElements))<->INTEGER))(sys)))
  & /* @C0:fun5  */ varval_of = %sys_st.(sys_st : Systems_states|fvar_of(sys_st)(prj2(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st)))
  & /* @CO_instance2:axm3  */ Valuations = ({C1} --> POW(ValueElements)) \/ ({C2a,C2b} --> POW(ValueElements))
  & /* @CO_instance2:axm4  */ VariablesSets = {{C1},{C2a,C2b}}
  & /* @CO_instance2:axm5  */ Sys1 = {C1} |-> %val.(val : {C1} --> POW(ValueElements)|card(ValueElements) - card(val(C1)))
  & /* @CO_instance2:axm6  */ Sys2 = {C2a,C2b} |-> %val.(val : {C2a,C2b} --> POW(ValueElements)|card(ValueElements) - card(val(C2a) \/ val(C2b)))
  & /* @CO_instance2:axm7  */ Systems = {Sys1,Sys2}
  & /* @CO_instance2:axm8  */ Systems_states = {Sys1} * ({C1} --> POW(ValueElements)) \/ {Sys2} * ({C2a,C2b} --> POW(ValueElements))
ASSERTIONS
  /* @C0:type5  */ dom(system_of) = Systems_states;
  /* @C0:type6  */ dom(valuation_of) = Systems_states;
  /* @C0:type7  */ dom(variables_of) = Systems_states;
  /* @C0:type8  */ dom(fvar_of) = Systems_states;
  /* @C0:type11  */ !sys_st.(sys_st : Systems_states => prj2(POW(Variables)*((Variables<->POW(ValueElements))<->INTEGER),(Variables<->POW(ValueElements)))(sys_st) : dom(fvar_of(sys_st)));
  /* @C0:type9  */ dom(varval_of) = Systems_states
INITIALISATION
    skip
END
