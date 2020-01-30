MACHINE PruningActionsTest2
DEFINITIONS
 /* Expressing the independency of actions by means of LTL-formulas */
 ASSERT_LTL_1 == "G ((e(Inc_yy) & [Inc_xx] => X e(Inc_yy)) & (e(Inc_xx) & [Inc_yy] => X e(Inc_xx)))";
 ASSERT_LTL_2 == "G ((e(Inc_zz) & [Inc_xx] => X e(Inc_zz)) & (e(Inc_xx) & [Inc_zz] => X e(Inc_xx)))";
 ASSERT_LTL_3 == "G ((e(Inc_yy) & [Inc_zz] => X e(Inc_yy)) & (e(Inc_zz) & [Inc_yy] => X e(Inc_zz)))"
SETS
 ID={aa,bb}
VARIABLES xx,yy,zz
INVARIANT
 xx:INTEGER & yy:NAT & yy <4 & zz:INTEGER
INITIALISATION xx:=0 || yy:=0 || zz:= -1
OPERATIONS
  Inc_xx = PRE yy>0 & xx <2 THEN xx:= xx+1 END;
  Inc_yy = PRE yy < 3 THEN yy:= yy+1 END;
  Inc_zz = PRE zz <4 THEN zz := zz+1 END
END


/*
 Idea: To prove that Inc_xx independent from Inc_yy
 use Constraint Based Approach; trying to find counter examples for:
    - INV & e(Inc_xx) & [Inc_yy] =>  X e(Inc_xx)
    - INV & e(Inc_yy) & [Inc_xx] =>  X e(Inc_yy)
    - INV & [Inc_yy] & X [Inc_xx]   <= same state =>  INV & [Inc_xx] & X [Inc_yy]
*/