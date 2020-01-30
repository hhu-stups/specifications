MACHINE UnionExtensionSet
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx<:ID
INITIALISATION xx:={iv}
OPERATIONS
  Set(yy) = PRE yy:ID THEN 
         xx:= xx \/ {yy,1} /* type error */
   END
END

