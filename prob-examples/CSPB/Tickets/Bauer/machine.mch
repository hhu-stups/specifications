/* Just a very simple machine with three operations.
   With the CSP guide, it will deadlock.
   We just use it to test the output of the history for
   CSP||B models.

   (Bug encountered by Thomas Bauer, 6.8.2013)
*/
MACHINE machine
VARIABLES x
INVARIANT x:NATURAL
INITIALISATION
  x := 0
OPERATIONS
  inc(i) = PRE i:1..3 THEN x:=x+i END
END
