MACHINE BMachine
DEFINITIONS
 SET_PREF_MININT == -5;
 SET_PREF_MAXINT == 5;
 SET_PREF_MAX_OPERATIONS == 1;
 InitialHypotheses == PID /= {} & active : POW(PID) & waiting : POW(PID) & ready : POW(PID) & rr : PID;
  Hypotheses == InitialHypotheses  & ready <: PID & waiting : POW(PID) & (active /\ (ready \/ waiting)) = {} & waiting <: PID & ready : POW(PID) & (ready /\ waiting) = {} & rr : waiting & active = {} => ready = {};
  AllHypotheses == InitialHypotheses  & card(active) <= 1 & waiting : POW(PID) & ready : POW(PID) & rr : waiting & active = {} & ready <: PID & (active /\ (ready \/ waiting)) = {} & waiting <: PID & (ready /\ waiting) = {} & active : POW(PID) & active = {} => ready = {} & active <: PID;
 Goal == ({rr} /\ (ready \/ waiting - {rr})) = {}
SETS
  PID

OPERATIONS
  disproveHypotheses(active,waiting,ready,rr) = PRE Hypotheses &not(Goal) THEN skip END;
  disproveAllHypotheses(active,waiting,ready,rr) = PRE AllHypotheses & not(Goal) THEN skip END
END