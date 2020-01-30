MACHINE TransitiveClosureRelation
/* An attempt at defining the transitive closure relation recursively;
 this version does not work very efficiently yet
*/
SETS
 Nodes={a,b,c,d,e,f,g,h}
DEFINITIONS
 SET_PREF_SYMBOLIC == TRUE
ABSTRACT_CONSTANTS trclos
CONSTANTS graph
PROPERTIES
 graph = {a|->b, b|->c, b |-> d, d|-> b, f|->g, g|->f} &
 
 /* recursive definition of transitive & reflexive closure */
 trclos = {i,x,y| i=0 & x=y & x:Nodes} \/
          {i,x,y| i>0 & #z.((i-1,x,z):trclos & (z,y):graph)}

OPERATIONS
  InClosure0(a,b) = PRE a:Nodes & b:Nodes & (0,a,b) : trclos THEN skip END;
  InClosure2(a,b) = PRE a:Nodes & b:Nodes & (2,a,b) : trclos THEN skip END;
  InClosure4(a,b) = PRE a:Nodes & b:Nodes & (4,a,b) : trclos THEN skip END; /* TIME OUT */
  InClosure8(a,b) = PRE a:Nodes & b:Nodes & (8,a,b) : trclos THEN skip END; /* TIME OUT */
  InClosure(i,a,b) = PRE i:0..5 & a:Nodes & b:Nodes & (i,a,b) : trclos THEN skip END
END

