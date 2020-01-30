MODEL
  CXCC_Corinna2a

  SETS Nodes; Data; Bool = {true, false}

  CONSTANTS ROUTES

  PROPERTIES ROUTES <: iseq(Nodes) & ROUTES /= {}
	

  VARIABLES medium_messages, medium_empty, messages, used_data, FIRST, LAST

  INVARIANT messages : (Nodes <-> Nodes) <-> Data & medium_empty : Bool 
		& medium_messages : messages <-> POW(Nodes)  /*? +-> */
		& used_data <: Data & FIRST <: Nodes & LAST <: Nodes
	

  INITIALISATION medium_messages := {} || medium_empty := true || messages := {}
		|| used_data := {}
		|| FIRST := {n| n : Nodes & # (r).(r:ROUTES & r : iseq(Nodes) & n = first(r)) } 
		|| LAST := {n| n : Nodes & # (r).(r:ROUTES & r : iseq(Nodes) & n = last(r)) } 

  OPERATIONS

  set_message(n_send, n_rec, d) = /* n first node along a route */
	PRE n_send : Nodes & n_send : FIRST & n_rec : Nodes & n_rec : LAST & d : Data 
		& d /: used_data & {(n_send |-> n_rec)} /: dom(messages) & d /: ran(messages) 
	THEN messages := messages \/ {{(n_send |-> n_rec)} |-> d} || 
		used_data := used_data \/ {d}
	END ;

  send_message(n_send, n_rec, d, m) =
	PRE n_send : Nodes & n_rec : Nodes & d : Data & m : messages & 
		m = ({(n_send |-> n_rec)} |-> d) &  medium_empty = true
	THEN medium_messages := medium_messages \/ {m |-> (Nodes-{n_send})} ||
		medium_empty := false
	END ;

  get_message(n_send, n_rec, d, m, mm_nodes, mm, n_next) =  
	PRE n_send : Nodes & m : messages & mm : medium_messages & 
		mm_nodes : POW(Nodes) & n_rec : LAST & n_next : Nodes & d : Data &
		m = ({n_send |-> n_rec} |-> d) &
		mm = (m |-> mm_nodes) &  n_next : mm_nodes
		
	THEN  
	   IF mm_nodes - {n_next} = {} THEN
		medium_messages := medium_messages - {mm} || 
		medium_empty := true		 
	   ELSE medium_messages :=  medium_messages - {mm} \/ 
	 	{m |-> mm_nodes-{n_rec}}
	   END || 
	   ANY r WHERE r : ROUTES & n_send : ran(r) & n_rec : ran(r) & n_next : ran(r)
	   THEN
		CHOICE messages := messages \/ { {n_send |-> n_next} |-> prj2(Nodes <-> Nodes, Data)(m)} 
		OR skip
		END
	   END
	END

  END