MACHINE           Jobshop(JOB, limit)

CONSTRAINTS       limit : NAT1

VARIABLES         jobs

INVARIANT         jobs <: JOB & card(jobs) <= limit

INITIALISATION    jobs := {}

OPERATIONS

  take(jj) =
  PRE jj : JOB & jj /: jobs & card(jobs) < limit
  THEN jobs := jobs \/ {jj}
  END;

jj <-- process =
  PRE jobs /= {}
  THEN ANY job WHERE job : jobs THEN jj := job || jobs := jobs - {job} END
  END;

  prioritise(jj) =
  PRE jj : jobs
  THEN jobs := jobs - {jj}
  END

END
