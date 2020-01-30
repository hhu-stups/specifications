/* Hierarchical
 * Author: HuynhLACL
 * Creation date: 28/01/2014
 */
MACHINE
    Hierarchical_temp
    
EXTENDS 
    Core

DEFINITIONS  
  SET_PREF_DEFAULT_SETSIZE == 4;
/*   PRE_RH(USERS1,SESSIONS1,ROLES4)   */
  PRE_RH(u,s,r) == (u : USERS)  & u : Users &
       s : SESSIONS & s :Sessions &
       r : ROLES & r : Roles &
       s : User_sessions[{u}] &
       r /: Session_roles(s) &
       #role_.(role_:Roles & (role_ |-> r : closure1(RH) or role_ = r) & u |-> role_ : UA)

VARIABLES
    RH
    
INVARIANT
    RH <: Roles * Roles

INITIALISATION 
    RH := {}
    
OPERATIONS 
    AddInheritance (rasc,rdesc) =
    PRE
        rasc : ROLES  &  rdesc : ROLES & rdesc : Roles & rasc : Roles & rasc |-> rdesc /: RH & rdesc |-> rasc /: closure1(RH) 
        & rasc /= rdesc
    THEN
        RH := RH \/ {rasc |-> rdesc}
    END;
    
        
    DeleteInheritance (rasc,rdesc) =
    PRE
        rasc : ROLES  &  rdesc : ROLES & rdesc : Roles & rasc : Roles & rasc |-> rdesc : RH
    THEN
        RH := RH - {rasc |-> rdesc}
    END;
    
    AddDescendant (rasc, rdesc) =
    PRE
        rasc : ROLES & rdesc : ROLES & rasc : Roles & rdesc /: Roles 
    THEN
        AddRole(rdesc)
        ||
        RH := RH \/ {rasc |-> rdesc}
    END;
    
    AddAscendant (rasc, rdesc) =
    PRE
        rasc : ROLES & rdesc : ROLES & rdesc : Roles & rasc /: Roles 
    THEN
        AddRole(rasc)
        ||
        RH := RH \/ {rasc |-> rdesc}
    END
    
    ;
    
    /*
    * AddActiveRoleRH
    * Semblable à la version précédente de AddActiveRole sauf au niveau des préconditions qui prennent en compte la relation de hiérarchie de rôle RH 
    */
    
    AddActiveRoleRH (user,sess,role) =
    PRE
       user : USERS &
       user : Users &
       sess : SESSIONS &
       sess :Sessions &
       role : ROLES &
       role : Roles &
       sess : User_sessions[{user}] &
       role /: Session_roles(sess) &
       #role_.(role_:Roles & (role_ |-> role : closure1(RH) or role_ = role) & user |-> role_ : UA)

    THEN
    AddActiveRole(user,sess,role)
    END
   

END
