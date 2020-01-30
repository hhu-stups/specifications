MACHINE NastyCoin
DEFINITIONS SET_PREF_MAXINT == 255; SET_PREF_MININT == 0
VARIABLES
  c10,c20,c50,c100,c200, cardnr, ticket
INVARIANT
  c10:NAT & c20:NAT & c50:NAT & c100:NAT & c200:NAT & cardnr:NAT & ticket:NAT
INITIALISATION
  c10,c20,c50,c100,c200, cardnr, ticket := 0,0,0,0,0, 0,2
OPERATIONS
  insert_10cents = PRE cardnr=0 & ticket>0 THEN
    c10 := c10 + 1
  END;
  insert_20cents = PRE cardnr=0 & ticket>0 THEN
    c20 := c20 + 1
  END;
  insert_50cents = PRE cardnr=0 & ticket>0 THEN
    c50 := c50 + 1
  END;
  insert_100cents = PRE cardnr=0 & ticket>0 THEN
    c100 := c100 + 1
  END;
  insert_200cents = PRE cardnr=0 & ticket>0 THEN
    c200 := c200 + 1
  END;
  insert_card = PRE c10+c20+c50+c100+c200=0 & ticket>1 THEN cardnr := 1 END;
  withdraw_ticket_from_coins = PRE c10+2*c20+5*c50+10*c100+20*c200=50 THEN
    c10,c20,c50,c100,c200, cardnr, ticket := 0,0,0,0,0, 0,ticket-1
  END;
  withdraw_ticket_from_card = PRE cardnr>0 THEN
     ticket := ticket -1  /* forgot to reset cardnr */
  END
END

/*

% initialise_machine(int(0),int(0),int(0),int(0),int(0),int(0),int(2))
Total time for search step: 49184 microseconds per iteration
found_error(invariant_violation,24)

Total time for search step: 654639 microseconds per iteration
found_error(invariant_violation,422)
1212 NODES

Total time for search step: 166053 microseconds per iteration
found_error(invariant_violation,106)
680 NODES ?

Total time for search step: 195423 microseconds per iteration
found_error(invariant_violation,116)
800 NODES ?

Total time for search step: 716640 microseconds per iteration
found_error(invariant_violation,422)
1333 NODES

Total time for search step: 771179 microseconds per iteration
found_error(invariant_violation,390)
1173 NODES

Total time for search step: 12978 microseconds per iteration
found_error(invariant_violation,9)
27 NODES

Total time for search step: 122318 microseconds per iteration
found_error(invariant_violation,73)
249 NODES

Total time for search step: 61070 microseconds per iteration
found_error(invariant_violation,39)
138 NODES

Total time for search step: 20387 microseconds per iteration
found_error(invariant_violation,9)
51 NODES

Total time for search step: 532651 microseconds per iteration
found_error(invariant_violation,280)
842 NODES

Total time for search step: 63856 microseconds per iteration
found_error(invariant_violation,133)
136 NODES

Total time for search step: 39638 microseconds per iteration
found_error(invariant_violation,24)
101 NODES

*/