MACHINE LogicQuestion
/*
Which answer in this list is the correct answer to this question?

All of the below.
None of the below.
All of the above.
One of the above.
None of the above.
None of the above.
https://math.stackexchange.com/questions/2217248/which-answer-in-this-list-is-the-correct-answer-to-this-question

*/
CONSTANTS a,b,c,d,e,f
PROPERTIES

 (𝑎=TRUE <=> b=TRUE∧ c=TRUE ∧ d=TRUE ∧e=TRUE ∧f=TRUE)
 &
 (b=TRUE <=> c=FALSE ∧ d=FALSE ∧ e=FALSE∧ f=FALSE)
 &
 (c=TRUE <=> 𝑎∧b=TRUE)
 &
 (d=TRUE <=> (𝑎∧b=FALSE∧c=FALSE)∨(a=FALSE∧b=TRUE∧c=FALSE)∨ (a=FALSE ∧b=FALSE∧c=TRUE)
 &
 (e=TRUE <=> a=FALSE ∧ b=FALSE∧ c=FALSE∧ d=FALSE)
 &
(f=TRUE <=> a=FALSE ∧ b=FALSE∧ c=FALSE∧ d=FALSE∧ e=FALSE)
END

