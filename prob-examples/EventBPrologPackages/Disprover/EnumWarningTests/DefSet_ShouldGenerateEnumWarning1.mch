MACHINE DefSet_ShouldGenerateEnumWarning1
/* should generate enumeration warning in DISPROVER_MODE */
SETS
 ID
CONSTANTS iv
PROPERTIES
 iv:ID
ASSERTIONS
  #x.(x:ID & x/= iv) /* is provable provided card(ID)>1 */
END

