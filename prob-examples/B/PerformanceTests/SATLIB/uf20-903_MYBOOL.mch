MACHINE SAT
/* CNF Translated to B */
SETS MYBOOL = {tt,ff}
CONSTANTS
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20
DEFINITIONS
 PROPS == (
 (  x10=tt  or  x4=tt  or  x5=tt  ) &
   (  x2=ff  or  x10=tt  or  x15=ff  ) &
   (  x3=tt  or  x8=ff  or  x6=tt  ) &
   (  x11=tt  or  x9=ff  or  x18=tt  ) &
   (  x15=ff  or  x7=ff  or  x8=ff  ) &
   (  x9=ff  or  x16=tt  or  x13=ff  ) &
   (  x1=ff  or  x14=ff  or  x11=ff  ) &
   (  x18=ff  or  x1=tt  or  x16=tt  ) &
   (  x11=ff  or  x9=tt  or  x2=tt  ) &
   (  x6=tt  or  x8=ff  or  x10=tt  ) &
   (  x14=tt  or  x15=ff  or  x18=tt  ) &
   (  x3=tt  or  x15=tt  or  x13=tt  ) &
   (  x8=tt  or  x9=tt  or  x18=tt  ) &
   (  x18=ff  or  x3=tt  or  x9=ff  ) &
   (  x6=tt  or  x15=ff  or  x20=ff  ) &
   (  x19=ff  or  x15=ff  or  x1=tt  ) &
   (  x7=ff  or  x12=ff  or  x15=ff  ) &
   (  x4=ff  or  x9=ff  or  x16=ff  ) &
   (  x9=ff  or  x15=ff  or  x20=tt  ) &
   (  x12=ff  or  x20=tt  or  x19=ff  ) &
   (  x5=tt  or  x3=ff  or  x11=tt  ) &
   (  x7=tt  or  x2=ff  or  x18=ff  ) &
   (  x19=ff  or  x1=ff  or  x7=tt  ) &
   (  x11=tt  or  x20=ff  or  x19=ff  ) &
   (  x14=ff  or  x9=ff  or  x11=ff  ) &
   (  x8=ff  or  x4=tt  or  x18=ff  ) &
   (  x4=tt  or  x15=ff  or  x14=ff  ) &
   (  x20=tt  or  x16=tt  or  x12=tt  ) &
   (  x10=tt  or  x20=tt  or  x3=ff  ) &
   (  x20=tt  or  x3=ff  or  x9=tt  ) &
   (  x5=tt  or  x2=ff  or  x12=ff  ) &
   (  x15=tt  or  x3=tt  or  x14=ff  ) &
   (  x20=ff  or  x4=tt  or  x6=ff  ) &
   (  x14=ff  or  x18=tt  or  x15=tt  ) &
   (  x16=tt  or  x5=ff  or  x7=tt  ) &
   (  x12=tt  or  x20=tt  or  x2=tt  ) &
   (  x2=ff  or  x16=tt  or  x3=tt  ) &
   (  x6=ff  or  x4=ff  or  x9=ff  ) &
   (  x7=tt  or  x8=tt  or  x16=tt  ) &
   (  x5=tt  or  x19=ff  or  x11=ff  ) &
   (  x14=ff  or  x19=ff  or  x17=ff  ) &
   (  x16=tt  or  x13=ff  or  x19=tt  ) &
   (  x11=tt  or  x10=ff  or  x16=tt  ) &
   (  x4=tt  or  x17=tt  or  x6=tt  ) &
   (  x9=tt  or  x12=tt  or  x8=tt  ) &
   (  x7=tt  or  x17=ff  or  x18=ff  ) &
   (  x1=ff  or  x7=tt  or  x8=tt  ) &
   (  x2=ff  or  x19=tt  or  x16=ff  ) &
   (  x20=tt  or  x12=ff  or  x7=tt  ) &
   (  x11=ff  or  x5=ff  or  x20=tt  ) &
   (  x19=tt  or  x20=tt  or  x17=ff  ) &
   (  x5=tt  or  x16=tt  or  x19=tt  ) &
   (  x6=tt  or  x3=ff  or  x20=ff  ) &
   (  x3=tt  or  x2=ff  or  x17=tt  ) &
   (  x18=ff  or  x1=ff  or  x4=tt  ) &
   (  x14=tt  or  x11=ff  or  x6=ff  ) &
   (  x2=ff  or  x19=tt  or  x11=ff  ) &
   (  x5=tt  or  x8=ff  or  x18=tt  ) &
   (  x15=ff  or  x13=ff  or  x9=tt  ) &
   (  x17=tt  or  x18=ff  or  x6=ff  ) &
   (  x7=ff  or  x6=ff  or  x9=tt  ) &
   (  x8=ff  or  x17=ff  or  x2=tt  ) &
   (  x13=ff  or  x2=tt  or  x12=tt  ) &
   (  x18=tt  or  x1=ff  or  x15=ff  ) &
   (  x12=tt  or  x9=tt  or  x18=ff  ) &
   (  x16=tt  or  x10=tt  or  x5=tt  ) &
   (  x16=ff  or  x2=ff  or  x10=ff  ) &
   (  x7=ff  or  x20=tt  or  x5=tt  ) &
   (  x15=tt  or  x7=ff  or  x1=ff  ) &
   (  x14=ff  or  x8=ff  or  x6=tt  ) &
   (  x7=ff  or  x12=ff  or  x19=tt  ) &
   (  x19=tt  or  x15=tt  or  x5=tt  ) &
   (  x1=tt  or  x16=ff  or  x3=tt  ) &
   (  x13=ff  or  x8=tt  or  x16=ff  ) &
   (  x8=ff  or  x3=ff  or  x2=ff  ) &
   (  x2=ff  or  x1=ff  or  x10=tt  ) &
   (  x3=tt  or  x11=ff  or  x5=ff  ) &
   (  x10=ff  or  x20=tt  or  x9=tt  ) &
   (  x2=ff  or  x18=ff  or  x9=ff  ) &
   (  x11=ff  or  x18=tt  or  x20=ff  ) &
   (  x11=tt  or  x12=ff  or  x14=tt  ) &
   (  x10=ff  or  x13=ff  or  x17=ff  ) &
   (  x8=ff  or  x10=tt  or  x16=tt  ) &
   (  x18=tt  or  x4=tt  or  x19=tt  ) &
   (  x3=tt  or  x12=tt  or  x6=ff  ) &
   (  x15=ff  or  x7=ff  or  x8=ff  ) &
   (  x5=tt  or  x10=tt  or  x20=tt  ) &
   (  x19=tt  or  x1=tt  or  x4=tt  ) &
   (  x5=tt  or  x19=tt  or  x6=tt  ) &
   (  x17=tt  or  x14=tt  or  x10=tt  ) &
   (  x15=tt  or  x16=ff  or  x12=tt  )
   )
PROPERTIES
x1:MYBOOL & x2:MYBOOL & x3:MYBOOL & x4:MYBOOL & x5:MYBOOL & x6:MYBOOL & x7:MYBOOL & x8:MYBOOL & x9:MYBOOL & x10:MYBOOL & x11:MYBOOL & x12:MYBOOL & x13:MYBOOL & x14:MYBOOL & x15:MYBOOL & x16:MYBOOL & x17:MYBOOL & x18:MYBOOL & x19:MYBOOL & 
 
 PROPS
OPERATIONS
 res <-- check_props = IF PROPS THEN res := tt ELSE res := ff END
END
