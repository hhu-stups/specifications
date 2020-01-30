MACHINE Solver
/* VERSION: 1.0.0-dev */
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
  level_available_modules,
  level_mandatory_modules,
  mandatory_abstract_units,
  elective_abstract_units,
  maus,
  abstract_unit_ids
PROPERTIES
  /* defined in helper.def */
  SHARED_PROPERTIES
  &
  level_available_modules = {(idx, mms)|#(course, tt, ll).(
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
  /* maps from module id to the pair of abstract-unit and recommended semester */
  maus = {d|#(a,b,c).(d = (a,(b,c)) & (a,b,c) : module_abstract_unit_semester)}
  &
  abstract_unit_ids = dom(abstract_units)


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
      printf("# trees = ~w~n",card(trees)) &
      printf("course modules = ~w~n",mm)
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

  /* XXX Make sure rv is {} if modules do not have credit points */
  /* XXX Unify with above */
  /* XXX propagate chosen modules to siblings */
  CHOOSE_MODULES_CP(course, return_value, choice) == (
    course : course_names
    &
    #(mm, trees).(
      mm = course_modules(course)
      &
      trees = course_levels[{course}]
      /* we are looking for a subset of all modules for the given course */
      /* the selection of modules must satisfy the tree-conditions for all trees in that course */
      &
      printf("# trees = ~w~n",card(trees)) &
      printf("course modules = ~w~n",mm)
      &
      /* return value is the set of all modules for the given course, according to the choice function */
      return_value <: mm
      &
      return_value = UNION(ttu).(ttu:trees| choice(ttu)~[{TRUE}])
      &
      /* the sum of credit points in all chosen modules is equal to the amount required for the degree */
      SIGMA(module, ttu).(ttu: trees & module: mm & module |-> TRUE : choice(ttu) | modules(module)'credit_points) = courses(course)'credit_points
      /* SIGMA(module).(module : return_value | modules(module)'credit_points) = courses(course)'credit_points */

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
          /* the sum of the modules' credit points must be in the range
           * required in the level */
          SIGMA(module).(module: lam & module |-> TRUE : choice(tt) | modules(module)'credit_points ) : top(tt)'min_credit_points ..  top(tt)'max_credit_points
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
              /* the sum of the modules' credit points chosen at each level
               * must be in the range required in the level */
              SIGMA(module).(module : mm & module |-> TRUE : choice(tt) & module : llmm | modules(module)'credit_points ) : level_info'min_credit_points ..  level_info'max_credit_points
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
     * XXX these variables need to be defined in the context using the defintion,
     * quantifying them here has side effects on the enumeration order/speed
     */
    /* #(mms, mandatory_helper, possible_elective_units, elective_helper, */
    /*   module_units_helper, chosen_abstract_units, chosen_units).( */
      courseModuleChoice : ccs --> POW(dom(modules))
      &
      !(course).(course : ccs =>
          /* courseModuleChoice(course) : course_module_combinations(course) */
          /* for debugging */
          courseModuleChoice(course) = CHOOSE(course_module_combinations(course))
      )
      &
      printf("Module Choice: ~w~n", courseModuleChoice)
      &
      mms = union(ran(courseModuleChoice))
      &
      CHECK_MODULE_CHOICE(mms, abstract_unit_ids, semesterChoice, unitChoice, groupChoice)
    );

    /* Second stage of validation, takes a set of chosen modules and a set of
     * available abstract units to validate their feasibility  */
    CHECK_MODULE_CHOICE(module_ids, au_ids, semesterChoice, unitChoice, groupChoice) == (
      mms = module_ids
      /* & */
      /* mms : POW(dom(modules)) */
      &
      restricted_maus = {(mm, aus)| mm : mms & #(au, sem).((au, sem) : maus[{mm}] & au : au_ids & aus = (au, sem))} // aus = (au_ids <| maus[{mm}])}
      &
      restricted_mandatory_abstract_units = au_ids /\ mandatory_abstract_units
      &
      restricted_elective_abstract_units = au_ids /\ elective_abstract_units
      &
      possible_elective_units = {(mm, ausem)|
        mm : mms & ausem : restricted_maus[{mm}]
        &
        #(au, sem).(
          (au, sem) = ausem
          &
          au : restricted_elective_abstract_units
        )
      }
      &
      printf("Possible possible_elective_units: ~w~n", possible_elective_units)
      &
      mandatory_helper : mms --> POW(NATURAL*NATURAL)
      &
      elective_helper : mms --> POW(NATURAL * NATURAL)
      &
      !(mm).( mm : mms =>
        mandatory_helper(mm) = {(au, sem)|
                                  (au, sem) : restricted_maus[{mm}]
                                  &
                                  au : restricted_mandatory_abstract_units
                                }
        &
        card(elective_helper(mm)) = min({
                                  card(possible_elective_units[{mm}]),
                                  modules(mm)'elective_units})
        &
        elective_helper(mm) <: possible_elective_units[{mm}]
      )
      &
      printf("Mandatory helper ~w~n", mandatory_helper)
      &
      printf("Elective_helper: ~w~n", elective_helper)
      &
      /* TODO: Ensure units are only chosen once */
      module_units_helper = %(x).( x : mms |
        union((elective_helper \/ mandatory_helper)[{x}])
      )
      &
      CHECK_ABSTRACT_UNIT_CHOICE(union(ran(module_units_helper)), AllUnits /* XXX choose a smaller set ? */, semesterChoice, unitChoice, groupChoice)
    );

    CHECK_ABSTRACT_UNIT_CHOICE(cauc_abstact_units, p_u_ids, semesterChoice, unitChoice, groupChoice) == #(u_ids).(u_ids = p_u_ids &
      /* filter abstract units for those that have units in u_ids */
      chosen_abstract_units = dom({(au, s, u)| (au, s) : cauc_abstact_units
                                  & u : u_ids
                                  & (au, u, s) : abstract_unit_unit_semester})
      &
      relevant_units = u_ids <| units
      &
      relevant_abstract_unit_unit_semester = {(au, u, s)| (au, u, s) : abstract_unit_unit_semester & (au, s) : chosen_abstract_units & u : u_ids}
      &
      printf("options ~w~n", (relevant_abstract_unit_unit_semester))
      &
      printf("Relevant units ~w~n", relevant_units)
      &
      printf("Chosen abstract_units ~w~n", chosen_abstract_units)
      &
      semesterChoice : dom(relevant_units) <-> 1..6
      &
      unitChoice : dom(chosen_abstract_units) --> dom(relevant_units)
      &
      !(au).(au : dom(chosen_abstract_units) =>
        #(cu, cs).(
          (au, cu, cs) : relevant_abstract_unit_unit_semester
          &
          unitChoice(au) = cu
          &
          semesterChoice(cu) = cs
        )
      )
      /* & */
      /* printf("uc, sc ~w~n", (unitChoice, semesterChoice)) */
      &
      printf("ran(uc), ran(sc) ~w~n", (ran(unitChoice), ran(semesterChoice))) &
      ran(unitChoice) = dom(semesterChoice)
      &
      chosen_units = ran(unitChoice)
      /* & */
      /* printf("Chosen units ~w~n", chosen_units) */
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
  UNSAT_CORE_MODULES(ccs) == UNION(selected_modules).(
    ccs <: course_names
    &
    /* choose a pair of modules, as all must be in conflict */
    selected_modules = UNION(ff).(ff = course_module_combinations |> ran(course_module_combinations) - {{}} |
      union(dom({mm, cc| cc : ccs & cc : dom(ff) & mm = CHOOSE(ff(cc))}))
    ) |
    UNSAT_CORE(%(modules_for_uc).(modules_for_uc : POW(dom(modules)) |
      bool(
        /* printf("SELECTED MODULES~w~n ", (modules_for_uc, selected_modules)) & */
        /* why do values that are not in selected modules appear in modules_for_uc ??? */
        modules_for_uc <: selected_modules
        &
        #(groupChoice, semesterChoice, unitChoice,
          /* variables used in defintion */
          mms, mandatory_helper, possible_elective_units, elective_helper,
          module_units_helper, chosen_abstract_units, chosen_units,
          restricted_maus, restricted_elective_abstract_units,
          restricted_mandatory_abstract_units, relevant_units, relevant_abstract_unit_unit_semester).(
            CHECK_MODULE_CHOICE(modules_for_uc, abstract_unit_ids, semesterChoice, unitChoice, groupChoice)
        )
      )
    ), selected_modules));

  UNSAT_CORE_ABSTRACT_UNITS(modules_in_uc) == UNION(relevant_abstract_unit_ids).(
    modules_in_uc <: dom(modules)
    &
    /* choose a pair of modules, as all must be in conflict */
    relevant_abstract_unit_ids = dom(module_abstract_unit_semester)[modules_in_uc] |
    UNSAT_CORE(%(abstract_units_for_uc).(abstract_units_for_uc : POW(abstract_unit_ids) |
      bool(
        #(groupChoice, semesterChoice, unitChoice,
          /* variables used in defintion */
          mms, mandatory_helper, possible_elective_units, elective_helper,
          module_units_helper, chosen_abstract_units, chosen_units,
          restricted_maus, restricted_elective_abstract_units,
          restricted_mandatory_abstract_units, relevant_units, relevant_abstract_unit_unit_semester).(
            CHECK_MODULE_CHOICE(modules_in_uc, abstract_units_for_uc, semesterChoice, unitChoice, groupChoice)
        )
      )
    ), relevant_abstract_unit_ids));

  UNSAT_CORE_UNITS(modules_in_uc, abstract_units_in_uc) == UNION(relevant_unit_ids, ausem_for_uc, foo).(
    foo = abstract_units_in_uc
    &
    relevant_unit_ids = dom(abstract_unit_unit_semester)[foo]
    &
    printf("FOO ~w~n", (foo, relevant_unit_ids))
    &
    ausem_for_uc = dom({(aaa, sss, mmm)| (mmm, aaa, sss) : module_abstract_unit_semester & mmm : modules_in_uc & aaa : foo}) 
    |
    UNSAT_CORE(%(units_for_uc).(units_for_uc : POW(relevant_unit_ids) |
      bool(
        printf("Units for uc ~w~n", (relevant_unit_ids, units_for_uc))
        &
        printf("AUSEM for UC ~w~n", ausem_for_uc)
        &
        #(groupChoice, semesterChoice, unitChoice,
          /* variables used in defintion */
          chosen_abstract_units, chosen_units,
          relevant_units, relevant_abstract_unit_unit_semester).(
            CHECK_ABSTRACT_UNIT_CHOICE(ausem_for_uc, units_for_uc, semesterChoice, unitChoice, groupChoice)
        )
      )
    ), relevant_unit_ids));

  UNSAT_CORE_SESSIONS(units_in_uc) == UNION(relevant_sessions).(
    relevant_sessions = union(unit_sessions[units_in_uc]) |
    MAX_SAT(%(sessions_for_uc).(sessions_for_uc : POW(relevant_sessions) |
      bool(#(groupChoice, semesterChoice).(
        CHECK_UNITS_GLOBAL_WITH_IGNORED_SESSIONS({}, {}, units_in_uc,
                                                 slots,
                                                 sessions_for_uc,
                                                 groupChoice,
                                                 semesterChoice)))
    ), relevant_sessions))

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
      module_units_helper, chosen_abstract_units, chosen_units,
      restricted_maus, restricted_elective_abstract_units,
      restricted_mandatory_abstract_units, relevant_units,
      relevant_abstract_unit_unit_semester

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
