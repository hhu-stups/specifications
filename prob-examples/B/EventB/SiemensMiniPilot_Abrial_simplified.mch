MODEL mch_0
 /* A simplifed model where there is no delay between controller's input and reality */
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE;
 ASSERT_LTL == "G ([take_decision_1_brake] => X e(SystemStable))"; /* TRUE */
 ASSERT_LTL1 == "G ([take_decision_2_brake] => X e(SystemStable))"; /* TRUE */
 ASSERT_LTL2 == "G ([take_decision_3] => X e(SystemStable))"; /* TRUE */
 ASSERT_LTL3 == "G ([take_decision_4] => X e(SystemStable))"; /* TRUE */
 ASSERT_LTL4 == "G not(sink)"; /* TRUE */
 ASSERT_LTL5 == "G ({brake=TRUE} => O ([TRAIN_FALSE] or [DRIVER_BYPASS]))"; /* TRUE */
 ASSERT_LTL6 == "G (({brake=TRUE} & Y{brake=FALSE}) => ({brake=TRUE} W ([TRAIN_TRUE] or [DRIVER_ATPR] or [DRIVER_ATPF])))"; /* FALSE */
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
                               (r=2 & c=1 & ((TRUE=TRUE & i=9) or (TRUE=FALSE & i=10))) or
                               (r=2 & c=0 & ((ctr_mode=atpf & i=5) or (ctr_mode=atpr & i=6) 
                                              or (ctr_mode=bypass & i=7) ) ) or
                               (r=2 & c=2 & i=8) };
  STABLE_INV == ((SELECTION = bypass => brake = TRUE) &
(( SELECTION = atpf & TRAIN_CBTC = FALSE) => (ctr_mode /= SELECTION)) & 
(ctr_mode /= SELECTION => brake = TRUE) &
(( (SELECTION = bypass)) => (ctr_mode = bypass)) & (( (SELECTION = atpf) & (TRAIN_CBTC = TRUE)) => (brake = FALSE)) &
(( (SELECTION = atpr)) => (brake = FALSE)) & 
(( (SELECTION = atpf) & (TRAIN_CBTC = TRUE)) => (ctr_mode = atpf)) & (( (SELECTION = atpr)) => (ctr_mode = atpr)))
SETS MODE={atpf,atpr,bypass}
VARIABLES SELECTION,TRAIN_CBTC,brake,ctr_mode
INVARIANT 
 SELECTION:MODE & TRAIN_CBTC:BOOL & ctr_mode:MODE & brake:BOOL 
INITIALISATION 
               ctr_mode := (atpr) || brake := (FALSE) || 
               SELECTION := (atpr) || 
               TRAIN_CBTC := TRUE /* changed initialisation */
OPERATIONS
/* DRIVER(mode) =  PRE mode:MODE THEN SELECTION := mode END ; 
*/
 DRIVER_ATPF = SELECT SELECTION /= atpf THEN SELECTION := atpf END;
 DRIVER_ATPR = SELECT SELECTION /= atpr THEN SELECTION := atpr END;
 DRIVER_BYPASS = SELECT SELECTION /= bypass THEN SELECTION := bypass END; 
/* TRAIN(cbtc) =  PRE cbtc:BOOL THEN TRAIN_CBTC := cbtc END ; */

 TRAIN_TRUE = SELECT TRAIN_CBTC=FALSE THEN TRAIN_CBTC := TRUE END;
 TRAIN_FALSE = SELECT TRAIN_CBTC=TRUE THEN TRAIN_CBTC := FALSE END;
 
 take_decision_1_brake = SELECT  (SELECTION = bypass) THEN brake := (TRUE) || ctr_mode := (bypass) END ;
 take_decision_2_brake = SELECT  (SELECTION = atpf) & (TRAIN_CBTC = FALSE) THEN  brake := (TRUE) || ctr_mode := (atpr) END ;
 take_decision_3 = SELECT  (SELECTION = atpf) & (TRAIN_CBTC = TRUE) THEN  ctr_mode := (atpf) || brake := (FALSE) END ;
 take_decision_4 = SELECT (SELECTION = atpr) THEN 
    ctr_mode := (atpr) || brake := (FALSE) END ;

 SystemUnstable = SELECT not(STABLE_INV) THEN skip END;
 SystemStable = SELECT STABLE_INV THEN skip END;
/* Query Operations */
 EmergencyBrakeOn = SELECT brake=TRUE THEN skip END
END