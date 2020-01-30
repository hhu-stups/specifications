MACHINE
   switcher_simple
INCLUDES
    switching
SETS
    STATUS = {ok, failure}
VARIABLES
    route,
    locked,
    in_use
INVARIANT
      route : iseq(SECTION)
    & (route /= [] => first(route) : start_tracks)
    & !(p1,p2).((p1:dom(route) & p2:dom(route) & p2 = p1+1) => connected(route(p1)) = route(p2))

    & locked : BOOL
    & (locked=TRUE => (route/=[] & last(route):end_tracks))

    & in_use : BOOL
    & (in_use=TRUE => locked=TRUE)
INITIALISATION
      route := []
    || locked := FALSE
    || in_use := FALSE
OPERATIONS
    status <-- start_route(section) =
    PRE section:SECTION
    THEN
      IF section : start_tracks & route = []
      THEN status,route := ok,[section]
      ELSE status := failure
      END
    END;

    status <-- add_section(section) =
    PRE section:SECTION
    THEN
      IF locked = FALSE & route /= [] & connected(last(route))=section & section /: ran(route)
      THEN status,route := ok, route <- section
      ELSE status := failure
      END
    END;

    status <-- lock_route =
    IF locked=FALSE & route /= [] & last(route) : end_tracks
    THEN status,locked := ok, TRUE
    ELSE status := failure
    END;

    status <-- clear_route =
    IF in_use=FALSE
    THEN status,locked,route := ok,FALSE,[]
    ELSE status := failure
    END;

    status <-- enter(section) =
    PRE section:SECTION
    THEN 
      IF locked=TRUE & section = first(route)
      THEN status,in_use := ok,TRUE
      ELSE status := failure
      END
    END;

    status <-- leave(section) =
    PRE section:SECTION
    THEN
      IF in_use=TRUE & section = last(route)
      THEN status,in_use := ok,FALSE
      ELSE status := failure
      END
    END;

    status <-- move_switch_left(section) =
    PRE section:SECTION
    THEN
      IF section:switches & section /: ran(route)
      THEN status := ok || switch_move_left(section)
      ELSE status := failure
      END
    END;

    status <-- move_switch_right(section) =
    PRE section:SECTION
    THEN
      IF section:switches & section /: ran(route)
      THEN status := ok || switch_move_right(section)
      ELSE status := failure
      END
    END

END
