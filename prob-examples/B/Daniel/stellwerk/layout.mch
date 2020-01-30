MACHINE
    layout
SETS
    /* requirement S-1: there are sections */
    SECTION
ABSTRACT_CONSTANTS
    tracks,
    switches,
    start_tracks, end_tracks,
    track_next,
    switch_next_left, switch_next_right
PROPERTIES
      tracks <: SECTION
    & switches <: SECTION
    
    /* requirement S-2: */
    & tracks /\ switches = {}
    /* requirement S-3: */
    & tracks \/ switches = SECTION
    
    /* requirement S-4: */
    & start_tracks <: tracks
    /* requirement S-5: */
    & end_tracks <: tracks
    
    /* requirement S-6: */
    & track_next : (tracks - end_tracks) --> SECTION
    /* requirement S-7a: left section after switch */
    & switch_next_left : switches --> SECTION
    /* requirement S-7b: right section after switch */
    & switch_next_right : switches --> SECTION 
END
