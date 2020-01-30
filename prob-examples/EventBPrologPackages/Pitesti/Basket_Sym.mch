
MACHINE Basket
SETS /* enumerated */
  ITEMS 
CONSTANTS it1, it20
PROPERTIES
  card(ITEMS)=20 &
  it1 : ITEMS &
  it20 : ITEMS & it1 /= it20
ABSTRACT_VARIABLES
  CAPACITY,
  buffer,
  count,
  isEmpty,
  isFull,
  items
/* PROMOTED OPERATIONS
  AddItems,
  RemoveItems,
  ValidateEmpty,
  CheckSpecial,
  ValidateFull,
  PickItems */
INVARIANT
  buffer <: ITEMS & isEmpty:BOOL & isFull:BOOL & items <: ITEMS &
    /* @inv3 */ count : NATURAL
  & /* @inv4 */ CAPACITY : NATURAL1
  & count >= 0
  & count <= CAPACITY
  & /* @inv8 */ count = card(items)
INITIALISATION
    BEGIN 
         items := {}
      ||
         count := 0
      ||
         CAPACITY := card(ITEMS)
      ||
         isEmpty := TRUE
      ||
         isFull := FALSE
      ||
         buffer := {}
    END
OPERATIONS
  AddItems = SELECT 
        card(buffer) + count <= CAPACITY
      & card(buffer) > 5
    THEN 
         items := items \/ buffer
      ||
         count := card(items \/ buffer)
      ||
         isEmpty := FALSE
    END;
  
  RemoveItems = SELECT
        buffer <: items
      & count - card(buffer) >= 0
      & card(buffer) > 3
    THEN 
         items := items \ buffer
      ||
         count := card(items \ buffer)
    END;
  
  ValidateEmpty = SELECT
        items = {}
      & count = 0
    THEN 
         isEmpty := TRUE
    END;
  
  CheckSpecial = SELECT
        {it1,it20} <: items
      & card(items) < 6
    THEN 
         buffer := items
    END;
  
  ValidateFull = SELECT 
        /* @grd1 */ count = CAPACITY
    THEN 
         isFull := TRUE
      ||
         items := {}
      ||
         count := 0
    END;
  
  PickItems(its) =  SELECT its <: ITEMS
    THEN 
         buffer := its
    END;
    
/* Encoding of PickItems(its1)->AddItems->PickItems(its2)->RemoveItems->CheckSpecial */

  PickAddPickRemoveCheckSpecial(its1,items2,count2,isEmpty2,its2,items3,count3) =  SELECT 
      /* Pick: */ its1 <: ITEMS &
       /* its1 = buffer1 */
       
       /* Add: */ 
       card(its1) + count <= CAPACITY
      & card(its1) > 5 &
      items2 = items \/ its1 &
      count2 = card(items \/ its1) &
      isEmpty2 = FALSE &
      
      /* Pick: */  its2 <: ITEMS &
       /* its2 = buffer2 */
       
       /* Remove: */
       count2 - card(its2) >= 0
      & card(its2) > 3 &
         items3 = items2 \ its2 &
         count3 = card(items2 \ its2) &
    
      /* CheckSpecial */
      {it1,it20} <: items3 & card(items3) < 6
    THEN 
         isEmpty := isEmpty2 ||
         count,items := count3,items3
    END;
    PickAddPickAddValidateFull(its1,items2,count2,isEmpty2,its2,count3) =  SELECT 
      /* Pick: */ its1 <: ITEMS &
       /* its1 = buffer1 */
       
       /* Add: */ 
        card(its1) + count <= CAPACITY
      & card(its1) > 5 &
      items2 = items \/ its1 &
      count2 = card(items \/ its1) &
      
      /* Pick: */  its2 <: ITEMS &
       /* its2 = buffer2 */
       
       /* Add: */
        card(its2) + count2 <= CAPACITY
      & card(its2) > 5 &
      /* items3 = items2 \/ its2 & */
      count3 = card(items2 \/ its2) &
      isEmpty2 = FALSE &
    
      /* ValidateFull */
      count3 = CAPACITY
    THEN 
         isEmpty := isEmpty2 ||
         isFull := TRUE
      ||
         items := {}
      ||
         count := 0
    END;
    PickAddPickRemoveValidateFull(its1,items2,count2,isEmpty2,its2,count3) =  SELECT 
      /* Pick: */ its1 <: ITEMS &
       /* its1 = buffer1 */
       
       /* Add: */ 
       card(its1) + count <= CAPACITY
      & card(its1) > 5 &
      items2 = items \/ its1 &
      count2 = card(items \/ its1) &
      isEmpty2 = FALSE &
      
      /* Pick: */  its2 <: ITEMS &
       /* its2 = buffer2 */
       
       /* Remove: */
       count2 - card(its2) >= 0
      & card(its2) > 3 &
       /*  items3 = items2 \ its2 & */
         count3 = card(items2 \ its2) &
    
      /* ValidateFull */
      count3 = CAPACITY
    THEN 
         isEmpty := isEmpty2 ||
         isFull := TRUE
      ||
         items := {}
      ||
         count := 0
    END
END
