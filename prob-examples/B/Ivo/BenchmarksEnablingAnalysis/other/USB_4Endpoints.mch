/*
   In this model, we describe USB transfers in an abstract way:

   USB protocol is described in term of transfers as a n-uple: (host, device endpoint, transfer type).
   Transfers begin and terminate.
   Contraints are:
   - control transfers only occur on endpoint #0
   - IBI transfers occur on endpoinr #1 to #15
   - only one transfer at a time for any endpoint

*/

MACHINE
	USB_4Endpoints

SETS
	USB_TRANSFER_TYPE = {
		BULK_TRANSFER,
		CONTROL_TRANSFER,
		INTERRUPT_TRANSFER,
		ISOCHRONOUS_TRANSFER
	};

	TRANSFERS /* Set of all possible transfers */
	
CONSTANTS
	ENDPOINTS 
	
PROPERTIES
	ENDPOINTS = 0..4 /* & ENDPOINTS: POW(NAT) */
	
VARIABLES
	transfers, /* list of all transfers initiated since last power on reset */
	transfer_type, /* type of transfer between host and device */
	transfer_endpoint, /* device endpoint used for the transfer between host and device */
	transfer_completed /* indicates if a transfer has terminated or is pending */
	
INVARIANT
	transfers <: TRANSFERS &
	transfer_type : transfers +-> USB_TRANSFER_TYPE &
	transfer_endpoint : transfers +-> ENDPOINTS &
	transfer_completed : transfers +-> BOOL &
	
	/* Structural: a transfer has a type, an end point associated and a completion status */
	!tr.(tr: transfers => 
		tr: dom(transfer_type) & 
		tr: dom(transfer_endpoint) & 
		tr: dom(transfer_completed)) &

	/* Endpoint 0 is only used for control transfers */
	transfer_type~[{CONTROL_TRANSFER}] = transfer_endpoint~[{0}]
	
INITIALISATION
	transfers := {} ||
	transfer_type := {} ||
	transfer_endpoint := {} ||
	transfer_completed := {}
	
OPERATIONS
	initiate_control_transfer =
	ANY tr WHERE
		tr : TRANSFERS - transfers &
		/* Can initiate a control transfer only if there is no pending control transfer */
		transfer_type~[{CONTROL_TRANSFER}] /\ transfer_completed~[{FALSE}] = {}
	THEN
		transfers := transfers \/ {tr} ||
		transfer_type := transfer_type <+ {tr |-> CONTROL_TRANSFER} ||
		transfer_endpoint := transfer_endpoint <+ {tr |-> 0} ||
		transfer_completed := transfer_completed <+ {tr |-> FALSE}
	END;

	initiate_bulk_transfer =
	ANY tr, ep WHERE
		tr : TRANSFERS - transfers &
		ep: ENDPOINTS - {0} &
		/* Can initiate a bulk transfer for an endpoint of a device only if there is no
		   pending transfer for this endpoint */
		transfer_endpoint~[{ep}] /\ transfer_completed~[{FALSE}] = {}
	THEN
		transfers := transfers \/ {tr} ||
		transfer_type := transfer_type <+ {tr |-> BULK_TRANSFER} ||
		transfer_endpoint := transfer_endpoint <+ {tr |-> ep} ||
		transfer_completed := transfer_completed <+ {tr |-> FALSE}
	END;

	initiate_interrupt_transfer =
	ANY tr, ep WHERE
		tr : TRANSFERS - transfers &
		ep: ENDPOINTS - {0} &
		/* Can initiate a bulk transfer for an endpoint of a device only if there is no
		   pending transfer for this endpoint */
		transfer_endpoint~[{ep}] /\ transfer_completed~[{FALSE}] = {}
	THEN
		transfers := transfers \/ {tr} ||
		transfer_type := transfer_type <+ {tr |-> INTERRUPT_TRANSFER} ||
		transfer_endpoint := transfer_endpoint <+ {tr |-> ep} ||
		transfer_completed := transfer_completed <+ {tr |-> FALSE}
	END;
	
	initiate_isochronous_transfer =
	ANY tr, ep WHERE
		tr : TRANSFERS - transfers &
		ep: ENDPOINTS - {0} &
		/* Can initiate a bulk transfer for an endpoint of a device only if there is no
		   pending transfer for this endpoint */
		transfer_endpoint~[{ep}] /\ transfer_completed~[{FALSE}] = {}
	THEN
		transfers := transfers \/ {tr} ||
		transfer_type := transfer_type <+ {tr |-> ISOCHRONOUS_TRANSFER} ||
		transfer_endpoint := transfer_endpoint <+ {tr |-> ep} ||
		transfer_completed := transfer_completed <+ {tr |-> FALSE}
	END;


	terminate_control_transfer =
	ANY tr WHERE
		tr: transfers &
		transfer_type(tr) = CONTROL_TRANSFER &
		transfer_endpoint(tr) = 0 &
		transfer_completed(tr) = FALSE
	THEN
		transfer_completed(tr) := TRUE
	END;

	terminate_bulk_transfer =
	ANY tr WHERE
		tr: transfers &
		transfer_type(tr) = BULK_TRANSFER &
		transfer_endpoint(tr) : 1..15 &
		transfer_completed(tr) = FALSE
	THEN
		transfer_completed(tr) := TRUE
	END;
	

	terminate_interrupt_transfer =
	ANY tr WHERE
		tr: transfers &
		transfer_type(tr) = INTERRUPT_TRANSFER &
		transfer_endpoint(tr) : 1..15 &
		transfer_completed(tr) = FALSE
	THEN
		transfer_completed(tr) := TRUE
	END;
	
	terminate_isochronous_transfer =
	ANY tr WHERE
		tr: transfers &
		transfer_type(tr) = ISOCHRONOUS_TRANSFER &
		transfer_endpoint(tr) : 1..15 &
		transfer_completed(tr) = FALSE
	THEN
		transfer_completed(tr) := TRUE
	END;

	configure_endpoint0 = skip; /* introduced in USB_1.ref */
	configure_IBI_endpoint = skip; /* introduced in USB_1.ref */
	deconfigure_IBI_endpoint = skip; /* introduced in USB_1.ref */
	
	initiate_setup_transaction = skip; /* event introduced in USB_2 */
	end_setup_transaction = skip; /* event introduced in USB_2 */
	initiate_data_transaction_control_transfer =  skip; /* event introduced in USB_2 */
	end_data_transaction_control_transfer = skip;  /* event introduced in USB_2 */
	initiate_status_transaction = skip; /* event introduced in USB_2 */
	end_status_transaction = skip; /* event introduced in USB_2 */

	initiate_data_transaction_interrupt_transfer =  skip; /* event introduced in USB_2 */
	end_data_transaction_interrupt_transfer = skip;  /* event introduced in USB_2 */

	initiate_data_transaction_bulk_transfer =  skip; /* event introduced in USB_2 */
	end_data_transaction_bulk_transfer = skip;  /* event introduced in USB_2 */

	initiate_data_transaction_isochronous_transfer =  skip; /* event introduced in USB_2 */
	end_data_transaction_isochronous_transfer = skip;  /* event introduced in USB_2 */

	issue_packet_in_interrupt_transaction = skip; /* event introduced in USB_3 */
	issue_packet_data_interrupt_transaction = skip; /* event introduced in USB_3 */
	issue_packet_ack_interrupt_transaction = skip; /* event introduced in USB_3 */
	issue_packet_nack_interrupt_transaction = skip; /* event introduced in USB_3 */
	issue_packet_stall_interrupt_transaction = skip; /* event introduced in USB_3 */

	issue_packet_in_isochronous_transaction = skip; /* event introduced in USB_3 */
	issue_packet_data_in_isochronous_transaction = skip; /* event introduced in USB_3 */
	issue_packet_out_isochronous_transaction = skip; /* event introduced in USB_3 */
	issue_packet_data_out_isochronous_transaction = skip; /* event introduced in USB_3 */

	issue_packet_in_bulk_transaction = skip; /* event introduced in USB_3 */
	issue_packet_out_bulk_transaction = skip; /* event introduced in USB_3 */
	issue_packet_data_bulk_transaction = skip; /* event introduced in USB_3 */

	
	issue_packet_sof = skip; /* event introduced in USB_3 */
	receive_transaction_packet = skip; /* introduced in USB_4 */
	receive_sof_packet = skip /* introduced in USB_4 */
	
END
