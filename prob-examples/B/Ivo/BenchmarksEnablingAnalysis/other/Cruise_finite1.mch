/******************************************************************************
VOLVO CRUISE CONTROLLER ABSTRACT MODEL
*
******************************************************************************/

 MACHINE 
    Cruise_finite1

SETS
    RSset = {RSnone, RSpos, RSneg, RSequal};
    ODset = {ODnone, ODclose, ODveryclose}

DEFINITIONS
	CruiseReallyActive == (ObstacleStatusJustChanged = FALSE &
			       CCInitialisationInProgress = FALSE &
			       CruiseSpeedChangeInProgress = FALSE);
  ASSERT_LTL == "G (e(SetCruiseSpeed) => e(CruiseBecomesNotAllowed))";
  ASSERT_LTL1 == "G (e(CruiseBecomesNotAllowed) => e(SetCruiseSpeed))";
  ASSERT_LTL2 == "G (e(CruiseBecomesNotAllowed) => e(ObstacleDisappears))"
/* LTL Formulas
   G (e(SetCruiseSpeed) -> e(CruiseBecomesNotAllowed)) TRUE  (2.62 seconds)
   G (e(CruiseBecomesNotAllowed) -> e(SetCruiseSpeed)) TRUE
   G (e(CruiseBecomesNotAllowed) -> e(ObstacleDisappears))  FALSE
   G (e(CruiseBecomesAllowed) -> X e(SetCruiseSpeed))  FALSE (12.78 seconds)
   G ([CruiseBecomesAllowed] -> X e(SetCruiseSpeed))  TRUE (14.11 seconds)

  G( e(CruiseOff) => Y O [SetCruiseSpeed]) TRUE 12.05 secs (10850 atoms)

G( e(CruiseOff) => O [CruiseBecomesNotAllowed])  -> FALSE
*/
 VARIABLES 
 /* User level variables */ 
    CruiseAllowed, 
    CruiseActive, 
    VehicleAtCruiseSpeed, 
    VehicleCanKeepSpeed, 
    VehicleTryKeepSpeed, 
    SpeedAboveMax,
    VehicleTryKeepTimeGap,
    CruiseSpeedAtMax,
    ObstaclePresent,
    ObstacleDistance,
    ObstacleRelativeSpeed,
	ObstacleStatusJustChanged,
	CCInitialisationInProgress,
	CruiseSpeedChangeInProgress,

 /* Verification support variables */ 
    NumberOfSetCruise 


 INVARIANT 
 /* Typing */ 
    CruiseAllowed:BOOL & 
    CruiseActive:BOOL & 
    VehicleAtCruiseSpeed:BOOL & 
    VehicleCanKeepSpeed:BOOL & 
    VehicleTryKeepSpeed:BOOL & 
    SpeedAboveMax:BOOL & 
    VehicleTryKeepTimeGap:BOOL &
    CruiseSpeedAtMax:BOOL &
    NumberOfSetCruise:NATURAL & 
      NumberOfSetCruise:0..1 & /* added by mal */
    ObstaclePresent:BOOL &
    ObstacleDistance:ODset &
    ObstacleRelativeSpeed:RSset &
	ObstacleStatusJustChanged:BOOL &
	CCInitialisationInProgress:BOOL &
	CruiseSpeedChangeInProgress:BOOL &
 
    /* Consistency */ 
    (CruiseActive = FALSE => VehicleAtCruiseSpeed = FALSE) &
    (CruiseActive = FALSE => VehicleCanKeepSpeed = FALSE) &
    (CruiseActive = FALSE => VehicleTryKeepSpeed = FALSE) &
    ((NumberOfSetCruise = 0) <=> (CruiseActive = FALSE)) &
    (CruiseActive = FALSE => VehicleTryKeepTimeGap = FALSE) &
    (CruiseActive = FALSE => CruiseSpeedAtMax = FALSE) &
    (CruiseActive = FALSE => ObstacleDistance = ODnone ) &
    (CruiseActive = FALSE => ObstacleStatusJustChanged = FALSE) &
    (CruiseActive = FALSE => CCInitialisationInProgress = FALSE) &
    (CruiseActive = FALSE => CruiseSpeedChangeInProgress = FALSE) &
    (ObstaclePresent = FALSE => VehicleTryKeepTimeGap = FALSE) &
    (ObstaclePresent = FALSE => ObstacleDistance = ODnone) &
    (ObstaclePresent = FALSE <=> (ObstacleRelativeSpeed = RSnone)) &
    ((ObstacleRelativeSpeed = RSequal & ObstacleDistance = ODnone)
        => VehicleTryKeepTimeGap = FALSE) &
    ((ObstacleRelativeSpeed = RSneg & ObstacleDistance = ODnone)
        => VehicleTryKeepTimeGap = FALSE) &
    ((ObstacleRelativeSpeed = RSpos & ObstacleDistance /= ODveryclose)
        => VehicleTryKeepTimeGap = FALSE) &

    /* Laws */
    (CruiseAllowed = FALSE => CruiseActive = FALSE) &
    (SpeedAboveMax = TRUE => VehicleAtCruiseSpeed = FALSE) &
    (CruiseActive = TRUE
        => (VehicleTryKeepSpeed = TRUE
			   or VehicleTryKeepTimeGap = TRUE
			   or not(CruiseReallyActive))) &
    (ObstacleDistance = ODnone & CruiseActive = TRUE & CruiseReallyActive
		=> VehicleTryKeepSpeed = TRUE) &
    (ObstacleDistance = ODclose & ObstacleRelativeSpeed /= RSpos & CruiseReallyActive
		=> VehicleTryKeepTimeGap = TRUE) & 
    (ObstacleDistance = ODveryclose & CruiseReallyActive
		=> VehicleTryKeepTimeGap = TRUE) & 
    (ObstacleRelativeSpeed = RSpos & ObstacleDistance /= ODveryclose & CruiseActive = TRUE & CruiseReallyActive
        => VehicleTryKeepSpeed = TRUE)


 INITIALISATION 
    CruiseAllowed := FALSE || 
    CruiseActive := FALSE || 
    VehicleAtCruiseSpeed := FALSE || 
    VehicleCanKeepSpeed := FALSE || 
    VehicleTryKeepSpeed := FALSE || 
    SpeedAboveMax := FALSE || 
    VehicleTryKeepTimeGap := FALSE ||
    NumberOfSetCruise := 0 ||
    CruiseSpeedAtMax:= FALSE ||
    ObstacleDistance := ODnone ||
    ObstacleStatusJustChanged := FALSE ||
    CCInitialisationInProgress := FALSE ||
    CruiseSpeedChangeInProgress := FALSE ||
   ANY op, ors WHERE
        (op: BOOL) &
        (ors : RSset) &
        (op = FALSE <=> (ors = RSnone))
    THEN    
        ObstaclePresent := op ||
        ObstacleRelativeSpeed := ors
    END


 OPERATIONS 
 
    CruiseBecomesNotAllowed =
    SELECT 
        CruiseAllowed = TRUE 
    THEN 
        CruiseAllowed := FALSE || 
        CruiseActive := FALSE || 
        VehicleCanKeepSpeed := FALSE || 
        VehicleTryKeepSpeed := FALSE || 
        VehicleAtCruiseSpeed := FALSE ||
        VehicleTryKeepTimeGap := FALSE || 
        CruiseSpeedAtMax := FALSE ||
        ObstacleDistance := ODnone ||
        NumberOfSetCruise := 0 ||
        ObstacleStatusJustChanged := FALSE ||
        CCInitialisationInProgress := FALSE ||
        CruiseSpeedChangeInProgress := FALSE
    END; 
 
 
    CruiseBecomesAllowed = SELECT 
        CruiseAllowed = FALSE  /* & CruiseAllowed = TRUE */
    THEN 
        CruiseAllowed := TRUE 
    END; 
 
 
    SetCruiseSpeed = SELECT
        CruiseAllowed = TRUE
    THEN 
        CruiseActive := TRUE || 
        VehicleCanKeepSpeed :: BOOL || 

        IF SpeedAboveMax = FALSE THEN 
            VehicleAtCruiseSpeed := TRUE ||
            CruiseSpeedAtMax:: BOOL
        ELSE
            CruiseSpeedAtMax:=TRUE
        END ||
	    ObstacleStatusJustChanged := TRUE ||
	    IF CruiseActive = TRUE THEN
			CruiseSpeedChangeInProgress := TRUE
		ELSE
			CCInitialisationInProgress := TRUE
		END ||
        IF NumberOfSetCruise<1 THEN  /* added my mal */
            NumberOfSetCruise := NumberOfSetCruise + 1
        END
    END;

	
    CCInitialisationFinished = SELECT
	   CCInitialisationInProgress  = TRUE
    THEN
       ANY vtks,vtktg WHERE
           (vtks : BOOL) &
           (vtktg : BOOL) &
           (vtks = TRUE
			   or vtktg = TRUE
			   or ObstacleStatusJustChanged = TRUE
			   or CruiseSpeedChangeInProgress = TRUE) &
           (ObstaclePresent = FALSE => vtktg = FALSE) &
           (ObstacleDistance = ODnone => vtks = TRUE) &
           ((ObstacleDistance = ODclose &
				ObstacleRelativeSpeed /= RSpos &
				ObstacleStatusJustChanged = FALSE &
				CruiseSpeedChangeInProgress = FALSE) 
               => vtktg = TRUE) & 
           ((ObstacleDistance = ODveryclose &
				ObstacleStatusJustChanged = FALSE &
				CruiseSpeedChangeInProgress = FALSE)
			   => vtktg = TRUE) & 
           ((ObstacleRelativeSpeed = RSpos &
				ObstacleDistance /= ODveryclose&
				ObstacleStatusJustChanged = FALSE &
				CruiseSpeedChangeInProgress = FALSE) 
               => vtks = TRUE) &
           ((ObstacleRelativeSpeed = RSequal & ObstacleDistance = ODnone) 
                => vtktg = FALSE) &
           ((ObstacleRelativeSpeed = RSneg & ObstacleDistance = ODnone)
                => vtktg = FALSE) &
           ((ObstacleRelativeSpeed = RSpos & ObstacleDistance /= ODveryclose) 
                => vtktg = FALSE)
        THEN
            VehicleTryKeepTimeGap := vtktg ||
            VehicleTryKeepSpeed := vtks
        END
	END;

	
    CCInitialisationDelayFinished =
	SELECT
		CCInitialisationInProgress = TRUE &
        (VehicleTryKeepSpeed = TRUE
			or VehicleTryKeepTimeGap = TRUE
			or ObstacleStatusJustChanged = TRUE
			or CruiseSpeedChangeInProgress = TRUE) &
		(ObstacleDistance = ODnone  => VehicleTryKeepSpeed = TRUE) &
		((ObstacleDistance = ODclose &
			 ObstacleRelativeSpeed /= RSpos &
			 ObstacleStatusJustChanged = FALSE &
			 CruiseSpeedChangeInProgress = FALSE )
			=> (VehicleTryKeepTimeGap = TRUE)) & 
        ((ObstacleDistance = ODveryclose &
			 ObstacleStatusJustChanged = FALSE &
			 CruiseSpeedChangeInProgress = FALSE)
			=> VehicleTryKeepTimeGap = TRUE) & 
        ((ObstacleRelativeSpeed = RSpos &
			 ObstacleDistance /= ODveryclose &
			 ObstacleStatusJustChanged = FALSE &
			 CruiseSpeedChangeInProgress = FALSE) 
            => VehicleTryKeepSpeed = TRUE)
    THEN
        CCInitialisationInProgress := TRUE
    END;

	
	CruiseSpeedChangeFinished = SELECT
	   CruiseSpeedChangeInProgress  = TRUE
    THEN
       ANY vtks,vtktg WHERE
           (vtks : BOOL) &
           (vtktg : BOOL) &
           (vtks = TRUE
			   or vtktg = TRUE
			   or ObstacleStatusJustChanged = TRUE
			   or CCInitialisationInProgress = TRUE) &
           (ObstaclePresent = FALSE => vtktg = FALSE) &
           (ObstacleDistance = ODnone => vtks = TRUE) &
           ((ObstacleDistance = ODclose &
				ObstacleRelativeSpeed /= RSpos &
				ObstacleStatusJustChanged = FALSE &
				CCInitialisationInProgress = FALSE) 
               => vtktg = TRUE) & 
           ((ObstacleDistance = ODveryclose &
				ObstacleStatusJustChanged = FALSE &
				CCInitialisationInProgress = FALSE)
			   => vtktg = TRUE) & 
           ((ObstacleRelativeSpeed = RSpos &
				ObstacleDistance /= ODveryclose&
				ObstacleStatusJustChanged = FALSE &
				CCInitialisationInProgress = FALSE) 
               => vtks = TRUE) &
           ((ObstacleRelativeSpeed = RSequal & ObstacleDistance = ODnone) 
                => vtktg = FALSE) &
           ((ObstacleRelativeSpeed = RSneg & ObstacleDistance = ODnone)
                => vtktg = FALSE) &
           ((ObstacleRelativeSpeed = RSpos & ObstacleDistance /= ODveryclose) 
                => vtktg = FALSE)
        THEN
            VehicleTryKeepTimeGap := vtktg ||
            VehicleTryKeepSpeed := vtks
        END
	END;

	
    CruiseSpeedChangeDelayFinished =
	SELECT
		CruiseSpeedChangeInProgress = TRUE &
        (VehicleTryKeepSpeed = TRUE
			or VehicleTryKeepTimeGap = TRUE
			or ObstacleStatusJustChanged = TRUE
			or CCInitialisationInProgress = TRUE) &
		(ObstacleDistance = ODnone  => VehicleTryKeepSpeed = TRUE) &
		((ObstacleDistance = ODclose &
			 ObstacleRelativeSpeed /= RSpos &
			 ObstacleStatusJustChanged = FALSE &
			 CCInitialisationInProgress = FALSE )
			=> (VehicleTryKeepTimeGap = TRUE)) & 
        ((ObstacleDistance = ODveryclose &
			 ObstacleStatusJustChanged = FALSE &
			 CCInitialisationInProgress = FALSE)
			=> VehicleTryKeepTimeGap = TRUE) & 
        ((ObstacleRelativeSpeed = RSpos &
			 ObstacleDistance /= ODveryclose &
			 ObstacleStatusJustChanged = FALSE &
			 CCInitialisationInProgress = FALSE) 
            => VehicleTryKeepSpeed = TRUE)
    THEN
       CruiseSpeedChangeInProgress := TRUE
    END;

	
   CruiseOff =
    SELECT 
        CruiseActive = TRUE  
    THEN 
        CruiseActive := FALSE || 
        VehicleCanKeepSpeed := FALSE || 
        VehicleTryKeepSpeed := FALSE || 
        VehicleAtCruiseSpeed := FALSE || 
        VehicleTryKeepTimeGap := FALSE ||
        CruiseSpeedAtMax := FALSE ||
        ObstacleDistance := ODnone ||
        NumberOfSetCruise := 0 ||
        ObstacleStatusJustChanged := FALSE ||
		CCInitialisationInProgress := FALSE ||
		CruiseSpeedChangeInProgress := FALSE
    END; 
 

    ExternalForcesBecomesExtreme = SELECT 
        VehicleCanKeepSpeed = TRUE 
    THEN 
        VehicleCanKeepSpeed := FALSE 
    END; 
 
 
    ExternalForcesBecomesNormal = SELECT 
        CruiseActive = TRUE & 
        VehicleCanKeepSpeed = FALSE 
    THEN 
        VehicleCanKeepSpeed := TRUE 
    END; 
 
 
    VehicleLeavesCruiseSpeed =
    SELECT   
        VehicleAtCruiseSpeed = TRUE & 
        (VehicleCanKeepSpeed = FALSE & VehicleTryKeepSpeed = TRUE) or
        (VehicleTryKeepSpeed = FALSE)
    THEN 
        VehicleAtCruiseSpeed := FALSE 
    END; 
 
 
    VehicleReachesCruiseSpeed = SELECT 
        CruiseActive = TRUE & 
        VehicleAtCruiseSpeed = FALSE & 
        SpeedAboveMax = FALSE 
    THEN  
        VehicleAtCruiseSpeed := TRUE 
    END; 
 
 
    VehicleExceedsMaxCruiseSpeed = SELECT 
        SpeedAboveMax = FALSE & 
        (CruiseActive = FALSE
			or VehicleCanKeepSpeed = FALSE
			or not(CruiseReallyActive))
    THEN 
        SpeedAboveMax := TRUE ||  
        VehicleAtCruiseSpeed := FALSE
    END; 
 
 
    VehicleFallsBelowMaxCruiseSpeed = SELECT 
        SpeedAboveMax = TRUE 
    THEN 
        SpeedAboveMax := FALSE ||
        IF (CruiseActive=TRUE) & (CruiseSpeedAtMax = TRUE) THEN
			VehicleAtCruiseSpeed := TRUE
        END
    END; 

    ObstacleDistanceBecomesVeryClose = SELECT
        ObstacleDistance = ODclose &
	    ObstacleRelativeSpeed = RSneg
    THEN
		ObstacleDistance := ODveryclose ||
        ObstacleStatusJustChanged := TRUE
    END;

    ObstacleDistanceBecomesClose = SELECT
        ObstaclePresent = TRUE &
        CruiseActive = TRUE &
        ((ObstacleDistance = ODveryclose & ObstacleRelativeSpeed = RSpos)
			or (ObstacleDistance = ODnone & ObstacleRelativeSpeed = RSneg))
    THEN
        ObstacleDistance := ODclose ||
        ObstacleStatusJustChanged := TRUE ||
        IF (ObstacleRelativeSpeed = RSpos) THEN
            VehicleTryKeepTimeGap := FALSE
        END
    END;

    ObstacleDistanceBecomesBig = SELECT
        ObstacleDistance = ODclose &
        ObstacleRelativeSpeed = RSpos
    THEN
        ObstacleStatusJustChanged := TRUE ||
        ObstacleDistance := ODnone ||
        VehicleTryKeepTimeGap:= FALSE
    END;


    ObstacleStartsTravelFaster = SELECT
        ObstaclePresent = TRUE &
        ObstacleRelativeSpeed = RSequal
    THEN 
        ObstacleRelativeSpeed := RSpos ||
	    IF CruiseActive = TRUE THEN
			ObstacleStatusJustChanged := TRUE
		END ||
        IF (ObstacleDistance/=ODveryclose) THEN
            VehicleTryKeepTimeGap:=FALSE
        END
    END;

    ObstacleStopsTravelFaster = SELECT
        ObstacleRelativeSpeed = RSpos
    THEN
        ObstacleRelativeSpeed := RSequal ||
	    IF CruiseActive = TRUE THEN
			ObstacleStatusJustChanged := TRUE
		END
    END;


    ObstacleStartsTravelSlower = SELECT
        ObstacleRelativeSpeed = RSequal
    THEN
        ObstacleRelativeSpeed := RSneg ||
 	    IF CruiseActive = TRUE THEN
			ObstacleStatusJustChanged := TRUE
		END
    END;


    ObstacleStopsTravelSlower = SELECT
        ObstacleRelativeSpeed = RSneg
    THEN
        ObstacleRelativeSpeed := RSequal ||
 	    IF CruiseActive = TRUE THEN
			ObstacleStatusJustChanged := TRUE
 		END
	END;
    

    ObstacleAppearsWhenCruiseActive = SELECT
        ObstaclePresent = FALSE &
        CruiseActive = TRUE
    THEN
        ObstaclePresent := TRUE ||
	    ObstacleStatusJustChanged := TRUE ||
        ObstacleRelativeSpeed :: RSset - {RSnone} ||
        ObstacleDistance :: ODset-{ODnone}
    END;


    ObstacleAppearsWhenCruiseInactive = SELECT
        ObstaclePresent = FALSE &
        CruiseActive = FALSE
    THEN
        ObstaclePresent := TRUE ||
        ObstacleRelativeSpeed :: RSset - {RSnone} ||
        ObstacleDistance := ODnone
    END;

    ObstacleDisappears = SELECT 
        ObstaclePresent = TRUE 
    THEN 
        ObstaclePresent := FALSE ||
        ObstacleRelativeSpeed := RSnone ||
  	    IF CruiseActive = TRUE THEN
			ObstacleStatusJustChanged := TRUE
		END ||
        ObstacleDistance := ODnone ||
		VehicleTryKeepTimeGap := FALSE
    END;


    VehicleManageObstacle = SELECT
	    ObstacleStatusJustChanged = TRUE
    THEN
       ANY vtks,vtktg WHERE
           (vtks : BOOL) &
           (vtktg : BOOL) &
           (vtks = TRUE
			   or vtktg = TRUE
			   or CCInitialisationInProgress = TRUE
			   or CruiseSpeedChangeInProgress = TRUE) &
           (ObstaclePresent = FALSE => vtktg = FALSE) &
           (ObstacleDistance = ODnone => vtks = TRUE) &
           ((ObstacleDistance = ODclose &
				ObstacleRelativeSpeed /= RSpos &
				CCInitialisationInProgress = FALSE &
				CruiseSpeedChangeInProgress = FALSE) 
               => vtktg = TRUE) & 
           ((ObstacleDistance = ODveryclose &
				CCInitialisationInProgress = FALSE &
				CruiseSpeedChangeInProgress = FALSE)
			   => vtktg = TRUE) & 
           ((ObstacleRelativeSpeed = RSpos &
				ObstacleDistance /= ODveryclose&
				CCInitialisationInProgress = FALSE &
				CruiseSpeedChangeInProgress = FALSE) 
               => vtks = TRUE) &
           ((ObstacleRelativeSpeed = RSequal & ObstacleDistance = ODnone) 
                => vtktg = FALSE) &
           ((ObstacleRelativeSpeed = RSneg & ObstacleDistance = ODnone)
                => vtktg = FALSE) &
           ((ObstacleRelativeSpeed = RSpos & ObstacleDistance /= ODveryclose) 
                => vtktg = FALSE)
        THEN
            VehicleTryKeepTimeGap := vtktg ||
            VehicleTryKeepSpeed := vtks
        END
	END;


    ObstacleBecomesOld =
	SELECT
		ObstacleStatusJustChanged = TRUE &
        (VehicleTryKeepSpeed = TRUE
			or VehicleTryKeepTimeGap = TRUE
			or CCInitialisationInProgress = TRUE
			or CruiseSpeedChangeInProgress = TRUE) &
		(ObstacleDistance = ODnone  => VehicleTryKeepSpeed = TRUE) &
		((ObstacleDistance = ODclose &
			 ObstacleRelativeSpeed /= RSpos &
			 CCInitialisationInProgress = FALSE &
			 CruiseSpeedChangeInProgress = FALSE )
			=> (VehicleTryKeepTimeGap = TRUE)) & 
        ((ObstacleDistance = ODveryclose &
			 CCInitialisationInProgress = FALSE &
			 CruiseSpeedChangeInProgress = FALSE)
			=> VehicleTryKeepTimeGap = TRUE) & 
        ((ObstacleRelativeSpeed = RSpos &
			 ObstacleDistance /= ODveryclose &
			 CCInitialisationInProgress = FALSE &
			 CruiseSpeedChangeInProgress = FALSE) 
            => VehicleTryKeepSpeed = TRUE)
    THEN
        ObstacleStatusJustChanged:= FALSE
    END
	
END

/*
CTL:
  e(b(\'SetCruiseSpeed\'/0))
  ef(and(e(b(\'SetCruiseSpeed\'/0)),not(e(b(\'CruiseBecomesNotAllowed\'/0))))) 

ProB: has explored all states (1360 states)
No invariant violation or deadlock found

Coverage:
COVERED_OPERATIONS
initialise_machine:4
ObstacleAppearsWhenCruiseInactive:12
CruiseBecomesAllowed:8
ObstacleAppearsWhenCruiseActive:432
ObstacleDistanceBecomesBig:96
VehicleManageObstacle:2208
ObstacleBecomesOld:624
ObstacleDistanceBecomesClose:264
CruiseSpeedChangeFinished:2160
CruiseSpeedChangeDelayFinished:624
VehicleLeavesCruiseSpeed:760
ObstacleStartsTravelFaster:460
ObstacleStartsTravelSlower:460
ExternalForcesBecomesNormal:672
VehicleFallsBelowMaxCruiseSpeed:456
ObstacleDistanceBecomesVeryClose:192
ObstacleStopsTravelSlower:460
CruiseBecomesNotAllowed:1352
SetCruiseSpeed:4504
CCInitialisationFinished:3816
CCInitialisationDelayFinished:1116
CruiseOff:1344
ExternalForcesBecomesExtreme:672
VehicleReachesCruiseSpeed:448
VehicleExceedsMaxCruiseSpeed:904
ObstacleStopsTravelFaster:364
ObstacleDisappears:1284
UNCOVERED_OPERATIONS
-none-


*/