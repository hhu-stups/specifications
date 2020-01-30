MACHINE
    switcher
INCLUDES
    switching
SETS
    ROUTE; STATUS = {ok, failure}
PROPERTIES
    card(ROUTE) >= card(start_tracks)
VARIABLES
    routes,
    locked,
    in_use
INVARIANT
    routes : ROUTE +-> iseq(SECTION)
    & !(r1,r2).((r1:dom(routes) & r2:dom(routes) & r1/=r2) => ran(routes(r1)) /\ ran(routes(r2)) = {})
    & !rt.(rt : ran(routes) => rt /= [])
    & !rt.(rt : ran(routes) => first(rt) : start_tracks)
    & !rt.(rt : ran(routes) => (!(p1,p2).((p1:dom(rt) & p2:dom(rt) & p2 = p1+1) => (rt(p1)|->rt(p2) : connected))))

    & locked <: dom(routes)
    & !rt.(rt:locked => last(routes(rt)):end_tracks)

    & in_use <: locked
INITIALISATION
    routes,locked,in_use := {},{},{}
OPERATIONS
    status,route <-- start_route(section) =
    PRE section:SECTION
    THEN
      IF section : start_tracks
        & !rt.(rt:dom(routes) => section/:ran(routes(rt)))
      THEN
        ANY newroute
        WHERE newroute : ROUTE-dom(routes)
        THEN
          routes(newroute) := [section]
          || status := ok
          || route := newroute
        END
      ELSE status := failure
      END
    END;

    status <-- add_section(route,section) =
    PRE route:ROUTE & section:SECTION
    THEN
      IF  route:dom(routes) 
        & route/:locked
        & section:connected[{last(routes(route))}]
        & !aroute.(aroute:ran(routes) => section /: ran(aroute))
      THEN
        routes(route) := routes(route) <- section
        || status := ok
      ELSE status := failure
      END
    END;

    status <-- lock_route(route) =
    PRE route : ROUTE
    THEN
      IF route:dom(routes)
        & route/:locked
        & last(routes(route)) : end_tracks
      THEN status,locked := ok, locked\/{route}
      ELSE status := failure
      END
    END;

    status <-- clear_route(route) =
    PRE route:ROUTE
    THEN
      IF route:dom(routes) & route/:in_use
      THEN
        routes := {route} <<| routes
        || locked := locked  - {route}
        || status := ok
      ELSE status := failure
      END
    END;

    status <-- enter(section) =
    PRE section:SECTION
    THEN
      IF #lroute.(lroute:locked & section = first(routes(lroute)))
      THEN
        ANY lroute
        WHERE lroute:locked & section = first(routes(lroute))
        THEN status,in_use := ok,in_use\/{lroute}
        END
      ELSE status := failure
      END
    END;

    status <-- leave(section) =
    PRE section:SECTION
    THEN
      IF #uroute.(uroute:in_use & section=last(routes(uroute)))
      THEN
        ANY uroute
        WHERE uroute:in_use & section=last(routes(uroute))
        THEN status,in_use := ok,in_use-{uroute}
        END
      ELSE status := failure
      END
    END;

    status <-- move_switch_left(section) =
    PRE section:SECTION
    THEN
      IF section:switches & !aroute.(aroute:dom(routes) => section/:ran(routes(aroute)))
      THEN status := ok || switch_move_left(section)
      ELSE status := failure
      END
    END;

    status <-- move_switch_right(section) =
    PRE section:SECTION
    THEN
      IF section:switches & !aroute.(aroute:dom(routes) => section/:ran(routes(aroute)))
      THEN status := ok || switch_move_right(section)
      ELSE status := failure
      END
    END
END
