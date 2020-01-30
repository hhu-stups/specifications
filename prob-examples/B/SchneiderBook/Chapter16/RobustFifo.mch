MACHINE           RobustFifo(ELEM,cap)

CONSTRAINTS       cap : NAT1 & cap < 1000

SETS              REPORT = {ok, failed}

VARIABLES         queue

INVARIANT         queue : seq(ELEM) & size(queue) <= cap

INITIALISATION    queue := <>

OPERATIONS

rr <-- add(ee) =
  PRE ee : ELEM
  THEN IF size(queue) < cap
       THEN rr := ok || queue := queue <- ee
       ELSE rr := failed
       END
  END;

rr,ee <-- remove =
  IF size(queue) = 0
  THEN rr := failed || ee :: ELEM
  ELSE rr := ok || ee := first(queue) || queue := tail(queue)
  END;

nn <-- number =
  nn := size(queue)

END
