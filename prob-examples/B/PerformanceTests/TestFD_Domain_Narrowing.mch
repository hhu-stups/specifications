MACHINE TestFD_Domain_Narrowing
/* works with both fd_utils and fd_utils_clpfd */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,kk, none, null}
CONSTANTS f, NONE, NULL
PROPERTIES
 f: 0..10 --> ID &
 !x1.(x1:0..10 => f(x1) /= f(((x1+5) mod 11))) &
 !x2.(x2:0..10 => f(x2) /= none) &
 !x3.(x3:0..10 => f(x3) /= null) &
 f(0) : {aa,bb,NONE,NULL} &
 f(5) : {bb,cc,NONE,NULL} &
 f(10) : {cc,dd,NONE,NULL} &
 f(4) : {dd,ee,NONE,NULL} &
 f(9) : {ee,ff,NONE,NULL} &
 f(3) : {ff,gg,NONE,NULL} &
 f(8) : {gg,hh,NONE,NULL} &
 f(2) : {hh,ii,NONE,NULL} &
 f(7) : {ii,jj,NONE,NULL} &
 f(1) : {jj,kk,NONE,NULL} &
 f(6) : {kk,aa,NONE,NULL} &
 NONE : {none,null,aa,bb,cc} & NONE /= aa & NONE /= bb & NONE /= cc & NONE /= NULL &
 NULL : {none,null,aa,bb,cc} & NULL /= aa & NULL /= bb & NULL /= cc
DEFINITIONS
 GOAL == f(0)=aa;
 SET_PREF_MAX_OPERATIONS == 20
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=f(1)
OPERATIONS
  Set(Nr,yy) = PRE yy:ID & yy=f(Nr) THEN xx:= yy END
END

