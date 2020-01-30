MACHINE SlotSolver
/* SlotTool Solving Machine for Phil. Fak. */
/* requires data.mch Data machine (can be generated using Makefile) */
DEFINITIONS
  "LibraryIO.def";
  SEMESTERS == 1..6;
  CHECK_CS(conflict_set, kf, ef, GroupChoice, TimeTable, course_module_group_units, local_slot) ==
  !(m1,m2).( (m1,m2) : conflict_set =>
    (
      /* all combinations with no alternatives */
      #(g1).( g1 = GroupChoice((kf, ef), (kf, m1))
        &
        #(g2).( g2 = GroupChoice((kf, ef), (ef, m2))
          &
          (
            (g1 = 0 & g2 = 0 & /*  alternatives in both */
              #(u1, u2). (u1 : course_module_group_units[{(kf, m1, g1)}] & u1 : kf_units
                        & u2 : course_module_group_units[{(ef, m2, g2)}] & u2 : ef_units
                        & TimeTable(local_slot(u1)) = u1
                        & TimeTable(local_slot(u2)) = u2
              )
            )
            or
            (g1 > 0 & g2 = 0 & /*  alternatives in EF */
              !(u1). (u1: course_module_group_units[{(kf, m1, g1)}] & u1 : kf_units
                =>
                TimeTable(local_slot(u1)) = u1
                &
                /* there must be one viable alternative */
                #(u2).(u2: course_module_group_units[{(ef, m2, g2)}] & u2 : ef_units
                        & TimeTable(local_slot(u2)) = u2
                )
              )
            )
            or
            (g1 = 0 & g2 > 0 & /*  alternatives in KF */
              !(u2). (u2: course_module_group_units[{(ef, m2, g2)}] & u2:ef_units
                =>
                TimeTable(local_slot(u2)) = u2
                &
                /* there must be one viable alternative */
                #(u1).(u1: course_module_group_units[{(kf, m1, g1)}] & u1 : kf_units
                        & TimeTable(local_slot(u1)) = u1
                )
              )
            )
            or
            (g1 > 0 & g2 > 0 & /* all combinations with no alternatives */
              !(u1,u2). (u1: course_module_group_units[{(kf, m1, g1)}] & u1 : kf_units
                       & u2: course_module_group_units[{(ef, m2, g2)}] & u2 : ef_units
                =>
                        TimeTable(local_slot(u1)) = u1
                        & TimeTable(local_slot(u2)) = u2
                )
            )
          ) /* or block */
        ) /* # g2 */
      ) /* # g1 */
    )
  )
  & printf("GroupChoice ~w~n", GroupChoice)
  & printf("CS ~w~n", conflict_set)
  & printf("TimeTable ~w~n", TimeTable);

  SETUP(kf, ef, cur_semester, slot_config) ==
    kf : KF & ef : EF & (kf |->ef) : KF_EF_Combinations & cur_semester : SEMESTERS &
    local_slot=slot_config &
    /* In this context we are only interested in kf and ef */
    local_courses = {kf, ef} /* or COURSES */
    & Units = semester~[{cur_semester}] /\ course~[local_courses]
    /* mapping COURSES to its Units: for current semester*/
    & course_units = local_courses<|SemesterCourseUnits[{cur_semester}]
    /* mapping COURSES to its Modules for current semester */
    & course_modules = local_courses<|SemesterCourseModules[{cur_semester}]
    & kf_course_modules = {kf}<|SemesterKFCourseModules[{cur_semester}]
    & ef_course_modules = {ef}<|SemesterEFCourseModules[{cur_semester}]
    /* mapping course and modules to min and max group */
    & course_module_group_units = {c,m,g,u| (c,m,g,u) : SemesterCourseModuleGroupUnits[{cur_semester}]}
    /* XXX refactor */
    & course_module_min_group = {c,m,g | (c,m) : course_modules & course_units[{c}] /\ module~[{m}] /= {} & g = min(group[course_units[{c}] /\ module~[{m}]])}
    & course_module_max_group = {c,m,g | (c,m) : course_modules & course_units[{c}] /\ module~[{m}] /= {} & g = max(group[course_units[{c}] /\ module~[{m}]])}
    /* The time table: assignment of modules to time slots */
    &
    /* given kf,ef: for which modules do we have to make choices */
    choice_modules = {(kf,ef)} <| SemesterChoiceModules[{cur_semester}]
  ;

  CHECK_WITH_SLOTS(kf, ef, cur_semester, slot_config) == #(Units, course_units,
    course_modules, kf_course_modules, ef_course_modules,
    course_module_max_group, course_module_min_group,
    course_module_group_units, local_courses, choice_modules, GroupChoice,
    local_slot, cs, TimeTable).(
    SETUP(kf, ef, cur_semester, slot_config)
    & /* given a particular allowed KF,EF combination : find a choice for the groups */
    GroupChoice : choice_modules --> INTEGER
    &
    /* Group 0 works a bit differently */
    !(ikf,ief,md).( (ikf,ief,md):choice_modules
       =>
         (GroupChoice((ikf,ief,md)) >= course_module_min_group(md) &
          GroupChoice((ikf,ief,md)) <= course_module_max_group(md) )
    )
    & /* within a course/module and group: there should be no conflicts */
    !(c, m, g).(
      (c,m,g) : dom(course_module_group_units)
      /* groups marked with 0 are alternatives, so they could be at the same time */
      & g > 0 => card(course_module_group_units[{(c,m,g)}]) = card(local_slot[course_module_group_units[{(c,m,g)}]])
    )
    &
    cs = {(m1,m2) | m1 : kf_course_modules[{kf}] & m2 : ef_course_modules[{ef}]}
    &
    TimeTable <: local_slot~|>Units /*slot[] >-> ran(course_units)*/
    &
    TimeTable : local_slot[Units] >+> Units
    &
    CHECK_CS(cs, kf, ef, GroupChoice, TimeTable, course_module_group_units, local_slot)
  );

  CHECK(kf, ef, cur_semester) == CHECK_WITH_SLOTS(kf, ef, cur_semester, slot);

  COMPUTE_ALTERNATIVES(idx, relevant_mappings) == {x| x : SLOTS \ {unknown, slot(idx)} &
    #(sem, sl2).(
      sem = semester(idx) &
      sl2 = slot <+ {(idx, x)} &
      !(a,b).((a,b) : relevant_mappings => CHECK_WITH_SLOTS(a,b,sem,sl2))
    )
  };

  /*
   * ALTERNATIVES(idx)
   * Compute alternative slots for the slot/session identified by idx
   * Generates a set of globally valid alternatives
   * Genrated set is empty, if there is a conflict with one the course combinations valid for course(idx)
   */
  ALTERNATIVES(idx) == COMPUTE_ALTERNATIVES(idx, {(kf,ef)|(kf,ef) : KF_EF_Combinations & course(idx) : {kf, ef}});
  /*
   * LOCAL_ALTERNATIVES(idx, cc)
   * Compute alternative slots for the slot/session identified by idx relative to the slots/sessions of course cc
   * Generates a set of locally valid alternatives with regard to course cc
   */
  LOCAL_ALTERNATIVES(idx, cc) == COMPUTE_ALTERNATIVES(idx, {(kf,ef)|(kf,ef) : KF_EF_Combinations & (kf : {course(idx), cc} & ef : {course(idx), cc})});
SEES
  base, data
CONSTANTS
  SemesterCourseUnits, SemesterCourseModules, SemesterKFCourseModules, SemesterEFCourseModules, SemesterCourseModuleGroupUnits, SemesterChoiceModules
PROPERTIES
  /* Move to variables */
  SemesterCourseUnits = {s,cu|#(c,u).(c : COURSES & s : SEMESTERS & u : semester~[{s}] /\ course~[{c}] & cu = (c|->u))} &
  SemesterCourseModules = {s,cm |#(c,m).(c : COURSES & s : SEMESTERS & m : module[SemesterCourseUnits[{s}][{c}]] & cm = (c,m))} &
  SemesterKFCourseModules = {s, cm | s : SEMESTERS & #(c,m).(cm = (c,m) & c : COURSES & m : module[course~[{c}] /\ semester~[{s}] /\ kf_units])} &
  SemesterEFCourseModules = {s, cm | s : SEMESTERS & #(c,m).(cm = (c,m) & c : COURSES & m : module[course~[{c}] /\ semester~[{s}] /\ ef_units])} &
  SemesterCourseModuleGroupUnits = {s, cmgu| s : SEMESTERS & #(c,m,g,u).(cmgu = (c,m,g,u) & (c,m) : SemesterCourseModules[{s}] & u : (module~[{m}] /\ course~[{c}] /\ semester~[{s}]) & g = group(u))} &
  SemesterChoiceModules = {s, scm| #(kf, ef, md).(scm = (kf,ef,md) & (kf|->ef) : KF_EF_Combinations & s : SEMESTERS & md : {kf,ef}<|SemesterCourseModules[{s}])}
END
