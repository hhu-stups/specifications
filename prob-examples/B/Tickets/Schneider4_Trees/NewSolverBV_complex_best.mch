MACHINE NewSolverBV_complex_best /* A Bit-Vector Version of NewSolver */
/* The query >>> CHOOSE_MODULES("bk-phi-H-2013",xxx,chc) works with this model
as does finding all solutions with dom({xxx,cc|CHOOSE_MODULES("bk-phi-H-2013",xxx,cc)})
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
  CHOOSE_MODULES(course, return_value,choice) == (
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
        // printf("return value = ~w~n", return_value) &
        
        !(tt).(tt : trees =>
          #lam.(lam = level_available_modules(top(tt)'idx) &
          /* choice(tt)~[{TRUE}] <: lam & */
          !dd.(dd:mm \ lam => choice(tt)(dd)=FALSE)
          &
          //printf("setting up top constraint ~w~n",(top(tt)'from |-> top(tt)'to |-> mm)) & 
          card({dd|dd:lam & dd|->TRUE:choice(tt)}) : top(tt)'from .. top(tt)'to
          &
          // printf("choice(tt) = ~w~n", choice(tt)) &
          !(level_info).(level_info : ran(tt) =>
            #(llmm).(
              /* level_info = tt(node) */
              /* & */
              llmm = level_available_modules(level_info'idx)
              &
              // printf("setting up inner constraint ~w~n",(level_info'from |-> level_info'to |-> llmm)) &
              card({y| y: mm & y|->TRUE : choice(tt) & y : llmm}) : level_info'from .. level_info'to
            )
          )
          )
        )
      )
  )
END


/*

>>> dom({xxx,cc|CHOOSE_MODULES("bk-phi-H-2013",xxx,cc)})
# trees = 1
course modules = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}
Expression Value = 
#1436:{{1,2,3,4,5,7,8},{1,2,3,4,5,7,9},...,{2,4,6,9,10,14,16},{2,4,6,9,10,15,16}}
>>> $
% Type: expr : POW(POW(INTEGER)) [Card=inf]
% Eval Time: 1430 ms (1430 ms walltime) + Normalisation: 0 ms (0 ms walltime)
*/
