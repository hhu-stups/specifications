MACHINE RussianPostalPuzzle

SETS
  KeyIDs = {key1,key2,key3}; PERSONS = {natasha,boris}
  
VARIABLES
  keysforsale, padlocks, has_keys, box_contains_gem
  
INVARIANT
  keysforsale: POW(KeyIDs) &
  padlocks <: KeyIDs &
  has_keys: PERSONS --> POW(KeyIDs) &
  box_contains_gem: BOOL 
  
INITIALISATION
  keysforsale := KeyIDs ||
  padlocks := {} ||
  has_keys := {natasha |-> {}, boris |-> {}} ||
  box_contains_gem := TRUE
  
  
OPERATIONS
   
   buy_padlock_and_key(keyid,person) = PRE keyid:keysforsale & person:PERSONS THEN
      has_keys(person) := has_keys(person) \/ {keyid} || keysforsale := keysforsale - {keyid}
   END;
   
   add_padlock(keyid,person) = PRE keyid:KeyIDs & person:PERSONS &
                                 keyid : has_keys(person) & keyid /: padlocks THEN
      padlocks := padlocks \/ {keyid}
   END;
   
   remove_padlock(keyid,person) = PRE keyid:KeyIDs & person:PERSONS &
                                     keyid: padlocks &
                                     keyid: has_keys(person) THEN
      padlocks := padlocks - {keyid}
   END;
   
   send_box(from,to) = PRE from: PERSONS & to:PERSONS THEN
      IF padlocks = {} THEN
         box_contains_gem := FALSE
      END
   END;
   
   get_gem = PRE box_contains_gem=TRUE & padlocks = {}  THEN
                 box_contains_gem := FALSE END
   
END
