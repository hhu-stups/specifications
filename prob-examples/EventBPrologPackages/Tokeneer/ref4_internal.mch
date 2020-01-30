
MACHINE ref4_entry_L2
SETS /* deferred */
  CERTIFICATEID;
  CERTIFICATES;
  KEYS;
  USER;
  FINGERPRINTTEMPLATE;
  TOKENID;
  LOCKING;
  PRESENCE
 ; /* enumerated */
  CLEARENCE={unmarked,unclassified,restricted,confidential,secret,topsecret};
  PRIVILEGE={userOnly,guard,securityOfficer,auditManager,NoRole};
  ENTRY_STATUS={quiescent,gotUserToken,waitingFinger,gotFinger,waitingUpdateToken,waitingEntry,waitingRemoveTokenSuccess,waitingRemoveTokenFail};
  DISPLAYMESSAGE={blank,welcome,insertFinger,openDoor,wait,removeToken,tokenUpdateFailed,doorUnlocked};
  DOORALARM={d_alarming,d_silent};
  FINGERPRINTTRY={badFP,noFP,initFPTry,goodF};
  TOKENTRY={goodT,badT,noT,initTokenTry}
CONCRETE_CONSTANTS
  MAXTIME,
  absent,
  present,
  time
ABSTRACT_VARIABLES
  FingerPresence,
  alarmSilentDuration,
  alarmTimeout1,
  displayMessage1,
  doorAlarm,
  entryPeriod,
  fingerprintTry,
  goodFP,
  goodTok,
  latchTimeout1,
  latchUnlockDuration,
  locked,
  tokenRemovalDuration,
  tokenRemovalTimeout,
  tokenTry,
  userTokenPresence,
  attCertTokID,
  currentToken,
  entry_status1,
  tokenAuthCert,
  tokenID,
  tokenIandaCert,
  tokenPrivCert,
  authCert,
  authCertClearence,
  authCertRole,
  clearence,
  fingerprint,
  fpTemplate,
  iandaCert,
  privCert,
  privCertClearence,
  privCertRole,
  privilege,
  attCert,
  baseCertID,
  idCert,
  subject,
  subjectPubKey,
  user,
  certificateID,
  certificates,
  isValidatedBy,
  publicKeys,
  validityPeriods
/* PROMOTED OPERATIONS
  addIdCertificate,
  addPrivCertificate_TID,
  addPrivCertificate_no_TID,
  addAuthCertificate_TID,
  addAuthCertificate_no_TID,
  addIandaCertificate_TID,
  addIandaCertificate_no_TID,
  deletePrivCertificate_TID,
  deletePrivCertificate_no_TID,
  deleteAuthCertificate,
  deleteIandaCertificate_TID,
  deleteIandaCertificate_no_TID,
  deleteIdCertificate,
  ReadUserToken,
  UserTokenTear,
  ValidateUserTokenFail,
  FailedAccessTokenRemoved,
  BioCheckRequired,
  ReadFingerOK,
  FingerTimeout,
  ValidateFingerOK,
  WriteUserTokenOK,
  WriteUserTokenFail,
  ValidateFingerFail,
  BioCheckNotRequired,
  EntryOK_1,
  EntryOK_2,
  EntryNotAllowed_1,
  EntryNotAllowed_2,
  TokenRemovalTimeout,
  doNothing,
  unlockDoorOK,
  lockDoor */
PROPERTIES
    /* @ctx_ref4:ax4_46  */ time = NATURAL
  & /* @ctx_ref4:ax4_47  */ MAXTIME : NATURAL1
  & /* @ctx_ref4:ax4_48  */ PRESENCE = {absent,present}
INVARIANT
    /* @ref4_entry_L2:inv4_2  */ goodFP : fingerprint --> fingerprintTry
  & /* @ref4_entry_L2:inv4_4  */ goodTok : tokenID --> tokenTry
  & /* @ref4_entry_L2:inv4_7  */ latchUnlockDuration : NATURAL
  & /* @ref4_entry_L2:inv4_8  */ latchTimeout1 : NATURAL
  & /* @ref4_entry_L2:inv4_11  */ #currentTime.((currentTime : NATURAL & (currentTime <= MAXTIME & locked = TRUE)) <=> (currentTime <= latchTimeout1 - latchUnlockDuration or currentTime >= latchTimeout1))
  & /* @ref4_entry_L2:inv4_12  */ latchTimeout1 <= MAXTIME
  & /* @ref4_entry_L2:inv4_14  */ latchTimeout1 - latchUnlockDuration >= 0
  & /* @ref4_entry_L2:inv4_17  */ entryPeriod : PRIVILEGE --> (CLEARENCE --> POW(time))
  & /* @ref4_entry_L2:inv4_18  */ tokenRemovalTimeout : NATURAL
  & /* @ref4_entry_L2:inv4_19  */ alarmTimeout1 : NATURAL
  & /* @ref4_entry_L2:inv4_20  */ alarmSilentDuration : NATURAL
  & /* @ref4_entry_L2:inv4_21  */ tokenRemovalDuration : NATURAL
  & /* @ref3_entry_L1:inv3_3  */ tokenPrivCert : tokenID >-> privCert
  & /* @ref3_entry_L1:inv3_4  */ tokenIandaCert : tokenID >-> iandaCert
  & /* @ref3_entry_L1:inv3_5  */ tokenAuthCert : tokenID >+> authCert
  & /* @ref3_entry_L1:inv3_8  */ attCertTokID : attCert >-> tokenID
  & /* @ref2_certificate_L2:inv2_1  */ privCert <: attCert
  & /* @ref2_certificate_L2:inv2_2  */ iandaCert <: attCert
  & /* @ref2_certificate_L2:inv2_3  */ authCert <: attCert
  & /* @ref2_certificate_L2:inv2_4  */ privCert \/ (iandaCert \/ authCert) = attCert
  & /* @ref2_certificate_L2:inv2_5  */ privCert /\ iandaCert = {}
  & /* @ref2_certificate_L2:inv2_22  */ privCert /\ authCert = {}
  & /* @ref2_certificate_L2:inv2_24  */ privCert /\ iandaCert = {}
  & /* @ref2_certificate_L2:inv2_9  */ privCertRole : privCert --> privilege
  & /* @ref2_certificate_L2:inv2_10  */ privCertClearence : privCert --> clearence
  & /* @ref2_certificate_L2:inv2_11  */ authCertRole : authCert --> privilege
  & /* @ref2_certificate_L2:inv2_12  */ authCertClearence : authCert --> clearence
  & /* @ref2_certificate_L2:inv2_14  */ fpTemplate : iandaCert >-> fingerprint
  & /* @ref1_certificate_L1:inv1_3  */ idCert <: certificates
  & /* @ref1_certificate_L1:inv1_4  */ attCert <: certificates
  & /* @ref1_certificate_L1:inv1_5  */ idCert \/ attCert = certificates
  & /* @ref1_certificate_L1:inv1_6  */ idCert /\ attCert = {}
  & /* @ref1_certificate_L1:inv1_7  */ subject : idCert >-> user
  & /* @ref1_certificate_L1:inv1_8  */ subjectPubKey : user >+> publicKeys
  & /* @ref1_certificate_L1:inv1_9  */ baseCertID : attCert >+> idCert
  & /* @abstract:inv0_3  */ certificateID : certificates +-> CERTIFICATEID
  & /* @abstract:inv0_4  */ validityPeriods : certificates <-> NATURAL
  & /* @abstract:inv0_5  */ isValidatedBy : certificates >+> publicKeys
INITIALISATION
    EVENT INITIALISATION = /* of machine ref4_entry_L2 */
    THEN 
         certificates := {}
      ||
         isValidatedBy := {}
      ||
         validityPeriods := {}
      ||
         publicKeys := {}
      ||
         certificateID := {}
      ||
         idCert := {}
      ||
         attCert := {}
      ||
         subject := {}
      ||
         subjectPubKey := {}
      ||
         user := {}
      ||
         baseCertID := {}
      ||
         privCert := {}
      ||
         iandaCert := {}
      ||
         authCert := {}
      ||
         privCertRole := {}
      ||
         privCertClearence := {}
      ||
         authCertRole := {}
      ||
         authCertClearence := {}
      ||
         fpTemplate := {}
      ||
         privilege := {}
      ||
         clearence := {}
      ||
         fingerprint := {}
      ||
         tokenPrivCert := {}
      ||
         tokenIandaCert := {}
      ||
         tokenAuthCert := {}
      ||
         entry_status1 := quiescent
      ||
         currentToken :: TOKENID
      ||
         tokenID := {}
      ||
         attCertTokID := {}
      ||
         fingerprintTry := {}
      ||
         goodFP := {}
      ||
         goodTok := {}
      ||
         tokenTry := {}
      ||
         displayMessage1 := blank
      ||
         latchUnlockDuration := 0
      ||
         latchTimeout1 := 0
      ||
         doorAlarm := d_silent
      ||
         locked := TRUE
      ||
         userTokenPresence := absent
      ||
         FingerPresence := absent
      ||
         entryPeriod :: PRIVILEGE --> (CLEARENCE --> {{1}})
      ||
         tokenRemovalTimeout := 0
      ||
         alarmTimeout1 := 0
      ||
         alarmSilentDuration := 0
      ||
         tokenRemovalDuration := 0
    REFINES 
      EVENT INITIALISATION = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT INITIALISATION = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT INITIALISATION = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT INITIALISATION = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END
OPERATIONS
  addIdCertificate(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addIdCertificate_sub,addIdCertificate_usrPubKey) = 
    EVENT addIdCertificate = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addIdCertificate_sub,addIdCertificate_usrPubKey
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addIdCertificate_sub /: ran(subject)
      & /* @ref4_entry_L2:grd1_2  */ addIdCertificate_sub : user
      & /* @ref4_entry_L2:grd1_3  */ addIdCertificate_usrPubKey : publicKeys
      & /* @ref4_entry_L2:grd1_4  */ addIdCertificate_sub /: dom(subjectPubKey)
      & /* @ref4_entry_L2:grd1_5  */ addIdCertificate_usrPubKey /: ran(subjectPubKey)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         idCert := idCert \/ {addCertificate_ce}
      ||
         subject := subject \/ {addCertificate_ce |-> addIdCertificate_sub}
      ||
         subjectPubKey := subjectPubKey \/ {addIdCertificate_sub |-> addIdCertificate_usrPubKey}
    REFINES 
      EVENT addIdCertificate = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addIdCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addIdCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  addPrivCertificate_TID(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addPrivCertificate_class,addPrivCertificate_priv) = 
    EVENT addPrivCertificate_TID = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addPrivCertificate_class,addPrivCertificate_priv
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addAttCertificate_idc : idCert
      & /* @ref4_entry_L2:grd1_2  */ addAttCertificate_idc /: ran(baseCertID)
      & /* @ref4_entry_L2:grd2_1  */ addPrivCertificate_priv : privilege
      & /* @ref4_entry_L2:grd2_2  */ addPrivCertificate_class : clearence
      & /* @ref4_entry_L2:grd2_3  */ (addCertificate_ce |-> addPrivCertificate_priv) /: privCertRole
      & /* @ref4_entry_L2:grd2_4  */ addCertificate_ce /: dom(privCertRole)
      & /* @ref4_entry_L2:grd2_5  */ (addCertificate_ce |-> addPrivCertificate_class) /: privCertClearence
      & /* @ref4_entry_L2:grd2_6  */ addCertificate_ce /: dom(privCertClearence)
      & /* @ref4_entry_L2:grd3_2  */ addCertificate_ce : dom(attCertTokID)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         attCert := attCert \/ {addCertificate_ce}
      ||
         baseCertID := baseCertID \/ {addCertificate_ce |-> addAttCertificate_idc}
      ||
         privCert := privCert \/ {addCertificate_ce}
      ||
         privCertRole := privCertRole \/ {addCertificate_ce |-> addPrivCertificate_priv}
      ||
         privCertClearence := privCertClearence \/ {addCertificate_ce |-> addPrivCertificate_class}
    REFINES 
      EVENT addPrivCertificate_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addPrivCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  addPrivCertificate_no_TID(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addPrivCertificate_class,addPrivCertificate_priv,addPrivCertificate_tid) = 
    EVENT addPrivCertificate_no_TID = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addPrivCertificate_class,addPrivCertificate_priv,addPrivCertificate_tid
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addAttCertificate_idc : idCert
      & /* @ref4_entry_L2:grd1_2  */ addAttCertificate_idc /: ran(baseCertID)
      & /* @ref4_entry_L2:grd2_1  */ addPrivCertificate_priv : privilege
      & /* @ref4_entry_L2:grd2_2  */ addPrivCertificate_class : clearence
      & /* @ref4_entry_L2:grd2_3  */ (addCertificate_ce |-> addPrivCertificate_priv) /: privCertRole
      & /* @ref4_entry_L2:grd2_4  */ addCertificate_ce /: dom(privCertRole)
      & /* @ref4_entry_L2:grd2_5  */ (addCertificate_ce |-> addPrivCertificate_class) /: privCertClearence
      & /* @ref4_entry_L2:grd2_6  */ addCertificate_ce /: dom(privCertClearence)
      & /* @ref4_entry_L2:grd3_1  */ addPrivCertificate_tid : tokenID - ran(attCertTokID)
      & /* @ref4_entry_L2:grd3_2  */ addCertificate_ce /: dom(attCertTokID)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         attCert := attCert \/ {addCertificate_ce}
      ||
         baseCertID := baseCertID \/ {addCertificate_ce |-> addAttCertificate_idc}
      ||
         privCert := privCert \/ {addCertificate_ce}
      ||
         privCertRole := privCertRole \/ {addCertificate_ce |-> addPrivCertificate_priv}
      ||
         privCertClearence := privCertClearence \/ {addCertificate_ce |-> addPrivCertificate_class}
      ||
         attCertTokID := attCertTokID \/ {addCertificate_ce |-> addPrivCertificate_tid}
    REFINES 
      EVENT addPrivCertificate_no_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addPrivCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  addAuthCertificate_TID(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addAuthCertificate_class,addAuthCertificate_priv) = 
    EVENT addAuthCertificate_TID = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addAuthCertificate_class,addAuthCertificate_priv
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addAttCertificate_idc : idCert
      & /* @ref4_entry_L2:grd1_2  */ addAttCertificate_idc /: ran(baseCertID)
      & /* @ref4_entry_L2:grd2_1  */ addAuthCertificate_priv : privilege
      & /* @ref4_entry_L2:grd2_2  */ addAuthCertificate_class : clearence
      & /* @ref4_entry_L2:grd2_3  */ (addCertificate_ce |-> addAuthCertificate_priv) /: authCertRole
      & /* @ref4_entry_L2:grd2_4  */ addCertificate_ce /: dom(authCertRole)
      & /* @ref4_entry_L2:grd2_5  */ (addCertificate_ce |-> addAuthCertificate_class) /: authCertClearence
      & /* @ref4_entry_L2:grd2_6  */ addCertificate_ce /: dom(authCertClearence)
      & /* @ref4_entry_L2:grd3_2  */ addCertificate_ce : dom(attCertTokID)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         attCert := attCert \/ {addCertificate_ce}
      ||
         baseCertID := baseCertID \/ {addCertificate_ce |-> addAttCertificate_idc}
      ||
         authCert := authCert \/ {addCertificate_ce}
      ||
         authCertRole := authCertRole \/ {addCertificate_ce |-> addAuthCertificate_priv}
      ||
         authCertClearence := authCertClearence \/ {addCertificate_ce |-> addAuthCertificate_class}
    REFINES 
      EVENT addAuthCertificate_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addAuthCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  addAuthCertificate_no_TID(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addAuthCertificate_class,addAuthCertificate_priv,addPrivCertificate_tid) = 
    EVENT addAuthCertificate_no_TID = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addAuthCertificate_class,addAuthCertificate_priv,addPrivCertificate_tid
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addAttCertificate_idc : idCert
      & /* @ref4_entry_L2:grd1_2  */ addAttCertificate_idc /: ran(baseCertID)
      & /* @ref4_entry_L2:grd2_1  */ addAuthCertificate_priv : privilege
      & /* @ref4_entry_L2:grd2_2  */ addAuthCertificate_class : clearence
      & /* @ref4_entry_L2:grd2_3  */ (addCertificate_ce |-> addAuthCertificate_priv) /: authCertRole
      & /* @ref4_entry_L2:grd2_4  */ addCertificate_ce /: dom(authCertRole)
      & /* @ref4_entry_L2:grd2_5  */ (addCertificate_ce |-> addAuthCertificate_class) /: authCertClearence
      & /* @ref4_entry_L2:grd2_6  */ addCertificate_ce /: dom(authCertClearence)
      & /* @ref4_entry_L2:grd3_1  */ addPrivCertificate_tid : tokenID - ran(attCertTokID)
      & /* @ref4_entry_L2:grd3_2  */ addCertificate_ce /: dom(attCertTokID)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         attCert := attCert \/ {addCertificate_ce}
      ||
         baseCertID := baseCertID \/ {addCertificate_ce |-> addAttCertificate_idc}
      ||
         authCert := authCert \/ {addCertificate_ce}
      ||
         authCertRole := authCertRole \/ {addCertificate_ce |-> addAuthCertificate_priv}
      ||
         authCertClearence := authCertClearence \/ {addCertificate_ce |-> addAuthCertificate_class}
      ||
         attCertTokID := attCertTokID \/ {addCertificate_ce |-> addPrivCertificate_tid}
    REFINES 
      EVENT addAuthCertificate_no_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addAuthCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  addIandaCertificate_TID(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addIandaCertificate_fingerPrint) = 
    EVENT addIandaCertificate_TID = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addIandaCertificate_fingerPrint
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addAttCertificate_idc : idCert
      & /* @ref4_entry_L2:grd1_2  */ addAttCertificate_idc /: ran(baseCertID)
      & /* @ref4_entry_L2:grd2_1  */ addIandaCertificate_fingerPrint : fingerprint - ran(fpTemplate)
      & /* @ref4_entry_L2:grd2_2  */ addCertificate_ce /: dom(fpTemplate)
      & /* @ref4_entry_L2:grd2_3  */ (addCertificate_ce |-> addIandaCertificate_fingerPrint) /: fpTemplate
      & /* @ref4_entry_L2:grd3_2  */ addCertificate_ce : dom(attCertTokID)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         attCert := attCert \/ {addCertificate_ce}
      ||
         baseCertID := baseCertID \/ {addCertificate_ce |-> addAttCertificate_idc}
      ||
         iandaCert := iandaCert \/ {addCertificate_ce}
      ||
         fpTemplate := fpTemplate \/ {addCertificate_ce |-> addIandaCertificate_fingerPrint}
    REFINES 
      EVENT addIandaCertificate_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addIandaCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  addIandaCertificate_no_TID(addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addIandaCertificate_fingerPrint,addPrivCertificate_tid) = 
    EVENT addIandaCertificate_no_TID = /* of machine ref4_entry_L2 */
    ANY addCertificate_ce,addCertificate_period,addCertificate_pubkey,addAttCertificate_idc,addIandaCertificate_fingerPrint,addPrivCertificate_tid
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ addCertificate_ce : CERTIFICATES - certificates
      & /* @ref4_entry_L2:grd0_2  */ addCertificate_period : NATURAL
      & /* @ref4_entry_L2:grd0_3  */ addCertificate_pubkey : publicKeys
      & /* @ref4_entry_L2:grd0_4  */ addCertificate_pubkey /: ran(isValidatedBy)
      & /* @ref4_entry_L2:grd1_1  */ addAttCertificate_idc : idCert
      & /* @ref4_entry_L2:grd1_2  */ addAttCertificate_idc /: ran(baseCertID)
      & /* @ref4_entry_L2:grd2_1  */ addIandaCertificate_fingerPrint : fingerprint - ran(fpTemplate)
      & /* @ref4_entry_L2:grd2_2  */ addCertificate_ce /: dom(fpTemplate)
      & /* @ref4_entry_L2:grd2_3  */ (addCertificate_ce |-> addIandaCertificate_fingerPrint) /: fpTemplate
      & /* @ref4_entry_L2:grd3_1  */ addPrivCertificate_tid : tokenID - ran(attCertTokID)
      & /* @ref4_entry_L2:grd3_2  */ addCertificate_ce /: dom(attCertTokID)
    THEN 
         certificates := certificates \/ {addCertificate_ce}
      ||
         validityPeriods := validityPeriods \/ {addCertificate_ce |-> addCertificate_period}
      ||
         isValidatedBy := isValidatedBy \/ {addCertificate_ce |-> addCertificate_pubkey}
      ||
         attCert := attCert \/ {addCertificate_ce}
      ||
         baseCertID := baseCertID \/ {addCertificate_ce |-> addAttCertificate_idc}
      ||
         iandaCert := iandaCert \/ {addCertificate_ce}
      ||
         fpTemplate := fpTemplate \/ {addCertificate_ce |-> addIandaCertificate_fingerPrint}
      ||
         attCertTokID := attCertTokID \/ {addCertificate_ce |-> addPrivCertificate_tid}
    REFINES 
      EVENT addIandaCertificate_no_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT addIandaCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT addAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT addCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  deletePrivCertificate_TID(deleteCertificate_ce) = 
    EVENT deletePrivCertificate_TID = /* of machine ref4_entry_L2 */
    ANY deleteCertificate_ce
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ deleteCertificate_ce : certificates
      & /* @ref4_entry_L2:grd0_2  */ deleteCertificate_ce : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd0_3  */ deleteCertificate_ce : dom(validityPeriods)
      & /* @ref4_entry_L2:grd1_1  */ deleteCertificate_ce : attCert
      & /* @ref4_entry_L2:grd_2_1  */ deleteCertificate_ce : privCert
      & /* @ref4_entry_L2:grd_2_2  */ deleteCertificate_ce /: authCert
      & /* @ref4_entry_L2:grd_2_3  */ deleteCertificate_ce /: iandaCert
      & /* @ref4_entry_L2:grd3_1  */ deleteCertificate_ce : ran(tokenPrivCert)
      & /* @ref4_entry_L2:grd3_2  */ deleteCertificate_ce |-> (tokenPrivCert~)(deleteCertificate_ce) : attCertTokID
    THEN 
         certificates := certificates - {deleteCertificate_ce}
      ||
         isValidatedBy := {deleteCertificate_ce} <<| isValidatedBy
      ||
         validityPeriods := {deleteCertificate_ce} <<| validityPeriods
      ||
         certificateID := {deleteCertificate_ce} <<| certificateID
      ||
         attCert := attCert - {deleteCertificate_ce}
      ||
         baseCertID := {deleteCertificate_ce} <<| baseCertID
      ||
         privCert := privCert - {deleteCertificate_ce}
      ||
         privCertRole := {deleteCertificate_ce} <<| privCertRole
      ||
         privCertClearence := {deleteCertificate_ce} <<| privCertClearence
      ||
         tokenPrivCert := tokenPrivCert |>> {deleteCertificate_ce}
      ||
         tokenIandaCert := {(tokenPrivCert~)(deleteCertificate_ce)} <<| tokenIandaCert
      ||
         tokenAuthCert := {(tokenPrivCert~)(deleteCertificate_ce)} <<| tokenAuthCert
      ||
         tokenID := tokenID - {(tokenPrivCert~)(deleteCertificate_ce)}
      ||
         attCertTokID := attCertTokID - {deleteCertificate_ce |-> (tokenPrivCert~)(deleteCertificate_ce)}
      ||
         goodTok := {(tokenPrivCert~)(deleteCertificate_ce)} <<| goodTok
    REFINES 
      EVENT deletePrivCertificate_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT deletePrivCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT deleteAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT deleteCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  deletePrivCertificate_no_TID(deleteCertificate_ce) = 
    EVENT deletePrivCertificate_no_TID = /* of machine ref4_entry_L2 */
    ANY deleteCertificate_ce
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ deleteCertificate_ce : certificates
      & /* @ref4_entry_L2:grd0_2  */ deleteCertificate_ce : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd0_3  */ deleteCertificate_ce : dom(validityPeriods)
      & /* @ref4_entry_L2:grd1_1  */ deleteCertificate_ce : attCert
      & /* @ref4_entry_L2:grd_2_1  */ deleteCertificate_ce : privCert
      & /* @ref4_entry_L2:grd_2_2  */ deleteCertificate_ce /: authCert
      & /* @ref4_entry_L2:grd_2_3  */ deleteCertificate_ce /: iandaCert
      & /* @ref4_entry_L2:grd3_1  */ deleteCertificate_ce : ran(tokenPrivCert)
      & /* @ref4_entry_L2:grd3_2  */ deleteCertificate_ce /: dom(attCertTokID)
    THEN 
         certificates := certificates - {deleteCertificate_ce}
      ||
         isValidatedBy := {deleteCertificate_ce} <<| isValidatedBy
      ||
         validityPeriods := {deleteCertificate_ce} <<| validityPeriods
      ||
         certificateID := {deleteCertificate_ce} <<| certificateID
      ||
         attCert := attCert - {deleteCertificate_ce}
      ||
         baseCertID := {deleteCertificate_ce} <<| baseCertID
      ||
         privCert := privCert - {deleteCertificate_ce}
      ||
         privCertRole := {deleteCertificate_ce} <<| privCertRole
      ||
         privCertClearence := {deleteCertificate_ce} <<| privCertClearence
      ||
         tokenPrivCert := tokenPrivCert |>> {deleteCertificate_ce}
      ||
         tokenIandaCert := {(tokenPrivCert~)(deleteCertificate_ce)} <<| tokenIandaCert
      ||
         tokenAuthCert := {(tokenPrivCert~)(deleteCertificate_ce)} <<| tokenAuthCert
      ||
         tokenID := tokenID - {(tokenPrivCert~)(deleteCertificate_ce)}
      ||
         goodTok := {(tokenPrivCert~)(deleteCertificate_ce)} <<| goodTok
    REFINES 
      EVENT deletePrivCertificate_no_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT deletePrivCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT deleteAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT deleteCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  deleteAuthCertificate(deleteCertificate_ce) = 
    EVENT deleteAuthCertificate = /* of machine ref4_entry_L2 */
    ANY deleteCertificate_ce
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ deleteCertificate_ce : certificates
      & /* @ref4_entry_L2:grd0_2  */ deleteCertificate_ce : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd0_3  */ deleteCertificate_ce : dom(validityPeriods)
      & /* @ref4_entry_L2:grd1_1  */ deleteCertificate_ce : attCert
      & /* @ref4_entry_L2:grd_2_1  */ deleteCertificate_ce : authCert
      & /* @ref4_entry_L2:grd_2_2  */ deleteCertificate_ce /: privCert
      & /* @ref4_entry_L2:grd_2_3  */ deleteCertificate_ce /: iandaCert
      & /* @ref4_entry_L2:grd3_1  */ deleteCertificate_ce : ran(tokenAuthCert)
    THEN 
         certificates := certificates - {deleteCertificate_ce}
      ||
         isValidatedBy := {deleteCertificate_ce} <<| isValidatedBy
      ||
         validityPeriods := {deleteCertificate_ce} <<| validityPeriods
      ||
         certificateID := {deleteCertificate_ce} <<| certificateID
      ||
         attCert := attCert - {deleteCertificate_ce}
      ||
         baseCertID := {deleteCertificate_ce} <<| baseCertID
      ||
         authCert := authCert - {deleteCertificate_ce}
      ||
         authCertRole := {deleteCertificate_ce} <<| authCertRole
      ||
         authCertClearence := {deleteCertificate_ce} <<| authCertClearence
      ||
         tokenAuthCert := tokenAuthCert |>> {deleteCertificate_ce}
      ||
         attCertTokID := {deleteCertificate_ce} <<| attCertTokID
    REFINES 
      EVENT deleteAuthCertificate = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT deleteAuthCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT deleteAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT deleteCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  deleteIandaCertificate_TID(deleteCertificate_ce) = 
    EVENT deleteIandaCertificate_TID = /* of machine ref4_entry_L2 */
    ANY deleteCertificate_ce
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ deleteCertificate_ce : certificates
      & /* @ref4_entry_L2:grd0_2  */ deleteCertificate_ce : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd0_3  */ deleteCertificate_ce : dom(validityPeriods)
      & /* @ref4_entry_L2:grd1_1  */ deleteCertificate_ce : attCert
      & /* @ref4_entry_L2:grd_2_1  */ deleteCertificate_ce : iandaCert
      & /* @ref4_entry_L2:grd_2_2  */ deleteCertificate_ce /: authCert
      & /* @ref4_entry_L2:grd_2_3  */ deleteCertificate_ce /: privCert
      & /* @ref4_entry_L2:grd3_1  */ deleteCertificate_ce : ran(tokenIandaCert)
      & /* @ref4_entry_L2:grd3_2  */ deleteCertificate_ce |-> (tokenIandaCert~)(deleteCertificate_ce) : attCertTokID
    THEN 
         certificates := certificates - {deleteCertificate_ce}
      ||
         isValidatedBy := {deleteCertificate_ce} <<| isValidatedBy
      ||
         validityPeriods := {deleteCertificate_ce} <<| validityPeriods
      ||
         certificateID := {deleteCertificate_ce} <<| certificateID
      ||
         attCert := attCert - {deleteCertificate_ce}
      ||
         baseCertID := {deleteCertificate_ce} <<| baseCertID
      ||
         iandaCert := iandaCert - {deleteCertificate_ce}
      ||
         fpTemplate := {deleteCertificate_ce} <<| fpTemplate
      ||
         tokenIandaCert := tokenIandaCert |>> {deleteCertificate_ce}
      ||
         tokenPrivCert := {(tokenIandaCert~)(deleteCertificate_ce)} <<| tokenPrivCert
      ||
         tokenAuthCert := {(tokenIandaCert~)(deleteCertificate_ce)} <<| tokenAuthCert
      ||
         tokenID := tokenID - {(tokenIandaCert~)(deleteCertificate_ce)}
      ||
         attCertTokID := attCertTokID - {deleteCertificate_ce |-> (tokenIandaCert~)(deleteCertificate_ce)}
      ||
         goodTok := {(tokenIandaCert~)(deleteCertificate_ce)} <<| goodTok
    REFINES 
      EVENT deleteIandaCertificate_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT deleteIandaCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT deleteAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT deleteCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  deleteIandaCertificate_no_TID(deleteCertificate_ce) = 
    EVENT deleteIandaCertificate_no_TID = /* of machine ref4_entry_L2 */
    ANY deleteCertificate_ce
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ deleteCertificate_ce : certificates
      & /* @ref4_entry_L2:grd0_2  */ deleteCertificate_ce : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd0_3  */ deleteCertificate_ce : dom(validityPeriods)
      & /* @ref4_entry_L2:grd1_1  */ deleteCertificate_ce : attCert
      & /* @ref4_entry_L2:grd_2_1  */ deleteCertificate_ce : iandaCert
      & /* @ref4_entry_L2:grd_2_2  */ deleteCertificate_ce /: authCert
      & /* @ref4_entry_L2:grd_2_3  */ deleteCertificate_ce /: privCert
      & /* @ref4_entry_L2:grd3_1  */ deleteCertificate_ce : ran(tokenIandaCert)
      & /* @ref4_entry_L2:grd3_2  */ deleteCertificate_ce /: dom(attCertTokID)
    THEN 
         certificates := certificates - {deleteCertificate_ce}
      ||
         isValidatedBy := {deleteCertificate_ce} <<| isValidatedBy
      ||
         validityPeriods := {deleteCertificate_ce} <<| validityPeriods
      ||
         certificateID := {deleteCertificate_ce} <<| certificateID
      ||
         attCert := attCert - {deleteCertificate_ce}
      ||
         baseCertID := {deleteCertificate_ce} <<| baseCertID
      ||
         iandaCert := iandaCert - {deleteCertificate_ce}
      ||
         fpTemplate := {deleteCertificate_ce} <<| fpTemplate
      ||
         tokenIandaCert := tokenIandaCert |>> {deleteCertificate_ce}
      ||
         tokenPrivCert := {(tokenIandaCert~)(deleteCertificate_ce)} <<| tokenPrivCert
      ||
         tokenAuthCert := {(tokenIandaCert~)(deleteCertificate_ce)} <<| tokenAuthCert
      ||
         tokenID := tokenID - {(tokenIandaCert~)(deleteCertificate_ce)}
      ||
         goodTok := {(tokenIandaCert~)(deleteCertificate_ce)} <<| goodTok
    REFINES 
      EVENT deleteIandaCertificate_no_TID = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT deleteIandaCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT deleteAttCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT deleteCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  deleteIdCertificate(deleteCertificate_ce) = 
    EVENT deleteIdCertificate = /* of machine ref4_entry_L2 */
    ANY deleteCertificate_ce
    WHERE 
        /* @ref4_entry_L2:grd0_1  */ deleteCertificate_ce : certificates
      & /* @ref4_entry_L2:grd0_2  */ deleteCertificate_ce : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd0_3  */ deleteCertificate_ce : dom(validityPeriods)
      & /* @ref4_entry_L2:grd1_1  */ deleteCertificate_ce : idCert
      & /* @ref4_entry_L2:grd1_2  */ deleteCertificate_ce : dom(subject)
      & /* @ref4_entry_L2:grd1_3  */ subject(deleteCertificate_ce) : dom(subjectPubKey)
      & /* @ref4_entry_L2:grd1_6  */ subjectPubKey(subject(deleteCertificate_ce)) : publicKeys
    THEN 
         certificates := certificates - {deleteCertificate_ce}
      ||
         isValidatedBy := {deleteCertificate_ce} <<| isValidatedBy
      ||
         validityPeriods := {deleteCertificate_ce} <<| validityPeriods
      ||
         certificateID := {deleteCertificate_ce} <<| certificateID
      ||
         idCert := idCert - {deleteCertificate_ce}
      ||
         subject := subject - {deleteCertificate_ce |-> subject(deleteCertificate_ce)}
      ||
         subjectPubKey := subjectPubKey - {subject(deleteCertificate_ce) |-> subjectPubKey(subject(deleteCertificate_ce))}
      ||
         baseCertID := baseCertID |>> {deleteCertificate_ce}
      ||
         user := user - {subject(deleteCertificate_ce)}
    REFINES 
      EVENT deleteIdCertificate = /* of machine ref3_entry_L1 */
      THEN 
        skip
      REFINES 
        EVENT deleteIdCertificate = /* of machine ref2_certificate_L2 */
        THEN 
          skip
        REFINES 
          EVENT deleteIdCertificate = /* of machine ref1_certificate_L1 */
          THEN 
            skip
          REFINES 
            EVENT deleteCertificate = /* of machine abstract */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  ReadUserToken(ReadUserToken_currentUserToken) = 
    ANTICIPATED EVENT ReadUserToken = /* of machine ref4_entry_L2 */
    USING VARIANT 0
    ANY ReadUserToken_currentUserToken
    WHERE 
        /* @ref4_entry_L2:grd3_2  */ entry_status1 = quiescent
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := gotUserToken
      ||
         currentToken := ReadUserToken_currentUserToken
      ||
         displayMessage1 := wait
    REFINES 
      ANTICIPATED EVENT ReadUserToken = /* of machine ref3_entry_L1 */
      USING VARIANT 0
      THEN 
        skip
      END
    END;
  
  UserTokenTear = 
    EVENT UserTokenTear = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 : {gotUserToken,waitingUpdateToken,waitingFinger,gotFinger,waitingEntry}
    THEN 
         entry_status1 := quiescent
      ||
         displayMessage1 := welcome
      ||
         userTokenPresence := absent
    REFINES 
      EVENT UserTokenTear = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  ValidateUserTokenFail(currentTime) = 
    EVENT ValidateUserTokenFail = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = gotUserToken
      & /* @ref4_entry_L2:grd3_2  */ currentTime : NATURAL
      & (/* @ref4_entry_L2:grd3_3  */ (currentToken : dom(tokenAuthCert) & currentTime /: validityPeriods[{tokenAuthCert(currentToken)}]) or currentToken /: dom(tokenAuthCert))
      & (/* @ref4_entry_L2:grd3_4
  */ (currentToken : ran(attCertTokID) & (attCertTokID~)(currentToken) /: dom(isValidatedBy)) or ((currentToken : dom(tokenPrivCert) & tokenPrivCert(currentToken) /: dom(isValidatedBy)) or (currentToken : dom(tokenIandaCert) & tokenIandaCert(currentToken) /: dom(isValidatedBy))))
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingRemoveTokenFail
      ||
         displayMessage1 := removeToken
    REFINES 
      EVENT ValidateUserTokenFail = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  FailedAccessTokenRemoved = 
    EVENT FailedAccessTokenRemoved = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingRemoveTokenFail
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = absent
    THEN 
         entry_status1 := quiescent
      ||
         displayMessage1 := welcome
    REFINES 
      EVENT FailedAccessTokenRemoved = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  BioCheckRequired(currentTime) = 
    EVENT BioCheckRequired = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = gotUserToken
      & /* @ref4_entry_L2:grd3_2  */ currentTime : NATURAL
      & (/* @ref4_entry_L2:grd3_3  */ (currentToken : dom(tokenAuthCert) & currentTime /: validityPeriods[{tokenAuthCert(currentToken)}]) or currentToken /: dom(tokenAuthCert))
      & currentToken : ran(attCertTokID)
      & (attCertTokID~)(currentToken) : dom(isValidatedBy)
      & currentToken : dom(tokenPrivCert)
      & tokenPrivCert(currentToken) : dom(isValidatedBy)
      & currentToken : dom(tokenIandaCert)
      & tokenIandaCert(currentToken) : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingFinger
      ||
         displayMessage1 := insertFinger
    REFINES 
      EVENT BioCheckRequired = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  ReadFingerOK = 
    EVENT ReadFingerOK = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingFinger
      & /* @ref4_entry_L2:grd4_1  */ FingerPresence = present
      & /* @ref4_entry_L2:grd4_2  */ userTokenPresence = present
    THEN 
         entry_status1 := gotFinger
      ||
         displayMessage1 := wait
    REFINES 
      EVENT ReadFingerOK = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  FingerTimeout = 
    EVENT FingerTimeout = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingFinger
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingRemoveTokenFail
      ||
         displayMessage1 := removeToken
    REFINES 
      EVENT FingerTimeout = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  ValidateFingerOK(ValidateFingerOK_currentFinger) = 
    EVENT ValidateFingerOK = /* of machine ref4_entry_L2 */
    ANY ValidateFingerOK_currentFinger
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = gotFinger
      & /* @ref4_entry_L2:grd4_1  */ ValidateFingerOK_currentFinger : fingerprint
      & /* @ref4_entry_L2:grd4_2  */ goodFP(ValidateFingerOK_currentFinger) = goodF
      & /* @ref4_entry_L2:grd4_3  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingUpdateToken
      ||
         displayMessage1 := wait
    REFINES 
      EVENT ValidateFingerOK = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  WriteUserTokenOK = 
    EVENT WriteUserTokenOK = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingUpdateToken
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingEntry
      ||
         displayMessage1 := wait
    REFINES 
      EVENT WriteUserTokenOK = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  WriteUserTokenFail = 
    EVENT WriteUserTokenFail = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingUpdateToken
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingEntry
      ||
         displayMessage1 := tokenUpdateFailed
    REFINES 
      EVENT WriteUserTokenFail = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  ValidateFingerFail = 
    EVENT ValidateFingerFail = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = gotFinger
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
    THEN 
         entry_status1 := waitingRemoveTokenFail
      ||
         displayMessage1 := removeToken
    REFINES 
      EVENT ValidateFingerFail = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  BioCheckNotRequired(currentTime) = 
    ANTICIPATED EVENT BioCheckNotRequired = /* of machine ref4_entry_L2 */
    USING VARIANT 0
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ currentTime : NATURAL
      & /* @ref4_entry_L2:grd3_2  */ currentToken : dom(tokenAuthCert)
      & /* @ref4_entry_L2:grd3_3  */ tokenAuthCert(currentToken) |-> currentTime : validityPeriods
      & currentToken : ran(attCertTokID)
      & (attCertTokID~)(currentToken) : dom(isValidatedBy)
      & /* @ref4_entry_L2:grd3_5  */ entry_status1 = gotUserToken
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
      & /* @ref4_entry_L2:grd4_2  */ currentToken : dom(goodTok)
    THEN 
         entry_status1 := waitingEntry
      ||
         displayMessage1 := wait
    REFINES 
      ANTICIPATED EVENT BioCheckNotRequired = /* of machine ref3_entry_L1 */
      USING VARIANT 0
      THEN 
        skip
      END
    END;
  
  EntryOK_1(currentTime) = 
    ANTICIPATED EVENT EntryOK_1 = /* of machine ref4_entry_L2 */
    USING VARIANT 0
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingEntry
      & /* @ref4_entry_L2:grd4_2  */ currentToken : dom(goodTok)
      & /* @ref4_entry_L2:grd4_3  */ goodTok(currentToken) = goodT
      & /* @ref4_entry_L2:grd4_4  */ userTokenPresence = present
      & /* @ref4_entry_L2:grd4_6  */ currentTime : NATURAL
      & currentToken : tokenID
      & currentToken : dom(attCertTokID~)
      & (attCertTokID~)(currentToken) : dom(isValidatedBy)
      & tokenPrivCert(currentToken) : dom(isValidatedBy)
      & tokenIandaCert(currentToken) : dom(isValidatedBy)
      & currentTime : entryPeriod(privCertRole(tokenPrivCert(currentToken)))(privCertClearence(tokenPrivCert(currentToken)))
    THEN 
         entry_status1 := waitingRemoveTokenSuccess
      ||
         displayMessage1 := openDoor
      ||
         tokenRemovalTimeout := currentTime + tokenRemovalDuration
    REFINES 
      ANTICIPATED EVENT EntryOK = /* of machine ref3_entry_L1 */
      USING VARIANT 0
      THEN 
        skip
      END
    END;
  
  EntryOK_2(currentTime) = 
    ANTICIPATED EVENT EntryOK_2 = /* of machine ref4_entry_L2 */
    USING VARIANT 0
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingEntry
      & /* @ref4_entry_L2:grd4_2  */ currentToken : dom(goodTok)
      & /* @ref4_entry_L2:grd4_3  */ goodTok(currentToken) = goodT
      & /* @ref4_entry_L2:grd4_4  */ userTokenPresence = present
      & /* @ref4_entry_L2:grd4_6  */ currentTime : NATURAL
      & currentToken : tokenID
      & currentToken : dom(attCertTokID~)
      & tokenAuthCert(currentToken) |-> currentTime : validityPeriods
      & (attCertTokID~)(currentToken) : dom(privCertRole)
      & currentToken : dom(tokenAuthCert)
      & (attCertTokID~)(currentToken) : dom(isValidatedBy)
      & currentTime : entryPeriod(privCertRole((attCertTokID~)(currentToken)))(privCertClearence((attCertTokID~)(currentToken)))
    THEN 
         entry_status1 := waitingRemoveTokenSuccess
      ||
         displayMessage1 := openDoor
      ||
         tokenRemovalTimeout := currentTime + tokenRemovalDuration
    REFINES 
      ANTICIPATED EVENT EntryOK = /* of machine ref3_entry_L1 */
      USING VARIANT 0
      THEN 
        skip
      END
    END;
  
  EntryNotAllowed_1(currentTime) = 
    EVENT EntryNotAllowed_1 = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingEntry
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
      & /* @ref4_entry_L2:grd4_2  */ currentTime : NATURAL
      & /* @ref4_entry_L2:grd4_5  */ not(currentToken : tokenID & (currentToken : dom(attCertTokID~) & ((attCertTokID~)(currentToken) : dom(isValidatedBy) & (tokenPrivCert(currentToken) : dom(isValidatedBy) & (tokenIandaCert(currentToken) : dom(isValidatedBy) & currentTime : entryPeriod(privCertRole(tokenPrivCert(currentToken)))(privCertClearence(tokenPrivCert(currentToken))))))))
    THEN 
         entry_status1 := waitingRemoveTokenFail
      ||
         displayMessage1 := removeToken
    REFINES 
      EVENT EntryNotAllowed = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  EntryNotAllowed_2(currentTime) = 
    EVENT EntryNotAllowed_2 = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingEntry
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
      & /* @ref4_entry_L2:grd4_2  */ currentTime : NATURAL
      & /* @ref4_entry_L2:grd4_5  */ not(currentToken : tokenID & (currentToken : dom(attCertTokID~) & (tokenAuthCert(currentToken) |-> currentTime : validityPeriods & ((attCertTokID~)(currentToken) : dom(privCertRole) & (currentToken : dom(tokenAuthCert) & ((attCertTokID~)(currentToken) : dom(isValidatedBy) & currentTime : entryPeriod(privCertRole((attCertTokID~)(currentToken)))(privCertClearence((attCertTokID~)(currentToken)))))))))
    THEN 
         entry_status1 := waitingRemoveTokenFail
      ||
         displayMessage1 := removeToken
    REFINES 
      EVENT EntryNotAllowed = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  TokenRemovalTimeout(currentTime) = 
    EVENT TokenRemovalTimeout = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingRemoveTokenSuccess
      & /* @ref4_entry_L2:grd4_1  */ userTokenPresence = present
      & /* @ref4_entry_L2:grd4_2  */ currentTime : NATURAL
      & /* @ref4_entry_L2:grd4_3  */ currentTime > tokenRemovalTimeout
    THEN 
         entry_status1 := waitingRemoveTokenFail
      ||
         displayMessage1 := removeToken
    REFINES 
      EVENT TokenRemovalTimeout = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  doNothing = 
    EVENT doNothing = /* of machine ref4_entry_L2 */
    WHEN 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingRemoveTokenSuccess or entry_status1 : {gotFinger,waitingRemoveTokenFail}
    THEN 
         displayMessage1 := blank
    REFINES 
      EVENT doNothing = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  unlockDoorOK(currentTime) = 
    EVENT unlockDoorOK = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd3_1  */ entry_status1 = waitingRemoveTokenSuccess
      & /* @ref4_entry_L2:grd4_1  */ currentTime : NATURAL
      & currentTime <= MAXTIME
      & currentTime <= latchTimeout1 - latchUnlockDuration
      & currentTime >= latchTimeout1
      & /* @ref4_entry_L2:grd4_3  */ userTokenPresence = absent
    THEN 
         entry_status1 := quiescent
      ||
         displayMessage1 := doorUnlocked
      ||
         latchTimeout1 := currentTime + latchUnlockDuration
      ||
         alarmTimeout1 := currentTime + (latchUnlockDuration + alarmSilentDuration)
    REFINES 
      EVENT unlockDoorOK = /* of machine ref3_entry_L1 */
      THEN 
        skip
      END
    END;
  
  lockDoor(currentTime) = 
    EVENT lockDoor = /* of machine ref4_entry_L2 */
    ANY currentTime
    WHERE 
        /* @ref4_entry_L2:grd4_0  */ currentTime : NATURAL
      & /* @ref4_entry_L2:grd4_1  */ currentTime < MAXTIME
      & /* @ref4_entry_L2:grd4_2  */ locked = FALSE
      & (/* @ref4_entry_L2:grd4_3  */ currentTime <= latchTimeout1 - latchUnlockDuration or currentTime >= latchTimeout1)
    THEN 
         locked := TRUE
    END
END
