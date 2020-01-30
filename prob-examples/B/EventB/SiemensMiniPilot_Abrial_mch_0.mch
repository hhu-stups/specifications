MODEL SiemensMiniPilot_Abrial_mch_0
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE;
 ASSERT_LTL == "G (e(take_decision_1_brake) => O [get_information])"; /* TRUE */
 ASSERT_LTL2 == "G not(sink)"; /* TRUE */
 ASSERT_LTL3 == "G ({brake=TRUE} => O ([TRAIN_FALSE] or [DRIVER_BYPASS]))"; /* TRUE */
 ASSERT_LTL4 == "G (({brake=TRUE} & Y{brake=FALSE}) => ({brake=TRUE} W ([TRAIN_TRUE] or [DRIVER_ATPR])))"; /* FALSE */
 /* G ( {SELECTION=atpf & TRAIN_CBTC=FALSE => brake=TRUE}) is FALSE */
 GOAL == (brake=TRUE);

 ANIMATION_IMG1 == "images/train/Train.gif";
 ANIMATION_IMG2 == "images/train/Train_Brakes.gif";
 ANIMATION_IMG3 == "images/train/Emitter_On.gif";
 ANIMATION_IMG4 == "images/train/Emitter_Off.gif";
 ANIMATION_IMG5 == "images/train/ATPF.gif";
 ANIMATION_IMG6 == "images/train/ATPR.gif";
 ANIMATION_IMG7 == "images/train/Bypass.gif";
 ANIMATION_IMG8 == "images/train/Controller.gif";
 ANIMATION_IMG9 == "images/train/DownArrow_On.gif";
 ANIMATION_IMG10 == "images/train/DownArrow_Off.gif";
 ANIMATION_FUNCTION == {r,c,i| (r=1 & c=0 & ((SELECTION=atpf & i=5) or (SELECTION=atpr & i=6) 
                                              or (SELECTION=bypass & i=7) ) ) or
                               (r=1 & c=1 & ((brake=TRUE & i=2) or (brake=FALSE & i=1))) or
                               (r=1 & c=2 & ((TRAIN_CBTC=TRUE & i=3)  or (TRAIN_CBTC=FALSE & i=4))) or
                               (r=2 & c=1 & ((decision=TRUE & i=9) or (decision=FALSE & i=10))) or
                               (r=2 & c=0 & ((ctr_mode=atpf & i=5) or (ctr_mode=atpr & i=6) 
                                              or (ctr_mode=bypass & i=7) ) ) or
                               (r=2 & c=2 & i=8) }
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