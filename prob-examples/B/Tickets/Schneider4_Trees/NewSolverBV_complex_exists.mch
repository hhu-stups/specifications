MACHINE NewSolver /* A Bit-Vector Version of NewSolver */
/* The query >>> CHOOSE_MODULES("bk-phi-H-2013",xxx) works with this model */
/* This version is much slower than exists_ok for computing all solutions, because here 
    the return_value is enumerate before the bit vector
*/
SEES data_complex
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
    #(mm).(
        mm = course_modules(course) &
    #(choice, trees).(
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
        printf("return value = ~w~n", return_value)
        &
        !(tt).(tt : trees =>
          #lam.(lam = level_available_modules(top(tt)'idx) &
          /* choice(tt)~[{TRUE}] <: lam & */
          !dd.(dd:mm \ lam => choice(tt)(dd)=FALSE)
          &
          printf("setting up top constraint ~w~n",(top(tt)'from |-> top(tt)'to |-> mm)) & 
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
              printf("setting up inner constraint ~w~n",(level_info'from |-> level_info'to |-> llmm))
             &
              card({y| y: mm & y|->TRUE : choice(tt) & y : llmm}) : level_info'from .. level_info'to
            )
          )
          )
        )
      )
    )
  )
END


/*

>>> let cl = course_levels[{"bk-phi-H-2013"}]
Expression Value =
{{([]|->rec(art:"null",from:7,idx:13,name:"Basismodule",tm:"null",to:7)),([1]|->rec(art:"null",from:1,idx:14,name:"Basispflichtmodule",tm:"null",to:2)),([1,1]|->rec(art:"null",from:1,idx:15,name:"Philosophische Propädeutik",tm:"null",to:2)),([2]|->rec(art:"null",from:0,idx:20,name:"Basiswahlmodule",tm:"null",to:2)),([2,1]|->rec(art:"null",from:0,idx:21,name:"Philosophische Propädeutik",tm:"null",to:2)),([2,2]|->rec(art:"null",from:0,idx:23,name:"Praktische Philosophie",tm:"null",to:2)),([2,3]|->rec(art:"null",from:0,idx:22,name:"Theoretische Philosophie",tm:"null",to:2)),([3]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([3,1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([3,2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([3,3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}}

>>> x:cl

>>> :show
Nr        prj1      prj2
1         {}        rec(art:"null",from:7,idx:13,name:"Basismodule",tm:"null",to:7)
2         {(1|->1)} rec(art:"null",from:1,idx:14,name:"Basispflichtmodule",tm:"null",to:2)
3         {(1|->1),(2|->1)} rec(art:"null",from:1,idx:15,name:"Philosophische Propädeutik",tm:"null",to:2)
4         {(1|->2)} rec(art:"null",from:0,idx:20,name:"Basiswahlmodule",tm:"null",to:2)
5         {(1|->2),(2|->1)} rec(art:"null",from:0,idx:21,name:"Philosophische Propädeutik",tm:"null",to:2)
6         {(1|->2),(2|->2)} rec(art:"null",from:0,idx:23,name:"Praktische Philosophie",tm:"null",to:2)
7         {(1|->2),(2|->3)} rec(art:"null",from:0,idx:22,name:"Theoretische Philosophie",tm:"null",to:2)
8         {(1|->3)} rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)
9         {(1|->3),(2|->1)} rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)
10        {(1|->3),(2|->2)} rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)
11        {(1|->3),(2|->3)} rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2)

:dot dom(dom(dom({x,y,px,py,tt|tt:cl & (px,x):tt & (py,y):tt & px/=[] & front(px)=py})))
*/
