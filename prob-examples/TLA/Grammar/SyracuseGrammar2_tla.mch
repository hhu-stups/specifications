/*@ generated TLA2B 1.0.6 Sat Apr 21 13:04:33 CEST 2012 */
MACHINE SyracuseGrammar
SETS
 ENUM1 = {s, Begin, End, S, M3, D2, Even, Odd}
DEFINITIONS
 IF_THEN_ELSE(P, a, b) == (%t_.(t_ = TRUE & P = TRUE | a )\/%t_.(t_= TRUE & not(P= TRUE) | b ))(TRUE);
 op1(d,e) == {(d |-> e)};

 op2(f,g) == f \/ g;

 Alphabet == {s, Begin, End, S, M3, D2, Even, Odd};

 NumberSeq == [s, s, s, s];

 Productions == op2(op2(op2(op2(op2(op2(op2(op2(op2(op1([S], [Begin, Even] ^ NumberSeq ^ [End]), op1([Even, s], [s, Odd])), op1([Odd, s], [s, Even])), op1([Even, End], [D2, End])), op1([Odd, End], [M3, s, End])), op1([s, M3], [M3, s, s, s])), op1([s, s, D2], [D2, s])), op1([Begin, M3, s, s], [Begin, s, s, Even])), op1([Begin, D2, s, s], [Begin, s, s, Even])), op1([Begin, D2, s, End], [s]));

 Inv == cur : seq(Alphabet);

 ApplyRule(LHS,RHS,pre,post) == cur = pre ^ LHS ^ post
	 & cur_n = pre ^ RHS ^ post;
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)};
 ANIMATION_STR1 == "s"; ANIMATION_STR2 == "Begin"; ANIMATION_STR3 == "End";
 ANIMATION_STR4 == "S"; ANIMATION_STR5 == "M3"; ANIMATION_STR6 == "D2";
 ANIMATION_STR7 == "Even"; ANIMATION_STR8 == "Odd" 
VARIABLES cur
INVARIANT
 cur : POW(INTEGER*ENUM1)
 & Inv
INITIALISATION
 cur:(cur = [S])
OPERATIONS
 ApplyRule_Op(LHS, pre, post, RHS) = ANY cur_n
	WHERE LHS : dom(Productions) & pre : seq(Alphabet) & post : seq(Alphabet) & RHS : {Productions(LHS)} & 
	 cur_n : POW(INTEGER*ENUM1) & ApplyRule(LHS, RHS, pre, post)
	THEN cur := cur_n END
END