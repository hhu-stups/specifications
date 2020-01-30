MACHINE           Projects

SEES              Bool_TYPE, Scalar_TYPE, String_TYPE

SETS              ID; NAME; TITLE; STAFF

VARIABLES         students, projects, staff, preferences

INVARIANT         students : POW(ID * NAME) 
                  & projects : TITLE +-> staff 
                  & staff <: STAFF
                  & preferences : students +-> seq(projects)

INITIALISATION    
   students := {}
   || projects := {}
   || staff := {}
   || preferences := {}


OPERATIONS

rep <-- new_project(tt,ss) =
  PRE tt : TITLE & ss : STAFF
  THEN IF tt : dom(projects) or ss /: staff
       THEN rep := FALSE
       ELSE 
         CHOICE rep := TRUE ||  projects(tt) := ss
         OR rep := FALSE
         END
       END
  END

END
