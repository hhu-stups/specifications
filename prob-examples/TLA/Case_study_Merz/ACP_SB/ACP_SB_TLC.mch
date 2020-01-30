MACHINE ACP_SB_TLC
SETS
 ENUM = {p0,p1,p2,waiting,notsent,undecided,commit,abort,yes,no}
CONSTANTS participants
PROPERTIES
 participants = {p0, p1, p2}
DEFINITIONS
 InitParticipant == participant : participants --> struct(vote : {yes, no}, alive : {TRUE}, decision : {undecided}, faulty : {FALSE}, voteSent : {FALSE});

 InitCoordinator == coordinator : struct(request : participants --> {FALSE}, vote : participants --> {waiting}, alive : {TRUE}, broadcast : participants --> {notsent}, decision : {undecided}, faulty : {FALSE});

 Init == InitParticipant & InitCoordinator;

 requestDef(i) == coordinator'alive = TRUE & not(coordinator'request(i) = TRUE) & coordinator_n = rec(request : coordinator'request <+ {i |-> TRUE}, vote : coordinator'vote, alive : coordinator'alive, broadcast : coordinator'broadcast, decision : coordinator'decision, faulty : coordinator'faulty) & participant_n = participant;

 getVote(i) == coordinator'alive = TRUE
	 & coordinator'decision = undecided
	 & !j.(j : participants => coordinator'request(j) = TRUE)
	 & coordinator'vote(i) = waiting
	 & participant(i)'voteSent = TRUE
	 & coordinator_n = rec(request : coordinator'request, vote : coordinator'vote <+ {i |-> participant(i)'vote}, alive : coordinator'alive, broadcast : coordinator'broadcast, decision : coordinator'decision, faulty : coordinator'faulty)
	 & participant_n = participant;

 detectFault(i) == coordinator'alive = TRUE
	 & coordinator'decision = undecided
	 & !j.(j : participants => coordinator'request(j) = TRUE)
	 & coordinator'vote(i) = waiting
	 & not(participant(i)'alive = TRUE)
	 & not(participant(i)'voteSent = TRUE)
	 & coordinator_n = rec(request : coordinator'request, vote : coordinator'vote, alive : coordinator'alive, broadcast : coordinator'broadcast, decision : abort, faulty : coordinator'faulty)
	 & participant_n = participant;

 coordBroadcast(i) == coordinator'alive = TRUE
	 & coordinator'decision /= undecided
	 & coordinator'broadcast(i) = notsent
	 & coordinator_n = rec(request : coordinator'request, vote : coordinator'vote, alive : coordinator'alive, broadcast : coordinator'broadcast <+ {i |-> coordinator'decision}, decision : coordinator'decision, faulty : coordinator'faulty)
	 & participant_n = participant;

 sendVote(i) == participant(i)'alive = TRUE
	 & coordinator'request(i) = TRUE
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : participant(i)'decision, faulty : participant(i)'faulty, voteSent : TRUE)}
	 & coordinator_n = coordinator;

 abortOnVote(i) == participant(i)'alive = TRUE
	 & participant(i)'decision = undecided
	 & participant(i)'voteSent = TRUE
	 & participant(i)'vote = no
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : abort, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent)}
	 & coordinator_n = coordinator;

 abortOnTimeoutRequest(i) == participant(i)'alive = TRUE
	 & participant(i)'decision = undecided
	 & not(coordinator'alive = TRUE)
	 & not(coordinator'request(i) = TRUE)
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : abort, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent)}
	 & coordinator_n = coordinator;

 decide(i) == participant(i)'alive = TRUE
	 & participant(i)'decision = undecided
	 & coordinator'broadcast(i) /= notsent
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : coordinator'broadcast(i), faulty : participant(i)'faulty, voteSent : participant(i)'voteSent)}
	 & coordinator_n = coordinator;

 parDie(i) == participant(i)'alive = TRUE
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : FALSE, decision : participant(i)'decision, faulty : TRUE, voteSent : participant(i)'voteSent)}
	 & TRUE = TRUE;

 parProg(i) == sendVote(i) or abortOnVote(i) or abortOnTimeoutRequest(i) or decide(i);

 coordProgA(i) == requestDef(i) or getVote(i) or detectFault(i) or coordBroadcast(i);

VARIABLES participant, coordinator
INVARIANT
 participant : POW(ENUM*struct(vote:ENUM,alive:BOOL,decision:ENUM,faulty:BOOL,voteSent:BOOL))
 & coordinator : struct(request:POW(ENUM*BOOL),vote:POW(ENUM*ENUM),alive:BOOL,broadcast:POW(ENUM*ENUM),decision:ENUM,faulty:BOOL)
INITIALISATION
 participant, coordinator:(Init)
OPERATIONS
 parDie_Op(i) = ANY participant_n
	WHERE i : participants & 
	 parDie(i)
	THEN participant := participant_n END;

 parProg_Op(i) = ANY participant_n, coordinator_n
	WHERE i : participants & 
	 parProg(i)
	THEN participant, coordinator := participant_n, coordinator_n END;

 coordDie_Op = ANY coordinator_n
	WHERE coordinator'alive = TRUE
	 & coordinator_n = rec(request : coordinator'request, vote : coordinator'vote, alive : FALSE, broadcast : coordinator'broadcast, decision : coordinator'decision, faulty : TRUE)
	 & TRUE = TRUE
	THEN coordinator := coordinator_n END;

 makeDecision_Op = ANY coordinator_n
	WHERE coordinator'alive = TRUE
	 & coordinator'decision = undecided
	 & !j.(j : participants => coordinator'vote(j) : {yes, no})
	 & (!j.(j : participants => coordinator'vote(j) = yes)
	 & coordinator_n = rec(request : coordinator'request, vote : coordinator'vote, alive : coordinator'alive, broadcast : coordinator'broadcast, decision : commit, faulty : coordinator'faulty)
	 or (#j.(j : participants & coordinator'vote(j) = no)
	 & coordinator_n = rec(request : coordinator'request, vote : coordinator'vote, alive : coordinator'alive, broadcast : coordinator'broadcast, decision : abort, faulty : coordinator'faulty)))
	 & TRUE = TRUE
	THEN coordinator := coordinator_n END;

 coordProgA_Op(i) = ANY participant_n, coordinator_n
	WHERE i : participants & 
	 coordProgA(i)
	THEN participant, coordinator := participant_n, coordinator_n END
END
/* Created Mon Dec 19 11:39:14 CET 2011 by TLA2B */