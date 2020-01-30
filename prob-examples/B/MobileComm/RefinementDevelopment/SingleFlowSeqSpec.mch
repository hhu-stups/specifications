MODEL
   SingleFlowSeqSpec
/* The high level specification of the CXCC Protocol mith a single flow */
/* It uses sequences; which doesn't work very well with B4Free */
SETS
  DEVICES;
  PACKETS
CONSTANTS
  emptyp, RPACKETS, /* real packets */
  dest, source
PROPERTIES
  emptyp:PACKETS & RPACKETS = PACKETS - {emptyp} &
  dest:DEVICES & source:DEVICES
VARIABLES
  messages
INVARIANT
  messages: iseq(RPACKETS)
INITIALISATION
  messages := <>
OPERATIONS
  generate_packet(p) = PRE  p:PACKETS & p/=emptyp &
         p/:ran(messages) THEN
      messages := p->messages
    END;
  r <-- consume_packet = SELECT messages /= {} THEN
         r:= last(messages) ||
         messages := front(messages)
    END;

   transmit_packet(p,i) = PRE p:PACKETS & p/=emptyp & i:NATURAL1 THEN
              skip
    END
END