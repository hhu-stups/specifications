MACHINE Solver_v2
/* VERSION: 1.0.0-dev */
INCLUDES data
CONSTANTS
  /* defined in helper.def:shared_properties */
    all_unit_groups,
    get_sessions,
    unit_group,
    unit_groups,
    unit_sessions,
    unit_group_multiple_session,
    unit_group_single_session,
    /* unit_map, */
    /* get_slot, */
    /* session_unit, */
  /* end */
  mandatory_abstract_units,
  elective_abstract_units,
  maus,
  auus,
  equivalent_abstract_units,
  abstract_units_wo_units
PROPERTIES
  /* defined in helper.def */
  SHARED_PROPERTIES
  &
  abstract_units_wo_units = ABSTRACT_UNITS - dom(dom(abstract_unit_unit_semester))
  &
  /* maps from module id to the pair of abstract-unit and recommended semester */
  /* Note: Abstract Units without actual units are removed from this set */
  /* (m)odule -> (a)bstract_(u)nit -> (s)emester */
  maus = {d|#(a,b,c).(d = (a,(b,c)) & (a,b,c) : module_abstract_unit_semester
                                 & b /: abstract_units_wo_units)}
  &
  /* maps from abtract_unit id to the pair of unit and available semester */
  /* (a)bstract_(u)nit (u)nit (s)emester */
  auus = {d| #(a,b,c).(d = (a,(b,c)) & ((a,b),c): abstract_unit_unit_semester)}
  &
  /* set of pairs of abstract units that are composed of the same concrete
   * unit and semester pairs.
   * Abstract Units might be assigned to different semesters throuch their
   * modules
   */
  equivalent_abstract_units = {a,b| a : dom(auus) & b : dom(auus) &
                                    abstract_units(a)'idx < abstract_units(b)'idx &
                                    auus[{a}] = auus[{b}]
                                    }
  &
  /* set of all mandatory abstract units (that have actual units) */
  mandatory_abstract_units = {mm | mm : dom(abstract_units) & abstract_units(mm)'type = m} - abstract_units_wo_units
  &
  /* set of all elective abstract units (that have actual units) */
  elective_abstract_units = {mm | mm : dom(abstract_units) & abstract_units(mm)'type = e} - abstract_units_wo_units


DEFINITIONS
  "preferences.def";
  "LibraryIO.def";
  "LibraryMeta.def";
  "check_cs.def";
  //"helper.def";
  "external_functions.def";
  "assertions.def";
  BV(DD) == (DD --> BOOL);
   SET_PREF_TIME_OUT == 25000;


  G_CHECK_UNITS_WITH_IGNORED_SESSIONS(chosen_units, cSemesterChoice, local_slots, ignored_sessions, groupChoice) ==
    groupChoice : chosen_units --> dom({g, u | u : chosen_units & g : dom(units(u)'groups) })
    /* min_group..max_group  // TO DO: the range could be considerably reduced, based on the abstract units chosen, and thus the set of possible units that appear in the current solving process */
    &
    !(u).( u : chosen_units =>
      //CPRINTF("checking chosen_unit u=~w~n",u) &
      groupChoice(u) : unit_groups(u)
    )
  /*  & printf_nonvar("Setup group_choice: ~w~n",groupChoice) */
    &
    CHECK_CS(chosen_units, groupChoice, cSemesterChoice, local_slots, ignored_sessions);

  /*
   * Mixed mode checking helper
   * s1 <: UNITS
   * s2 <: UNITS
   * mixed <: UNITS
   * local_slots: mapping from SESSIONS to slots
   * ignored_sessions <: SESSIONS to be ignored in checks
   *
   * Globally check units in s1, s2 and mixed for conflicts
   *
   * Note:
   * Units in mixed are checked against all other units (s1, s2 and mixed)
   * Units in s1 and s2 are only checked against elements in the other sets
   */
  CHECK_UNITS_GLOBAL_WITH_IGNORED_SESSIONS(mixed, local_slots, ignored_sessions, groupChoice, cSemesterChoice) ==
      cSemesterChoice : mixed --> SEMESTERS
      &
      G_CHECK_UNITS_WITH_IGNORED_SESSIONS(mixed, cSemesterChoice, local_slots, ignored_sessions, groupChoice);
  SHARED_PROPERTIES ==
  unit_group = %(u, g). ( u: UNITS & g : dom(units(u)'groups) | units(u)'groups(g) )
  &
  /* sessions accessor as a proper B function so that we can compute image */
  get_sessions = %(r).(r:struct(half_semester:INTEGER, sessions:POW(SESSIONS)) | r'sessions)
  &
  /* compute all possible groups for a given unit */
  all_unit_groups = %un.(un:UNITS|ran(units(un)'groups))
  &
  /* compute all possible group ids a given unit */
  unit_groups = %un.(un:UNITS|dom(units(un)'groups))
  &
  /* compute all possible sessions-ids which a given unit may use : */
  unit_sessions = %(u).(u : UNITS |union(get_sessions[all_unit_groups(u)]))
  &
  /* map units to all it's sessions that are in a group with only one session */
  unit_group_single_session = %(u).(u : UNITS | union({s| s : get_sessions[all_unit_groups(u)] & card(s) = 1}))
  &
  unit_group_multiple_session = %(u).(u : UNITS | union({s| s : get_sessions[all_unit_groups(u)] & card(s) > 1}));




    /*
     * Third stage of validation, given a set of chosen abstract units check if
     * they are feasible, i.e. there are actual units in the chosen semesters
     * that are free of conflicits
     *
     * computed_abstract_units: Set of all abstract_unit, semester pairs chosen for validation
     * p_u_ids: Set of units available for validation (used to compute the UC of units)
     * semesterChoice: output variable assigned with the semester choice for each
     * abstract unit.
     * unitChoice: output variable assigned with pairs of chosen abstract and
     * actual units.
     * groupChoice: output variable assigned with the map from unit to chosen
     * group.
     */
    CHECK_ABSTRACT_UNIT_CHOICE(computed_abstract_units, p_u_ids, unitChoice, groupChoice) ==
      LET
        relevant_aus, au_all_units, rel_abstract_unit_unit_semester
      BE
        relevant_aus = dom(computed_abstract_units) // we haven't filtered for p_u_ids yet
        &
        au_all_units = dom(abstract_unit_unit_semester) |> p_u_ids // map au to relevant units; ignoring semeseter
        &
        /* restriction of abstract_unit_unit_semester triples to relevant triples for this validation : */
        rel_abstract_unit_unit_semester = {au, u, s|
              (au, u, s) : abstract_unit_unit_semester & u : p_u_ids & au : dom(computed_abstract_units) &
              (au, s) : computed_abstract_units
                                  }
      IN
      LET
        relevant_abstract_units
      BE
        relevant_abstract_units = dom(dom(rel_abstract_unit_unit_semester))
      IN
        // CPRINTF("relevant_aus ~w~n", relevant_aus) & 
        CPRINTF("rel_abstract_unit_unit_semester ~w~n", rel_abstract_unit_unit_semester) &
        CPRINTF("relevant_abstract_units ~w~n", relevant_abstract_units) &
        /* filter abstract units for those that have units in p_u_ids */
        relevant_abstract_unit_unit_semester : relevant_abstract_units --> (UNITS<->SEMESTERS) &
        !au.(au:relevant_abstract_units
         =>  relevant_abstract_unit_unit_semester(au) = 
               {un, sem| (au, un, sem) : rel_abstract_unit_unit_semester}
/*
                & printf("~nChecking au = ~w for un,sem relevant_abstract_unit_unit_semester~n~n",au) 
                & !(un,sem).(  // re-checking the condition of the set comprehension above; should not be required with new set-comprehension improvement in ProB kernel
                  (un,sem):relevant_abstract_unit_unit_semester(au)
                    => (au, un, sem) : abstract_unit_unit_semester &
                       sem : computed_abstract_units[{au}] &
                       un : p_u_ids
                    )
*/
            )
         & chosen_abstract_units = relevant_abstract_units // is this correct ?
        &
        CPRINTF("options (relevant_abstract_unit_unit_semester (au,u,s)): ~w~n", (card(relevant_abstract_unit_unit_semester),relevant_abstract_unit_unit_semester))
        &
        CPRINTF("Chosen abstract_units ~w~n", chosen_abstract_units)
        &
        //semesterChoice : chosen_abstract_units --> SEMESTERS
        //&
        unitChoice : chosen_abstract_units >-> p_u_ids
        &
        !(au).(au : chosen_abstract_units =>
          CPRINTF("Instantiating AU=~w~n",au) &
          //semesterChoice(au) : dom({s,usc| (au, usc, s) : relevant_abstract_unit_unit_semester})
          // cSemesterChoice(unitChoice(au)) : ran(relevant_abstract_unit_unit_semester(au)) // redundant ?
          // & CPRINTF("unitChoice(au) : ran(rel...) = ~w~n",(au,ran(relevant_abstract_unit_unit_semester(au))))
          //&
          //unitChoice(au) : dom({uuc,suc| (au, uuc, suc) : relevant_abstract_unit_unit_semester})
          // unitChoice(au) : dom(relevant_abstract_unit_unit_semester(au)) & // redundant ?
          unitChoice(au) : au_all_units[{au}]
          & CPRINTF("unitChoice(au) : au_all_units[{au}]: ~w~n",(au,au_all_units[{au}]))
          &
          (au,unitChoice(au),cSemesterChoice(unitChoice(au))) : rel_abstract_unit_unit_semester // this can use the new clpfd_table constraint mechanism of ProB
          // & (unitChoice(au), cSemesterChoice(unitChoice(au))) : relevant_abstract_unit_unit_semester(au)
          // & semesterChoice(au) = cSemesterChoice(unitChoice(au)) // doesn't this mean that the cSemesterChoice variable is now superfluous ?
         )
/*
        & !(au).(au : chosen_abstract_units =>
          CPRINTF("rauu inverse ~w ~n", relevant_abstract_unit_unit_semester(au)~)
          &
          !sem.(sem:1..6
            =>
            (sem = semesterChoice(au)
             => 
          // this constraint should be inferred from above; but is not ?
              CPRINTF("check unit for semester: ~w~n",(au,sem)) &
              unitChoice(au) : relevant_abstract_unit_unit_semester(au)~[{sem}]
            )
          )
          )
*/

        & !(au).(au : chosen_abstract_units =>
             !(au2).( (au2 :equivalent_abstract_units[{au}] &
                       computed_abstract_units[{au}] = computed_abstract_units[{au2}]) // units may be equivalent but by assigning them to different semesters, they no longer are
                 =>  ( au2 : chosen_abstract_units
                       =>  //units(unitChoice(au))'idx < units(unitChoice(au2))'idx
                           LESS(unitChoice(au),unitChoice(au2))
                           & CPRINTF("Symmetry-Breaking equivalent aus: ~w~n",(au,au2))
                           //& CPRINTF("Symmetry-Breaking equivalent au unitChoice: ~w~n",(au,au2,unitChoice(au),unitChoice(au2)))
                     ))
                )

        &
        chosen_units = ran(unitChoice)
        &
        chosen_units <: p_u_ids
        // & card(chosen_units) = card(chosen_abstract_units)  // slows down solving??
        /* & observe(chosen_units) */
        &
        /* concrete semester choice, maps for the actual unit to the chosen semester */
        /* used to check if two units can interfere */
        cSemesterChoice : chosen_units --> SEMESTERS &
        LET possible_unit_semesters, possible_semester_units BE
           possible_unit_semesters = %u.(u:p_u_ids|union(ran(relevant_abstract_unit_unit_semester))[{u}]) &
           possible_semester_units = %s.(s:SEMESTERS|union(ran(relevant_abstract_unit_unit_semester))~[{s}])
            IN
           // this check also triggers when unit is chosen but not yet mapped to abstract unit
           CPRINTF("Possible semesters for units: ~w~n",possible_unit_semesters) &
           CPRINTF("Possible units for semesters: ~w~n",possible_semester_units) &
          !(u,s).((u,s):cSemesterChoice => s : possible_unit_semesters(u) & 
                                           u : possible_semester_units(s) &
                                           (unitChoice~(u),u,s) : rel_abstract_unit_unit_semester )
        END
        &
        //cSemesterChoice = %x.(x:chosen_units|semesterChoice(unitChoice~(x))) // as unitChoice is an injection; we can simply invert the function to compute the correct semester
        //&
        // cSemesterChoice = dom({uc,sc,au| (au, uc) : unitChoice & (au, sc) : semesterChoice})
        // &
        // the following propagates much better:
        //!(uc,sc).( (uc,sc): cSemesterChoice  => #au3.((au3, uc) : unitChoice & (au3, sc) : semesterChoice))
        //&
        CPRINTF("uc, ssc ~w~n", (unitChoice, cSemesterChoice))
        &
        ASSERT_TRUE(bool(chosen_units= dom(cSemesterChoice)), "chosen_units = dom(cSemesterChoice)")
        &
        CPRINTF("~nChosen units ~w~n", chosen_units)
        &
        CHECK_UNITS_GLOBAL_WITH_IGNORED_SESSIONS(chosen_units,
                                                   slots, // XXX use local_slots which are a param
                                                   {}, //XXX use ignored_sessions,
                                                   groupChoice,
                                                   cSemesterChoice)
      /* ) */
      END // LET
  END; // LET



    /*
     * Second stage of validation, takes a set of chosen modules and a set of
     * available abstract units to validate their feasibility
     *
     * module_ids: Set of module IDs of those modules selected for validation
     * au_ids: Abstract Unit IDs available for validation (used to restrict the set of abstract units when computing an UC)
     * semesterChoice: output variable assigned with the semester choice for each
     * abstract unit.
     * unitChoice: output variable assigned with pairs of chosen abstract and
     * actual units.
     * groupChoice: output variable assigned with the map from unit to chosen
     * group.
     */
    CHECK_MODULE_CHOICE(module_ids, au_ids, unitChoice, groupChoice,relevantUNITS) ==
     (
      /* & */
      /* mms : POW(dom(modules)) */
      /*
       * filter module, abstract_units, semester mapping set with regard to the selected modules
       */
      CPRINTF("module_ids ~w~n", module_ids) // & CHECK_DET(module_ids)
      &
      restricted_maus = %(mm).(mm : module_ids | au_ids <| maus[{mm}])
      &
      CPRINTF("Restricted maus ~w~n", restricted_maus) // & CHECK_DET(restricted_maus)
      &
      /*
       * filter abstract units by those available for validation
       */
      restricted_mandatory_abstract_units = au_ids /\ mandatory_abstract_units
      &
      restricted_elective_abstract_units = au_ids /\ elective_abstract_units
      &
      /*
       * Helper relation to select elective units for each chosen module
       * maps each module to pais of abstract_unit ID and a possible semester when to attend the unit
       */
      possible_elective_units = {mm, ausem|
        mm : module_ids & ausem : restricted_maus(mm)
        &
        #(au, sem).(
          (au, sem) = ausem
          &
          au : restricted_elective_abstract_units
        )
      }
      &
      CPRINTF("Possible possible_elective_units: ~w~n", possible_elective_units) //& CHECK_DET(possible_elective_units)
      &
      mandatory_helper : module_ids --> POW(ABSTRACT_UNITS * SEMESTERS)
      &
      elective_helper : module_ids --> POW(ABSTRACT_UNITS * SEMESTERS)
      &
      /*
       * Helper relation to select mandatory units for each chosen module
       * maps each module to pairs of abstract_unit ID and a possible semester when to attend the unit
       */
      !(mm).( mm : module_ids =>
        mandatory_helper(mm) = {au, sem|
                                  (au, sem) : restricted_maus(mm)
                                  &
                                  au : restricted_mandatory_abstract_units
                                }
        &
        /* elective unit choice using helper relation
         * for each module we choose a subset of the units available in
         * possible_elective_units such that the number of chosen units in each
         * module is the minimun of either the required or the available units
         * in that module.
         */
        /* replaced this by an IF-THEN-ELSE
           card(elective_helper(mm)) = min({
                                  card(dom(possible_elective_units[{mm}])),
                                  modules(mm)'elective_units})
        &
         elective_helper(mm) <: possible_elective_units[{mm}] &
        */
        LET pp_mm BE pp_mm = possible_elective_units[{mm}]
        IN
         LET nr_el_units, max_units
         BE nr_el_units = card(dom(pp_mm)) &
            max_units = modules(mm)'elective_units
         IN
          IF nr_el_units <= max_units THEN
            // printf("~ntotal function : ~w~n~n",(mm, max_units)) &
            elective_helper(mm) : dom(pp_mm) --> ran(pp_mm) // we must choose all elective units for mm; help ProB set up a total function skeleton
            & elective_helper(mm) <: pp_mm
            & card(elective_helper(mm)) = nr_el_units
          ELSE
            elective_helper(mm) : dom(pp_mm) +-> ran(pp_mm)
            & elective_helper(mm) <: pp_mm
            & card(elective_helper(mm)) = max_units
          END // IF
         END // LET
        END // LET
      )
      &
      CPRINTF("Mandatory_helper: ~w~n", mandatory_helper)
      &
      CPRINTF("Elective_helper: ~w~n", elective_helper)
      &
      LET computed_abstract_units
          //, mandatory_abstract_units
      BE
        // mandatory_abstract_units = union(mandatory_helper[module_ids]) &
         computed_abstract_units = union(ran(elective_helper) \/ ran(mandatory_helper))
      IN
      /* TODO: Ensure units are only chosen once [DONE  with injection ?] */
         CPRINTF("computed_abstract_units: ~w~n", computed_abstract_units) &
         // CPRINTF("mandatory_abstract_units: ~w~n", mandatory_abstract_units) &
         CHECK_ABSTRACT_UNIT_CHOICE(computed_abstract_units, relevantUNITS /* XXX choose a smaller set ? */,
                                    unitChoice, groupChoice)
      END // LET
    ); // CHECK_MODULE_CHOICE

  /*
   * CHECK
   *
   * ccs: set of course_names to check (e.g. {"bsc-bio-N-2015"})
   * courseModuleChoice: output variable assigned with the choice of modules
   * for each course in ccs.
   * semesterChoice: output variable assigned with the semester choice for each
   * abstract unit.
   * unitChoice: output variable assigned with pairs of chosen abstract and
   * actual units.
   * groupChoice: output variable assigned with the map from unit to chosen
   * group.
   */
  CHECK(ccs, courseModuleChoice, unitChoice, groupChoice) ==
     CHECK_wr(ccs, courseModuleChoice, unitChoice, groupChoice,{},ABSTRACT_UNITS,UNITS);
  // CHECK_wr : with restrictions
  // below we can use excludedModules to narrow down problems and compute the unsat module core
  // we can also select a subset of abstract units restrictedAUs
  CHECK_wr(ccs, courseModuleChoice, unitChoice, groupChoice,excludedModules,restrictedAUs,relevantUNITS) == (
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
      /*
       * pick one of the precomputed module combinations sets for each course in ccs
       */
      !(course).(course : ccs =>
        LET cmc_c BE cmc_c = dom({cr,c| c: course_module_combinations(course) & cr= c  \ excludedModules}) IN
          courseModuleChoice(course) : cmc_c &
          CPRINTF("~ncourse_module_combinations for course = ~w~n",(course,cmc_c)) &
          LET mand BE mand = inter(cmc_c) IN
            mand <: courseModuleChoice(course) // inter contains those courses that are mandatory
            & CPRINTF("mandatory courses = ~w~n~n",mand)
            // & mand <: mms // seems to slow down solving
          END
        END
      )
      &
      /* CPRINTF("Module Choice: ~w~n", courseModuleChoice) */
      /* & */
      mms = union(ran(courseModuleChoice))
      &
      CHECK_MODULE_CHOICE(mms, restrictedAUs, unitChoice, groupChoice,relevantUNITS)
    );

ASSERTIONS
  ASSERTION1;

  ASSERTION2;

  REQ_course_module_combinations;

  REQ_courses_name;

  REQ_UNIQUE_courses_idx;

  REQ_UNIQUE_modules_idx;

  REQ_credit_points_consistent;

  REQ_groups_do_not_share_units;

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
    END;
  /* global */
  sc, gc, mc, uc <-- check(ccss) =
    ANY
      courseModuleChoice, groupChoice, cSemesterChoice, unitChoice,
      /* variables used in defintion */
      mms, mandatory_helper, possible_elective_units, elective_helper,
      /* module_units_helper, */
      chosen_abstract_units, chosen_units,
      restricted_maus, restricted_elective_abstract_units,
      restricted_mandatory_abstract_units,
      relevant_abstract_unit_unit_semester

    WHERE
      card(ccss) <= 2
      &
      ccss : POW1(course_names)
      &
      ccss <: dom(course_module_combinations)
      &
      CHECK(ccss, courseModuleChoice, unitChoice, groupChoice)
    THEN
      gc, mc, uc := groupChoice, courseModuleChoice, unitChoice ||
      sc := %x.(x:chosen_abstract_units|cSemesterChoice(unitChoice(x)))
    END
    /* ; */

  /* sc, gc, mc, uc <-- partial_check(units, modules) = */
    /* PRE */
    /* THEN */
    /*   gc, sc, mc, uc := Solver.check({}, xx, yy, xx, xx) */
    /* END */
END
