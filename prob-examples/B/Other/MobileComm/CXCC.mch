MACHINE CXCC
SETS Nodes = {n1,n2,n3}; Packets; Flow = {f1}
CONSTANTS
  origin,dest, route
PROPERTIES
  origin: Flow --> Nodes &
  dest: Flow --> Nodes &
  !f.(f:Flow => origin(f) /= dest(f)) &
  route: Flow --> iseq1(Nodes) & 
  size(route(f1))>2 &
  !f.(f:Flow => (first(route(f)) = origin(f) &
                last(route(f))= dest(f)) )
ASSERTIONS
  !f.(f:Flow => (first(route(f)) = origin(f) &
                last(route(f))= dest(f)) );
  first(route(f1)) = origin(f1);
  last(route(f1)) = dest(f1)
 VARIABLES
   in_queue, out_queue, used_packets
 INVARIANT
   in_queue: (Flow*Nodes +-> Packets) &
   out_queue: (Flow*Nodes +-> Packets)  &
   used_packets: Flow --> POW(Packets) &
   !(f,i).(f:Flow & i:NATURAL1 & i:1..size(route(f))-1 &
     f|->route(f)(i+1) : dom(in_queue) 
     => ( f|->route(f)(i) : dom(out_queue)  &
         in_queue(f|->route(f)(i+1)) = out_queue(f|->route(f)(i)))
          )
 INITIALISATION
   in_queue := {} || out_queue := {} ||
   used_packets := %f.(f:Flow|{})
 OPERATIONS
   generate_packet(f,packet) = PRE f:Flow &
      f|->origin(f) /: dom(in_queue) &  /* in_queue ist leer */
      packet:Packets &
      packet /: used_packets(f) THEN
     in_queue(f|->origin(f)) := packet ||
     used_packets(f) := used_packets(f) \/ {packet}
   END;
   shift_packet(f,n) = PRE f:Flow & n:Nodes &
      f|->n /: dom(out_queue) &  /* out_queue ist leer */
      f|->n : dom(in_queue) & n /= dest(f) THEN
      out_queue(f|->n) := in_queue(f|->n) ||
      in_queue := {f|->n} <<| in_queue
   END;
   consume_packet(f,n,p,pre) = PRE f:Flow & n:Nodes & n = dest(f) &
      f|->n : dom(in_queue) & p:Packets &
      in_queue(f|->n) = p &
      pre:Nodes & #i.(i:NATURAL1 & i>1 & route(f)(i)=n & route(f)(i-1)=pre)
      THEN
      CHOICE
         out_queue := {f|->pre} <<| out_queue  /* explicit ack arrives */
         OR
         skip  /* explicit ack gets lost */
      END  ||
      in_queue := {f|->n} <<| in_queue
   END;
   send_packet_succ(f,n,p,suc) = PRE f:Flow & n:Nodes & p:Packets &
     n /= dest(f) &
     f|->n : dom(out_queue) & out_queue(f|->n) = p &
     suc:Nodes & #i.(i:NATURAL1 & route(f)(i)=n & route(f)(i+1)=suc) THEN
      in_queue(f|->suc) := p 
   END;
   send_imp_ack_succ(f,n,p,pre) = PRE f:Flow & n:Nodes & p:Packets &
     n /= dest(f) & n/= origin(f) &
     f|->n : dom(out_queue) & out_queue(f|->n) = p &
     pre:Nodes & #i.(i:NATURAL1 & i>1 & route(f)(i)=n & route(f)(i-1)=pre) THEN
      out_queue := {f|->pre} <<| out_queue 
   END
END