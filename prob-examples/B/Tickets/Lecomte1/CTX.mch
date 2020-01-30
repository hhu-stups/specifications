SYSTEM
    CTX
    
SETS
    MODES = {MOff, MStandby, MSafe, MNominal, MPreparation, MScience};
    UNIT_STATUS = {UOn, UOff, UCoarse_Navigation, UFine_Navigation, UStandby, UScience};
    UNIT_TYPE = {ES, SS, GPS, STR, RW, THR, PLI};
    TRANSITION_CONDITIONS = {Standby_Entered_Once, Separation_Done, Coarse_Pointing_Reached, Fine_Pointing_Reached, PLI_Is_Ready}
    
ABSTRACT_CONSTANTS
    UNIT_CONFIG,
    MODE2CONFIG,
    NEXT
    
PROPERTIES
    /* Définit les status possibles pour un type d'unité*/
    UNIT_CONFIG: UNIT_TYPE --> POW(UNIT_STATUS) &
    !(ut).(ut: UNIT_TYPE => UOff : UNIT_CONFIG(ut)) &  /* Il est possible d'avoir toutes les unités à l'état Off */
    
    /* UNIT_CONFIG = {
    ES |-> {UOff, UOn},
    SS |-> {UOff, UOn},
    GPS |-> {UOff, UCoarse_Navigation, UFine_Navigation},
    STR |-> {UOff, UOn},
    RW |-> {UOff, UOn},
    THR |-> {UOff, UOn},
    PLI |-> {UOff, UStandby, UScience}
    } & */
    
    /* Définit pour tous les modes l'unique status de chaque type d'unité */
    MODE2CONFIG: MODES --> (UNIT_TYPE --> UNIT_STATUS) &
    !(mm, ut).(mm: MODES & ut: UNIT_TYPE => MODE2CONFIG(mm)(ut): UNIT_CONFIG(ut) ) & /* Ces status d'unités correspondent aux status possibles */
    
    /* Définit le successeur d'un mode pour une condition de transition donnée */
    NEXT: MODES +-> (TRANSITION_CONDITIONS +-> MODES) 
    
END
