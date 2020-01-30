MACHINE NewSolver_v2
SEES data
CONSTANTS
  level_available_modules
PROPERTIES
  // Map from all reachable levels to the modules available at that level
  /* level_available_modules : LEVELS --> POW(dom(modules)) */
  /* & */
  level_available_modules = dom(dom(dom({idx, mms, tt, ll|
    tt : ran(course_levels) & ll : dom(tt)
    &
    idx = tt(ll)'idx
    &
    mms = level_modules[dom({x,y| y : ran(prefix(subtree(tt, ll))) & x = y'idx})]
  })))

DEFINITIONS
  "LibraryIO.def";
  CHOOSE_MODULES(course, return_value) == (
    course : course_names
    &
    #(mm, trees, choice).(
      mm = course_modules(course)
      &
      trees = course_levels[{course}]
      /* we are looking for a subset of all modules for the given course */
      /* the selection of modules must satisfy the tree-conditions for all trees in that course */
      &
      printf("course modules = ~w~n",mm)
      &
      /* return value is the set of all modules for the given course, according to the choice function */
      return_value <: mm
      &
      return_value = union(ran(choice))
      &
      choice : trees --> POW(mm)
      &
      printf("return value = ~w~n", return_value)
      &
      !(tt).(tt : trees =>
        choice(tt) <: level_available_modules(top(tt)'idx)
        &
        !(level_info).(level_info : ran(postfix(tt)) =>
          #(llmm, cc).(
            /* level_info = tt(node) */
            /* & */
            llmm = level_available_modules(level_info'idx)
            &
            cc = choice(tt)
            &
            card({y|y : cc & y : llmm}) : level_info'from .. level_info'to
          )
        )
      )
    )
  )
END
