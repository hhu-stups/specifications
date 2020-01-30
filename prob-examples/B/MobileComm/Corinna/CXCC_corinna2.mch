  MODEL CXCC_corinna2

  SETS Nodes; Data; Bool = {true, false}

  CONSTANTS REACHABLE, MESSAGES

  PROPERTIES REACHABLE = Nodes &
	MESSAGES : REACHABLE <-> Data /* ? +-> */
	& MESSAGES /= {}
	/* REACHABLE_OTHER : Nodes <-> POW(Nodes) 
		!(n).(n : Nodes => n/: REACHABLE(n))*/

  VARIABLES medium_messages, medium_empty

  INVARIANT medium_messages : MESSAGES <-> POW(Nodes) /*? +-> */
	& medium_empty : Bool 

  INITIALISATION medium_messages := {} || medium_empty := true

  OPERATIONS

  send_message(A, d) =
	PRE A : Nodes & d : Data & {A |-> d}<: MESSAGES & medium_empty = true
	THEN medium_messages := medium_messages \/ {(A |-> d) |-> (Nodes-{A})} ||
		medium_empty := false
	END ;

  get_message(M,N) = /* only once per node possible*/
	PRE M : medium_messages & N : Nodes & 
		/*# (x,y).((x : MESSAGES & y : POW(Nodes)) => (x |-> y) = M)*/
		 N : (prj2(MESSAGES, POW(Nodes))(M))
	THEN 
		IF (prj2(MESSAGES, POW(Nodes))(M)) - {N} = {} THEN
			medium_messages := medium_messages - {M} ||
			medium_empty := true		
		ELSE medium_messages :=  medium_messages - {M} \/ 
	 {(prj1(MESSAGES, POW(Nodes))(M)) |-> (prj2(MESSAGES, POW(Nodes))(M))-{N}}
		END
	END

  END