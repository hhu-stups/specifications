MODEL
   ImpAckProtocol
   /* First model of a protocol for wireless networks with implicit
      acknowledgement (a device can observe whether its message has
      been forwarded) and flow control (only send further packets
      if the previous packet has been acknowledged by the successor;
      it doesn't necessarily have to have been arrived at the destination) */
  /* Not yet modelled: messages being lost and explicit request for ack
     messages */
  /* Notes with MSG_SIZE = 5 and 3 devices:
     942 nodes; with symmetry markers 271  */
SETS
  Devices
 CONSTANTS
  connected
 PROPERTIES 
    connected: Devices <-> Devices  & /* which devices can speak to each other */
    connected = connected~ & /* symmetric relation */
    id(Devices) /\ connected = {} /* anti-reflexive */
    
    & dom(connected) = Devices  /* does not yet ensure complete connectness */
DEFINITIONS
  scope_Devices == 1..3; MSG_SIZE == 4 ;
  origin == first(route);
  destination == last(route);
  dest_pred == last(front(route));
  ROUTE_INV == (route: perm(Devices) &   /* we have just one route */
           size(route)>1 &
           !ri.(ri:1..(size(route)-1) => route(ri)|->route(ri+1) : connected))
VARIABLES
    route, sent, imp_ack, Messages, AckMessages, Buffer
INVARIANT  ROUTE_INV &
   sent: Devices --> NATURAL &
   imp_ack: Devices --> NATURAL &
   Buffer: Devices +-> NATURAL &
   Messages : Devices --> POW(NATURAL*Devices) &  /* packet_nr sent to Device */
   AckMessages : Devices --> POW(NATURAL*Devices)

  /* TO DO: add further properties for sending & implicit ack */
  &
  !si.(si:1..(size(route)-1) => sent(route(si)) <= sent(route(si+1))+1) &
  !dd.(dd:Devices => sent(dd) >= imp_ack(dd))
INITIALISATION
  route : (ROUTE_INV) ||
  sent := %x.(x:Devices|0) || imp_ack := %x.(x:Devices|0) ||
  Buffer := {} ||
  Messages := %x.(x:Devices|{}) || AckMessages := %x.(x:Devices|{})
OPERATIONS
  add_packet(nr) = PRE nr = sent(origin)+1 & origin /: dom(Buffer) &
     nr <= MSG_SIZE THEN
    /* add a new packet to the buffer of the origin */
     Buffer(origin) := nr
  END;
  send_packet(nr,from,to,i) = PRE from:Devices & to:Devices & from/= to &
     from : dom(Buffer) &  /* the buffer of from has a packet */
     nr = Buffer(from) &
     i: 1..(size(route)-1) &
     from = route(i) & to = route(i+1) &
     imp_ack(from) = nr-1 THEN
     sent(from) := nr ||
     Buffer := {from} <<| Buffer || /* remove packet from Buffer */
     Messages(from) := Messages(from) \/ { nr |-> to }  /* put Message into Ether */
  END;
  receive_packet(nr,from,to) = PRE to:Devices & nr: NATURAL & 
      nr > sent(to) &
      from: Devices & from |-> to : connected &
      nr |-> to : Messages(from) & to /: dom(Buffer)  THEN
         Buffer(to) := nr
  END;
  receive_imp_ack(nr,from,i) = PRE nr:NATURAL & from:Devices &
     i:NATURAL1 & i<size(route)-1 & from=route(i) &
     /* sent(from) = nr & */
     nr |-> route(i+2) : Messages(route(i+1)) & imp_ack(from)<nr THEN
     imp_ack(from) := nr
  END;
  receive_explicit_ack(node,from,nr) = PRE node:Devices & nr:NATURAL &
     from: Devices & from |-> node: connected &
     nr |-> node : AckMessages(from) & nr> imp_ack(from) THEN
     imp_ack(from) := nr
  END;
  arrive_packet(nr) = PRE nr:NATURAL & Buffer(destination) = nr THEN
   /* a packet has arrived at the destination; send ack to predecessor */
     Buffer := {destination} <<| Buffer || 
     AckMessages(dest_pred) := AckMessages(dest_pred) \/ { nr |-> destination} ||
     sent(destination) := nr /* store that we have received packet and set it to client */
  END;
  finished = PRE sent(destination)=MSG_SIZE THEN skip END
END