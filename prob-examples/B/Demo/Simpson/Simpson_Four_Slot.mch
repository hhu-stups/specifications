MACHINE Simpson_Four_Slot
/* 92 seconds to model check entire state space:
 46658 states, 112754 transitions
*/
SETS
  INDEX = {p0,p1,s0,s1};
  DATA = {d1,d2,d3}
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ({r,c,i|r:INDEX & c:INDEX & i=0});
      DataToIndex(D) == ((i=p0 & D=d1) or (i=p1 & D=d2) or (i=s0 & D=d3));
      ANIMATION_FUNCTION == ( {r,c,i|r:pairIndex & c:slotIndex & DataToIndex(data(r,c))}  
                              \/
                              {r,c,i|r:pairIndex & c=p0 & i=slot(r)}
                              );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif"

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
  readpair, readindex /* local variables of the reader */
INVARIANT
  data: pairIndex*slotIndex --> DATA &
  slot: pairIndex --> slotIndex &
  latest: pairIndex & reading: pairIndex &

  writePC:1..5 & readPC:1..4 &

  writepair: pairIndex & writeindex: slotIndex &

  readpair: pairIndex & readindex: slotIndex

INITIALISATION
  data :: (pairIndex*slotIndex --> {d1}) ||
  slot := %p.(p:pairIndex | s0) ||
  latest := p0 ||
  reading := p0 ||
  writePC,readPC := 1,1 ||
  writepair, writeindex := p0,s0 ||
  readpair, readindex := p0,s0
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
      writePC :=  1 ||
	  writepair, writeindex := p0,s0  /* reset local vars for model check */
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
      readPC := 1 ||
	  readpair, readindex := p0,s0   /* reset local vars for model check */
  END
END
  