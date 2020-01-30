MACHINE TestCBCAssertionCheck
/* Test that Kodkod can be used for CBC Assertion Check
   at the moment this does not work efficiently because Properties and
   Assertions treated separately */
SETS
 ID={aa,bb,cc,dd,ee,ff}
CONSTANTS r
PROPERTIES
 r:ID <-> ID & ran(r) <: dom(r)
ASSERTIONS
  dom(r) /= ID or ran(r) /= ID
END

