MACHINE file_system
SETS
 USERS; GROUPS; FILES
VARIABLES
 users, groups, files,
 open,
 ingroup,
 access
INVARIANT
   users <: USERS & groups <: GROUPS & files <: FILES
 & open : files +-> users
 & ingroup : users <-> groups
 & access : files --> groups
 & !f.(f:dom(open) => access(f) : ingroup[{open(f)}])
INITIALISATION
      users,groups,files := {},{},{}
   || open,ingroup,access := {},{},{}
OPERATIONS
  addUser(user) =
    PRE user:USERS & user /: users
    THEN users := users \/ {user}
    END;
  removeUser(user) =
    PRE user:users
    THEN users := users - {user}
      || open := open |>> {user}
      || ingroup := {user} <<| ingroup
    END;
  addGroup(group) =
    PRE group:GROUPS & group /: groups
    THEN groups := groups\/{group}
    END;
  addToGroup(user,group) =
    PRE user:users & group:groups & (user|->group) /: ingroup
    THEN ingroup := ingroup \/ {user|->group}
    END;
  createFile(file,group) =
    PRE file:FILES & group:groups & file/:files
    THEN files := files\/{file}
      || access(file) := group
    END;
  removeFromGroup(user,group) =
    PRE user|->group : ingroup
    THEN ingroup := ingroup - {user|->group}
      || open :=  dom(access |> {group}) <<| open
    END;
  openFile(user,file) =
    PRE user:users & file:files & access(file):ingroup[{user}] & file /: dom(open)
    THEN open(file) := user
    END;
  closeFile(file) =
    PRE file : dom(open)
    THEN open := {file} <<| open
    END
END

