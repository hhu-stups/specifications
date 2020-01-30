
MACHINE b_5
SETS /* deferred */
  D
 ; /* enumerated */
  STATUS={working,success,failure}
CONCRETE_CONSTANTS
  f,
  n,
  MAX
ABSTRACT_VARIABLES
  ab,
  c,
  db,
  l,
  v,
  d,
  s,
  w,
  g,
  r,
  r_st,
  s_st
/* PROMOTED OPERATIONS
  brp,
  RCV_current_data,
  RCV_rcv_retry,
  RCV_snd_ack,
  RCV_success,
  RCV_failure,
  SND_success,
  SND_failure,
  SND_rcv_current_ack,
  SND_snd_current_data,
  SND_snd_last_data,
  SND_time_out_current,
  DMN_data_channel,
  DMN_ack_channel */
PROPERTIES
    /* @axm1 */ 0 < n
  & /* @axm2 */ f : 1 .. n --> D
  & /* @axm1 */ MAX : NAT
INVARIANT
    /* @inv1 */ s_st = success => r_st = success
  & /* @inv1 */ r : 0 .. n
  & /* @inv2 */ g = 1 .. r <| f
  & /* @inv3 */ (r_st = success) <=> (r = n)
  & (/* @inv3_1 */ w = TRUE => db = FALSE)
  & (/* @inv3_2 */ w = TRUE => ab = FALSE)
  & (/* @inv3_3 */ w = TRUE => v = FALSE)
  & (/* @inv3_4 */ db = TRUE => ab = FALSE)
  & (/* @inv3_5 */ db = TRUE => v = FALSE)
  & (/* @inv3_6 */ ab = TRUE => v = FALSE)
  & (/* @inv3_7 */ db = TRUE & (r = s & l = FALSE) => s + 1 < n)
  & (/* @inv3_8 */ db = TRUE & (r = s & l = TRUE) => s + 1 = n)
  & /* @inv3_9 */ c : 0 .. MAX + 1
  & /* @inv3_10 */ (c = MAX + 1) <=> (s_st = failure)
  & (/* @inv3_11 */ ab = TRUE => r /= s)
  & (/* @inv3_12 */ v = TRUE => r /= s)
  & (/* @inv1 */ s_st = success => r_st = success)
  & /* @inv4_1 */ s : 0 .. n - 1
  & /* @inv4_2 */ r : s .. s + 1
  & (/* @inv4_3 */ w = FALSE => d = f(s + 1))
  & /* @inv1 */ r : 0 .. n
  & /* @inv2 */ g = 1 .. r <| f
  & /* @inv3 */ (r_st = success) <=> (r = n)
  & (/* @inv1 */ s_st = success => r_st = success)
INITIALISATION
    EVENT INITIALISATION = /* of machine b_5 */
    THEN 
         r_st := working
      ||
         s_st := working
      ||
         r := 0
      ||
         g := {}
      ||
         w := TRUE
      ||
         s := 0
      ||
         d := f(1)
      ||
         db := FALSE
      ||
         ab := FALSE
      ||
         v := FALSE
      ||
         l := FALSE
      ||
         c := 0
    REFINES 
      EVENT INITIALISATION = /* of machine b_4 */
      THEN 
           r_st := working
        ||
           s_st := working
        ||
           r := 0
        ||
           g := {}
        ||
           w := TRUE
        ||
           s := 0
        ||
           d := f(1)
      REFINES 
        EVENT INITIALISATION = /* of machine b_3 */
        THEN 
             r_st := working
          ||
             s_st := working
          ||
             r := 0
          ||
             g := {}
        REFINES 
          EVENT INITIALISATION = /* of machine b_2 */
          THEN 
               r_st := working
            ||
               s_st := working
          REFINES 
            EVENT INITIALISATION = /* of machine b_1 */
            THEN 
                 r_st := working
              ||
                 s_st := working
            REFINES 
              EVENT INITIALISATION = /* of machine b_0 */
              THEN 
                   r_st := working
                ||
                   s_st := working
              END
            END
          END
        END
      END
    END
OPERATIONS
  brp = 
    EVENT brp = /* of machine b_5 */
    WHEN 
        /* @grd1 */ r_st /= working
      & /* @grd2 */ s_st /= working
    THEN 
      skip
    REFINES 
      EVENT brp = /* of machine b_4 */
      WHEN 
          /* @grd1 */ r_st /= working
        & /* @grd2 */ s_st /= working
      THEN 
        skip
      REFINES 
        EVENT brp = /* of machine b_3 */
        WHEN 
            /* @grd1 */ r_st /= working
          & /* @grd2 */ s_st /= working
        THEN 
          skip
        REFINES 
          EVENT brp = /* of machine b_2 */
          WHEN 
              /* @grd1 */ r_st /= working
            & /* @grd2 */ s_st /= working
          THEN 
            skip
          REFINES 
            EVENT brp = /* of machine b_1 */
            WHEN 
                /* @grd1 */ r_st /= working
              & /* @grd2 */ s_st /= working
            THEN 
              skip
            REFINES 
              EVENT brp = /* of machine b_0 */
              WHEN 
                  /* @grd1 */ r_st /= working
                & /* @grd2 */ s_st /= working
              THEN 
                skip
              END
            END
          END
        END
      END
    END;
  
  RCV_current_data = 
    EVENT RCV_current_data = /* of machine b_5 */
    WHEN 
        /* @grd1 */ r_st = working
      & /* @grd3 */ r = s
      & /* @grd4 */ db = TRUE
      & /* @grd5 */ l = FALSE
    THEN 
         r := r + 1
      ||
         g := g \/ {r + 1 |-> d}
      ||
         db := FALSE
      ||
         v := TRUE
    REFINES 
      EVENT RCV_current_data = /* of machine b_4 */
      WHEN 
          /* @grd1 */ r_st = working
        & /* @grd2 */ r + 1 < n
        & /* @grd3 */ r = s
        & /* @grd4 */ w = FALSE
      THEN 
           r := r + 1
        ||
           g := g \/ {r + 1 |-> d}
      REFINES 
        CONVERGENT EVENT RCV_current_data = /* of machine b_3 */
        USING VARIANT n - r
        WHEN 
            /* @grd1 */ r_st = working
          & /* @grd2 */ r + 1 < n
        THEN 
             r := r + 1
          ||
             g := g \/ {r + 1 |-> f(r + 1)}
        END
      END
    END;
  
  RCV_rcv_retry = 
    EVENT RCV_rcv_retry = /* of machine b_5 */
    WHEN 
        /* @grd1 */ db = TRUE
      & /* @grd2 */ r /= s
    THEN 
         db := FALSE
      ||
         v := TRUE
    END;
  
  RCV_snd_ack = 
    EVENT RCV_snd_ack = /* of machine b_5 */
    WHEN 
        /* @grd1 */ v = TRUE
    THEN 
         v := FALSE
      ||
         ab := TRUE
    END;
  
  RCV_success = 
    EVENT RCV_success = /* of machine b_5 */
    WHEN 
        /* @grd1 */ r_st = working
      & /* @grd3 */ r = s
      & /* @grd4 */ db = TRUE
      & /* @grd5 */ l = TRUE
    THEN 
         r_st := success
      ||
         r := r + 1
      ||
         g := g \/ {n |-> d}
      ||
         db := FALSE
      ||
         v := TRUE
    REFINES 
      EVENT RCV_success = /* of machine b_4 */
      WHEN 
          /* @grd1 */ r_st = working
        & /* @grd2 */ r + 1 = n
        & /* @grd3 */ r = s
        & /* @grd4 */ w = FALSE
      THEN 
           r_st := success
        ||
           r := r + 1
        ||
           g := g \/ {n |-> d}
      REFINES 
        EVENT RCV_success = /* of machine b_3 */
        WHEN 
            /* @grd1 */ r_st = working
          & /* @grd2 */ r + 1 = n
        THEN 
             r_st := success
          ||
             r := r + 1
          ||
             g := g \/ {n |-> f(n)}
        REFINES 
          CONVERGENT EVENT RCV_success = /* of machine b_2 */
          USING VARIANT {success,failure,r_st}
          WHEN 
              /* @grd1 */ r_st = working
          THEN 
               r_st := success
          REFINES 
            ANTICIPATED EVENT RCV_progress = /* of machine b_1 */
            USING VARIANT {success,failure,s_st}
            THEN 
                 r_st :: {success,failure}
            REFINES 
              ANTICIPATED EVENT RCV_progress = /* of machine b_0 */
              USING VARIANT 0
              THEN 
                   r_st :: {success,failure}
              END
            END
          END
        END
      END
    END;
  
  RCV_failure = 
    EVENT RCV_failure = /* of machine b_5 */
    WHEN 
        /* @grd1 */ r_st = working
      & /* @grd2 */ c = MAX + 1
    THEN 
         r_st := failure
    REFINES 
      EVENT RCV_failure = /* of machine b_4 */
      WHEN 
          /* @grd1 */ r_st = working
        & /* @grd2 */ s_st = failure
      THEN 
           r_st := failure
      REFINES 
        EVENT RCV_failure = /* of machine b_3 */
        WHEN 
            /* @grd1 */ r_st = working
          & /* @grd2 */ s_st = failure
        THEN 
             r_st := failure
        REFINES 
          CONVERGENT EVENT RCV_failure = /* of machine b_2 */
          USING VARIANT {success,failure,r_st}
          WHEN 
              /* @grd1 */ r_st = working
            & /* @grd2 */ s_st = failure
          THEN 
               r_st := failure
          REFINES 
            ANTICIPATED EVENT RCV_progress = /* of machine b_1 */
            USING VARIANT {success,failure,s_st}
            THEN 
                 r_st :: {success,failure}
            REFINES 
              ANTICIPATED EVENT RCV_progress = /* of machine b_0 */
              USING VARIANT 0
              THEN 
                   r_st :: {success,failure}
              END
            END
          END
        END
      END
    END;
  
  SND_success = 
    EVENT SND_success = /* of machine b_5 */
    WHEN 
        /* @grd1 */ s_st = working
      & /* @grd2 */ ab = TRUE
      & /* @grd3 */ s + 1 = n
    THEN 
         s_st := success
      ||
         c := 0
      ||
         ab := FALSE
    REFINES 
      EVENT SND_success = /* of machine b_4 */
      WHEN 
          /* @grd1 */ s_st = working
        & /* @grd2 */ w = FALSE
        & /* @grd3 */ s + 1 = n
        & /* @grd4 */ r = s + 1
      THEN 
           s_st := success
      REFINES 
        EVENT SND_success = /* of machine b_3 */
        WHEN 
            /* @grd1 */ s_st = working
          & /* @grd2 */ r_st = success
        THEN 
             s_st := success
        REFINES 
          EVENT SND_success = /* of machine b_2 */
          WHEN 
              /* @grd1 */ s_st = working
            & /* @grd2 */ r_st = success
          THEN 
               s_st := success
          REFINES 
            CONVERGENT EVENT SND_success = /* of machine b_1 */
            USING VARIANT {success,failure,s_st}
            WHEN 
                /* @grd1 */ s_st = working
              & /* @grd2 */ r_st = success
            THEN 
                 s_st := success
            REFINES 
              ANTICIPATED EVENT SND_progress = /* of machine b_0 */
              USING VARIANT 0
              THEN 
                   s_st :: {success,failure}
              END
            END
          END
        END
      END
    END;
  
  SND_failure = 
    EVENT SND_failure = /* of machine b_5 */
    WHEN 
        /* @grd1 */ s_st = working
      & /* @grd2 */ w = FALSE
      & /* @grd3 */ ab = FALSE
      & /* @grd4 */ db = FALSE
      & /* @grd5 */ v = FALSE
      & /* @grd6 */ c = MAX
    THEN 
         s_st := failure
      ||
         c := c + 1
    REFINES 
      EVENT SND_failure = /* of machine b_4 */
      WHEN 
          /* @grd1 */ s_st = working
      THEN 
           s_st := failure
      REFINES 
        EVENT SND_failure = /* of machine b_3 */
        WHEN 
            /* @grd1 */ s_st = working
        THEN 
             s_st := failure
        REFINES 
          EVENT SND_failure = /* of machine b_2 */
          WHEN 
              /* @grd1 */ s_st = working
          THEN 
               s_st := failure
          REFINES 
            CONVERGENT EVENT SND_failure = /* of machine b_1 */
            USING VARIANT {success,failure,s_st}
            WHEN 
                /* @grd1 */ s_st = working
            THEN 
                 s_st := failure
            REFINES 
              ANTICIPATED EVENT SND_progress = /* of machine b_0 */
              USING VARIANT 0
              THEN 
                   s_st :: {success,failure}
              END
            END
          END
        END
      END
    END;
  
  SND_rcv_current_ack = 
    EVENT SND_rcv_current_ack = /* of machine b_5 */
    WHEN 
        /* @grd1 */ s_st = working
      & /* @grd2 */ ab = TRUE
      & /* @grd3 */ s + 1 < n
    THEN 
         w := TRUE
      ||
         s := s + 1
      ||
         c := 0
      ||
         ab := FALSE
    REFINES 
      EVENT SND_rcv_current_ack = /* of machine b_4 */
      WHEN 
          /* @grd1 */ s_st = working
        & /* @grd2 */ w = FALSE
        & /* @grd3 */ s + 1 < n
        & /* @grd4 */ r = s + 1
      THEN 
           w := TRUE
        ||
           s := s + 1
      END
    END;
  
  SND_snd_current_data = 
    EVENT SND_snd_current_data = /* of machine b_5 */
    WHEN 
        /* @grd1 */ s_st = working
      & /* @grd2 */ w = TRUE
      & /* @grd3 */ s + 1 < n
    THEN 
         d := f(s + 1)
      ||
         w := FALSE
      ||
         db := TRUE
      ||
         l := FALSE
    REFINES 
      EVENT SND_snd_data = /* of machine b_4 */
      WHEN 
          /* @grd1 */ s_st = working
        & /* @grd2 */ w = TRUE
      THEN 
           d := f(s + 1)
        ||
           w := FALSE
      END
    END;
  
  SND_snd_last_data = 
    EVENT SND_snd_last_data = /* of machine b_5 */
    WHEN 
        /* @grd1 */ s_st = working
      & /* @grd2 */ w = TRUE
      & /* @grd3 */ s + 1 = n
    THEN 
         d := f(s + 1)
      ||
         w := FALSE
      ||
         db := TRUE
      ||
         l := TRUE
    REFINES 
      EVENT SND_snd_data = /* of machine b_4 */
      WHEN 
          /* @grd1 */ s_st = working
        & /* @grd2 */ w = TRUE
      THEN 
           d := f(s + 1)
        ||
           w := FALSE
      END
    END;
  
  SND_time_out_current = 
    EVENT SND_time_out_current = /* of machine b_5 */
    WHEN 
        /* @grd1 */ s_st = working
      & /* @grd2 */ w = FALSE
      & /* @grd3 */ ab = FALSE
      & /* @grd4 */ db = FALSE
      & /* @grd5 */ v = FALSE
      & /* @grd6 */ c < MAX
    THEN 
         w := TRUE
      ||
         c := c + 1
    REFINES 
      EVENT SND_time_out_current = /* of machine b_4 */
      WHEN 
          /* @grd1 */ s_st = working
        & /* @grd2 */ w = FALSE
      THEN 
           w := TRUE
      END
    END;
  
  DMN_data_channel = 
    EVENT DMN_data_channel = /* of machine b_5 */
    WHEN 
        /* @grd1 */ db = TRUE
    THEN 
         db := FALSE
    END;
  
  DMN_ack_channel = 
    EVENT DMN_ack_channel = /* of machine b_5 */
    WHEN 
        /* @grd1 */ ab = TRUE
    THEN 
         ab := FALSE
    END
END
