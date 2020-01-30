MACHINE DeferredSetMinCard
/* Check whether ProB can infer minimum cardinality of ID of 4 */
SETS
 ID
CONSTANTS a,zz,b,c,d
PROPERTIES
 a:ID & b:ID & c:ID & d:ID & a /= b & a/= c & a/=d & b/=c & b/=d & not(c=d) & a /= zz
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=a
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

