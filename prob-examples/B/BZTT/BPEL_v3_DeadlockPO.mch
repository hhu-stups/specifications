MACHINE Model_Machine_4_v3_DeadlockPO
/* BZTT cannot solve this:
  {Warning: no_match(abolish(user:predicatBGP))}
domain_error(domain(.(_63,[]),_67,_68),0,set_expression,..(_67,_68))
	at se.sics.jasper.SICStus.handleQueryResult(SICStus.java:779)
	at se.sics.jasper.SPQuery.nextSolution(SPQuery.java:267)
	at animateur.engine.ServerThread.run(ServerThread.java:73)

*/
SETS /* deferred */
  InvMessage={im1};
  InvoiceType={it1};
  POMessage={pom1};
  Void={void1};
  customerInfoType={cit1};
  orderFault = {of1};
  orderFaultType = {oft1};
  purchaseOrderType = {pot1};
  scheduleInfoType = {sit1};
  scheduleMessage = {sm1};
  shippingInfoMessage = {sim1};
  shippingInfoType = {spit1};
  shippingRequestMessage = {srm1}
OPERATIONS

/*
% checking_component_properties(1,[IVC_IM,InvMessage,InvoiceType,POMessage,Void,customerInfoType,customerInfo_PM,customerInfo_SRM,initiatePriceCalculation,purchaseOrderType,purchaseOrder_PM,requestProductionScheduling,requestShipping,scheduleInfoType,scheduleMessage,schedule_SM,sendInvoice,sendPurchaseOrder,sendSchedule|...])
% checking_component_properties(2,[orderFault,orderFaultType,problemInfo])

*/
 SolveDeadlockPO(IVC_IM,customerInfo_PM,customerInfo_SRM,initiatePriceCalculation,purchaseOrder_PM,requestProductionScheduling,requestShipping,schedule_SM,sendInvoice,sendPurchaseOrder,sendSchedule,
  Invoice_Var, PO_Var,flow01,flow02,flow03,link1,link2, sendShippingPrice, sendShippingSchedule,
  sequ0,sequ1,sequ2,sequ3,shippingInfo_SIM, shippingInfo_Var, shippingSchedule_Var, shippingRequest_Var,
  problemInfo) = PRE
  IVC_IM:POW(InvMessage*InvoiceType)  &

 customerInfo_PM:POW(POMessage*customerInfoType)  &

 customerInfo_SRM:POW(shippingRequestMessage*customerInfoType)  &

 initiatePriceCalculation:POW(POMessage*Void)  &

 problemInfo:POW(orderFault*orderFaultType)  &

 purchaseOrder_PM:POW(POMessage*purchaseOrderType)  &

 requestProductionScheduling:POW(POMessage*Void)  &

 requestShipping:POW(shippingRequestMessage*shippingInfoMessage)  &

 schedule_SM:POW(scheduleMessage*scheduleInfoType)  &

 sendInvoice:POW(InvMessage*Void)  &

 sendPurchaseOrder:POW(POMessage*InvMessage)  &

 sendSchedule:POW(scheduleMessage*Void)  &

 sendShippingPrice:POW(shippingInfoMessage*Void)  &

 sendShippingSchedule:POW(scheduleMessage*Void)  &

 shippingInfo_SIM:POW(shippingInfoMessage*shippingInfoType)  &

 /* VARIABLES */
 Invoice_Var:POW(InvMessage)  &

 PO_Var:POW(POMessage)  &

 flow01:INTEGER  &

 flow02:INTEGER  &

 flow03:INTEGER  &

 link1:INTEGER  &

 link2:INTEGER  &

 sequ0:INTEGER  &

 sequ1:INTEGER  &

 sequ2:INTEGER  &

 sequ3:INTEGER  &

 shippingInfo_Var:POW(shippingInfoMessage)  &

 shippingRequest_Var:POW(shippingRequestMessage)  &

 shippingSchedule_Var:POW(scheduleMessage)  &
 
	Void /= {}
	&
	shippingRequestMessage /= {}
	&
	shippingInfoMessage /= {}
	&
	scheduleMessage /= {}
	&
	POMessage /= {}
	&
	InvMessage /= {}
	&
	orderFault /= {}
	&
	customerInfo_SRM : shippingRequestMessage --> customerInfoType
	&
	shippingInfo_SIM : shippingInfoMessage --> shippingInfoType
	&
	schedule_SM : scheduleMessage --> scheduleInfoType
	&
	customerInfo_PM : POMessage --> customerInfoType
	&
	purchaseOrder_PM : POMessage --> purchaseOrderType
	&
	IVC_IM : InvMessage --> InvoiceType
	&
	problemInfo : orderFault --> orderFaultType
	&
	sendPurchaseOrder : POMessage --> InvMessage
	&
	sendInvoice : InvMessage --> Void
	&
	sendSchedule : scheduleMessage --> Void
	&
	initiatePriceCalculation : POMessage --> Void
	&
	sendShippingPrice : shippingInfoMessage --> Void
	&
	requestShipping : shippingRequestMessage --> shippingInfoMessage
	&
	requestProductionScheduling : POMessage --> Void
	&
	sendShippingSchedule : scheduleMessage --> Void
	&
	card(PO_Var) <= 1
	&
	card(Invoice_Var) <= 1
	&
	card(shippingRequest_Var) <= 1
	&
	card(shippingInfo_Var) <= 1
	&
	card(shippingSchedule_Var) <= 1
	&
	sequ0 : {0,1,2,3}
	&
	flow01 : {0,1}
	&
	sequ1 : {0,1,2,3}
	&
	flow02 : {0,1}
	&
	sequ2 : {0,1,2,3}
	&
	flow03 : {0,1}
	&
	sequ3 : {0,1,2}
	&
	link1 : {0,1}
	&
	link2 : {0,1}
	&
	(sequ0 <= 2 <=> PO_Var /= {})
	&
	(sequ1 <= 2 <=> shippingRequest_Var /= {})
	&
	(sequ1 <= 1 <=> (link1 = 0 & shippingInfo_Var /= {}))
	&
	((link1 = 0) <=> shippingInfo_Var /= {})
	&
	((sequ1 = 0) <=> (link2 = 0 & shippingSchedule_Var /= {}))
	&
	((link2 = 0) <=> shippingSchedule_Var /= {})
	&
	((sequ2 = 0) <=> Invoice_Var /= {})
	&
	(sequ0 <= 1 => sequ2 = 0)
	&
	(flow02 = 0 => sequ2 = 0)
	&
	(sequ0 <= 1 => Invoice_Var /= {})
	&
	(sequ2 <= 1 => link1 = 0)
	&
	(sequ3 = 0 => link2 = 0)
	&
	not(
	  sequ0 = 0
	)
	&
	not(
		sequ0 = 3
		&
		dom(sendPurchaseOrder) /= {}
	)
	&
	not(
		sequ0 = 2
		&
		flow02 = 0
		&
		flow01 = 0
		&
		flow03 = 0
	)
	&
	not(
		sequ0 = 2
		&
		flow01 = 1
		&
		sequ1 = 0
	)
	&
	not(
		sequ0 = 2
		&
		PO_Var /= {}
		&
		flow01 = 1
		&
		sequ1 = 3
		&
		#(from_0,to_0).(to_0 : shippingRequestMessage & (from_0 : PO_Var & customerInfo_SRM(to_0) = customerInfo_PM(from_0)))
	)
	&
	not(
		sequ0 = 2
		&
		flow01 = 1
		&
		sequ1 = 2
		&
		shippingRequest_Var /= {}
		&
		shippingRequest_Var /= {}
	)
	&
	not(
		sequ0 = 2
		&
		flow01 = 1
		&
		sequ1 = 1
		&
		dom(sendSchedule) /= {}
	)
	&
	not(
		sequ0 = 2
		&
		flow02 = 1
		&
		sequ2 = 0
	)
	&
	not(
		sequ0 = 2
		&
		PO_Var /= {}
		&
		PO_Var /= {}
		&
		flow02 = 1
		&
		sequ2 = 3
	)
	&
	not(
		sequ0 = 2
		&
		flow02 = 1
		&
		sequ2 = 2
		&
		shippingInfo_Var /= {}
		&
		shippingInfo_Var /= {}
		&
		link1 = 0
	)
	&
	not(
		sequ0 = 2
		&
		flow02 = 1
		&
		sequ2 = 1
		&
		dom(sendInvoice) /= {}
	)
	&
	not(
		sequ0 = 2
		&
		flow03 = 1
		&
		sequ3 = 0
	)
	&
	not(
		sequ0 = 2
		&
		PO_Var /= {}
		&
		PO_Var /= {}
		&
		flow03 = 1
		&
		sequ3 = 2
	)
	&
	not(
		sequ0 = 2
		&
		flow03 = 1
		&
		sequ3 = 1
		&
		shippingSchedule_Var /= {}
		&
		shippingSchedule_Var /= {}
		&
		link2 = 0
	)
	&
	not(
		sequ0 = 1
		&
		Invoice_Var /= {}
		&
		#(reply).(reply : ran(sendPurchaseOrder) & reply : Invoice_Var)
	)
    THEN
      skip
    END
END
