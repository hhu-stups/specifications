MACHINE
   Bank3D
/* use with banking7.csp*/
/* un-expand QueueManager_dec/incMessageCount in Queue_remove,Queue_insert*/
/* sentMessageCount removed since it is no longer used */
SETS	
	ATMSet={atm1,atm2,atm3};
	QueueManagerSet={mm1};
	QueueSet={q1,q2,q3,q4};
	MessageSet={m1,m2,m3,m4,m5,m6,m7,m8};
	Message_messageString;
	ATM_idString={atmID1,atmID2,atmID3};
	BankServerSet={b1};
	myBOOL ={myTrue,myFalse}
CONSTANTS
	Queue_queueCapacity,QueueManager_listCapacity 
PROPERTIES
	Queue_queueCapacity=10 &
	QueueManager_listCapacity = 10 /* SET TO ZERO TO TEST if-then */
VARIABLES
	ATM,ATM_queueManager,ATM_outQueue,ATM_replyQueue,ATM_id,
	Queue,Queue_queue,Queue_queueTail,Queue_queueSize,
	Queue_queueHead,
	Message,Message_message,Message_replyTo,
	QueueManager,QueueManager_sendQueueList,QueueManager_replyQueueList,
	QueueManager_sendQueueListSize,
	QueueManager_replyQueueListSize,QueueManager_sendQueueHead,
	QueueManager_replyQueueHead,QueueManager_sendQueueTail,
	QueueManager_replyQueueTail,
	BankServer,BankServer_queueManager
INVARIANT
	ATM: POW(ATMSet) &
	Queue: POW(QueueSet) &
	QueueManager: POW(QueueManagerSet) &
	Message: POW(MessageSet) &
	BankServer: POW(BankServerSet) &
	ATM_queueManager: ATM+->QueueManager &
	ATM_outQueue: ATM+->Queue &
	ATM_replyQueue: ATM+->Queue &
	ATM_id: ATM+->ATM_idString &
	Queue_queue: Queue-->(INT+->Message) &
	Queue_queueSize: Queue-->INT &
	Queue_queueHead: Queue-->INT &
	Queue_queueTail: Queue-->INT &
	Message_message: Message+->Message_messageString &
	Message_replyTo: Message+->Queue &
	QueueManager_sendQueueList: QueueManager-->(INT+->Queue) &
	QueueManager_replyQueueList: QueueManager-->(INT+->Queue) &
	QueueManager_sendQueueListSize: QueueManager-->INT &
	QueueManager_replyQueueListSize: QueueManager-->INT &
	QueueManager_sendQueueHead: QueueManager-->INT &
	QueueManager_replyQueueHead: QueueManager-->INT&
	QueueManager_sendQueueTail: QueueManager-->INT &
	QueueManager_replyQueueTail: QueueManager-->INT &
	BankServer_queueManager: BankServer-->QueueManager
	
INITIALISATION
	ATM:={}|| ATM_queueManager:={} || ATM_outQueue:={} || ATM_replyQueue:={} ||
	ATM_id:={} ||
	Queue:={} || Queue_queue:={} ||
	Queue_queueSize:={} || Queue_queueHead:={} || Queue_queueTail:={} ||
	Message:={} ||	Message_message:={} || Message_replyTo:={} ||
	QueueManager:={} || QueueManager_sendQueueList:={} || 
	QueueManager_replyQueueList:={} || 
	QueueManager_sendQueueListSize:={} || QueueManager_replyQueueListSize:={}||
	QueueManager_sendQueueHead:={} || QueueManager_replyQueueHead:={}||
	QueueManager_sendQueueTail:={} || QueueManager_replyQueueTail:={} ||
	BankServer:={} || BankServer_queueManager:={}

OPERATIONS
aNewATM<--newATM(anId,aQueueManager) =
	PRE 	ATM/=ATMSet &
		aQueueManager: QueueManager &
		anId: ATM_idString
	THEN	ANY 	newATM 
		WHERE 	newATM: ATMSet - ATM
		THEN	ATM:=ATM \/ {newATM} ||
			ATM_queueManager(newATM):= aQueueManager ||
			ATM_id(newATM):=anId ||
			aNewATM:=newATM
		END
	END
;
aNewBankServer<--newBankServer(aQueueManager)  =
	PRE	aQueueManager: QueueManager
	THEN	ANY 	newBankServer
		WHERE	newBankServer: BankServerSet - BankServer
		THEN	BankServer:=BankServer \/ {newBankServer} ||
			BankServer_queueManager(newBankServer):=aQueueManager ||
			aNewBankServer:=newBankServer
		END
	END
;
aNewQueueManager<--newQueueManager =
	PRE	QueueManager/=QueueManagerSet
	THEN	ANY	newQueueManager
		WHERE	newQueueManager: QueueManagerSet - QueueManager
		THEN	QueueManager := QueueManager \/ {newQueueManager} ||
			QueueManager_sendQueueList(newQueueManager):={} ||
			QueueManager_replyQueueList(newQueueManager):={} ||
			QueueManager_sendQueueListSize(newQueueManager):=0 ||
			QueueManager_replyQueueListSize(newQueueManager):=0 ||
			QueueManager_sendQueueHead(newQueueManager):=0 ||
			QueueManager_replyQueueHead(newQueueManager):=0 ||
			QueueManager_sendQueueTail(newQueueManager):=0 ||
			QueueManager_replyQueueTail(newQueueManager):=0 ||
			aNewQueueManager:=newQueueManager
		END
	END
;
aNewQueue<--newQueue =
	PRE	Queue/=QueueSet 
	THEN	ANY	newQueue
		WHERE	newQueue: QueueSet - Queue
		THEN	Queue:=Queue \/ {newQueue} ||
			Queue_queue(newQueue):={} ||
			Queue_queueSize(newQueue):=0 ||
			Queue_queueHead(newQueue):=0 ||
			Queue_queueTail(newQueue):=0 ||
			aNewQueue:=newQueue
		END
	END
;
aNewMessage<--newMessage(aMessageString,aReplyQueue) =
	PRE	Message /= MessageSet &
		aMessageString: Message_messageString &
		aReplyQueue: Queue
	THEN	ANY 	newMessage
		WHERE 	newMessage: MessageSet - Message
		THEN	aNewMessage:= newMessage ||
			Message := Message \/ {newMessage} ||
			Message_message(newMessage):=aMessageString ||
			Message_replyTo(newMessage):=aReplyQueue
		END
	END
;
ATM_setOutQueue(anATM,aQueue) =
	PRE	anATM: ATM &
		aQueue: Queue
	THEN	ATM_outQueue(anATM):=aQueue
	END
;
ATM_setReplyQueue(anATM,aQueue)=
	PRE	anATM: ATM &
		aQueue: Queue
	THEN	ATM_replyQueue(anATM):=aQueue
	END
;
Queue_insert(aQueue,aMessage) =
	PRE 	aQueue: Queue &
		aMessage: Message &
		Queue_queueSize(aQueue)/=Queue_queueCapacity &
		Queue_queueSize(aQueue)+1 : INT &
		(Queue_queueTail(aQueue)+1) mod Queue_queueCapacity : INT 
	THEN	Queue_queue(aQueue)(Queue_queueTail(aQueue)):=aMessage ||
		Queue_queueTail(aQueue):=
				(Queue_queueTail(aQueue)+1) mod Queue_queueCapacity ||
		Queue_queueSize(aQueue):=Queue_queueSize(aQueue)+1 
	END
;
aMessage<--Queue_remove(aQueue) =
	PRE	aQueue: Queue &
		Queue_queueSize(aQueue) /= 0 &
		Queue_queueSize(aQueue)-1 : INT &
		(Queue_queueHead(aQueue)+1) mod Queue_queueCapacity : INT
	THEN	aMessage:=Queue_queue(aQueue)(Queue_queueHead(aQueue)) ||
		Queue_queueHead(aQueue):=
				(Queue_queueHead(aQueue)+1) mod Queue_queueCapacity ||
		Queue_queueSize(aQueue):=Queue_queueSize(aQueue)-1 
	END
;
queue_isEmpty<--Queue_isEmpty(aQueue) =
	PRE 	aQueue: Queue
	THEN 	queue_isEmpty := bool(Queue_queueSize(aQueue)=0)
	END
;
queue_isFull<--Queue_isFull(aQueue) =
	PRE 	aQueue: Queue
	THEN 	queue_isFull:= bool(Queue_queueSize(aQueue)=Queue_queueCapacity)
	END 
;
newSendQueue<--QueueManager_newSendQueue(aQueueManager,aQueue) =
	PRE	aQueue:Queue &
		aQueueManager: QueueManager &
		QueueManager_sendQueueListSize(aQueueManager)/=QueueManager_listCapacity &
		(QueueManager_sendQueueTail(aQueueManager)+1) mod QueueManager_listCapacity: INT &
		QueueManager_sendQueueListSize(aQueueManager)+1: INT
	THEN	
			newSendQueue:=aQueue ||
			QueueManager_sendQueueList(aQueueManager)
				(QueueManager_sendQueueTail(aQueueManager)):=aQueue ||
			QueueManager_sendQueueTail(aQueueManager):=
				(QueueManager_sendQueueTail(aQueueManager)+1) mod 
				QueueManager_listCapacity ||
			QueueManager_sendQueueListSize(aQueueManager):=
				QueueManager_sendQueueListSize(aQueueManager)+1
	END
;
newReplyQueue<--QueueManager_newReplyQueue(aQueueManager,aQueue) =
	PRE	aQueue: Queue &
		aQueueManager: QueueManager &
		QueueManager_replyQueueListSize(aQueueManager)/=QueueManager_listCapacity &
		(QueueManager_replyQueueTail(aQueueManager)+1) mod QueueManager_listCapacity: INT &
		QueueManager_replyQueueListSize(aQueueManager)+1: INT
	THEN
		QueueManager_replyQueueList(aQueueManager)
			(QueueManager_replyQueueTail(aQueueManager)):=aQueue ||
		QueueManager_replyQueueTail(aQueueManager):=
			(QueueManager_replyQueueTail(aQueueManager)+1) mod 
			QueueManager_listCapacity ||
		QueueManager_replyQueueListSize(aQueueManager):=
			QueueManager_replyQueueListSize(aQueueManager)+1 ||
		newReplyQueue:=aQueue
	END
;
queueManager_message<--QueueManager_getSentMessage(aQueueManager) =
	PRE	aQueueManager: QueueManager 
	THEN	ANY 	aQueue, aMessage
		WHERE 	aQueue: ran(QueueManager_sendQueueList(aQueueManager)) &
			aQueue: dom(Queue_queueTail) &
			Queue_queueSize(aQueue)-1: INT &
			(Queue_queueHead(aQueue)+1) mod Queue_queueCapacity: INT &
			aMessage: Message &
			aMessage= Queue_queue(aQueue)(Queue_queueHead(aQueue))
		THEN 	queueManager_message:=aMessage ||
			Queue_queueSize(aQueue):=Queue_queueSize(aQueue) - 1 ||
			Queue_queueHead(aQueue):=(Queue_queueHead(aQueue)+1) mod Queue_queueCapacity 
		END
	END
;
queueManager_isFullSendQueueList<--QueueManager_isFullSendQueueList(aQueueManager) = 
	PRE	aQueueManager: QueueManager
	THEN	/*queueManager_isFullSendQueueList:= 
			bool(QueueManager_sendQueueListSize(aQueueManager)=QueueManager_listCapacity)*/
		IF QueueManager_sendQueueListSize(aQueueManager)=QueueManager_listCapacity
		THEN queueManager_isFullSendQueueList:=myTrue
		ELSE queueManager_isFullSendQueueList:=myFalse
		END
	END
;
queueManager_isFullReplyQueueList<--QueueManager_isFullReplyQueueList(aQueueManager) = 
	PRE	aQueueManager: QueueManager
	THEN	/*queueManager_isFullReplyQueueList:= 
			bool(QueueManager_replyQueueListSize(aQueueManager)=QueueManager_listCapacity)*/
		IF QueueManager_replyQueueListSize(aQueueManager)=QueueManager_listCapacity
		THEN queueManager_isFullReplyQueueList:=myTrue
		ELSE queueManager_isFullReplyQueueList:=myFalse
		END
	END
;
message_replyTo<--Message_getReplyTo(aMessage) =
	PRE 	aMessage: Message
	THEN	message_replyTo := Message_replyTo(aMessage)
	END
END
