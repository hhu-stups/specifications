MODEL
   SingleFlowSpec
/* The high level specification of the CXCC Protocol mith a single flow */
/* We now use sets of packets with numbers rather than sequences:
     this avoids the conc operator in the refinement (union is enough) */
SETS
  DEVICES;
  RPACKETS
CONSTANTS
  dest, source, nrpackets
PROPERTIES
  dest:DEVICES & source:DEVICES & nrpackets:NATURAL1
VARIABLES
  messages,sent
INVARIANT
  messages: NATURAL1 +-> RPACKETS & sent:NATURAL &
  dom(messages) <: 1..sent &
  sent<= nrpackets
INITIALISATION
  messages := {} || sent := 0
OPERATIONS
  generate_packet(p) = PRE  p:RPACKETS & sent<nrpackets THEN
      messages := messages \/ {sent+1 |-> p} ||
      sent := sent+1
    END;
  r <-- consume_packet = SELECT messages /= {} THEN
         r:= messages(min(dom(messages))) ||
         messages := {min(dom(messages))} <<| messages
    END;

   transmit_packet(p,nr,from,to) = PRE p:RPACKETS & nr:NATURAL1 & nr|->p :messages &
                    from:DEVICES & to:DEVICES & from/= to THEN
              skip
    END
END