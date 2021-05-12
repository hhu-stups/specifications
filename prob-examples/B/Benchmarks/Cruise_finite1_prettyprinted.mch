
MACHINE Cruise_finite1_pp
SETS /* enumerated */
  RSset={RSnone,RSpos,RSneg,RSequal};
  ODset={ODnone,ODclose,ODveryclose}
ABSTRACT_VARIABLES
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
  NumberOfSetCruise
INVARIANT
    CruiseAllowed : BOOL
  & CruiseActive : BOOL
  & VehicleAtCruiseSpeed : BOOL
  & VehicleCanKeepSpeed : BOOL
  & VehicleTryKeepSpeed : BOOL
  & SpeedAboveMax : BOOL
  & VehicleTryKeepTimeGap : BOOL
  & CruiseSpeedAtMax : BOOL
  & ObstaclePresent : BOOL
  & ObstacleDistance : ODset
  & ObstacleRelativeSpeed : RSset
  & ObstacleStatusJustChanged : BOOL
  & CCInitialisationInProgress : BOOL
  & CruiseSpeedChangeInProgress : BOOL
  & NumberOfSetCruise : NATURAL
  & NumberOfSetCruise : 0 .. 1
  & (
     CruiseActive = FALSE
     =>
     VehicleAtCruiseSpeed = FALSE
    )
  & (
     CruiseActive = FALSE
     =>
     VehicleCanKeepSpeed = FALSE
    )
  & (
     CruiseActive = FALSE
     =>
     VehicleTryKeepSpeed = FALSE
    )
  & (
     (NumberOfSetCruise = 0)
     <=>
     (CruiseActive = FALSE)
    )
  & (
     CruiseActive = FALSE
     =>
     VehicleTryKeepTimeGap = FALSE
    )
  & (
     CruiseActive = FALSE
     =>
     CruiseSpeedAtMax = FALSE
    )
  & (
     CruiseActive = FALSE
     =>
     ObstacleDistance = ODnone
    )
  & (
     CruiseActive = FALSE
     =>
     ObstacleStatusJustChanged = FALSE
    )
  & (
     CruiseActive = FALSE
     =>
     CCInitialisationInProgress = FALSE
    )
  & (
     CruiseActive = FALSE
     =>
     CruiseSpeedChangeInProgress = FALSE
    )
  & (
     ObstaclePresent = FALSE
     =>
     VehicleTryKeepTimeGap = FALSE
    )
  & (
     ObstaclePresent = FALSE
     =>
     ObstacleDistance = ODnone
    )
  & (
     (ObstaclePresent = FALSE)
     <=>
     (ObstacleRelativeSpeed = RSnone)
    )
  & (
     (
      ObstacleRelativeSpeed = RSequal
      &
      ObstacleDistance = ODnone
     )
     =>
     VehicleTryKeepTimeGap = FALSE
    )
  & (
     (
      ObstacleRelativeSpeed = RSneg
      &
      ObstacleDistance = ODnone
     )
     =>
     VehicleTryKeepTimeGap = FALSE
    )
  & (
     (
      ObstacleRelativeSpeed = RSpos
      &
      ObstacleDistance /= ODveryclose
     )
     =>
     VehicleTryKeepTimeGap = FALSE
    )
  & (
     CruiseAllowed = FALSE
     =>
     CruiseActive = FALSE
    )
  & (
     SpeedAboveMax = TRUE
     =>
     VehicleAtCruiseSpeed = FALSE
    )
  & (
     CruiseActive = TRUE
     =>
     (
      VehicleTryKeepSpeed = TRUE
      or
      VehicleTryKeepTimeGap = TRUE
      or
      not(
       ObstacleStatusJustChanged = FALSE
       &
       CCInitialisationInProgress = FALSE
       &
       CruiseSpeedChangeInProgress = FALSE
      )
     )
    )
  & (
     (
      ObstacleDistance = ODnone
      &
      CruiseActive = TRUE
      &
      ObstacleStatusJustChanged = FALSE
      &
      CCInitialisationInProgress = FALSE
      &
      CruiseSpeedChangeInProgress = FALSE
     )
     =>
     VehicleTryKeepSpeed = TRUE
    )
  & (
     (
      ObstacleDistance = ODclose
      &
      ObstacleRelativeSpeed /= RSpos
      &
      ObstacleStatusJustChanged = FALSE
      &
      CCInitialisationInProgress = FALSE
      &
      CruiseSpeedChangeInProgress = FALSE
     )
     =>
     VehicleTryKeepTimeGap = TRUE
    )
  & (
     (
      ObstacleDistance = ODveryclose
      &
      ObstacleStatusJustChanged = FALSE
      &
      CCInitialisationInProgress = FALSE
      &
      CruiseSpeedChangeInProgress = FALSE
     )
     =>
     VehicleTryKeepTimeGap = TRUE
    )
  & (
     (
      ObstacleRelativeSpeed = RSpos
      &
      ObstacleDistance /= ODveryclose
      &
      CruiseActive = TRUE
      &
      ObstacleStatusJustChanged = FALSE
      &
      CCInitialisationInProgress = FALSE
      &
      CruiseSpeedChangeInProgress = FALSE
     )
     =>
     VehicleTryKeepSpeed = TRUE
    )
INITIALISATION
    BEGIN
         CruiseAllowed := FALSE
      ||
         CruiseActive := FALSE
      ||
         VehicleAtCruiseSpeed := FALSE
      ||
         VehicleCanKeepSpeed := FALSE
      ||
         VehicleTryKeepSpeed := FALSE
      ||
         SpeedAboveMax := FALSE
      ||
         VehicleTryKeepTimeGap := FALSE
      ||
         NumberOfSetCruise := 0
      ||
         CruiseSpeedAtMax := FALSE
      ||
         ObstacleDistance := ODnone
      ||
         ObstacleStatusJustChanged := FALSE
      ||
         CCInitialisationInProgress := FALSE
      ||
         CruiseSpeedChangeInProgress := FALSE
      ||
         ANY op,ors
         WHERE
             op : BOOL
           & ors : RSset
           & (
              (op = FALSE)
              <=>
              (ors = RSnone)
             )
         THEN
              ObstaclePresent := op
           ||
              ObstacleRelativeSpeed := ors
         END
    END
OPERATIONS
  CruiseBecomesNotAllowed =
    SELECT
        CruiseAllowed = TRUE
    THEN
         CruiseAllowed := FALSE
      ||
         CruiseActive := FALSE
      ||
         VehicleCanKeepSpeed := FALSE
      ||
         VehicleTryKeepSpeed := FALSE
      ||
         VehicleAtCruiseSpeed := FALSE
      ||
         VehicleTryKeepTimeGap := FALSE
      ||
         CruiseSpeedAtMax := FALSE
      ||
         ObstacleDistance := ODnone
      ||
         NumberOfSetCruise := 0
      ||
         ObstacleStatusJustChanged := FALSE
      ||
         CCInitialisationInProgress := FALSE
      ||
         CruiseSpeedChangeInProgress := FALSE
    END;

  CruiseBecomesAllowed =
    SELECT
        CruiseAllowed = FALSE
    THEN
      CruiseAllowed := TRUE
    END;

  SetCruiseSpeed =
    SELECT
        CruiseAllowed = TRUE
    THEN
         CruiseActive := TRUE
      ||
         VehicleCanKeepSpeed :: BOOL
      ||
         IF SpeedAboveMax = FALSE THEN
              VehicleAtCruiseSpeed := TRUE
           ||
              CruiseSpeedAtMax :: BOOL
         ELSE
           CruiseSpeedAtMax := TRUE
         END
      ||
         ObstacleStatusJustChanged := TRUE
      ||
         IF CruiseActive = TRUE THEN
           CruiseSpeedChangeInProgress := TRUE
         ELSE
           CCInitialisationInProgress := TRUE
         END
      ||
         IF NumberOfSetCruise < 1 THEN
           NumberOfSetCruise := NumberOfSetCruise + 1
         END
    END;

  CCInitialisationFinished =
    SELECT
        CCInitialisationInProgress = TRUE
    THEN
      ANY vtks,vtktg
      WHERE
          vtks : BOOL
        & vtktg : BOOL
        & (
           vtks = TRUE
           or
           vtktg = TRUE
           or
           ObstacleStatusJustChanged = TRUE
           or
           CruiseSpeedChangeInProgress = TRUE
          )
        & (
           ObstaclePresent = FALSE
           =>
           vtktg = FALSE
          )
        & (
           ObstacleDistance = ODnone
           =>
           vtks = TRUE
          )
        & (
           (
            ObstacleDistance = ODclose
            &
            ObstacleRelativeSpeed /= RSpos
            &
            ObstacleStatusJustChanged = FALSE
            &
            CruiseSpeedChangeInProgress = FALSE
           )
           =>
           vtktg = TRUE
          )
        & (
           (
            ObstacleDistance = ODveryclose
            &
            ObstacleStatusJustChanged = FALSE
            &
            CruiseSpeedChangeInProgress = FALSE
           )
           =>
           vtktg = TRUE
          )
        & (
           (
            ObstacleRelativeSpeed = RSpos
            &
            ObstacleDistance /= ODveryclose
            &
            ObstacleStatusJustChanged = FALSE
            &
            CruiseSpeedChangeInProgress = FALSE
           )
           =>
           vtks = TRUE
          )
        & (
           (
            ObstacleRelativeSpeed = RSequal
            &
            ObstacleDistance = ODnone
           )
           =>
           vtktg = FALSE
          )
        & (
           (
            ObstacleRelativeSpeed = RSneg
            &
            ObstacleDistance = ODnone
           )
           =>
           vtktg = FALSE
          )
        & (
           (
            ObstacleRelativeSpeed = RSpos
            &
            ObstacleDistance /= ODveryclose
           )
           =>
           vtktg = FALSE
          )
      THEN
           VehicleTryKeepTimeGap := vtktg
        ||
           VehicleTryKeepSpeed := vtks
      END
    END;

  CCInitialisationDelayFinished =
    SELECT
        CCInitialisationInProgress = TRUE
      & (
         VehicleTryKeepSpeed = TRUE
         or
         VehicleTryKeepTimeGap = TRUE
         or
         ObstacleStatusJustChanged = TRUE
         or
         CruiseSpeedChangeInProgress = TRUE
        )
      & (
         ObstacleDistance = ODnone
         =>
         VehicleTryKeepSpeed = TRUE
        )
      & (
         (
          ObstacleDistance = ODclose
          &
          ObstacleRelativeSpeed /= RSpos
          &
          ObstacleStatusJustChanged = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
         =>
         VehicleTryKeepTimeGap = TRUE
        )
      & (
         (
          ObstacleDistance = ODveryclose
          &
          ObstacleStatusJustChanged = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
         =>
         VehicleTryKeepTimeGap = TRUE
        )
      & (
         (
          ObstacleRelativeSpeed = RSpos
          &
          ObstacleDistance /= ODveryclose
          &
          ObstacleStatusJustChanged = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
         =>
         VehicleTryKeepSpeed = TRUE
        )
    THEN
      CCInitialisationInProgress := TRUE
    END;

  CruiseSpeedChangeFinished =
    SELECT
        CruiseSpeedChangeInProgress = TRUE
    THEN
      ANY vtks,vtktg
      WHERE
          vtks : BOOL
        & vtktg : BOOL
        & (
           vtks = TRUE
           or
           vtktg = TRUE
           or
           ObstacleStatusJustChanged = TRUE
           or
           CCInitialisationInProgress = TRUE
          )
        & (
           ObstaclePresent = FALSE
           =>
           vtktg = FALSE
          )
        & (
           ObstacleDistance = ODnone
           =>
           vtks = TRUE
          )
        & (
           (
            ObstacleDistance = ODclose
            &
            ObstacleRelativeSpeed /= RSpos
            &
            ObstacleStatusJustChanged = FALSE
            &
            CCInitialisationInProgress = FALSE
           )
           =>
           vtktg = TRUE
          )
        & (
           (
            ObstacleDistance = ODveryclose
            &
            ObstacleStatusJustChanged = FALSE
            &
            CCInitialisationInProgress = FALSE
           )
           =>
           vtktg = TRUE
          )
        & (
           (
            ObstacleRelativeSpeed = RSpos
            &
            ObstacleDistance /= ODveryclose
            &
            ObstacleStatusJustChanged = FALSE
            &
            CCInitialisationInProgress = FALSE
           )
           =>
           vtks = TRUE
          )
        & (
           (
            ObstacleRelativeSpeed = RSequal
            &
            ObstacleDistance = ODnone
           )
           =>
           vtktg = FALSE
          )
        & (
           (
            ObstacleRelativeSpeed = RSneg
            &
            ObstacleDistance = ODnone
           )
           =>
           vtktg = FALSE
          )
        & (
           (
            ObstacleRelativeSpeed = RSpos
            &
            ObstacleDistance /= ODveryclose
           )
           =>
           vtktg = FALSE
          )
      THEN
           VehicleTryKeepTimeGap := vtktg
        ||
           VehicleTryKeepSpeed := vtks
      END
    END;

  CruiseSpeedChangeDelayFinished =
    SELECT
        CruiseSpeedChangeInProgress = TRUE
      & (
         VehicleTryKeepSpeed = TRUE
         or
         VehicleTryKeepTimeGap = TRUE
         or
         ObstacleStatusJustChanged = TRUE
         or
         CCInitialisationInProgress = TRUE
        )
      & (
         ObstacleDistance = ODnone
         =>
         VehicleTryKeepSpeed = TRUE
        )
      & (
         (
          ObstacleDistance = ODclose
          &
          ObstacleRelativeSpeed /= RSpos
          &
          ObstacleStatusJustChanged = FALSE
          &
          CCInitialisationInProgress = FALSE
         )
         =>
         VehicleTryKeepTimeGap = TRUE
        )
      & (
         (
          ObstacleDistance = ODveryclose
          &
          ObstacleStatusJustChanged = FALSE
          &
          CCInitialisationInProgress = FALSE
         )
         =>
         VehicleTryKeepTimeGap = TRUE
        )
      & (
         (
          ObstacleRelativeSpeed = RSpos
          &
          ObstacleDistance /= ODveryclose
          &
          ObstacleStatusJustChanged = FALSE
          &
          CCInitialisationInProgress = FALSE
         )
         =>
         VehicleTryKeepSpeed = TRUE
        )
    THEN
      CruiseSpeedChangeInProgress := TRUE
    END;

  CruiseOff =
    SELECT
        CruiseActive = TRUE
    THEN
         CruiseActive := FALSE
      ||
         VehicleCanKeepSpeed := FALSE
      ||
         VehicleTryKeepSpeed := FALSE
      ||
         VehicleAtCruiseSpeed := FALSE
      ||
         VehicleTryKeepTimeGap := FALSE
      ||
         CruiseSpeedAtMax := FALSE
      ||
         ObstacleDistance := ODnone
      ||
         NumberOfSetCruise := 0
      ||
         ObstacleStatusJustChanged := FALSE
      ||
         CCInitialisationInProgress := FALSE
      ||
         CruiseSpeedChangeInProgress := FALSE
    END;

  ExternalForcesBecomesExtreme =
    SELECT
        VehicleCanKeepSpeed = TRUE
    THEN
      VehicleCanKeepSpeed := FALSE
    END;

  ExternalForcesBecomesNormal =
    SELECT
        CruiseActive = TRUE
      & VehicleCanKeepSpeed = FALSE
    THEN
      VehicleCanKeepSpeed := TRUE
    END;

  VehicleLeavesCruiseSpeed =
    SELECT
        (
         (
          VehicleAtCruiseSpeed = TRUE
          &
          VehicleCanKeepSpeed = FALSE
          &
          VehicleTryKeepSpeed = TRUE
         )
         or
         VehicleTryKeepSpeed = FALSE
        )
    THEN
      VehicleAtCruiseSpeed := FALSE
    END;

  VehicleReachesCruiseSpeed =
    SELECT
        CruiseActive = TRUE
      & VehicleAtCruiseSpeed = FALSE
      & SpeedAboveMax = FALSE
    THEN
      VehicleAtCruiseSpeed := TRUE
    END;

  VehicleExceedsMaxCruiseSpeed =
    SELECT
        SpeedAboveMax = FALSE
      & (
         CruiseActive = FALSE
         or
         VehicleCanKeepSpeed = FALSE
         or
         not(
          ObstacleStatusJustChanged = FALSE
          &
          CCInitialisationInProgress = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
        )
    THEN
         SpeedAboveMax := TRUE
      ||
         VehicleAtCruiseSpeed := FALSE
    END;

  VehicleFallsBelowMaxCruiseSpeed =
    SELECT
        SpeedAboveMax = TRUE
    THEN
         SpeedAboveMax := FALSE
      ||
         IF CruiseActive = TRUE & CruiseSpeedAtMax = TRUE THEN
           VehicleAtCruiseSpeed := TRUE
         END
    END;

  ObstacleDistanceBecomesVeryClose =
    SELECT
        ObstacleDistance = ODclose
      & ObstacleRelativeSpeed = RSneg
    THEN
         ObstacleDistance := ODveryclose
      ||
         ObstacleStatusJustChanged := TRUE
    END;

  ObstacleDistanceBecomesClose =
    SELECT
        ObstaclePresent = TRUE
      & CruiseActive = TRUE
      & (
         (
          ObstacleDistance = ODveryclose
          &
          ObstacleRelativeSpeed = RSpos
         )
         or
         (
          ObstacleDistance = ODnone
          &
          ObstacleRelativeSpeed = RSneg
         )
        )
    THEN
         ObstacleDistance := ODclose
      ||
         ObstacleStatusJustChanged := TRUE
      ||
         IF ObstacleRelativeSpeed = RSpos THEN
           VehicleTryKeepTimeGap := FALSE
         END
    END;

  ObstacleDistanceBecomesBig =
    SELECT
        ObstacleDistance = ODclose
      & ObstacleRelativeSpeed = RSpos
    THEN
         ObstacleStatusJustChanged := TRUE
      ||
         ObstacleDistance := ODnone
      ||
         VehicleTryKeepTimeGap := FALSE
    END;

  ObstacleStartsTravelFaster =
    SELECT
        ObstaclePresent = TRUE
      & ObstacleRelativeSpeed = RSequal
    THEN
         ObstacleRelativeSpeed := RSpos
      ||
         IF CruiseActive = TRUE THEN
           ObstacleStatusJustChanged := TRUE
         END
      ||
         IF ObstacleDistance /= ODveryclose THEN
           VehicleTryKeepTimeGap := FALSE
         END
    END;

  ObstacleStopsTravelFaster =
    SELECT
        ObstacleRelativeSpeed = RSpos
    THEN
         ObstacleRelativeSpeed := RSequal
      ||
         IF CruiseActive = TRUE THEN
           ObstacleStatusJustChanged := TRUE
         END
    END;

  ObstacleStartsTravelSlower =
    SELECT
        ObstacleRelativeSpeed = RSequal
    THEN
         ObstacleRelativeSpeed := RSneg
      ||
         IF CruiseActive = TRUE THEN
           ObstacleStatusJustChanged := TRUE
         END
    END;

  ObstacleStopsTravelSlower =
    SELECT
        ObstacleRelativeSpeed = RSneg
    THEN
         ObstacleRelativeSpeed := RSequal
      ||
         IF CruiseActive = TRUE THEN
           ObstacleStatusJustChanged := TRUE
         END
    END;

  ObstacleAppearsWhenCruiseActive =
    SELECT
        ObstaclePresent = FALSE
      & CruiseActive = TRUE
    THEN
         ObstaclePresent := TRUE
      ||
         ObstacleStatusJustChanged := TRUE
      ||
         ObstacleRelativeSpeed :: RSset - {RSnone}
      ||
         ObstacleDistance :: ODset - {ODnone}
    END;

  ObstacleAppearsWhenCruiseInactive =
    SELECT
        ObstaclePresent = FALSE
      & CruiseActive = FALSE
    THEN
         ObstaclePresent := TRUE
      ||
         ObstacleRelativeSpeed :: RSset - {RSnone}
      ||
         ObstacleDistance := ODnone
    END;

  ObstacleDisappears =
    SELECT
        ObstaclePresent = TRUE
    THEN
         ObstaclePresent := FALSE
      ||
         ObstacleRelativeSpeed := RSnone
      ||
         IF CruiseActive = TRUE THEN
           ObstacleStatusJustChanged := TRUE
         END
      ||
         ObstacleDistance := ODnone
      ||
         VehicleTryKeepTimeGap := FALSE
    END;

  VehicleManageObstacle =
    SELECT
        ObstacleStatusJustChanged = TRUE
    THEN
      ANY vtks,vtktg
      WHERE
          vtks : BOOL
        & vtktg : BOOL
        & (
           vtks = TRUE
           or
           vtktg = TRUE
           or
           CCInitialisationInProgress = TRUE
           or
           CruiseSpeedChangeInProgress = TRUE
          )
        & (
           ObstaclePresent = FALSE
           =>
           vtktg = FALSE
          )
        & (
           ObstacleDistance = ODnone
           =>
           vtks = TRUE
          )
        & (
           (
            ObstacleDistance = ODclose
            &
            ObstacleRelativeSpeed /= RSpos
            &
            CCInitialisationInProgress = FALSE
            &
            CruiseSpeedChangeInProgress = FALSE
           )
           =>
           vtktg = TRUE
          )
        & (
           (
            ObstacleDistance = ODveryclose
            &
            CCInitialisationInProgress = FALSE
            &
            CruiseSpeedChangeInProgress = FALSE
           )
           =>
           vtktg = TRUE
          )
        & (
           (
            ObstacleRelativeSpeed = RSpos
            &
            ObstacleDistance /= ODveryclose
            &
            CCInitialisationInProgress = FALSE
            &
            CruiseSpeedChangeInProgress = FALSE
           )
           =>
           vtks = TRUE
          )
        & (
           (
            ObstacleRelativeSpeed = RSequal
            &
            ObstacleDistance = ODnone
           )
           =>
           vtktg = FALSE
          )
        & (
           (
            ObstacleRelativeSpeed = RSneg
            &
            ObstacleDistance = ODnone
           )
           =>
           vtktg = FALSE
          )
        & (
           (
            ObstacleRelativeSpeed = RSpos
            &
            ObstacleDistance /= ODveryclose
           )
           =>
           vtktg = FALSE
          )
      THEN
           VehicleTryKeepTimeGap := vtktg
        ||
           VehicleTryKeepSpeed := vtks
      END
    END;

  ObstacleBecomesOld =
    SELECT
        ObstacleStatusJustChanged = TRUE
      & (
         VehicleTryKeepSpeed = TRUE
         or
         VehicleTryKeepTimeGap = TRUE
         or
         CCInitialisationInProgress = TRUE
         or
         CruiseSpeedChangeInProgress = TRUE
        )
      & (
         ObstacleDistance = ODnone
         =>
         VehicleTryKeepSpeed = TRUE
        )
      & (
         (
          ObstacleDistance = ODclose
          &
          ObstacleRelativeSpeed /= RSpos
          &
          CCInitialisationInProgress = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
         =>
         VehicleTryKeepTimeGap = TRUE
        )
      & (
         (
          ObstacleDistance = ODveryclose
          &
          CCInitialisationInProgress = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
         =>
         VehicleTryKeepTimeGap = TRUE
        )
      & (
         (
          ObstacleRelativeSpeed = RSpos
          &
          ObstacleDistance /= ODveryclose
          &
          CCInitialisationInProgress = FALSE
          &
          CruiseSpeedChangeInProgress = FALSE
         )
         =>
         VehicleTryKeepSpeed = TRUE
        )
    THEN
      ObstacleStatusJustChanged := FALSE
    END
END
