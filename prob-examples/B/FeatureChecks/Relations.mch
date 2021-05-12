MACHINE Relations

SETS
	Name; Code

CONSTANTS
	ab, ba, bb, dd, db, bd, f, f1, int, integer,
        bl, nat, nat1, natural, naturla1, pow, pow1, rl,
	prod, sq, sq1, isq, prm, cmpl

PROPERTIES

	ab : Name +-> Code & /*Partial Function*/
	bb : Name +->> Code & /*Partial Surjection*/
	ba : Name --> Code & /*Total Function*/
	bb : Name -->> Code & /*Surjection*/
	dd : Name >+> Code & /*Partial Injection*/
	db : Name >-> Code & /*Total Injection*/
	bd : Name >+>> Code & /*Partial Bijection*/
	bb : Name >->> Code & /*Total Bijection*/
	f : FIN(Name) & /*Set of Finite sub-sets*/
	f1 : FIN1(Name) & /*Set of Finite Non-empty sub-sets*/

	int : INT & /*Set of implementable relative integers*/
	integer : INTEGER & /*Set of relative integers*/

	bl : BOOL & /*Set of boolean values*/

	nat : NAT & /*Set of implementable natural integer*/
	nat1 : NAT1 & /*Set of non-empty implementable natural integer*/
	natural : NATURAL & /*Set of natural integers*/
	naturla1 : NATURAL1 & /*Set of non-empty natural integers*/

	pow : POW(Name) & /*Set of sub-sets*/
	pow1 : POW1(Code) & /*Set of non-empty subsets*/
	rl : Name <-> Code & /*Set of relations*/
	prod : Name * Code & /*Cartesian product*/
	sq : seq(Name) & /*set of finite sequences over Name*/
	sq1 : seq1(Name) & /*set of finite non-empty sequences over Name*/
	isq : iseq(Name) & /*set of injective sequences over Name*/
	prm : perm(Name) & /*set of bijective sequences over Name*/
	cmpl : Name +-> Name +->> Code

END
