MACHINE RussianPostalPuzzle

SETS
  KeyIDs; PERSONS = {natasha,boris}
  
DEFINITIONS
  scope_KeyIDsxx == 1..5;
  GOAL ==  (padlocks ={} & box_contains_gem=TRUE & hasbox=natasha)
  
VARIABLES
  keysforsale, hasbox, padlocks, has_keys, box_contains_gem
  
INVARIANT
  keysforsale: POW(KeyIDs) &
  hasbox: PERSONS &
  padlocks <: KeyIDs &
  has_keys: PERSONS --> POW(KeyIDs) &
  box_contains_gem: BOOL 
  
INITIALISATION
  keysforsale := KeyIDs ||
  hasbox := boris ||
  padlocks := {} ||
  has_keys := {natasha |-> {}, boris |-> {}} ||
  box_contains_gem := TRUE
  
  
OPERATIONS
   
   buy_padlock_and_key(keyid,person) = PRE keyid:keysforsale & person:PERSONS & person=hasbox THEN
      has_keys(person) := has_keys(person) \/ {keyid} || keysforsale := keysforsale - {keyid}
   END;
   
   add_padlock(keyid,person) = PRE keyid:KeyIDs & person:PERSONS & person=hasbox &
                                 keyid : has_keys(person) & keyid /: padlocks THEN
      padlocks := padlocks \/ {keyid}
   END;
   
   remove_padlock(keyid,person) = PRE keyid:KeyIDs & person:PERSONS & person=hasbox &
                                     keyid: padlocks &
                                     keyid: has_keys(person) THEN
      padlocks := padlocks - {keyid}
   END;
   
   send_box(from,to) = PRE from: PERSONS & from=hasbox & to:PERSONS & to /= hasbox THEN
      IF padlocks = {} THEN
         box_contains_gem := FALSE
      END
      ||
      hasbox := to
   END
   
END
