MACHINE SAT_TEST2
SETS MBOOL={MTRUE,MFALSE}
OPERATIONS
  Set(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,
      y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13) = PRE
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
     (x4=MTRUE or x5=MTRUE) &
     
     y1:MBOOL & y2:MBOOL & y3:MBOOL & y4:MBOOL & y5:MBOOL & y6:MBOOL & y7:MBOOL & y8:MBOOL &
     y9:MBOOL & y10:MBOOL & y11:MBOOL & y12:MBOOL & y13:MBOOL &
     (y1=MTRUE or y2=MTRUE or y3=MTRUE) & 
     (y11=MTRUE or y12=MTRUE or y13=MTRUE) & 
     (y2=MFALSE or y4=MTRUE or y3=MFALSE) & 
     (y11=MTRUE or y4=MFALSE or y8=MTRUE) & 
     (y8=MTRUE or y9=MTRUE or y4=MTRUE) & 
     (y7=MTRUE or y2=MTRUE or y4=MTRUE) & 
     (y7=MFALSE or y4=MFALSE or y3=MTRUE) & 
     (y7=MFALSE or y2=MTRUE or y3=MTRUE) & 
     (y7=MTRUE or y5=MTRUE or y3=MTRUE) & 
     (y5=MTRUE or y2=MTRUE or y3=MTRUE) &
     (y1=MFALSE or y2=MFALSE) &
     (y3=MFALSE or y4=MFALSE) &
     (y5=MFALSE or y6=MFALSE) &
     (y11=MFALSE or y12=MFALSE)&
     (y11=MFALSE or y13=MFALSE) &
     (y3=MFALSE or y5=MFALSE)  &
     (y4=MTRUE or y5=MTRUE)
     
     &
     (x1=y2)
 THEN
  skip
END
END

