MACHINE Solver
/* VERSION: 7.0.0-dev */
/* IDEA: Get rid of units and unitChoice, map abstract units to groups after
 * computing the relation of abstract units semesters and groups based on units
 * Ignroe units while solving.
 *
 * Groups that belog to different units within the
 * same abstract unit can be statically ignored, resolving the issue of
 * multiple units whit excatly the same groups.

 * Results so far, this seems to be slover than v6, maybe propagation needs to
 * be improved.  Expectation would be to achieve better results as v6, since we
 * have one decision variable less.
 */

INCLUDES data
CONSTANTS
  /* defined in helper.def:shared_properties */
    all_unit_groups,
    get_sessions,
    unit_group,
    unit_groups,
    group_sessions,
    unit_sessions,
    /* unit_map, */
    /* get_slot, */
    /* session_unit, */
    session_unit,
    session_group, session_group_aux,
  /* end */
  abstract_unit_single_unit,
  mandatory_modules,
  module_abstract_units,
  maus,
  maut,
  equivalent_abstract_units,
  abstract_units_wo_units,
  abstract_unit_semester_group,
  abstract_unit_groups,
  impossible_courses_module_combinations,
  impossible_courses,
  impossible_course_abstract_units,
  impossible_courses_because_of_impossible_modules,
  quasi_mandatory_module_abstract_units,
  redundant_unit_groups,
  units_could_be_merged,
  incomplete_modules,
  impossible_module_abstract_unit,
  impossible_modules_because_of_impossible_abstract_units
PROPERTIES
  /* defined in helper.def */
  SHARED_PROPERTIES
  &

  session_group_aux = ({z,x,w| w : UNITS & x : units(w)'groups & z : groups(x)'sessions}) & /* auxiliary variable to speed up ProB */
  session_group =  dom(session_group_aux)
  &
  session_unit = dom({z,w,x| w : UNITS & x : units(w)'groups & z : groups(x)'sessions})
  &
  abstract_units_wo_units = ABSTRACT_UNITS - dom(abstract_unit_unit)
  &
  /* abstract_unit_semester_group is a map that associated abstract units
   * directly to groups and semesters where they can be satisfied.
   *
   */
  abstract_unit_semester_group = LET
    ausg, grp_sess
  BE
    ausg = dom({au,sem,group,u|(au,u) : abstract_unit_unit & sem : units(u)'semesters & group : unit_groups(u)}) &
    grp_sess = %g.(g:GROUPS|sessions[groups(g)'sessions])
  IN
    LET
      repeated
    BE
      /* we try to find groups g1,g2 which are equivalent concerning "Termine" (day and time of sessions) */
      /* NOTE: this takes about 1 minute to compute for philfak data on a MacBook Pro 2011 */
      repeated = dom({au_sem, g2, g1| // au_sem : dom(ausg) & {g1, g2} <: ausg[{au_sem}] &
                    DO_NOT_ENUMERATE(g2) &
                    // this encoding is slightly faster:
                    au_sem |-> g1 : ausg &  au_sem |-> g2 : ausg &
                    LESS(g1, g2) &
                    grp_sess(g1) = grp_sess(g2)})
          // repeated = dom({au_sem, g2, g1|  au_sem |-> g1 : ausg &  au_sem |-> g2 : ausg & LESS(g1, g2) & grp_sess(g1) = grp_sess(g2)})
    IN
      ausg - repeated
    END
  END
  &
  abstract_unit_groups = dom({a,c,b| (a,b): abstract_unit_unit & c : unit_groups(b)})
  &
  /* maps from module id to the pair of abstract-unit and recommended semester */
  /* Note: Abstract Units without actual units are removed from this set */
  /* (m)odule -> (a)bstract_(u)nit -> (s)emester */
  maus = {d|#(a,b,c).(d = (a,(b,c)) & DO_NOT_ENUMERATE((a,b,c)) & (a,b,c) : module_abstract_unit_semester & b /: abstract_units_wo_units)}
  &
  /* maps from module id to the pair of abstract-unit and type of the abstract
   * unit in the module */
  /* Note: Abstract Units without actual units are removed from this set */
  /* (m)odule -> (a)bstract_(u)nit -> (t)emester */
  maut = {d|#(a,b,c).(d = (a,(b,c)) & DO_NOT_ENUMERATE((a,b,c)) & (a,b,c) : module_abstract_unit_type
                                 & b /: abstract_units_wo_units)}
  &
  /* set of pairs of abstract units that are composed of the same concrete
   * units
   * Abstract Units might be assigned to different semesters throuch their
   * modules
   */
  equivalent_abstract_units = {a,b| a : dom(abstract_unit_unit) & b : dom(abstract_unit_unit) &
                                    LESS(a, b) &
                                    abstract_unit_unit[{a}] = abstract_unit_unit[{b}]
                                    }
  &
  /* modules and set of abstract units that are elective but quasi-mandatory,
   * because the module contains exactly as much elective abstract units as it
   * requires for its completion */
  quasi_mandatory_module_abstract_units = LET mau
    BE
      mau = module_abstract_unit_type~[{e}] // select only elective (m,au) pairs
    IN
      {x,au| x : MODULES
                        & au : mau[{x}]
                        & card(mau[{x}]) = modules(x)'elective_units}
      \/
      // and mandatory abstract units are also mandatory
      module_abstract_unit_type~[{m}]
    END
  &
  mandatory_modules = %(cc).(cc : course_names | IF course_module_combinations[{cc}] = {{}}
                                                  THEN
                                                    {}
                                                  ELSE
                                                    inter(course_module_combinations(cc))
                                                  END)
  &
   // get the abstract units for a module
   module_abstract_units = %(mm).(mm:MODULES | dom({au, s| (mm,au,s) : module_abstract_unit_semester}))
  &
  // TODO and discard them in case it is the case:
  /* Perform these computations on any solution we find */
  /* impossible_courses_module_combinations are those courses with (implicitly)
   * mandatory modules that contain pairs of mandatory abstract units which
   * each have one unit and which is the same in both abstract units, hence it
   * is impossible to choose a different unit for each abstract unit in
   * question
   */
  abstract_unit_single_unit = {au | au : ABSTRACT_UNITS & card(abstract_unit_unit[{au}]) = 1}
  &
  impossible_courses_module_combinations = LET problems
  BE
    /* candidates with a unit in common */
    problems = {x1,x2| x1 : abstract_unit_single_unit & x2 : abstract_unit_single_unit & LESS(x1, x2)
                & abstract_unit_unit[{x1}] /\ abstract_unit_unit[{x2}] /= {}}
  IN
    LET impossible_modules
    BE
      /* TODO: check if we can generalize to module pairs */
      impossible_modules = {module, x1, x2| (x1, x2) : problems
                  & {(module,x1), (module,x2)} <: quasi_mandatory_module_abstract_units}
    IN
      {cc,mm,x1,x2| cc : course_names & mm : course_modules(cc)
                                & mm : mandatory_modules(cc)
                                & (mm,x1,x2): impossible_modules}
    END // impossible_modules
  END // problems
  &
  /* impossible_course_abstract_units are those courses that contain mandatory
   * abstract units without units (due to missing links or invalid import data)
   * in (implicitly) mandatory modules such that it is impossible to choose a
   * unit in any of these courses.
   */
  impossible_course_abstract_units = {ccx, mmx, au| au : abstract_units_wo_units
                                      & (mmx, au) : quasi_mandatory_module_abstract_units
                                      & ccx  : course_names
                                      & mmx : course_modules(ccx)
                                      & mmx : mandatory_modules(ccx)}
  &
  /* Units for abstract units that could probably be merged to a single unit
   * with multiple groups. Each group has one session and each unit has one
   * group.  Each unit has the same semesters.
   */
  units_could_be_merged =  LET
    unit_abstract_unit
  BE
    unit_abstract_unit = {a,b| b : ran(abstract_unit_unit) & a = abstract_unit_unit~[{b}]}
  IN
    LET merge
    BE
     merge = {y,x|x : dom(unit_abstract_unit)
               // all units point to the same set of abstract units
               & y = unit_abstract_unit[{x}]
               // more than one unit in group
               & card(y) > 1
               // all units have one semester configuration
               & card(ran(%(u).(u : y | units(u)'semesters))) = 1
               // all units have one group
               & !(u).(u : y => card(units(u)'groups) = 1)}
    IN
      merge
      /* dom(merge) */
    END
  END
  &
  /* Pairs of groups for each unit that have the same half_semester and contain
   * the same sessions (same day and time) hence one could be removed */
  redundant_unit_groups = dom(dom(dom(dom({x,gid1, gid2, g1, g2, s1, s2 | x : UNITS
                                            & gid1 : units(x)'groups
                                            & gid2 : units(x)'groups
                                            & LESS(gid1, gid2)
                                            & g1 = groups(gid1)
                                            & g2 = groups(gid2)
                                            & g1'half_semester = g2'half_semester
                                            & s1 = sessions[g1'sessions]
                                            & s2 = sessions[g2'sessions]
                                            & s1 = s2}))))
  &
  /* Modules that contain less elective abstract units than required according
   * to the module defintion.  This does not affect the validation, in the
   * sense that we only consider the minum of required and available modules
   * (needed among other things in UC computatoin)
   */
  incomplete_modules = LET mel
  BE
    mel = {mm, au | (mm, au, e) : module_abstract_unit_type}
  IN
    {a,b| (a,b) : modules & card(mel[{a}]) < b'elective_units}
  END
  &
  /* module, abstract unit pairs for which it is impossible to choose a unit
   * that satisfies the semester requirements
   */
  impossible_module_abstract_unit = LET mau
  BE
    mau = dom(module_abstract_unit_semester)
  IN
    {md, au, sems| DO_NOT_ENUMERATE((md,au,sems)) & (md,au) : mau
                    & sems = module_abstract_unit_semester[{(md,au)}]
                    & !(ru).(
                              ru:units[abstract_unit_unit[{au}]]
                        =>
                                    ru'semesters /\ sems = {})}
  END
  &
  /* modules that are impossible because they contain mandatory or
   * quasi-mandatory abstract units that are impossible because of the semester requirements
  */
  impossible_modules_because_of_impossible_abstract_units =
    /* modules that have impossible mandatory abstract units and
     * quasi-mandatory abstract units, i.e. elective modules in a module that
     * requires as many elective units as there are available ones
     */
    dom({x,au| x : MODULES
              & (x, au) : quasi_mandatory_module_abstract_units
              & (x, au) : dom(impossible_module_abstract_unit)})
  &
  impossible_courses_because_of_impossible_modules =
        dom({a,b| (a,b) : mandatory_modules
                  & b /\ impossible_modules_because_of_impossible_abstract_units /= {}})
  &
  impossible_courses = dom(dom(dom(impossible_courses_module_combinations)))
                        \/ dom(dom(impossible_course_abstract_units))
                        \/ impossible_courses_because_of_impossible_modules

DEFINITIONS
  "preferences.def";
  "LibraryIO.def";
  "LibraryMeta.def";
  "external_functions.def";
  "SolverDefs_v7.def";
  SET_PREF_TIME_OUT == 120000;
  EXTERNAL_PREDICATE_DO_NOT_ENUMERATE(T) == T;
  DO_NOT_ENUMERATE(o) == (1=1);
  "assertions_v7.def";



ASSERTIONS
  ASSERTION1;

  ASSERTION2;

  REQ_schema_version;

  REQ_course_module_combinations;

  REQ_courses_name;

  REQ_UNIQUE_courses_idx;

  REQ_UNIQUE_modules_idx;

  REQ_credit_points_consistent;

  REQ_groups_do_not_share_sessions;

  REQ_groups_are_conflict_free

VARIABLES
  slots
INVARIANT
  /*@label inv1 */ slots : dom(sessions) --> DAYS*SLOTS
INITIALISATION
  slots := %(x).(x : dom(sessions)| (sessions(x)'dow, sessions(x)'slot))
OPERATIONS

  move(session, dow, slot) =
    PRE
      session : dom(sessions)
      & dow : DAYS
      & slot : SLOTS
      & slots(session) /= (dow, slot)
    THEN
      slots := slots <+ {(session, (dow, slot))}
    END
    ;
  sc, gc, mc <-- check(ccss) =
    ANY
      courseModuleChoice, groupChoice, semesterChoice,
      /* variables used in defintion */
      mms, elective_helper

    WHERE
      card(ccss) <= 2
      &
      ccss : POW1(course_names)
      &
      ccss <: dom(course_module_combinations)
      &
      CHECK(ccss, courseModuleChoice, semesterChoice, groupChoice)
    THEN
    /*
     * TODO: *Note* An alternative would be to map the non-numeric IDs in the model to the corresponding numeric
     * values and send those to the application. Then the mappers would only need to map B-Ints and Strings to the
     * corresponding Java types instead of extracting the IDs from the non-numeric ID strings
     */
      gc, mc, sc := groupChoice, courseModuleChoice, semesterChoice
    END;

  sc, gc, mc <-- checkPartial(ccss, partialModuleChoice, partialAbstractUnitChoice) =
    ANY
      courseModuleChoice, groupChoice, semesterChoice,
      /* variables used in defintion */
      mms, elective_helper

    WHERE
      card(ccss) <= 2
      &
      ccss : POW1(course_names)
      &
      ccss <: dom(course_module_combinations)
      &
      //
      partialAbstractUnitChoice <: ABSTRACT_UNITS
      &
      //
      partialModuleChoice : ccss +-> POW(dom(modules))
      &
      dom(partialModuleChoice) <: ccss
      &
      dom(partialModuleChoice) <: dom(courseModuleChoice)
      &
      !(c,ms).((c,ms) : partialModuleChoice =>
        ms <: course_modules(c) // modules must be associated with the courset
        &
        ms <: courseModuleChoice(c) )
      &
      CHECK(ccss, courseModuleChoice, semesterChoice, groupChoice)
    THEN
    /*
     * TODO: *Note* An alternative would be to map the non-numeric IDs in the model to the corresponding numeric
     * values and send those to the application. Then the mappers would only need to map B-Ints and Strings to the
     * corresponding Java types instead of extracting the IDs from the non-numeric ID strings
     */
      gc, mc, sc := groupChoice, courseModuleChoice, semesterChoice
    END;

  impossible <-- getImpossibleCourses = BEGIN
    impossible := rec(courses:impossible_courses)
  END;

  uc <-- unsatCore(ccss) =
  PRE
      card(ccss) <= 2
      &
      ccss : POW1(course_names)
      &
      ccss <: dom(course_module_combinations)
      &
      ccss /\ impossible_courses = {}
  THEN
    LET uc_modules
    BE
      uc_modules = UNSAT_CORE_MODULES(ccss)
    IN
      LET
        uc_abstract_units
      BE
        uc_abstract_units = UNSAT_CORE_ABSTRACT_UNITS(uc_modules)
      IN
        LET
          uc_groups
        BE
          uc_groups = UNSAT_CORE_GROUPS(uc_modules, uc_abstract_units)
        IN
          uc := UNSAT_CORE_SESSIONS(uc_groups)
        END
      END
    END
  END;

  alternatives <-- localAlternatives(ccss, session) =
  PRE
    ccss <: course_names
    &
    card(ccss) <= 2
    THEN
    alternatives := LOCAL_ALTERNATIVES(ccss, session)
  END;

  version <-- getVersion = BEGIN
    version := "7.0.0-dev" // managed with bump version
  END
END
