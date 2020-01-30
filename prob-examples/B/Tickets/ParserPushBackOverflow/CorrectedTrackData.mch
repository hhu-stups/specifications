
MACHINE CorrectedTrackData
ABSTRACT_CONSTANTS
 AC_Distance
CONSTANTS
  C_Points_Records
, C_Connectors_Records
, C_EndTrack_Records
, C_Signal_Records
, C_BaliseGroup_Records
, C_TrackSegments // set of all track segments
, C_Points //set of all points
, C_Signals // set of all signals
, C_BaliseGroups // set of all balise groups

, C_Points_TrackSegmentTongue // a total function mapping each pointId to the corresponding track segment tongue, e.g. {"P1"|-> T3, "P2" |-> "T5", ...}
, C_Points_TrackSegmentRight // a total function mapping each pointId to the corresponding track segment right, e.g. {"P1"|-> T2, "P2" |-> "T3", ...}
, C_Points_TrackSegmentLeft  // ditto for track segment left
, C_Points_OperationalMeter // ditto for operationalMeter
, C_Signal_TrackSegment // ditto for C_SignalRecords and trackSegment field
, C_Signal_OperationalMeter // ditto for C_SignalRecords and operationalMeter field
, C_Signal_Direction // ditto for C_SignalRecords and direction field
, C_BaliseGroup_TrackSegment // ditto for C_BaliseGroup_Records and trackSegment field
, C_BaliseGroup_OperationalMeter // ditto for C_BaliseGroup_Records and operationalMeter field

, C_TrackSegment_Positions /* a relation containing the start position and the end position of a track segment,  e.g. {"T0"|->450, "T0" |-> 10, ...}  */

PROPERTIES
  AC_Distance = %x,y.(x: NATURAL & y : NATURAL| max({x,y}) - min({x,y}))
&
  C_Points_Records
   =
    {
      rec(pointId: "P1", trackSegmentTongue: "T3", trackSegmentRight: "T2", trackSegmentLeft: "T1", operationalMeter: 1000)
      , rec(pointId: "P2", trackSegmentTongue: "T5", trackSegmentRight: "T3", trackSegmentLeft: "T4", operationalMeter: 2000)
      , rec(pointId: "P3", trackSegmentTongue: "T5", trackSegmentRight: "T7", trackSegmentLeft: "T6", operationalMeter: 3000)
      , rec(pointId: "P4", trackSegmentTongue: "T8", trackSegmentRight: "T6", trackSegmentLeft: "T7", operationalMeter: 4000)
    }
&
  C_Connectors_Records =
    {
      rec(trackSegment1: "T0", operationalMeter1: 450, trackSegment2: "T1", operationalMeter2: 500)
    }
&
  C_EndTrack_Records
    =
    {
      rec(trackSegment: "T0", operationalMeter: 10)
      , rec(trackSegment: "T2", operationalMeter: 700)
      , rec(trackSegment: "T4", operationalMeter: 1600)
      , rec(trackSegment: "T8", operationalMeter: 4500)
    }
&
  C_Signal_Records
    =
    {
      rec(signalId: "S1", trackSegment: "T0", operationalMeter: 200, direction: "UP")
      , rec(signalId: "S2", trackSegment: "T1", operationalMeter: 700, direction: "UP")
      , rec(signalId: "S3", trackSegment: "T1", operationalMeter: 800, direction: "DOWN")
      , rec(signalId: "S4", trackSegment: "T2", operationalMeter: 900, direction: "UP")
      , rec(signalId: "S5", trackSegment: "T3", operationalMeter: 1500, direction: "UP")
      , rec(signalId: "S6", trackSegment: "T4", operationalMeter: 1600, direction: "UP")
      , rec(signalId: "S7", trackSegment: "T5", operationalMeter: 2300, direction: "UP")
      , rec(signalId: "S8", trackSegment: "T5", operationalMeter: 2400, direction: "UP")
      , rec(signalId: "S9", trackSegment: "T6", operationalMeter: 3400, direction: "UP")
      , rec(signalId: "S10", trackSegment: "T7", operationalMeter: 3360, direction: "UP")
      , rec(signalId: "S11", trackSegment: "T8", operationalMeter: 4460, direction: "UP")

    }
&
  C_BaliseGroup_Records
    =
    {
      rec(baliseGroupId: "B1", trackSegment: "T0", operationalMeter: 201)
      , rec(baliseGroupId: "B2", trackSegment: "T1", operationalMeter: 670)
      , rec(baliseGroupId: "B3", trackSegment: "T2", operationalMeter: 950)
      , rec(baliseGroupId: "B4", trackSegment: "T3", operationalMeter: 1300)
      , rec(baliseGroupId: "B5", trackSegment: "T4", operationalMeter: 1700)
      , rec(baliseGroupId: "B6", trackSegment: "T5", operationalMeter: 2400)
      , rec(baliseGroupId: "B7", trackSegment: "T6", operationalMeter: 3660)
      , rec(baliseGroupId: "B8", trackSegment: "T7", operationalMeter: 3400)
      , rec(baliseGroupId: "B9", trackSegment: "T8", operationalMeter: 4300)

    }
& C_TrackSegments =
    UNION(r).(r : C_Points_Records | {r'trackSegmentTongue, r'trackSegmentLeft, r'trackSegmentRight})
      \/ UNION(r).(r : C_Connectors_Records | {r'trackSegment1, r'trackSegment2})
      \/ UNION(r).(r : C_EndTrack_Records | {r'trackSegment})
& C_Points = UNION(r).(r : C_Points_Records | {r'pointId})
& C_Signals = UNION(r).(r : C_Signal_Records | {r'signalId})
& C_BaliseGroups = UNION(r).(r : C_BaliseGroup_Records | {r'baliseGroupId})
& C_Points_TrackSegmentTongue = UNION(r).(r : C_Points_Records | {r'pointId |-> r'trackSegmentTongue})
& C_Points_TrackSegmentRight =  UNION(r).(r : C_Points_Records | {r'pointId |-> r'trackSegmentRight})
& C_Points_TrackSegmentLeft = UNION(r).(r : C_Points_Records | {r'pointId |-> r'trackSegmentLeft})
& C_Points_OperationalMeter = UNION(r).(r : C_Points_Records | {r'pointId |-> r'operationalMeter})
& C_Signal_TrackSegment = UNION(r).(r : C_Signal_Records | {r'signalId |-> r'trackSegment})
& C_Signal_OperationalMeter = UNION(r).(r : C_Signal_Records | {r'signalId |-> r'operationalMeter})
& C_Signal_Direction = UNION(r).(r : C_Signal_Records | {r'signalId |-> r'direction})
& C_BaliseGroup_TrackSegment = UNION(r).(r : C_BaliseGroup_Records | {r'baliseGroupId |-> r'trackSegment})
& C_BaliseGroup_OperationalMeter = UNION(r).(r : C_BaliseGroup_Records | {r'baliseGroupId |-> r'operationalMeter})


& C_TrackSegment_Positions =
    UNION(r).(r : C_Points_Records | {r'trackSegmentRight |-> r'operationalMeter, r'trackSegmentLeft |-> r'operationalMeter, r'trackSegmentTongue |-> r'operationalMeter})
    \/ UNION(r).(r : C_Connectors_Records | {r'trackSegment1 |-> r'operationalMeter1, r'trackSegment2 |-> r'operationalMeter2})
    \/ UNION(r).(r : C_EndTrack_Records | {r'trackSegment |-> r'operationalMeter })
/* a relation containing the start position and the end position of a track segment,  e.g. {"T0"|->450, "T0" |-> 10, ...}  */

VARIABLES
V_TrackSegment_MinPosition /* a total function mapping each track segment to the minimum position, e.g. {"T0" |-> 10, ...} */
, V_TrackSegment_MaxPosition /* a total function mapping each track segment to the maximum position, e.g. {"T0" |-> 450, ...} */
, V_Rule_TrackSegmentPositions
,V_Rule_SignalPosition
INVARIANT
  V_Rule_TrackSegmentPositions : {"NOT_CHECKED", "FAILED", "SUCCESS"}
& V_TrackSegment_MinPosition : C_TrackSegments +-> NATURAL
& V_TrackSegment_MaxPosition : C_TrackSegments +-> NATURAL
&V_Rule_SignalPosition : {"NOT_CHECKED", "FAILED", "SUCCESS"}
INITIALISATION
  V_TrackSegment_MinPosition := {}
|| V_TrackSegment_MaxPosition := {}
|| V_Rule_TrackSegmentPositions := "NOT_CHECKED"
|| V_Rule_SignalPosition := "NOT_CHECKED"
OPERATIONS


  /* Check the following predicate and save the result value in the variable V_Rule_TrackSegmentPositions
  /*  !t.(t : C_TrackSegments => card(C_TrackSegment_Positions[{t}]) = 2) */
Rule_TrackSegmentPositions =
  SELECT
    V_Rule_TrackSegmentPositions="NOT_CHECKED"
    // this rule should be executed only once
  THEN
    IF
!t.(t : C_TrackSegments => card(C_TrackSegment_Positions[{t}]) = 2)
      /* Check the following predicate here and store the result value of the evaluation in the then and else branch (in variable V_Rule_TrackSegmentPositions)
      /*  !t.(t : C_TrackSegments => card(C_TrackSegment_Positions[{t}]) = 2) */
    THEN
      V_TrackSegment_MinPosition := UNION(t).(t : C_TrackSegments | {t |-> min(C_TrackSegment_Positions[{t}])} )
;
      V_TrackSegment_MaxPosition := UNION(t).(t : C_TrackSegments | {t |-> max(C_TrackSegment_Positions[{t}])} )
      /* Determine track segment min and max position */
;    V_Rule_TrackSegmentPositions := "SUCCESS"
    ELSE
      V_Rule_TrackSegmentPositions := "FAILED"
    END//IF
  END//SELECT

; Rule_SignalPosition =
  SELECT
    V_Rule_TrackSegmentPositions="SUCCESS" &
    V_Rule_SignalPosition="NOT_CHECKED"
    // this rule should be executed only once
  THEN
    IF
!s.(s : C_Signals => C_Signal_OperationalMeter(s) : V_TrackSegment_MinPosition(C_Signal_TrackSegment(s))..V_TrackSegment_MaxPosition(C_Signal_TrackSegment(s)))
      THEN
V_Rule_SignalPosition:="SUCCESS
ELSE
V_Rule_SignalPosition:="FAILED"
END
END
ASSERTIONS

//TODO Transform all assertions into B operations and store the result value of each evaluation.
// Consider possible dependencies between rules.

// All signals and balise groups must be located between the min position and the max position of the corresponding track segment.
/*label SignalPosition*/
  !s.(s : C_Signals => C_Signal_OperationalMeter(s) : V_TrackSegment_MinPosition(C_Signal_TrackSegment(s))..V_TrackSegment_MaxPosition(C_Signal_TrackSegment(s)))
;
/*label BaliseGroupPosition*/
  !b.(b : C_BaliseGroups
      => C_BaliseGroup_OperationalMeter(b) : V_TrackSegment_MinPosition(C_BaliseGroup_TrackSegment(b))..V_TrackSegment_MaxPosition(C_BaliseGroup_TrackSegment(b)))

;
//  ”Two signals valid for the same direction should not be placed at the same location.” (What does location mean in this context?)
/*@label signal_location */
 !s1,s2.(s1 : C_Signals & s2 : C_Signals & s1 /= s2
   =>
    not(
      C_Signal_TrackSegment(s1) = C_Signal_TrackSegment(s2) &
      C_Signal_OperationalMeter(s1) = C_Signal_OperationalMeter(s2)
    )
  )
;
/*@label signal_location2 */
 !s1,s2.(s1 : C_Signals &
   s2 : C_Signals &
   s1 /= s2 &
   C_Signal_TrackSegment(s1) = C_Signal_TrackSegment(s2)
   =>
    AC_Distance(C_Signal_OperationalMeter(s1), C_Signal_OperationalMeter(s2)) >= 1
  )
;
// . "The adjoining track segments of a points shall have different names."
/*@label PointsTrackSegment*/
  !p.(p : C_Points
    =>
      C_Points_TrackSegmentTongue(p) /= C_Points_TrackSegmentRight(p) &
      C_Points_TrackSegmentTongue(p) /= C_Points_TrackSegmentLeft(p) &
      C_Points_TrackSegmentRight(p) /= C_Points_TrackSegmentLeft(p)
  )
;
// "The adjoining track segments of a connector shall have different names."
/* ConnectorTrackSegments */
  !r.(r : C_Connectors_Records
    => r'trackSegment1 /= r'trackSegment2
  )


END
/*

Unexpected error while parsing machine: 

 Additional information:  Exception in thread "main" java.lang.Error: Using Reader failed
	at de.be4.classicalb.core.parser.BParser.parse(BParser.java:417)
	at de.be4.classicalb.core.parser.BParser.parseFile(BParser.java:165)
	at de.be4.classicalb.core.parser.BParser.parseFile(BParser.java:137)
	at de.be4.classicalb.core.parser.BParser.fullParsing(BParser.java:520)
	at de.prob.cliparser.CliBParser.runPRepl(CliBParser.java:171)
	at de.prob.cliparser.CliBParser.main(CliBParser.java:105)
Caused by: java.io.IOException: Pushback buffer overflow
	at java.io.PushbackReader.unread(Unknown Source)
	at de.be4.classicalb.core.preparser.lexer.Lexer.pushBack(Lexer.java:642)
	at de.be4.classicalb.core.preparser.lexer.Lexer.getToken(Lexer.java:552)
	at de.be4.classicalb.core.preparser.lexer.Lexer.peek(Lexer.java:73)
	at de.be4.classicalb.core.preparser.parser.Parser.parse(Parser.java:257)
	at de.be4.classicalb.core.parser.PreParser.parse(PreParser.java:71)
	at de.be4.classicalb.core.parser.BParser.preParsing(BParser.java:439)
	at de.be4.classicalb.core.parser.BParser.parse(BParser.java:349)
	... 5 more
*/