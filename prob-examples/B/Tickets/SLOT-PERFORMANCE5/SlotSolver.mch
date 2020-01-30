MACHINE SlotSolver
/* SlotTool Solving Machine for Phil. Fak. */
/* requires data.mch Data machine (can be generated using Makefile) */

/* See doc/vocabulary.md for vocabulary definitions */
SEES
  base, data_original
ABSTRACT_CONSTANTS
    all_cores,
    different_core,
    different_core_aux,
    disjoint_cores,
    get_sessions,
    get_slot,
    random_unsat_core,
    unit_map,
    unit_sessions,
    unsat_core,
    unsat_session_core
CONSTANTS
    AllSessions,
    AllUnits,
    all_unit_groups,
    course_units,
    map_cu,
    max_group,
    min_group,
    session_course,
    session_semester,
    unit_course_semester,
    unit_group,
    unit_group_multiple_session,
    unit_group_single_session,
    unit_max_group,
    unit_min_group
    
    ,unit_group_curried
PROPERTIES
  /* compute the unsat core for a certain set of units x; core is the unsat core thus far
    assumption: we call core(x,c,sem,ls) with c = {} and x such that CHECK_UNITS(x, sem, slots,ls) is false */
    unsat_core =/*{{{*/
         %(x,c,sem, local_slots).(x <: INTEGER & c<:INTEGER & sem:SEMESTERS & local_slots : POW(INTEGER * SLOTS)
                                   /* & printf("~nunsat_core(~w)~n",(x,c,sem))  */
                     | ifte(bool(x={}),
                             c,
                             ifte( bool(CHECK_UNITS((c \/ x) \ {select(x)}, sem             , local_slots)),
                                       unsat_core( x \ {select(x)}        , c \/ {select(x)}, sem          , local_slots),
                                       unsat_core( x \ {select(x)}        , c               , sem          , local_slots))))/*}}}*/
   &
   /* a version which computes a more or less random unsat core */
    random_unsat_core =/*{{{*/
         %(x,c,sem, local_slots).(x <: INTEGER & c<:INTEGER & sem:SEMESTERS & local_slots : POW(INTEGER * SLOTS)/* & printf("unsat_core2(~w)~n",(x,c,sem)) */
                     | ifte(bool(x={}),
                             c,
                             UNION(SX).(SX={random_element(x)} |
                                 ifte( bool(CHECK_UNITS((c \/ x) \ SX, sem    , local_slots)),
                                       random_unsat_core( x \ SX     , c \/ SX, sem          , local_slots),
                                       random_unsat_core( x \ SX     , c      , sem          , local_slots)
                                     )
                             )))/*}}}*/
  &
   /* compute a set of disjoint unsat cores */
   /* x: set of units to examine, sem: for which semester to check */
   disjoint_cores = %(x,sem, local_slots).(x <: INTEGER & sem:SEMESTERS & local_slots : POW(INTEGER * SLOTS) |/*{{{*/
         ifte(bool(x={} or CHECK_UNITS(x, sem, local_slots)),
               {}, /* no cores; combination x satisfiable */
               UNION(UC).(UC=unsat_core(x,{},sem, local_slots) | /* this is a LET construct to compute one unsat core UC */
                 {UC} \/ disjoint_cores(x \ UC, sem, local_slots))
              )
        )/*}}}*/
    &
    /* try and find a core that is different from a set of cores*/
    different_core = %(cores, x, sem, local_slots). ( cores <: POW(INTEGER) & x<:INTEGER & sem:SEMESTERS & local_slots : POW(INTEGER * SLOTS) |
                           different_core_aux(multi_select(cores),x,sem, local_slots)
                       ) &
    different_core_aux = %(choices,x,sem, local_slots).( choices <: POW(INTEGER) & x<:INTEGER & sem:SEMESTERS & local_slots : POW(INTEGER * SLOTS) |/*{{{*/
            ifte(bool(choices={}), {},
                 ifte( bool(CHECK_UNITS(x \ CHOOSE(choices),sem, local_slots)),
                    different_core_aux( choices \ {CHOOSE(choices)}, x , sem, local_slots),
                    unsat_core( x \ CHOOSE(choices)                , {}, sem, local_slots)
                    )
                )
        )/*}}}*/
    &
    /* compute all possible cores: cores is a set of cores already found; you should call
      it with cores={} initially, e.g., like this all_cores({},UnitsForCombination(jap,rom,1),1)
      runtime is about 2.8 secs for this call
      */
    all_cores = %(cores,x,sem, local_slots). ( cores <: POW(INTEGER) & x<:INTEGER & sem:SEMESTERS & local_slots : POW(INTEGER * SLOTS) |/*{{{*/
         UNION(new_core).(new_core = different_core(cores,x,sem, local_slots) |
              ifte(bool(new_core={}), cores, /* no new core found: we are done */
                 all_cores({new_core} \/ cores, x, sem, local_slots)
                   )))/*}}}*/
  /* compute the unsat core for a certain set of units x
    assumption: we call core(x,c,sem) with c = {} and x such that CHECK_UNITS(x, sem, slots) is false */
  /*
   * uc <: AllUnits an unsat core
   * sem : SEMESTERS the semester the core corresponds to
   * relevant_sessions <: dom(sessions) sessions to be considered
   * ignored_sessions <: dom(sessions) sessions to be considered
   * sc <: relevant_sessions the computed core of the sessions
   */
   &
   unsat_session_core =/*{{{*/
         %(uc, sem, relevant_sessions, ignored_sessions, sc, local_slots).(uc <: AllUnits & sem : SEMESTERS & relevant_sessions <: dom(sessions) & ignored_sessions <: dom(sessions) &  sc <: dom(sessions) & local_slots : POW(INTEGER * SLOTS)
                     | ifte(bool(relevant_sessions={}),
                             sc,
                             ifte(bool(#(groupChoice).(CHECK_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(sem, {}, {}, uc, local_slots, ignored_sessions \/ {select(relevant_sessions)}, groupChoice))),
                                       unsat_session_core(uc, sem, relevant_sessions - {select(relevant_sessions)}, ignored_sessions                               , sc \/ {select(relevant_sessions)}, local_slots),
                                       unsat_session_core(uc, sem, relevant_sessions - {select(relevant_sessions)}, ignored_sessions \/ {select(relevant_sessions)}, sc                               , local_slots))))/*}}}*/
  &
  session_course = {s,c| c : COURSES & #(u).(c |-> u : map_cu & s : union(get_sessions[ran(units(u)'groups)]))}
  &
  map_cu = {c,u| #(sem).((c,sem,u):mapping)}
  &
  course_units = %(course, semester).(course:COURSES & semester:1..6| mapping[{(course, semester)}])
  &
  unit_course_semester = %(unit, course).(unit : AllUnits & course : COURSES & unit : map_cu[{course}] | {s|(course, s, unit) : mapping})
  /* See helper.def for defintion */
  &
  SHARED_PROPERTIES
  &
   unit_group_curried = %(u). ( u: AllUnits | %g.(g:dom(units(u)'groups) |  units(u)'groups(g) ))
ASSERTIONS
  /* Note: Assertions and tests that require specific versions of data.mch are
   * stored as tests along with the data to instantiate them.
   * See tests/test_phil-fak_course_combinations.yml for an example
   */
  !(u, g).(
    /*
     * all sessions within a group should be on different slots
     * Number of sessions == number of slots in that group
     */
    u : ran(units) & g : ran(u'groups) =>
      card(g'sessions)= card({s| #(q).(q : sessions[g'sessions] & s = q'slot)})
  );
  /* each session is assigned to either odd or even semesters through its unit */
  !(s).( s : AllSessions => card((%(i).(i:NATURAL| i mod 2))[session_semester(s)]) = 1);
  /* XXX all groups of a module/unit are a sequence (contiguous ascending indeces  */
  unit_groups_nonmatching_slots = {}

VARIABLES
  unit_groups_nonmatching_slots, slots, Data
INVARIANT
  slots : dom(sessions) --> SLOTS
  &
  unit_groups_nonmatching_slots : POW(NATURAL * NATURAL)
  &
  Data : POW(INTEGER*struct(
    title:STRING,
    slot : SLOTS,
    frequency:INTEGER,
    unit: INTEGER,
    group: INTEGER,
    all_semesters: POW(INTEGER),
    department: DEPARTMENTS,
    session_modules: POW(struct(
      course:COURSES,
      module:MODULES,
      class:INTEGER,
      type:PRIORITIES,
      focus:INTEGER,
      semesters:POW(SEMESTERS)
    ))
  ))
INITIALISATION
  slots := {x,z| #(y).((x,y) : sessions & z = y'slot)};
  /* compute units whose number of sessions does not match number of slots (i.e. guaranteed conflict) */
  unit_groups_nonmatching_slots := {uid,gid | #(uu, gg).((uid, uu) : units & (gid, gg) : uu'groups &
                                    card(gg'sessions) /= card(ran(%(q).(q :sessions[gg'sessions] | q'slot))))};
  RECOMPUTE_VARS
DEFINITIONS
  "preferences.def";
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

  CHECK_UNITS(Units, cur_semester, local_slots) ==
     #(groupChoice).(CHECK_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cur_semester, {}, {}, Units, local_slots, {}, groupChoice));
  /*
   * course : COURSES
   * cur_semester : SEMESTER to check
   * local_slots : function mapping session ids to slot information
   */
  CHECK_WITH_SLOTS(course, cur_semester, local_slots, groupChoice) == (/*{{{*/
      course : COURSES
      &
      cur_semester : SEMESTERS
      &
      # /* LET */ (Units).
      (
        Units = course_units(course, cur_semester)
        &
        CHECK_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cur_semester, {}, {}, Units, local_slots, {}, groupChoice)
      )
    );/*}}}*/

  /* call UNSAT_CORE to compute minimal conflict set of units for course */
  UNSAT_CORE_OLD(course, cur_semester) == (unsat_core(course_units(course, cur_semester),{},cur_semester, slots));

  UNSAT_UNIT_CORE(course, cur_semester) == UNSAT_CORE( %x.(x:POW(INTEGER)|bool(CHECK_UNITS(x,cur_semester, slots))),
                                                       course_units(course, cur_semester));

  UNSAT_SESSION_CORE (uc,cur_semester) == 
    UNION(uu).(uu=uc| /* a LET construct to avoid recomputing uc three times if uc is a call to UNSAT_UNIT_CORE */
               unsat_session_core(uc, cur_semester, 
                                    union(unit_group_multiple_session[uc]), /* relevant_sessions*/
                                    {}, /* ignored sessions */
                                    union(unit_group_single_session[uc]), /*sc */
                                    slots)); 
 
  UNSAT_SESSION_CORE_NEW(uc,cur_semester) == 
    UNION(uu).(uu=uc| /* a LET construct to avoid recomputing uc four times if uc is a call to UNSAT_UNIT_CORE */
      union(unit_group_single_session[uu]) \/
      (union(unit_group_multiple_session[uu]) \
      MAX_SAT( %x.(x:POW(INTEGER)|
        bool(not(#(groupChoice).(CHECK_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cur_semester, {}, {}, uu, slots, x, groupChoice))))),
					 union(unit_group_multiple_session[uu])
					   ) ));


  MAXSAT_CORE(course, sem) == course_units(course, sem) -  sel[disjoint_cores(course_units(course, sem), sem, slots)];

  CHECK(course, cur_semester, groupChoice) == CHECK_WITH_SLOTS(course, cur_semester, slots, groupChoice);

  /*
   * XXX
   */
  CHECK_GLOBAL_WITH_SLOTS(course, local_slots, ignored_sessions, groupChoice, semesterChoice) == course : COURSES /*{{{*/
      &
      # /* LET */ (Units).
      (
        Units = union(course_units[{course}*SEMESTERS])
        &
        CHECK_UNITS_GLOBAL_WITH_IGNORED_SESSIONS(course, {}, {}, Units, local_slots, ignored_sessions, groupChoice, semesterChoice)
      );/*}}}*/
  CHECK_GLOBAL(course, groupChoice, semesterChoice) == course : COURSES & CHECK_GLOBAL_WITH_SLOTS(course, slots, {}, groupChoice, semesterChoice);

  COMPUTE_ALTERNATIVES(idx, relevant_courses) == {x| x : SLOTS \ {unknown, slots(idx)} &
    #(alt_slots, groupChoice).(
      alt_slots = slots <+ {(idx, x)} &
      /* XXX potentially contains some redundant checks */
      !(course, sem).(course : relevant_courses & sem : session_semester(idx) => CHECK_WITH_SLOTS(course, sem, alt_slots, groupChoice))
    )
  };

  /*
   * ALTERNATIVES(idx)
   * Compute alternative slots for the slot/session identified by idx
   * Generates a set of globally valid alternatives
   * For all courses and semesters associated to unit
   * Generated set is empty, if there is a conflict with one the course combinations valid for course(idx)
   */
   ALTERNATIVES(idx) == ALTERNATIVES_WITH_IGNORED_COURSES(idx, {});

   ALTERNATIVES_WITH_IGNORED_COURSES(idx, ignored_courses) == COMPUTE_ALTERNATIVES(idx, session_course[{idx}] - ignored_courses);
  /*
   * LOCAL_ALTERNATIVES(idx, cc)
   * Compute alternative slots for the slot/session identified by idx relative to the slots/sessions of course cc
   * Generates a set of locally valid alternatives with regard to course cc
   */
   LOCAL_ALTERNATIVES(idx, cc) == COMPUTE_ALTERNATIVES(idx, {cc});

  RECOMPUTE_DATA == Data := { (sid, r) | #(session, uid, unit, gid, group, map_uid).(
    (sid, session): sessions
    & (uid, unit) : units
    & (gid, group): unit'groups
    & sid : group'sessions
    & map_uid = mapping~[{uid}] /* manual CSE */
    &
    r = rec(title:group'title,
            slot:slots(sid),
            frequency:session'rhythm, /* rename rhythm to frequency for sessions */
            unit: uid,
            group: gid,
            all_semesters: ran(map_uid),
            department: unit'department,
            session_modules: { m | #(course, module).(
              (course) : dom(map_uid) & module : MODULES
              &
              m = rec(course:course, module:module, class:1, type:P, focus:0,
                      semesters:map_uid[{(course)}])
            )}
          )
  )};
   RECOMPUTE_VARS == RECOMPUTE_DATA;
OPERATIONS
  move(session, slot) =
    PRE
      session : dom(sessions)
      & slot : SLOTS
      & slots(session) /= slot
    THEN
      slots := slots <+ {(session, slot)}; RECOMPUTE_VARS
    END;

  gc <-- check(course, semester) =
    ANY groupChoice
    WHERE
      course : COURSES
      &
      semester : SEMESTERS
      &
      CHECK(course, semester, groupChoice)
    THEN
      gc := groupChoice
    END;

  gc, sc <-- check_global(course) =
    ANY groupChoice, semesterChoice
    WHERE
      course : COURSES
      &
      CHECK_GLOBAL(course, groupChoice, semesterChoice)
    THEN
      gc, sc := groupChoice, semesterChoice
    END;

  uc <-- unsat_session_core(course, semester) =
    PRE
      course : COURSES
      &
      semester : SEMESTERS
      &
      not(#(groupChoice).(CHECK(course, semester, groupChoice)))
    THEN
      uc := UNSAT_SESSION_CORE(UNSAT_UNIT_CORE(course, semester), 1) <| Data
    END;

  aa <-- alternatives(idx) =
    PRE
      idx : AllSessions
    THEN
      aa := ALTERNATIVES(idx)
    END;

  aa <-- local_alternatives(idx, cc) =
    PRE
      idx : AllSessions
      &
      cc : COURSES
    THEN
      aa := LOCAL_ALTERNATIVES(idx, cc)
    END

END
