MACHINE sap_shop
SETS
  ITEMS={it1,it2,it3,it4,it5,it6,it7,it8,it9,it10,it11,it12,it13,it14,it15,it16,it17,it18,it19,it20}
CONSTANTS
  CAPACITY0,                                                       
  buffer0,   buffer1,              buffer3,                      
  count0,               count2,               count4,    count5,
  isEmpty0,             isEmpty2,             isEmpty4,           
  isFull0,                                               isFull5,
  items0,               items2,               items4,    items5,

  ParamPickItems1,
  ParamPickItems2
PROPERTIES
    buffer0 <: ITEMS
  & buffer1 <: ITEMS
  & buffer3 <: ITEMS

  & count0 >= 0 & count0 <= CAPACITY0
  & count2 >= 0 & count2 <= CAPACITY0
  & count4 >= 0 & count4 <= CAPACITY0
  & count5 >= 0 & count5 <= CAPACITY0
  
  & isEmpty0 : BOOL
  & isEmpty2 : BOOL
  & isEmpty4 : BOOL

  & isFull0 : BOOL
  & isFull5 : BOOL

  & items0 <: ITEMS
  & items2 <: ITEMS
  & items4 <: ITEMS
  & items5 <: ITEMS

  /* INITIALISATION */
  & items0 = {}
  & count0 = 0
  & CAPACITY0 = card(ITEMS)
  & isEmpty0 = TRUE
  & isFull0 = FALSE
  & buffer0 = {}

  /* PickItems({its1}) */
  & ParamPickItems1 <: ITEMS
  & buffer1 = ParamPickItems1

  /* AddItems */
  & card(buffer1) + count0 <= CAPACITY0
  & card(buffer1) > 5
  & items2 = items0 \/ buffer1
  & count2 = card(items0 \/ buffer1)
  & isEmpty2 = FALSE
 
  /* PickItems({its2}) */
  & ParamPickItems2 <: ITEMS
  & buffer3 = ParamPickItems2

  /* AddItems */
  & card(buffer3) + count2 <= CAPACITY0
  & card(buffer3) > 5
  & items4 = items2 \/ buffer3
  & count4 = card(items2 \/ buffer3)
  & isEmpty4 = FALSE

  /* ValidateFull */
  & count4 = CAPACITY0
  & isFull5 = TRUE
  & items5 = {}
  & count5 = 0

END
