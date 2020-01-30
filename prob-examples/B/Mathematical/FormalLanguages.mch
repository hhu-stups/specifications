MACHINE FormalLanguages
SETS
 Sigma={a,b,c}
DEFINITIONS
 Word == seq(Sigma) /*;
 SET_PREF_SYMBOLIC == TRUE */
CONSTANTS cat, catword
PROPERTIES
 /* cat: POW(Word) * POW(Word) --> POW(Word */
 /* concatenate two languages */
 cat = %(a,b).(a<:Word & b<:Word|{c|#(aw,bw).(aw:a & bw:b & c=(aw^bw))})
 /* not yet detected as infinite by ProB; now it is (as of 1.3.5-beta6) */
 &
 catword = %(x,y).(x:Word & y:Word|x^y)
ASSERTIONS
 cat({[a],[b,b]},{[c]}) = {[a,c],[b,b,c]};
 cat({[a,b,c,a,b,c,a,b,c]},{[c,c,c,b,b,b,a,a,a]}) = { [a,b,c,a,b,c,a,b,c,c,c,c,b,b,b,a,a,a] };
 !(x,y).(x: {{[]},{},{[a]},{[b],[b,c]}} & y: {{[]},{},{[a]},{[b],[b,c]},{[c,c,c,b,b,b,a,a,a]}}
   =>
     cat(x,y) = catword[(x*y)]) /* we can express cat as applying ^ to the cartesian product */
END

