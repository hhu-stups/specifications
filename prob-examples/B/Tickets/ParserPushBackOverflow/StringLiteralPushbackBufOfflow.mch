MACHINE StringLiteralTests
DEFINITIONS
 "LibraryStrings.def"
CONSTANTS s0
PROPERTIES 
  s0 = "\'" 
ASSERTIONS
 s0 /= s1;
 s0 /= s3;
 s0 = "'";
 s0 = '''\'''';
 s1 = s2;
 s1 /= s3;
 s2 /= s3;
 s4=s5; // could fail on Windows ??
 s4 /= s6;

 STRING_LENGTH(s0)=1;
 STRING_LENGTH(s1)=1;
 STRING_LENGTH(s3)=2;
 STRING_LENGTH(s4)=8;
 STRING_LENGTH(s6)=10
END
