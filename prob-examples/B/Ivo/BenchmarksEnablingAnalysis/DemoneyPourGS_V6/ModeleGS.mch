MACHINE ModeleGS

SETS 
  StatesOfLife      = {Personalization, Processing}
;
  APDUCommands       = {APDU_INS_Select, 
                        APDU_INS_StoreData,
                        APDU_INS_InitializeUpdate,
                        APDU_INS_ExternalAuthentification,
                        APDU_INS_GetData,
                        APDU_INS_InitializeTransaction,
                        APDU_INS_CompleteTransaction,
                        APDU_INS_VerifyPIN,
                        APDU_INS_Reponse /*Car la commande d'une réponse est indéfinie*/} 
;
  CMD_DEMONEY = {DEM_CMD_None,
                 DEM_CMD_Select,
                 DEM_CMD_Deselect,
                 DEM_CMD_Process}


CONSTANTS
  TypesOfStatus,
  APDU_ISOSW_Err_AuthFailed,
  APDU_ISOSW_Err_PinFailed,
  APDU_ISOSW_Err_LcLengthFailed,
  APDU_ISOSW_Err_SecurityStatusFailed,
  APDU_ISOSW_Err_PinBlocked,
  APDU_ISOSW_Err_ConditionOfUseFailed,
  APDU_ISOSW_Err_IncorrectParams,
  APDU_ISOSW_Err_FunctionNotSupported,
  APDU_ISOSW_Err_RecordNotFound,
  APDU_ISOSW_Err_IncorrectLc,
  APDU_ISOSW_Err_IncorrectParamsP1P2,
  APDU_ISOSW_Err_DataReferenceFailed,
  APDU_ISOSW_Err_LeFailed,
  APDU_ISOSW_Err_InstructionNotSupported,
  APDU_ISOSW_Err_ClassNotSupported,
  APDU_ISOSW_Ok,
  APDU_DEMSW_ERR_MaxNumOfTransactionReached,
  APDU_DEMSW_ERR_CurrencyError,
  APDU_DEMSW_ERR_CreditTooHigh,
  APDU_DEMSW_ERR_DebitTooHigh,
  APDU_DEMSW_ERR_InvalidAmount
  
PROPERTIES
  APDU_ISOSW_Err_AuthFailed = 0 &
  APDU_ISOSW_Err_PinFailed = 1 &
  APDU_ISOSW_Err_LcLengthFailed = 2 &
  APDU_ISOSW_Err_SecurityStatusFailed = 3 &
  APDU_ISOSW_Err_PinBlocked = 4 &
  APDU_ISOSW_Err_ConditionOfUseFailed = 5 &
  APDU_ISOSW_Err_IncorrectParams = 6 &
  APDU_ISOSW_Err_FunctionNotSupported = 7 &
  APDU_ISOSW_Err_RecordNotFound = 8 &
  APDU_ISOSW_Err_IncorrectLc = 9 &
  APDU_ISOSW_Err_IncorrectParamsP1P2 = 10 &
  APDU_ISOSW_Err_DataReferenceFailed = 11 &
  APDU_ISOSW_Err_LeFailed = 12 &
  APDU_ISOSW_Err_InstructionNotSupported = 13 &
  APDU_ISOSW_Err_ClassNotSupported = 14 &
  APDU_ISOSW_Ok = 15 &
  APDU_DEMSW_ERR_MaxNumOfTransactionReached = 16 &
  APDU_DEMSW_ERR_CurrencyError = 17 &
  APDU_DEMSW_ERR_CreditTooHigh = 18 &
  APDU_DEMSW_ERR_DebitTooHigh = 19 &
  APDU_DEMSW_ERR_InvalidAmount = 20 &
  TypesOfStatus = 0..20

VARIABLES 
  CurLifeState,
  DEMONEYSelected,
  
  APDU_EmisParCarte,
  APDU_EmisParTerminal,
  
  APDU_RecuParCarte_INS,
  APDU_EmisParCarte_StatusWord,
  
  APDU_RecuParCarte_TraiteParJCRE,
  Commande_DEMONEY

INVARIANT
  CurLifeState : StatesOfLife &
  DEMONEYSelected : BOOL &
  
  APDU_EmisParCarte : BOOL &
  APDU_EmisParTerminal : BOOL &
  (APDU_EmisParCarte=TRUE  => APDU_EmisParTerminal=TRUE) &
  
  
  APDU_RecuParCarte_INS : APDUCommands &
  APDU_EmisParCarte_StatusWord : TypesOfStatus &
  (APDU_EmisParCarte=FALSE  => APDU_EmisParCarte_StatusWord = APDU_ISOSW_Ok) &

  APDU_RecuParCarte_TraiteParJCRE : BOOL &
  
  Commande_DEMONEY : CMD_DEMONEY &
  (Commande_DEMONEY = DEM_CMD_Process => (DEMONEYSelected=TRUE)) &
  
  (Commande_DEMONEY = DEM_CMD_Process => APDU_EmisParCarte=FALSE) /*&
  
  (APDU_RecuParCarte_TraiteParJCRE = FALSE => APDU_EmisParCarte=FALSE)*/

INITIALISATION
  CurLifeState := Personalization ||
  DEMONEYSelected := FALSE ||
  
  APDU_EmisParCarte := FALSE ||
  APDU_EmisParTerminal := FALSE ||
  
  APDU_RecuParCarte_INS :: APDUCommands ||
  APDU_EmisParCarte_StatusWord := APDU_ISOSW_Ok ||

  APDU_RecuParCarte_TraiteParJCRE := FALSE ||

  Commande_DEMONEY := DEM_CMD_None

ASSERTIONS
      APDU_EmisParCarte_StatusWord = APDU_ISOSW_Ok or APDU_EmisParCarte_StatusWord /= APDU_ISOSW_Ok

OPERATIONS
/*************************************************
* Retrait de la carte => Reset
*/
  Reset = BEGIN
    DEMONEYSelected := FALSE ||
    APDU_EmisParCarte := FALSE ||
    APDU_EmisParTerminal := FALSE ||
    APDU_RecuParCarte_TraiteParJCRE := FALSE || 
    Commande_DEMONEY := DEM_CMD_None ||
    APDU_EmisParCarte_StatusWord := APDU_ISOSW_Ok
  END

;

/*************************************************
* Aucun APDU n'est à traiter, alors le terminal 
* emet une nouvelle commande.
*/
  Terminal_EmissionAPDU = SELECT APDU_EmisParTerminal = FALSE & APDU_EmisParCarte = FALSE THEN
    APDU_RecuParCarte_TraiteParJCRE := FALSE
 || CHOICE
      APDU_RecuParCarte_INS := APDU_INS_Select 
    OR 
      APDU_RecuParCarte_INS := APDU_INS_GetData
    OR 
      APDU_RecuParCarte_INS := APDU_INS_StoreData
    OR 
      APDU_RecuParCarte_INS := APDU_INS_InitializeUpdate
    OR 
      APDU_RecuParCarte_INS := APDU_INS_ExternalAuthentification
    OR 
      APDU_RecuParCarte_INS := APDU_INS_InitializeTransaction
    OR 
      APDU_RecuParCarte_INS := APDU_INS_CompleteTransaction
    OR 
      APDU_RecuParCarte_INS := APDU_INS_VerifyPIN
    END
  END

;

/*************************************************
* La dernière commande émise viens de terminer sans erreur 
* (où alors les eurreurs ont déjà été traitées)
*/
  Terminal_AquiteAPDU = SELECT APDU_EmisParTerminal = TRUE & 
                               APDU_EmisParCarte = TRUE & 
                               APDU_EmisParCarte_StatusWord = APDU_ISOSW_Ok THEN
    APDU_EmisParTerminal := FALSE 
 || APDU_EmisParCarte := FALSE
 || APDU_EmisParCarte_StatusWord := APDU_ISOSW_Ok
  END

;

/*************************************************
* La dernière commande émise viens de terminer avec une erreur 
*/
  Terminal_TraiteErreur = SELECT APDU_EmisParTerminal = TRUE & 
                                 APDU_EmisParCarte = TRUE & 
                                 APDU_EmisParCarte_StatusWord /= APDU_ISOSW_Ok THEN
    APDU_EmisParCarte_StatusWord := APDU_ISOSW_Ok
  END

;

/*************************************************
* Le JCRE pré-traite la commande reçue
*/
  JCRE_TraitementAPDU = SELECT APDU_EmisParTerminal = TRUE & APDU_RecuParCarte_TraiteParJCRE = FALSE & APDU_EmisParCarte = FALSE  THEN
    IF APDU_RecuParCarte_INS = APDU_INS_Select THEN
      IF DEMONEYSelected = TRUE THEN
        Commande_DEMONEY := DEM_CMD_Deselect
      ELSE
        Commande_DEMONEY:= DEM_CMD_Select
      END
    ELSE
      IF DEMONEYSelected=TRUE THEN
        Commande_DEMONEY := DEM_CMD_Process
      ELSE
        /* Ce cas est celui l'applet n'est pas sélectionnée avant d'être appelé */
        APDU_EmisParCarte := TRUE 
     || APDU_EmisParCarte_StatusWord := APDU_ISOSW_Err_ConditionOfUseFailed
      END
    END
  END
  
  
;

/*************************************************
* Commande DEMONEY DESELECT
*/
  DEMONEY_Deselect = SELECT APDU_EmisParTerminal = TRUE & 
                            APDU_RecuParCarte_TraiteParJCRE = FALSE &
                            Commande_DEMONEY = DEM_CMD_Deselect &
                            APDU_EmisParCarte = FALSE
  THEN
    CHOICE
      DEMONEYSelected:=FALSE
   || Commande_DEMONEY:= DEM_CMD_Select
    OR
      APDU_EmisParCarte := TRUE 
   || Commande_DEMONEY:= DEM_CMD_None
   || APDU_EmisParCarte_StatusWord := APDU_ISOSW_Err_ConditionOfUseFailed
    END
  END
  
;

/*************************************************
* Commande DEMONEY SELECT
*/
  DEMONEY_Select = SELECT APDU_EmisParTerminal = TRUE & 
                          APDU_RecuParCarte_TraiteParJCRE = FALSE &
                          Commande_DEMONEY = DEM_CMD_Select &
                          APDU_EmisParCarte = FALSE
  THEN
    CHOICE
      DEMONEYSelected:=TRUE
   || APDU_RecuParCarte_TraiteParJCRE := TRUE
    OR/*
      DEMONEYSelected:=FALSE
   || */APDU_EmisParCarte_StatusWord := APDU_ISOSW_Err_ConditionOfUseFailed
   || APDU_EmisParCarte := TRUE
    END
 || Commande_DEMONEY:= DEM_CMD_None
  END
  
  
  
;

/*************************************************
* Commande DEMONEY PROCESS
*/
  DEMONEY_Process = SELECT APDU_EmisParTerminal = TRUE & 
                           APDU_RecuParCarte_TraiteParJCRE = TRUE &
                           Commande_DEMONEY = DEM_CMD_Process &
                           APDU_EmisParCarte = FALSE
  THEN
    IF CurLifeState=Processing & (   APDU_RecuParCarte_INS = APDU_INS_InitializeUpdate 
                                  or APDU_RecuParCarte_INS = APDU_INS_ExternalAuthentification 
                                  or APDU_RecuParCarte_INS = APDU_INS_InitializeTransaction 
                                  or APDU_RecuParCarte_INS = APDU_INS_CompleteTransaction 
                                  or APDU_RecuParCarte_INS = APDU_INS_VerifyPIN) 
    THEN
      APDU_EmisParCarte_StatusWord := APDU_ISOSW_Err_ConditionOfUseFailed
    ELSE
    
      /* On sait que DEMONEY est déjà sélectionné (par le JCRE) */
      CHOICE 
        ANY St WHERE St : TypesOfStatus & St /= APDU_ISOSW_Ok THEN
          APDU_EmisParCarte_StatusWord := St
        END
      OR
        APDU_EmisParCarte_StatusWord := APDU_ISOSW_Ok
      OR
        APDU_EmisParCarte_StatusWord := APDU_ISOSW_Ok
     || CurLifeState:=Processing 
      END
    END
 || APDU_EmisParCarte := TRUE
 || Commande_DEMONEY := DEM_CMD_None
  END
END
