MACHINE PartitionRefinementWithAutomorphisms
 SETS  G; /* the graphs */
       OP; /* ordered partitions */
       PERM /* the set of permutations */
 CONSTANTS
       g, largest_cell, matrix, epartition, permu
 PROPERTIES
       g : G &                           /* graph for which to find canonical label */
       largest_cell : OP +-> NATURAL1 &  /* the largest cell of an OP */
       matrix : OP +-> NATURAL &         /* the binary string of a matrix */
       epartition : OP >+> OP &          /* the unique, coarsest equitable partition
                                            for some ordered partition */           
                            
       permu : (OP * OP) --> PERM  /* the permutation between two ordered partitions */
 VARIABLES  
   targets,parent,faut
 INVARIANT
       parent : OP +-> OP &         /* models the search tree, for any graph */
   targets : OP +-> OP &        /* ordered partitions and its fix */
   
   /* we target domain elements of the tree */
   ran(targets) <: dom(parent) &
   
   /* all tree nodes are equitable */
   (dom(parent) \/ ran(parent)) <: ran(epartition) &

   /* parents are coarser than their children */
   !(child).(child : dom(parent) => 
      largest_cell(child) < largest_cell(parent(child))) &
   faut : POW(PERM) /* found automorphisms */
 INITIALISATION  
       targets := {}             ||
       parent := {}             ||
       epartition := {}         ||
       matrix := {}             ||
       largest_cell := {} ||
       faut := {}
 OPERATIONS
 
   /* fix (also known as target) a vertex in a stable partition
      in the tree, to produce a new finer partition that has
      this vertex in a cell by itself. */
   fix(to,tn) =
      PRE
         to : OP &              /* an ordered partition to fix */
         to : dom(parent) &     /* its in the tree */
         largest_cell(to) > 1 & /* 'to' is not discrete */
         tn : OP &                      /* the fixed partition */
         tn /: dom(targets) &           /* .. isn't in tree */
         /* its largest cell is greater than its number of 
            targets already => can be targetted/fixed */
         (to : ran(targets) =>  
            largest_cell(to) > card(targets~[{to}])) &
         largest_cell(tn) < largest_cell(to) /* 'tn' is finer than 'to' */
      THEN
         targets := targets \/ {tn |-> to}
      END;
 
  /* an automorphism is found when two discrete partitions
     have the same adjacency matrices; therefore store this
     permutation, or more precisely, automorphism. */
  add_automorphism(p1,p2,a) =
      PRE
         p1 : OP &                   /* partition 1 */
         p2 : OP &                   /* partition 2 */
         largest_cell(p1) = 1 &      /* p1 discrete */
         largest_cell(p2) = 1 &      /* p2 discrete */
         matrix(p1) = matrix(p2) &   /* same matrices */
         a:PERM &
         a = permu(p1 |-> p2)        /* the automorphism */
      THEN
         faut := faut \/ {a}         /* udpate the set of found automorphisms */
      END;

  /* revised refine operation: incorporate automorphism pruning: if
     the fixed partition 'totarget' of partition 'to' is automorphic 
     to another fixed partition of 'to', don't continue refining 'totarget'
     i.e., prune its subtree */
  refine(to,totarget,tn) =
    PRE
      to : OP &                      /* tree partition to stabilise */
      totarget : OP &                /* the target of tree partition */
      to : dom(parent) &             /* its in the tree */
      to : ran(targets) &            /* can be fixed */
      (totarget |-> to) : targets &  /* totarget is a target of to */
      /* 'to' still has possible targets */
      (largest_cell(to) > card(parent~[{to}])) &
      tn : OP &                      /* the new tree node */
      tn |-> totarget : epartition   & /* tn is the unique equitable 
                                           partition of to */
      /* if to has at least one child */
      (card(parent~[{to}]) >= 1 =>
        /* another target of 'to', is not automorphic to totarget */
        !(tn2).(tn2 : targets~[{to}] &      /* tn2 is a fixed partition of 'to' */
              tn2 /= totarget => 
              permu(totarget,tn2) /: faut))  /* tn and tn2 NOT KNOWN to be
automorphic */
    THEN
      /* tn is a new child of to in the tree */
      parent := parent \/ {tn |-> to}
    END;
    
    /* enabled when the search tree has been exhausted,
      in which case the canonical is the minimum matrix */
   finished(canonical) =
      PRE
         /* each tree node cannot have any more children
            i.e., finished searching */
         !(tn).(tn : ran(parent) \/ dom(parent) =>
            largest_cell(tn) = card(parent~[{tn}])) &
         canonical : NATURAL &
         /* min matrix associated with discrete partition */
         canonical = 
            min( {0} \/
               matrix[{x | x : OP & 
                       largest_cell(x) = 1}])
      THEN
         skip
      END
 END