/*
  This test case is a regression test for a bug regarding common subexpression
  elimination (a.k.a. expression sharing) and the let_predicate construct.
*/
MACHINE CommonSubLetBug
CONSTANTS
  b,
  c
INVARIANT
  /* With the bug, the set b was empty */
  b = {{1|->2}}
PROPERTIES
    c = {1|->2}
  & b = {nxt| (#(l).(l = {2} & nxt = c))}
END

