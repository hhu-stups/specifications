MODEL SiemensMiniPilot_Abrial_mch_0
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE;
 GOAL == (brake=TRUE);

SETS MODE={atpf,atpr,bypass}
VARIABLES SELECTION,TRAIN_CBTC,brake,ctr_mode,decision,new_sel_mode,new_trn_cbtc,old_sel_mode,old_trn_cbtc
INVARIANT (new_sel_mode : MODE) & (new_trn_cbtc : BOOL) & (((decision = FALSE) & (old_sel_mode = bypass)) => (brake = TRUE)) & (((decision = FALSE) & (old_sel_mode = atpf) & (old_trn_cbtc = FALSE)) => (ctr_mode /= old_sel_mode)) & (((decision = FALSE) & (ctr_mode /= old_sel_mode)) => (brake = TRUE)) & (SELECTION : MODE) & (TRAIN_CBTC : BOOL) & (((decision = FALSE) & (old_sel_mode = bypass)) => (ctr_mode = bypass)) & (((decision = FALSE) & (old_sel_mode = atpf) & (old_trn_cbtc = TRUE)) => (brake = FALSE)) & (((decision = FALSE) & (old_sel_mode = atpr)) => (brake = FALSE)) & (((decision = FALSE) & (old_sel_mode = atpf) & (old_trn_cbtc = TRUE)) => (ctr_mode = atpf)) & (((decision = FALSE) & (old_sel_mode = atpr)) => (ctr_mode = atpr))
INITIALISATION old_sel_mode := (atpr) || new_sel_mode := (atpr) ||
               old_trn_cbtc := (FALSE) || new_trn_cbtc := (FALSE) ||
               ctr_mode := (atpr) || brake := (FALSE) || decision := (FALSE) ||
               SELECTION := (atpr) || 
               TRAIN_CBTC := TRUE /* changed initialisation */
OPERATIONS
 DRIVER(mode) =  PRE mode:MODE THEN SELECTION := mode END ; 
/*
 DRIVER_ATPF = SELECT SELECTION /= atpf THEN SELECTION := atpf END;
 DRIVER_ATPR = SELECT SELECTION /= atpr THEN SELECTION := atpr END;
 DRIVER_BYPASS = SELECT SELECTION /= bypass THEN SELECTION := bypass END; */
/* TRAIN(cbtc) =  PRE cbtc:BOOL THEN TRAIN_CBTC := cbtc END ; */

 TRAIN_TRUE = SELECT TRAIN_CBTC=FALSE THEN TRAIN_CBTC := TRUE END;
 TRAIN_FALSE = SELECT TRAIN_CBTC=TRUE THEN TRAIN_CBTC := FALSE END; 
/* get_information = SELECT (decision = FALSE) THEN decision := (TRUE) || new_sel_mode := (SELECTION) || new_trn_cbtc := (TRAIN_CBTC) || old_sel_mode := (new_sel_mode) || old_trn_cbtc := (new_trn_cbtc) END ; */
get_information2 = SELECT (decision = FALSE) THEN decision := (TRUE) || old_sel_mode := (SELECTION) || old_trn_cbtc := (TRAIN_CBTC) END ;
 take_decision_1_brake = SELECT (decision = TRUE) & (old_sel_mode = bypass) THEN decision := (FALSE) || brake := (TRUE) || ctr_mode := (bypass) END ;
 take_decision_2_brake = SELECT (decision = TRUE) & (old_sel_mode = atpf) & (old_trn_cbtc = FALSE) THEN decision := (FALSE) || brake := (TRUE) || ctr_mode := (atpr) END ;
 take_decision_3 = SELECT (decision = TRUE) & (old_sel_mode = atpf) & (old_trn_cbtc = TRUE) THEN decision := (FALSE) || ctr_mode := (atpf) || brake := (FALSE) END ;
 take_decision_4 = SELECT (decision = TRUE) & (old_sel_mode = atpr) THEN decision := (FALSE) || ctr_mode := (atpr) || brake := (FALSE) END ;


/* Query Operations */
 EmergencyBrakeOn = SELECT brake=TRUE THEN skip END
END