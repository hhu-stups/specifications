MACHINE replicated_choice
SETS
  PID = {p1,p2,p3,p4}; persons = {alf, spock, et}
OPERATIONS
  get_PID(xx) = PRE xx = PID THEN skip END
END