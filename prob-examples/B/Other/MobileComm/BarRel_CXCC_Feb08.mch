MACHINE CXCC_BarRel
/* Model developed on 15/2/2008 in about 1h30 */
SETS
 NODES = {k0,k1,k2}; Packets = {P1,P2,P3,ACK}
DEFINITIONS
  start == (route(1));
  end == (route(size(route)));
  DataPackets == (Packets - {expack});
  ASSERT_LTL == "(G F [DropPacket]) or (G F e(Finished))"; /* Formula still false */
  ANIMATION_IMG0 == "images/sm_empty_box.gif";
  ANIMATION_IMG1 == "images/sm_1.gif";
  ANIMATION_IMG2 == "images/sm_2.gif";
  ANIMATION_IMG3 == "images/sm_3.gif";
  ANIMATION_IMG4 == "images/sm_4.gif"; /* ACK */
  ANIMATION_STR11 == "pin___" ;
  ANIMATION_STR12 == "pout__";
  ANIMATION_STR13 == "pinlast";
  ANIMATION_FUNCTION_DEFAULT == ({1|->0|->11,2|->0|->12,3|->0|->13} \/ {r,c,i|r:1..3 & c:1..3 & i=0});
  ANIMATION_FUNCTION == ({r,c,i| r=1 & c:NODES & i:Packets & c:dom(pin) &     i=pin(c)}   <+
                         {r,c,i| r=2 & c:NODES & i:Packets & c:dom(pout) &    i=pout(c)}   <+
                         {r,c,i| r=3 & c:NODES & i:Packets & c:dom(pinlast) & i=pinlast(c)}
                         )
CONSTANTS route, expack
PROPERTIES
 route: perm(NODES) & expack:Packets &
 card(Packets)>1 &
 expack = ACK & route = [k0,k1,k2]
VARIABLES pout,pin,pinlast,ether,   to_send
INVARIANT
 /* pin, pout, pinlast model local variables of each node */
 pout: NODES +-> Packets &
 pin: NODES +-> Packets &
 pinlast: NODES +-> Packets &
 
 /* This models the transmission ether */
 ether: NODES +-> Packets &
 card(ether) <= 1 &
 
 /* This models the packets that should be sent */
 to_send : iseq(DataPackets) /* Note: iseq to avoid sending same packet twice */
INITIALISATION pout,pin,pinlast,ether := {},{},{},{}  || to_send := [P1,P2,P3]
OPERATIONS
  GenerateNewPacket(p) = PRE p:DataPackets & start /: dom(pin) &
                             to_send /= [] & p=first(to_send) THEN
     pin(start) := p || to_send := tail(to_send)
  END;
  SendPacketFirstTime(n,p,i) =
        PRE ether = {} & p:DataPackets & n:NODES & n : dom(pin) & i:NATURAL &
            route(i) = n & 
            i<size(route) & /* i is not the last node */
            pin(n) = p & n /: dom(pout) THEN
          pout(n) := p ||
          pin := {n} <<| pin ||
          ether(route(i+1)) := p
        END;
  RetransmitPacket(n,p,i) =
        PRE ether = {} & p:DataPackets & n:NODES & i:NATURAL &
            route(i) = n & 
            i<size(route) & /* i is not the last node */
            n : dom(pout) & pout(n) = p THEN
          ether(route(i+1)) := p
        END;
  ReceivePacket(n,p,i) = PRE n:NODES & p:DataPackets &
                           n:dom(ether) & ether(n) = p & i>1 &
                           i:NATURAL1 & route(i) = n THEN
      IF n:dom(pinlast) & p = pinlast(n) THEN
         IF n: dom(pin) THEN
            ASSERT pin(n) = p THEN skip END ||
            ether := {n} <<| ether
         ELSE
            ether := {n} <<| (ether \/ {route(i-1) |-> expack})
         END
      ELSE
        ASSERT n /: dom(pin) THEN
         pin(n) := p ||
         pinlast(n) := p ||
         ether := {n} <<| ether
        END
      END
    END;
    /* Note that if a ReceivePacket occurs before ReceiveImpAck then
       the ImpAck will be lost */
  ReceiveImpAck(n,i,p) = PRE n:NODES & i:NATURAL1 & i+2<=size(route) &
                             route(i) = n &
                             p:DataPackets & ether(route(i+2)) = p &
                             n: dom(pout) & pout(n) = p
                          THEN
      pout := {n} <<| pout
  END;
  ReceiveExpAck(n) = PRE n:NODES & n:dom(ether) &
                         ether(n) = expack
                          THEN
      ASSERT(n: dom(pout)) THEN
        pout := {n} <<| pout ||
        ether := {n} <<| ether
      END
  END;
  DropPacket(n,p) = PRE n:NODES & p:Packets & n:dom(ether) &
                        ether(n) = p THEN
    ether := {n} <<| ether
  END;
  ReceiveEndPacket(p) = PRE p:DataPackets & end: dom(pin) & pin(end)=p & 
                             route(size(route)-1) /: dom(ether) & ether = {} THEN
     pin := {end} <<| pin ||
     ether(route(size(route)-1)) := expack
  END;
  Finished = PRE pout = {} & pin={} & ether = {} & to_send = [] THEN
    /* This is a valid end state */
    skip
  END
END

