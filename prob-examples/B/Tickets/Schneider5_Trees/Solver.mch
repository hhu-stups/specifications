MACHINE Solver /* A Bit-Vector Version of NewSolver */
SEES data
CONSTANTS
  /* defined in helper.def:shared_properties */
    AllSessions,
    AllUnits,
    all_unit_groups,
    get_sessions,
    max_group,
    min_group,
    unit_group,
    unit_groups,
    unit_sessions,
    unit_group_multiple_session,
    unit_group_single_session,
    unit_max_group,
    unit_min_group,
    /* unit_map, */
    /* get_slot, */
    /* session_unit, */
  /* end */
  course_module_combinations,
  level_available_modules,
  level_mandatory_modules,
  mandatory_abstract_units,
  elective_abstract_units,
  maus
PROPERTIES
  /* defined in helper.def */
  SHARED_PROPERTIES
  &
  level_available_modules = { idx, mms |#(course, tt, ll).(
    (course, tt) : course_levels & ll : dom(tt)
    &
    idx = tt(ll)'idx
    &
    mms = level_modules[{x| #(y).(y : ran(subtree(tt, ll)) & x = y'idx)}]
  )}
  &
  level_mandatory_modules = %(idx).(idx: dom(level_available_modules) | {m|
                              m : level_available_modules(idx)
                              &
                              modules(m)'mandatory = TRUE
                            })
  &
  mandatory_abstract_units = {mm | mm : dom(abstract_units) & abstract_units(mm)'type = m}
  &
  elective_abstract_units = {mm | mm : dom(abstract_units) & abstract_units(mm)'type = e}
  &
  maus = {d|#(a,b,c).(d = (a,(b,c)) & (a,b,c) : module_abstract_unit_semester)}
  &
  /* sample data for debugging */
  /* course_module_combinations = {("bk-phi-H-2013") |-> {{1,2,3,4,5,7,8,17,18},{1,2,3,4,5,7,8,17,19}}} */
  /* & */
  course_module_combinations = { cc, combinations |
    cc : course_names
    &
    combinations = dom({rv, choice| CHOOSE_MODULES(cc, rv, choice)})
  }

DEFINITIONS
  "preferences.def";
  "LibraryIO.def";
  "check_cs.def";
  "helper.def";
  "external_functions.def";
  SLOTS == {1,2,3,4,5,6,7,8};
  BV(DD) == (DD --> BOOL);
  CHOOSE_MODULES(course, return_value, choice) == (
    course : course_names
    &
    #(mm, trees).(
      mm = course_modules(course)
      &
      trees = course_levels[{course}]
      /* we are looking for a subset of all modules for the given course */
      /* the selection of modules must satisfy the tree-conditions for all trees in that course */
      &
      myprintf("# trees = ~w~n",card(trees)) &
      myprintf("course modules = ~w~n",mm)
      &
      /* return value is the set of all modules for the given course, according to the choice function */
      return_value <: mm
      &
      return_value = UNION(ttu).(ttu:trees| choice(ttu)~[{TRUE}])
      &
      choice : trees --> BV(mm)
      &
      !(tt).(tt : trees =>
        #(lam, lmm).(
          lam = level_available_modules(top(tt)'idx)
          &
          lmm = level_mandatory_modules(top(tt)'idx)
          &
          /* Mandatory modules have to be chosen */
          !(dd).(dd : lmm => choice(tt)(dd)=TRUE)
          &
          /* Modules outside the available ones are never chosen */
          !(dd).(dd : mm \ lam => choice(tt)(dd)=FALSE)
          &
          /* the number of modules chosen at the root level must be in the limits of from .. to */
          card({dd|dd:lam & dd|->TRUE:choice(tt)}) : top(tt)'from .. top(tt)'to
          &
          !(level_info).(level_info : ran(tt) =>
            #(llmm, ll_mandatory).(
              llmm = level_available_modules(level_info'idx)
              &
              ll_mandatory = level_mandatory_modules(level_info'idx)
              &
              /* Mandatory modules have to be chosen */
              !(dd).(dd : ll_mandatory => choice(tt)(dd)=TRUE)
              &
              /* the number of modules chosen at each level must be in the limits of from .. to */
              card({y| y: mm & y|->TRUE : choice(tt) & y : llmm}) : level_info'from .. level_info'to
            )
          )
        )
      )
    )
  );

  CHECK(ccs, courseModuleChoice, semesterChoice, unitChoice, groupChoice) == (
    ccs : POW1(course_names)
    /* TODO check if card(ccs) = 2 one is a major and one a minor */
    &
    /*
     * XXX these variables need bo be defined in the context using the defintion,
     * quantifying them here has side effects on the enumeration order/speed
     */
    /* #(mms, mandatory_helper, possible_elective_units, elective_helper, */
    /*   module_units_helper, chosen_abstract_units, chosen_units).( */
      courseModuleChoice : ccs --> POW(dom(modules))
      &
      !(course).(course : ccs =>
          courseModuleChoice(course) : course_module_combinations(course)
      )
      &
      /* myprintf("Module Choice: ~w~n", courseModuleChoice) */
      /* & */
      mms = union(ran(courseModuleChoice))
      &
      CHECK_MODULE_CHOICE(mms, semesterChoice, unitChoice, groupChoice)
    );

    CHECK_MODULE_CHOICE(mms, semesterChoice, unitChoice, groupChoice) == (
      mms : POW(dom(modules))
      &
      mandatory_helper : mms --> POW(NATURAL*NATURAL)
      &
      !(mm).( mm : mms =>
        mandatory_helper(mm) = { au, sem | (au, sem) : maus[{mm}] & au : mandatory_abstract_units}
      )
      &
      /* myprintf("Mandatory helper ~w~n", mandatory_helper) */
      /* & */
      possible_elective_units = { mm, ausem |
        mm : mms & ausem : maus[{mm}]
        &
        #(au, sem).(
          (au, sem) = ausem
          &
          au : elective_abstract_units
        )
      }
      &
      /* myprintf("Possible possible_elective_units: ~w~n", possible_elective_units) */
      /* & */
      elective_helper : mms --> POW(NATURAL * NATURAL)
      &
      !(mm).( mm : mms =>
        card(elective_helper(mm)) = min({
                                  card(possible_elective_units[{mm}]),
                                  modules(mm)'elective_units})
        &
        elective_helper(mm) <: possible_elective_units[{mm}]
      )
      &
      /* myprintf("Elective_helper: ~w~n", elective_helper) */
      /* & */
      /* TODO: Ensure units are only chosen once */
      module_units_helper = %(x).( x : mms |
        union((elective_helper \/ mandatory_helper)[{x}])
      )
      &
      chosen_abstract_units = union(ran(module_units_helper))
      &
      myprintf("Chosen abstract_units ~w~n", chosen_abstract_units)
      &
      semesterChoice : dom(units) <-> 1..6
      &
      unitChoice : dom(chosen_abstract_units) --> dom(units)
      &
      !(au).(au : dom(chosen_abstract_units) =>
        #(options).(
          options  = { u, s  | (au, u, s) : abstract_unit_unit_semester & (au, s) : chosen_abstract_units}
          &
          myprintf("options ~w~n", (au, options))
          &
          #(cu, cs).(
            (cu, cs) : options
            &
            unitChoice(au) = cu
            &
            semesterChoice(cu) = cs
          )
        )
      )
      &
      myprintf("uc, sc ~w~n", (ran(unitChoice), dom(semesterChoice)))
      &
      ran(unitChoice) = dom(semesterChoice)
      &
      chosen_units = ran(unitChoice)
      &
      myprintf("Chosen units ~w~n", chosen_units)
      &
      CHECK_UNITS_GLOBAL_WITH_IGNORED_SESSIONS({}, {}, chosen_units,
                                                 slots, // XXX use local_slots which are a param
                                                 {}, //XXX use ignored_sessions,
                                                 groupChoice,
                                                 semesterChoice)
    /* ) */
  );

  /* choose one module combination for each course that has modules */
  /* // ff = course_module_combinations |> ran(course_module_combinations) - {{}} */ 
  /* // union(dom({m,cc | cc : ccsss & cc : dom(ff) & m=CHOOSE(ff(cc))})) */
  /* UNSAT_CORE_MODULES(courses) == */
  /*   UNSAT_CORE(%(modules).(modules : POW(MODULES) | */
  /*     bool( */
  /*       #(semesterChoice, groupChoice, moduleChoice).( */
  /*         CHECK2(course, modules, AllUnits, {}, slots, semesterChoice, */
  /*                 groupChoice, moduleChoice) */
  /*       ) */
  /*     ) */
  /*   ), all_course_modules(course)); */

VARIABLES
  slots
INVARIANT
  slots : dom(sessions) --> DAYS*SLOTS
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
    END;
  /* global */
  sc, gc, mc, uc <-- check(ccss) =
    ANY
      courseModuleChoice, groupChoice, semesterChoice, unitChoice,
      /* variables used in defintion */
      mms, mandatory_helper, possible_elective_units, elective_helper,
      module_units_helper, chosen_abstract_units, chosen_units
    WHERE
      card(ccss) <= 2
      &
      ccss : POW1(course_names)
      &
      ccss <: dom(course_module_combinations)
      &
      CHECK(ccss, courseModuleChoice, semesterChoice, unitChoice, groupChoice)
    THEN
      gc, sc, mc, uc := groupChoice, semesterChoice, courseModuleChoice, unitChoice
    END
END
