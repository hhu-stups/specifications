MACHINE TestOrApplyFun
DEFINITIONS
 f==[2,4]
CONSTANTS x, b
PROPERTIES
 x:1..3 &
 ((x=1 or f(x-1)=4) <=> (b=TRUE)) &
  b=TRUE
ASSERTIONS
 {xx|(xx=1 or f(xx-1)=4)} = {1,3}
OPERATIONS
  r <-- Get13 = BEGIN r := {xx|xx:1..3 & (xx=1 or f(xx-1)=4)} END;
 /* this may cause WD problem r <-- Get13old = BEGIN r := {xx|(xx=1 or f(xx-1)=4)} END */
  r <-- GetDiv01456 =  BEGIN r := {yy | yy:0..10 & (yy=1 or yy=0 or 10/yy = 2 or 10/(yy-1)=2)} END;
  r <-- GetMod0510 = BEGIN r := {zz| zz:0..10 & (zz>0 => (zz=10 or 10 mod zz = 10 mod (10-zz)))} END
END

