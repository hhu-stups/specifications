MACHINE MM

INCLUDES
    a1.A1,
    a2.A2,
    b1.B1,
    b2.B2

PROMOTES
    a1.x1.opx1,
    a2.opx2 /*,
    b1.x1.opx1, */ /* see /tools-doc/AtelierB/atelierb.md:ISS_inc_prefix2 */
/*    b2.opx2 */  /* see /tools-doc/AtelierB/atelierb.md:ISS_inc_prefix2 */

INITIALISATION
    skip
    
OPERATIONS

    op1 = BEGIN skip END;
    
    vv<--op2 = BEGIN vv::INTEGER END;
    
    op3 = BEGIN skip END;
    
    vv<--op4 = BEGIN vv::INTEGER END

END