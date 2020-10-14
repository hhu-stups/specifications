# Predefined Scripts

You can use these Clojure programs/scripts to extract models of interest:

- `lein repl`
to start the leininge Clojure REPL

- type e.g., `(load-file "find_b_models.clj")` at the user=> prompt

This will produce for example:

```clojure
user=> (load-file "find_large_b_models.clj")
("./prob-examples/TLC/Laws/SubsetLaws.mch" "./prob-examples/TLC/Deadlock/KnightsTour.mch" "./prob-examples/TLC/Deadlock/CardTrick.mch" "./prob-examples/TLC/NoError/CAN_BUS_tlc.mch" "./prob-examples/EventBPrologPackages/TopologyDiscovery/Basin_iFM_Topology/ClassicalB_Model_01.mch" "./prob-examples/EventBPrologPackages/Abrial_Train_Ch17/Train1_Lukas.mch" "./prob-examples/EventBPrologPackages/Abrial_Train_Ch17/Train_1_beebook_tlc_POR.mch" "./prob-examples/EventBPrologPackages/Abrial_Train_Ch17/Train1_Lukas_InitTRK.mch" "./prob-examples/EventBPrologPackages/Abrial_Train_Ch17/train_0_prob_mch_eventb.mch" "./prob-examples/B/LTL/MammarFrappier/FlightSystem_corrected_4_4.mch" "./prob-examples/B/Tickets/Hansen20_WhileInc/Counter.mch" "./prob-examples/B/Tickets/PROB-320/Core.mch" "./prob-examples/B/Tickets/PROB-320/HierarchicalParserIssue.mch" "./prob-examples/B/Tickets/Treharne1/House_Tracker.mch" "./prob-examples/B/RefinementChecking/RefinementAlgorithm.mch" "./prob-examples/B/PerformanceTests/ModelChecking/Lift_1Million_v2.mch" "./prob-examples/B/PerformanceTests/ModelChecking/ManyVariables.mch" "./prob-examples/B/PerformanceTests/ModelChecking/ManyVariablesPlusConst.mch" "./prob-examples/B/PerformanceTests/ModelChecking/Lift_1Million.mch" "./prob-examples/B/PerformanceTests/ParameterEnumeration.mch" "./prob-examples/B/PerformanceTests/LiftLarge.mch" "./prob-examples/B/Laws/SubsetLaws.mch" "./prob-examples/B/Laws/SetRelLaws_NatBool.mch" "./prob-examples/B/Benchmarks/CAN_BUS_tlc.mch" "./prob-examples/B/Benchmarks/obsw_M001_eventb.mch" "./prob-examples/B/Benchmarks/SetRelLaws.mch" "./prob-examples/B/Benchmarks/CAN_BUS.mch" "./prob-examples/B/Ivo/BenchmarksPOR/other/CAN_BUS_tlc.mch" "./prob-examples/B/Ivo/BenchmarksPOR/other/ConcurrentCounters.mch" "./prob-examples/B/Ivo/BenchmarksPGE/other/CAN_BUS_tlc.mch" "./prob-examples/B/Ivo/BenchmarksEnablingAnalysis/other/CAN_BUS.mch" "./prob-examples/B/Puzzles/Puzzle8_difficult.mch" "./prob-examples/B/Puzzles/Puzzle8.mch" "./prob-examples/B/Puzzles/LatinSquares.mch" "./prob-examples/B/Puzzles/KnightsTour_tlc.mch" "./prob-examples/B/Puzzles/KnightsTour.mch" "./prob-examples/B/Puzzles/KnightsTour_v2.mch" "./prob-examples/B/Tester/TwoDimensionalArray.mch" "./prob-examples/B/Petri/AutoFlight_PT_03a.mch" "./prob-examples/B/Petri/AutoFlight_PT_03a_no_dead.mch" "./prob-examples/B/Mathematical/CardTrick_TLC.mch" "./prob-examples/B/Mathematical/CardTrick.mch" "./prob-examples/B/SymbolicModelChecking/TimingExampleSimpler_v3_VariablesLimited.mch" "./prob-examples/B/SymbolicModelChecking/TimingExampleSimpler_v3.mch" "./prob-examples/B/ErrorMachines/FunLaws_wderror.mch")
```
