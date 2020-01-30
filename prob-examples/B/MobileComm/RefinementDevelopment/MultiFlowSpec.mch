MODEL
   MultiFlowSpec
/* The high level specification of the CXCC Protocol mith multiple flows */
SETS
  DEVICES;
  PACKETS
CONSTANTS
  emptyp, RPACKETS /* real packets */
PROPERTIES
  emptyp:PACKETS & RPACKETS = PACKETS - {emptyp}
VARIABLES
  messages
INVARIANT
  messages: (DEVICES*DEVICES) --> iseq(RPACKETS) &
  !x.(x:DEVICES => messages(x,x) = <>)
INITIALISATION
  messages := %(x,y).(x:DEVICES&y:DEVICES|<>)
OPERATIONS
  generate_packet(dest,source,p) = PRE dest:DEVICES & source:DEVICES & dest/=source & p:PACKETS & p/=emptyp &
         p/:ran(messages(dest,source)) THEN
      messages(dest,source) := messages(dest,source)<-p
    END;
  r <-- consume_packet(dest,source) = PRE dest:DEVICES & source:DEVICES & dest/=source  THEN
      SELECT messages(dest,source) /= {} THEN
         r:= last(messages(dest,source)) ||
         messages(dest,source) := front(messages(dest,source))
      END
    END;

   transmit_packet(dest,source,p,i) = PRE dest:DEVICES & source:DEVICES & dest/=source & p:PACKETS & p/=emptyp & i:NATURAL1 THEN
              skip
    END
END