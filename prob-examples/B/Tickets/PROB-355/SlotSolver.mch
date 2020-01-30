MACHINE SlotSolver
/* SlotTool Solving Machine for Phil. Fak. */
/* requires data.mch Data machine (can be generated using Makefile) */

/* See doc/vocabulary.md for vocabulary definitions */
SEES
  base, data
DEFINITIONS
  "LibraryIO.def";
  "check_cs.def";
  SEMESTERS == 1..6;

  SETUP_LET(kf, ef, cur_semester) ==
    kf : KF & ef : EF & (kf |->ef) : KF_EF_Combinations & cur_semester : SEMESTERS
    /* In this context we are only interested in kf and ef */
    &
    /* XXX extract to functions */
    Units = mapping[{(kf, cur_semester, T_KF)}] \/ mapping[{(ef, cur_semester, T_EF)}]
    /* mapping course and modules to min and max group */
    &
    unit_min_group = { u,g | u : Units & g = min(dom(units(u)'groups))}
    &
    unit_max_group = { u,g | u : Units & g = max(dom(units(u)'groups))}
    &
    cs = mapping[{(kf, cur_semester, T_KF)}] * mapping[{(ef, cur_semester, T_EF)}]
  ;

   DEBUG == (printf("Units = ~w~n",[Units]) &
             printf("unit_min_group = ~w~n",[unit_min_group]) &
             printf("unit_max_group = ~w~n",[unit_max_group]) &
             printf("cs = ~w~n",[cs]) );

  /*
   * kf : Kernfach
   * ef : Ergänzungsfach
   * cur_semester : SEMESTER to check
   * local_sessions : function mapping session ids to session information
   */
  CHECK_WITH_SESSIONS(kf, ef, cur_semester, local_sessions) ==
   # /* LET */ (Units, unit_max_group, unit_min_group, cs).
    (SETUP_LET(kf, ef, cur_semester) & DEBUG
    &
    #(GroupChoice, SemesterChoice).(
       /* given a particular allowed KF,EF combination : find a choice for the groups */
      GroupChoice : Units --> INTEGER
      &
      !(u).( u : Units
         =>
         GroupChoice(u) : unit_min_group(u)..unit_max_group(u)
      )
      & /* within a course/module and group: there should be no conflicts */
        /* Menge an Veranstaltungen = Menge an Slots */
      !(u, g).(u : units[Units] & g : ran(u'groups) =>
        card(g'sessions)= card({s| #(q).(q :sessions[g'sessions] & s = q'slot)})
      )
      &
      SemesterChoice = Units*{cur_semester}
      &
      CHECK_CS(cs, GroupChoice, SemesterChoice, local_sessions)
    )
    );

  CHECK(kf, ef, cur_semester) == CHECK_WITH_SESSIONS(kf, ef, cur_semester, sessions);

  COMPUTE_ALTERNATIVES(idx, relevant_mappings) == {x| x : SLOTS \ {unknown, sessions(idx)'slot} &
    #(sem, current_session, alt_sessions).(
      sem : session_semester(idx) &
      current_session = sessions(idx) &
      alt_sessions = sessions <+ {(idx, rec(slot:x, rhythm:0, duration:2))} &
      !(kf, ef).((kf, ef) : relevant_mappings => CHECK_WITH_SESSIONS(kf, ef, sem, alt_sessions))
    )
  };

  /*
   * ALTERNATIVES(idx)
   * Compute alternative slots for the slot/session identified by idx
   * Generates a set of globally valid alternatives
   * Genrated set is empty, if there is a conflict with one the course combinations valid for course(idx)
   */
   ALTERNATIVES(idx) == COMPUTE_ALTERNATIVES(idx,  { kf,ef |(kf,ef) : KF_EF_Combinations & session_course(idx) : {kf, ef}});
  /*
   * LOCAL_ALTERNATIVES(idx, cc)
   * Compute alternative slots for the slot/session identified by idx relative to the slots/sessions of course cc
   * Generates a set of locally valid alternatives with regard to course cc
   */
   LOCAL_ALTERNATIVES(idx, cc) == COMPUTE_ALTERNATIVES(idx, { kf,ef |(kf,ef) : KF_EF_Combinations & (kf : {session_course(idx), cc} & ef : {session_course(idx), cc})});
END
