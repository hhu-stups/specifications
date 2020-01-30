MACHINE RecordDetectionBugSimple
/* With Record Construction turned on the ASSERTION below turns to false */
DEFINITIONS
 SET_PREF_USE_RECORD_CONSTRUCTION == TRUE
SETS
 Agents
CONSTANTS pos, self,main
PROPERTIES
 pos: Agents >->> 1..4 &  card(Agents)=4 &
 self: Agents &
 main : Agents --> BOOL &
 main = Agents*{FALSE} <+ {self|->TRUE} 
ASSERTIONS
 !xx.(xx/=self => xx|->FALSE : main)
END

