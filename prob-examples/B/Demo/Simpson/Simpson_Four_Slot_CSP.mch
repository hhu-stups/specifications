MACHINE Simpson_Four_Slot_CSP
/* A model with auxiliary variables to check that
   the reader receives writes in the right order and also does not use
   too old values */

/* Without CSP Controller: invariant violations exist */
/* With CSP Controller: 5.4 seconds to model check entire state space:
 4417  states, 8086 transitions 
*/
SETS
  INDEX = {p0,p1,s0,s1}
DEFINITIONS
     DATA == NATURAL;
     SET_PREF_MAXINT == 5;
     SET_PREF_MININT == -1
CONSTANTS
  neg, pairIndex, slotIndex
PROPERTIES
  neg: INDEX >->> INDEX &
  neg(p0) = p1 & neg(p1) = p0 & neg(s0) = s1 & neg(s1) = s0 &
  neg[pairIndex] = pairIndex & neg[slotIndex] = slotIndex &
  pairIndex = {p0,p1} & slotIndex = {s0,s1}

VARIABLES
  data, slot, latest, reading,
  writepair, writeindex, /* local variables of writer */
  readpair, readindex, /* local variables of the reader */

  lastwrite,lastwriteatstart /* auxiliary variables for verification */
INVARIANT
  data: pairIndex*slotIndex --> DATA &
  slot: pairIndex --> slotIndex &
  latest: pairIndex & reading: pairIndex &

  writepair: pairIndex & writeindex: slotIndex &

  readpair: pairIndex & readindex: slotIndex &

  lastwrite:DATA & /* lastread <= lastwrite & */
  lastwriteatstart:DATA & lastwriteatstart <= lastwrite
INITIALISATION
  data :: (pairIndex*slotIndex --> {0}) ||
  slot := %p.(p:pairIndex | s0) ||
  latest := p0 ||
  reading := p0 ||
  writepair, writeindex := p0,s0 ||
  readpair, readindex := p0,s0 ||

  lastwrite, lastwriteatstart := 0,0
OPERATIONS
   w1_writerChoosesPair = BEGIN
      writepair := neg(reading)
   END;
   w2_writerChoosesSlot = BEGIN
      writeindex := neg(slot(writepair))
   END;
   w3_write(item) = PRE item:DATA & item = lastwrite+1  THEN
      data(writepair,writeindex) := item 
   END;
   w4_writerIndicatesSlot = BEGIN
      slot(writepair) := writeindex
   END;
   w5_writerIndicatesPair = BEGIN
      latest := writepair ||
      lastwrite := data(writepair,writeindex)  /* auxiliary variable for verification */ ||
      writepair, writeindex := p0,s0  /* reset local vars for model check */
   END;

  r1_readerChoosesPair = BEGIN
      readpair := latest ||
      lastwriteatstart := lastwrite
  END;
  r2_readerIndicatesPair = BEGIN
      reading := readpair
  END;
  r3_readerChoosesSlot = BEGIN
      readindex := slot(readpair)
  END;
  r4_readerChoosesPair(read) = PRE read=data(readpair,readindex) THEN
      ASSERT read>=lastwriteatstart THEN
	   readpair, readindex := p0,s0   /* reset local vars for model check */
	  END
  END
END
  