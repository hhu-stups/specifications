MACHINE BinSearchWhile
PROPERTIES
  arr = [1,3,7]
INCLUDES BinSearchOps
OPERATIONS
  res <-- Find(obj) = PRE obj:1..7 THEN
      res <-- Search(obj);
      WHILE res=continue DO
        res <-- Search(obj)
        INVARIANT 1=1
        VARIANT j-i
      END
  END
END

