MACHINE SAT
/* CNF Translated to B */
CONSTANTS
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20
DEFINITIONS
 PROPS == (
 (  x10=TRUE  or  x4=TRUE  or  x5=TRUE  ) &
   (  x2=FALSE  or  x10=TRUE  or  x15=FALSE  ) &
   (  x3=TRUE  or  x8=FALSE  or  x6=TRUE  ) &
   (  x11=TRUE  or  x9=FALSE  or  x18=TRUE  ) &
   (  x15=FALSE  or  x7=FALSE  or  x8=FALSE  ) &
   (  x9=FALSE  or  x16=TRUE  or  x13=FALSE  ) &
   (  x1=FALSE  or  x14=FALSE  or  x11=FALSE  ) &
   (  x18=FALSE  or  x1=TRUE  or  x16=TRUE  ) &
   (  x11=FALSE  or  x9=TRUE  or  x2=TRUE  ) &
   (  x6=TRUE  or  x8=FALSE  or  x10=TRUE  ) &
   (  x14=TRUE  or  x15=FALSE  or  x18=TRUE  ) &
   (  x3=TRUE  or  x15=TRUE  or  x13=TRUE  ) &
   (  x8=TRUE  or  x9=TRUE  or  x18=TRUE  ) &
   (  x18=FALSE  or  x3=TRUE  or  x9=FALSE  ) &
   (  x6=TRUE  or  x15=FALSE  or  x20=FALSE  ) &
   (  x19=FALSE  or  x15=FALSE  or  x1=TRUE  ) &
   (  x7=FALSE  or  x12=FALSE  or  x15=FALSE  ) &
   (  x4=FALSE  or  x9=FALSE  or  x16=FALSE  ) &
   (  x9=FALSE  or  x15=FALSE  or  x20=TRUE  ) &
   (  x12=FALSE  or  x20=TRUE  or  x19=FALSE  ) &
   (  x5=TRUE  or  x3=FALSE  or  x11=TRUE  ) &
   (  x7=TRUE  or  x2=FALSE  or  x18=FALSE  ) &
   (  x19=FALSE  or  x1=FALSE  or  x7=TRUE  ) &
   (  x11=TRUE  or  x20=FALSE  or  x19=FALSE  ) &
   (  x14=FALSE  or  x9=FALSE  or  x11=FALSE  ) &
   (  x8=FALSE  or  x4=TRUE  or  x18=FALSE  ) &
   (  x4=TRUE  or  x15=FALSE  or  x14=FALSE  ) &
   (  x20=TRUE  or  x16=TRUE  or  x12=TRUE  ) &
   (  x10=TRUE  or  x20=TRUE  or  x3=FALSE  ) &
   (  x20=TRUE  or  x3=FALSE  or  x9=TRUE  ) &
   (  x5=TRUE  or  x2=FALSE  or  x12=FALSE  ) &
   (  x15=TRUE  or  x3=TRUE  or  x14=FALSE  ) &
   (  x20=FALSE  or  x4=TRUE  or  x6=FALSE  ) &
   (  x14=FALSE  or  x18=TRUE  or  x15=TRUE  ) &
   (  x16=TRUE  or  x5=FALSE  or  x7=TRUE  ) &
   (  x12=TRUE  or  x20=TRUE  or  x2=TRUE  ) &
   (  x2=FALSE  or  x16=TRUE  or  x3=TRUE  ) &
   (  x6=FALSE  or  x4=FALSE  or  x9=FALSE  ) &
   (  x7=TRUE  or  x8=TRUE  or  x16=TRUE  ) &
   (  x5=TRUE  or  x19=FALSE  or  x11=FALSE  ) &
   (  x14=FALSE  or  x19=FALSE  or  x17=FALSE  ) &
   (  x16=TRUE  or  x13=FALSE  or  x19=TRUE  ) &
   (  x11=TRUE  or  x10=FALSE  or  x16=TRUE  ) &
   (  x4=TRUE  or  x17=TRUE  or  x6=TRUE  ) &
   (  x9=TRUE  or  x12=TRUE  or  x8=TRUE  ) &
   (  x7=TRUE  or  x17=FALSE  or  x18=FALSE  ) &
   (  x1=FALSE  or  x7=TRUE  or  x8=TRUE  ) &
   (  x2=FALSE  or  x19=TRUE  or  x16=FALSE  ) &
   (  x20=TRUE  or  x12=FALSE  or  x7=TRUE  ) &
   (  x11=FALSE  or  x5=FALSE  or  x20=TRUE  ) &
   (  x19=TRUE  or  x20=TRUE  or  x17=FALSE  ) &
   (  x5=TRUE  or  x16=TRUE  or  x19=TRUE  ) &
   (  x6=TRUE  or  x3=FALSE  or  x20=FALSE  ) &
   (  x3=TRUE  or  x2=FALSE  or  x17=TRUE  ) &
   (  x18=FALSE  or  x1=FALSE  or  x4=TRUE  ) &
   (  x14=TRUE  or  x11=FALSE  or  x6=FALSE  ) &
   (  x2=FALSE  or  x19=TRUE  or  x11=FALSE  ) &
   (  x5=TRUE  or  x8=FALSE  or  x18=TRUE  ) &
   (  x15=FALSE  or  x13=FALSE  or  x9=TRUE  ) &
   (  x17=TRUE  or  x18=FALSE  or  x6=FALSE  ) &
   (  x7=FALSE  or  x6=FALSE  or  x9=TRUE  ) &
   (  x8=FALSE  or  x17=FALSE  or  x2=TRUE  ) &
   (  x13=FALSE  or  x2=TRUE  or  x12=TRUE  ) &
   (  x18=TRUE  or  x1=FALSE  or  x15=FALSE  ) &
   (  x12=TRUE  or  x9=TRUE  or  x18=FALSE  ) &
   (  x16=TRUE  or  x10=TRUE  or  x5=TRUE  ) &
   (  x16=FALSE  or  x2=FALSE  or  x10=FALSE  ) &
   (  x7=FALSE  or  x20=TRUE  or  x5=TRUE  ) &
   (  x15=TRUE  or  x7=FALSE  or  x1=FALSE  ) &
   (  x14=FALSE  or  x8=FALSE  or  x6=TRUE  ) &
   (  x7=FALSE  or  x12=FALSE  or  x19=TRUE  ) &
   (  x19=TRUE  or  x15=TRUE  or  x5=TRUE  ) &
   (  x1=TRUE  or  x16=FALSE  or  x3=TRUE  ) &
   (  x13=FALSE  or  x8=TRUE  or  x16=FALSE  ) &
   (  x8=FALSE  or  x3=FALSE  or  x2=FALSE  ) &
   (  x2=FALSE  or  x1=FALSE  or  x10=TRUE  ) &
   (  x3=TRUE  or  x11=FALSE  or  x5=FALSE  ) &
   (  x10=FALSE  or  x20=TRUE  or  x9=TRUE  ) &
   (  x2=FALSE  or  x18=FALSE  or  x9=FALSE  ) &
   (  x11=FALSE  or  x18=TRUE  or  x20=FALSE  ) &
   (  x11=TRUE  or  x12=FALSE  or  x14=TRUE  ) &
   (  x10=FALSE  or  x13=FALSE  or  x17=FALSE  ) &
   (  x8=FALSE  or  x10=TRUE  or  x16=TRUE  ) &
   (  x18=TRUE  or  x4=TRUE  or  x19=TRUE  ) &
   (  x3=TRUE  or  x12=TRUE  or  x6=FALSE  ) &
   (  x15=FALSE  or  x7=FALSE  or  x8=FALSE  ) &
   (  x5=TRUE  or  x10=TRUE  or  x20=TRUE  ) &
   (  x19=TRUE  or  x1=TRUE  or  x4=TRUE  ) &
   (  x5=TRUE  or  x19=TRUE  or  x6=TRUE  ) &
   (  x17=TRUE  or  x14=TRUE  or  x10=TRUE  ) &
   (  x15=TRUE  or  x16=FALSE  or  x12=TRUE  )
   )
PROPERTIES
x1:BOOL & x2:BOOL & x3:BOOL & x4:BOOL & x5:BOOL & x6:BOOL & x7:BOOL & x8:BOOL & x9:BOOL & x10:BOOL & x11:BOOL & x12:BOOL & x13:BOOL & x14:BOOL & x15:BOOL & x16:BOOL & x17:BOOL & x18:BOOL & x19:BOOL & 
 
 PROPS
OPERATIONS
 res <-- check_props = IF PROPS THEN res := TRUE ELSE res := FALSE END
END
