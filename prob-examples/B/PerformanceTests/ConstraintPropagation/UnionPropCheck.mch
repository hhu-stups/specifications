MACHINE UnionPropCheck
SETS
 ID={aa,bb,cc,dd,ee,ff}
CONSTANTS xx , vv
PROPERTIES
 xx <: ID & vv: 0..7 --> 0..1024 &

 (aa/: xx \/ {aa} or vv(0)=1024) &
 (bb/: xx \/ {bb} or vv(1)=1024) &
 (cc/: xx \/ {cc} or vv(2)=1024) &
 (dd/: xx \/ {dd} or vv(3)=1024) &
 (ee/: xx \/ {ee} or vv(4)=1024) &
 (ff/: xx \/ {ff} or vv(5)=1024) &
 (aa/: xx \/ {aa,bb} or vv(6)=1024) &
 (ff/: xx \/ {bb,ff} or vv(7)=1024)
OPERATIONS
 r <-- getvv(i) = PRE i :dom(vv) THEN r := vv(i) END
END

