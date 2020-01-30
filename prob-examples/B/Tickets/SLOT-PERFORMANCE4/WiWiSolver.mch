MACHINE WiWiSolver
/* SlotTool Solving Machine for WiWi (WIrtschaftsWIssenschaften) */
/* requires wiwi_data.mch Data machine (can be generated using Makefile) */

/* See doc/vocabulary.md for vocabulary definitions */

SEES wiwi_data, base
DEFINITIONS
  "LibraryIO.def";
  "check_cs.def";
  "helper.def";
  EXTERNAL_PREDICATE_LINKED_ENUMERATION(A,B) == (A*B);
  LINKED_ENUMERATION(a,b) == (1=1);
  GROUP_CHOICE(domain) == (/*{{{*/
    groupChoice : domain --> 1..max_group
    &
    !(u).( u : domain =>
      groupChoice(u) : 1..unit_max_group(u)
       & LINKED_ENUMERATION(semesterChoice(u),groupChoice(u))
      /* & LINKED_ENUMERATION(groupChoice(u),semesterChoice(u)) */
    )
    /* & observe(groupChoice) */
  );/*}}}*/
  POSSIBLE_CHOICE(module_choice) ==
   !x.(x: { {MW17,MW03}, {MW10,MW08}, {MW10,MW06}, {MW10,MW26}, {MW10,MW17}, {MW10,MW27},
  {MW10,MW02}, {MW10,MW14}, {MW10,MW25}, {MW10,MW13}, {MW10,MW01}, {MW10,MW09},
  {MW10,MW28}, {MW10,MW03}, {MW10,MW05}, {MW10,MW31}, {MW10,MW29}, {MW10,MW16},
  {MW10,MW04}, {MW10,MW11}, {MW10,MW15}, {MW10,MW20}, {MW08,MW10} }
   => x /<: module_choice);
  MODULE_CHOICE(modules, nmodules, units_in_modules) == #(module_choice).(/*{{{*/
    module_choice <: modules /* seems to generate duplicates XXXX */
    &
    card(module_choice) = min({card(modules), 3})
    /* & module_choice = {MW10,MW08,MW06} */ /* for debugging */
    & POSSIBLE_CHOICE(module_choice)
    &
    printf("min({card(modules), nmodules}) ~w~n", min({card(modules), nmodules})) &
    printf("Module Choice ~w~n", module_choice)
    & /* some focus areas have less than two modules */
    units_in_modules = union(module_units[module_choice])
  );/*}}}*/

  /*
   * Mixed mode checking helper
   * cc : COURSES
   * s1 <: AllUnits
   * s2 <: AllUnits
   * mixed <: AllUnits
   * local_slots: mapping from sessions to slots
   * ignored_sessions <: sessions to be ignored in checks
   *
   * Globally check units in s1, s2 and mixed for conflicts
   *
   * Note:
   * Units in mixed are checked against all other units
   * Units in s1 and s2 are only checked against elements in the other sets
   */
  CHECK_MIXED_UNITS_WITH_IGNORED_SESSIONS(cc, s1, s2, mixed, local_slots, ignored_sessions) == #(relevant_units, semesterChoice).(
      relevant_units = (s1 \/ s2 \/ mixed)
      &
      semesterChoice : relevant_units --> SEMESTERS
      &
      !(u).( u : relevant_units =>
        semesterChoice(u) : unit_course_semester(u,cc)
      )
      &
      /* observe(semesterChoice) & */ 
      printf("relevant_units = ~w~n",relevant_units) &
      CHECK_UNITS_WITH_IGNORED_SESSIONS(cc, s1, s2, mixed, relevant_units, semesterChoice, local_slots, ignored_sessions)
    );
  /*
   * Mixed mode checking helper
   * cc : COURSES
   * semester : SEMESTERS
   * munits <: AllUnits
   * wpunits <: AllUnits
   * local_slots: mapping from sessions to slots
   * ignored_sessions <: sessions to be ignored in checks
   *
   * Semesterwise check units in munits and wpunits for conflicts
   *
   * Note:
   * Units in wpunits are checked against all other units
   * Units in munits are only checked against units in munits
   */
  CHECK_MIXED_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cc, semester, munits, wpunits, local_slots, ignored_sessions) == #(relevant_units, semesterChoice).(
      relevant_units = munits \/ wpunits
      &
      semesterChoice = relevant_units * {semester}
      &
      CHECK_UNITS_WITH_IGNORED_SESSIONS(cc, {}, munits, wpunits, relevant_units, semesterChoice, local_slots, ignored_sessions)
    );

  CHECK_UNITS_WITH_IGNORED_SESSIONS(cc, s1, s2, mixed, relevant_units, semesterChoice, local_slots, ignored_sessions) == #(groupChoice, conflict_set).(
      GROUP_CHOICE(relevant_units)
      &
      /* Set of unit-pairs to be checked for conflicts */
      conflict_set: relevant_units <-> relevant_units
      &
      conflict_set = {(u1, u2)| u1 : s1 & u2 : s2 &
          local_slots[unit_sessions(u1)] /\ local_slots[unit_sessions(u2)] /= {}/* only check units potentially in conflict (i.e. some slots in common) */
      }
      \/
      {(u1, u2)| u1 : s1 & u2 : mixed &
          local_slots[unit_sessions(u1)] /\ local_slots[unit_sessions(u2)] /= {}/* only check units potentially in conflict (i.e. some slots in common) */
      }
      \/
      {(u1, u2)| u1 : s2 & u2 : mixed &
          local_slots[unit_sessions(u1)] /\ local_slots[unit_sessions(u2)] /= {}/* only check units potentially in conflict (i.e. some slots in common) */
      }
      \/
      {(u1, u2)| u1 : mixed & u2 : mixed & /* pairs of units in optional modules */
          u1 < u2 /* symmetry breaking */
          &
         local_slots[unit_sessions(u1)] /\ local_slots[unit_sessions(u2)] /= {}/* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      printf("CS: ~w~n", conflict_set)
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, local_slots, ignored_sessions)
    );
  /* Case 2.1 */
  /*
   * Is it possible to take all mandatory units for a major in a given semeseter
   * Check all mandatory units within ONE semester for a major for conflicts
   */

  CHECK_MAJOR_SEMESTER_WITH_IGNORED_UNITS(cc, semester, local_slots, ignored_units) == cc : COURSES & local_slots : POW(INTEGER * SLOTS) & semester : SEMESTERS & ignored_units <: AllUnits /*{{{*/
    &
    printf("Checking major and semester ~w~n",(cc, semester)) &
    #(munits).(
      munits = mandatory_in_semester(cc, semester) - ignored_units
      &
      CHECK_MIXED_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cc, semester, {}, munits, local_slots, {})
    );/*}}}*/
  CHECK_MAJOR_SEMESTER(cc, semester) == cc : COURSES & semester : SEMESTERS & CHECK_MAJOR_SEMESTER_WITH_IGNORED_UNITS(cc, semester, slots, {});
  /*
   * Is it possible to take all mandatory units for a given major
   */
  /*
   * cc: COURSES course to check
   * ignored_units <: AllUnits, set of units to ignored
   */
  CHECK_MAJOR_WITH_IGNORED_UNITS(cc, local_slots, ignored_units) == cc : COURSES & ignored_units <: AllUnits & local_slots : POW(INTEGER * SLOTS)/*{{{*/
    &
    printf("Checking major ~w~n",(cc)) &
    #(munits).(
      munits = mandatory(cc) - ignored_units
      &
      CHECK_MIXED_UNITS_WITH_IGNORED_SESSIONS(cc, {}, {}, munits, local_slots, {})
    );/*}}}*/
  CHECK_MAJOR(cc) == cc : COURSES & CHECK_MAJOR_WITH_IGNORED_UNITS(cc, slots, {});
  /*
   * Check Mandatory and choices
   * Case 2.2
   * As extracted from BWL documents (XXX verify) we require any N optional,
   * where is defined in major_module_requirement, modules and all mandatory
   * units for a major to be considered feasible.
   *
   * Checks for conflicts among optional and mandatory units
   * Checks for conflicts among optional units in the selected modules
   * Conflicts among P units can be checked in 2.1 and are thus ignored here
   *
   * XXX Check for conflicts among mandatory units (or rely on 2.1)
   */
  CHECK_P_WP_WITH_IGNORED_UNITS(cc, local_slots, ignored_units) == cc : COURSES & local_slots : POW(INTEGER * SLOTS)/*{{{*/
    &
    printf("Checking major ~w~n", cc)
    &
    #(m_unit, wp_unit, optional_modules, mod_units).(
      m_unit = mandatory(cc) - ignored_units
      &
      optional_modules = course_optional_modules(cc)
      &
      MODULE_CHOICE(optional_modules, major_module_requirement(cc), mod_units)
      &
      wp_unit = mod_units /\ (wp(cc) - ignored_units)
      &
      printf("optional_modules ~w~n",optional_modules) & printf("mod_units ~w~n",mod_units)  & printf("wp_unit ~w~n",wp_unit)
      &
      CHECK_MIXED_UNITS_WITH_IGNORED_SESSIONS(cc, {}, m_unit, wp_unit, local_slots, {})
    );/*}}}*/
  CHECK_P_WP(cc) == cc : COURSES & CHECK_P_WP_WITH_IGNORED_UNITS(cc, slots, {});
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
  CHECK_P_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, local_slots, ignored_units) == cc : COURSES & semester : SEMESTERS & local_slots : POW(INTEGER * SLOTS)/*{{{*/
    &
    printf("Checking major and semester ~w~n",(cc, semester)) &
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
      conflict_set = {(a,b) | /* all pairs of mandatory and optional units */
          a: m_units & b : wp_units
          &
          local_slots[unit_sessions(a)] /\ local_slots[unit_sessions(b)] /= {}/* only check units potentially in conflict (i.e. some slots in common) */
      }
      &
      CHECK_CS(conflict_set, groupChoice, semesterChoice, local_slots, {})
    );/*}}}*/
  CHECK_P_WP_SEMESTER(cc, semester) == cc : COURSES & semester : SEMESTERS & CHECK_P_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, slots, {});

  /*
   * Check optional units for a major and semester
   *
   * We check all pairs of optional units for a semester
   * This will potentially find many conflicts, which do not directly affect the viability of a major
   * but is likely helpful for general planning
   */
  CHECK_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, local_slots, ignored_units) == cc : COURSES & semester : SEMESTERS & local_slots : POW(INTEGER * SLOTS)/*{{{*/
    &
    printf("Checking major and semester ~w~n",(cc, semester)) &
    #(ru).(
      ru = wp_in_semester(cc, semester) - ignored_units
      &
      CHECK_MIXED_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cc, semester, {}, ru, local_slots, {})
    );/*}}}*/
  CHECK_WP_SEMESTER(cc, semester) == cc : COURSES & semester : SEMESTERS & CHECK_WP_SEMESTER_WITH_IGNORED_UNITS(cc, semester, slots, {});
  /* ----------------------------------------
   * Case 2.3 focus areas
   * ---------------------------------------- */

  /*
   * CHECK_FOCUS
   * cc : COURSES
   * focus : id of a focus area
   *
   * Global check of all mandatory units and 2 modules from focus area.
   * Checks for conflicts among mandatory and focus area units and among selected focus area units
   *
   * Represents feasibility of a major and focus combination
   */
  CHECK_FOCUS_WITH_IGNORED_UNITS(cc, focus, local_slots, ignored_units) == cc : COURSES & focus : dom(focus_areas) & local_slots : POW(INTEGER * SLOTS)/*{{{*/
    &
    printf("Checking viability for major and focus area ~w~n", (cc, focus_areas(focus)))
    &
    #(m_unit, wp_unit, focus_modules, mod_units).(
      m_unit = mandatory(cc) - ignored_units
      &
      focus_modules = {m|#(c,s,u).((m,c,cc,W,focus,s,u):mapping)} /* move to function */
      &
      MODULE_CHOICE(focus_modules, 2, mod_units)
      &
      wp_unit = mod_units /\ (wp(cc) - ignored_units)
      &
      CHECK_MIXED_UNITS_WITH_IGNORED_SESSIONS(cc, {}, m_unit, wp_unit, local_slots, {})
    );/*}}}*/
  CHECK_FOCUS(cc, focus) == cc : COURSES & focus  : NATURAL & CHECK_FOCUS_WITH_IGNORED_UNITS(cc, focus, slots, {});
  /*
   * CHECK_FOCUS_SEMESTER
   * cc : COURSES
   * focus : id of focus area
   * semester : number
   *
   * Semesterwise check for conflicts among mandatory units and focus area
   * modules This checks all combinations of mandatory units with focus area
   * units and focus area units with other focus area units in one semester.
   * This does not necessarily imply that the combination is not globally
   * feasible in general, but only that certain optional modules are in
   * conflict with mandatory or other optional modules within the selected
   * semester
   */
  CHECK_FOCUS_SEMESTER_WITH_IGNORED_UNITS(cc, focus, semester, local_slots, ignored_units) == cc : COURSES & focus : dom(focus_areas) & semester : SEMESTERS & ignored_units <: AllUnits & local_slots : POW(INTEGER * SLOTS)/*{{{*/
    &
    printf("Checking major and focus area for semester ~w~n",(cc, focus_areas(focus), semester)) &
    #(m_units, wp_units).(
      m_units = mandatory_in_semester(cc, semester) - ignored_units
      &
      wp_units = focus_area_units(cc, focus) /\ (wp_in_semester(cc, semester) - ignored_units)
      &
      CHECK_MIXED_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cc, semester, m_units, wp_units, local_slots, {})
    );/*}}}*/
  CHECK_FOCUS_SEMESTER(cc, focus, semester) == cc : COURSES & focus : dom(focus_areas) & semester : SEMESTERS & CHECK_FOCUS_SEMESTER_WITH_IGNORED_UNITS(cc, focus, semester, slots, {});
  /*
   * UNSAT core computation
   */
  UNSAT_CORE_MAJOR(cc)                           == unsat_core_major(cc, mandatory(cc), {}, {}, slots);
  UNSAT_CORE_MAJOR_SEMESTER(cc, semester)        == unsat_core_major_semester(cc, semester, mandatory(cc), {}, {}, slots);
  UNSAT_CORE_P_WP(cc)                            == unsat_core_p_wp(cc, mandatory(cc) \/ wp(cc) ,{}, {}, slots);
  UNSAT_CORE_P_WP_SEMESTER(cc, semester)         == unsat_core_p_wp_semester(cc, semester, mandatory_in_semester(cc, semester) \/ wp_in_semester(cc, semester), {}, {}, slots);
  UNSAT_CORE_WP_SEMESTER(cc, semester)           == unsat_core_wp_semester(cc, semester, wp_in_semester(cc, semester), {}, {}, slots);
  UNSAT_CORE_FOCUS(cc, focus)                    == unsat_core_focus(cc, focus, mandatory(cc) \/ focus_area_units(cc, focus) ,{}, {}, slots);
  UNSAT_CORE_FOCUS_SEMESTER(cc, focus, semester) == unsat_core_focus_semester(cc, focus, semester, mandatory(cc) \/ focus_area_units(cc, focus) ,{}, {}, slots);
  /*
   * Session Core computation
   */
  UNSAT_SESSION_CORE_GLOBAL(uc,cc)             == (unsat_session_core_global(uc, cc, union(unit_group_multiple_session[uc]), {}, union(unit_group_single_session[uc]), slots));
  UNSAT_SESSION_CORE_SEMESTER(uc,cc, semester) == (unsat_session_core_semester(uc, cc, semester, union(unit_group_multiple_session[uc]), {}, union(unit_group_single_session[uc]), slots));
  /* TODO: p_wp_semester, focus_semester, wp_semester */
  /*
   * Recomputation
   */
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
            session_modules: { m | #(module, class, course, type, focus).(
              (module, class, course, type, focus) : dom(map_uid)
              &
              m = rec(course:course, module:module, class:class, type:type, focus:focus,
                      semesters:map_uid[{(module, class, course, type, focus)}])
            )}
          )
  )};
  RECOMPUTE_VARS == RECOMPUTE_DATA;

ABSTRACT_CONSTANTS
  get_sessions,
  get_slot,
  unit_map,
  unsat_core_focus,
  unsat_core_focus_semester,
  unsat_core_major,
  unsat_core_major_semester,
  unsat_core_p_wp,
  unsat_core_p_wp_semester,
  unsat_core_wp_semester,
  unsat_session_core_global,
  unsat_session_core_semester
CONSTANTS
  AllSessions,
  AllUnits,
  all_unit_groups,
  course_optional_modules,
  focus_area_units,
  mandatory,
  mandatory_in_semester,
  max_group,
  min_group,
  module_units,
  session_semester,
  unit_course_semester,
  unit_group,
  unit_group_multiple_session,
  unit_group_single_session,
  unit_max_group,
  unit_min_group,
  unit_sessions,
  wp,
  wp_in_semester
  /* ,units_definitely_in_conflict */
PROPERTIES
  /* units_definitely_in_conflict = UnitsDefinitelyInConflict & takes 8 secs to compute */
  
  wp = %(m).( m:COURSES | {(u) | #(module, course, focus, semester).((module, course, m, W, focus, semester, u) : mapping)})
  &
  mandatory = %(m).( m:COURSES | {(u) | #(module, course, focus, semester).((module, course, m, P, focus, semester, u) : mapping)})
  &
  /* assuming every unit is assigned at most once to a course */
  unit_course_semester = %(u, cc).(u : AllUnits & cc : COURSES & u : (mandatory(cc) \/ wp(cc))| {semester | #(module, class, type, focus).((module, class, cc, type, focus, semester, u) : mapping)})
  &
  mandatory_in_semester = %(m, s).( m:COURSES & s : SEMESTERS |{u| #(module, course, focus).((module, course, m, P, focus, s, u) : mapping)})
  &
  wp_in_semester = %(m, s).( m:COURSES & s : SEMESTERS | {u| #(module, course, focus).((module, course, m, W, focus, s, u) : mapping)})
  &
  focus_area_units = %(m, focus).( m:COURSES & focus : dom(focus_areas) | {u| #(module, course, s).((module, course, m, W, focus, s, u):mapping)})
  &
  course_optional_modules = %(cc).( cc : COURSES | {m|#(c,f,s,u).((m,c,cc,W,f,s,u):mapping)})
  &
  /* ---------------------------------------- */
  /* UNSAT_CORE */
  /* ---------------------------------------- */

  /*
   * Find one of the possible unsat cores
   *
   * mm : COURSES major being checked
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * cc <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_major =/*{{{*/
       %(mm, xunits, iunits, cc, local_slots).(mm : COURSES & xunits <: AllUnits & iunits <: AllUnits & cc <: AllUnits & local_slots : POW(INTEGER * SLOTS) & printf("unsat_core_major(~w)~n", (mm, xunits, cc))
                        | ifte(bool(xunits={}),
                              cc,
                              ifte(bool(CHECK_MAJOR_WITH_IGNORED_UNITS(mm, local_slots, iunits \/ {select(xunits)})),
                                  unsat_core_major(mm, xunits \ {select(xunits)}, iunits,                     cc \/ {select(xunits)}, local_slots),
                                  unsat_core_major(mm, xunits \ {select(xunits)}, iunits \/ {select(xunits)}, cc,                     local_slots)
                              )
                          )
                        )/*}}}*/
  &
  /*
   * Find one of the possible unsat cores for a major in a specific semester
   *
   * course : COURSES major being checked
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_major_semester =/*{{{*/
    %(course, semester, xunits, iunits, core, local_slots).(course : COURSES & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits & local_slots : POW(INTEGER * SLOTS)
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_MAJOR_SEMESTER_WITH_IGNORED_UNITS(course, semester, local_slots, iunits \/ {select(xunits)})),
                                    unsat_core_major_semester(course, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}, local_slots),
                                    unsat_core_major_semester(course, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core,                     local_slots)
        )
      )
    )/*}}}*/
  &
  /*
   *
   * course : COURSES major being checked
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_p_wp =/*{{{*/
    %(course, xunits, iunits, core, local_slots).(course : COURSES & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits & local_slots : POW(INTEGER * SLOTS)
        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_P_WP_WITH_IGNORED_UNITS(course, local_slots, iunits \/ {select(xunits)})),
                                    unsat_core_p_wp(course, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}, local_slots),
                                    unsat_core_p_wp(course, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core,                     local_slots)
        )
      )
    )/*}}}*/
  &
  /*
   *
   * course : COURSES major being checked
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_p_wp_semester =/*{{{*/
    %(course, semester, xunits, iunits, core, local_slots).(course : COURSES & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits & local_slots : POW(INTEGER * SLOTS)

        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_P_WP_SEMESTER_WITH_IGNORED_UNITS(course, semester, local_slots, iunits \/ {select(xunits)})),
                                    unsat_core_p_wp_semester(course, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}, local_slots),
                                    unsat_core_p_wp_semester(course, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core,                     local_slots)
        )
      )
    )/*}}}*/
  &
  /*
   * unsat_core_wp_semester
   * course : COURSES major being checked
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_wp_semester =/*{{{*/
    %(course, semester, xunits, iunits, core, local_slots).(course : COURSES & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits & local_slots : POW(INTEGER * SLOTS)

        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_WP_SEMESTER_WITH_IGNORED_UNITS(course, semester, local_slots, iunits \/ {select(xunits)})),
                                    unsat_core_wp_semester(course, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}, local_slots),
                                    unsat_core_wp_semester(course, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core,                     local_slots)
        )
      )
    )/*}}}*/
  &
  /*
   * unsat_core_focus
   * course : COURSES major being checked
   * focus : ID of focus area
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_focus =/*{{{*/
    %(course, focus, xunits, iunits, core, local_slots).(course : COURSES & focus : dom(focus_areas) & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits & local_slots : POW(INTEGER * SLOTS)

        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_FOCUS_WITH_IGNORED_UNITS(course, focus, local_slots, iunits \/ {select(xunits)})),
                                    unsat_core_focus(course, focus, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}, local_slots),
                                    unsat_core_focus(course, focus, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core,                     local_slots)
        )
      )
    )/*}}}*/
  &
  /*
   * unsat_core_focus_semester
   * course : COURSES major being checked
   * focus : ID of focus area
   * semester : SEMESTER semester being checkd
   * xunits <: dom(units) units left to check
   * iunits <: dom(units) irrelevant units
   * core <: dom(units) units in the unsat core
   * local_slots: session to slot mapping
   */
  unsat_core_focus_semester =/*{{{*/
    %(course, focus, semester, xunits, iunits, core, local_slots).(course : COURSES & focus : dom(focus_areas) & semester : SEMESTERS & xunits <: AllUnits & iunits <: AllUnits & core <: AllUnits & local_slots : POW(INTEGER * SLOTS)

        | ifte(bool(xunits={}),
            core,
            ifte(bool(CHECK_FOCUS_SEMESTER_WITH_IGNORED_UNITS(course, focus, semester, local_slots, iunits \/ {select(xunits)})),
                                    unsat_core_focus_semester(course, focus, semester, xunits \  {select(xunits)}, iunits,                     core \/ {select(xunits)}, local_slots),
                                    unsat_core_focus_semester(course, focus, semester, xunits \  {select(xunits)}, iunits \/ {select(xunits)}, core,                     local_slots)
        )
      )
    )/*}}}*/

  /* ---------------------------------------- */
  /* Session Core computation */
  /* ---------------------------------------- */
   &
   unsat_session_core_semester =/*{{{*/
         %(uc, cc, semester, relevant_sessions, ignored_sessions, sc, local_slots).(uc <: AllUnits & cc : COURSES  & semester : SEMESTERS & relevant_sessions <: dom(sessions) & ignored_sessions <: dom(sessions) &  sc <: dom(sessions) & local_slots : POW(INTEGER * SLOTS)
                     | ifte(bool(relevant_sessions={}),
                             sc,
                             ifte(bool(CHECK_MIXED_UNITS_IN_SEMESTER_WITH_IGNORED_SESSIONS(cc, semester, {}, uc, local_slots, ignored_sessions \/ {select(relevant_sessions)})),
                                       unsat_session_core_semester(uc, cc, semester, relevant_sessions - {select(relevant_sessions)}, ignored_sessions                               , sc \/ {select(relevant_sessions)}, local_slots),
                                       unsat_session_core_semester(uc, cc, semester, relevant_sessions - {select(relevant_sessions)}, ignored_sessions \/ {select(relevant_sessions)}, sc                               , local_slots))))/*}}}*/
  /*
   * uc <: AllUnits an unsat core
   * cc : COURSES the semester the core corresponds to
   * relevant_sessions <: dom(sessions) sessions to be considered
   * ignored_sessions <: dom(sessions) sessions to be considered
   * sc <: relevant_sessions the computed core of the sessions
   * local_slots: session to slot mapping
   */
   &
   unsat_session_core_global =/*{{{*/
         %(uc, cc, relevant_sessions, ignored_sessions, sc, local_slots).(uc <: AllUnits & cc : COURSES & relevant_sessions <: dom(sessions) & ignored_sessions <: dom(sessions) &  sc <: dom(sessions) & local_slots : POW(INTEGER * SLOTS)
                     | ifte(bool(relevant_sessions={}),
                             sc,
                             ifte(bool(CHECK_MIXED_UNITS_WITH_IGNORED_SESSIONS(cc, {}, uc /\ mandatory(cc), uc /\ wp(cc), local_slots, ignored_sessions \/ {select(relevant_sessions)})),
                                       unsat_session_core_global(uc, cc, relevant_sessions - {select(relevant_sessions)}, ignored_sessions                               , sc \/ {select(relevant_sessions)}, local_slots),
                                       unsat_session_core_global(uc, cc, relevant_sessions - {select(relevant_sessions)}, ignored_sessions \/ {select(relevant_sessions)}, sc                               , local_slots)))) /*}}}*/
/* ---------------------------------------- */


    & /* map modules to the corresponding associated units */
    module_units = %(m).(m:MODULES|{u|#(c,cc,t,f,s).((m,c,cc,t,f,s,u) : mapping)})
    &
    /* See helper.def for defintion */
    SHARED_PROPERTIES
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
  /* XXX Extract and merge with phil-fak model */
  slots := {x,z| #(y).((x,y) : sessions & z = y'slot)};
  /* compute units whose number of sessions does not match number of slots (i.e. guaranteed conflict) */
  unit_groups_nonmatching_slots := {uid,gid | #(uu,gg).((uid, uu) : units & (gid, gg) : uu'groups &
                                    card(gg'sessions) /= card(slots[gg'sessions]))};
  RECOMPUTE_DATA
OPERATIONS
  move(session, slot) =
    PRE
      session : dom(sessions)
      & slot : SLOTS
      & slots(session) /= slot
    THEN
      slots := slots <+ {(session, slot)}; RECOMPUTE_VARS
    END
ASSERTIONS
  /* Each module,course,subject has 1 priority */
  #(priority_map).(priority_map = {(module, c, m, p) | #(s, u, f).((module,c,m,p,f,s,u) : mapping)} & !(key).(key : dom(priority_map) => card(priority_map[{key}]) = 1));
  /* each group has in total as many hours as required by the unit */
  !(i, u).((i,u) : units =>
    !(gi, g).((gi, g) : u'groups =>
      /* consider rhythm for the length */
      SIGMA(xx, dd).((xx, dd): {(x, d)| x: sessions[g'sessions] & d = (x'duration*60) / 2 & x'rhythm > 0} \/ {(x, d)| x: sessions[g'sessions] & d = x'duration * 60 & x'rhythm = 0} | dd) = u'duration * 60
    )
  );
  !(s).(s: ran(sessions) => s'duration : {1,2});
  1=1
END
