MACHINE NewSolver_v3_complex
SEES data_complex
DEFINITIONS
  "LibraryIO.def";
  CHOOSE_MODULES(course, return_value) == (
    course : course_names
    &
    #(mm, trees).(
      mm = course_modules(course)
      &
      trees = course_levels[{course}]
      &
      /* we are looking for a subset of all modules for the given course */
      /* the selection of modules must satisfy the tree-conditions for all trees in that course */

      /* chosen maps each tree to the modules chosen for that tree */
      chosen : trees --> POW(INTEGER) // POW(INTEGER) will avoid enumeration of chosen; POW(mm) may enumerate
      &
      choice : trees --> (INTEGER <-> POW(INTEGER))  // we model choice as a global function in v3 rather than an existential variable
      &
      printf("course modules = ~w~n",mm)
      &
      /* return value is the set of all modules for the given course, according to the choice function */
      return_value = union(ran(chosen))
      &
      printf("chosen = ~w~n", chosen) &
      printf("return value = ~w~n", return_value)
      &
      !(tt).(tt : trees =>
        #(leaves, root, COURSE_LEVEL_IDS).(
          root = top(tt)'idx
          &
          printf("Root ~w~n", root)
          &
          /* get the precoumpted leaves for this course and level pair */
          leaves = course_tree_leaves(course, root)
          &
          printf("Leaves ~w~n", leaves)
          &
          /* XXX extract to a helper */
          /* Level IDs for all nodes in the current tree */
          COURSE_LEVEL_IDS = {y| #(x).(x : ran(tt) & y = x'idx)}
          &
          printf("COURSE_LEVEL_IDS ~w~n", COURSE_LEVEL_IDS)
          &
          /* The choice of modules at each level is represent by a function
           * that maps from the level ID to the set of modules selected at that
           * node
           * That is in leaf nodes a subset of the modules associated with that node
           * In an inner node the union of the modules selected in all subtrees of that node 
           *
           * At each node the cardinatlty of the set of modules must be in the range from..to
           */

          choice(tt) : COURSE_LEVEL_IDS --> POW(mm)
          &
          printf("choice(tt) ~w~n", choice(tt))
          &
          /* for all leaves the choice is a subset of the modules associated to
           * that leaf; the cardinality of the subset is in the range from..to
           */
          !(n).(n : leaves =>
            #(s).(
              s = choice(tt)(tt(n)'idx)
              &
              printf("process leaf: ~w~n",(n,tt(n)'idx,tt(n)'from,tt(n)'to))
              &
              s <: level_modules[{tt(n)'idx}]
              &
              card(s) >= tt(n)'from
              &
              card(s) <= tt(n)'to
            )
          )
          &
          /* for all inner nodes the choice is the union of the choices in the
           * subtrees
           */
          !(n).(n : dom(tt) - leaves =>
            #(child_nodes, s).(
              /* XXX move into a function? */
              child_nodes = {idx | #(xx, yy).(xx : ran(sons(subtree(tt, n))) & yy = top(xx) & idx = yy'idx)}
              &
              printf("process node: ~w~n",(n,tt(n)'idx,tt(n)'from,tt(n)'to))
              &
              s = union(choice(tt)[child_nodes])
              &
              card(s) >= tt(n)'from
              &
              card(s) <= tt(n)'to
              &
              choice(tt)(tt(n)'idx) = s
            )
          )
          &
          /* the selection for a tree is the set of modules selected for the root node */
          chosen(tt) = union(ran(choice(tt))) 
          &
          printf("selection ~w~n", chosen(tt)) 
          /* & chosen(tt) = {3,5,7,8} */
        )
    )
    )
  );
END

/*

>>> CHOOSE_MODULES("bk-phi-H-2013", solution) 





*/