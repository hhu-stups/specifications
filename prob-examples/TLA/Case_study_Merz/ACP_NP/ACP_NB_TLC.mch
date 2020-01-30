MACHINE ACP_NB_TLC
SETS
 ENUM = {p0,p1,waiting,notsent,undecided,commit,abort,yes,no}
CONSTANTS participants
PROPERTIES
 participants = {p0, p1}
DEFINITIONS
 InitCoordinator == coordinator : struct(request : participants --> {FALSE}, vote : participants --> {waiting}, alive : {TRUE}, broadcast : participants --> {notsent}, decision : {undecided}, faulty : {FALSE});

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
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : participant(i)'decision, faulty : participant(i)'faulty, voteSent : TRUE, forward : participant(i)'forward)}
	 & coordinator_n = coordinator;

 abortOnVote(i) == participant(i)'alive = TRUE
	 & participant(i)'decision = undecided
	 & participant(i)'voteSent = TRUE
	 & participant(i)'vote = no
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : abort, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward)}
	 & coordinator_n = coordinator;

 abortOnTimeoutRequest(i) == participant(i)'alive = TRUE
	 & participant(i)'decision = undecided
	 & not(coordinator'alive = TRUE)
	 & not(coordinator'request(i) = TRUE)
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : abort, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward)}
	 & coordinator_n = coordinator;

 parDie(i) == participant(i)'alive = TRUE
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : FALSE, decision : participant(i)'decision, faulty : TRUE, voteSent : participant(i)'voteSent, forward : participant(i)'forward)}
	 & TRUE = TRUE;

 coordProgA(i) == requestDef(i) or getVote(i) or detectFault(i) or coordBroadcast(i);

 InitParticipantNB == participant : participants --> struct(vote : {yes, no}, alive : {TRUE}, decision : {undecided}, faulty : {FALSE}, voteSent : {FALSE}, forward : participants --> {notsent});

 InitNB == InitParticipantNB & InitCoordinator;

 forwardDef(i,j) == i /= j & participant(i)'alive = TRUE & participant(i)'forward(i) /= notsent & participant(i)'forward(j) = notsent & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : participant(i)'decision, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward <+ {j |-> participant(i)'forward(i)})} & coordinator_n = coordinator;

 preDecideOnForward(i,j) == i /= j
	 & participant(i)'alive = TRUE
	 & participant(i)'forward(i) = notsent
	 & participant(j)'forward(i) /= notsent
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : participant(i)'decision, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward <+ {i |-> participant(j)'forward(i)})}
	 & coordinator_n = coordinator;

 preDecide(i) == participant(i)'alive = TRUE
	 & participant(i)'forward(i) = notsent
	 & coordinator'broadcast(i) /= notsent
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : participant(i)'decision, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward <+ {i |-> coordinator'broadcast(i)})}
	 & coordinator_n = coordinator;

 decideNB(i) == participant(i)'alive = TRUE
	 & !j.(j : participants => participant(i)'forward(j) /= notsent)
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : participant(i)'forward(i), faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward)}
	 & coordinator_n = coordinator;

 abortOnTimeout(i) == participant(i)'alive = TRUE
	 & participant(i)'decision = undecided
	 & not(coordinator'alive = TRUE)
	 & !j.(j : participants => (participant(j)'alive = TRUE => coordinator'broadcast(j) = notsent))
	 & !j,k.(j : participants & k : participants => (not(participant(j)'alive = TRUE) & participant(k)'alive = TRUE => participant(j)'forward(k) = notsent))
	 & participant_n = participant <+ {i |-> rec(vote : participant(i)'vote, alive : participant(i)'alive, decision : abort, faulty : participant(i)'faulty, voteSent : participant(i)'voteSent, forward : participant(i)'forward)}
	 & coordinator_n = coordinator;

 parProgNB(i,j) == sendVote(i)
	 or abortOnVote(i)
	 or abortOnTimeoutRequest(i)
	 or forwardDef(i, j)
	 or preDecideOnForward(i, j)
	 or abortOnTimeout(i)
	 or preDecide(i)
	 or decideNB(i);

VARIABLES participant, coordinator
INVARIANT
 participant : POW(ENUM*struct(vote:ENUM,alive:BOOL,decision:ENUM,faulty:BOOL,voteSent:BOOL,forward:POW(ENUM*ENUM)))
 & coordinator : struct(request:POW(ENUM*BOOL),vote:POW(ENUM*ENUM),alive:BOOL,broadcast:POW(ENUM*ENUM),decision:ENUM,faulty:BOOL)
INITIALISATION
 participant, coordinator:(InitNB)
OPERATIONS
 parDie_Op(i, j) = ANY participant_n
	WHERE i : participants & j : participants & 
	 parDie(i)
	THEN participant := participant_n END;

 parProgNB_Op(i, j) = ANY participant_n, coordinator_n
	WHERE i : participants & j : participants & 
	 parProgNB(i, j)
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
/* Created Fri Dec 16 12:47:59 CET 2011 by TLA2B */