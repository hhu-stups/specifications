MACHINE BecomeSuchThat_tmp
DEFINITIONS
 SET_PREF_MAX_OPERATIONS == 16;
 SET_PREF_MAXINT == 15
VARIABLES tmp
INITIALISATION tmp:=0
INVARIANT

(tmp : 0..10)

OPERATIONS

Op= BEGIN
           tmp : (tmp :NAT)
    END;
 r <-- Get_tmp = BEGIN r:= tmp END
END

