MACHINE StaticAssertionProj_Sub
CONSTANTS
 sub1,sub2,sub3
PROPERTIES
 sub1 = 1024 &
 sub2 = sub1*2 &
 sub3 = 256
ASSERTIONS
 sub1<sub2;
 sub3 = 2**8
END

