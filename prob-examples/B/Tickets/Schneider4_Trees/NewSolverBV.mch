MACHINE NewSolverBV /* A Bit-Vector Version of NewSolver */
/* The query >>> CHOOSE_MODULES("bk-phi-H-2013",xxx) works with this model (0.5 secs)
dom({xxx,choice|CHOOSE_MODULES("bk-phi-H-2013",xxx)}) about 30 secs for 92 solutions
*/
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
  BV(DD) == (DD --> BOOL);
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
      return_value = UNION(ttu).(ttu:trees| choice(ttu)~[{TRUE}])
      &
      choice : trees --> BV(mm)
      &
      printf("return value = ~w~n", return_value)
      &
      !(tt).(tt : trees =>
        #lam.(lam = level_available_modules(top(tt)'idx) &
        /* choice(tt)~[{TRUE}] <: lam & */
        !dd.(dd:mm \ lam => choice(tt)(dd)=FALSE)
        &
        card({dd|dd:lam & dd|->TRUE:choice(tt)}) : top(tt)'from .. top(tt)'to
        &
        printf("choice(tt) = ~w~n", choice(tt))
        &
        !(level_info).(level_info : ran(tt) =>
          #(llmm).(
            /* level_info = tt(node) */
            /* & */
            llmm = level_available_modules(level_info'idx)
            &
            card({y| y: mm & y|->TRUE : choice(tt) & y : llmm}) : level_info'from .. level_info'to
          )
        )
        )
      )
    )
  )
END

/*
>>> CHOOSE_MODULES("bk-phi-H-2013",xxx)
return value = {2,4,6,7,8,9,10}
choice(tt) = {(1|->FALSE),(2|->TRUE),(3|->FALSE),(4|->TRUE),(5|->FALSE),(6|->TRUE),(7|->TRUE),(8|->TRUE),(9|->TRUE),(10|->TRUE),(11|->FALSE),(12|->FALSE),(13|->FALSE),(14|->FALSE),(15|->FALSE),(16|->FALSE),(17|->FALSE),(18|->FALSE),(19|->FALSE),(20|->FALSE),(21|->FALSE),(22|->FALSE),(23|->FALSE)}
Existentially Quantified Predicate over xxx,choice,mm,trees is TRUE
Solution: 
       xxx = {2,4,6,7,8,9,10} &
       choice = {({([]|->rec(art:"null",from:7,idx:13,name:"Basismodule",tm:"null",to:7)),([1]|->rec(art:"null",from:1,idx:14,name:"Basispflichtmodule",tm:"null",to:2)),([1,1]|->rec(art:"null",from:1,idx:15,name:"Philosophische Propädeutik",tm:"null",to:2)),([2]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([2,1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([2,2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([2,3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}|->[FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE])} &
       mm = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23} &
       trees = {{([]|->rec(art:"null",from:7,idx:13,name:"Basismodule",tm:"null",to:7)),([1]|->rec(art:"null",from:1,idx:14,name:"Basispflichtmodule",tm:"null",to:2)),([1,1]|->rec(art:"null",from:1,idx:15,name:"Philosophische Propädeutik",tm:"null",to:2)),([2]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([2,1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([2,2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([2,3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}}
       */