MACHINE  AmazonGoal_Machine
INCLUDES AmazonOntology_Machine

PROMOTES 
setHelpType1, setHelpType2, setHelpType3, IncrExpiryYear,
setHelpType1,setHelpType2, setHelpType3, setValidCCValue1, 
setValidCCType2,  setValidCCType3,  setValidValueOfAvailable, 
setValidValueOfAvailable2,  setAudienceRating1,setAudienceRating2,
setAudienceRating3, setAudienceRating4, setAudienceRating5,
setAudienceRating6, setAudienceRating7,  setAudienceRating8, 
setAudienceRating9, setAudienceRating10, setAudienceRating11, setAudienceRating12, 
  
setConditionValue1, setConditionValue2, setConditionValue3, setConditionValue4, 
setConditionValue5, setConditionValue6, setItemIdValue1, setItemIdValue2,  setItemIdValue3, 
setItemIdValue4, setItemIdValue5,  setItemIdValue6, setListType1, setListType2,   
setListType3, setListType4, setListType5, setSimilarityType1, setSimilarityType2, 
setSimilarityType3, setIdTypeSellerListing1, setIdTypeSellerListing2, setIdTypeSellerListing3,
setIdTypeSellerListing4,setIdTypeSellerListingInvalid, IncrExpiryMonth, DecrExpiryMonth,
IncrExpiryYear, DecrExpiryYear


ASSERTIONS

/* Sample trap properties: not (cAge2(customer1)= 12 &  pAmount2(pReq1)=211) */
/* Trap properties calculated from axioms of B specification */ 

/* MCDC based Trap properties calculated from axiom definition of helpType  axiom 
3
*/
not (helpType(help1)="Operation");
not (helpType(help1)="ResponseGroup");
not (helpType(help1)="invalid value");

/*MCDC based Trap properties calculated from axiom definition of Availability axiom */
//2
not (availability_iSrch(iSrchReq1)="Availble");
not (availability_iSrch(iSrchReq1)/="Availble");

/*MCDC based Trap properties calculated from the 12 atomic clauses */
//18
not (audienceRating_isrch(iSrchReq1)="G");
not (audienceRating_isrch(iSrchReq1)="PG");
not (audienceRating_isrch(iSrchReq1)="PG-13");
not (audienceRating_isrch(iSrchReq1)="R");
not (audienceRating_isrch(iSrchReq1)="NC-17");
not (audienceRating_isrch(iSrchReq1)="NR");
not (audienceRating_isrch(iSrchReq1)="Unrated");
not (audienceRating_isrch(iSrchReq1)="6");
not (audienceRating_isrch(iSrchReq1)="12");
not (audienceRating_isrch(iSrchReq1)="16");
not (audienceRating_isrch(iSrchReq1)="18");
not (audienceRating_isrch(iSrchReq1)="FamilyViewing");
not (audienceRating_isrch(iSrchReq1)="Invalid rating");


/*MCDC based Trap properties derived from the axiom of the Condition values */
//24
not(condition_isrch(isearch1)="All");
not(condition_isrch(isearch1)="New");
not(condition_isrch(isearch1)="Used");
not(condition_isrch(isearch1)="Collectable");
not(condition_isrch(isearch1)="Refurbished");
not(condition_isrch(isearch1)="Invalid condition");


/*MCDC based Trap properties derived from the axiom of the Delivery Method values */
//25
not(deliveryMethod_isrch(isearch1)="Ship");
not(deliveryMethod_isrch(isearch1)="ISPU");
not(deliveryMethod_isrch(isearch1)="Invalid Value");


/* concept ItemLookupRequest */  
/* condition_ilookup, deliveryMethod_ilookup, idType_ilookup, itemId_ilookup, */

/*MCDC based Trap properties derived from the axiom of the Condition values */
//33
not(condition_ilookup(isearch1)="All");
not(condition_ilookup(isearch1)="New");
not(condition_ilookup(isearch1)="Used");
not(condition_ilookup(isearch1)="Refurbished");
not(condition_ilookup(isearch1)="Collectable");
not(condition_ilookup(isearch1)="Invalid condition");

/*MCDC based Trap properties derived from the axiom of the Delivery Method values */
//36
not(deliveryMethod_ilookup(isearch1)="Ship");
not(deliveryMethod_ilookup(isearch1)="ISPU");
not(deliveryMethod_ilookup(isearch1)="Invalid Value");


/* Trap properties derived from axiom definition of Id type */
//42
not(idType_ilookup(iLookup1)="ASIN");
not(idType_ilookup(iLookup1)="UPC");
not(idType_ilookup(iLookup1)="SKU");
not(idType_ilookup(iLookup1)="EAN");
not(idType_ilookup(iLookup1)="ISBN");
not(idType_ilookup(iLookup1)="Invalid Id Type");


/*MCDC Trap properties derived from axiom definition of ListType */
//47
not (listType_lstSrch(lSearch1)="WishList");
not (listType_lstSrch(lSearch1)="ListMania");
not (listType_lstSrch(lSearch1)="WeddingRegistry");
not (listType_lstSrch(lSearch1)="BabyRegistry");
not (listType_lstSrch(lSearch1)="Invlaid List type");


/*For LISTLOOKUP: MCDC Trap properties derived from axiom definition of ListType */
//52
not (listType_lstLookup(lSearch1)="WishList");
not (listType_lstLookup(lSearch1)="ListMania");
not (listType_lstLookup(lSearch1)="WeddingRegistry");
not (listType_lstLookup(lSearch1)="BabyRegistry");
not (listType_lstLookup(lSearch1)="Invlaid List type");


/*MCDC Trap properties derived from axiom definition of SimilarityTypeDefintion */
//55
not(similarityType(simLookup1)="Intersection");
not(similarityType(simLookup1)="Random");
not(similarityType(simLookup1)="Invalid similarity");

/*MCDC Trap properties derived from axiom definition of action Type definition */
//58
not (action_cartGet(cartModifyReq)="MoveToCart");
not (action_cartGet(cartModifyReq)="SaveForLater");
not (action_cartGet(cartModifyReq)="Invalid Action");

/*MCDC Trap properties derived from axiom definition of idType for SellerListingLookup */
//63
not(idType_selLstngLkup(sellerListingLookup="Exchange"));
not(idType_selLstngLkup(sellerListingLookup="Listing"));
not(idType_selLstngLkup(sellerListingLookup="ASIN"));
not(idType_selLstngLkup(sellerListingLookup="SKU"));
not(idType_selLstngLkup(sellerListingLookup="Invalid seller Id"));


/* MCDC Trap property regarding the Payment method: */ 
//65
not(cardType(cc1)="CreditCard");
not(cardType(cc1)="Invalid payment type");


/* MCDC Trap properties derived from Credit Card axiom definition */ 
//68
not(cardType(cc1)="Master");
not(cardType(cc1)="Visa");
not(cardType(cc1)="Invalid CC type");

/* Boundary condition based trap properties from "expiryMonth" axiom definition of credit Card expiry date */
//75
not (expiryMonth(expDate1)=1);
not (expiryMonth(expDate1)=0);
not (expiryMonth(expDate1)=2);
not (expiryMonth(expDate1)=5);
not (expiryMonth(expDate1)=11);
not (expiryMonth(expDate1)=12);
not (expiryMonth(expDate1)=13);

/*  Boundary condition based trap properties from the expiry Year of the Credit Card Expiry Date: */
//79
not (expiryYear(expDate1)=2013);
not (expiryYear(expDate1)=2012);
not (expiryYear(expDate1)=2011); /* invalid value near boundary */
not (expiryYear(expDate1)=2015); /* normal boundary value */ 





VARIABLES 
/*Input type of variables */
Help, ItemSearch, ItemLookup, BrowseNodeLookup, ListSearch, ListLookup, CustomerContentSearch, CustomerContentLookup, SimilarityLookup,
SellerLookup, CartGet,CartAdd, CartCreate, CartModify, CartClear, TransactionLookup, SellerListingSearch, SellerListingLookup, PurchaseByCreditCard,

/*Output type of variables */
HelpResponse, ItemContainer, ListContainer,  CustomerContainer, SellerContainer, Cart, TransactionContainer, SellerListingContainer, PurchaseByCreditCardResponse 





INVARIANT

/* Types of input variables */
Help <: HELP & ItemSearch<: ITEMSEARCH & ItemLookup <: ITEMLOOKUP & BrowseNodeLookup <: BROWSENODELOOKUP & 
ListSearch <: LISTSEARCH & ListLookup <: LISTLOOKUP & CustomerContentSearch <: CUSTOMERCONTENTSEARCH  & 
CustomerContentLookup <: CUSTOMERCONTENLOOKUP & SimilarityLookup <: SIMILARITYLOOKUP & 
SellerLookup <:SELLERLOOKUP & CartGet <: CARTGET & CartAdd <:CARTADD & 
CartCreate <:CARTCREATE & CartModify <:CARTMODIFY & CartClear <:CARTCLEAR &
TransactionLookup <:TRANSACTIONLOOKUP & SellerListingSearch <: SELLERLISTINGSEARCH & 
SellerListingLookup <:SELLERLISTINGLOOKUP & PurchaseByCreditCard <:PURCHASEBYCREDITCARD &

/* Types of output variables */ 
HelpResponse <:HELPRESPONSE & ItemContainer<:ITEMCONTAINER & 
ListContainer <: LISTCONTAINER &  CustomerContainer <: CUSTOMERCONTAINER & 
SellerContainer <: SELLERCONTAINER & Cart <: CART & TransactionContainer & TRANSACTIONCONTAINER & 
SellerListingContainer<: SELLERLISTINGCONTAINER & PurchaseByCreditCardResponse <: PURCHASEBYCREDITCARDRESPONSE 






INITIALISATION  

/*Input type of variables */
Help:= {} || ItemSearch  := {} ||  ItemLookup:= {} ||  BrowseNodeLookup  := {} || 
ListSearch  := {} || ListLookup  := {} || CustomerContentSearch  := {} || 
CustomerContentLookup  := {} || SimilarityLookup  := {} || SellerLookup  := {} ||  
CartGet  := {} || CartAdd  := {} || CartCreate  := {} ||  CartModify  := {} || 
CartClear  := {} ||  TransactionLookup  := {} ||  SellerListingSearch  := {} ||  
SellerListingLookup  := {} ||  PurchaseByCreditCard  := {} || 

/*Output type of variables */
HelpResponse  := {hResp1} ||  ItemContainer  := {iContainer1} ||  ListContainer  := {} || 
CustomerContainer  := {} ||  SellerContainer  := {} ||  Cart  := {} || 
TransactionContainer  := {} ||  SellerListingContainer  := {} ||  
PurchaseByCreditCardResponse:={}


OPERATIONS
/* Mapped from the TR#1 */
resp <-- getHelpResponse(hReq)=
PRE hReq: HELPREQUEST THEN
  HelpResponse:=HelpResponse \/ {hResp1}
    || resp:= HelpResponse 
END;

/* Mapped from TR2 */
resp <-- getItemSearchResponse (req) =
PRE req:ITEMSEARCHREQUEST THEN
	ItemContainer:=ItemContainer \/ {iContainer1} 
 	|| resp:=ItemContainer
 END;
 
/* Mapped from TR3 */ 
resp <-- getItemLookupResponse(req)=
PRE req:ITEMLOOKUP THEN
	ItemContainer:=ItemContainer \/{iContainer2}
	|| resp:=ItemContainer
END;

/* Mapped from TR4 */
resp <-- getSimilarityResponse (req) = 
 PRE req:SIMILARITYLOOKUP THEN
	ItemContainer:=ItemContainer\/{iContainer3} 
	|| resp:=ItemContainer
END;

/* Mapped from TR5 */

resp<-- getListSearchResponse(req)=
 PRE req:LISTSEARCH THEN
 	ListContainer:=ListContainer\/{lContainer1}
 	|| resp:=ItemContainer
 END;
  
/* Mapped from TR6 */
resp<-- getListLookupResponse (req)=
 PRE req:LISTLOOKUP THEN
   ListContainer:= ListContainer\/{lContainer2}
   || resp:=ListContainer
  END;
  
/* Mapped from TR7 */ 
resp <-- getCustomerContentSearchResponse (req) =
 PRE req: CUSTOMERCONTENTSEARCH THEN
  CustomerContainer:=CustomerContainer\/{cContainer1}
  || resp:=CustomerContainer
 END;

/* Mapped from TR8 */ 
resp <--getCustomerContentLookupResponse(req)=
 PRE req:CUSTOMERCONTENTLOOKUP THEN
  CustomerContainer:=CustomerContainer\/{cContainer2}
  || resp:=CustomerContainer
 END;
 
/* Mapped from TR9 */
resp<--getSellerLookupResponse(req)=
 PRE req:SELLERLOOKUP THEN  	
  SellerContainer:=SellerContainer\/{sellerContainer}
  || SellerContainer
 END;
 
/* Mapped from TR10 */ 
resp <-- getCartGetResponse(req)=
 PRE req:CARTGET THEN
 	Cart:=Cart\/{cart1} || resp:=Cart  	
 END;
 
/* Mapped from TR11 */ 
 resp <-- getCartGetResponse(req)=
  PRE req:CARTGET THEN
  	Cart:=Cart\/{cart2} || resp:=Cart  	
  END;
/* Mapped from TR12 */ 
 resp <-- getCartAddResponse(req)=
  PRE req:CARTGET THEN
  	Cart:=Cart\/{cart3} || resp:=Cart  	
  END;
/* Mapped from TR13 */ 
 resp <-- getCartCreateResponse(req)=
  PRE req:CARTGET THEN
  	Cart:=Cart\/{cart4} || resp:=Cart  	
  END;
/* Mapped from TR14 */ 
 resp <-- getCartModifyResponse(req)=
  PRE req:CARTGET THEN
  	Cart:=Cart\/{cart5} || resp:=Cart  	
  END;
/* Mapped from TR15 */ 
 resp <-- getCartClearResponse(req)=
  PRE req:CARTGET THEN
  	Cart:=Cart\/{cart6} || resp:=Cart
  END;
/* Mapped from TR16 */ 
 resp<--getTransactionLookupResponse (req) =
  PRE req:TRANSACTIONLOOKUP THEN
  	TransactionContainer:=TransactionContainer\/{tContainer}
  	|| resp:=TransactionContainer
  END;
/* Mapped from TR17 */ 
 resp<--getSellerListingSearchResponse(req)=
  PRE req:SELLERLISTINGSEARCH THEN
    SellerContainer:= SellerContainer\/ {sContainer}
      ||resp:=SellerContainer
  END;
/* Mapped from TR18 */  
  resp<-- getSellerListingLookupResponse(req)=
  PRE req: SELLERLISTINGLOOKUP THEN
    SellerContainer:= SellerContainer\/ {sContainer}
	||resp:=SellerContainer
    END;
/* Mapped from TR19 */
resp <-- getPurchaseByCreditCard(req)=
 PRE req:PURCHASEBYCREDITCARD THEN
 	PurchaseByCreditCardResponse:=PurchaseByCreditCardResponse\/{purchaseByCC1}
 	|| resp:= PurchaseByCreditCardResponse
 END;  	 

 
/* **** Auxillary operations: Those that are promoted: To help model checker find a voilation state **** /
/* 52 operations to set the values for the atomic clauses according to the MCDC values */

/* Operation to set valid value of the credit card */
 op_setValidCCValue1(cc) =
 PRE cc:CREDITCARD THEN
 	setValidCCValue1(cc)
 END;
 
 op_setValidCCType2(cc) =
 PRE cc:CREDITCARD THEN
  setValidCCType2(cc)
 END;
 
 op_setValidCCType3(cc) =
  PRE cc:CREDITCARD THEN
   setValidCCType3(cc)
 END;
 
 op_setHelpType1(hReq) =
 PRE hReq:HELPREQUEST THEN
    setHelpType1(hReq) 
 END; 
 
 op_setHelpType2(hReq)=
  PRE hReq:HELPREQUEST THEN
   setHelpType2(hReq)
  END;
  
  op_setHelpType3(hReq)=
    PRE hReq:HELPREQUEST THEN
    	setHelpType2(hReq)
  END;
  
  
 op_setValidValueOfAvailable(req) = 
  PRE req:ITEMSEARCHREQUEST THEN
    setValidValueOfAvailable(req)
 END; 
 
 op_setValidValueOfAvailable2(req) =
   PRE req:ITEMSEARCHREQUEST THEN
     setValidValueOfAvailable2(req)
 END; 
 
 op_setAudienceRating1(req)=
 PRE ree:ITEMSEARCHREQUEST THEN 	
    setAudienceRating1(req)
 END; 
 
 op_setAudienceRating2(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	setAudienceRating2(req)
 END; 
 op_setAudienceRating3(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	setAudienceRating3(req)
 END;
 
 op_setAudienceRating4(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	setAudienceRating4(req)
 END;
 
 op_setAudienceRating5(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
    setAudienceRating5(req)
 END;
 
 op_setAudienceRating6(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
    setAudienceRating6(req)
 END;
 
 op_setAudienceRating7(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
    setAudienceRating7(req)
 END;
 
 op_setAudienceRating8(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
    setAudienceRating8(req)
 END;
 
 op_setAudienceRating9(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
     setAudienceRating9(req)
 END;
 
 op_setAudienceRating10(req)=
   PRE ree:ITEMSEARCHREQUEST THEN 	
   	setAudienceRating10(req)
 END;
 
 op_setAudienceRating11(req)=
   PRE ree:ITEMSEARCHREQUEST THEN 	
   	setAudienceRating11(req)
 END;
 
op_setAudienceRating12(req)=
   PRE ree:ITEMSEARCHREQUEST THEN 	
   	setAudienceRating12(req)
 END;
 
 op_setConditionValue1(req)=
 PRE req: ITEMSEARCHREQUEST THEN 
  	setConditionValue1(req)
 END;
  
 op_setConditionValue2(req)=
 PRE req: ITEMSEARCHREQUEST THEN 
  	setConditionValue2(req)
 END;
 
 op_setConditionValue3(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
   	setConditionValue3(req)
  END;
 
 op_setConditionValue4(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
   	setConditionValue4(req)
  END;
 
 op_setConditionValue5(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
   	setConditionValue5(req)
  END;
 
 op_setConditionValue6(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
    	setConditionValue6(req)
  END;   
  
 op_setItemIdValue1(req)=
  PRE req:ITEMLOOKUPREQUEST THEN
  	setItemIdValue1(req)
  END;
 
 op_setItemIdValue2(req)=
   PRE req:ITEMLOOKUPREQUEST THEN
   	setItemIdValue2(req)
  END;
  
  op_setItemIdValue3(req)=
    PRE req:ITEMLOOKUPREQUEST THEN
    	setItemIdValue3(req)
  END;
  
 op_setItemIdValue4(req)=
  PRE req:ITEMLOOKUPREQUEST THEN
  	setItemIdValue4(req)
  END;
 
 op_setItemIdValue5(req)=
   PRE req:ITEMLOOKUPREQUEST THEN
   	setItemIdValue5(req)
 END;
 
 op_setItemIdValue6(req)=
    PRE req:ITEMLOOKUPREQUEST THEN
    	setItemIdValue6(req)
 END;  
 
 op_setListType1(req) =
 PRE req: LISTSEARCHREQUEST THEN
 	setListType1(req)
 END;
 
op_setListType2(req) =
  PRE req: LISTSEARCHREQUEST THEN
     setListType2(req) 
END;
 
op_setListType3(req) =
  PRE req: LISTSEARCHREQUEST THEN
     setListType3(req) 
END;
 
op_setListType4(req) =
  PRE req: LISTSEARCHREQUEST THEN
     setListType4(req) 
END;
 
op_setListType5(req)=
   PRE req: LISTSEARCHREQUEST THEN
   	setListType5(req)
END;
 
op_setSimilarityType1(req)=
 PRE req: SIMILARITYLOOKUPREQUEST THEN
   setSimilarityType1(req)
END;
 
op_setSimilarityType2(req)= 
 PRE req: SIMILARITYLOOKUPREQUEST THEN
   setSimilarityType2(req)
END;
 
op_setSimilarityType3(req) = 
  PRE req:SIMILARITYLOOKUPREQUEST THEN
    setSimilarityType3(req) 
END;

op_setIdTypeSellerListing1(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  setIdTypeSellerListing1(req)
END;

op_setIdTypeSellerListing2(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  setIdTypeSellerListing2(req)
END;

op_setIdTypeSellerListing3(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  setIdTypeSellerListing3(req)
END;

op_setIdTypeSellerListing4(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  setIdTypeSellerListing4(req)
END;
op_setIdTypeSellerListingInvalid(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  setIdTypeSellerListingInvalid(req)
END;

op_setCreditCardType1(req)=
PRE req: CREDITCARD THEN
 setCreditCardType1(req)
END;

op_setCreditCardType2(req)=
PRE req: CREDITCARD THEN
 setCreditCardType2(req)
END;

op_setCreditCardType3(req)=
PRE req: CREDITCARD THEN
 setCreditCardType3(req)
END;

op_IncrExpiryMonth(req)=
PRE req:EXPIRYDATE THEN
 IncrExpiryMonth(req)
END;

op_DecrExpiryMonth(req)=
PRE req:EXPIRYDATE THEN
 DecrExpiryMonth(req)
END;

op_IncrExpiryYear(req)=
PRE req:EXPIRYDATE THEN
 IncrExpiryYear(req)
END;

op_DecrExpiryYear(req)=
PRE req:EXPIRYDATE THEN
 DecrExpiryYear(req)
END
END