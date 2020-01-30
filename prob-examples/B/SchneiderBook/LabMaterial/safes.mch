MACHINE           Safes

INCLUDES          Locks, Keys

PROMOTES          opendoor, closedoor, lockdoor

CONSTANTS         unlocks

PROPERTIES        unlocks : KEY >->> DOOR

INVARIANT         status~[{unlocked}] <: unlocks[keys]

OPERATIONS

  insert(kk,dd) =
  PRE kk : KEY & dd : DOOR & unlocks(kk) = dd
  THEN insertkey(kk)
  END;

  extract(kk,dd) =
  PRE kk : KEY & dd : DOOR & unlocks(kk) = dd & status(dd) = locked
  THEN removekey(kk)
  END;

  unlock(dd) =
  PRE dd : DOOR & unlocks~(dd) : keys
  THEN unlockdoor(dd)
  END;

quicklock(dd) =
  PRE dd : DOOR & position(dd) = closed
  THEN lockdoor(dd) || removekey(unlocks~(dd))
  END

END
