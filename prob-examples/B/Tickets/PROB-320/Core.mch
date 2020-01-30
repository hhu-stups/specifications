/* Core
 * Author: HuynhLACL
 * Creation date: 28/01/2014
 */
MACHINE
    Core
    
SETS
    USERS ;
    ROLES;
    SESSIONS;
    ACTIONS;
    RESSOURCES
    
    
VARIABLES 
    Users,
    Roles,
    Sessions,
    Actions,
    Ressources,
    Permissions,
    PA,
    UA,
    User_sessions, 
    Session_roles,
    Assigned_users,
    Assigned_permissions

    
INVARIANT
    Users <: USERS &
    Roles <: ROLES &
    Sessions <: SESSIONS &
    Actions <: ACTIONS &
    Ressources <: RESSOURCES &
    /* Permissions <: PERMISSIONS & */
    Permissions <: Actions * Ressources &
    User_sessions : Users <-> Sessions &
    User_sessions~: Sessions --> Users &
    
    PA <: Permissions * Roles  & 
    UA <: Users * Roles &
    Session_roles : Sessions --> POW(Roles) &
    Assigned_users : Roles --> POW(Users) & 
    !role.(role:Roles => Assigned_users(role) = UA~[{role}]) &
    Assigned_permissions : Roles --> POW(Permissions) & 
    !(role).(role:Roles => Assigned_permissions(role) = PA~[{role}]) 
    
    
    
INITIALISATION 
    
    Users := {} ||
    Roles := {} ||
    Sessions := {} ||
    Actions := ACTIONS ||
    Ressources := RESSOURCES ||
    Permissions := ACTIONS*RESSOURCES ||
    PA := {} ||
    UA := {} ||
    User_sessions := {} ||
    Session_roles := {} ||
    Assigned_users := {} ||
    Assigned_permissions := {} 
    
    
OPERATIONS
    /*
    * AddUser (user) : 
    * Ajoute un sujet user dans l'ensemble des sujets 
    * et l'ajoute dans l'association user_sessions
    */
    AddUser (user) =  
    PRE 
        user:USERS & user/:Users 
    THEN 
        Users := Users \/ {user} 
    END;
    

  
    /*
    * DeleteUser (user)
    * Supprime un sujet
    *
    */
    
    DeleteUser (user) =
    PRE
        user : USERS & user : Users
    THEN
        Sessions := Sessions - User_sessions[{user}] 
        ||
        User_sessions := {user} <<| User_sessions 
        ||
        Session_roles := User_sessions[{user}] <<| Session_roles
        ||
        Assigned_users := %role.(role:Roles & role : dom(Assigned_users)|Assigned_users(role)-{user})
        ||
        UA := {user}<<|UA
        ||
        Users := Users - {user}
    END;    
    
    
    
    /*
    * AddRole (role) :
    * Ajoute un nouveau role ssi role n'est pas dans Roles
    *
    */
    
    AddRole (role) =
    PRE
        role : ROLES & role/:Roles
    THEN
        Roles := Roles \/ {role} 
        ||
        Assigned_users := Assigned_users \/ {role|->{}} 
        ||
        Assigned_permissions  := Assigned_permissions \/ {role |-> {}}
    END;
    
    DeleteRole (role) =
    PRE
        role : ROLES & role: Roles
    THEN
        User_sessions := User_sessions |>> {sess | sess : dom(Session_roles) & role : Session_roles(sess)}
        ||
        Session_roles := {sess | sess : dom(Session_roles) & role : Session_roles(sess)} <<| Session_roles
        ||
        Sessions := Sessions - {sess|sess:dom(Session_roles) & role:Session_roles(sess)}
        ||
        UA := UA |>> {role}
        ||
        Assigned_users := {role} <<| Assigned_users
        ||
        PA := PA |>> {role}
        ||
        Assigned_permissions := {role} <<| Assigned_permissions
        ||
        Roles := Roles - {role}
      END;    
    /*
    * AssignUser (user,role) :
    * Assigne un rôle à un sujet
    * Met à jour de UA et de Assigned_users
    */

    AssignUser ( user , role) =
    PRE
        user : USERS & user : Users & role : ROLES & role : Roles & user|->role/:UA
    THEN
        UA := UA \/ {user|->role}
        ||
        Assigned_users := {role} <<| Assigned_users \/ {role|->(Assigned_users(role)\/{user})}
    END;
    
    
    /*
    * DeassignUser (user,role) :
    * Enlève un rôle d'un sujet
    * Met à jour UA et Assigned_users
    * Supprime également les sessions en rapport avec le sujet user possédant parmi ses rôles actif role
    */
    DeassignUser (user , role) =   
    PRE
        user : USERS & user : Users & role : ROLES & role : Roles  & user |-> role :UA
    THEN
    User_sessions := User_sessions |>> {sess | sess: dom(Session_roles) & role : Session_roles(sess) & user=User_sessions~(sess)}
        ||
   Sessions := Sessions - {sess|sess:dom(Session_roles) & role:Session_roles(sess) & user=User_sessions~(sess)}
        ||
   Session_roles := {sess|sess:dom(Session_roles) & role:Session_roles(sess) & user=User_sessions~(sess)} <<| Session_roles
        ||
        UA := UA - {user|->role} 
        ||
    Assigned_users := {role} <<| Assigned_users \/ {role|->(Assigned_users(role) - {user})}
    
    END;
    
    /*
    * GrantPermission(ress,action,role)
    * Permet à un rôle role d'effectuer l'action action sur la ressource ress
    *
    */

    GrantPermission (ress,action,role) =
    PRE
        ress: RESSOURCES & action : ACTIONS & role : ROLES & role : Roles & action|->ress : Permissions & action|->ress|->role /: PA
    THEN
        PA := PA \/ {action|->ress|->role}
        ||
        Assigned_permissions := {role} <<| Assigned_permissions\/ {role|->(Assigned_permissions(role)\/{action|->ress})}
    END  ;      
    
    
    /*
    * RevokePermission(action,ress,role)
    * révoque la permission
    *
    */

    RevokePermission (action,ress,role) =
    PRE
        action : ACTIONS & ress : RESSOURCES & role : ROLES & role : Roles & action|->ress : Permissions & action|->ress|->role : PA
    THEN
        PA := PA - {action|->ress|->role}
        ||
  /*      Assigned_permissions := {role} <<| Assigned_permissions \/ {role|->(Assigned_permissions(role) - {action|->ress})}
  */
  Assigned_permissions(role):=Assigned_permissions(role) -{action|->ress}
    END;    

    
    /******************************
    * Supporting functions 
    * Core RBAC
    *
    *
    ******************************/
    
    /*
    * CreateSession(user,sess)
    * 
    *
    */
    CreateSession(user,sess) =
    PRE
        user : USERS & user : Users & sess : SESSIONS & sess/: Sessions
    THEN
        Sessions := Sessions \/ {sess}
        ||
        User_sessions := User_sessions \/ {user|->sess}
        ||
        Session_roles := Session_roles \/ {sess|->{}}
	
    END;
    
    /*
    * DeleteSession (sess,user) :
    * Supprime sess associée à l'utilisateur user de l'ensemble User_Sessions et de l'ensemble Session
    * Supprime également sess de la relation Session_roles
    */
    DeleteSession (sess,user) = 
    PRE
        user:USERS & user:Users & sess:SESSIONS & (user|-> sess) : User_sessions
    THEN
        User_sessions := User_sessions - {user|-> sess} 
        ||
        Sessions := Sessions - {sess}   
        ||
        Session_roles := {sess} <<| Session_roles
    END;
    
    /* AddActiveRole(user,sess,role)
    *
    *
    *
    */
    
    AddActiveRole(userc,sessc,rolec) =
    PRE
        userc : USERS & userc : Users & sessc : SESSIONS &
        sessc : Sessions & rolec : ROLES & rolec : Roles &
        (userc|-> sessc) : User_sessions & rolec /: Session_roles(sessc) & userc|->rolec : UA
        
    THEN
        Session_roles := {sessc} <<| Session_roles \/ {sessc|->(Session_roles(sessc) \/ {rolec})}
        
    END;
    
    
    /*
    * DropActiveRole(user,sess,role)
    *
    *
    *
    */

    DropActiveRole(user,sess,role) =
    PRE
        user : USERS & user : Users & sess: SESSIONS & sess : Sessions & role : ROLES & role : Roles & (user|-> sess) : User_sessions & {role} : Session_roles[{sess}]
    THEN
        Session_roles := {sess}<<| Session_roles \/ {sess|->(Session_roles(sess)-{role})}
    END;
    
    
    access <-- CheckAccess (sess,action,ress) =
    PRE
         sess : SESSIONS & sess : Sessions & action : ACTIONS & action : Actions  & ress : RESSOURCES &  ress : Ressources 
    THEN
     access := bool(#role.(role:Roles & role:Session_roles(sess) & (action|-> ress)|->role : PA ))
    END
        
END 
