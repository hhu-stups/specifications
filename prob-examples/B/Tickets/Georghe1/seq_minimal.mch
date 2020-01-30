MACHINE seq_minimal
SETS /* deferred */
  T
ABSTRACT_CONSTANTS
  LEN,
  SEQ,
  SEQ0,
  SEQ1
PROPERTIES
    /* @axm1 */ LEN = 5
  & /* @axm2 */ SEQ = {{}} \/ {s|s : POW(INTEGER * T) & #(n).(n : 1 .. LEN & s : 1 .. n --> T)}
  & /* @axm3 */ SEQ1 = {s|s : POW(INTEGER * T) & #(n).(n : 1 .. LEN & s : 1 .. n --> T)}
  & /* @axm4 */ SEQ0 = {s|s : POW(INTEGER * T) & #(n).(n : 0 .. LEN & s : 1 .. n --> T)}
INITIALISATION
    skip
END

