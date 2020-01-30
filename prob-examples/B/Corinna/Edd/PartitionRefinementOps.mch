MACHINE
   PartitionRefinementOps

 SETS
   G; /* the graphs */
   OP /* ordered partitions */
   
 CONSTANTS
   g,largest_cell,matrix,epartition
 
 PROPERTIES
   g : G &                           /* graph for which to find canonical label */
   largest_cell : OP +-> NATURAL1 &  /* the largest cell of an OP */
   matrix : OP +-> NATURAL &         /* the binary string of a matrix */
   epartition : OP >+> OP          /* the unique, coarsest equitable partition
                                        for some ordered partition */

 VARIABLES
   targets,parent

 INVARIANT
   parent : OP +-> OP &         /* models the search tree, for any graph */
   targets : OP +-> OP &        /* ordered partitions and its fix */
   
   /* we target domain elements of the tree */
   ran(targets) <: dom(parent) &
   
   /* all tree nodes are equitable */
   (dom(parent) \/ ran(parent)) <: ran(epartition) &

   /* parents are coarser than their children */
   !(child).(child : dom(parent) => 
      largest_cell(child) < largest_cell(parent(child)))

 INITIALISATION
   targets := {}             ||
   parent := {}             ||
   epartition := {}         ||
   matrix := {}             ||
   largest_cell := {}

 OPERATIONS

   /* fix (also known as target) a vertex in a stable partition
      in the tree, to produce a new finer partition that has
      this vertex in a cell by itself. */

   fix(to,tn) = /* Parameter n ??*/
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

   /* refine a fixed partition. This entails
      1. choose tree node to with a target totarget
      2. refine totarget to give tn, where m is the
         binary num associated with the matrix it defines,
         and n is the size of its largest cell */
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
         tn |-> totarget : epartition   /* tn is the unique equitable 
                                           partition of to */
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
         !(tnp).(tnp : ran(parent) \/ dom(parent) =>
            largest_cell(tnp) = card(parent~[{tnp}])) &
         canonical : NATURAL &
         /* min matrix associated with discrete partition */
         canonical = 
            min( 
               matrix[{x | x : OP & 
                       largest_cell(x) = 1}])
      THEN
         skip
      END
 END