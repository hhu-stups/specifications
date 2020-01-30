MACHINE NewSolver
SEES data
CONSTANTS
  level_available_modules
PROPERTIES
  // Map from all reachable levels to the modules available at that level
  /* level_available_modules : LEVELS --> POW(dom(modules)) */
  /* & */
  level_available_modules = {(idx, mms)|#(course, tt, ll).(
    (course, tt) : course_levels & ll : dom(tt)
    &
    idx = tt(ll)'idx
    &
    mms = level_modules[{x| #(y).(y : ran(subtree(tt, ll)) & x = y'idx)}]
  )}

DEFINITIONS
  "LibraryIO.def";
  CHOOSE_MODULES(course, return_value) == (
    course : course_names
    &
    #(mm, trees/*, choice */).(
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
      /* return_value = union({mms | */
      /*   #(tt).(tt : trees & */
      /*     card(mms) = 7 */
      /*     & */
      /*     mms <: level_available_modules(top(tt)'idx) */
      /*     & */
      /*     !(level_info).(level_info : ran(postfix(tt)) => */
      /*       #(llmm/1*, cc*1/).( */
      /*         llmm = level_available_modules(level_info'idx) */
      /*         & */
      /*         card({y|y : mms & y : llmm}) : level_info'from .. level_info'to */
      /*       ) */
      /*     ) */
      /*   ) */
      /* }) */
      return_value = union(ran(choice))
      &
      choice : trees --> POW(mm)
      &
      printf("return value = ~w~n", return_value)
      &
      !(tt).(tt : trees =>
        choice(tt) <: level_available_modules(top(tt)'idx)
        &
        card(choice(tt)) : top(tt)'from .. top(tt)'to
        &
        printf("choice(tt) = ~w~n", choice(tt))
        &
        !(level_info).(level_info : ran(postfix(tt)) =>
          #(llmm).(
            /* level_info = tt(node) */
            /* & */
            llmm = level_available_modules(level_info'idx)
            &
            card({y|y : choice(tt) & y : llmm}) : level_info'from .. level_info'to
          )
        )
      )
    )
  )
END
