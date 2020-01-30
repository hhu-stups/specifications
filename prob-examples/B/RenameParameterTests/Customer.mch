MODEL
   Customer
DEFINITIONS scope_ITEMS == 2; SET_PREF_MAXINT == 4; SET_PREF_MAX_INITIALISATIONS == 20
SETS ITEMS
CONSTANTS Articles
PROPERTIES Articles <: ITEMS & card(Articles)>0 & card(Articles)<=maxel & maxel>1
INCLUDES Set(Articles),Counter
INVARIANT card(set) = cnt
OPERATIONS
  buy(i) = PRE i:Articles & i/: set THEN
    add(i) || inc
 END;
  sell(i) = PRE i:set THEN
    del(i) || dec
  END
END