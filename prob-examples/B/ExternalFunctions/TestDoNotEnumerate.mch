MACHINE TestDoNotEnumerate
SETS ID = {ID1,ID2,ID3,ID4,ID5,ID6,ID7,ID8,ID9,ID10}
DEFINITIONS "LibraryProB.def"; "LibraryIO.def";
 DNE == (DO_NOT_ENUMERATE(x1) & DO_NOT_ENUMERATE(x2) & DO_NOT_ENUMERATE(x3) & DO_NOT_ENUMERATE(x4) &
         DO_NOT_ENUMERATE(x5) & DO_NOT_ENUMERATE(x6) & DO_NOT_ENUMERATE(x7) & DO_NOT_ENUMERATE(x8) &
         DO_NOT_ENUMERATE(x9) & DO_NOT_ENUMERATE(x10) &
         DO_NOT_ENUMERATE(x11) & DO_NOT_ENUMERATE(x12) & DO_NOT_ENUMERATE(x13) & DO_NOT_ENUMERATE(x14) &
         DO_NOT_ENUMERATE(x15) & DO_NOT_ENUMERATE(x16) & DO_NOT_ENUMERATE(x17) & DO_NOT_ENUMERATE(x18) &
         DO_NOT_ENUMERATE(x19));
  SET_PREF_CLPFD == FALSE;
  SET_PREF_TIME_OUT == 1000
CONSTANTS
  //r,
  r2
PROPERTIES
 // r = {x,y,z| z:1..100 & x=z+1 & y=x+1} &
  r2 = {x,y,z|
        DO_NOT_ENUMERATE(x) &
        DO_NOT_ENUMERATE(y) &
        z:1..100 & x=z+1 & y=x+1}
OPERATIONS
  Test_DNE = PRE
              card({x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,z|
              DNE &
              z:1..10 &
              x19=bool(z<=9) & x18=bool(z<=8) & x17=bool(z<=7) & x16=bool(z<=6) &
              x15=bool(z<=5) & x14=bool(z<=4) & x13=bool(z<=3) & x12=bool(z<=2) &
              x11=bool(z<=1) & x10=bool(z<10) & x9=bool(z>9) & x8=bool(z>8) &
              x7=bool(z>7) & x6=bool(z>6) & x5=bool(z>5) & x4=bool(z>4) &
              x3=bool(z>3) & x2=bool(z>2) & x1=bool(z>1)}) = 10
              THEN
                 skip
              END
ASSERTIONS
  // Takes very long without DNE and CLPFD FALSE
  card({x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,z|DNE & z:1..10 & x19=bool(z<=9) & x18=bool(z<=8) & x17=bool(z<=7) & x16=bool(z<=6) & x15=bool(z<=5) & x14=bool(z<=4) & x13=bool(z<=3) & x12=bool(z<=2) & x11=bool(z<=1) & x10=bool(z<10) & x9=bool(z>9) & x8=bool(z>8) & x7=bool(z>7) & x6=bool(z>6) & x5=bool(z>5) & x4=bool(z>4) & x3=bool(z>3) & x2=bool(z>2) & x1=bool(z>1)}) = 10
END
