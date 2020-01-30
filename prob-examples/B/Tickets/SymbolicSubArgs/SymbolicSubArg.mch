MACHINE SymbolicSubArg
/* check if closures containing SYMBOLIC sub arguments are also marked symbolic */
DEFINITIONS
  STRING_IS_INT(S) == (1=1);
  EXTERNAL_PREDICATE_STRING_IS_INT == (STRING)
ABSTRACT_CONSTANTS
  Numbers
PROPERTIES
  Numbers = {s| s:STRING & STRING_IS_INT(s)}
ASSERTIONS
  /* UNARY Operators: */
  ["123"]:iseq1(Numbers) \/ {["abc"]};
  ["123","556","abc"]/:iseq1(Numbers) \/ {["abc"]};
  ["123","556","abc"]:iseq1(Numbers \/ {"abc"}) \/ {["efg"]};
  ["123","556","abc","556"]/:iseq1(Numbers) \/ {["abc"]};
  ["123","556","556"]/:iseq1(Numbers) \/ {["abc"]};
  ["123","556","556"]:seq1(Numbers) \/ {["abc"]};
  ["d"]/:iseq1(Numbers) \/ {["abc"]};
  {"123","345"} : POW1(Numbers) \/ {{"abc"}};
  {"123","345"} : POW(Numbers) \/ {{"abc"}};
  {"123","345"} : FIN(Numbers) \/ {{"abc"}};
  {"123","345"} : FIN1(Numbers) \/ {{"abc"}};
  {"123","abc"} /: POW1(Numbers) \/ {{"abc"}};
  {rec(f:"123"),rec(f:"4444")} : POW(struct(f:Numbers));
  {rec(f:"123"),rec(f:"4444b")} /: POW(struct(f:Numbers));
  {rec(f:"123"),rec(f:"4444b")} : POW(struct(f:STRING)) \ POW(struct(f:Numbers));
  
  /* BINARY Operators: */
  {"123"|->"345"} : (Numbers +-> Numbers) \/ {{"a"|->"b"}};
  {"123"|->"345","124"|->"345"} : (Numbers +-> Numbers) \/ {{"a"|->"b"}};
  {"123"|->"345","124"|->"345"} /: (Numbers >+> Numbers) \/ {{"a"|->"b"}};
  {"123"|->"345","123"|->"3456"} : (Numbers <-> Numbers) \/ {{"a"|->"b"}};
  {"123"|->"345","123"|->"3456"} /: (Numbers +-> Numbers) \/ {{"a"|->"b"}};
  {"123"|->TRUE,"124"|->FALSE} : (Numbers +->> BOOL) \/ {{"a"|->TRUE}};
  {"123"|->TRUE,"124"|->TRUE} /: (Numbers +->> BOOL) \/ {{"a"|->TRUE}};
  {"123"|->TRUE,"124b"|->FALSE} /: (Numbers +->> BOOL) \/ {{"a"|->TRUE}};
  
  "123" : Numbers \ {"1234"};
  "1234" /: Numbers \ {"1234"};
  "1234" : Numbers /\ {"1234","aaaa"};
  {"1234"} = Numbers /\ {"1234","aaaa"}
  

END