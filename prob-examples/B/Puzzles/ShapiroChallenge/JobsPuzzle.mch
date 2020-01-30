MACHINE JobsPuzzle
SETS	
	P = {Roberta, Thelma, Steve, Pete};
	J = {chef, guard, nurse, clerk, police, teacher, actor, boxer}

CONSTANTS PEOPLE,JOBS,MALE, FEMALE, HoldsJob, Husband, QualifiedJobs,Golfers /*, HigherEducation */
PROPERTIES
 /* There are four people: Roberta, Thelma, Steve, and Pete.  */
 PEOPLE={Roberta, Thelma, Steve, Pete}
 &
 /* Implicit assumption, names denote gender */
 FEMALE={Roberta, Thelma} & MALE={Steve, Pete}
 	/*
 	&
	 FEMALE <<: PEOPLE
 	 &
	 MALE <<: PEOPLE
 	 & 
	 MALE /\ FEMALE = {}
 	 &
	 MALE \/ FEMALE = PEOPLE
	 */
 /* Among them, they hold eight different jobs.  */
 &
 HoldsJob : JOBS -->> PEOPLE
 	/* & card(HoldsJob) = 8 */
 /* Each holds exactly two jobs.  */
 &
 !x.(x : PEOPLE => card(HoldsJob|>{x}) = 2)
 	/*!x.(x : PEOPLE => card(HoldsJob~[{x}]) = 2) */
 &
 JOBS = {chef, guard, nurse, clerk, police, teacher, actor, boxer}
 /* The job of nurse is held by a male.  */
 & 
 HoldsJob(nurse) : MALE
 /* Implicit assumption -> see slides (gender specific job-name (actor vs. actress?) */
 & 
 HoldsJob(actor) : MALE
 /* The husband of the chef is the clerk.  */
 &
 Husband : FEMALE >+> MALE
 &
 (HoldsJob(chef), HoldsJob(clerk)) : Husband
 /* Roberta is not a boxer. */
 &
 HoldsJob(boxer) /= Roberta
 /* Pete has no education past the ninth grade.  */
 	/* & QualifiedJobs <: JOBS */
 & /* Implicit assumption, these jobs require higher education, see slides */
 QualifiedJobs = {police, teacher, nurse}
 	/*
 	&
 	HigherEducation <: PEOPLE /* HigherEducation <: (PEOPLE - {Pete} 
 	&
 	Pete /: HigherEducation
 	&
 	HoldsJob[QualifiedJobs] <: HigherEducation
 	*/
	/* & !(job).(job : QualifiedJobs => HoldsJob(job) : HigherEducation) */
 &
 Pete /: HoldsJob[QualifiedJobs]
 /* Roberta, the chef, and the police officer went golfing together.  */
 & Golfers = {Roberta, HoldsJob(chef), HoldsJob(police)} & card(Golfers) = 3
 	/*& Golfers : iseq(PEOPLE) & Golfers = [Roberta, HoldsJob(chef), HoldsJob(police)] */
 	/*& Golfers : iseq({Roberta, HoldsJob(chef), HoldsJob(police)}) & size(Golfers) = 3 */
END