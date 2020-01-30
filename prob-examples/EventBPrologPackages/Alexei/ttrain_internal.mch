
MACHINE ttrain
SETS /* enumerated */
  POSITION={APPROACH,BRIDGE,EXIT}
CONCRETE_CONSTANTS
  DELAY_MAX_WAIT,
  DELAY_MOVE,
  n
ABSTRACT_VARIABLES
  l_event,
  l_train,
  tc,
  train,
  ts
/* PROMOTED OPERATIONS
  approach,
  bridge,
  exit,
  tcm_move */
PROPERTIES
    /* @axm1 */ n : NATURAL1
  & /* @axm3 */ DELAY_MOVE : NATURAL1
  & /* @axm4 */ DELAY_MAX_WAIT : NATURAL1
  & /* @axm6 */ DELAY_MOVE = 1
  & /* @axm7 */ n = 2
  & /* @axm5 */ DELAY_MAX_WAIT = (n - 1) * 3 + 1
INVARIANT
    /* @inv1 */ train : 1 .. n --> POSITION
  & /* @inv2 */ card((train~)[{BRIDGE}]) <= 1
  & /* @inv3 */ ts : NATURAL
  & /* @inv5 */ l_train : 1 .. n --> POSITION
  & /* @inv6 */ l_event : (1 .. n) * POSITION +-> NATURAL
INITIALISATION
    EVENT INITIALISATION = /* of machine ttrain */
    THEN 
         train := (1 .. n) * {EXIT}
      ||
         ts := 0
      ||
         tc := FALSE
      ||
         l_train := (1 .. n) * {EXIT}
      ||
         l_event := {}
    END
OPERATIONS
  approach(t) = 
    EVENT approach = /* of machine ttrain */
    ANY t
    WHERE 
        /* @grd1 */ t : dom(train)
      & /* @grd2 */ train(t) = EXIT
      & /* @grd3 */ tc = FALSE
    THEN 
         train := train <+ {t |-> APPROACH}
      ||
         tc := TRUE
    END;
  
  bridge(t) = 
    EVENT bridge = /* of machine ttrain */
    ANY t
    WHERE 
        /* @grd1 */ t : dom(train)
      & /* @grd2 */ train(t) = APPROACH
      & /* @grd3 */ (train~)[{BRIDGE}] = {}
      & /* @grd4 */ tc = FALSE
    THEN 
         train := train <+ {t |-> BRIDGE}
      ||
         tc := TRUE
    END;
  
  exit(t) = 
    EVENT exit = /* of machine ttrain */
    ANY t
    WHERE 
        /* @grd1 */ t : dom(train)
      & /* @grd2 */ train(t) = BRIDGE
      & /* @grd3 */ tc = FALSE
    THEN 
         train := train <+ {t |-> EXIT}
      ||
         tc := TRUE
    END;
  
  tcm_move(i) = 
    EVENT tcm_move = /* of machine ttrain */
    ANY i
    WHERE 
        /* @grd1 */ i : dom(train)
      & /* @grd2 */ train(i) /= l_train(i)
      & /* @grd3 */ tc = TRUE
    THEN 
         l_event := l_event <+ {(i |-> train(i)) |-> ts + DELAY_MOVE}
      ||
         ts := ts + DELAY_MOVE
      ||
         l_train := l_train <+ {i |-> train(i)}
      ||
         tc := FALSE
    END
END
