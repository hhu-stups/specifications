MACHINE Knowledge_loop // there is a type error in line 17: pattern is not typed and only partially known
INCLUDES Dataset
SETS
  /* Two predefined sets exist, the vertices that the template and pattern can connect, and the labels.
   * The labels are already defined within Dataset.mch
   */
  Vertices = {x1,x2,x3,x4,x5,x6,x7,x8}
CONSTANTS
  /* The template and our pattern are the constants.
   *  * Template is given
   *  * Patterns is a set that must be found
   */
  Template
DEFINITIONS

  SET_PREF_TIME_OUT == 7000; SET_PREF_MAX_INITIALISATIONS == 2; SET_PREF_MAX_OPERATIONS == 1;
  CUSTOM_GRAPH_EDGES == UNION(p).(p:Patterns|pattern'EDGES);
  CUSTOM_GRAPH_NODES == Vertices; // dom(pattern'EDGES) \/ ran(pattern'EDGES);

  /* The (most general, i.e. ternary) definition of homomorphism. Note ' is the property accessor for records*/
  homomorph_with(FromGraph, iso, ToGraph) == (
    iso : Vertices >-> dom(ToGraph'LABEL) &
    !x.( x:Vertices => FromGraph'LABEL(x) = ToGraph'LABEL(iso(x))) &
    !(x,y).( x|->y : FromGraph'EDGES
         => iso(x)|->iso(y) : ToGraph'EDGES)
  );

  /* The (most general, i.e. ternary) definition of isomorphism*/
  isomorphic(FirstGraph, iso, SecondGraph) == (
    #(V1,V2).(
    vertices(FirstGraph'EDGES, V1) &
    vertices(SecondGraph'EDGES, V2) &
    iso : V1 >->> V2 &
    !x.( x:V1 => FirstGraph'LABEL(x) = SecondGraph'LABEL(iso(x))) &
    !(x,y).( x|->y: FirstGraph'EDGES
        => iso(x)|->iso(y) : SecondGraph'EDGES) &
    !(x,y).( x|->y: SecondGraph'EDGES
        => iso~(x)|->iso~(y) : FirstGraph'EDGES)
    )
  );

  vertices(EdgeRelation, VerticesSet) == (
    VerticesSet = dom(EdgeRelation)  \/ ran(EdgeRelation)
  );

  ValidPattern(pat) ==
       pat : (struct(LABEL:Vertices-->Labels, EDGES:Vertices<->Vertices)) &
       pat'EDGES <: Template &
       card({p|p:graphs & p'SIGN="POS" & #isop.(homomorph_with(pat, isop, p))}) >= 1 &
       not(#p.(p:graphs & p'SIGN="NEG" & #isop.(homomorph_with(pat, isop, p))))
PROPERTIES

  /*This is our given template*/
  Template = {(x1,x2),(x2,x3),(x3,x4),(x4,x5),(x5,x6),(x6,x7),(x7,x8)} &

  #iso.(homomorph_with(rec(EDGES:{(x1|->x2)},
                           LABEL:{(x1|->a),(x2|->a),(x3|->a),(x4|->a),(x5|->a),(x6|->a),(x7|->a),(x8|->a)}),
                           iso,
                           rec(EDGES:{(x1|->x2),(x3|->x4)},
                           LABEL:{(x1|->a),(x2|->a),(x3|->a),(x4|->a),(x5|->a),(x6|->a),(x7|->a),(x8|->a)})))

VARIABLES
  Patterns
INVARIANT
  Patterns <: (struct(LABEL:Vertices-->Labels, EDGES:Vertices<->Vertices))
INITIALISATION
  Patterns := {rec(LABEL:{(x1,a),(x2,b),(x3,a),(x4,a),(x5,a),(x6,a),(x7,a),(x8,a)}, EDGES:{(x1,x2),(x2,x3)})}
OPERATIONS
   AddNewPattern(pat) = SELECT card(Patterns)<6 & ValidPattern(pat) &
                               !(p1).(p1:Patterns => (p1 /= pat & not (#iso.(isomorphic(p1, iso, pat)))))
                        THEN
        Patterns := Patterns \/ {pat}
   END
END
