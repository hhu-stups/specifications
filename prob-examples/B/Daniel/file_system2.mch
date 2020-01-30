MACHINE file_system2
SETS
 USERS={u1,u2}; GROUPS={g}; FILES={f}
VARIABLES
 users, groups, files,
 ingroup,
 access
INVARIANT
   users <: USERS & groups <: GROUPS & files <: FILES
 & ingroup : users <-> groups
 & access : files --> groups
INITIALISATION
      users,groups,files := {u1,u2},{g},{f}
   || ingroup,access := {u1|->g},{f|->g}
OPERATIONS
  openFile(user,file) =
    PRE user:users & file:files & access(file):ingroup[{user}]
    THEN skip
    END
END

