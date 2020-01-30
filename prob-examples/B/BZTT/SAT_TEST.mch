MACHINE SAT_TEST
SETS MBOOL={MTRUE,MFALSE}
OPERATIONS
  Set(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13) = PRE
     x1:MBOOL & x2:MBOOL & x3:MBOOL & x4:MBOOL & x5:MBOOL & x6:MBOOL & x7:MBOOL & x8:MBOOL &
     x9:MBOOL & x10:MBOOL & x11:MBOOL & x12:MBOOL & x13:MBOOL &
     (x1=MTRUE or x2=MTRUE or x3=MTRUE) & 
     (x11=MTRUE or x12=MTRUE or x13=MTRUE) & 
     (x2=MFALSE or x4=MTRUE or x3=MFALSE) & 
     (x11=MTRUE or x4=MFALSE or x8=MTRUE) & 
     (x8=MTRUE or x9=MTRUE or x4=MTRUE) & 
     (x7=MTRUE or x2=MTRUE or x4=MTRUE) & 
     (x7=MFALSE or x4=MFALSE or x3=MTRUE) & 
     (x7=MFALSE or x2=MTRUE or x3=MTRUE) & 
     (x7=MTRUE or x5=MTRUE or x3=MTRUE) & 
     (x5=MTRUE or x2=MTRUE or x3=MTRUE) &
     (x1=MFALSE or x2=MFALSE) &
     (x3=MFALSE or x4=MFALSE) &
     (x5=MFALSE or x6=MFALSE) &
     (x11=MFALSE or x12=MFALSE)&
     (x11=MFALSE or x13=MFALSE) &
     (x3=MFALSE or x5=MFALSE)  &
     (x4=MTRUE or x5=MTRUE)
 THEN
  skip
END
END

