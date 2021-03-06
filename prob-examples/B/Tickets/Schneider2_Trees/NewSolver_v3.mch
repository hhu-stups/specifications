MACHINE NewSolver_v3
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
      chosen : trees --> POW(INTEGER) // POW(INTEGER) will avoid enumeration of chosen; POW(mm) may enumerate
      &
      choice : trees --> (INTEGER <-> POW(INTEGER))  // we model choice as a global function in v3 rather than an existential variable
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
        #(leaves, root, COURSE_LEVEL_IDS).(
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

          choice(tt) : COURSE_LEVEL_IDS --> POW(mm)
          &
          myprintf("choice(tt) ~w~n", choice(tt))
          &
          /* for all leaves the choice is a subset of the modules associated to
           * that leaf; the cardinality of the subset is in the range from..to
           */
          !(n).(n : leaves =>
            #(s).(
              s = choice(tt)(tt(n)'idx)
              &
              myprintf("process leaf: ~w~n",(n,tt(n)'idx,tt(n)'from,tt(n)'to))
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
              myprintf("process node: ~w~n",(n,tt(n)'idx,tt(n)'from,tt(n)'to))
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
          myprintf("selection ~w~n", chosen(tt)) 
          /* & chosen(tt) = {3,5,7,8} */
        )
    )
    )
  );
END

/*

>>> CHOOSE_MODULES("bk-phi-H-2013", solution) 
Use rewrite_rule top
tt([])
Use rewrite_rule sons
__ASSERT [] : dom(subtree(tt,n)) IN dom({son_x,r,si|(son_x : INTEGER & r : POW(seq(INTEGER) * struct(art:STRING,from:INTEGER,idx:INTEGER,name:STRING,tm:STRING,to:INTEGER))) & (((si : dom(subtree(tt,n)) & si /= []) & son_x = first(si)) & r = {p,a|(p : seq(INTEGER) & a : struct(art:STRING,from:INTEGER,idx:INTEGER,name:STRING,tm:STRING,to:INTEGER)) & (son_x -> p) |-> a : subtree(tt,n)})})
Use rewrite_rule subtree
(%u.(u : seq(INTEGER)|n ^ u) ; tt)
Use rewrite_rule subtree
(%u.(u : seq(INTEGER)|n ^ u) ; tt)
Use rewrite_rule subtree
(%u.(u : seq(INTEGER)|n ^ u) ; tt)
Use rewrite_rule top
xx([])
course modules = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}
Root 16
COURSE_LEVEL_IDS {16,17,18,19}
Leaves {{(1|->1)},{(1|->2)},{(1|->3)}}
process leaf: ((({(1|->1)}|->17)|->1)|->2)
process leaf: ((({(1|->2)}|->19)|->2)|->4)
process leaf: ((({(1|->3)}|->18)|->1)|->2)
process node: ((({}|->16)|->4)|->6)
choice(tt) {(16|->{7,8,3,5}),(17|->{3}),(18|->{5}),(19|->{7,8})}
choice(tt) {(16|->{7,8,3,5}),(17|->{3}),(18|->{5}),(19|->{7,8})}
chosen = {({({}|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),({(1|->1)}|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),({(1|->2)}|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),({(1|->3)}|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}|->{7,8,3,5})}
return value = {7,8,3,5}
selection {7,8,3,5}
Existentially Quantified Predicate over chosen,choice,solution,mm,trees is TRUE
Solution: 
       chosen = {({([]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}|->{3,5,7,8})} &
       choice = {({([]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}|->{(16|->{3,5,7,8}),(17|->{3}),(18|->{5}),(19|->{7,8})})} &
       solution = {3,5,7,8} &
       mm = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23} &
       trees = {{([]|->rec(art:"null",from:4,idx:16,name:"Basiswahlpflichtmodule",tm:"null",to:6)),([1]|->rec(art:"null",from:1,idx:17,name:"Theoretische Philosophie",tm:"null",to:2)),([2]|->rec(art:"null",from:2,idx:19,name:"Geschichte der Philosophie",tm:"null",to:4)),([3]|->rec(art:"null",from:1,idx:18,name:"Praktische Philosophie",tm:"null",to:2))}}

>>> 




*/