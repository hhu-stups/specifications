MACHINE Simpson_Four_Slot_Symm
/* 83.8 seconds to model check entire state space with nauty:
 3305 states, 7954 transitions

with flood: 89.7 secs
 3305 states (+ 452102 permutations), 460056 transitions (452102 permute)

with symmetry markers:
9.8 secs, 2853 states, 6866 transitions 
*/
SETS
  INDEX;
  DATA

CONSTANTS
  neg, pairIndex, slotIndex
PROPERTIES
  card(INDEX) = 4 &
  neg: INDEX >->> INDEX &
  neg[pairIndex] = pairIndex & neg[slotIndex] = slotIndex &
  !i.(i:INDEX => neg(i) /= i) &
  card(pairIndex) = 2 & card(slotIndex) = 2 &
  pairIndex \/ slotIndex = INDEX &
  pairIndex /\ slotIndex = {}

VARIABLES
  data, slot, latest, reading,
  writePC, readPC, /* ProgramCounters of the two processes */
  writepair, writeindex, /* local variables of writer */
  readpair, readindex /* local variables of the reader */
INVARIANT
  data: pairIndex*slotIndex --> DATA &
  slot: pairIndex --> slotIndex &
  latest: pairIndex & reading: pairIndex &

  writePC:1..5 & readPC:1..4 &

  writepair: pairIndex & writeindex: slotIndex &

  readpair: pairIndex & readindex: slotIndex

INITIALISATION
  data :: (pairIndex*slotIndex --> DATA) ||
  slot :: pairIndex --> slotIndex  ||
  latest :: pairIndex ||
  reading :: pairIndex ||
  writePC,readPC := 1,1 ||
  writepair :: pairIndex || writeindex :: slotIndex ||
  readpair :: pairIndex || readindex :: slotIndex
OPERATIONS
   w1_writerChoosesPair = PRE writePC = 1 THEN
      writepair := neg(reading) || 
      writePC := writePC + 1
   END;
   w2_writerChoosesSlot = PRE writePC = 2 THEN
      writeindex := neg(slot(writepair)) || 
      writePC := writePC + 1
   END;
   w3_write(item) = PRE item:DATA & writePC = 3 THEN
      data(writepair,writeindex) := item || 
      writePC := writePC + 1
   END;
   w4_writerIndicatesSlot = PRE writePC = 4 THEN
      slot(writepair) := writeindex || 
      writePC := writePC + 1
   END;
   w5_writerIndicatesPair = PRE writePC = 5 THEN
      latest := writepair ||
      writePC :=  1
   END;

  r1_readerChoosesPair = PRE readPC = 1 THEN
      readpair := latest || readPC := readPC + 1
  END;
  r2_readerIndicatesPair = PRE readPC = 2 THEN
      reading := readpair || readPC := readPC + 1
  END;
  r3_readerChoosesSlot = PRE readPC = 3 THEN
      readindex := slot(readpair) || readPC := readPC + 1
  END;
  read <-- r4_readerChoosesPair = PRE readPC = 4 THEN
      read := data(readpair,readindex) ||
      readPC := 1
  END
END
  