MACHINE DefSet5
DEFINITIONS
 SET_PREF_MAX_INITIALISATIONS == 73;
SETS
 ID
PROPERTIES
  card(ID) = 5
END

/*

>>> :z3 (ID=P1\/P2) & (P1/\P2={}) & (aa/=bb) & ({aa,bb,xx}<:ID) & (card(ID)=5) & (aa:P1) & (bb:P2) & (xx:P2) & (xx/=bb) & (card(P1)=1) & not((aa:P1) & (bb:P2) & (xx:P2) & (xx=bb) & (card(P1)=1))
! Missing translation for Z3 expression: [store,[store,[store,[...|...]|...],'ID!val!2'|...],'ID!val!3',false]:set(global('ID'))
Unknown exception in solver z3: model_translation_failed
PREDICATE is UNKNOWN: model_translation_failed

*/
