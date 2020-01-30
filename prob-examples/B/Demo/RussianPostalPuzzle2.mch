MACHINE RussianPostalPuzzle

SETS
  KeyIDs = {key1,key2,key3}; PERSONS = {natasha,boris,jewelry};
  CONTENTS = {empty,gem,money}
  
  
VARIABLES
  keysforsale, hasbox, padlocks, has_keys, box_contains
  
INVARIANT
  keysforsale: POW(KeyIDs) &
  hasbox: PERSONS &
  padlocks <: KeyIDs &
  has_keys: PERSONS --> POW(KeyIDs) &
  box_contains: CONTENTS 
  
  &
  
  /* goal state */
  not(padlocks ={} & box_contains=gem & hasbox=natasha)
  
INITIALISATION
  keysforsale := KeyIDs ||
  hasbox := boris ||
  padlocks := {} ||
  has_keys := {natasha |-> {}, boris |-> {}, jewelry |-> {} } ||
  box_contains := money
  
  
OPERATIONS
   
   buy_padlock_and_key(keyid,person) = PRE keyid:keysforsale & person:PERSONS & person=hasbox THEN
      has_keys(person) := has_keys(person) \/ {keyid} || keysforsale := keysforsale - {keyid}
   END;
   
   add_padlock(keyid,person) = PRE keyid:KeyIDs & person:PERSONS & person=hasbox &
                                 keyid : has_keys(person) THEN
      padlocks := padlocks \/ {keyid}
   END;
   
   remove_padlock(keyid,person) = PRE keyid:KeyIDs & person:PERSONS & person=hasbox &
                                     keyid: padlocks &
                                     keyid: has_keys(person) THEN
      padlocks := padlocks - {keyid}
   END;
   
   send_box(from,to) = PRE from: PERSONS & from=hasbox & to:PERSONS & to /= hasbox THEN
      IF padlocks = {} THEN
         box_contains := empty
      END
      ||
      hasbox := to
   END;
   
   exchange_money_for_gem = PRE hasbox = jewelry & box_contains = money & padlocks = {} THEN
      box_contains := gem
   END
   
END