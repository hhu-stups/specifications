MACHINE Seq1UnionFunction
/* check that s is not expanded in the relational composition */
ABSTRACT_CONSTANTS s
PROPERTIES
 s = %x.(x:seq1(NATURAL) & x(1)>0|TRUE) \/ %y.(y:seq1(NATURAL) & y(1)=0|FALSE)
ASSERTIONS
 ({1|->[1]} ; s)= [TRUE];
 ({1|->[1], 2|->[0,2], 3|->[44,55,66]} ; s)= [TRUE,FALSE,TRUE];
 s[{ [1], [22,33] }] = {TRUE}
END

