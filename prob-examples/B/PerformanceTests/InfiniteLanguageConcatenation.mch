MACHINE InfiniteLanguageConcatenation
SETS
 Sigma={a,b,c,d,e}
DEFINITIONS
 Word == seq(Sigma)
CONSTANTS cat, catword, ne_cat, ne_cat2
PROPERTIES
 /* cat: POW(Word) * POW(Word) --> POW(Word */
 /* concatenate two languages */
 cat = %(a,b).(a<:Word & b<:Word|{c|#(aw,bw).(aw:a & bw:b & c=(aw^bw))})
 /* not yet detected as infinite by ProB; now it is (as of 1.3.5-beta6) */
 &
 catword = %(x,y).(x:Word & y:Word|x^y)

 &
 /* non-empty concatenation: check that seq1 is also ok */
 ne_cat = %(a,b).(a<:seq1(Sigma) & b<:seq1(Sigma)|{c|#(aw,bw).(aw:a & bw:b & c=(aw^bw))}) &
 ne_cat2 = %(a,b).(a<:seq1(Sigma) & b:POW(seq1(Sigma))|{c|#(aw,bw).(aw:a & bw:b & c=(aw^bw))})
ASSERTIONS
 cat({[a],[b,b]},{[c]}) = {[a,c],[b,b,c]};
 cat({[a,b,c,a,b,c,a,b,c]},{[c,c,c,b,b,b,a,a,a]}) = { [a,b,c,a,b,c,a,b,c,c,c,c,b,b,b,a,a,a] };
 !(x,y).(x: {{[]},{},{[a]},{[b],[b,c]}} & y: {{[]},{},{[a]},{[b],[b,c]},{[d,d,c,c,c,b,b,b,a,a,a]}}
   =>
     cat(x,y) = catword[(x*y)]) /* we can express cat as applying ^ to the cartesian product */;
 ne_cat({[a],[b,b]},{[c]}) = {[a,c],[b,b,c]};
 ne_cat({[a,b,c,a,b,c,a,b,c]},{[c,c,c,b,b,b,a,a,a]}) = { [a,b,c,a,b,c,a,b,c,c,c,c,b,b,b,a,a,a] };
 ({<>},{[a]}) /: dom(ne_cat);
 ({[a,b]},{[a]}) : dom(ne_cat);
 ({[a]},{<>}) /: dom(ne_cat);
 ({},{[a]}) : dom(ne_cat);
 ne_cat2({[a],[b,b]},{[c]}) = {[a,c],[b,b,c]};
 ne_cat2({[a,b,c,a,b,c,a,b,c]},{[c,c,c,b,b,b,a,a,a]}) = { [a,b,c,a,b,c,a,b,c,c,c,c,b,b,b,a,a,a] };
 ({<>},{[a]}) /: dom(ne_cat2);
 ({[a,b]},{[a]}) : dom(ne_cat2);
 ({[a]},{<>}) /: dom(ne_cat2);
 ({},{[a]}) : dom(ne_cat2)
END

