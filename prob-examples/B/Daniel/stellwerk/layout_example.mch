MACHINE
    layout_example
SETS
    /* requirement S-1: there are sections */
    SECTION = {s1,s2,s3,s4,s5,s7,s6,s8,w1,w2}
ABSTRACT_CONSTANTS
    tracks,
    switches,
    start_tracks, end_tracks,
    track_next,
    switch_next_left, switch_next_right
PROPERTIES
      tracks <: SECTION
    & switches <: SECTION

    /* example data */
    & tracks = {s1,s2,s3,s4,s5,s7,s6,s8}
    & switches = {w1,w2}
    & start_tracks = {s1,s2,s3}
    & end_tracks = {s7,s8}
    & track_next = {s1|->s4,s2|->s4,s3|->w1,s4|->w2,s5|->s6,s6|->s8}
    & switch_next_left = {w1|->s4,w2|->s7}
    & switch_next_right = {w1|->s5,w2|->s6}

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
