MACHINE NewSolver_v2
SEES data
DEFINITIONS
  "LibraryIO.def";
  myprintf(s,x) == printf(s,[x]);
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
      chosen : trees --> POW(INTEGER) // POW(mm)
      &
      myprintf("course modules = ~w~n",mm)
      &
      /* return value is the set of all modules for the given course, according to the choice function */
      return_value = union(ran(chosen))
      &
      myprintf("chosen = ~w~n", chosen) &
      myprintf("return value = ~w~n", return_value)
      &
      !(tt).(tt : trees =>
        #(choice, leaves, root, COURSE_LEVEL_IDS).(
          root = top(tt)'idx
          &
          myprintf("Root ~w~n", root)
          &
          /* get the precoumpted leaves for this course and level pair */
          leaves = course_tree_leaves(course, root)
          &
          myprintf("Leaves ~w~n", leaves)
          &
          /* XXX extract to a helper */
          /* Level IDs for all nodes in the current tree */
          COURSE_LEVEL_IDS = {y| #(x).(x : ran(tt) & y = x'idx)}
          &
          myprintf("COURSE_LEVEL_IDS ~w~n", COURSE_LEVEL_IDS)
          &
          /* The choice of modules at each level is represent by a function
           * that maps from the level ID to the set of modules selected at that
           * node
           * That is in leaf nodes a subset of the modules associated with that node
           * In an inner node the union of the modules selected in all subtrees of that node 
           *
           * At each node the cardinatlty of the set of modules must be in the range from..to
           */

          choice : COURSE_LEVEL_IDS --> POW(mm)
          &
          myprintf("choice ~w~n", choice)
          &
          /* for all leaves the choice is a subset of the modules associated to
           * that leaf; the cardinality of the subset is in the range from..to
           */
          !(n).(n : leaves =>
            #(s).(
              s = choice(tt(n)'idx)
              &
              myprintf("process leaf: ~w~n",(n,tt(n)'idx,tt(n)'from,tt(n)'to))
              &
              s <: level_modules[{tt(n)'idx}]
              &
              card(s) >= tt(n)'from
              &
              card(s) <= tt(n)'to
            )
            /* card(choice(tt(n)'idx)) >= tt(n)'from */
            /* & */
            /* card(choice(tt(n)'idx)) <= tt(n)'to */
            /* & */
            /* choice(tt(n)'idx) <: level_modules[{tt(n)'idx}] */ 
            &
            (tt(n)'idx = 19 => myprintf("Choice(19) ~w~n", choice(19)))
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
              myprintf("process node: ~w~n",(n,tt(n)'idx,tt(n)'from,tt(n)'to))
              &
              s = union(choice[child_nodes])
              &
              card(s) >= tt(n)'from
              &
              card(s) <= tt(n)'to
              &
              choice(tt(n)'idx) = s
              /* card(choice(tt(n)'idx)) >= tt(n)'from */
              /* & */
              /* card(choice(tt(n)'idx)) <= tt(n)'to */
              /* & */
              /* choice(tt(n)'idx) = union(choice[child_nodes]) */
            )
          )
          &
          /* the selection for a tree is the set of modules selected for the root node */
          chosen(tt) = union(ran(choice)) 
          &
          myprintf("selection ~w~n", chosen(tt)) 
          /* & chosen(tt) = {3,5,7,8} */
        )
    )
    )
  );
END

/*

>>> course_levels[{"bk-phi-H-2013"}]
Expression Value = 
{{([]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}}

>>> course_modules("bk-phi-H-2013")
Expression Value = 
{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}

>>> CHOOSE_MODULES("bk-phi-H-2013", solution) 




*/