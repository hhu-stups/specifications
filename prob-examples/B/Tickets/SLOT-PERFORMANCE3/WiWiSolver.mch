MACHINE WiWiSolver
/* SlotTool Solving Machine for WiWi (WIrtschaftsWIssenschaften) */
/* requires wiwi_data.mch Data machine (can be generated using Makefile) */

/* See doc/vocabulary.md for vocabulary definitions */

SEES wiwi_data, base
DEFINITIONS
  "LibraryIO.def";
  "check_cs_good.def"; /* check_cs.def or check_cs_good.def */
  "helper.def";
  GROUP_CHOICE(domain) == (
    groupChoice : domain --> 1..max_group & printf("setting up groupChoice domain: ~w~n",[domain]) 
    &
    !(u).( u : domain =>
      groupChoice(u) : 1..unit_max_group(u)
    )
  );
  /* Case 2.1 */
  /*
   * Is it possible to take all mandatory units for a major in a given semeseter
   * Check all mandatory units within ONE semester for a major for conflicts 
   */
  CHECK_MAJOR_SEMESTER(cc, semester) == cc : MAJORS & semester : SEMESTERS & CHECK_MAJOR_SEMESTER_WITH_IGNORED_UNITS(cc, semester, {});
  CHECK_MAJOR_SEMESTER_WITH_IGNORED_UNITS(cc, semester, ignored_units) == cc : MAJORS
    &
    semester : SEMESTERS
    &
    ignored_units <: AllUnits
    &
    printf("Checking major and semester ~w~n",[(cc, semester)]) &
    #(groupChoice, munits, conflict_set, semesterChoice).(
      munits = mandatory_in_semester(cc, semester) - ignored_units
      &
      GROUP_CHOICE(munits)
      &
      semesterChoice = munits*{semester}
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set : munits <-> munits
      &
      conflict_set = { a,b |
          a: munits & b : munits & a < b /* symmetry breaking: a/=b and compare pairs in ascencding order */
          &
          unit_slots(a, sessions) /\ unit_slots(b, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );
  /*
   * Is it possible to take all mandatory units for a given major
   */
  CHECK_MAJOR(cc) == cc : MAJORS & CHECK_MAJOR_WITH_IGNORED_UNITS(cc, {});
  /*
   * cc: MAJORS course to check
   * ignored_units <: AllUnits, set of units to ignored
   */
  CHECK_MAJOR_WITH_IGNORED_UNITS(cc, ignored_units) ==
    cc : MAJORS &
    ignored_units <: AllUnits &
    printf("Checking major ~w~n",[(cc)]) &
    #(groupChoice, munits, munit_semester, conflict_set, semesterChoice).(
      munit_semester = ignored_units <<| mandatory(cc)
      &
      munits = dom(munit_semester)
      &
      GROUP_CHOICE(munits)
      &
      semesterChoice : munits --> SEMESTERS
      &
      !(u).( u : munits =>
        semesterChoice(u) : munit_semester[{u}]
      )
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set : munits <-> munits
      &
      conflict_set = { a,b |
          a: munits & b : munits & a < b /* symmetry breaking: a/=b and compare pairs in ascencding order */
          &
          unit_slots(a, sessions) /\ unit_slots(b, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );
  /*
   * Check Mandatory and choices
   * Case 2.2
   * Conflicts among WP units can be checked in 2.1 and are thus ignored here
   * As extracted from BWL documents (XXX verify) we require any N optional,
   * where is defined in major_module_requirement, modules and all mandatory
   * units for a major to be considered feasible.
   * XXX Check for conflicts among mandatory units (or rely on 2.1)
   * XXX Check for conflicts among optional units in the selected modules? (code in comment bellow)
   */
  CHECK_P_WP(cc) == cc : MAJORS & CHECK_P_WP_WITH_IGNORED_UNITS(cc, {});
  CHECK_P_WP_WITH_IGNORED_UNITS(cc, ignored_units) == cc : MAJORS
    &
    printf("Checking major ~w~n", [cc])
    &
    #(groupChoice, m_unit_semester, m_unit, wp_unit_semester, wp_unit, relevant_units, conflict_set, semesterChoice,optional_modules,module_choice).(
      m_unit_semester = ignored_units <<| mandatory(cc)
      &
      m_unit = dom(m_unit_semester)
      &
      optional_modules = {m|#(c,f,s,u).((m,c,cc,W,f,s,u):mapping)} /* move to function */
      &
      module_choice <: optional_modules
      &
      card(module_choice) = min({card(optional_modules), major_module_requirement(cc)}) /* some focus areas have less than two modules */
      &
      printf("Module Choice ~w~n", [module_choice])
      &
      wp_unit_semester = union(module_units[module_choice]) <| (ignored_units <<| wp(cc))
      &
      wp_unit = dom(wp_unit_semester)
      &
      relevant_units = m_unit \/ wp_unit
      &
      GROUP_CHOICE(relevant_units)
      &
      semesterChoice : relevant_units --> SEMESTERS
      &
      !(u).( u : relevant_units =>
        semesterChoice(u) : (m_unit_semester \/ wp_unit_semester)[{u}]
      )
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set: relevant_units <-> wp_unit
      &
      conflict_set = { u1, u2 | u1 : m_unit & u2 : wp_unit &
          unit_slots(u1, sessions) /\ unit_slots(u2, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      /* \/ {(u1, u2)| u1 : wp_unit & u2 : wp_unit & /1* pairs of units in optional modules *1/ */
      /*     u1 < u2 /1* symmetry breaking *1/ */
      /*     & */
      /*     unit_slots(u1, sessions) /\ unit_slots(u2, sessions) /= {} /1* only check units potentially in conflict (i.e. some slots in common) *1/ */
      /* } */
      &
      printf("CS: ~w~n", [conflict_set])
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );
  /*
   * Check mandatory and optional units for a major and semester
   *
   * Pairs of mandatory units can be checked in 2.1
   * Note: Checks pairs of mandatory and optional units, not pairs of mandatory
   * or pairs of optional units
   *
   * We check all pairs, to find any conflict between a mandatory and an
   * optional unit within ONE semester
   * XXX Do we need a check for conflicts among optional units?
   */
  CHECK_P_WP_SEMESTER(cc, semester) == cc : MAJORS & semester : SEMESTERS & CHECK_P_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, {});
  CHECK_P_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, ignored_units) == cc : MAJORS & semester : SEMESTERS
    &
    printf("Checking major and semester ~w~n",[(cc, semester)]) &
    #(groupChoice, semesterChoice, m_units, wp_units, relevant_units, conflict_set).(
      m_units = mandatory_in_semester(cc, semester) - ignored_units
      &
      wp_units = wp_in_semester(cc, semester) - ignored_units
      &
      relevant_units = m_units \/ wp_units
      &
      GROUP_CHOICE(relevant_units)
      &
      semesterChoice = relevant_units*{semester}
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set : m_units <-> wp_units
      &
      conflict_set = { a,b  | /* all pairs of mandatory and optional units */
          a: m_units & b : wp_units
          &
          unit_slots(a, sessions) /\ unit_slots(b, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );

  /*
   * Check optional units for a major and semester
   *
   * We check all pairs of optional units for a semester
   * This will potentially find many conflicts, which do not directly affect the viability of a major
   * but is likely helpful for general planning
   */
  CHECK_WP_SEMESTER(cc, semester) == cc : MAJORS & semester : SEMESTERS & CHECK_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, {});
  CHECK_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, ignored_units) == cc : MAJORS & semester : SEMESTERS
    &
    printf("Checking major and semester ~w~n",[(cc, semester)]) &
    #(groupChoice, semesterChoice, relevant_units, conflict_set).(
      relevant_units = wp_in_semester(cc, semester) - ignored_units
      &
      GROUP_CHOICE(relevant_units)
      &
      semesterChoice = relevant_units*{semester}
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set : relevant_units <-> relevant_units
      &
      conflict_set = { a,b  | /* all pairs of mandatory and optional units */
          a: relevant_units & b : relevant_units
          &
          a < b /* symmetry breaking */
          &
          unit_slots(a, sessions) /\ unit_slots(b, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );
  /* ----------------------------------------
   * Case 2.3 focus areas
   * ---------------------------------------- */

  /*
   * CHECK_FOCUS
   * cc : Majors
   * focus : id of a focus area
   *
   * Global check of all mandatory units and 2 modules from focus area.
   * Checks for conflicts among mandatory and focus area units and among selected focus area units
   *
   * Represents feasibility of a major and focus combination
   */
  CHECK_FOCUS(cc, focus) == cc : MAJORS & focus  : NATURAL & CHECK_FOCUS_WITH_IGNORED_UNITS(cc, focus, {});
  CHECK_FOCUS_WITH_IGNORED_UNITS(cc, focus, ignored_units) == cc : MAJORS & focus : dom(focus_areas)
    &
    printf("Checking viability for major and focus area ~w~n", [(cc, focus_areas(focus))])
    &
    #(groupChoice, m_unit_semester, m_unit, wp_unit_semester, wp_unit,
      relevant_units, conflict_set, semesterChoice, focus_modules, module_choice).(
      m_unit_semester = ignored_units <<| mandatory(cc)
      &
      m_unit = dom(m_unit_semester)
      &
      focus_modules = {m|#(c,s,u).((m,c,cc,W,focus,s,u):mapping)} /* move to function */
      &
      printf("Focus Modules ~w~n", [focus_modules])
      &
      module_choice <: focus_modules
      /*   & module_choice : { {BW20,BW08}   , {BW22,BW08}   }   */
    /*   & module_choice = {BW20,BW08} */
  /*  & (not(module_choice /: { {BW20,BW08} })) */
      &
      card(module_choice) = min({card(focus_modules), 2}) /* some focus areas have less than two modules */
      &
      printf("Module Choice ~w~n", [module_choice]) & 
      /* observe((module_choice,groupChoice,semesterChoice)) & */
      printf("Group Choice ~w~n", [groupChoice])
      &
      wp_unit_semester = union(module_units[module_choice]) <| (ignored_units <<| wp(cc))
      &
      wp_unit = dom(wp_unit_semester)
      &
      relevant_units = m_unit \/ wp_unit
      &
      GROUP_CHOICE(relevant_units)
      &
      semesterChoice : relevant_units --> SEMESTERS
      &
      !(u).( u : relevant_units =>
        semesterChoice(u) : (m_unit_semester \/ wp_unit_semester)[{u}]
      )
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set: relevant_units <-> wp_unit
      &
      conflict_set = { u1, u2 | u1 : m_unit & u2 : wp_unit &  /* pairs of mandatory and focus area units */
          unit_slots(u1, sessions) /\ unit_slots(u2, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      \/ { u1, u2 | u1 : wp_unit & u2 : wp_unit & /* pairs of focus area units */
          u1 < u2 /* symmetry breaking */
          &
          unit_slots(u1, sessions) /\ unit_slots(u2, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      printf("CS: ~w~n", [conflict_set])
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );

  /*
   * CHECK_FOCUS_SEMESTER
   * cc : Majors
   * focus : id of focus area
   * semester : number
   *
   * Semester wise check for conflicts among mandatory units and focus area modules
   * This checks all combinations of mandatory units with focus area units and
   * focus area units with other focus area units in one semester.
   * This does not necessarily imply that the combination is not feasible in
   * general, but only that certain optional modules are in conflict with
   * mandatory or other optional modules.
   */
  CHECK_FOCUS_SEMESTER(cc, focus, semester) == cc : MAJORS & focus : dom(focus_areas) & semester : SEMESTERS & CHECK_FOCUS_SEMESTER_WITH_IGNORED_UNITS(cc, focus, semester, {});
  CHECK_FOCUS_SEMESTER_WITH_IGNORED_UNITS(cc, focus, semester, ignored_units) == cc : MAJORS & focus : dom(focus_areas) & semester : SEMESTERS & ignored_units <: AllUnits
    &
    printf("Checking major and focus area for semester ~w~n",[(cc, focus_areas(focus), semester)]) &
    #(groupChoice, semesterChoice, m_units, wp_units, relevant_units, conflict_set).(
      m_units = mandatory_in_semester(cc, semester) - ignored_units
      &
      wp_units = focus_area_units(cc, focus) /\ (wp_in_semester(cc, semester) - ignored_units)
      &
      relevant_units = m_units \/ wp_units
      &
      GROUP_CHOICE(relevant_units)
      &
      semesterChoice = relevant_units*{semester}
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set : relevant_units <-> wp_units
      &
      conflict_set = { a,b  | /* all pairs of mandatory and optional units */
          a: m_units & b : wp_units
          &
          unit_slots(a, sessions) /\ unit_slots(b, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      \/ { u1, u2 | u1 : wp_units & u2 : wp_units & /* pairs of focus area units */
          u1 < u2 /* symmetry breaking */
          &
          unit_slots(u1, sessions) /\ unit_slots(u2, sessions) /= {} /* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, sessions, {})
    );
  /*
   * UNSAT core computation
   */
  UNSAT_CORE_MAJOR(cc) == unsat_core_major(cc, dom(mandatory(cc)), {}, {});
  UNSAT_CORE_MAJOR_SEMESTER(cc, semester) == unsat_core_major_semester(cc, semester, dom(mandatory(cc)), {}, {});
  UNSAT_CORE_P_WP(cc) == unsat_core_p_wp(cc, dom(mandatory(cc)) \/ dom(wp(cc)) ,{}, {});
  UNSAT_CORE_P_WP_SEMESTER(cc, semester) == unsat_core_p_wp_semester(cc, semester, mandatory_in_semester(cc, semester) \/ wp_in_semester(cc, semester), {}, {});
  UNSAT_CORE_WP_SEMESTER(cc, semester) == unsat_core_wp_semester(cc, semester, wp_in_semester(cc, semester), {}, {});
  UNSAT_CORE_FOCUS(cc, focus) == unsat_core_focus(cc, focus, dom(mandatory(cc)) \/ focus_area_units(cc, focus) ,{}, {});
  UNSAT_CORE_FOCUS_SEMESTER(cc, focus, semester) == unsat_core_focus_semester(cc, focus, semester, dom(mandatory(cc)) \/ focus_area_units(cc, focus) ,{}, {});

ABSTRACT_CONSTANTS
  unsat_core_major, unsat_core_major_semester,
  unsat_core_p_wp, unsat_core_p_wp_semester,
  unsat_core_wp_semester, unsat_core_focus,
  unsat_core_focus_semester,
  get_slot, get_sessions
CONSTANTS
  mandatory_in_semester, wp_in_semester, wp, mandatory, Data,
  unit_group, AllUnits, all_unit_groups, unit_slots,
  unit_max_group, max_group, unit_groups_nonmatching_slots, module_units,
  focus_area_units
PROPERTIES
  wp = %(m).( m:MAJORS | { u, semester  | #(module, course, focus).((module, course, m, W, focus, semester, u) : mapping)})
  &
  mandatory = %(m).( m:MAJORS | { u, semester | #(module, course, focus).((module, course, m, P, focus, semester, u) : mapping)})
  &
  mandatory_in_semester = %(m, s).( m:MAJORS & s : SEMESTERS |{u| #(module, course, focus).((module, course, m, P, focus, s, u) : mapping)})
  &
  wp_in_semester = %(m, s).( m:MAJORS & s : SEMESTERS | {u| #(module, course, focus).((module, course, m, W, focus, s, u) : mapping)})
  &
  focus_area_units = %(m, focus).( m:MAJORS & focus : dom(focus_areas) | {u| #(module, course, s).((module, course, m, W, focus, s, u):mapping)})
  &
  /* ---------------------------------------- */
  /* UNSAT_CORE */
  /* ---------------------------------------- */

  /*
   * Find one of the possible unsat cores
   *
   * mm : MAJORS major being checked
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * cc <: dom(units) units in the unsat core
   */
  unsat_core_major =
       %(mm, xunits, iunits, cc).(mm : MAJORS & xunits <: AllUnits & iunits <: AllUnits & cc <: AllUnits & printf("unsat_core_major(~w)~n", [(mm, xunits, cc)])
                        | ifte(bool(xunits={}),
                              cc,
                              ifte(bool(CHECK_MAJOR_WITH_IGNORED_UNITS(mm,  iunits \/ {select(xunits)})),
                                  unsat_core_major(mm, xunits \ {select(xunits)}, iunits,                     cc \/ {select(xunits)}),
                                  unsat_core_major(mm, xunits \ {select(xunits)}, iunits \/ {select(xunits)}, cc)
                              )
                          )
                        )
  &
  /*
   * Find one of the possible unsat cores for a major in a specific semester
   *
   * course : MAJORS major being checked
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   */
  unsat_core_major_semester =
    %(course, semester, xunits, iunits, core).(course : MAJORS & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_MAJOR_SEMESTER_WITH_IGNORED_UNITS(course, semester, iunits \/ {select(xunits)})),
                                    unsat_core_major_semester(course, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}),
                                    unsat_core_major_semester(course, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core)
        )
      )
    )
  &
  /*
   *
   * course : MAJORS major being checked
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   */
  unsat_core_p_wp =
    %(course, xunits, iunits, core).(course : MAJORS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_P_WP_WITH_IGNORED_UNITS(course, iunits \/ {select(xunits)})),
                                    unsat_core_p_wp(course, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}),
                                    unsat_core_p_wp(course, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core)
        )
      )
    )
  &
  /*
   *
   * course : MAJORS major being checked
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   */
  unsat_core_p_wp_semester =
    %(course, semester, xunits, iunits, core).(course : MAJORS & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_P_WP_SEMESTER_WITH_IGNORED_UNITS(course, semester, iunits \/ {select(xunits)})),
                                    unsat_core_p_wp_semester(course, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}),
                                    unsat_core_p_wp_semester(course, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core)
        )
      )
    )
  &
  /*
   * unsat_core_wp_semester
   * course : MAJORS major being checked
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   */
  unsat_core_wp_semester =
    %(course, semester, xunits, iunits, core).(course : MAJORS & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_WP_SEMESTER_WITH_IGNORED_UNITS(course, semester, iunits \/ {select(xunits)})),
                                    unsat_core_wp_semester(course, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}),
                                    unsat_core_wp_semester(course, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core)
        )
      )
    )
  &
  /*
   * unsat_core_focus
   * course : MAJORS major being checked
   * focus : ID of focus area
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   */
  unsat_core_focus =
    %(course, focus, xunits, iunits, core).(course : MAJORS & focus : dom(focus_areas) & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_FOCUS_WITH_IGNORED_UNITS(course, focus, iunits \/ {select(xunits)})),
                                    unsat_core_focus(course, focus, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}),
                                    unsat_core_focus(course, focus, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core)
        )
      )
    )
  &
  /*
   * unsat_core_focus_semester
   * course : MAJORS major being checked
   * focus : ID of focus area
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   */
  unsat_core_focus_semester =
    %(course, focus, semester, xunits, iunits, core).(course : MAJORS & focus : dom(focus_areas) & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_FOCUS_SEMESTER_WITH_IGNORED_UNITS(course, focus, semester, iunits \/ {select(xunits)})),
                                    unsat_core_focus_semester(course, focus, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}),
                                    unsat_core_focus_semester(course, focus, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core)
        )
      )
    )
/* ---------------------------------------- */


    &
    Data = { r | #(sid, uid, map_uidx, map_semester, unit, group, session, semester).(
        (sid, session) : sessions
        & (uid, unit) : units
        & group : ran(unit'groups)
        & sid : group'sessions
        & semester : ran(map_uidx)
        &
        map_uidx = mapping~[{uid}] /* manual CSE */
        &
        map_semester = map_uidx~[{semester}]
        & r = rec(title:group'title,
                  semester:semester,
                  frequency:session'rhythm,
                  slot:session'slot,
                  bsession:sid,
                  modules:{ m | #(module, class, course, type, focus).(
          (module, class, course, type, focus) : map_semester
          & m = rec(course:course, class:class, focus:focus, type:type, module:module))
        })
      )}
    & /* map modules to the corresponding associated units */
    module_units = %(m).(m:MODULES|{u|#(c,cc,t,f,s).((m,c,cc,t,f,s,u) : mapping)})
    /* XXX stuff below should go to a shared location */
    /* XXX all these need to take data modification into account */
    &
    unit_group = %(u, g). ( u: AllUnits & g : dom(units(u)'groups) | units(u)'groups(g) )
    &
    /* slot accessor as a proper B function so that we can compute image */
    get_slot = %(r).(r:struct(duration:INTEGER, rhythm:INTEGER, slot:SLOTS) | r'slot)
    &
    /* sessions accessor as a proper B function so that we can compute image */
    get_sessions = %(r).(r:struct(sessions:POW(INTEGER), title:STRING) | r'sessions)
    &
    /* compute the slots that a unit can use */
    AllUnits = dom(units) &
    /* compute all possible groups for a given unit */
    all_unit_groups = %un.(un:AllUnits|unit_group[{un}*(1..unit_max_group(un))])
    &
    /* compute all possible slots which a given unit may use : */
    unit_slots = %(u, local_sessions).(u : AllUnits & local_sessions : seq(struct(duration:INTEGER, rhythm:INTEGER, slot:SLOTS))
                |get_slot[local_sessions[union(get_sessions[all_unit_groups(u)])]])
    /* mapping course and modules to max group, min is Always 1 */
    &
    unit_max_group = %u.(u:AllUnits | max(dom(units(u)'groups)))
    &
    max_group = max(ran(unit_max_group))
    &
    /* compute units whose number of sessions does not match number of slots (i.e. guaranteed conflict) */
    unit_groups_nonmatching_slots = {uid,gg | #(uu).((uid, uu) : units & gg : ran(uu'groups) &
    card(gg'sessions) /= card(ran(%(q).(q :sessions[gg'sessions] | q'slot))))}
ASSERTIONS
  /* Each module,course,subject has 1 priority */
  #(priority_map).(priority_map = { module, c, m, p  | #(s, u, f).((module,c,m,p,f,s,u) : mapping)} & !(key).(key : dom(priority_map) => card(priority_map[{key}]) = 1));
  /* each group has in total as many hours as required by the unit */
  !(i, u).((i,u) : units =>
    !(gi, g).((gi, g) : u'groups =>
      /* consider rhythm for the length */
      SIGMA(xx, dd).((xx, dd): { x, d | x: sessions[g'sessions] & d = (x'duration*60) / 2 & x'rhythm > 0} \/ {x, d| x: sessions[g'sessions] & d = x'duration * 60 & x'rhythm = 0} | dd) = u'duration * 60
    )
  );
  !(s).(s: ran(sessions) => s'duration : {1,2});
  1=1
END
