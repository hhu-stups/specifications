MACHINE ProtocolSpec
SETS
  Devices
CONSTANTS
   orig,dest, msg_size
PROPERTIES 
   orig: Devices & dest:Devices & orig/=dest & msg_size:NATURAL1
VARIABLES sent_orig, received_dest, Ether
INVARIANT  sent_orig:NATURAL & received_dest:NATURAL &
   received_dest <= sent_orig &
   Ether: POW(NATURAL) &
   Ether = {i|i:1..sent_orig}
INITIALISATION
   sent_orig:= 0 || received_dest := 0 ||
   Ether := {}
OPERATIONS
  add_packet(nr) = PRE nr = sent_orig+1 & nr <= msg_size THEN
    Ether := Ether \/ {nr}||
    sent_orig := nr
  END;
  arrive_packet(nr) = PRE nr:Ether & nr = received_dest+1 THEN
   /* a packet has arrived at the destination; send ack to predecessor */
    received_dest := nr
  END;
  finished = PRE received_dest=msg_size THEN skip END;
  send_packet(nr,from,to,i) = PRE from:Devices & to:Devices & from/= to &
     nr:NATURAL & i:NATURAL1 THEN
     skip
  END;
  receive_packet(nr,from,to) = PRE to:Devices & nr: NATURAL & 
      from: Devices & to: Devices  THEN
         skip
  END;
  receive_imp_ack(nr,from,i) = PRE nr:NATURAL & from:Devices &
     i:NATURAL1  THEN
     skip
  END;
  receive_explicit_ack(node,from,nr) = PRE node:Devices & nr:NATURAL &
     from: Devices THEN
     skip
  END
END