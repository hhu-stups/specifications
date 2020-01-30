MACHINE LOCKR1_Update_inv6
SETS /* deferred */
  Deadline
 ; /* enumerated */
  State={IDLE,READY,LOCKING,LOCKED}
CONSTANTS
 completer_evaluated, deadline, initiator_enabled, initiator_evaluated, state,
 LockDeadline
PROPERTIES
 completer_evaluated : BOOL & initiator_enabled : BOOL & initiator_evaluated : BOOL &
state : State &

// negated Goal
(not(state = LOCKED => LockDeadline : dom(deadline) & deadline(LockDeadline) > 0 & #RANGE_LAMBDA.(RANGE_LAMBDA : INTEGER & RANGE_LAMBDA = deadline(LockDeadline) - 1))
 &

// Hypotheses
(State = {IDLE}\/{READY}\/{LOCKING}\/{LOCKED} & {IDLE}/\{READY} = {} & {IDLE}/\{LOCKING} = {} & {IDLE}/\{LOCKED} = {} & {READY}/\{LOCKING} = {} & {READY}/\{LOCKED} = {} & {LOCKING}/\{LOCKED} = {}) & deadline : Deadline +-> NATURAL & (state = LOCKED => LockDeadline : dom(deadline)) & (initiator_enabled = FALSE or initiator_evaluated = TRUE) & (0 /: ran(deadline) or completer_evaluated = TRUE) & (state = LOCKED => !d.(d : Deadline & d : dom(deadline) => deadline : Deadline +-> INTEGER)))
END
