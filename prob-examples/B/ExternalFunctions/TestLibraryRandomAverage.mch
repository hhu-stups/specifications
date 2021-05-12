MACHINE TestLibraryRandomAverage
DEFINITIONS
 "LibraryRandom.def"
CONSTANTS n
PROPERTIES n = 30
VARIABLES
 samples, avgs, runs
INVARIANT samples : seq(INTEGER) & avgs : INTEGER +-> NATURAL & runs:NATURAL
INITIALISATION samples := {} || avgs := {} || runs := 0
OPERATIONS
 add_sample(note) = PRE
      // note=RANDOM(10,50) &
      note=NORMAL(30,12) &
      size(samples)<n THEN
  samples := samples <- note
 END;
 avg <-- Avg = PRE samples /= {} THEN
    avg := SIGMA(i).(i:dom(samples)|samples(i)) / size(samples);
    IF avg : dom(avgs) THEN
       avgs(avg) := avgs(avg)+1
    ELSE
       avgs(avg) := 1
    END;
    samples := {};
    runs := runs+1
 END
END

