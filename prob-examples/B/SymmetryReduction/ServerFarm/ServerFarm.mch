MACHINE ServerFarm
SETS
 USERS;
 SERVER
DEFINITIONS scope_USERS == 8; scope_SERVER == 8; SET_PREF_MAX_OPERATIONS == 101
/* for 8,8: */
/* Nauty 3.48 seconds, 46 nodes, 1351 transitions */
/* hash: 0.77 seconds, 46 nodes, 1351 transitions */
/* for 9,9 : */
/* with Nauty: 21.04 seconds; 56 nodes ,1981 transitions */
/* hash: 1.16 seconds; 56 nodes, 1981 transitions */

/* for 12,12: 1.79 seconds with hash on 3.06GhZ MacBookPro */
VARIABLES active, serving
INVARIANT
  active <: SERVER & serving: active >+> USERS
INITIALISATION active,serving := {},{}
OPERATIONS
  ConnectServer(s) = PRE s:SERVER & s/: active THEN
    active := active \/ {s}
  END;
  DisconnectServer(s) = PRE s:SERVER & s:active THEN
    active := active - {s} || serving := {s} <<| serving
  END;
   
  s <-- UserRequest(u) =  PRE u:USERS THEN
    IF u:ran(serving) THEN
       s := serving~(u)
    ELSE
       ANY us WHERE us:SERVER & us : active & us /: dom(serving) THEN
          s:= us || serving(us) := u
       END
    END
  END;

  UserTimeout(u) = PRE u:USERS & u:ran(serving) THEN
     serving := serving |>> {u}
  END
END

