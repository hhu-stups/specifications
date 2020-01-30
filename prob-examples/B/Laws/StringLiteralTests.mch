MACHINE StringLiteralTests
DEFINITIONS
 "LibraryStrings.def"
CONSTANTS s0,s1,s2,s3, s4, s5, s6
PROPERTIES s1:STRING & s2:STRING & s3:STRING &

  s0 = "\'" &
  s1 = "\"" &
  s2 = '''"''' &
  s3 = "\\\"" &
  s4 = "\nabc\nefg" &
  s5 = '''
abc
efg''' &
  s6 = "\\nabc\\nefg"
ASSERTIONS
 s0 /= s1;
 s0 /= s3;
 s0 = "'";
 //s0 = '''\'''';  // causes pushback buffer overflow in Parser
 s1 = s2;
 s1 /= s3;
 s2 /= s3;
 s4=s5; // could fail on Windows ??
 s4 /= s6;

 STRING_LENGTH(s0)=1;
 STRING_LENGTH(s1)=1;
 STRING_LENGTH(s3)=2;
 STRING_LENGTH(s4)=8;
 STRING_LENGTH(s6)=10;

 FORMAT_TO_STRING("~w",[s1]) = FORMAT_TO_STRING("~w",[s2]);
 FORMAT_TO_STRING("~w",[s1]) /= FORMAT_TO_STRING("~w",[s3]);
 FORMAT_TO_STRING(" ~w ",[s1]) /= FORMAT_TO_STRING(" ~w ",[s3]);
 STRING_LENGTH(FORMAT_TO_STRING(" ~w ",[s1])) = 3;
 STRING_LENGTH(FORMAT_TO_STRING(" ~w ",[s3])) = 4
END
