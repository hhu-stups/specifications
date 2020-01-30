MACHINE ID_Checks
/* Check if we can deal with the large check below */
DEFINITIONS
   GOAL == bijection_t_id_seg_i : 0 .. co_id_max_seg -->> t_id_seg_i
CONSTANTS co_id_max_seg, bijection_t_id_seg_i, t_id_seg_i
PROPERTIES
    co_id_max_seg = 262143      &
    t_id_seg_i          = 0 .. co_id_max_seg &
    bijection_t_id_seg_i = id(t_id_seg_i) &
    bijection_t_id_seg_i : 0 .. co_id_max_seg >->> t_id_seg_i
ASSERTIONS
    (0..100) * (0..200) : (0..100) <-> (0..200);
    (1..0) * (0..200) : (0..100) <-> (0..100);
    (1..0) * (0..200) : (0..100) +-> (0..100);
    bijection_t_id_seg_i : 0 .. co_id_max_seg <-> t_id_seg_i;
    bijection_t_id_seg_i : -1 .. co_id_max_seg <-> t_id_seg_i;
    bijection_t_id_seg_i : 0 .. (co_id_max_seg+2) <-> t_id_seg_i;

    bijection_t_id_seg_i : 0 .. co_id_max_seg +-> t_id_seg_i;
    bijection_t_id_seg_i : -1 .. co_id_max_seg +-> t_id_seg_i;

    bijection_t_id_seg_i : 0 .. co_id_max_seg --> t_id_seg_i;
    bijection_t_id_seg_i : 0 .. co_id_max_seg -->> t_id_seg_i;
    bijection_t_id_seg_i : 0 .. co_id_max_seg >+> t_id_seg_i;
    bijection_t_id_seg_i : 0 .. co_id_max_seg >+>> t_id_seg_i;
    bijection_t_id_seg_i : 0 .. co_id_max_seg >->> t_id_seg_i
/*

Initially took 29450 ms to analyse; now takes 160 ms

*/
END

