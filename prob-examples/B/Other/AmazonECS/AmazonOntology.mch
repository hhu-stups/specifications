MACHINE AmazonOntology_Machine

SETS
/* defining set definitions: */
HELP={help1}; HELPREQUEST; 
ITEMSEARCH={isearch1};  ITEMSEARCHREQUEST={iSrchReq1}; 
ITEMLOOKUP={itemLookup1}; ITEMLOOKUPREQUEST; 
LISTSEARCH={lSearch1}; LISTSEARCHREQUEST;
LISTLOOKUP={listLookup};LISTLOOKUPREQUEST;
CUSTOMERCONTENTSEARCH={cContentSearch}; 
CUSTOMERCONTENTSEARCHREQUEST; 
CUSTOMERCONTENTLOOKUP={cContentLookup};
CUSTOMERCONTENTLOOKUPREQUEST; SIMILARITYLOOKUP={simLookup1}; 
SIMILARITYLOOKUPREQUEST ;SELLERLOOKUP={sellerLookup1}; 
SELLERLOOKUPREQUEST;CARTGET={cartGet1};CARTGETREQUEST;
CARTADD={cartAdd1};CARTADDREQUEST; CARTITEM={cartItemReq};CARTCREATE={cartCreateReq}; 
CARTCREATEREQUEST; CARTMODIFY={cartModifyReq}; CARTMODIFYITEM; CARTCLEAR={cclearReq}; CARTCLEARREQUEST; 
TRANSACTIONLOOKUP={transLookupReq}; TRANSACTIONLOOKUPREQUEST;
SELLERLISTINGSEARCH={selListingSearchReq}; SELLERLISTINGSEARCHREQUEST; 
SELLERLISTINGLOOKUP={sellerListingLookup}; SELLERLISTINGLOOKUPREQUEST; 
BROWSENODELOOKUP={bnlookupReq}; BROWSENODELOOKUPREQUEST;


HELPRESPONSE={hResp1}; INFORMATION; OPERATIONINFORMATION; RESPONSEGROUPINFORMATION;

ITEMCONTAINER={iContainer1, iContainer2, iContainer3}; ITEMS; ITEM;
CUSTOMERCONTAINER={cContainer1, cContainer2}; CUSTOMERS; CUSTOMER; 
SELLERCONTAINER={sellerContainer}; SELLERS; SELLER; 
CART={cart1, cart2, cart3, cart4, cart5, cart6}; 
TRANSACTIONCONTAINER={tContainer}; TRANSACTIONS; TRANSACTION; 
SELLERLISTINGCONTAINER={sContainer}; SELLERLISTINGS ; SELLERLISTING;  
LISTCONTAINER={lContainer1. lContainer2};
LISTS; LIST; LISTITEM; SEARCHRESULTMAP; SEARCHINDEX; 
RELATEDITEMS; RELATEDITEM; BROWSENODELOOKUPRESPONSE={bnLookupRes}; BROWSENODE;
CARTITEMS;
CARTITEM; TOTAL; 
TRANSACTIONITEMS; TRANSACTIONITEM; 
SELLERLISTING; PRICE;
ITEMATTRIBUTES;

PURCHASEBYCREDITCARD; 
CREDITCARD={cc1, cc2}; EXPIRYDATE={expDate1}; 
PURCHASEBYCREDITCARDRESPONSE={purchaseByCC1}; 
PURCHASERECEIPT


VARIABLES
/* Because the B specification does not support same attribute name withing more than one data type,  */
/* so we give the different name to each repeating attribute, e.g., AWSAccessKeyId_help for AWSAccessKeyId in Help data type and so on... *
/* concept Help */ 
AWSAccessKeyId_help, helpRequest,

/* concept HelpRequest */
about, helpType, responseGroup_help,

/* concept ItemSearch */
AWSAccessKeyId_iSearch, itemSearchRequest,

/* concept itemSearchRequest */
availability_iSrch, audienceRating_isrch, author_isrch, brand_isrch, condition_isrch, deliveryMethod_isrch, keywords_isrch, manufacturer_isrch,
maximumPrice_irsch ,minimumPrice_isrch, publisher_isrch, searchIndex_isrch, title_isrch , releaseDate_isrch,

/* concept ItemLookup */
AWSAccessKeyId_iLookup, itemLookupRequest, 

/* concept ItemLookupRequest */ 
condition_ilookup, deliveryMethod_ilookup, idType_ilookup, itemId_ilookup, 

/* concept ListSearch */
AWSAccessKeyId_lstSrch, listSearchRequest, 

/* concept ListSearchRequest */
email_lstSrch, firstName_lstSrch, lastName_lstSrch, listType_lstSrch, name_lstSrch, 

/* concept ListLookup */
AWSAccessKeyId_lstLookup, listLookupRequest, 	

/* concept ListLookupRequest */
condition_lstLookup,  deliveryMethod_lstLookup, listId_lstLookup, listType_lstLookup, 

/* concept CustomerContentSearch */ 
AWSAccessKeyId_custCntSrch, customerContentSearchRequest,

/* concept CustomerContentSearchRequest */ 
customerPage_custContSrch, email_custContSrch, name_custContSrch, 

/* concept CustomerContentLookup */
 AWSAccessKeyId_custCntLookup, customerContentLookupRequest,		

/* concept CustomerContentLookupRequest */
customerId_custCntLookup, reviewPage_custCntLookup,	

/* concept SimilarityLookup */
AWSAccessKeyId_simLookup, similarityLookupRequest,	

/* concept  SimilarityLookupRequest */
condition_simLookup, deliveryMethod_simLookup, itemId_simLookup, similarityType,		

/* concept SellerLookup */
AWSAccessKeyId_sellerLookup, sellerLookupRequest,

/* concept SellerLookupRequest */
sellerId__sellerLookup, feedbackPage__sellerLookup,

/* concept CartGet */	
AWSAccessKeyId_cartGet,	cartGetRequest,

/* concept CartGetRequest */
cartId_cartGet , HMAC_cartGet, responseGroup_cartGet,	

/* concept CartAdd */
AWSAccessKeyId_cartAdd,cartAddRequest,	

/* concept CartAddRequest */
cartId_cartAdd, items_cartGet,

/* concept CartItem */
ASIN_cartItem, offerListingId_cartItem, quantity_cartItem,		

/* concept CartCreate */
AWSAccessKeyId_cartCreat, cartCreateRequest, 	

/* concept CartCreateRequest */
cartId_cartCreat, items_cartCreat,	

/* concept CartModify */
AWSAccessKeyId_cartModify, cartModifyRequest,

/* concept CartModifyRequest */ 
cartId_cartModify, cartModifyItems_cartGet,

/* concept CartModifyItem */ 
action_cartGet, cartItemId_cartGet,  quantity_cartGet,	

/* concept CartClear */ 
AWSAccessKeyId_cartclear, cartClearRequest,

/* concept CartClearRequest */
cartId_cartclear, HMAC_cartclear, responseGroup_cartclear,		

/* concept TransactionLookup */
AWSAccessKeyId_transLookup, transactionLookupRequest,
				
/* concept TransactionLookupRequest */
responseGroup_transLookup, transactionId_transLookup,  
			
/* concept SellerListingSearch */ 
AWSAccessKeyId_selLstng, sellerListingSearchRequest,
		
/* concept SellerListingSearchRequest */
keywords_selLstngSrch, offerStatus_selLstngSrch, sellerId_selLstngSrch, title_selLstngSrch, 
		
/* concept SellerListingLookup */ 
AWSAccessKeyId_selLstngSrch, sellerListingLookupRequest,
		
/* concept SellerListingLookupRequest */ 
 id_selLstngLkup, sellerId_selLstngLkup, idType_selLstngLkup, responseGroup_selLstngLkup,
	
	
/* concept BrowseNodeLookup */
AWSAccessKeyId_bnLkup, browseNodeLookupRequest,
		
/* concept BrowseNodeLookupRequest */
browseNodeId_bnLkup, responseGroup_bnLkup,

/* concept HelpResponse */
information_hResp,
		
/* concept Information */
operationInfo,	responseGroupInfo,
	
/* concept OperationInformation */
name_opInfo, description_opInfo, requiredParameters_opInfo,
			
/* concept ResponseGroupInformation */
name_rgInfo, creationDate_rgInfo, validOperations_opInfo,
			
/* concept ItemContainer */
items_itmcont,
	
/* concept Items */
totalResults_itms, totalPage_itms, searchResultsMaps_itms, item_itms,
	
/* concept Item */
ASIN_item, parentASIN_item, itemAttributes_item, relatedItems_item, browseNodes_item,

		 
/* concept CustomerContainer */
  customers_cContainer,
		
/* concept Customers */
totalResults_customers, totalPage_customers, customer_customers,
		
/* concept Customer */
customerId_customer, nickname_customer, birthday_customer, wishListId_customer,
	
/* concept SellerContainer */ 
sellers_selCont, 
	
/* concept Sellers */
totalPages_sellers, totalResults_sellers, seller_sellers,
	
/* concept Seller */
sellerId_seller, sellerName_seller,  
	
/* concept Cart */
cartId_cart, HMAC_cart, URLEncodedHMAC_cart, purchaseURL_cart, 
mobileCartURL_cart, subTotal_cart,
	
/* concept TransactionContainer */
transactions_tContainer,
		
/* concept Transactions	 */
totalResults_trans, totalPages_trans, transaction_trans, 
	
/* concept Transaction */
transactionId_tran, sellerId_tran, transactionDate_tran, totals_tran,
			
/* concept SellerListingContainer */ 
sellerListings_selLstingContainer,
	
/* concept SellerListings */
totalPages_selListings, totalResults_selListings, sellerListing_selListings,
		
/* concept SellerListing */
listingId_selListing, ASIN_selListing, willShipExpedited_selListing, willShipInternational_selListing,
title_selListing, price_selListing, startDate_selListing, endDate_selListing,
			
				
/* concept ListContainer */ 
lists_lContainer,
	
/* concept Lists */
totalPages_lists, totalResults_lists , list_lists,
		
/* concept List */
listId_list, listURL_list, listName_list, listType_list,
totalItems_list, dateCreated_list, customerName_list, listItem_list,
		 	
/* concept ListItem */
listItemId_lstItem, dateAdded_lstItem, quantityDesired_lstItem, quantityRequired_lstItem,item_lstItem,
		
/* concept SearchResultMap */
searchIndex_srchMap,
	
/* concept SearchIndex */
indexName_srchIndx, results_srchIndx, pages_srchIndx, relevanceRank_srchIndx, ASIN_srchIndx,
	
/* concept RelatedItems */ 
relationship_rItems, relationshipType_rItems,	relatedItemCount_rItems, relatedItem_rItems, 
	
/* concept RelatedItem */
item_rItem,

/* concept BrowseNodeLookupResponse */ 
 nodes_bnResp,
		
/* concept BrowseNode */
browseNodeId_bn, name_bn, isCategoryRoot_bn,	
	

/* concept CartItems */ 
subTotal_cItems, cartItem_cItems,
	
/* concept CartItem */ 
cartItemId_cItem, ASIN_cItem, quantity_cItem, title_cItem, price_cItem, itemTotal_cItem,		
Total_cItem, total_cItem, subtotal_cItem, tax_cItem, shippingCharge_cItem, promotion_cItem,
		
/* concept TransactionItems */ 
transactionItem_tItems,
		
/* concept TransactionItem */
transactionItemId_tItem, quantity_tItem, unitPrice_tItem, 
totalPrice_tItem, ASIN_tItem, title_tItem,	
		

	
	
/* concept Price */ 
amount_price,	currencyCode_price, formattedPrice_price, 		
		
/* concept ItemAttributes */
title_iAttrib, description_iAttrib, actor_iAttrib,
Artist_iAttrib, author_iAttrib, brand_iAttrib, manufacturer_iAttrib,
publisher_iAttrib, color_iAttrib, ISBN_iAttrib, label_iAttrib, model_iAttrib,


		
/* concept PurchaseByCreditCard */
transactionId_purchaseByCC, purchaseAmount_purchaseByCC, paymentMethod_purchaseByCC,
purchaseDate_purchaseByCC, creditCard_purchaseByCC,
	
/* concept CreditCard */ 
cardHolderName, cardNumber,
expiryDate,cardType, cardBalance,
 			

/* concept ExpiryDate */
expiryMonth, expiryYear,
	
/* concept  PurchaseByCreditCardResponse */ 
purchaseReceipt_purchaseByCCRes, transactionId_purchaseByCCRes, purchaseAmount_purchaseByCCRes, cardNumber_purchaseByCCRes, purchaseDate_purchaseByCCRes,

/* concept PurchaserReceipt */
 transactionId_purchReceipt, purchaseAmount_purchReceipt, purchaseDate_purchReceipt
 
   
INVARIANT 
 /* concept Help */ 
AWSAccessKeyId_help:HELP<->STRING & 
helpRequest:HELP<->HELPREQUEST &
 
 /* concept HelpRequest */
about:HELPREQUEST<->STRING & 
helpType:HELPREQUEST<->STRING & 
responseGroup_help:HELPREQUEST<->STRING & 


 /* concept ItemSearch */
AWSAccessKeyId_iSearch:ITEMSEARCH<->STRING & 
ItemSearchRequest:ITEMSEARCH<->ITEMSEARCHREQUEST &

 /* concept itemSearchRequest */
availability_iSrch:ITEMSEARCHREQUEST<->STRING & 
audienceRating_isrch: ITEMSEARCHREQUEST<->STRING & 
author_isrch:ITEMSEARCH <-> STRING & 
brand_isrch:ITEMSEARCHREQUEST <->STRING & 
condition_isrch: ITEMSEARCHREQUEST <-> STRING &   /* <--- error corrected by leuschel */
deliveryMethod_isrch: ITEMSEARCHREQUEST <-> STRING  & 
keywords_isrch: ITEMSEARCHREQUEST <-> STRING & 
manufacturer_isrch:ITEMSEARCHREQUEST <-> STRING &
maximumPrice_irsch:ITEMSEARCHREQUEST <-> INT  & 
minimumPrice_isrch:ITEMSEARCHREQUEST <-> INT &   /* <--- error corrected by leuschel */
publisher_isrch:ITEMSEARCHREQUEST <-> STRING &
searchIndex_isrch:ITEMSEARCHREQUEST <-> STRING & 
title_isrch:ITEMSEARCHREQUEST <-> STRING & 
releaseDate_isrch:ITEMSEARCHREQUEST <-> STRING &
 
 /* concept ItemLookup */
AWSAccessKeyId_iLookup:ITEMLOOKUP <-> STRING & 
itemLookupRequest: ITEMLOOKUP <->ITEMLOOKUPREQUEST &
 
 /* concept ItemLookupRequest */ 
condition_ilookup:ITEMLOOKUPREQUEST <-> STRING & 
deliveryMethod_ilookup:ITEMLOOKUPREQUEST <-> STRING & 
idType_ilookup: ITEMLOOKUPREQUEST <-> STRING & 
itemId_ilookup:ITEMLOOKUPREQUEST <-> String & 
 
 /* concept ListSearch */
AWSAccessKeyId_lstSrch:LISTSEARCH <-> STRING & 
listSearchRequest : LISTSEARCH <-> LISTSEARCHREQUEST & 
 
 /* concept ListSearchRequest */
email_lstSrch:LISTSEARCHREQUEST <-> STRING  & 
firstName_lstSrch:LISTSEARCHREQUEST <-> STRING & 
lastName_lstSrch :LISTSEARCHREQUEST <-> STRING & 
listType_lstSrch:LISTSEARCHREQUEST <-> STRING & 
name_lstSrch:LISTSEARCHREQUEST <-> STRING & 
 
 /* concept ListLookup */
AWSAccessKeyId_lstLookup: LISTLOOKUP <-> STRING & 
listLookupRequest: LISTLOOKUP <-> LISTLOOKUPREQUEST & 	
 
 /* concept ListLookupRequest */
condition_lstLookup: LISTLOOKUPREQUEST <-> STRING  & 
deliveryMethod_lstLookup:LISTLOOKUPREQUEST <-> STRING  &
listId_lstLookup:LISTLOOKUPREQUEST <-> STRING  & 
listType_lstLookup:LISTLOOKUPREQUEST <-> STRING  & 

 /* concept CustomerContentSearch */ 
AWSAccessKeyId_custCntSrch: CUSTOMERCONTENTSEARCH <-> STRING & 
customerContentSearchRequest: CUSTOMERCONTENTSEARCH <-> CUSTOMERCONTENTSEARCHREQUEST &
 
 /* concept CustomerContentSearchRequest */ 
customerPage_custContSrch:CUSTOMERCONTENTSEARCHREQUEST <-> STRING &
email_custContSrch:CUSTOMERCONTENTSEARCHREQUEST <-> STRING & 
name_custContSrch :CUSTOMERCONTENTSEARCHREQUEST <-> STRING & 
 
 /* concept CustomerContentLookup */
AWSAccessKeyId_custCntLookup: CUSTOMERCONTENTLOOKUP <-> STRING & 
customerContentLookupRequest: CUSTOMERCONTENTLOOKUP <-> CUSTOMERCONTENTLOOKUPREQUEST &
 
 /* concept CustomerContentLookupRequest */
 customerId_custCntLookup: CUSTOMERCONTENTLOOKUPREQUEST<-> STRING & 
 reviewPage_custCntLookup: CUSTOMERCONTENTLOOKUPREQUEST<-> INT &	
 
 /* concept SimilarityLookup */
 AWSAccessKeyId_simLookup: SIMILARITYLOOKUP <->STRING & 
 similarityLookupRequest: SIMILARITYLOOKUP <->SIMILARITYLOOKUPREQUEST &	
 
 /* concept  SimilarityLookupRequest */
 condition_simLookup: SIMILARITYLOOKUPREQUEST<-> STRING &  
 deliveryMethod_simLookup: SIMILARITYLOOKUPREQUEST <-> STRING &  
 itemId_simLookup: SIMILARITYLOOKUPREQUEST <-> STRING & 
 similarityType: SIMILARITYLOOKUPREQUEST <-> STRING &
 
 /* concept SellerLookup */
 AWSAccessKeyId_sellerLookup:SELLERLOOKUP <-> STRING &
 sellerLookupRequest: SELLERLOOKUP <-> SELLERLOOKUPREQUEST &
 
 /* concept SellerLookupRequest */
 sellerId__sellerLookup:SELLERLOOKUPREQUEST <-> STRING &
 feedbackPage__sellerLookup:SELLERLOOKUPREQUEST <-> INT &
 
 /* concept CartGet */	
 AWSAccessKeyId_cartGet:CARTGET <-> STRING & 
 cartGetRequest: CARTGET <-> CARTGETREQUEST &
 
 /* concept CartGetRequest */
 cartId_cartGet: CARTGETREQUEST <-> STRING & 
 HMAC_cartGet:CARTGETREQUEST <-> STRING & 
 responseGroup_cartGet:CARTGETREQUEST<-> STRING &	
 
 /* concept CartAdd */
 AWSAccessKeyId_cartAdd: CARTADD <-> STRING & 
 cartAddRequest: CARTADD <-> CARTADDREQUEST &
 
 /* concept CartAddRequest */ /* Checking for consistency of two specs, i.e., WSML and WSDL, from this point */
 cartId_cartAdd:CARTADDREQUEST <-> STRING & 
 items_cartAdd: CARTADDREQUEST <-> CARTITEM &
 
 /* concept CartItem */
 ASIN_cartItem:CARTITEM<-> STRING & 
 offerListingId_cartItem: CARTITEM <-> STRING & 
 quantity_cartItem: CARTITEM <->  INT &
 
 /* concept CartCreate */
 AWSAccessKeyId_cartCreat: CARTCREATE <-> STRING &
 cartCreateRequest:CARTCREATE <-> CARTCREATEREQUEST & 	
 
 /* concept CartCreateRequest */
 cartId_cartCreate: CARTCREATEREQUEST <-> STRING & 
 items_cartCreate: CARTCREATEREQUEST <-> CARTITEM &    
 
 /* concept CartModify */
 AWSAccessKeyId_cartModify: CARTMODIFY<->STRING & 
 cartModifyRequest: CARTMODIFY <-> CARTMODIFYREQUEST &
 
 /* concept CartModifyRequest */ 
 cartId_cartModify:CARTMODIFYREQUEST <-> STRING & 
 cartModifyItems_cartGet:CARTMODIFYREQUEST <-> CARTMODIFYITEM & 
 
 /* concept CartModifyItem */ 
 action_cartGet:CARTMODIFYITEM <-> STRING &  
 cartItemId_cartGet:CARTMODIFYITEM <-> STRING & 
 quantity_cartGet:CARTMODIFYITEM <-> STRING & 
 
 
 /* concept CartClear */ 
 AWSAccessKeyId_cartclear:CARTCLEAR <-> STRING & 
 cartClearRequest:CARTCLEAR <-> CARTCLEARREQUEST &
 
 /* concept CartClearRequest */
 cartId_cartclear:CARTCLEARREQUEST <->STRING  & 
 HMAC_cartclear:CARTCLEARREQUEST <->STRING  & 
 responseGroup_cartclear : CARTCLEARREQUEST <-> STRING &		
 
 /* concept TransactionLookup */
 AWSAccessKeyId_transLookup: TRANSACTIONLOOKUP <-> STRING & 
 transactionLookupRequest : TRANSACTIONLOOKUP <-> TRANSACTIONLOOKUPREQUEST & 
 				
 /* concept TransactionLookupRequest */
 responseGroup_transLookup: TRANSACTIONLOOKUPREQUEST <-> STRING &
 transactionId_transLookup: TRANSACTIONLOOKUPREQUEST <-> STRING  &  
 			
 /* concept SellerListingSearch */ 
 AWSAccessKeyId_selLstng: SELLERLISTINGSEARCH<->STRING &
 sellerListingSearchRequest: SELLERLISTINGSEARCH <-> SELLERLISTINGSEARCHREQUEST &
 		
 /* concept SellerListingSearchRequest */
 keywords_selLstngSrch: SELLERLISTINGSEARCHREQUEST <-> STRING & 
 offerStatus_selLstngSrch: SELLERLISTINGSEARCHREQUEST <-> STRING & 
 sellerId_selLstngSrch : SELLERLISTINGSEARCHREQUEST <-> STRING & 
 title_selLstngSrch: SELLERLISTINGSEARCHREQUEST <-> STRING &
 		
 /* concept SellerListingLookup */ 
 AWSAccessKeyId_selLstngSrch: SELLERLISTINGLOOKUP <-> STRING &
 sellerListingLookupRequest: SELLERLISTINGLOOKUP <-> SELLERLISTINGLOOKUPREQUEST &
 		
 /* concept SellerListingLookupRequest */ 
 id_selLstngLkup: SELLERLISTINGLOOKUPREQUEST <-> STRING &
 sellerId_selLstngLkup : SELLERLISTINGLOOKUPREQUEST <-> STRING & 
 idType_selLstngLkup : SELLERLISTINGLOOKUPREQUEST <-> STRING & 
 responseGroup_selLstngLkup : SELLERLISTINGLOOKUPREQUEST <-> STRING &
 	
 	
 /* concept BrowseNodeLookup */
 AWSAccessKeyId_bnLkup: BROWSENODELOOKUP <-> STRING &
 browseNodeLookupRequest : BROWSENODELOOKUP <-> BROWSENODELOOKUPREQUEST  &
 		
 /* concept BrowseNodeLookupRequest */
 browseNodeId_bnLkup:  BROWSENODELOOKUPREQUEST <-> STRING & 
 responseGroup_bnLkup :  BROWSENODELOOKUPREQUEST <-> STRING & 
 
 /* concept HelpResponse */
 information_hResp: HELPRESPONSE <-> INFORMATION  &
 		
 /* concept Information */
 operationInfo: INFORMATION <-> OPERATIONINFORMATION &	
 responseGroupInfo: INFORMATION <-> RESPONSEGROUPINFORMATION &
 	
 /* concept OperationInformation */
 name_opInfo: OPERATIONINFORMATION <-> STRING & 
 description_opInfo : OPERATIONINFORMATION <-> STRING & 
 requiredParameters_opInfo: OPERATIONINFORMATION <-> STRING  &
 			
 /* concept ResponseGroupInformation */
 name_rgInfo: RESPONSEGROUPINFORMATION <-> STRING & 
 creationDate_rgInfo: RESPONSEINFORMATION <-> STRING & 
 validOperations_opInfo : RESPONSEINFORMATION <-> STRING &
 			
/* concept ItemContainer */ 
 items_itmcont: ITEMCONTAINER <-> ITEM & 
 	
 /* concept Items */
 totalResults_itms: ITEMS <-> INT & 
 totalPage_itms: ITEMS <-> INT & 
 item_itms : ITEMS <-> ITEM & 
 	
 /* concept Item */ 
 ASIN_item: ITEM <-> STRING & 
 parentASIN_itms:ITEM <-> STRING & 
 itemAttributes_itms:ITEM <-> ITEMATTRIBUTES & 
 relatedItems_itms:ITEM <->RELATEDITEMS & 
 browseNodes_itms :ITEM <-> BROWSENODE & 
 	
 		 
 /* concept CustomerContainer */ 
 customers_cContainer: CUSTOMERCONTAINER <-> CUSTOMERS & 
 		
 /* concept Customers */
 totalResults_customers: CUSTOMERS <-> INT & 
 totalPage_customers: CUSTOMERS <-> INT & 
 customer_customers: CUSTOMERS <-> CUSTOMER &
 		
 /* concept Customer */
 customerId_customer: CUSTOMER <-> STRING & 
 nickname_customer:CUSTOMER <-> STRING & 
 birthday_customer:CUSTOMER <-> STRING & wishListId_customer :CUSTOMER <-> STRING &
 	
 /* concept SellerContainer */ 
 sellers_selCont: SELLERCONTAINER <-> SELLERS & 
 	
 /* concept Sellers */
 totalPages_sellers: SELLERS <-> INT & 
 totalResults_sellers: SELLERS <-> INT & 
 seller_sellers: SELLERS <-> SELLER &
 	
 /* concept Seller */
 sellerId_seller: SELLER <->STRING & 
 sellerName_seller: SELLER<-> STRING &  
 	
 /* concept Cart */
 cartId_cart:CART<-> STRING & 
 HMAC_cart:CART <-> STRING  & 
 URLEncodedHMAC_cart: CART <-> STRING &
 purchaseURL_cart:CART<-> STRING & 
 mobileCartURL_cart:CART <-> STRING &  subTotal_cart:CART <-> PRICE &
 	
 /* concept TransactionContainer */
 transactions_tContainer:TRANSACTIONCONTAINER <-> TRANSACTIONS &
 		
 /* concept Transactions	 */
 totalResults_trans : TRANSACTIONS <-> INT &
 totalPages_trans: TRANSACTIONS<-> INT & 
 transaction_trans:TRANSACTIONS <-> TRANSACTION & 
 	
 /* concept Transaction */
 transactionId_tran:TRANSACTION<->STRING &
 sellerId_tran:TRANSACTION<->STRING  & 
 transactionDate_tran :TRANSACTION<->STRING  &
 totals_tran : TRANSACTION<->STRING &
 
 			
 /* concept SellerListingContainer */ 
 sellerListings_selLstingContainer: SELLERLISTINGCONTAINER <->  SELLERLISTINGS &
 	
 /* concept SellerListings */
 totalPages_selListings: SELLERLISTINGS <-> INT & 
 totalResults_selListings : SELLERLISTINGS <-> INT & 
 sellerListing_selListings: SELLERLISTINGS <-> SELLERLISTING &
 		
 /* concept SellerListing */
 listingId_selListing:SELLERLISTING<->STRING  &
 ASIN_selListing: SELLERLISTING<->STRING  &
 willShipExpedited_selListing:SELLERLISTING<-> BOOL &
 willShipInternational_selListing: SELLERLISTING<-> BOOL  &
 title_selListing:SELLERLISTING<->STRING  & 
 price_selListing:SELLERLISTING<-> PRICE  &  /* <--- error corrected by leuschel */
 startDate_selListing:SELLERLISTING<-> STRING & 
 endDate_selListing:SELLERLISTING<-> STRING &
 			
 				
 /* concept ListContainer */ 
 lists_lContainer:LISTCONTAINER <-> LISTS &
 	
 /* concept Lists */
 totalPages_lists:LISTS <-> STRING & 
 totalResults_lists :LISTS <-> STRING & 
 list_lists:LISTS <-> LIST &
 		
 /* concept List */
 listId_list:LIST <->STRING &
 listURL_list:LIST <->STRING & 
 listName_list:LIST <->STRING & 
 listType_list:LIST <->STRING &
 totalItems_list:LIST <->INT & 
 dateCreated_list:LIST <->STRING & 
 customerName_list:LIST <->STRING &
 listItem_list:LIST<->LISTITEM &
 		 	
 /* concept ListItem */
 listItemId_lstItem:LISTITEM <-> STRING  & 
 dateAdded_lstItem: LISTITEM <-> STRING & 
 quantityDesired_lstItem:LISTITEM <-> INT & 
 quantityRequired_lstItem:LISTITEM <-> STRING & 
 item_lstItem:LISTITEM <-> ITEM & 
 		
 /* concept SearchResultMap */
 searchIndex_srchMap: SEARCHRESULTMAP <-> SEARCHINDEX  &
 	
 /* concept SearchIndex */
 indexName_srchIndx:SEARCHINDEX <-> STRING & 
 results_srchIndx :SEARCHINDEX <-> INT & 
 pages_srchIndx:SEARCHINDEX <-> INT & 
 relevanceRank_srchIndx: SEARCHINDEX <-> INT & 
 ASIN_srchIndx: SEARCHINDEX <-> STRING &
 	
 /* concept RelatedItems */ 
 relationship_rItems: RELATEDITEMS <-> STRING & 
 relationshipType_rItems: RELATEDITEMS <-> STRING &
 relatedItemCount_rItems:RELATEDITEMS <-> INT & 
 relatedItem_rItems : RELATEDITEMS<-> RELATEDITEM & 
 	
 /* concept RelatedItem */
 item_rItem: RELATEDITEM <->ITEM &
 
 /* concept BrowseNodeLookupResponse */ 
 nodes_bnResp: BROWSENODELOOKUPRESPONSE <-> BROWSENODE  &
 		
 /* concept BrowseNode */
 browseNodeId_bn:BROWSENODE <-> STRING & 
 name_bn:BROWSENODE<->STRING &
 isCategoryRoot_bn:BROWSENODE <-> BOOL & subTotal_cItems:CARTITEMS <-> PRICE & cartItem_cItems:CARTITEMS <-> CARTITEM &  	

 cartItemId_cItem:CARTITEM <-> STRING &  ASIN_cItem:CARTITEM <-> STRING & 
 quantity_cItem: CARTITEM<-> INT &  title_cItem :CARTITEM <-> STRING &
 price_cItem: CARTITEM<->PRICE &  itemTotal_cItem: CARTITEM<-> PRICE  & 


 total_cItem:CARTITEM <->PRICE & 
 subtotal_cItem:CARTITEM <->PRICE & 
 tax_cItem:CARTITEM <->PRICE &
 shippingCharge_cItem:CARTITEM <->PRICE & 
 promotion_cItem:CARTITEM <-> PRICE &
 		
 /* concept TransactionItems */ 
 transactionItem_tItems:TRANSACTIONITEMS <-> TRANSACTIONITEM &
 		
 /* concept TransactionItem */
 transactionItemId_tItem:TRANSACTIONITEM <->STRING &
 quantity_tItem:TRANSACTIONITEM <-> INT & 
 unitPrice_tItem: TRANSACTIONITEM <-> PRICE & 
 totalPrice_tItem: TRANSACTIONITEM <-> PRICE & 
 ASIN_tItem:TRANSACTIONITEM <-> STRING  & 
 title_tItem:TRANSACTIONITEM <-> STRING  &
 		
 /* concept SellerListing */
 listingId_selListing :SELLERLISTING<-> STRING & 
 ASIN_selListing :SELLERLISTING<-> STRING &
 willShipExpedited_selListing: SELLERLISTING<-> BOOL &  /* <--- error corrected by leuschel */
 willShipInternational_selListing :SELLERLISTING<-> BOOL & 
 title_selListing :SELLERLISTING<-> STRING  &
 price_selListing :SELLERLISTING<-> PRICE & 
 startDate_selListing :SELLERLISTING <-> STRING & 
 endDate_selListing :SELLERLISTING <-> STRING &
 	
 /* concept Price */ 
 amount_price: PRICE<->INT &
 currencyCode_price : PRICE <-> STRING & 
 formattedPrice_price: PRICE <-> STRING & 
 		
 		
 /* concept ItemAttributes */
 title_iAttrib:ITEMATTRIBUTES<->STRING & 
 description_iAttrib:ITEMATTRIBUTES<->STRING  & 
 actor_iAttrib:ITEMATTRIBUTES<->STRING  &
 Artist_iAttrib :ITEMATTRIBUTES<->STRING & 
 author_iAttrib :ITEMATTRIBUTES<->STRING  & 
 brand_iAttrib :ITEMATTRIBUTES<->STRING  & 
 manufacturer_iAttrib  :ITEMATTRIBUTES<->STRING  &
 publisher_iAttrib :ITEMATTRIBUTES<->STRING  &
 color_iAttrib:ITEMATTRIBUTES<->STRING  & 
 ISBN_iAttrib :ITEMATTRIBUTES<->STRING & 
 label_iAttrib :ITEMATTRIBUTES<->STRING  & 
 model_iAttrib :ITEMATTRIBUTES<->STRING  &
 		
 /* concept PurchaseByCreditCard */
 transactionId_purchaseByCC: PURCHASEBYCREDITCARD <-> STRING &
 purchaseAmount_purchaseByCC : PURCHASEBYCREDITCARD <-> INT &
 paymentMethod_purchaseByCC : PURCHASEBYCREDITCARD <-> STRING &
 purchaseDate_purchaseByCC : PURCHASEBYCREDITCARD <-> STRING &  /* <--- error corrected by leuschel */
 creditCard_purchaseByCC : PURCHASEBYCREDITCARD <-> CREDITCARD & /* <--- error corrected by leuschel */
 	
 /* concept CreditCard */ 
 cardHolderName : CREDITCARD <-> STRING & 
 cardNumber : CREDITCARD <-> INT &
 expiryDate : CREDITCARD <-> EXPIRYDATE & 
 cardType: CREDITCARD <-> STRING & 
 cardBalance : CREDITCARD <-> INT &
  			
 
 /* concept ExpiryDate */
 expiryMonth: EXPIRYDATE <-> INT & 
 expiryYear: EXPIRYDATE <-> INT &
 	
 /* concept  PurchaseByCreditCardResponse */ 
 purchaseReceipt_purchaseByCCRes : PURCHASEBYCREDITCARDRESPONSE <-> PURCHASERECEIPT  &
 
 /* concept PurchaserReceipt */
 transactionId_pReceipt : PURCHASERECEIPT <-> STRING & 
 purchaseAmount_pReceipt : PURCHASERECEIPT <-> INT & 
 purchaseDate_pReceipt: PURCHASERECEIPT <-> STRING  &
 cardNumber_p_Receipt : PURCHASERRECEIPT<-> INT &
 
/* axiom defining the helpType constraint */
#x.(x:HELPREQUEST & (helpType(x)="Operation" or helpType(x)= "ResponseGroup")) &

/* constraint on availability definition */
#x.(x:ITEMSEARCHREQUEST & availability_iSrch(x)="Available") &

/* constraint on audience ratings */
#x.(x:ITEMSEARCHREQUEST &   /* <--- error corrected by leuschel */
/* also added parantheses around disjunctions in existential quantifications below and above: */
(audienceRating_isrch(x)="G" or 
audienceRating_isrch(x)="PG" or audienceRating_isrch(x)="PG-13" or 
audienceRating_isrch(x)="R" or audienceRating_isrch(x)="NC-17" or 
audienceRating_isrch(x)="NR" or audienceRating_isrch(x)="Unrated" or 
audienceRating_isrch(x)="18" or audienceRating_isrch(x)="12" or 
audienceRating_isrch(x)="16" or audienceRating_isrch(x)="18" or 
audienceRating_isrch(x)="FamilyViewing")) &

/* Constraint for condition definition */ 
#x.(x:ITEMSEARCHREQUEST &  (condition_isrch (x)= "All" or 
condition_isrch(x)="New" or condition_isrch(x)="Used" or 
condition_isrch(x)="Collectible" or condition_isrch(x)="Refurbished")) & 

/* Constraint for Item Id type in Item Lookup */ 
#x.(x:ITEMLOOKUP & (idType_ilookup(x)="ASIN" or 
idType_ilookup(x)="UPC" or idType_ilookup(x)="SKU" or
idType_ilookup(x)="EAN" or idType_ilookup(x)="ISBN")) & 

/* Constraint on the listType definition inside LISTSEARCHREQUEST */
#x. (x:LISTSEARCHREQUEST & (listType_lstSrch (x)="WishList" or
listType_lstSrch (x)="ListMania" or listType_lstSrch (x)="WeddingRegistry" or 
listType_lstSrch (x)="BabyRegistry")) &

/* Constraint on Similarity Type definition */
#x. (x:SIMILARITYLOOKUPREQUEST & (similarityType (x)="Intersection" or similarityType (x)="Random")) &

/*Constraint on the CARTMODIFYITEM actionType definition */ 
#x.(x:CARTMODIFYITEM & (action_cartGet(x)="MoveToCart"  or action_cartGet(x)="SaveForLater")) &

/* various x: replaced by #x. by leuschel */

/*Constraint on the IdType of the SELLERLISTINGLOOKUPREQUEST */ 
#x.(x: SELLERLISTINGLOOKUPREQUEST & (idType_selLstngLkup(x)= "Exchange" or 
idType_selLstngLkup(x)= "Listing" or idType_selLstngLkup(x)= "ASIN" 
or idType_selLstngLkup(x)= "SKU")) & 

/* Constraint on credit card type definition */
#x.(x:CREDITCARD & (cardType(x) = "Master" or cardType(x)= "Visa"))  &

/* Constraint on the value of expiryMonth */
#x.(x:EXPIRYDATE & (expiryMonth(x)>=1 & expiryMonth(x)<13)) &

/* Constraint on the value of expiryYear */ 
#x. (x:EXPIRYDATE & expiryYear(x) > 2012)


INITIALISATION 

AWSAccessKeyId_help := {} || 
helpRequest  := {} ||

/* concept HelpRequest */
about  := {} || helpType  := {} || 
responseGroup_help  := {} ||

/* concept ItemSearch */
AWSAccessKeyId_iSearch  := {} || 
ItemSearchRequest  := {} ||

/* concept itemSearchRequest */
availability_iSrch  := {} || 
audienceRating_isrch  := {} || 
author_isrch  := {} || 
brand_isrch  := {} || 
condition_isrch  := {} || 
deliveryMethod_isrch  := {} || 
keywords_isrch  := {} || 
manufacturer_isrch  := {} ||
maximumPrice_irsch   := {} || 
minimumPrice_isrch  := {} || 
publisher_isrch  := {} || 
searchIndex_isrch  := {} || 
title_isrch   := {} || 
releaseDate_isrch  := {} ||

/* concept ItemLookup */
AWSAccessKeyId_iLookup  := {} || itemLookupRequest  := {} || 

/* concept ItemLookupRequest */ 
 condition_ilookup  := {} || deliveryMethod_ilookup  := {} || 
idType_ilookup  := {} || itemId_ilookup  := {} || 

/* concept ListSearch */
AWSAccessKeyId_lstSrch  := {} || listSearchRequest  := {} || 

/* concept ListSearchRequest */
email_lstSrch  := {} || firstName_lstSrch := {} || 
lastName_lstSrch:={} || 
listType_lstSrch  := {} || 
name_lstSrch  := {} || 

/* concept ListLookup */
AWSAccessKeyId_lstLookup  := {} || 
listLookupRequest  := {} || 	

/* concept ListLookupRequest */
condition_lstLookup  := {} ||  
deliveryMethod_lstLookup  := {} || 
listId_lstLookup  := {} || 
listType_lstLookup  := {} || 

/* concept CustomerContentSearch */ 
AWSAccessKeyId_custCntSrch:= {} || 
customerContentSearchRequest  := {} ||

/* concept CustomerContentSearchRequest */ 
customerPage_custContSrch  := {} || 
email_custContSrch  := {} ||
name_custContSrch  := {} || 

/* concept CustomerContentLookup */
 AWSAccessKeyId_custCntLookup  := {} ||
 customerContentLookupRequest  := {} ||

/* concept CustomerContentLookupRequest */
customerId_custCntLookup  := {} ||
reviewPage_custCntLookup  := {} ||

/* concept SimilarityLookup */
AWSAccessKeyId_simLookup  := {} ||
similarityLookupRequest  := {}  ||

/* concept  SimilarityLookupRequest */
condition_simLookup  := {} ||
deliveryMethod_simLookup:= {} || 
itemId_simLookup  := {} || 
similarityType  := {} ||		

/* concept SellerLookup */
AWSAccessKeyId_sellerLookup  := {} ||	sellerLookupRequest  := {} ||

/* concept SellerLookupRequest */
sellerId__sellerLookup  := {} || feedbackPage__sellerLookup  := {} ||

/* concept CartGet */	
AWSAccessKeyId_cartGet  := {} ||	cartGetRequest  := {} ||

/* concept CartGetRequest */
cartId_cartGet   := {} || HMAC_cartGet  := {} || responseGroup_cartGet  := {} ||	

/* concept CartAdd */
AWSAccessKeyId_cartAdd  := {} ||cartAddRequest  := {} ||	

/* concept CartAddRequest */
cartId_cartAdd  := {} || items_cartGet  := {} ||

/* concept CartItem */
ASIN_cartItem  := {} || offerListingId_cartItem  := {} || quantity_cartItem  := {} ||		

/* concept CartCreate */
AWSAccessKeyId_cartcreat  := {} || cartCreateRequest  := {} || 	

/* concept CartCreateRequest */
cartId_cartGet  := {} || items_cartGet  := {} ||	

/* concept CartModify */
AWSAccessKeyId_cartModify  := {} || cartModifyRequest  := {} ||

/* concept CartModifyRequest */ 
cartId_cartModify  := {} || cartModifyItems_cartGet  := {} ||

/* concept CartModifyItem */ 
action_cartGet  := {} || cartItemId_cartGet  := {} ||  quantity_cartGet  := {} ||	

/* concept CartClear */ 
AWSAccessKeyId_cartclear  := {} || cartClearRequest  := {} ||

/* concept CartClearRequest */
cartId_cartclear  := {} || HMAC_cartclear := {} || responseGroup_cartclear  := {} ||		

/* concept TransactionLookup */
AWSAccessKeyId_transLookup  := {} || transactionLookupRequest  := {} ||
				
/* concept TransactionLookupRequest */
responseGroup_transLookup  := {} || transactionId_transLookup  := {} ||  
			
/* concept SellerListingSearch */ 
AWSAccessKeyId_selLstng  := {} || sellerListingSearchRequest  := {} ||
		
/* concept SellerListingSearchRequest */
keywords_selLstngSrch  := {} || offerStatus_selLstngSrch  := {} || sellerId_selLstngSrch  := {} || title_selLstngSrch  := {} || 
		
/* concept SellerListingLookup */ 
AWSAccessKeyId_selLstngSrch  := {} || sellerListingLookupRequest  := {} ||
		
/* concept SellerListingLookupRequest */ 
 id_selLstngLkup  := {} || sellerId_selLstngLkup  := {} || idType_selLstngLkup  := {} || responseGroup_selLstngLkup  := {} ||
	
	
/* concept BrowseNodeLookup */
AWSAccessKeyId_bnLkup  := {} || browseNodeLookupRequest  := {} ||
		
/* concept BrowseNodeLookupRequest */
browseNodeId_bnLkup  := {} || responseGroup_bnLkup  := {} ||

/* concept HelpResponse */
information_hResp  := {} ||
		
/* concept Information */
operationInfo  := {} ||	responseGroupInfo  := {} ||
	
/* concept OperationInformation */
name_opInfo  := {} || description_opInfo  := {} || requiredParameters_opInfo  := {} ||
			
/* concept ResponseGroupInformation */
name_rgInfo  := {} || creationDate_rgInfo  := {} || validOperations_opInfo  := {} ||




			
/* concept ItemContainer */
items_itmcont  := {} ||
	
/* concept Items */
totalResults_itms  := {} || totalPage_itms  := {} || searchResultsMaps_itms  := {} || item_itms  := {} ||
	
/* concept Item */
ASIN_item  := {} || parentASIN_itms  := {} || itemAttributes_itms  := {} || relatedItems_itms  := {} || browseNodes_itms  := {} ||
	
		 
/* concept CustomerContainer */
  customers_cContainer  := {} ||
		
/* concept Customers */
totalResults_customers  := {} || totalPage_customers  := {} || customer_customers  := {} ||
		
/* concept Customer */
customerId_customer  := {} || nickname_customer  := {} || birthday_customer  := {} || wishListId_customer  := {} ||
	
/* concept SellerContainer */ 
sellers_selCont  := {} || 
	
/* concept Sellers */
totalPages_sellers  := {} || totalResults_sellers  := {} || seller_sellers  := {} ||
	
/* concept Seller */
sellerId_seller  := {} || sellerName_seller  := {} ||  
	
/* concept Cart */
cartId_cart  := {} || HMAC_cart  := {} || URLEncodedHMAC_cart  := {} || purchaseURL_cart  := {} || 
mobileCartURL_cart  := {} || subTotal_cart  := {} ||
	
/* concept TransactionContainer */
transactions_tContainer  := {} ||
		
/* concept Transactions	 */
totalResults_trans  := {} || totalPages_trans  := {} || transaction_trans  := {} || 
	
/* concept Transaction */
transactionId_tran  := {} || sellerId_tran  := {} || transactionDate_tran  := {} || totals_tran  := {} ||
			
/* concept SellerListingContainer */ 
sellerListings_selLstingContainer  := {} ||
	
/* concept SellerListings */
totalPages_selListings  := {} || totalResults_selListings  := {} || sellerListing_selListings  := {} ||
		
/* concept SellerListing */
listingId_selListing  := {} || ASIN_selListing  := {} || willShipExpedited_selListing  := {} || willShipInternational_selListing  := {} ||
title_selListing  := {} || price_selListing  := {} || startDate_selListing  := {} || endDate_selListing  := {} ||
			
				
/* concept ListContainer */ 
lists_lContainer  := {} ||
	
/* concept Lists */
totalPages_lists  := {} || totalResults_lists   := {} || list_lists  := {} ||
		
/* concept List */
listId_list  := {} || listURL_list  := {} || listName_list  := {} || listType_list  := {} ||
totalItems_list  := {} || dateCreated_list  := {} || customerName_list  := {} || listItem_list  := {} ||
		 	
/* concept ListItem */
listItemId_lstItem  := {} || dateAdded_lstItem  := {} || quantityDesired_lstItem  := {} || quantityRequired_lstItem  := {} ||item_lstItem  := {} ||
		
/* concept SearchResultMap */
searchIndex_srchMap  := {} ||
	
/* concept SearchIndex */
indexName_srchIndx  := {} || results_srchIndx  := {} || pages_srchIndx  := {} || relevanceRank_srchIndx  := {} || ASIN_srchIndx  := {} ||
	
/* concept RelatedItems */ 
relationship_rItems  := {} || relationshipType_rItems  := {} ||	relatedItemCount_rItems  := {} || relatedItem_rItems  := {} || 
	
/* concept RelatedItem */
item_rItem  := {} ||

/* concept BrowseNodeLookupResponse */ 
 nodes_bnResp  := {} ||
		
/* concept BrowseNode */
browseNodeId_bn  := {} || name_bn  := {} || isCategoryRoot_bn  := {} ||	
	

/* concept CartItems */ 
subTotal_cItems  := {} || cartItem_cItems  := {} ||
	
/* concept CartItem */ 
cartItemId_cItem  := {} || ASIN_cItem  := {} || quantity_cItem  := {} || title_cItem  := {} || price_cItem  := {} || itemTotal_cItem  := {} ||		
Total_cItem  := {} || total_cItem  := {} || subtotal_cItem  := {} || tax_cItem  := {} || shippingCharge_cItem  := {} || promotion_cItem  := {} ||
		
/* concept TransactionItems */ 
transactionItem_tItems  := {} ||
		
/* concept TransactionItem */
transactionItemId_tItem  := {} || quantity_tItem  := {} || unitPrice_tItem  := {} || 
totalPrice_tItem  := {} || ASIN_tItem  := {} || title_tItem  := {} ||	
		
/* concept SellerListing */
listingId_selListing  := {} || ASIN_selListing  := {} || willShipExpedited_selListing  := {} ||
willShipInternational_selListing  := {} || title_selListing  := {} || price_selListing  := {} || 
startDate_selListing  := {} || endDate_selListing  := {} ||
	
/* concept Price */ 
amount_price  := {} ||	currencyCode_price  := {} || formattedPrice_price  := {} || 
		
		
/* concept ItemAttributes */
title_iAttrib  := {} || description_iAttrib  := {} || actor_iAttrib  := {} ||
Artist_iAttrib  := {} || author_iAttrib  := {} || brand_iAttrib  := {} || 
manufacturer_iAttrib  := {} || publisher_iAttrib  := {} || color_iAttrib  := {} || 
ISBN_iAttrib  := {} || label_iAttrib  := {} || model_iAttrib  := {} ||
		
/* concept PurchaseByCreditCard */
transactionId_purchaseByCC  := {} || purchaseAmount_purchaseByCC  := {} || paymentMethod_purchaseByCC  := {} ||
purchaseDate_purchaseByCC  := {} || creditCard_purchaseByCC  := {} ||
	
/* concept CreditCard */ 
cardHolderName  := {} || cardNumber  := {} ||
expiryDate  := {} || cardType  := {} || cardBalance:= {} ||
 			

/* concept ExpiryDate */
expiryMonth  := 5 || expiryYear  := 2014 ||
	
/* concept  PurchaseByCreditCardResponse */ 
purchaseReceipt_purchaseByCCRes  := {} || transactionId_purchaseByCCRes  := {} || purchaseAmount_purchaseByCCRes  := {} || 
cardNumber_purchaseByCCRes  := {} || purchaseDate_purchaseByCCRes  := {} ||

/* concept PurchaserReceipt */
 transactionId_purchReceipt  := {} || purchaseAmount_purchReceipt  := {} || purchaseDate_purchReceipt
 
OPERATIONS 
 /* Operation to set valid value of the credit card */
 setValidCCValue1(cc) =
 PRE cc:CREDITCARD THEN
  cardType:= {cc |-> "Visa"} 
 END;
 
 setValidCCType2(cc) =
 PRE cc:CREDITCARD THEN
 
 
 
  cardType:= {cc |-> "Master"}
 END;
 
 setValidCCType3(cc) =
  PRE cc:CREDITCARD THEN
   cardType:= {cc |-> "invalid value"}
 END;
 
 setHelpType1(hReq) =
 PRE hReq:HELPREQUEST THEN
    helpType:= {hReq |-> "Operation"} 
 END; 
 setHelpType2(hReq)=
  PRE hReq:HELPREQUEST THEN
  	helpType:={hReq |-> "ResponseGroup"}
  END;
  
  setHelpType3(hReq)=
    PRE hReq:HELPREQUEST THEN
    	helpType:={hReq |-> "invalid help request"}
  END;
  
  
 setValidValueOfAvailable(req) =
  PRE req:ITEMSEARCHREQUEST THEN
    availability_iSrch:={req |-> "Available"}
 END; 
 
 setValidValueOfAvailable2(req) =
   PRE req:ITEMSEARCHREQUEST THEN
     availability_iSrch:={req |-> "Not Available"}
 END;
 
 
 setAudienceRating1(req)=
 PRE ree:ITEMSEARCHREQUEST THEN 	
 	audienceRating_isrch:={req |-> "G"}
 END; 
 setAudienceRating2(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "PG"}
 END; 
 setAudienceRating3(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "PG-13"}
 END;
 
 setAudienceRating4(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "R"}
 END;
 setAudienceRating5(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "NC-17"}
 END;
 setAudienceRating6(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "NR"}
 END;
 setAudienceRating7(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "Unrated"}
 END;
 setAudienceRating8(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "18"}
 END;
 setAudienceRating9(req)=
  PRE ree:ITEMSEARCHREQUEST THEN 	
  	audienceRating_isrch:={req |-> "12"}
 END;
 setAudienceRating10(req)=
   PRE ree:ITEMSEARCHREQUEST THEN 	
   	audienceRating_isrch:={req |-> "16" }
 END;
 
 setAudienceRating11(req)=
   PRE ree:ITEMSEARCHREQUEST THEN 	
   	audienceRating_isrch:={req |-> "FamilyViewing"}
 END;
 
setAudienceRating12(req)=
   PRE ree:ITEMSEARCHREQUEST THEN 	
   	audienceRating_isrch:={req |-> "Invalid rating"}
 END;
 
 setConditionValue1(req)=
 PRE req: ITEMSEARCHREQUEST THEN 
  	condition_isrch:={req |-> "All"}
 END;
  
 setConditionValue2(req)=
 PRE req: ITEMSEARCHREQUEST THEN 
  	condition_isrch:={req |-> "New"}
 END;
 
 setConditionValue3(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
   	condition_isrch:={req |-> "Used"}
  END;
 
 setConditionValue4(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
   	condition_isrch:={req |-> "Refurbished"}
  END;
 
 setConditionValue5(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
   	condition_isrch:={req |-> "Collectible"}
  END;
 
 setConditionValue6(req)=
  PRE req: ITEMSEARCHREQUEST THEN 
    	condition_isrch:={req |-> "Invalid condition"}
  END; 
  
 setItemIdValue1(req)=
  PRE req:ITEMLOOKUPREQUEST THEN
  	iidType_ilookup:={req |-> "ASIN"}
  END;
 
 setItemIdValue2(req)=
   PRE req:ITEMLOOKUPREQUEST THEN
   	iidType_ilookup:={req |-> "UPC"}
  END;
  
  setItemIdValue3(req)=
    PRE req:ITEMLOOKUPREQUEST THEN
    	iidType_ilookup:={req |-> "SKU"}
  END;
  
 setItemIdValue4(req)=
  PRE req:ITEMLOOKUPREQUEST THEN
  	iidType_ilookup:={req |-> "EAN"}
  END;
 
 setItemIdValue5(req)=
   PRE req:ITEMLOOKUPREQUEST THEN
   	iidType_ilookup:={req |-> "ISBN"}
 END;
 
 setItemIdValue6(req)=
    PRE req:ITEMLOOKUPREQUEST THEN
    	iidType_ilookup:={req |-> "Invalid Id Type"}
 END;
  
 
 setListType1(req) =
 PRE req: LISTSEARCHREQUEST THEN
 	listType_lstSrch:={req|-> "WishList"}
 END;
 
 setListType2(req) =
  PRE req: LISTSEARCHREQUEST THEN
  	listType_lstSrch:={req|-> "ListMania"}
 END;
 
 setListType3(req) =
  PRE req: LISTSEARCHREQUEST THEN
  	listType_lstSrch:={req|-> "WeddingRegistry"}
 END;
 
 setListType4(req) =
  PRE req: LISTSEARCHREQUEST THEN
  	listType_lstSrch:={req|-> "BabyRegistry"}
 END;
 
 setListType4(req) =
   PRE req: LISTSEARCHREQUEST THEN
   	listType_lstSrch:={req|-> "Invlaid List type"}
 END;
 
 setSimilarityType1(req)=
 PRE req: SIMILARITYLOOKUPREQUEST THEN
  similarityType:={req |-> "Intersection"}
 END;
 
 setSimilarityType2(req) = 
 PRE req: SIMILARITYLOOKUPREQUEST THEN
   similarityType:={req |-> "Random"}
 END;
 
 setSimilarityType3(req) = 
  PRE req:SIMILARITYLOOKUPREQUEST THEN
    similarityType:={req |-> "Invalid similarity"}
 END;


setIdTypeSellerListing1(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  idType_selLstngLkup:={req |-> "Exchange"}
END;
setIdTypeSellerListing2(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  idType_selLstngLkup:={req |-> "Listing"}
END;
setIdTypeSellerListing3(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  idType_selLstngLkup:={req |-> "ASIN"}
END;
setIdTypeSellerListing4(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  idType_selLstngLkup:={req |-> "SKU"}
END;
setIdTypeSellerListingInvalid(req)=
PRE req:SELLERLISTINGLOOKUPREQUEST THEN 
  idType_selLstngLkup:={req |-> "Invalid seller Id"}
END;

IncrExpiryMonth(req)=
PRE req:EXPIRYDATE THEN
 expiryMonth:=expiryMonth+1
END;

DecrExpiryMonth(req)=
PRE req:EXPIRYDATE THEN
 expiryMonth:=expiryMonth-1
END;

IncrExpiryYear(req)=
PRE req:EXPIRYDATE THEN
 expiryYear:=expiryYear+1
END;

DecrExpiryYear(req)=
PRE req:EXPIRYDATE THEN
 expiryYear:=expiryYear-1
END

END
