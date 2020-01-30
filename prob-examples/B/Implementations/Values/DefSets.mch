/* 
 * Example based on the B manual version 1.8.6, p.144
 * "Example of set valuation"
 */
MACHINE DefSets
SETS AbsSet
//CONSTANTS bij PROPERTIES bij: AbsSet >->> 1..10
OPERATIONS
  res <-- GetID(a) = PRE a:AbsSet THEN res :: (1..card(AbsSet)) END
END
