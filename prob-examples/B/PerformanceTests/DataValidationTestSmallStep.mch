MACHINE DataValidationTestSmallStep
 // Rather than one big WHILE loop we have individual validation steps
 // Can be checked by TLC

DEFINITIONS
  SET_PREF_TIME_OUT == 120000
CONSTANTS
  n,
  ids, value, ids_for_value
PROPERTIES
  n = 20001 & // with n>20000 value is kept symbolic
  ids = 1..n &
  value = %x.(x:1..n | x mod 100) &
  ids_for_value = value~
VARIABLES counter, error, checked
INVARIANT
   counter :1..n &
   error : BOOL &
   checked : BOOL
INITIALISATION counter := 1 || error := FALSE || checked := FALSE
OPERATIONS
  Validate =
     SELECT counter < n THEN
        counter := counter + 1 ||
        IF counter /: ids THEN
           error := TRUE
        //ELSIF counter: 0..n & (counter mod 100) /: 0..99 THEN
        ELSIF counter|->100 : value  THEN
        //ELSIF value(counter) /: 0..99 THEN
           error := TRUE
        ELSIF card(ids_for_value[{value(counter)}]) < n/100 THEN
           error := TRUE
        END
     END;
   Finished = SELECT counter >= n THEN
        checked := TRUE
  END
END

/*
$ probcli --model-check /Users/leuschel/git_root/prob_examples/public_examples/B/PerformanceTests/DataValidationTestSmallStep.mch -disable_timeout
% Runtime for SOLUTION for SETUP_CONSTANTS: 80 ms (walltime: 82 ms)
% Runtime to FINALISE SETUP_CONSTANTS: 0 ms (walltime: 0 ms)

ALL OPERATIONS COVERED
% All open nodes visited
Model checking time: 4697 ms (4769 ms walltime)
States analysed: 20003
Transitions fired: 20004
No counter example found. ALL nodes visited.

$ probcli -execute_all /Users/leuschel/git_root/prob_examples/public_examples/B/PerformanceTests/DataValidationTestSmallStep.mch
% Runtime for SOLUTION for SETUP_CONSTANTS: 69 ms (walltime: 71 ms)
Infinite loop reached after 20005 steps (looping on Finished).
% Runtime for -execute: 5207 ms (with gc: 27297 ms, walltime: 27624 ms); time since start: 29316 ms
$ probcli -execute_all /Users/leuschel/git_root/prob_examples/public_examples/B/PerformanceTests/DataValidationTestSmallStep.mch -noinv
% Runtime for SOLUTION for SETUP_CONSTANTS: 73 ms (walltime: 75 ms)
Infinite loop reached after 20005 steps (looping on Finished).
% Runtime for -execute: 4703 ms (with gc: 26740 ms, walltime: 27034 ms); time since start: 28730 ms

      23.126 sec. for 126 garbage collections which collected 919 356 496 bytes

Result with TLC:

Parsing time: 454 ms
Translation time: 61 ms
Model checking time: 102 sec
States analysed: 20002
Transitions fired: 20003
Result: NoError
*/
