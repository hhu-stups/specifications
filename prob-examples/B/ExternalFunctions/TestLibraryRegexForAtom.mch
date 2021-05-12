MACHINE TestLibraryRegexForAtom
// Test a few regular expressions for Atom Plugin
DEFINITIONS "LibraryRegex.def"
CONSTANTS re,rw,rm, msg, err, msg2
PROPERTIES
   re = "! An error occurred \\(source: ([a-zA-Z]|\\d+|_)*\\).*\r?\n! (.*)\r?\n.*\r?\n?! Line: (\\d+) Column: (-?\\d+) until Line: (\\d+) Column: (\\d+) in file: (\\S*).*"
   &
  rw = "! A warning occurred \\(source: ([a-zA-Z]|\\d+|_)*\\).*\r?\n! (.*)\r?\n.*\r?\n?! Line: (\\d+) Column: (-?\\d+) until Line: (\\d+) Column: (\\d+) in file: (\\S*).*"
  &
  rm = ".*! Message \\(source: ([a-zA-Z]|\\d+|_)*\\).*\r?\n! (.*)\r?\n.*\r?\n?! Line: (\\d+) Column: (-?\\d+) until Line: (\\d+) Column: (\\d+) in file: (\\S*).*"
  &
  msg = '''! Message (source: b_ast_cleanup):
! Useless existentially quantified variable: [uc_groups]
! Line: 376 Column: 10 until Line: 376 Column: 19 in file: /Users/leuschel/git_root/prob_examples/examples/B/SlotTool/SlotTool_24082017/Solver.mch
'''
&
  err = '''! An error occurred (source: parse_error) !
! Invalid combination of symbols: '&' and 'ASSERTIONS'. Argument to binary operator is missing.
! Line: 15 Column: 0 until Line: 15 Column: 0 in file: /Users/leuschel/git_root/prob_examples/public_examples/B/ExternalFunctions/TestLibraryRegexForAtom.mch
'''
 &
  msg2 = '''! Message (source: detect_lambda_result_auto):
! Annotating comprehension set identifiers with DO_NOT_ENUMERATE: ['__RANGE_LAMBDA__']
! Line: 22007 Column: 0 until Line: 22027 Column: 1 in file: /Users/leuschel/git_root/private_examples/ClearSy/2020/03_Mar/wd_timeout/invalidRef_welldef.mch
'''
ASSERTIONS
 REGEX_SEARCH(err,1,re)'length = 297;
 REGEX_SEARCH(msg,1,rm)'length = 238;
 REGEX_SEARCH(msg,1,rw)'length = -1;
 REGEX_SEARCH(msg,1,re)'length = -1
END

