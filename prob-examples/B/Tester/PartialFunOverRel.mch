MACHINE PartialFunOverRel
DEFINITIONS
 SET_PREF_MAX_OPERATIONS == 10
SETS
 ID={aa,bb,cc}
CONSTANTS f
PROPERTIES
 f:(ID-->ID) +->> ID & card(f) = 3 &
 dom(f) = { {aa|->aa, bb|->aa, cc|->aa}, {aa|->aa,bb|->aa, cc|->bb}, {aa|->aa,bb|->aa, cc|->cc}}
OPERATIONS
  res <-- Applyf(x,y) = PRE x:ID & y:ID THEN
      ANY TF WHERE TF:ID-->ID & TF(x) = y & TF: dom(f) THEN
        res := f(TF)
      END
  END
END

