MACHINE simple1

SETS
   Name
   
VARIABLES
   users

INVARIANT
   users: POW(Name) & users /= Name
   
INITIALISATION
   users := {}
   
   
OPERATIONS

  add_user(uu) =
    PRE uu:Name & uu /: users
    THEN
      users := users \/ {uu}
    END
    
 END