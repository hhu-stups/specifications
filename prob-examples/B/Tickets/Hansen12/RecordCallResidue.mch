MACHINE RecordCallResidue
DEFINITIONS
 f4 == %(i, j).(i : INTEGER & j : INTEGER | rec(a:i, b:j));
PROPERTIES
 4 =  ((f4 <+ {((3,4),rec(a:f4(3,4)'a, b:17))})(2, 4))'b
ASSERTIONS
 4 =  f4(2, 4)'b;
 4 =  ((f4 <+ {((3,4),rec(a:3, b:17))})(2, 4))'b;
 4 =  ((f4 <+ {((3,4),rec(a:f4(3,4)'a, b:17))})(2, 4))'b
END

/* Did initially generate the following error:

! An error occurred !
! source(add_trans_id)
! Residue: 
! root:'$setup_constants':[(
kernel_equality:equality_fields([field(a,int(2)),field(b,int(4))],_15606,pred_true),
kernel_records:get_field(_15606,b,int(4),_15606))]

*/