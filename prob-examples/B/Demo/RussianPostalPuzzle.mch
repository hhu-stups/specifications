MACHINE RussianPostalPuzzle

SETS
  KeyIDs = {key1,key2,key3}; PERSONS = {natasha,boris}

DEFINITIONS
  GOAL ==  (padlocks ={} & box_contains_gem=TRUE & hasbox=natasha);
  HEURISTIC_FUNCTION == 10*card({box_contains_gem}-{TRUE}) + card(padlocks);
  ANIMATION_IMG15 == "images/boris.gif";
  ANIMATION_IMG16 == "images/natacha.gif";
  ANIMATION_IMG17 == "images/arrow.gif";
  ANIMATION_IMG0 == "images/box.gif";
  ANIMATION_IMG1 == "images/box_padlocked.gif";
  ANIMATION_IMG2 == "images/box_padlocked_double.gif";
  ANIMATION_IMG3 == "images/box_padlocked_double.gif";
  ANIMATION_IMG4== "images/box_empty.gif";
  ANIMATION_IMG5 == "images/box_padlocked_empty.gif";
  ANIMATION_IMG6 == "images/box_padlocked_empty.gif";
  ANIMATION_IMG7 == "images/box_padlocked_empty.gif";
  ANIMATION_IMG8 == "images/nobox.gif";
  ANIMATION_FUNCTION == ( {0|->1|->15, 0|->2|->17, 0|->3|->16} \/
                          ({1|->1|->8, 1|->2|->8} <+
                            {r,c,i|r=1 &
                                   ((hasbox=boris & c=1) or (hasbox=natasha & c=2)) &
                                   ((box_contains_gem=TRUE & i=0+card(padlocks)) or
                                    (box_contains_gem=FALSE & i=4+card(padlocks))) } ))

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
