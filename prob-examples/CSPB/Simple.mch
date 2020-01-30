MACHINE Simple
DEFINITIONS Lim == 2
VARIABLES on
INVARIANT
 on:1..Lim
INITIALISATION on := 1
OPERATIONS
  a = IF on < Lim THEN on := on + 1 ELSE on := 1 END;
  b = IF on < Lim THEN on := on + 1 ELSE on := 1 END
END

