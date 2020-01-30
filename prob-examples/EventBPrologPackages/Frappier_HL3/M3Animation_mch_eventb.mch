
MACHINE M3Animation_mch_eventb
SETS /* deferred */
  TTDS
 ; /* enumerated */
  StateTTD={freeT,occupiedT};
  TRAINS={t1,t2};
  TrainKind={Ertms,NoErtms};
  StateVSS={freeV,occupiedV,unknown,ambiguous}
CONCRETE_CONSTANTS
  Cars,
  Trains,
  Ttds,
  maxTTD,
  minTTD,
  trainKind,
  TtdOfVss,
  Vss,
  maxVSS,
  minVSS
ABSTRACT_VARIABLES
  MATrainFront,
  MATrainRear,
  currentStateVSS,
  disconnectTimer,
  disconnectTimerTrain,
  ghostTimer,
  integrityLostTimer,
  integrityLostTrain,
  integrityLostTrainVSS,
  integrityTimer,
  lengthChange,
  muteTimer,
  previousFront,
  previousFrontState,
  trainIntegrity,
  trainLocationVSSFront,
  trainLocationVSSRear,
  trainOccupationVSSFront,
  trainOccupationVSSRear,
  trainLocationTTDFront,
  trainLocationTTDRear,
  isConnected,
  stateTTD,
  trainMvt,
  trainOccupationTTDFront,
  trainOccupationTTDRear
/* PROMOTED OPERATIONS
  trainSupervisor,
  trainEntring,
  trainMovingInSameTTD,
  trainMovingFrontNextTTD,
  trainMovingRearNextTTD,
  trainExiting,
  trainSnd,
  trainConnect,
  trainDisconnect,
  assignMALocatedTrain,
  assignMAToEnter,
  muteTimerExpire,
  integrityTimerExpire,
  disconectTimerExpire,
  ghostTimerExpire,
  trainSplit */
PROPERTIES
    Cars : POW(TRAINS)
  & Trains : POW(TRAINS)
  & Ttds : POW(INTEGER)
  & Vss : POW(INTEGER)
  & /* @C0:axm2  */ (TRAINS = Trains\/Cars & Trains/\Cars = {})
  & /* @C0:axm4  */ minTTD : NATURAL1
  & /* @C0:axm5  */ maxTTD : NATURAL1
  & /* @C0:axm6  */ minTTD <= maxTTD
  & /* @C0:axm7  */ Ttds = minTTD .. maxTTD
  & /* @C0:axm9  */ trainKind : Trains --> TrainKind
  & /* @C1:axm1  */ minVSS : NATURAL1
  & /* @C1:axm2  */ maxVSS : NATURAL1
  & /* @C1:axm3  */ minVSS <= maxVSS
  & /* @C1:axm4  */ Vss = minVSS .. maxVSS
  & /* @C1:axm5  */ TtdOfVss : Vss -->> Ttds
  & /* @C1:axm6  */ !v1.(v1 : Vss => /* @C1:axm6  */ !v2.(v2 : Vss & v1 < v2 => TtdOfVss(v1) <= TtdOfVss(v2)))
  & /* @C1:axm7  */ TtdOfVss(minVSS) = minTTD
  & /* @C1:axm8  */ TtdOfVss(maxVSS) = maxTTD
  & /* @C1:axm9  */ finite(Vss)
  & /* @animation:axm1  */ TtdOfVss = #8:{(1|->1),...,(8|->3)}
  & /* @animation:axm3  */ trainKind = {t1 |-> Ertms,t2 |-> NoErtms}
INVARIANT
    trainMvt : BOOL
  & /* @M3:inv1  */ MATrainRear : TRAINS +-> Vss
  & /* @M3:inv2  */ MATrainFront : dom(MATrainRear) --> Vss
  & /* @M3:inv3  */ !tr.(tr : dom(MATrainRear) => MATrainRear(tr) <= MATrainFront(tr))
  & /* @M3:inv4  */ !tr1.(tr1 : dom(MATrainFront) => /* @M3:inv4  */ !tr2.(tr2 : dom(MATrainFront) & tr1 /= tr2 & 1=1 /* LEQ_SYM_BREAK(tr1,tr2) */ => MATrainRear(tr1) .. MATrainFront(tr1) /\ MATrainRear(tr2) .. MATrainFront(tr2) = {}))
  & /* @M3:inv5  */ currentStateVSS : Vss --> StateVSS
  & /* @M3:inv6  */ muteTimer : dom(trainLocationVSSFront) --> BOOL
  & /* @M3:inv7  */ integrityTimer : dom(trainLocationVSSFront) --> BOOL
  & /* @M3:inv8  */ integrityLostTrain : Trains --> BOOL
  & /* @M3:inv9  */ integrityLostTimer : Vss --> #3:{-1,...,1}
  & /* @M3:inv10  */ integrityLostTrainVSS : Vss +-> (lengthChange~)[{TRUE}] \/ ((muteTimer~)[{FALSE}] \/ (integrityLostTrain~)[{TRUE}])
  & /* @M3:inv11  */ disconnectTimer : Vss --> #3:{-1,...,1}
  & /* @M3:inv12  */ disconnectTimerTrain : (disconnectTimer~)[{0,1}] --> TRAINS
  & /* @M3:inv13  */ previousFront : dom(trainLocationVSSFront) +-> Vss
  & /* @M3:inv14  */ previousFrontState : dom(previousFront) +-> StateVSS
  & /* @M3:inv15  */ ghostTimer : Ttds --> #3:{-1,...,1}
  & /* @M3:inv16  */ trainIntegrity : dom(trainLocationVSSFront) --> BOOL
  & /* @M3:inv17  */ lengthChange : dom(trainLocationVSSFront) --> BOOL
  & /* @M2:inv1  */ TtdOfVss : Vss -->> Ttds
  & /* @M2:inv2  */ trainLocationVSSFront : dom(trainLocationTTDFront) --> Vss
  & /* @M2:inv3  */ trainLocationVSSRear : dom(trainLocationTTDFront) --> Vss
  & /* @M2:inv4  */ trainOccupationVSSFront : dom(trainOccupationTTDFront) --> Vss
  & /* @M2:inv5  */ trainOccupationVSSRear : dom(trainOccupationTTDFront) --> Vss
  & /* @M2:inv6  */ !tr.(tr : dom(trainOccupationVSSFront) => TtdOfVss(trainOccupationVSSFront(tr)) = trainOccupationTTDFront(tr))
  & /* @M2:inv7  */ !tr.(tr : dom(trainOccupationVSSRear) => TtdOfVss(trainOccupationVSSRear(tr)) = trainOccupationTTDRear(tr))
  & /* @M2:inv8  */ !tr.(tr : dom(trainLocationVSSRear) => TtdOfVss(trainLocationVSSRear(tr)) = trainLocationTTDRear(tr))
  & /* @M2:inv9  */ !tr.(tr : dom(trainOccupationVSSFront) => trainOccupationVSSRear(tr) <= trainOccupationVSSFront(tr))
  & /* @M2:inv10  */ !tr.(tr : dom(trainLocationVSSFront) => TtdOfVss(trainLocationVSSFront(tr)) = trainLocationTTDFront(tr))
  & /* @M2:inv11  */ !tr.(tr : dom(trainLocationVSSFront) => trainLocationVSSFront(tr) >= trainLocationVSSRear(tr))
  & /* @M1:inv1  */ trainLocationTTDFront : dom(Trains <| trainOccupationTTDFront) +-> Ttds
  & /* @M1:inv2  */ trainLocationTTDRear : dom(trainLocationTTDFront) --> Ttds
  & /* @M1:inv3  */ !tr.(tr : dom(trainLocationTTDFront) => trainLocationTTDRear(tr) <= trainLocationTTDFront(tr))
  & /* @M0:inv1  */ stateTTD : Ttds --> StateTTD
  & /* @M0:inv2  */ trainOccupationTTDFront : TRAINS +-> Ttds
  & /* @M0:inv3  */ trainOccupationTTDRear : dom(trainOccupationTTDFront) --> Ttds
  & /* @M0:inv4  */ !tr.(tr : dom(trainOccupationTTDFront) => trainOccupationTTDRear(tr) <= trainOccupationTTDFront(tr))
  & /* @M0:inv5  */ isConnected : (trainKind~)[{Ertms}] --> BOOL
INITIALISATION
    BEGIN
         stateTTD := Ttds * {occupiedT}
      ||
         isConnected := (trainKind~)[{Ertms}] * {FALSE}
      ||
         trainMvt := FALSE
      ||
         trainLocationVSSFront := {}
      ||
         trainOccupationVSSFront := {}
      ||
         trainLocationVSSRear := {}
      ||
         trainOccupationVSSRear := {}
      ||
         MATrainRear := {}
      ||
         MATrainFront := {}
      ||
         currentStateVSS := Vss * {unknown}
      ||
         muteTimer := {}
      ||
         integrityTimer := {}
      ||
         ghostTimer := Ttds * {-1}
      ||
         disconnectTimer := Vss * {-1}
      ||
         disconnectTimerTrain := {}
      ||
         previousFront := {}
      ||
         previousFrontState := {}
      ||
         integrityLostTimer := Vss * {-1}
      ||
         integrityLostTrain := Trains * {FALSE}
      ||
         trainIntegrity := {}
      ||
         lengthChange := {}
      ||
         integrityLostTrainVSS := {}
    END
OPERATIONS
  trainSupervisor = 
    ANY active,ghostTtds,integrityLostTimerStart,integrityLostTimerStop,stateVSS,ttds,vss10A,vss1A,vss1B,vss1C,vss1D,vss1E,vss1F,vss2A,vss2B,vss3A,vss4_6_9A,vss5A,vss6B,vss8B
    WHERE 
        active : BOOL
      & ghostTtds : POW(INTEGER)
      & integrityLostTimerStart : POW(TRAINS)
      & integrityLostTimerStop : POW(TRAINS)
      & stateVSS : POW(INTEGER * StateVSS)
      & ttds : POW(INTEGER)
      & vss10A : POW(INTEGER * StateVSS)
      & vss1A : POW(INTEGER * StateVSS)
      & vss1B : POW(INTEGER * StateVSS)
      & vss1C : POW(INTEGER * StateVSS)
      & vss1D : POW(INTEGER * StateVSS)
      & vss1E : POW(INTEGER * StateVSS)
      & vss1F : POW(INTEGER * StateVSS)
      & vss2A : POW(INTEGER * StateVSS)
      & vss2B : POW(INTEGER * StateVSS)
      & vss3A : POW(INTEGER * StateVSS)
      & vss4_6_9A : POW(INTEGER * StateVSS)
      & vss5A : POW(INTEGER * StateVSS)
      & vss6B : POW(INTEGER * StateVSS)
      & vss8B : POW(INTEGER * StateVSS)
      & /* @M3Animation:grd1  */ ttds = union({RANGE_LAMBDA|RANGE_LAMBDA : POW(INTEGER) & #tr.(tr : dom(trainOccupationVSSFront) & RANGE_LAMBDA = TtdOfVss(trainOccupationVSSRear(tr)) .. TtdOfVss(trainOccupationVSSFront(tr)))})
      & /* @M3Animation:grd2  */ ghostTtds = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #td.(td : ttds - (stateTTD~)[{occupiedT}] & (!tr.(tr : dom(trainLocationVSSFront) => td /: TtdOfVss(trainLocationVSSRear(tr)) .. TtdOfVss(trainLocationVSSFront(tr))) or !tr.(tr : dom(MATrainFront) => td /: TtdOfVss(MATrainRear(tr)) .. TtdOfVss(MATrainFront(tr)))) & RANGE_LAMBDA = td)}
      & /* @M3Animation:grd3  */ active = bool(stateVSS <: currentStateVSS & ttds * {occupiedT} \/ (Ttds - ttds) * {freeT} = stateTTD)
      & /* @M3Animation:grd4  */ vss1A = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & (!tr.(tr : dom(trainLocationVSSFront) => TtdOfVss(vs) /: TtdOfVss(trainLocationVSSRear(tr)) .. TtdOfVss(trainLocationVSSFront(tr))) or !tr.(tr : dom(MATrainFront) => TtdOfVss(vs) /: TtdOfVss(MATrainRear(tr)) .. TtdOfVss(MATrainFront(tr)))) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd5  */ vss1B = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & #tr.(tr : dom(muteTimer) & (muteTimer(tr) = FALSE & (tr : dom(MATrainFront) & vs : MATrainRear(tr) .. MATrainFront(tr))) & (tr : dom(previousFront) => vs >= previousFront(tr))) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd6  */ vss1C = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & #vs1.(vs1 |-> TtdOfVss(vs) : TtdOfVss & (vs1 : dom(disconnectTimer) & (disconnectTimer(vs1) = 0 & (vs1 /= vs & currentStateVSS[vs + 1 .. vs1 - 1 \/ vs1 + 1 .. vs - 1] <: {freeV,unknown})))) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd7  */ vss1D = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & !tr.(tr : dom(MATrainFront) => vs /: MATrainRear(tr) .. MATrainFront(tr)) & #vs1.(vs1 : dom(disconnectTimer) & disconnectTimer(vs1) = 0 & vs1 /: (TtdOfVss~)[{TtdOfVss(vs)}] & vs1 /= vs & currentStateVSS[vs .. vs1 \/ vs1 .. vs] <: {freeV,unknown}) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd8  */ vss1E = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & #vs1.(vs1 : dom(integrityLostTimer) & (integrityLostTimer(vs1) = 0 & (vs1 |-> TtdOfVss(vs) : TtdOfVss & (vs1 /= vs & currentStateVSS[vs .. vs1 \/ vs1 .. vs] <: {freeV,unknown})))) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd9  */ vss1F = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & #td.(td : dom(ghostTimer) & (ghostTimer(td) = 0 & (vs /: (TtdOfVss~)[{td}] & currentStateVSS[max((TtdOfVss~)[{td}]) + 1 .. vs - 1 \/ vs + 1 .. min((TtdOfVss~)[{td}]) - 1] <: {freeV,unknown}))) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd10  */ vss2A = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & #tr.(tr : dom(trainLocationVSSRear) & (vs : trainLocationVSSRear(tr) .. trainLocationVSSFront(tr) & (tr : dom(previousFrontState) => previousFrontState(tr) = occupiedV & currentStateVSS(previousFront(tr)) /= unknown))) & RANGE_LAMBDA = vs)} * {occupiedV}
      & /* @M3Animation:grd11  */ vss2B = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & TtdOfVss(vs) - 1 /: ttds & vs = min((TtdOfVss~)[{TtdOfVss(vs)}]) & #tr.(tr : dom(trainLocationVSSFront) & (((TtdOfVss~)[{TtdOfVss(vs) - 1}] /\ trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) /= {} & ((TtdOfVss~)[{TtdOfVss(vs)}] /\ trainLocationVSSRear(tr) .. trainLocationVSSFront(tr) = {} & (tr : dom(previousFrontState) & (previousFrontState(tr) = occupiedV & currentStateVSS(previousFront(tr)) /= unknown))))) & RANGE_LAMBDA = vs)} * {occupiedV}
      & /* @M3Animation:grd12  */ vss3A = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : (TtdOfVss~)[(stateTTD~)[{occupiedT}]] & currentStateVSS(vs) = freeV & #tr.(tr : dom(trainLocationVSSFront) & vs : trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) & RANGE_LAMBDA = vs)} * {ambiguous}
      & /* @M3Animation:grd13  */ vss4_6_9A = (TtdOfVss~)[(stateTTD~)[{freeT}]] * {freeV}
      & /* @M3Animation:grd14  */ vss5A = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : Vss & currentStateVSS(vs) = unknown & #tr.(tr : dom(trainLocationVSSFront) & vs : trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) & RANGE_LAMBDA = vs)} * {ambiguous}
      & /* @M3Animation:grd15  */ vss6B = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : Vss & currentStateVSS(vs) = occupiedV & !tr.(tr : dom(trainLocationVSSFront) => vs /: trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) & RANGE_LAMBDA = vs)} * {freeV}
      & /* @M3Animation:grd16  */ vss8B = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : Vss & currentStateVSS(vs) = occupiedV & #tr.(tr : dom(trainLocationVSSFront) & vs : trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) & currentStateVSS[{vs - 1}] = {unknown} & RANGE_LAMBDA = vs)} * {ambiguous}
      & /* @M3Animation:grd17  */ vss10A = {RANGE_LAMBDA|RANGE_LAMBDA : INTEGER & #vs.(vs : Vss & currentStateVSS(vs) = ambiguous & !tr.(tr : dom(trainLocationVSSFront) => vs /: trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) & RANGE_LAMBDA = vs)} * {unknown}
      & /* @M3Animation:grd18  */ integrityLostTimerStart = {RANGE_LAMBDA|RANGE_LAMBDA : TRAINS & #tr.(tr : dom(trainLocationVSSFront) & (integrityLostTrain(tr) = TRUE or muteTimer(tr) = FALSE) & RANGE_LAMBDA = tr)}
      & /* @M3Animation:grd19  */ integrityLostTimerStop = {RANGE_LAMBDA|RANGE_LAMBDA : TRAINS & #tr.(tr : dom(trainLocationVSSFront) & integrityLostTrain(tr) = TRUE & trainIntegrity(tr) = TRUE & lengthChange(tr) = FALSE & RANGE_LAMBDA = tr)}
      & /* @M3Animation:grd20  */ stateVSS = ((vss1B \/ (vss1C \/ (vss1D \/ (vss1E \/ vss1F)))) <+ (vss1A \/ (vss3A <+ (vss2B \/ vss2A)))) \/ (vss6B \/ (vss8B \/ (vss4_6_9A \/ (vss10A \/ vss5A))))
    THEN
         stateTTD := ttds * {occupiedT} \/ (Ttds - ttds) * {freeT}
      ||
         trainMvt := active
      ||
         currentStateVSS := currentStateVSS <+ stateVSS
      ||
         ghostTimer := (Ttds - ghostTtds) * {-1} \/ ghostTtds * {1}
      ||
         previousFront := {RANGE_LAMBDA|RANGE_LAMBDA : TRAINS * INTEGER & #tr.(tr : dom(trainLocationVSSFront) & RANGE_LAMBDA = tr |-> trainLocationVSSFront(tr))}
      ||
         integrityLostTimer := integrityLostTimer <+ union({RANGE_LAMBDA|RANGE_LAMBDA : POW(INTEGER) & #tr.(tr : integrityLostTimerStop & RANGE_LAMBDA = trainLocationVSSRear(tr) .. trainLocationVSSFront(tr))}) * {-1} <+ union({RANGE_LAMBDA|RANGE_LAMBDA : POW(INTEGER) & #tr.(tr : integrityLostTimerStop & RANGE_LAMBDA = trainLocationVSSRear(tr) .. trainLocationVSSFront(tr))}) * {-1}
      ||
         integrityLostTrainVSS := (integrityLostTrainVSS |>> integrityLostTimerStop) \/ union({RANGE_LAMBDA|RANGE_LAMBDA : POW(INTEGER * TRAINS) & #tr.(tr : integrityLostTimerStart & RANGE_LAMBDA = (trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) * {tr})})
      ||
         integrityLostTrain := integrityLostTrain <+ (integrityLostTimerStop * {FALSE} <+ integrityLostTimerStart * {TRUE})
    END;
  
  trainEntring = 
    ANY tr
    WHERE 
        /* @M3Animation:grd1  */ trainMvt = TRUE
      & /* @M3Animation:grd2  */ tr : TRAINS - dom(trainOccupationVSSFront)
      & /* @M3Animation:grd3  */ tr : Trains
      & (/* @M3Animation:grd4  */ trainKind(tr) = Ertms => isConnected(tr) = TRUE)
      & (/* @M3Animation:grd5  */ trainKind(tr) = Ertms => tr : dom(MATrainFront) & minVSS : MATrainRear(tr) .. MATrainFront(tr))
    THEN
         trainMvt := FALSE
      ||
         trainOccupationVSSFront := trainOccupationVSSFront <+ {tr |-> minVSS}
      ||
         trainOccupationVSSRear := trainOccupationVSSRear <+ {tr |-> minVSS}
    END;
  
  trainMovingInSameTTD = 
    ANY currentVSSFront,currentVSSRear,newposVSSFront,newposVSSSRear,tr
    WHERE 
        currentVSSFront : INTEGER
      & currentVSSRear : INTEGER
      & newposVSSFront : INTEGER
      & newposVSSSRear : INTEGER
      & /* @M3Animation:grd1  */ tr : dom(trainOccupationVSSFront)
      & /* @M3Animation:grd2  */ trainMvt = TRUE
      & /* @M3Animation:grd3  */ tr : dom(trainOccupationVSSFront)
      & currentVSSRear = trainOccupationVSSRear(tr)
      & currentVSSFront = trainOccupationVSSFront(tr)
      & /* @M3Animation:grd5  */ tr : Trains
      & /* @M3Animation:grd6  */ newposVSSSRear |-> newposVSSFront : {TRUE |-> {currentVSSRear |-> currentVSSFront + 1},FALSE |-> {}}(bool(currentVSSFront < max((TtdOfVss~)[{TtdOfVss(currentVSSFront)}]))) \/ {TRUE |-> {currentVSSRear + 1 |-> currentVSSFront},FALSE |-> {}}(bool(currentVSSRear < max((TtdOfVss~)[{TtdOfVss(currentVSSRear)}]) & currentVSSRear < currentVSSFront))
      & (/* @M3Animation:grd7  */ tr : dom(MATrainFront) => newposVSSSRear .. newposVSSFront <: MATrainRear(tr) .. MATrainFront(tr))
    THEN
         trainMvt := FALSE
      ||
         trainOccupationVSSRear := trainOccupationVSSRear <+ {tr |-> newposVSSSRear}
      ||
         trainOccupationVSSFront := trainOccupationVSSFront <+ {tr |-> newposVSSFront}
    END;
  
  trainMovingFrontNextTTD = 
    ANY newFrontVSS,tr
    WHERE 
        newFrontVSS : INTEGER
      & /* @M3Animation:grd1  */ tr : dom(trainOccupationVSSFront)
      & /* @M3Animation:grd2  */ tr : Trains
      & /* @M3Animation:grd3  */ TtdOfVss(trainOccupationVSSFront(tr)) < maxTTD
      & /* @M3Animation:grd4  */ newFrontVSS = min((TtdOfVss~)[{TtdOfVss(trainOccupationVSSFront(tr)) + 1}])
      & /* @M3Animation:grd5  */ trainMvt = TRUE
      & /* @M3Animation:grd6  */ trainOccupationVSSFront(tr) = max((TtdOfVss~)[{TtdOfVss(trainOccupationVSSFront(tr))}])
      & (/* @M3Animation:grd7  */ tr : dom(trainLocationVSSFront) => newFrontVSS >= trainLocationVSSFront(tr))
      & (/* @M3Animation:grd8  */ tr : dom(isConnected) => tr : dom(MATrainFront))
      & (/* @M3Animation:grd9  */ tr : dom(MATrainFront) => min((TtdOfVss~)[{TtdOfVss(trainOccupationVSSFront(tr)) + 1}]) <= MATrainFront(tr))
    THEN
         trainOccupationVSSFront := trainOccupationVSSFront <+ {tr |-> newFrontVSS}
      ||
         trainMvt := FALSE
    END;
  
  trainMovingRearNextTTD = 
    ANY newRearVSS,tr
    WHERE 
        newRearVSS : INTEGER
      & /* @M3Animation:grd1  */ tr : dom(trainOccupationVSSFront)
      & /* @M3Animation:grd2  */ tr : Trains
      & /* @M3Animation:grd3  */ TtdOfVss(trainOccupationVSSRear(tr)) < TtdOfVss(trainOccupationVSSFront(tr))
      & /* @M3Animation:grd4  */ newRearVSS = min((TtdOfVss~)[{TtdOfVss(trainOccupationVSSRear(tr)) + 1}])
      & (/* @M3Animation:grd5  */ tr : dom(trainLocationVSSFront) => trainOccupationVSSFront(tr) >= trainLocationVSSFront(tr))
      & /* @M3Animation:grd6  */ trainMvt = TRUE
      & /* @M3Animation:grd7  */ trainOccupationVSSRear(tr) = max((TtdOfVss~)[{TtdOfVss(trainOccupationVSSRear(tr))}])
      & (/* @M3Animation:grd8  */ tr : dom(MATrainFront) => min((TtdOfVss~)[{TtdOfVss(trainOccupationVSSRear(tr)) + 1}]) <= MATrainFront(tr))
    THEN
         trainMvt := FALSE
      ||
         trainOccupationVSSRear := trainOccupationVSSRear <+ {tr |-> newRearVSS}
    END;
  
  trainExiting = 
    ANY tr
    WHERE 
        /* @M3Animation:grd1  */ trainMvt = TRUE
      & /* @M3Animation:grd2  */ tr : dom(trainOccupationVSSFront)
      & /* @M3Animation:grd3  */ trainOccupationVSSRear(tr) = maxVSS
      & /* @M3Animation:grd4  */ tr : Trains
    THEN
         trainOccupationVSSFront := {tr} <<| trainOccupationVSSFront
      ||
         trainOccupationVSSRear := {tr} <<| trainOccupationVSSRear
      ||
         trainMvt := FALSE
      ||
         trainLocationVSSFront := {tr} <<| trainLocationVSSFront
      ||
         trainLocationVSSRear := {tr} <<| trainLocationVSSRear
      ||
         MATrainRear := {tr} <<| MATrainRear
      ||
         MATrainFront := {tr} <<| MATrainFront
      ||
         previousFront := {tr} <<| previousFront
      ||
         previousFrontState := {tr} <<| previousFrontState
      ||
         integrityTimer := {tr} <<| integrityTimer
      ||
         muteTimer := {tr} <<| muteTimer
      ||
         trainIntegrity := {tr} <<| trainIntegrity
      ||
         lengthChange := {tr} <<| lengthChange
      ||
         integrityLostTrainVSS := integrityLostTrainVSS |>> {tr}
    END;
  
  trainSnd = 
    ANY integ,tr,lengch
    WHERE 
        integ : BOOL
      & lengch : BOOL
      & /* @M3Animation:grd1  */ tr : dom(trainOccupationVSSFront)
      & tr : dom(isConnected)
      & isConnected(tr) = TRUE
      & (/* @M3Animation:grd4  */ tr : dom(trainLocationVSSFront) => trainOccupationVSSFront(tr) >= trainLocationVSSFront(tr))
      & (/* @M3Animation:grd5  */ tr /: dom(trainLocationVSSRear) => integ = TRUE)
      & (/* @M3Animation:grd6  */ tr /: dom(trainLocationVSSRear) => lengch = FALSE)
    THEN
         trainLocationVSSRear := {TRUE |-> (trainLocationVSSRear <+ {tr |-> trainOccupationVSSRear(tr)}),FALSE |-> trainLocationVSSRear}(integ)
      ||
         trainLocationVSSFront := trainLocationVSSFront <+ {tr |-> trainOccupationVSSFront(tr)}
      ||
         muteTimer := muteTimer <+ {tr |-> TRUE}
      ||
         integrityTimer := {TRUE |-> (integrityTimer <+ {tr |-> TRUE}),FALSE |-> integrityTimer}(integ)
      ||
         trainIntegrity := trainIntegrity <+ {tr |-> integ}
      ||
         lengthChange := lengthChange <+ {tr |-> lengch}
      ||
         integrityLostTrainVSS := {TRUE |-> (integrityLostTrainVSS |>> {tr}),FALSE |-> integrityLostTrainVSS}(bool(integ = TRUE or lengch = FALSE))
    END;
  
  trainConnect = 
    ANY tr
    WHERE 
        /* @M3Animation:grd2  */ tr : Trains
      & /* @M3Animation:grd3  */ trainKind(tr) = Ertms
      & /* @M3Animation:grd4  */ isConnected(tr) = FALSE
    THEN
      isConnected := isConnected <+ {tr |-> TRUE}
    END;
  
  trainDisconnect = 
    ANY tr
    WHERE 
        /* @M3Animation:grd1  */ tr : dom(trainOccupationVSSFront)
      & tr : dom(isConnected)
      & isConnected(tr) = TRUE
      & /* @M3Animation:grd3  */ tr : Trains
    THEN
      isConnected := isConnected <+ {tr |-> FALSE}
    END;
  
  assignMALocatedTrain = 
    ANY newFront,tr
    WHERE 
        tr : dom(isConnected)
      & isConnected(tr) = TRUE
      & /* @M3Animation:grd2  */ tr : dom(trainLocationVSSFront)
      & /* @M3Animation:grd3  */ newFront : Vss
      & /* @M3Animation:grd4  */ newFront : max(MATrainFront[{tr}] \/ {trainLocationVSSFront(tr)}) + 1 .. max(Vss)
      & /* @M3Animation:grd5  */ !tr1.(tr1 : dom(MATrainFront) & tr1 /= tr => trainLocationVSSRear(tr) .. newFront /\ MATrainRear(tr1) .. MATrainFront(tr1) = {})
      & /* @M3Animation:grd6  */ trainLocationVSSRear(tr) + 1 .. newFront <: (currentStateVSS~)[{freeV}]
    THEN
         MATrainRear := MATrainRear <+ {tr |-> trainLocationVSSRear(tr)}
      ||
         MATrainFront := MATrainFront <+ {tr |-> newFront}
    END;
  
  assignMAToEnter = 
    ANY newFront,tr
    WHERE 
        tr : dom(isConnected)
      & isConnected(tr) = TRUE
      & /* @M3Animation:grd2  */ tr /: dom(trainOccupationVSSFront)
      & /* @M3Animation:grd3  */ newFront : Vss
      & /* @M3Animation:grd4  */ !tr1.(tr1 : dom(MATrainFront) & tr1 /= tr => minVSS .. newFront /\ MATrainRear(tr1) .. MATrainFront(tr1) = {})
      & /* @M3Animation:grd5  */ 1 .. newFront <: (currentStateVSS~)[{freeV}]
      & /* @M3Animation:grd6  */ !nf.(nf : Vss & nf > newFront => currentStateVSS[newFront + 1 .. nf] /= {freeV})
    THEN
         MATrainRear := MATrainRear <+ {tr |-> minVSS}
      ||
         MATrainFront := MATrainFront <+ {tr |-> newFront}
    END;
  
  muteTimerExpire = 
    ANY tr
    WHERE 
        /* @M3Animation:grd1  */ tr : dom(trainLocationVSSFront)
      & /* @M3Animation:grd2  */ muteTimer(tr) = TRUE
      & tr : dom(isConnected)
      & isConnected(tr) = FALSE
    THEN
         muteTimer := muteTimer <+ {tr |-> FALSE}
      ||
         disconnectTimer := disconnectTimer <+ (trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) * {1}
      ||
         disconnectTimerTrain := disconnectTimerTrain <+ (trainLocationVSSRear(tr) .. trainLocationVSSFront(tr)) * {tr}
    END;
  
  integrityTimerExpire = 
    ANY tr
    WHERE 
        /* @M3Animation:grd1  */ tr : dom(integrityTimer)
      & /* @M3Animation:grd2  */ integrityTimer(tr) = TRUE
    THEN
      integrityTimer := integrityTimer <+ {tr |-> FALSE}
    END;
  
  disconectTimerExpire = 
    ANY VS
    WHERE 
        /* @M3Animation:grd1  */ VS <: Vss
      & /* @M3Animation:grd2  */ disconnectTimer[VS] = {1}
    THEN
      disconnectTimer := disconnectTimer <+ VS * {0}
    END;
  
  ghostTimerExpire = 
    ANY td
    WHERE 
        /* @M3Animation:grd1  */ td : Ttds
      & /* @M3Animation:grd2  */ ghostTimer(td) = 1
    THEN
      ghostTimer := ghostTimer <+ {td |-> 0}
    END;
  
  trainSplit = 
    ANY car,tr,vs
    WHERE 
        tr : Trains
      & tr : dom(trainOccupationVSSFront)
      & /* @M3Animation:grd2  */ car : Cars - dom(trainOccupationVSSFront)
      & vs : Vss
      & vs : trainOccupationVSSRear(tr) .. trainOccupationVSSFront(tr)
    THEN
         trainOccupationVSSRear := ({tr} <<| trainOccupationVSSRear) \/ {tr |-> vs,car |-> trainOccupationVSSRear(tr)}
      ||
         trainOccupationVSSFront := trainOccupationVSSFront <+ {car |-> vs}
      ||
         integrityLostTrain := integrityLostTrain <+ {tr |-> TRUE}
    END
END
