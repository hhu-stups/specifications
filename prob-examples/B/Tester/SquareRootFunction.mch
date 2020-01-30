MACHINE SquareRootFunction
DEFINITIONS SET_PREF_MAXINT == 128
CONSTANTS   sqrt
PROPERTIES
   sqrt = %xx.(xx : NATURAL | max({yy | yy : INTEGER & yy * yy <= xx}))
OPERATIONS
    p_rac <-- lire_sqrt (pp) =  PRE pp:95..105 THEN   p_rac := sqrt(pp)
      END
END

