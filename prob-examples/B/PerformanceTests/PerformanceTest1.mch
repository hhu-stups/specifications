MACHINE PerformanceTest1
SETS
  Symbols
DEFINITIONS
  scope_Symbols == 1..25
CONSTANTS
  Start,Sub
PROPERTIES
  Start <: Symbols & card(Start)=1 & Sub<:Start
VARIABLES
  x
INVARIANT x:Start
INITIALISATION x::Start
END