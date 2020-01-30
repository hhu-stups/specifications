MACHINE Simpson_Four_Slot_Ordered
/* A model with auxiliary variables to check that
   the reader receives writes in the right order and also does not use
   too old values */

/* 10.3 seconds to model check entire state space:
 4674 states, 
8634 transitions
*/
SETS
  INDEX = {p0,p1,s0,s1}
DEFINITIONS
     DATA == 0..5
CONSTANTS
  neg, pairIndex, slotIndex
PROPERTIES
  neg: INDEX >->> INDEX &
  neg(p0) = p1 & neg(p1) = p0 & neg(s0) = s1 & neg(s1) = s0 &
  neg[pairIndex] = pairIndex & neg[slotIndex] = slotIndex &
  pairIndex = {p0,p1} & slotIndex = {s0,s1}

VARIABLES
  data, slot, latest, reading,
  writePC, readPC, /* ProgramCounters of the two processes */
  writepair, writeindex, /* local variables of writer */
  readpair, readindex, /* local variables of the reader */

  lastwrite,lastread,lastwriteatstart /* auxiliary variables for verification */
INVARIANT
  data: pairIndex*slotIndex --> DATA &
  slot: pairIndex --> slotIndex &
  latest: pairIndex & reading: pairIndex &

  writePC:1..5 & readPC:1..4 &

  writepair: pairIndex & writeindex: slotIndex &

  readpair: pairIndex & readindex: slotIndex &

  lastwrite:DATA & lastread:DATA & /* not true: lastread <= lastwrite & */
  lastwriteatstart:DATA & lastwriteatstart <= lastwrite
INITIALISATION
  data :: (pairIndex*slotIndex --> {0}) ||
  slot := %p.(p:pairIndex | s0) ||
  latest := p0 ||
  reading := p0 ||
  writePC,readPC := 1,1 ||
  writepair, writeindex := p0,s0 ||
  readpair, readindex := p0,s0 ||

  lastwrite, lastread, lastwriteatstart := 0,0,0
OPERATIONS
   w1_writerChoosesPair = PRE writePC = 1 THEN
      writepair := neg(reading) || 
      writePC := writePC + 1
   END;
   w2_writerChoosesSlot = PRE writePC = 2 THEN
      writeindex := neg(slot(writepair)) || 
      writePC := writePC + 1
   END;
   w3_write(item) = PRE item:DATA & item = lastwrite+1 & writePC = 3 THEN
      data(writepair,writeindex) := item || 
      writePC := writePC + 1 
   END;
   w4_writerIndicatesSlot = PRE writePC = 4 THEN
      slot(writepair) := writeindex || 
      writePC := writePC + 1
   END;
   w5_writerIndicatesPair = PRE writePC = 5 THEN
      latest := writepair ||
      writePC :=  1 ||
      lastwrite := data(writepair,writeindex)  /* auxiliary variable for verification */ ||
      writepair, writeindex := p0,s0  /* reset local vars for model check */
   END;

  r1_readerChoosesPair = PRE readPC = 1 THEN
      readpair := latest || readPC := readPC + 1 ||
      lastwriteatstart := lastwrite
  END;
  r2_readerIndicatesPair = PRE readPC = 2 THEN
      reading := readpair || readPC := readPC + 1
  END;
  r3_readerChoosesSlot = PRE readPC = 3 THEN
      readindex := slot(readpair) || readPC := readPC + 1
  END;
  r4_readerChoosesPair(read) = PRE read=data(readpair,readindex) &
                                   readPC = 4 THEN
      ASSERT read >= lastread & read>=lastwriteatstart THEN
            readPC := 1 ||
	   readpair, readindex := p0,s0 ||   /* reset local vars for model check */
	   lastread := read
      END
  END
END
  