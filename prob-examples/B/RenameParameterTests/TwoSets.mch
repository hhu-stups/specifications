MODEL
   TwoSets(MYSET)
INCLUDES s1.Set(MYSET), s2.Set(MYSET)
OPERATIONS
  add2(x) = PRE x:MYSET THEN
    s1.add(x) || s2.add(x)
  END
END