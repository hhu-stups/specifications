MACHINE Jobshop(JOB,limit)

CONSTRAINTS limit : NAT1

VARIABLES jobs

INVARIANT jobs <: JOB & card(jobs) <= limit

INITIALISATION jobs := {}

OPERATIONS

	take(jj) = 
		PRE jj : JOB & jj /: jobs & card(jobs) < limit
		THEN jobs := jobs \/ {jj}
		END;

	kk <-- process =
		PRE jobs /= {}
		THEN 
		   ANY job WHERE job : jobs 
  		   THEN kk := job || jobs := jobs - {job}
                   END
                END; 

	priorities(ll) = 
		PRE /* ll: JOB & */ ll : jobs 
		THEN jobs := jobs - {ll}
		END  
END 


