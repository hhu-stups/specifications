MACHINE SlotSolver
/* SlotTool Solving Machine for Phil. Fak. */
/* requires data.mch Data machine (can be generated using Makefile) */

/* See doc/vocabulary.md for vocabulary definitions */
SEES
  base, data
ABSTRACT_CONSTANTS unsat_core, unit_map,
   disjoint_cores, random_unsat_core,
   different_core, different_core_aux, all_cores, unsat_session_core
PROPERTIES
  /* compute the unsat core for a certain set of units x
    assumption: we call core(x,c,sem) with c = {} and x such that CHECK_UNITS(x,sem) is false */
    unsat_core =
         %(x,c,sem).(x <: INTEGER & c<:INTEGER & sem:SEMESTERS /* & printf("unsat_core2(~w)~n",(x,c,sem)) */
                     | ifte(bool(x={}),
                             c,
                             ifte( bool(CHECK_UNITS2((c \/ x) \ {select(x)},sem)),
                                       unsat_core( x \ {select(x)}, c \/ {select(x)},sem),
                                       unsat_core( x \ {select(x)}, c,            sem) )))
   &
   /* a version which computes a more or less random unsat core */
    random_unsat_core =
         %(x,c,sem).(x <: INTEGER & c<:INTEGER & sem:SEMESTERS /* & printf("unsat_core2(~w)~n",(x,c,sem)) */
                     | ifte(bool(x={}),
                             c,
                             UNION(SX).(SX={random_element(x)} |
                                 ifte( bool(CHECK_UNITS2((c \/ x) \ SX,sem)),
                                       random_unsat_core( x \ SX, c \/ SX,sem),
                                       random_unsat_core( x \ SX, c,            sem)
                                     )
                             )))
  &
   /* compute a set of disjoint unsat cores */
   /* x: set of units to examine, sem: for which semester to check */
   disjoint_cores = %(x,sem).(x <: INTEGER & sem:SEMESTERS |
         ifte(bool(x={} or CHECK_UNITS2(x,sem)),
               {}, /* no cores; combination x satisfiable */
               UNION(UC).(UC=unsat_core(x,{},sem) | /* this is a LET construct to compute one unsat core UC */
                 {UC} \/ disjoint_cores(x \ UC, sem))
              )
        )
    &
    /* try and find a core that is different from a set of cores*/
    different_core = %(cores,x,sem). ( cores <: POW(INTEGER) & x<:INTEGER & sem:SEMESTERS |
                           different_core_aux(multi_select(cores),x,sem)
                       ) &
    different_core_aux = %(choices,x,sem).( choices <: POW(INTEGER) & x<:INTEGER & sem:SEMESTERS |
            ifte(bool(choices={}), {},
                 ifte( bool(CHECK_UNITS2(x \ CHOOSE(choices),sem)),
                    different_core_aux( choices \ {CHOOSE(choices)}, x, sem),
                    unsat_core( x \ CHOOSE(choices),{},sem)
                    )
                )
        )
    &
    /* compute all possible cores: cores is a set of cores already found; you should call
      it with cores={} initially, e.g., like this all_cores({},UnitsForCombination(jap,rom,1),1) 
      runtime is about 2.8 secs for this call
      */
    all_cores = %(cores,x,sem). ( cores <: POW(INTEGER) & x<:INTEGER & sem:SEMESTERS |
         UNION(new_core).(new_core = different_core(cores,x,sem) |
              ifte(bool(new_core={}), cores, /* no new core found: we are done */
                 all_cores({new_core} \/ cores, x, sem)
                   )))
    &
  /* a function that computes a table of the constraints for a set of units (e.g., obtained
     by calling unsat_core or UNSAT_CORE, e.g.,:
      unit_map(UNSAT_CORE(jap,rom,1)) or unit_map[disjoint_cores(UnitsForCombination(jud,lin,1),1)]) */
  unit_map = %(core).(core <: dom(units)| {(u, gid,slot)
                    | u : core & #(g,s).((gid,g) : units(u)'groups & s : g'sessions & slot=sessions(s)'slot)})

  /* compute the unsat core for a certain set of units x
    assumption: we call core(x,c,sem) with c = {} and x such that CHECK_UNITS(x,sem) is false */
  /*
   * uc <: AllUnits an unsat core
   * sem : SEMESTERS the semester the core corresponds to
   * relevant_sessions <: dom(sessions) sessions to be considered
   * ignored_sessions <: dom(sessions) sessions to be considered
   * sc <: relevant_sessions the computed core of the sessions
   */
   &
   unsat_session_core =
         %(uc, sem, relevant_sessions, ignored_sessions, sc).(uc <: AllUnits & sem : SEMESTERS & relevant_sessions <: dom(sessions) & ignored_sessions <: dom(sessions) &  sc <: dom(sessions)
                     | ifte(bool(relevant_sessions={}),
                             sc,
                             ifte(bool(CHECK_UNITS3(uc, sem, ignored_sessions \/ {select(relevant_sessions)})),
                                       unsat_session_core(uc, sem, relevant_sessions - {select(relevant_sessions)}, ignored_sessions,                                sc \/ {select(relevant_sessions)}),
                                       unsat_session_core(uc, sem, relevant_sessions - {select(relevant_sessions)}, ignored_sessions \/ {select(relevant_sessions)}, sc))))
ASSERTIONS
  /* Note: Assertions and tests that require specific versions of data.mch are
   * stored as tests along with the data to instantiate them.
   * See tests/test_phil-fak_course_combinations.yml for an example
   */

  unit_groups_nonmatching_slots = {}
DEFINITIONS
  "LibraryIO.def";
  "external_functions.def";
  "check_cs.def";
  "helper.def";
  DEBUG(Units) == (printf("Units = ~w~n",Units) &
             printf("unit_min_group = ~w~n",unit_min_group) &
             printf("unit_max_group = ~w~n",unit_max_group) &
             printf("max(ran(unit_max_group)) = ~w~n",max(ran(unit_max_group))) &
             printf("unit_max_group[Units] = ~w~n",unit_max_group[Units]) &
             printf("cs = ~w~n",cs) );

  CHECK_UNITS(Units, cur_semester, local_sessions, ignored_sessions) == (
    # /* LET */ (cs).
    (
      cs = {(u1,u2)| u1 : Units & u2 : Units & u1 < u2 /* symmetry breaking */
               & unit_slots_opt(u1, local_sessions) /\ unit_slots_opt(u2, local_sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
           }
        &
        dom(unit_groups_nonmatching_slots) /\ Units  = {}
      &
      #(GroupChoice, SemesterChoice).(
         /* given a particular allowed course : find a choice for the groups */
        GroupChoice : Units --> min_group..max_group
        &
        !(u).( u : Units => GroupChoice(u) : unit_min_group(u)..unit_max_group(u) )
        &
        SemesterChoice = Units*{cur_semester}
        /* & DEBUG(Units) */
        &
        CHECK_CS(cs, GroupChoice, SemesterChoice, local_sessions, ignored_sessions)
      )
    )
  );
  /* XXX find better names */
  CHECK_UNITS2(Units, cur_semester) == CHECK_UNITS(Units,cur_semester,sessions, {});
  CHECK_UNITS3(Units, cur_semester, ignored_sessions) == CHECK_UNITS(Units,cur_semester,sessions, ignored_sessions);
  /*
   * course : COURSES
   * cur_semester : SEMESTER to check
   * local_sessions : function mapping session ids to session information
   */
  CHECK_WITH_SESSIONS(course, cur_semester, local_sessions) == (
      course : COURSES
      &
      cur_semester : SEMESTERS
      &
      # /* LET */ (Units).
      (
        Units = course_units(course, cur_semester)
        &
        CHECK_UNITS(Units,cur_semester,local_sessions, {})
      )
    );

  /* call UNSAT_CORE to compute minimal conflict set of units for course */
  UNSAT_CORE(course, cur_semester) == (unsat_core(course_units(course, cur_semester),{},cur_semester));

  UNSAT_SESSION_CORE(uc,cur_semester) == (unsat_session_core(uc, cur_semester, union(unit_group_multiple_session[uc]), {}, union(unit_group_single_session[uc])));

  MAXSAT_CORE(course, sem) == course_units(course, sem) -  sel[disjoint_cores(course_units(course, sem), sem)];

  CHECK(course, cur_semester) == CHECK_WITH_SESSIONS(course, cur_semester, sessions);

  COMPUTE_ALTERNATIVES(idx, relevant_courses) == {x| x : SLOTS \ {unknown, sessions(idx)'slot} &
    #(sem, current_session, alt_sessions).(
      sem : session_semester(idx) &
      current_session = sessions(idx) &
      alt_sessions = sessions <+ {(idx, rec(slot:x, rhythm:0, duration:2))} &
      !(course).(course : relevant_courses => CHECK_WITH_SESSIONS(course, sem, alt_sessions))
    )
  };

  /*
   * ALTERNATIVES(idx)
   * Compute alternative slots for the slot/session identified by idx
   * Generates a set of globally valid alternatives
   * Genrated set is empty, if there is a conflict with one the course combinations valid for course(idx)
   */
   ALTERNATIVES(idx) == COMPUTE_ALTERNATIVES(idx, session_course[{idx}]);
  /*
   * LOCAL_ALTERNATIVES(idx, cc)
   * Compute alternative slots for the slot/session identified by idx relative to the slots/sessions of course cc
   * Generates a set of locally valid alternatives with regard to course cc
   */
   LOCAL_ALTERNATIVES(idx, cc) == COMPUTE_ALTERNATIVES(idx, {cc});
END

